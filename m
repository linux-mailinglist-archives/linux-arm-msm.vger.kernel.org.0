Return-Path: <linux-arm-msm+bounces-109674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMzaILZXFGr+MgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 16:07:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD1F5CB8E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 16:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20922300E01A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A39386C2A;
	Mon, 25 May 2026 14:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzIF6j+f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dcls81yL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763C638642A
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 14:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779717690; cv=none; b=U0Oa5Np9WGjwGJi196S3lB+YMQ99dOO4VSd8u7wuTuhLE66YzQVlx+3h4F56gCt3ruQWLiehKv3od9tYyWfg8nsqye8ybtPel4lpSbg5FdensIy1PG6hLrWcKB0IOKK+y4BDn1YxSy3Yls+2RK2176cp5kwzCVQFj75PZt20mKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779717690; c=relaxed/simple;
	bh=CZ9ggal6AI7begzqTI1xpoxUIDI833iw6KAnlGJ6Jrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aRfG//RNX0W34UnSa3HKwvCdWdhxFgw2Dt1mGp2penXSxBc0E5LVIezeyvZKSU1EEcHWvYYzP1nRyqyikMlNVeYK8mkroh7e0IFwfS+1I+Jim67PVN24dFePvc4M3HJ+Pfd9svpka83t49okOe6jtNggmLX9knCL0Eg0UnB9vo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzIF6j+f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dcls81yL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PBPgdd3263677
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 14:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I2xKLuvKpwz4CkrOfZZNnqoT3wHdH6+BVmL+VYCKYHE=; b=BzIF6j+f4mTI1yWw
	yusZQozgl4tSzZCkEjyjDMa8p+mUl//MLb7Y7C+w6/pUqLQ5j3tQIpenqyexm6FJ
	7vTbLxhZXfB/2mm47a26Fb3dB51OmqTdxjdyvMBuEdP7MFTBTy6vGqsqnEdoBxN+
	pGDvQWHgCG68ZOJ5s09SRc1gbNlyeeUViUdp+0VLV2KlccGVVTjU4W5Q2zbrXhPp
	ID59Ln87lnmMXddSrx8Pi+uztgaMObS7STymzLSDBSfhJ7Fz+tZOz4PvA+0Gu3GS
	wcuvuHc28WuaOSndLp7AaKMCzgO3PXDFfbfcfz9tzsU+/PvlqozTHCy8cIePdQUD
	RegVzg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs0han-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 14:01:28 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e5fb37ac4bso1136046a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779717688; x=1780322488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I2xKLuvKpwz4CkrOfZZNnqoT3wHdH6+BVmL+VYCKYHE=;
        b=dcls81yL+BfcqtysRQUNnrAIMjekUj87EBb1t9lB5iV2f9RaEmH0SkW53qcTVgz46g
         1G/38tmcCEsiwMU2KvtLbYgDAlmSLimV/p+Z11wVoJmdd+i06+buTaxHlbRgwlgXT5jq
         Ds0U86A1X3qc1GelHGkPsVSVppMcCB/fayx4B8kf1ANvlWvh+vGh7gJXxgyiMi92lifO
         N1sNTj5Oio9UH0U2BefaG4hom2vVguZJs/QBU/ejVj1CMoXk2Vh52IVl3q9IOyG0HQ//
         IAtNJei0rB+2RWvobP9hdCrRVgSGlgAbTuRkEMV6vMb5z9aqyUUaTOimzRRpd1VqGSUN
         Cqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779717688; x=1780322488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2xKLuvKpwz4CkrOfZZNnqoT3wHdH6+BVmL+VYCKYHE=;
        b=Umq4ayocrlYTyg3i+HAZrMKfQEwVvstSXV87NXhfP7QTek/w3BHSOy4POBupkSmDld
         VKpTAEu9Xr4P7Tpv0H1dirtS2cUwR1Iw07D4t+wlH/yjxFY//UiZJJidwvoIodtZ5J2e
         qNy3rHE8g3IeUitFQMyM9ZXBLFd0HNZPizeKHPtaWYK8md4HEp1YnoDYY4CSC9t605uR
         0ZKylLA11y9z2Vv8kU85buZrFh0xfxi5zxUPyS77T/PEGmTpenlffwuo2a+DTbe8MNZ4
         EfYjuKn3CkFzvawfPDCqrXdSinIpiRFv8vY6B9ArqSmgDy4AUuF9lbvTgL9ZF7B5zn9I
         +fLA==
X-Gm-Message-State: AOJu0YwvzKmbv3mJ2nPUhWnwloFzXCEHCAnLPTD7pB3rmHZ+I9PLnJSY
	IvgTZAXxmNFBLIMswhqhooM5hC2EdiVT3IDNwodfCUOiNiygblsPU56KyXX/JynY3U3msyWtnM1
	xYLaqYHKqzytdeTlbp3i4B08CeaAEl0ScaWCfAIePX/1AnVplap4VqJupnnkd4B3Ns8qI
X-Gm-Gg: Acq92OF8wfEOFq0+FQuD2GLgbYfRBbOCoojIC5aB+gLQDksH+M1ab7wUSjI9nXHWZsl
	3496bsntv16eIGcu45T1qFPfRD+AeEBAut6/p6YsCJ2DB8KgjWJu7Mczv2b+85U6WHA1koI9L+u
	TmyhAo5P506NpCHhJ5sJrXx66Q+qAapCOoCjgIBtcsWTqhaPffgqKw4ZkcGchqiQ/OX7QLnmo5D
	pq77n4LGn4lyOQpT+IaRWI+cbyDNub+Wd00McT/K6R10j+cSnGuLNJKGSTcPeh4RyoGdlbgIcfV
	jZq+q9zIM17aq6Hs4pRuMX+EAdWiOGAepoSyqyxVaJtbiVpqIsTzkQPDJGOeMg0E1c2KJj6wJyS
	LOG0dkS/zU17uN9ToUiFF5t5o3IgVIjQTXOzyncv+8uMchA==
X-Received: by 2002:a05:6830:6f90:b0:7dc:d66f:9ac7 with SMTP id 46e09a7af769-7e5feeed784mr5562909a34.6.1779717687554;
        Mon, 25 May 2026 07:01:27 -0700 (PDT)
X-Received: by 2002:a05:6830:6f90:b0:7dc:d66f:9ac7 with SMTP id 46e09a7af769-7e5feeed784mr5562883a34.6.1779717687150;
        Mon, 25 May 2026 07:01:27 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688baf1e1fdsm4069015a12.19.2026.05.25.07.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 07:01:26 -0700 (PDT)
Message-ID: <79fff2b4-d8c1-4225-a75a-f9c2dc6a85e4@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:01:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/10] drm/msm/dp: turn link_ready into plugged
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
References: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
 <20260524-hpd-refactor-v6-9-cf3ab488dd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260524-hpd-refactor-v6-9-cf3ab488dd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a145638 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=j2DAZ_cRoNPVBr-R0xcA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: Se4DrgZLXsKJ0LvE6bgO25jclbYO-f1S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDE0MyBTYWx0ZWRfX2KFdoum58pYN
 XMlwq6lWYew6gj0fYc3S+Ol8JMx3zUXxPumFhrYm4Wp6bmakT1zQ8Ql0njnwaTbVkaSipGBgLNE
 awzFAi5BSHuBTFLrWiZCI5Mttt7M3bmO4f9TVEvXVYlEWlDb10fgIchQEXxQ8jBMSprXbMsIFPn
 kIydwzlzpraa3lwMscOo+1CN6z0a+e2Lw8uzroUgiqX8DhdP81xrCATz4T+fK3LDSd7QN0lNp3h
 ZphvicH4OtevlP2YZRRJHXr6j5XcKb+oG2neXAunVRlduZywmALna59VV2fmJhgjbN6jWJZYd8C
 oOOp8TS82nPGFE9t9tUpYeUSWdKx8EPmqNV8IasmOwxjSTtRdam0PzHzSOcBzEcARKhtpY6NcBJ
 KPMc9Oru1ZQ5PSqx1hfQVVDqM4U9QN2RyzctfDqUhGgwFb4k2DLw41YaKljnuHVUmaRbWbJw9NA
 KnRexExtitnoid5dBVg==
X-Proofpoint-ORIG-GUID: Se4DrgZLXsKJ0LvE6bgO25jclbYO-f1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250143
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109674-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,packett.cool:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2AD1F5CB8E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/24/26 12:33 PM, Dmitry Baryshkov wrote:
> Tracking when the DP link is ready isn't that useful from the driver
> point of view. It doesn't provide a direct information if the device
> should be suspended, etc. Replace it with the 'plugged' boolean, which
> is set when the driver knows that there is DPRX plugged.
> 
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Tested-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com> # Hamoa IOT EVK, QCS8300 Ride
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> -static void msm_dp_display_host_phy_init(struct msm_dp_display_private *dp)
> +/**
> + * msm_dp_display_host_phy_init() - start up DP PHY
> + * @dp: main display data structure
> + *
> + * Prepare DP PHY for the AUX transactions to succeed.
> + *
> + * Returns: true if this call has initliazed the PHY and false if the PHY has
> + * already been setup beforehand.

This assumes no failure. I hope adding various return-value checks across
this driver is somewhere on the todolist..

[...]

>  end:
> -	pm_runtime_put_sync(&dp->pdev->dev);
> +	/*
> +	 * If we detected the DPRX, leave the controller on so that it doesn't
> +	 * loose the state.

"lose"

That is done.. presumably so that one could correct a coredump or similar?

Konrad

