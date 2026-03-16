Return-Path: <linux-arm-msm+bounces-97910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FU8G6rgt2mcWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:51:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1862E2983E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 167A53040A8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B533A29E116;
	Mon, 16 Mar 2026 10:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i70Ufjs1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a5RenbWe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539AC38E5D1
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773657952; cv=none; b=coJZL2qtcNs9dNCzTUis8Xg3mn+/GDq+Ul+rfTDbdZhyk3K4nuqcuupxiYYILAMjVapvPkafMazl/Hs0MLvxlnvfQ5hFv7H6rP4Z6P8+YP9MXG/nKjoWk7Fn32zB8qPt+CMUketBYHehScE+LXb0lm8d1hC5X3AsX0F2Mf653UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773657952; c=relaxed/simple;
	bh=TWnwoP+0EcakMiovpZp9RViE9gU5PDyhfdbZuzXwnhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gPwakXCLTL3Rmnl/+O95H6v8YeC7QTnYgFdUvgHH25adnjAo+4Y75ymql/BNSYQdeD4m79VYbV3ObduYcLhDe2uJad/gRs9pjja+reaGE5OKL3Oy5VidAOuSFZ6E++rotq2MtaY049MRlFJwTEqjOBpn/X7dUcjkP9+j0VVe9NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i70Ufjs1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a5RenbWe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G6581W745781
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XaA26AW2Fhfmnge/gG67ooXuLzhgqHYCXuLsoFc9UBU=; b=i70Ufjs1WJCxO2xF
	uoc70GEtu0hW/zNPH3VqeFEUpTcjSjB0+kISiRVyu9CGxBG2rXWA0uqFhdOCjUwt
	eaYpfpkfGbdrJbyr0hEW2yPHyigCm5UzMBqnzqeTN0z9OblBrxEGtVBi947FrZeX
	KCzt75KIBiplKpdNvtwndeqLFUNXK6//i4ZzOJm2cCVwN5MB3Q6BA3kl9aGtQAkb
	iEX+1vQlgZ+UEoZjqfwldIw/zFex9Zfj5V2QEK3/IqkgbFQbKLf4+naQCeBlxm+m
	nCbhBwkVmyICqdH5jul/wMCbAfr81h2Yrm0D/+xmKNrPZTGKRtDkCFDzdGOxTDEN
	MbAY4g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00bdcfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:45:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a5b38affdso33388276d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773657950; x=1774262750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XaA26AW2Fhfmnge/gG67ooXuLzhgqHYCXuLsoFc9UBU=;
        b=a5RenbWeSjdjjkB3d0YRKxcPLSVdMjuENG5hJoc5n8B7BnL46PBrbCbZAbbTsGx3Sd
         ceXsWEEHZmf0PBcISrAzUKLel9JhvnAi0Nuyqt+IYKMDF2+4wP+jjNcOX3kM6ioizKEa
         kiLLCNhAF5qB2pPexIuorCMUDAMUkpsEzHkuM0ZDSzhqVlPv9gYtPJKl9W1OMyNzOHJF
         IONG49NPGWuH6GhhJu2rlk+L8h0aeteH/LNe1T+K3uvNXZyo8TuqV7ziJPG55OokIVYK
         rgOerSPShS+hyb0Rijgbd7z1hE5kzlX0S3CR4NgQ/bFxX22wl30F2EEzLcjDNAubMY+I
         +NqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773657950; x=1774262750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XaA26AW2Fhfmnge/gG67ooXuLzhgqHYCXuLsoFc9UBU=;
        b=JmXoLE+tBpq0C+lTczXR1+Cpbp928P+IzDTO7tqHHDdl9OzKO2IdPcz1fYUFv4ktn0
         NmB09TlOHU+h0bZVeOO8mPouhmiwkPwH5eu0jSGCChrezVBWI2PMiqJqhO/TXpuniBjM
         e1R0fcUMeiHb2D3DoXc5fHuKGshtEIyb8MyGEBKyW31IAqsKqM5lBLrzu6S93fGVBqeM
         3nIKuEGYZRBGVcTfjmJmLqA2Bx8BlgRIIAwzXWnY8SR3vzrjYgit5FVWoaXpIOUbzyiv
         L2TYLXmdYtRLRkjX//euBAcUqjcIj5jbuqz3FWuFEuq5Cvl2t2+BuDFxrfaVwu7/RUMR
         k+jQ==
X-Gm-Message-State: AOJu0YzZ5Uvd5DA0pqJkSB7BwThw3xIOa4N2aOPzbotEBaypNRQQ7kZj
	wXmMw8HCzv8shY722xjNhR2CDeOjxGUgq9vM32K6EEGMm92BvsI0QAu6pK2Clkh0CxbPeeAkSay
	yzNDK9YzZUKLZY2mVg2xG1mwGM7m3IzCHdRwMimk/sS27fWgnTbpSO1vgTTq9csaQfs6F
X-Gm-Gg: ATEYQzxtpVL5bnwAcoG1WxO4/Uo7Yzc8vUEp2kNEqICjSSY09+0x/ErRy6N/eHow4F+
	MMy6DnsfD1+DCRoEAS0G6geQp+4lh6zpKdmeD5hL1561r+9LWvUIIw6Uc0M2Nl7I2x6wxhJIQDe
	kF5r4MrMjUhzG2ElJsPF16+VPEWK6jl6Jndi3Y7wphkXktEv942j7S5HHKi1cTltwbLoXq8B7LL
	7LIhtmXUnvxwJ5t3DuPErODNRR1G+0X68lsQrXN1jl8PTBLrMarhoVdklbOkNEsIHBa0ciXVWLq
	bxHSYArGxZRAIoWWWwXD27RZqbKE4DrHA55TzpY1vCpvOmE3C+IGcDfXLozWxVd/cyRRiDxNMF1
	XCq6e3sV1hsBYb0HplIBlIxxDN7zZ9pa2kv0EgUGyZU24Ixn/57pjiU07LxFIHvwmMbNaneGBhB
	5VykY=
X-Received: by 2002:a05:6214:4784:b0:89a:4741:2147 with SMTP id 6a1803df08f44-89a820eb598mr118325756d6.8.1773657949737;
        Mon, 16 Mar 2026 03:45:49 -0700 (PDT)
X-Received: by 2002:a05:6214:4784:b0:89a:4741:2147 with SMTP id 6a1803df08f44-89a820eb598mr118325546d6.8.1773657949302;
        Mon, 16 Mar 2026 03:45:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b978eb9d5c4sm432595666b.48.2026.03.16.03.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:45:48 -0700 (PDT)
Message-ID: <fe0a9c18-67e4-4f74-852d-fc1c8a26bb4b@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:45:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-4-ca9d0efd62aa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-4-ca9d0efd62aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IsATsb/g c=1 sm=1 tr=0 ts=69b7df5e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6SiODLxq02sLjzxsB7oA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MiBTYWx0ZWRfX+bFplFzw+Gb8
 2b2Za8GXef8Q8kH+sEVgFX8KcWPepiLjgQ3yP/eXMhQnO+j7kYTRQzCMTbTJLiVD0DhP/tWQblk
 cYhakW/qr7TX410c50kUEtXZL3w7Ryg75NL4lveHXX1i/PWQ9gn2xOku51tI34tO554ftGOJ83f
 COuf2f5ZoRGfSdiSI2rCgrInvPKRwEcxLUrNmg9ts7OxMzppTdz1efa+TNqI9qRudP6TWIAXna+
 3PHi3UZjbRaK5i+QIEt3/bdRiRoMDDyr+kqYw4i4VoWYHG/+l/vmT13Nd4WyN+g/+lzFzbF6eOZ
 T0L5HzwU89yWxfAAYcK5AgM2jE4Rz3TbpBy5flIMGFJwZr/KtcnGpfI3mj5BJ9jtoSnTknaaM3q
 PX0CnIOl2c51CbiCHFMQnUMXVbyztUjqhAex7s0kKN++zzhxnfU67gJGXDMStCC3W00O0ahcT7J
 +2Is/m53Y1xHN9fi1ew==
X-Proofpoint-GUID: uET5XC90Bnn4qtlktiXDK8z3hR_aFUJg
X-Proofpoint-ORIG-GUID: uET5XC90Bnn4qtlktiXDK8z3hR_aFUJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97910-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1862E2983E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 11:29 AM, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
> temperature sensors, access to EC internal state changes and suspend
> entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

