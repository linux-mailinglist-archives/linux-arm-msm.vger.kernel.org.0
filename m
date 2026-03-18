Return-Path: <linux-arm-msm+bounces-98383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPSRA4p3ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:59:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D1A2B9910
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46E4C308B432
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374103A9DB5;
	Wed, 18 Mar 2026 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1owF/Nf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWsZqHhT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05F63B52E7
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827826; cv=none; b=UP7T2l2MyAtTEBJCx9m5R8+HpCbGcVNaKkRs9c8+RCI5n6FjQt3Q0uIcDztTEcM+tEDRIK5C2CkA3bb+3fbXGRpErzEzHP8E2kOOfZ2se7r0R+ilaaFDIK4LZMSYcG7D2ao8KSrofVu3JT2AHuoI085WGIINmyyOLpnbnCNFU9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827826; c=relaxed/simple;
	bh=OL4oKchoFswnzx2QRr0fz2Z7AnQokBGnhRRCJefe/z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rkx3UUZ9EhtkLWedvwcMtD4ldkrANe4Pcrx3Xm9xT9KghhWma3Uj7s+PL6MW/uRcm+51JcMX9p1KjZrrayY4Le50Tx919e8DPLyUdZN/gP2rYtffiWBnZR1+GGOLTGEu1bPMEaGyBMYv96FK8RjpWuzWFVXSJ+eNCIIdSU63QhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1owF/Nf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWsZqHhT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I7xqrK1049603
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8hNx37GX3aKHJ23EGUcbBUoJYjcGIqnf+W6oBgnb+mM=; b=B1owF/NfFrOQGcaU
	uBeAZAj7hNzTUfrRQs3b8tGn7rAU2+EzptVY/zvY1eXiQiEUkNf85T3cJqaysQBd
	cBWZLFOdvAkrMC1g1P+M4JI4Qs5nx+MlO4VAFaYyeUY4nWNTo3UutmGrxWuvrtxs
	m+LWYSDjq2g8V2XwHWdRhpuvXGCZ7GIMOqV97pYdiNt7rczNF5lsEILliyaVMmLC
	JbdKwehqbE011+0W3AKtMNyfQi36folBf98fuG5so0ZrtcD5kqhRIWzNeHiDzLj6
	uLwiHoX6GNHADxELEL67PlvXiC7POfCs8FpzYZo6ENMZSnupmjJ+LuuNnTStujoy
	FTtPTQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ehy8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:56:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c49436edeso27817366d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773827818; x=1774432618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8hNx37GX3aKHJ23EGUcbBUoJYjcGIqnf+W6oBgnb+mM=;
        b=NWsZqHhTz0n9p7zqRlIiSHyDtrREwmCRPtfWWKYYHsAFLyaapo4TDFzWSVOJ4jJYl8
         8nbHenHE5IkBadSruVuQgpI8i3FLans192aAGwyPxkJMmIgiEJZiXib5u88+nB+8hYmd
         GEkgAOdz9Zu55lF0ytEkVT+WUzAKVhzkO1SKYFLpFqC0iOCAdchhFoAgXh/3i4lCUxim
         Hoy1rhpwrenIOXRmoeH1Yk17o4orISATFCMD5zuvskwN7NWs19mlkkbgcGaA3t1RtXs9
         MLb7JrvvwRdorsICkGZOzQOO84dlGPi/hzfH7x3yaYf46D8/kvZJUTtbG411xUAzLohh
         YgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773827818; x=1774432618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8hNx37GX3aKHJ23EGUcbBUoJYjcGIqnf+W6oBgnb+mM=;
        b=qAHCwx/HlbgT7/e9tskpdhlplS63WXbn6gleNptFe7/ahoRnmaoIThUCiK8Sh7MNZ4
         zFMW0pQw7sw/B1LvPePTpxpnuQq8+9hSITSDWLYAZcUKC+bUoE63AYW+D5wvM3deP++u
         ULf305xLTNayc4e5dTcFlXlEjIlneWHnd3QaTagQFP4Sgb3RQg44pLqKYf0cExZIaqjq
         8SVgMye1ZyhAc56APlWwcLqcovqE0NDtFd2dxAMNLe08mnsQNiP07+MJFBRTUq5kaocS
         HKzvzyrkg7cKbR6/DLJmQQ+yZdh2dc7eHSF74SwkCLJQ/Ou/XvDNhrERty6fNOj1FFaS
         ZFlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo+MKOeVmng7Frcfr55V/AvKSxlO42y4WZ3JpIp+2wdRYrRgkNw5FklqISco/jZQjdw9W4rZCwxulhrVwX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz1k4jaw99qhM3lNzkXSkmw5HQ5HItJMProu+ZCl9ABEatYtfM
	TQT8ZI06Iu9uY7kGd7IkFIaRkKk6DGUQwcMv/NfAS1hSl6dbISTsxU4Iq14QyiIYCA4TfPjn2nn
	iT00gAUocD/6pF0ZTcOipeZ9r7vtgTm0+lnmBovKQUT88cJO9QL5CgmTHD5or8TygiCWZ
X-Gm-Gg: ATEYQzycu4DUmTIqIZ9Q9ZuyXseC34jlshIdbb9DaImf2Xdw0gqYzjAA+G2cPh+v3VT
	yljBq+j5cuMRWMNj9ZfZkXEmtMyQIrBFNWwA5MB4v9HWirK54JsItjYhrnJIE74jP35coWspwy0
	SxRhG0Xz265wVs/MiAYI+a9hdumsNudeIWYu8m/XkfNRuJr7L9SNtlPp+nwiHfKNYcRKIgoUgQh
	9wmDi2ycW5iJOqADSPgmayqsUuJcDhJYi4zceHscg60uNJjudp/e7VaOexk3FcLj81OkKXL7jkE
	xwnQt14u+Ij9vwVKM3H7sN9sc5fupKAjdNhvLVUNxKU3m1Z+X9GqPfAC9/m0qV0lI6awgOu+VMG
	xMV5x844zqJndzdL7IMuUoDzhRCwOS6yzBss8+cPgxdnP82jQNL5KjYVI4v/Ylz64lKMYeHmw0W
	4YVUg=
X-Received: by 2002:a05:6214:411a:b0:89c:51d0:20df with SMTP id 6a1803df08f44-89c6b5bfd2cmr29596836d6.3.1773827818240;
        Wed, 18 Mar 2026 02:56:58 -0700 (PDT)
X-Received: by 2002:a05:6214:411a:b0:89c:51d0:20df with SMTP id 6a1803df08f44-89c6b5bfd2cmr29596726d6.3.1773827817763;
        Wed, 18 Mar 2026 02:56:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f16868b5sm172231766b.30.2026.03.18.02.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 02:56:57 -0700 (PDT)
Message-ID: <98230025-ed6e-4d89-b36c-316886179087@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 10:56:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: add ADSP GPR
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
 <20260306-milos-fastrpc-gpr-v1-2-893eb98869ce@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-milos-fastrpc-gpr-v1-2-893eb98869ce@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69ba76eb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=CgmkN4CY_FeYCb7YkRkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4NCBTYWx0ZWRfXy2XRxWEcBJtQ
 EFgs2L3JYiLfLEJtnxbDOU8BVbmjU+Zur5NY+Z+jk3DZlckQ4Nvds0faPYjBSElhwr5djlgzYHZ
 /+yG51dQ8w2KwieKaZKgaP01xplwgjk1kdPaG11+HKQnNiJpIBb8zM9ogQo0DMMFouyXxEw/njE
 ymt1TJ915NN8zmSHmFWQgBSUkLNf9D+3DbM08ZgToMUsDLt0WgJuLBDqc19GcrM7wM0tLzf5aT2
 rl4pYGOtasXjejKAvVaewosfdDSGdnUEnpYnoIYNAa1tBd4MNkopOcXV+jQBdOV9qAkHPoGI4qp
 ZXSLexO7J3a4IxO0sPUs95D1Krf6hOjgUWN/ozmUA4ul09h4wtjvndBiMu7mMZ5kSYS3FMMbAxV
 YedOAbNuV4CqFQnjpE1HSjE7Sl/1htOLLh2FT51jSUdg2g8OnLMINZn5z7A2OGTrWVs4/6X0evF
 ZAjgjtDc9sbMqlg9UAQ==
X-Proofpoint-GUID: UFkUzNs8r0BGSvbOsfR0JTkDgnv3FFon
X-Proofpoint-ORIG-GUID: UFkUzNs8r0BGSvbOsfR0JTkDgnv3FFon
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,fairphone.com:email,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98383-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0D1A2B9910
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/6/26 3:01 PM, Luca Weiss wrote:
> Add the ADSP Generic Packet Router (GPR) device node as part of audio
> subsystem in Qualcomm Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

To the best of my ability:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

