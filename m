Return-Path: <linux-arm-msm+bounces-109672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHJ6NN5TFGpsMgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:51:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4325CB5D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD0363006455
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D66F35F19A;
	Mon, 25 May 2026 13:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXKkg+Z8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rb+l6C0O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D65830C17E
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779717083; cv=none; b=A3Ec5buglylpyN8AzGAaqrEZ7R6bYBdOfqkDt/K+SlKRY1ecdYOS66MTA00BsgQ4DT0Iy6SVbXz5wQIR1gB/5YSZqkPe0rxgyuSAtlTJOoMgucZDDbzuCx9AnD+rSjK2VvTyh16+xsc+e5YzfpNiDBFC+zw9wByheFs1IzJPA50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779717083; c=relaxed/simple;
	bh=1atNRZetigH77dUmSfj77y90koJh4R5EhDL7mGqCL3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s2P7Pu1rN0/7r+AzT5GuXDx/ogjrz0MndxDIarX9uIHEKQ1Rs7sDKJrS5sAPSggG1PO/u/VvPrHPnnLmW3bK8LJvqUMzDOEzl4lDAr96e4+NxGMElwFiYocob2I+PPxWw8SE/T42nXcoBAgAak+lU1uDnhNKp/z2rwI4j98oiwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXKkg+Z8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rb+l6C0O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PA4rd62146351
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TBi8TFsiSGuDtHvREBnTkWTPDNdkV9Tw5zfg0QAYJ4k=; b=KXKkg+Z8vBcXBtsX
	KHmRyL7KyAWVnoCkVIiaxygnDIS93yFjFtE40PlQ+2Rq0g5uhDGkICqiRmV6iqCy
	jjuZHOdcm73BRHvw47aYpFvAI+x5bp9eqmPGqzUFLQUPXtt++yFlUH9dtadOhORl
	CZxU13Vy8fhIlNCDEzKH18UL1g+rVO1I21XXLIK3gizce2f65pr5CWotJWKJVE3C
	AcBtMjQqWniX5FCWD9oCnovX8fSRlvhOdkMlHr1odPzM0QijIUEPUHJLppdZFYPq
	x91Z7MQBj6qAO3jcKubJPyLJlkh2++/yT9P/GXubr0BUg/lusw9kjH72v4++E7nH
	ZA14gA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv0r3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:51:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914aa01cc21so69959385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779717080; x=1780321880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TBi8TFsiSGuDtHvREBnTkWTPDNdkV9Tw5zfg0QAYJ4k=;
        b=Rb+l6C0OMZIvZdmS7SWv0rFp9Mf1gdATa3PNiMJHy3UXPEQkBvQXatjtedbdthfP+x
         Pth+8q4YjdFes1vj2f0qZ0YXRL9FHI1O4ckRkx+iOa9ytTRiNAkBxq28s0Gz975ZnTzT
         FcoJsCLK6g1pJiEjwTu7PDJb8Y1GwCU5hOjKeS2IGVkAxfa3993ZhI3BLECODD618732
         yaHC1pdAdp2dr1v/rX/D5GbvbkrMnYqMSV+CMVt6RjWQS3lw2F9rfQ3HVovyBxwVj8aP
         x1d6XPv3CkRQMX5tLph9yLaC63LiGTDxJEqi47qMQL7yz5LL5mG4WeZhX5Hv9cOYpXyM
         X9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779717080; x=1780321880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBi8TFsiSGuDtHvREBnTkWTPDNdkV9Tw5zfg0QAYJ4k=;
        b=bHHtMWCzdvf2mvvBlkPd3PSdGRwmmLuwV3P+DEkQrBBH50YD5YQNQXYmUdAvcRoKfn
         BbCzBYuwHdRVb0T2KFnhrK4gnqzAaHd3mwoi4XrSsqxrwFj2/eBt2s+4VIj5+W7u0orD
         LM75SJtHNJ7OZFDL1ZRn8INfUsm0qvZkkff5qhTImmlwlH2lA4WuFclgI+e0Aa+w0Ey6
         bLQ2XRfKle0iSOnb32MDSqsg6asRbydKASVqT1+0O/PcoshX2NM4Y6kXosL9MC4vHVhs
         DH4JDSA4xE23iXri4o7Qbtq6+bZ3Iw/mYcnZqC1nQeCSLbl6nUz+rPv7PndMgABtrSNQ
         1fQg==
X-Gm-Message-State: AOJu0YzaKyzWy0qPvLwYUrSOOf7JdjkSlko7bajMOjF1jWg+DlUfZjt4
	rMLC0go3riXAMdE2BhsoqynPbUSf4bDSEvsMmNloxV/u1wrc6GoHlPUJQR8vQbMtECKCcS011PD
	fLfWdUrx8bTxt2YmPCgCIbbpTEKCklKPkt8uR5dH03KZsTYY7PoEI1k9LEZnUFCiOr/Eo
X-Gm-Gg: Acq92OHHHvUtwH1CJbVI1QNWzGgOBNdZBsSypLec1oQ0HYnZEwUgsxOyjzntLkQ8Gl2
	aeJeNtEA4zpZCxZKx1/c5XWOHxzK3IMlmIwVmDefnZvtHolB8oP5x9pLR1btPmY7JcmGeIqxpLo
	n2IuDH5Bolof44Z0ViI3nH1n/4V3MGB7BiBC2737gEymmvDl0XmIa5OQoYqM71S65Rr982eKPb0
	4/B53XJdA/UYJpR5/Q8qc/OeemfSxDe5xuYV/9+uWPFEwF8keDGW8qu9H2hztosTh9/hWRvy53t
	tfiXgi9E+Uzrv1u5FwpvuBPL405VjemKVDTVVOyiMilJbBUz1ceWAnM4dqJZrYlSzkxuGDvPvKN
	NsJ3lrb0WFrTTQLhPL0LnWdjSPVNWVM9t/1vqjsDeI9y6tg==
X-Received: by 2002:a05:620a:462a:b0:910:79db:c946 with SMTP id af79cd13be357-914b49a1bf3mr1379219385a.5.1779717080497;
        Mon, 25 May 2026 06:51:20 -0700 (PDT)
X-Received: by 2002:a05:620a:462a:b0:910:79db:c946 with SMTP id af79cd13be357-914b49a1bf3mr1379215985a.5.1779717080090;
        Mon, 25 May 2026 06:51:20 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688baf2ec1dsm3984677a12.21.2026.05.25.06.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:51:19 -0700 (PDT)
Message-ID: <0c6ace6f-26e3-4a15-a467-1715480b1115@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:51:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/10] drm/msm/dp: rework HPD handling
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
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
References: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
 <20260524-hpd-refactor-v6-7-cf3ab488dd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260524-hpd-refactor-v6-7-cf3ab488dd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDE0MiBTYWx0ZWRfX2B5ezy38Hz+p
 n1dcE4RfNypRnIlevexMd+ulDsw7GtQooE5aHZsKkSeRSawFUBhxNofPAx/XwsG/WrSGGDIKwMr
 m1L5lUHzWWsgZj/RbdNE3zVLlHeuNcX5StYtvb3ThOLoiM3u+sZuLHVcIECcW7dx6bOu5MkSg0/
 QwE+kyeY6vkJKILhlDwvcr7r760HsmQS3E2FFiguMCS5vBGZGUQpAYl3/KhuRUHF8gebjxBSV+N
 +UZrr9QgQHJFU6ZbRpsDWBHXqKEuac2YIKalWILWghdwplJCtO/uqkKk8jOHGFj4FixdXzUeRcs
 R7gbqvskUJyKKXLqWWEB/6aGxiZnAHImSROGmThXfWMX9AiynKeWbxsmnOMOse/3BROfmN++gbY
 hMDfLgCuZazgfjSzV0dPx12KfwI48YFOwGI54sGCFTc4InKOO5fIu/7FJtfrTjyqb7y40nq3xnZ
 ZeEbgzlG/HmZB+KuFxQ==
X-Proofpoint-GUID: ReWnlmhjbiSJI_qPF5GRDGuJ9XPD5SZT
X-Proofpoint-ORIG-GUID: ReWnlmhjbiSJI_qPF5GRDGuJ9XPD5SZT
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a1453d9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=V3MyGVYEbErwUeSx0MIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250142
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109672-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 7B4325CB5D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/24/26 12:33 PM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Handling of the HPD events in the MSM DP driver is plagued with lots of
> problems. It tries to work aside of the main DRM framework, handling the
> HPD signals on its own. There are two separate paths, one for the HPD
> signals coming from the DP HPD pin and another path for signals coming
> from outside (e.g. from the Type-C AltMode). It lies about the connected
> state, returning the link established state instead. It is not easy to
> understand or modify it. Having a separate event machine doesn't add
> extra clarity.
> 
> Drop the whole event machine. When the DP receives a HPD event, send it
> to the DRM core. Then handle the events in the hpd_notify callback,
> unifying paths for HPD signals.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Tested-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com> # Hamoa IOT EVK, QCS8300 Ride
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

This is way too complex for me to grasp at once, so I have a couple nits

[...]

> +	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
> +			dp->msm_dp_display.connector_type);

Most debug prints added in this patch have odd indent and some
have vague messages

[...]

> +	/* Send HPD as connected and distinguish it in the notifier */
> +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
> +		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
> +				      connector_status_connected);
> +
> +	ret = IRQ_HANDLED;
> +
> +	return ret;

Return directly

[...]


> +}
> +
>  static int msm_dp_display_request_irq(struct msm_dp_display_private *dp)
>  {
>  	int rc = 0;
> @@ -1247,9 +933,13 @@ static int msm_dp_display_request_irq(struct msm_dp_display_private *dp)
>  		return dp->irq;
>  	}
>  
> -	rc = devm_request_irq(&pdev->dev, dp->irq, msm_dp_display_irq_handler,
> -			      IRQF_TRIGGER_HIGH|IRQF_NO_AUTOEN,
> -			      "dp_display_isr", dp);
> +	spin_lock_init(&dp->irq_thread_lock);
> +	irq_set_status_flags(dp->irq, IRQ_NOAUTOEN);
> +	rc = devm_request_threaded_irq(&pdev->dev, dp->irq,
> +				       msm_dp_display_irq_handler,
> +				       msm_dp_display_irq_thread,
> +				       IRQ_TYPE_LEVEL_HIGH,

I think this field expects IRQF_-prefixed flags too

Konrad

