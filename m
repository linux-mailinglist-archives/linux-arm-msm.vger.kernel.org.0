Return-Path: <linux-arm-msm+bounces-103724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACuIOHX25WnjpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:48:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 908F9429090
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 70F613009898
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB26392838;
	Mon, 20 Apr 2026 09:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hj6QWsVK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fro+B+lw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D78392820
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678510; cv=none; b=NsycI0uWz6lAikNoGw5lKauEIq1H+bM4JYbs4WYwDtjed5idnoXR/TzcXVcP5gGHjhL+JxjueUKobNhLoS0zs3dwg+3LaYAvHNg4/rVDtDUwT4yKnOzN8FJg8xq7KQ1JAxS6c0b7E8zhgGcqbuXhY4be51SGsk41mBhR1tkAwn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678510; c=relaxed/simple;
	bh=Y0VZfMMDGtnkJYhGf+U9Z5MtZVR+mZz8AJlSieCPJKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FSAzom4DA7FCbvWIuQtOHImJoskyfnW0D7BWlMG/HExBrqr/ZYHmsxkZpCwWLcdqmyENcquXBUpLMjQ1gNxY8HKseVN3nmQ87pce8qcOayuEikJU6X0WQW6AwzlivktfL4evmnYmwJ510OobT7d/xzTtUmBEGl3WHD4j+vsaddA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hj6QWsVK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fro+B+lw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K77G4m1489887
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HQ8ZoOouZ4BrjvsYaJON/pwnwqOqCBNwUORSK1JbGIo=; b=Hj6QWsVKeOBMGENc
	UMoFGwqmbTMHVPx7dLpoz91xhUY7REEm6sigWQIlrafCi289JxodOTD37fDR+jk6
	/GTDDFxCHeLe0jbPvkpVV+OxVFzPoJQh4jjfVkJHuFDBaRzdd9wsL0EVW65E0XyZ
	epa2tJVxHMcEW2+uQTI6aHBSQ1Glu/5VudwfQUHWCEgqV2Wp5yCPOgR9EsAgnzlb
	VoW3adil/qfuqYjaXjnRYglP+gB2TAIKZRTjTI/Av8lRwnDmCsVaP20vu4q0yfQD
	ADU99l5zmmxSom83ltF8BAs4ySWgBrirkJSmYwwhpXaS0XqQH4gybB7fQjbro5Rb
	+VR6pQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2b75eqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:48:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50f1b94ac9dso1058631cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776678505; x=1777283305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQ8ZoOouZ4BrjvsYaJON/pwnwqOqCBNwUORSK1JbGIo=;
        b=Fro+B+lwlPtRqLoEYmwBJ9RjZxQ9xxpMEg2qFGn34dAc37oLLXkmUQvrl7gC55yiY2
         JCaCdkLXCQk2ad+BztW48iVN9CiBo+gN+HbBe1OmhTEmifr/o5oUjR3Bkj2k+fDigsjb
         JXrUxAZwlYRCfHqCaDtD2j8qIxZyMzo1mKabC+jFwezuk1RWdKs6d0XzVfpY+iIGvOH8
         Y/LOmj/Naxhp0L2hrw4JrGPO5ZIyJPjgvPMnzF2TlgTOT0kN6ykDeCyZK7vyhKFxqf7H
         SRk8HisblEHsC6cFU5AYQyWfbExi4YQMGjVX8MrAg+E7pRi3XuOq07YPpC662d5vjy2t
         miXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776678505; x=1777283305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQ8ZoOouZ4BrjvsYaJON/pwnwqOqCBNwUORSK1JbGIo=;
        b=pqmetAWQ7lzg2mHZEWbaoPK54uMuY8VrkFzshO+6hE8ERyeHPRXODvsub95vy3Am9D
         4GMxzQw0Rz+HNFhRqBSTVwQVtfiZXcmV+fqVfVvF2BWtOp3py5oBSVGQnbSV2vznKf3T
         iPc462ipuw5pOLLbgWtoB+mBtoOoV5XDL8QuvSC7EHYwrNua/UKdkRj75vqL1rb1xgcs
         8+xL2CZP9E/RPS1nX/bdTDogb+BcnMgK5s5Qv8Mmh8duFvWrNBUjXjpc3I7qFTSE68EQ
         /FAyZJKjgqjRGH7TAO6jWQvlOomzbMPXacgfenGadALLT0FqQbzJOGDjp6NLg9dAVQS6
         5ziw==
X-Gm-Message-State: AOJu0Yy+s/Dcwi9tQ6PlDHkvYGD8j8sKU5faVgUyLJ3l0ZKyEAovwjm4
	PlamLJpMuTkROz5ByY0id4PVw470IuIXltOdRaAj5Q9LXiVcXMz08xaPsQgtL1grJ1X67gteKMF
	l61VaIWvctW+6AxoCeraAQ3qkutlCvaj9Nc4/0Z6jkjym+dU8AMaWBZzgWwyi3i/8NloX
X-Gm-Gg: AeBDieujGrc5ROOEy+81Hn+bDd1Zq//CGXSqfeyCur0k90gs1t4xGTKebxNMj0UV194
	M9wEJxvIhzk/0t1b5JCEiB47U6XmZIzWwjVRcibbuVfHqJL/I9baFUE/XBUayFBypG7y3Q3O3/1
	ozk4V2HcXmUThJo/iHnmh4kUxOoUWNuKPZClHBoSi+NtAWL/6rzxuboPjEz3a6ey21iUt21dVbQ
	oWdotPLOEhmRsXaKCU1u1mufMSJZH1k2XovsRuBHpa94fRzf80MIU6oi3QXrUkOqGRQbOV3LP7r
	e6jt5zUtNrQh10/k/MaT5cAQ/td19ReFopvFXBrqMCo89uCc8P82TL/c+1myynGgr13i7IzrcIW
	JW8GDDI+0yrMOMvRHx0KeyT4s1HpeoBcVgmZye1Guk+j04tb5k0dKnBC+jkyTv14x+5Wrn6Z1tR
	fg1Io99fANDqO2EQ==
X-Received: by 2002:a05:622a:2587:b0:50e:a1ab:67e6 with SMTP id d75a77b69052e-50ea1ab6a40mr9032031cf.4.1776678504863;
        Mon, 20 Apr 2026 02:48:24 -0700 (PDT)
X-Received: by 2002:a05:622a:2587:b0:50e:a1ab:67e6 with SMTP id d75a77b69052e-50ea1ab6a40mr9031811cf.4.1776678504448;
        Mon, 20 Apr 2026 02:48:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480e22asm2021642a12.9.2026.04.20.02.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 02:48:22 -0700 (PDT)
Message-ID: <221187cb-e28f-4cd2-bc7d-0f738a01770e@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:48:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: talos: Add QSPI support
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-4-7de325a29010@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-spi-nor-v3-4-7de325a29010@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZridwYD c=1 sm=1 tr=0 ts=69e5f669 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=v9HvSh1xhsShxInwDaAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5NCBTYWx0ZWRfX5B5LXC2y2Rxi
 03K41EuP6flVXRsRZskHHsNNbNFDQUbTq7hok2xLXjjoAIz/9A8ujitUjr6bBc3ar5zqhWHHgO3
 Np3nswZELmKK+tLFtDIFwfa0l05vjJVQYtsIz6zkLVu9EnakfixQtJalRCikCr4D5GeIIqErxBU
 uPt9u5L7o11oorHHtOL7Qjy1jF7G5cFosucfW4K+rPmBJOer3cOKZKt8HGdj6KqQ0l1D+FiWmqz
 7D8gJkU4HbIWBuW6/4npcEPBp9w72luQn9McYYT7bd8w1tzj2dy6nYoz3lqQjBCFZIGbGn7OC0u
 xXO7M41vY7th8SJ90MnR6EstCAlnLvIHAe6DCio2YBN1cNzcIS3KET3E1jvX6eTF1WgY40B1Ux3
 VlS9gdvoaWyRoH8tuWnnTaq+sWTCU7CkqjdV27bAuPLAFBwIXPdnQZ/863Gmifr90rjXmqx/2me
 4opmM2kzHmyW+Ht8HSA==
X-Proofpoint-GUID: lkc1HhpCuf_z9C5HD2XiNRw337ksSHRo
X-Proofpoint-ORIG-GUID: lkc1HhpCuf_z9C5HD2XiNRw337ksSHRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200094
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103724-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 908F9429090
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 8:12 AM, Viken Dadhaniya wrote:
> The Talos (QCS615) platform includes a QSPI controller used for accessing
> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
> the QSPI controller node to enable support for this hardware.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

