Return-Path: <linux-arm-msm+bounces-119204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RqsRFORdV2rvKQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:16:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 432AF75CD70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:16:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jIrI82CM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Uw9vIfu6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119204-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119204-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6204C300869B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3949C3E51EF;
	Wed, 15 Jul 2026 10:14:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4986435A8D
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:14:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110490; cv=none; b=g1a2ruHzTD6RPZZKJjr3OloweGqLYHtC7b/3UGLfgjdYjmLeXQWDOfqczv9/SEDkXlFXRbZI4bP1QXbIzuoX9Hz4KSdadQgaA/C0dS22vwOUOXnW0PX2Rg0dEk/N6cAuEqvNaHpHLa1Kl8chLBuYOj8krAaGGOQ3A+vRWDxun5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110490; c=relaxed/simple;
	bh=CM3oNOpky1GVxEH2HvS+J0A5rz6HVQ8GhVyWtzPpkbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qbf4BfCdO6MsgFL+Azvl5AjO63m3IHqANnQWmuhE2i+eF24U1Hf4oXFjmUKqc9AuKkXHTAYDHhtEqYUICmjWygXNVtiS/L+iDCVKTHO3hncBF+t20afnpm4HbUmBuSyEychmtYgOHJAnPrtD5DPxHKyhpOO3d1kO+Zltu5Y8ym4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jIrI82CM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uw9vIfu6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9ttXL2621004
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bbsF2fQdcTbf2JLDFo/HuAan6yEZDXshNeH69qyTtwo=; b=jIrI82CMMSUcdBh7
	QylbR64MXYXPY/oV5vBCbZWqC6yB9JXjzSMZDm/7INQIl2qS2gJ/IWIbefnFrWgq
	FKcoi8AwINh1drydAjp2+azYxWeKtZZT5osN+8xtJM12TXjAi3Pj0Nw3JHX1t+jZ
	2q5azBOwPcH1RZWt2+lzPB7Dy1BvNYLfcSXqwigehNvzuFTYrI25x/FpJZ/sHORS
	iZj5DCQ6gehKgAvMWshYtfYH62Dih/Tpt1ser/9Gn2oNPAj9eo4iNfhq/EwDjczI
	EdXnXTrt0i+vUqZFJT32alj/pQmdgIzlTcxQFVZ62aE5FVI0DPy8EVXJ1z/+ilxk
	N6JTNQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vhrnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:14:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ead919557cso15482996d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784110487; x=1784715287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbsF2fQdcTbf2JLDFo/HuAan6yEZDXshNeH69qyTtwo=;
        b=Uw9vIfu6p6uo/Ne3savcVze8Moahtule5EV+45BIQH3UxIBNAgHhNT2Vu0SlE9udcS
         7pC9B+gZ/NiAhT9VdAD4X5+SFyLF6NNtinBa3PYoX8Bg+pVR7WrUEj4Zplrk7sLxnCsP
         pDj7F/OKcP00wxylPuwunlue7105ySE/+8OMtx7QsmihOcfy4YBGH5qkkt3oQJ2niGrF
         K0YoImS/oYG2ryth3S0dr/3/2vWi4Ms2viWTFNCXzP7dTlOviBPyl0mRk6i0dximBApn
         qzLB7DH0ZCEZkWDkdoI3/M8/zGKmSK4Op24YRHqp2P5+jEiEhKMEXzoW3yBNyzJT1Cfa
         kyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110487; x=1784715287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbsF2fQdcTbf2JLDFo/HuAan6yEZDXshNeH69qyTtwo=;
        b=CMsv5qq2cBopgg3cgGS4l6oIDViJhMUqfF1FTBvfDZuh9wyhEk+1ss6UMDPioeEGNH
         EWX3zwcWSb6OFbSf+eFUpFAF8FuwqEJm18jrzH1A8N2z9K9dbeFYQTVpucFC2usazJn5
         Ygks6XsMqZipatzR681nPDoXNXO3umCiwwXdSGhCO6BtfTL+aAAItIou37LF25SpE7Va
         /keap2Z7K/ymKqnxQwD1nVRYXRjF7Ht6ZqpdNrdJtrFqcfEEwb/aI3RTqXyeVju0Axm6
         I3TDdbZR5wdQgfluIBQOIdNZE7wf9akTBodVYCZrMfSIzkX9J10nlo3PxbibTYbVR5Q3
         CrUA==
X-Forwarded-Encrypted: i=1; AHgh+RpWZP7tVSbOWZ/Mrid8Bf7ZRY/u2L3E9Mj8/Zb/2eJF4wSoOUaW4ZWhXPIcPPgZAweTX9oYJQsBZcOV4eXS@vger.kernel.org
X-Gm-Message-State: AOJu0YwWVl8jG6Zw+Rsa7mvPeFA7FHTikPvM2hCMaFwvsx/3jl97RPGV
	65VOfrSCSS/CFA6D4/V7eNygOU8VLtOP6SUgyq8NrzDBILsfDloOo6MRHDtAekvFPgdTWl2WNUj
	L8tF5zgUVXsoe1n6rgyWIuS3cxmavPPjKyDe92zD1+zdk7lIJvtBZ11HjeWFW9Gx1Ss2V
X-Gm-Gg: AfdE7ckAmvld8E9Mj7Xs5XPf3FRwp1a5sNpP4cgWgQsCwZ1p16QGXsxVO64Sd0YDVbp
	iDHw4Tl7ql13eQ0gF9Gg6eS0SuP1Ro42jJJl9QAgN5YuO6ZzGb9qUM29ob7G6zUmw0Ks8w9Tu/Y
	i/4vBcoEahEbDy4NR1SyljwXQvFHI8l7+bRI7J9yByfqRPO0OrxOij+xNcPGBid1gk//qrBbRvs
	QiXAn0GYgG+ir0eVHZfEffnn5yaLq7gKDczBu0VF7vpx5XHk130PtVJsRUSRDCyzi8CrcQXoXKM
	YUkdH+OMElGGykuxIG7NbsMeuOFMdh+ia6CDpf0/326onFSejhSSj4mbRMz7uGkGtzuzeiBNUJP
	tKKIh2n54qfqsPlVmL9T13jD/2+FzXA2Jlus=
X-Received: by 2002:a05:6214:4518:b0:8d7:4d34:5da7 with SMTP id 6a1803df08f44-90402b68904mr156551126d6.7.1784110486685;
        Wed, 15 Jul 2026 03:14:46 -0700 (PDT)
X-Received: by 2002:a05:6214:4518:b0:8d7:4d34:5da7 with SMTP id 6a1803df08f44-90402b68904mr156550816d6.7.1784110486129;
        Wed, 15 Jul 2026 03:14:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e12ccd067sm867509a12.21.2026.07.15.03.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:14:45 -0700 (PDT)
Message-ID: <c7b576b5-57cb-49fd-a09d-8d1ffdc2d0bf@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:14:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
 <20260706141346.4180348-5-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706141346.4180348-5-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a575d97 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=II8e66OH0A0ETUdyiIsA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: qoBLcy66Gm_U7a82jqQjylRRNaugNBWX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5OSBTYWx0ZWRfXyXbmTgBb6G6/
 A78WqALXGe+jvEgYtJe2rnWM73fVuF+EI/m59LpGl7LSTP7oAAaQPl5ze9TIyBg5qWe1+iH5oEq
 aXbFh0sghZswViZgzOKhtwRVqDnP/rPj8hjAcy44ltJ2q8GdSqUBFlGns8SZ5+cqv5Nk4Uqq+sS
 kJuPbMBtm3S61+ObgusJV+qbCqnuiWGSGr8C6XKxVWj6uaoU6wiu7w8QSbJuI+P2jXXRrc1Il1o
 lKI/fT9fvtyRV6ER+KSFreOBcL6cYb6j9Tt0zz0UvY53Q/nVPZJR3XJ90xM4gHEAHTob0dwtR4C
 6HtdXCPCowInY7eXrpwyMscDw9r6y6gxWDTUvUsJB+cPc8s30XBm1z7W2gY53Y7LvRI0tPjfNHb
 rbYpeO3AOFZ5200kkI1JukNQ+8OO2/Gx4UMCt1w7LOKdfzojga1l73qdYCStFGTzpIZXWJ2I8UZ
 /zdGbSC12MIfoS4kwOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5OSBTYWx0ZWRfX5ol9/mrGYPzB
 XpoI7TDe3SJ9gWtp+4UZN3z5dnhapFVNlHvqa2uX7nVEhTECUgCMx+aeiZ65WJrQmCuYSKQZqI9
 C4N6FYmJQjVl99sdEXZz9PfsBxEwp/c=
X-Proofpoint-GUID: qoBLcy66Gm_U7a82jqQjylRRNaugNBWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119204-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:sachin.rathore@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 432AF75CD70

On 7/6/26 4:13 PM, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
> regulators and gpio-based card detection for the platform.
> 
> Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index c98dfb3941fa..48407e47aaca 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts

glymur-crd.dts is the Glymur CRD strictly. glymur-crd.dts*i* is also
included for Mahua CRD. Does the SD Card slot exist on both?

Konrad

