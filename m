Return-Path: <linux-arm-msm+bounces-99657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOHsG/ONwmnDewQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:13:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D926309186
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4752306C669
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5DA1A683E;
	Tue, 24 Mar 2026 13:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PzzQ/VjJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YoUy6k5w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A489241665
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357474; cv=none; b=CoAOY2B2n4TF13ArM89OdJjU4G/mYMZ3Qw8XfiyA9dXKtgi++xo9QY4ie2nrMr3e2DU01lmL1MaSXAEY8mkZXnYjHqRulqwcEihQSQnanq3vih4yHl079Zc8OK3i4LiBm3vaKHK+hiknbHmXkSR2sOwPRLHfxZEQ4Xiex2VntBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357474; c=relaxed/simple;
	bh=lkj4K5KneEaXfI/hABfu7CsdmDXqGAITS+gNHz4+WSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lIr4PQWeRB42Yn/Jp6cDPldGD3sCzcXG9QBhAcAOYrRdj77D2fGPHoczaUKt0ANi/rlKgT8Nh2V8eR5zEZTbay4OpWzCJtBJtb1EVU1sqm8wnComkfVJVefV2vReO7fRDhS/l6cxxE79ZQHzXQJinXcyCIqNO5Jf8sdEEDfIxxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PzzQ/VjJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YoUy6k5w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OC5mi7409496
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ih9VTv83QqyTp0YZh+OZkzFBW3xGR+7UkInLLJl+QN0=; b=PzzQ/VjJI+CsrFld
	sCQVJ2z0SrwnyWtz63sC1Gq0UQR3aIxbQsS16N5N95Ib2FQyvf6togKuGckPxVHN
	PPBGvN0WhYsJDUuTCKk8tnmdhDycrwN0FFnAYW0BvcsHzcGP1KcT1+qJg3Q5+KDM
	eWwAZBC9N5og5MZbp/1L9tR7qnwPsEHGsTwaPXCeSFutdoNLReIm9oLYaUuWnR0T
	W5N4VlJlynGkV5w2gaNgg3btE2UvX/l51wYKM+Ht9+iOBVco5ok+QJMTQ45XodOf
	oZgXPEHUfwXc2U5PCv17f0WPSmokIVySI4XPDZEDtVv1xN+2UIvkDk6fC62kMxDG
	6n6iwA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3nexsekp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:04:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b079b4a8c3so42892125ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774357472; x=1774962272; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ih9VTv83QqyTp0YZh+OZkzFBW3xGR+7UkInLLJl+QN0=;
        b=YoUy6k5whkjK+ZhxrH1XLhtCSJ4v0NNaR8+1iR3uQ5F32br5HrK4eAczKX7P+FGG+J
         SapH6uHidtcfETkR5eSP9h7Fa1VkWe7+Xl5BPW4P6x4mxKAQDWPu//38/PXsocTkJU30
         v2E86VIUq9naeY4yL8Df6kUF3MnxIaNeFItuP13Kd2EJoOsqMURV3vxewmoHAHQ1ccNu
         1tvTBdOna/TImzuBQ/vfNBThWAoSBA4RuSlhEdmOa64SPlbUQ56P9jTxUwbr4XTHEM/N
         WjZg1hGj+igStqNWALFxWQ6Fv6rBDpHWiPQMss5uFudVhxhfElTKnrUUPZHgD4fox2rF
         YP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357472; x=1774962272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ih9VTv83QqyTp0YZh+OZkzFBW3xGR+7UkInLLJl+QN0=;
        b=FGi4Co3FS+z5K4Tga7iMvGR87N+6JPsVEYYASk1CmVOIcCs/CYKmKd5aAsKDCl9OSh
         k8uGRyEnhiEfjFFAINvPkHL9YNBDh7OFTX6uuFVmblhxHkHCG2VRA30NBYBWKyIgMTvb
         liPoCIhaToet6PuHMdE3a+rZwWs67WE3R+XE62c03Xg7VfXglruo73ColcqvzhvqHREH
         jAOZMOU4+WjUQlqS8skZ+ZOnSmmX8jQ2s4RuOSaW8OVghz45MjVwhCnlASnNiYYGXAff
         ydT2TXheNqnnD+jP/ou4ub+JM6MDrjce4buMfCNmwlo9hzg/p3SedHzSRhIBbt4oOrXS
         qh9w==
X-Forwarded-Encrypted: i=1; AJvYcCWVpgTczdpjdM69iUDs7PwC4N8hc5kBbx8TIPBow24Bb5AywcSrInNLuCjnMLL4kh7NOWSqHiWqcrufJK7+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv0RtOW99tlYtQn2spxm+iyymZSYRJy/VOWEo+/Cm6mOGpcXA+
	LqisT4QWI7B9hy9/hPuBTfBRpH87m9zTrw8YUhZkGlOafryQsW0DOlcDCNt+rnV4UoFVwIDfqIe
	AG/IVwE/rpTrxRMxrmlzFQcdiBE7O/sMOZIe4CVbaxA+LPItBy2HV+nzuDUoPAaLJ7GWS
X-Gm-Gg: ATEYQzyBc4PN31ZSQasHBIoBq+bM6RBz3SMhj634d4RiudjAAiU9PJo+Nc90ax668xI
	nEZhZOFm2rocd6VA902pHnGwoWC2FPbn9sBmSSyL3O97/yjfXdp1o8Az9KB4bRE3EZzI1thtgYf
	YJr18GKe2zILdN4MQTHaJKCm7A56JBLhruNULOH5ld0kXVdpcPXMltbCJQmrCuWT50jWhuSq58d
	g+btNhd/0PNJ5jH1sidWeOuwu3UncBv1/1QrhhLayIptsJbLBVUCrB3tOjGtUtHm8tLgljz6kpp
	YcRpltyuSb0/gQPQkcJiiGf7kib/SDDtODvZv6+mEx0Su3l067pqqdgnANUCVFdyDKDe8BMSXBH
	bJZvfWNTJ4fklF5cfZktAcBlxqLD0eq8E9buBeuSqC7x0EhiptcfpfmaGawwDd9ux+QbIMfmSw0
	qA75lblrS+x6Et3bbOPA==
X-Received: by 2002:a17:903:2284:b0:2ae:ced7:4650 with SMTP id d9443c01a7336-2b082797411mr162229325ad.24.1774357472042;
        Tue, 24 Mar 2026 06:04:32 -0700 (PDT)
X-Received: by 2002:a17:903:2284:b0:2ae:ced7:4650 with SMTP id d9443c01a7336-2b082797411mr162228805ad.24.1774357471373;
        Tue, 24 Mar 2026 06:04:31 -0700 (PDT)
Received: from [10.133.33.127] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835298acsm151917955ad.22.2026.03.24.06.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:04:30 -0700 (PDT)
Message-ID: <b5b3b1b8-ed48-429c-a87f-0278a6632313@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 21:04:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 31/38] drm/msm/dp: add HPD callback for dp MST
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-31-01faacfcdedd@oss.qualcomm.com>
 <pc4brjias4ixewzlsvnlhqhlz774z4p6aq7j4kldu5ze2e35sh@tsm2mtrkk3zi>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <pc4brjias4ixewzlsvnlhqhlz774z4p6aq7j4kldu5ze2e35sh@tsm2mtrkk3zi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMyBTYWx0ZWRfX7nXsg0VOxVcO
 WSykSVSRWhE14wT/HdDNFZvj2Rvn9hZrk4vdCAjyhThkQX01TPeAWQWlZcpJQYo67Aut4jGz5FV
 B9RjzmMedHoa7dp1PQssoCHYDf5E9HEGnA2DuOaxHH67Q89kd4I78t8Dfkw76BJ2TQxbogxZZN8
 FQbNZuR9oGsTGiCiqN5OwwPowM/JXEwLW9u+idwVdrZMXJbTgI9R5QuOlQE2tHKMQ/9OHkjMc/s
 IVRWB3rT8RkD3u04v+BPfwhrE5uwN3dJArSeS9wthoNjlhDGNqFq488n6yBE7ly7d1VV9ssyLD1
 g5U1Pybv02WiBxMw2LfByCMog5EeFe5w7EnvPM27Mli4sSMYr7yr9i40qCXn3lvjwpoe0XLPPn6
 ZJXTk+l8epjSox0OmwH0XPL+6153oSQCz1ShHYaUMDsgupdR/Pe1ZbUj3hCCcAON5Wgs4caTVQD
 y4Z0qyUOI6LDMoVP4fQ==
X-Proofpoint-GUID: 1AIOI3ujWK4ljuhxFplyNiwD5QINtfoT
X-Proofpoint-ORIG-GUID: 1AIOI3ujWK4ljuhxFplyNiwD5QINtfoT
X-Authority-Analysis: v=2.4 cv=Bd/VE7t2 c=1 sm=1 tr=0 ts=69c28be0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=wlarEYM4F4ymYTEdJbgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240103
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99657-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D926309186
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/27/2025 2:40 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:16:17PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Add HPD callback for the MST module which shall be invoked from the
>> dp_display's HPD handler to perform MST specific operations in case
>> of HPD. In MST case, route the HPD messages to MST module.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++++---
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++
>>   3 files changed, 48 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index abcab3ed43b6da5ef898355cf9b7561cd9fe0404..59720e1ad4b1193e33a4fc6aad0c401eaf9cbec8 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -500,9 +500,16 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
>>   
>>   static int msm_dp_display_usbpd_attention_cb(struct device *dev)
>>   {
>> -	int rc = 0;
>> -	u32 sink_request;
>>   	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
>> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>> +	u32 sink_request;
>> +	int rc = 0;
>> +
>> +	if (msm_dp_display->mst_active) {
>> +		if (msm_dp_aux_is_link_connected(dp->aux) != ISR_DISCONNECTED)
>> +			msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
>> +		return 0;
>> +	}
>>   
>>   	/* check for any test request issued by sink */
>>   	rc = msm_dp_link_process_request(dp->link);
>> @@ -1129,8 +1136,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
>>   	if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
>>   		msm_dp_display_send_hpd_notification(dp, false);
>>   
>> -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
>> +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
>>   		msm_dp_display_send_hpd_notification(dp, true);
>> +		msm_dp_irq_hpd_handle(dp, 0);
> 
> Why is it a part of this patch?? It has nothing to do with MST.
> 
Emm ... maybe here we can directly call msm_dp_mst_display_hpd_irq..
I tried an alternative approach by calling the MST IRQ handler from 
msm_dp_bridge_hpd_notify(). I expected that when hpd_isr_status == 
DP_DP_IRQ_HPD_INT_MASK, the hpd_link_status read in 
msm_dp_bridge_hpd_notify() would be ISR_IRQ_HPD_PULSE_COUNT. That way, 
we could handle both SST and MST interrupt paths in 
msm_dp_irq_hpd_handle(). However, hpd_link_status only reports 
ISR_CONNECTED. So I had to move the MST IRQ handling into the IRQ 
thread. Do you have any suggestions on this?
>> +	}
>>   
>>   	ret = IRQ_HANDLED;
>>   
>> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>> index b4f640134af544c77ab262d2cbe0b67e1e2e1b3a..331d08854049d9c74d49aa231f3507539986099e 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>> @@ -567,6 +567,40 @@ static struct msm_dp_mst_bridge_state *msm_dp_mst_br_priv_state(struct drm_atomi
>>   	return to_msm_dp_mst_bridge_state_priv(obj_state);
>>   }
>>   
>> +/* DP MST HPD IRQ callback */
>> +void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
>> +{
>> +	int rc;
>> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
>> +	u8 ack[8] = {};
>> +	u8 esi[4];
>> +	unsigned int esi_res = DP_SINK_COUNT_ESI + 1;
>> +	bool handled;
>> +
>> +	rc = drm_dp_dpcd_read(mst->dp_aux, DP_SINK_COUNT_ESI,
>> +			      esi, 4);
>> +	if (rc != 4) {
>> +		DRM_ERROR("dpcd sink status read failed, rlen=%d\n", rc);
> 
> It's DPCD, not dpcd.
> 
Will fix it.
>> +		return;
>> +	}
>> +
>> +	drm_dbg_dp(dp_display->drm_dev, "mst irq: esi1[0x%x] esi2[0x%x] esi3[%x]\n",
>> +		   esi[1], esi[2], esi[3]);
>> +
>> +	rc = drm_dp_mst_hpd_irq_handle_event(&mst->mst_mgr, esi, ack, &handled);
>> +
>> +	/* ack the request */
>> +	if (handled) {
>> +		rc = drm_dp_dpcd_writeb(mst->dp_aux, esi_res, ack[1]);
>> +
>> +		if (rc != 1)
> 
> No empty space, drm_dp_dpcd_write_byte().
> 
Got it.
>> +			DRM_ERROR("dpcd esi_res failed. rc=%d\n", rc);
>> +
>> +		drm_dp_mst_hpd_irq_send_new_request(&mst->mst_mgr);
>> +	}
>> +	drm_dbg_dp(dp_display->drm_dev, "mst display hpd_irq handled:%d rc:%d\n", handled, rc);
>> +}
>> +
>>   /* DP MST Connector OPs */
>>   static int
>>   msm_dp_mst_connector_detect(struct drm_connector *connector,
>> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
>> index 1484fabd92ad0075eac5369aac8ca462acbd3eda..5e1b4db8aea4506b0e1cc1cc68980dd617d3f72a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
>> @@ -86,4 +86,6 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
>>   
>>   int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
>>   
>> +void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
>> +
>>   #endif /* _DP_MST_DRM_H_ */
>>
>> -- 
>> 2.34.1
>>
> 


