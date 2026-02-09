Return-Path: <linux-arm-msm+bounces-92326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLnSDjr+iWluFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 16:33:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 488A6111EEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 16:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56AE730745C0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 15:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0729337F721;
	Mon,  9 Feb 2026 15:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KIRwknVf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXaJdI4F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F2E37F100
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 15:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770650819; cv=none; b=SGAz0unNLv8UHM/nuc4NLZdLuBOllOdD3eav4Z+OG1/eyyD/Wgv+eEen5wAXXHCuxJnO9rQVPBWY0JVlJCut7CJPzoilcSUbojULWJhKvOD3ReMVS5dng8O1zFKzwUKWkYbXoIICHh1UPnu8SyIJfcs2CaUXwWoJFiKX9kTiuhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770650819; c=relaxed/simple;
	bh=ZhKPgY/ok6tI6LT0kTgE+bryaFImUWk9Msy8DHA1TvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTbJtn8z235/eAc6KAvi0KSWI9XCX3rM2c0JmNzFUm6wagJuInN1NRG7bZ8Di3pE476aOZaHaUsRfetV6AoG1y3XYVxaJPC0xc0vntYgJw4x2akSgFlSTP8GgLt14jLgs72CPczR7MqLKRQJMA8oksQiYnBbE+/XgzWP8UoNHCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KIRwknVf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXaJdI4F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619BF6CO1924447
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 15:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nrb9jUqmDkSXq+1Jp5iSrLtt
	FVewPb8+LDQpVvObx2o=; b=KIRwknVft7mLsGtswJU5lJQerpGQJRx+C++3moSd
	MUHpMCWYX8QFxRRWPnik7QHXZ0HulO312aTKAYHoKd0oqEKtdFgvq0xajlt63OJ+
	tCBx0uqTRdxbhI9DlYxw+t0qb8iC1nKulH5PNZfMv38tPkbDzC8DYIxEWGHwRDlz
	21KABv7NTSHqTYhqLRSVM346OEptq8IiJPZ4XzuQXA1Rb8unchK4Xn/u+bxgLbS3
	MlZN8/bVKVpQdlrqEW2P+s0tVy3FQiytKhvKfcuvE4F0SHGbMSQNuMFr3/2VETkz
	dIpN7g55IBFnTfCBgcmDLjlU3r96EIdVK53CzpWEU8424Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c796ksyej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 15:26:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52d3be24cso647463685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 07:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770650818; x=1771255618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nrb9jUqmDkSXq+1Jp5iSrLttFVewPb8+LDQpVvObx2o=;
        b=hXaJdI4F0mPAxRCq/pTo70K/GnD8qIv/9co9arggTIuvtYrOcVADwonKleafMsO5qV
         fKC4nkPIurtaxm5jDR++4Rb3wzRbo8Uh8iz5Ytsux2EdkHEN+u8SewVVVSC0jBtimbwM
         QL4Ab2JqiWDdhLqCWZUEmJLx/+CtCgwKRoT5apXu5FDpnYjaKCfujTxWVONGU1+PCd9t
         cBVk0ETAMKBHtRNU65UyCi1ZpUvsE//Yv+trgc3ThVbPFIHtLzJkBM5GwEvgakJMVSOU
         4Ox9Fa+EZEEvuy2XAJwVkiEKIErpnwC78j8UFQ616cYTFL1SWoisHB7DRMj3r9BiRk8v
         4LIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770650818; x=1771255618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nrb9jUqmDkSXq+1Jp5iSrLttFVewPb8+LDQpVvObx2o=;
        b=aKUnxNkd8tnWCjtrQQ1a2A1ZCQ8zr+SvhK6q1mmlWw0ZXiAUVMMqlVZmNQT2+26WQa
         0RtuWrds5+RBT9XwEoIrsqsQWTVe7tSPHBPuvLViWPl8xl6eHOfmJjriPEsXZ9K9NvsR
         t47NOi+WBVzYoTrJ66M62GdWDshX0iautbJTWX2nIgfNCeZmSGGYWZaBvm8zAZhcXHps
         tYOvcS9hQvWHL5goIBqlDkn4LGCV5wRNMg62sUPTn1ielu8njYna+Dlzhd4cr2n2s3Jg
         Bg5Cl9I+R7f0QOf6RZvfhzOA3m6FGIqPBWozXZYcxgqaQY0tpH5YSXNIvEFX9CV/hUkl
         imIA==
X-Forwarded-Encrypted: i=1; AJvYcCVTxuyHgqjN2bIY43JMNPuWMnukw6GJXd1SDoLzMHW5asahRmdABB/YWteXLXzieoliXPZyOMbQLM5vyRtw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4anlRpc/LxI3Y52/PnVQ2H1GRyo79Ga38hRVm95wkmwuttSaC
	5wXQyyyWQDZCrhxHd94a0z6Rt3iWtVrLgAc7mPIEKRMRGjpw5dckxpZYf/WCKCcnVHAfx0YW0YT
	UBetDj0UiFOcjQfh+fdhLH8t55vmW4ACbqqToNdccN4fQW/d7yqiYEL3nVC9iQ1gVTCIm
X-Gm-Gg: AZuq6aJYukcDu3/EPd0nROtt49+6RCBuXUPkbmNPKk3f8BYa0jOn2JR84j9qy6fVl68
	Y5D8nU4l0b3idg9zIXW+BFBWh8Y5rrwFPTyTCweQZdAIn3yiUIB9UWOzwESDvg7fDz3vGogRX04
	EHaJW5kn+zlXWVetUuNOwAIr2dmRP1GY5A+8VKGRhqqH01YNhL4Koo6A4qhjH+It38qTUgwSPJc
	AQj3WU2KVuheyY0JsTt8bRdD33HMEu+DhpNc/vnWCQSoKwP/OH12Z936cvoZ4cZs3HTLx3H+eLF
	nG2iMhgeX1eAA2hR7M9hTyqI9CttjKqrYpqW1K3b8id/q+NwQr4P/LtWZjlSFyUvlP7VI/kO/Xm
	j1NrOCdF6TPDTzebZwUA5mqt2nc6Kr2qvanJ1h9hC5xugOJ86+EIi9F3yxzw01zVOOah9bp6Xuc
	2SSa3usXoRZHIJ0depzfgyXcY=
X-Received: by 2002:a05:620a:372b:b0:8c5:2ce6:dae with SMTP id af79cd13be357-8caef409a31mr1527705285a.29.1770650817802;
        Mon, 09 Feb 2026 07:26:57 -0800 (PST)
X-Received: by 2002:a05:620a:372b:b0:8c5:2ce6:dae with SMTP id af79cd13be357-8caef409a31mr1527700085a.29.1770650817277;
        Mon, 09 Feb 2026 07:26:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44e21c9fsm2674085e87.77.2026.02.09.07.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:26:56 -0800 (PST)
Date: Mon, 9 Feb 2026 17:26:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc
Subject: Re: [PATCH 4/4] arm64: defconfig: Enable Agatti audio drivers
Message-ID: <ddvxacge7zkez2zjyrxz2ux7zztc67rn2gtiizhuzhl6ggnl7k@2t2amskhk65j>
References: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260209142428.214428-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209142428.214428-5-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IeyKmGqa c=1 sm=1 tr=0 ts=6989fcc2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=SW5gx9wwwNEQv_Y7kvkA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: skdmJKHOyi9bSABzfwOrG4E6hkFN2kcv
X-Proofpoint-GUID: skdmJKHOyi9bSABzfwOrG4E6hkFN2kcv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDEzMCBTYWx0ZWRfX90PoX10ZP9/R
 7ucbpm4Oga5Wft1MoW/J74BwxbHs9/1EMW5D6mdz8gwJI1eN39EhndvdmiANjM10937ADQBtFVe
 9xNPZhh80Haca9x8KQNO1Hajqap9bSuL0+0xxEX36eyhXiLgzACCohEVyzrv3p9gDROIwrbjY57
 RhttYc69lzs8Ot9/bdTbjKmh2OKVJQ5Icy5NQbMaQh+rYISBGn456mD6YcLAewEa/vVEhZOnPpf
 AZndF1lV7KgeedWs1W3xXpP8NGHzMbbPI36HGeTX2/5N38rQbYTBGH8/bLrdRMBtJSMahH8HKle
 z8ehgFfI1tzzOJjt5qjSmHAOyAvH8msQxje/z3ulfy93Sr76a1i7rdJC3tAfN2mw8SPSxSqj8yM
 p38csDH0KXPavKXricSk8KjfL7P57zR3rWrWuqtYqZsfmBamidxf1UsAxoSdGgiMmft5LRo/Yt6
 wbiQKHBUoYjKFdZi8bA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92326-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 488A6111EEF
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 02:24:28PM +0000, Srinivas Kandagatla wrote:
> Enable reset controller and pm4125 audio codec driver that are required
> to enable audio support on Qualcomm Agatti SoC based platforms.

defconfig usually is described in terms of a board rather than
platforms.

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index b67d5b1fc45b..6db35c1605a0 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1146,6 +1146,7 @@ CONFIG_SND_SOC_ES8328_I2C=m
>  CONFIG_SND_SOC_GTM601=m
>  CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
>  CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
> +CONFIG_SND_SOC_PM4125_SDW=m
>  CONFIG_SND_SOC_PCM3168A_I2C=m
>  CONFIG_SND_SOC_RK3308=m
>  CONFIG_SND_SOC_RK817=m
> @@ -1550,6 +1551,7 @@ CONFIG_SM_GPUCC_8350=m
>  CONFIG_SM_GPUCC_8450=m
>  CONFIG_SM_GPUCC_8550=m
>  CONFIG_SM_GPUCC_8650=m
> +CONFIG_SM_LPASSCC_6115=m
>  CONFIG_SM_TCSRCC_8550=y
>  CONFIG_SM_TCSRCC_8650=y
>  CONFIG_SM_TCSRCC_8750=m
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry

