Return-Path: <linux-arm-msm+bounces-118597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P2evByziU2p7fwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 20:51:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92470745AAB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 20:51:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TRR8HmmJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S4Wa+n0J;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118597-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118597-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF33E3002B1B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 18:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAB93AA1BB;
	Sun, 12 Jul 2026 18:51:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF31036B07C
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 18:51:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783882281; cv=none; b=DpfbOeEJqn9wmTvsgExozIiUdnsufo8h/xVnPnleCW48pXZLdrAJqJoMJFmcVpNdC5sty2gDPVgfCh44oU7b3wQRW01cetDBBNjc5tpdKQ+TxqENk2rDUjbrCyibpofo6xB+XyyZGk6g+hnBfTlKUzoIpqlbSpcyw7Ons0ygeXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783882281; c=relaxed/simple;
	bh=fqMeKX5Lr1tWQ9MtsuG08kE7YPPQReX9ZnFUruAArGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QcNzz6e+hGOOgtBYn0ECTnsUiLMO60+jXFiFkjVfTxiP6MnqMpZEgH9JGVnkzCtFVrrbfg2xyOKGKgc4hjsRx1B36dqQ7+0bkMt9aDZKXuQggVAc2ZxRfzbWuXfPGiZk1fYz8qE0Eo5JGmXfm9AUrfclEzeZ7bLjVCCvyeu+EkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRR8HmmJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4Wa+n0J; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CGrLuk2963340
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 18:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6ybGwtJxVoLsGbIz4zDAwjLE
	aQt50o/EbJNH6JOGvd4=; b=TRR8HmmJX+i/jSBB8G4/ReM24LTc4ysv9nXZ+pQA
	GAnavZiebdVBerzCbALUcG5Rm9p7X16IZOtuUxl8HfIynTyq6p8SwFcNXSDEdrhq
	syu/JMin2pWL8atekGFp150cGACaEBoGQb6X1MJT9FxIp/t3H50LHz0i+XMqYvlV
	byRbHDD1gWllwqU0j5CQrJ3l5teUNt4NSJZAkYiadUtquCHMQ/IlkYk5mfUkpst5
	MoWOU+BNDqiIn3qOwVjE7Ig6VyRyAe2DxSWBncEZk4xP5K1dDa/Y3HnTsqXnjyYV
	BZtKP0ynBjFV46WjGPsCxFzlFhyvY1K3Ti9vRRXzWdKCTA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9kcvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 18:51:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ea75996387so62462786d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783882274; x=1784487074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ybGwtJxVoLsGbIz4zDAwjLEaQt50o/EbJNH6JOGvd4=;
        b=S4Wa+n0JLvcjAWxMEyqJdUg8wtNcqrEMURlvVBDGiQqf1Dr6UbsgWnfEjudWnsKgMA
         wm/N43dG9V72HMcIBB7TpRHi7hVKAuWuAIAgOjjEoVyam0tSoGDTMAMsSveMrOsTTzde
         O45DtPaFtWOdpGkiVaOVj0YOKFu+CcHKVO5oBG+JTTDU8EMURID4z6NhtCz5VMVZ0GvM
         HdymmR3E2drm1dqT2dSMxypT6CgK3v2j4bDf/hD1dv2sjPU4nQB4h3JKxoF5nFAI6/mh
         9hNjbM+JWz2CCafHsrr+wnciY9tLHH59F2Njr3oCTA3L+86rYm1dsbFjEg6wKbESRKIC
         RnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783882274; x=1784487074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ybGwtJxVoLsGbIz4zDAwjLEaQt50o/EbJNH6JOGvd4=;
        b=WWJ4YW9fZEoo4sEq/ck/+iB6tQNDJPESuHA4bYBKtsNXviRtgl+DEnapFqf1pEDkVF
         JnQYGGAsJGWIJBxGRO8AwNf4h46at7t0tBuBANr1mz/BJ0TqnWYHvSR1NAQ5ZFHCUmAh
         SJsi1tQH0kT1qNAcYVDqsv306zpEoKSwqV3HNLIab9XebIoOyQ9CVvwN/HF92JUGThPN
         U/Le6GFYN2/8PyE1yFXTKnGXZ6aMLeiOtSmoqRFhvS8yHX4YLWWrAJQRwhPwaTdflYZK
         MB+unUzU6FZPr/KStc1SItzq/AOVb2s7YdfWg/ByLvRv2gg3y8RXNgJ35pqeghxnv+mZ
         3oUw==
X-Forwarded-Encrypted: i=1; AHgh+RqBWiAIRxotug9L2RFSUEhmIaz6T4xqnrdIH7ROo0raUMvfD7y8i2OKcvPhFxlwOTmcj71rR/oDWYi0DhTH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx99KxZg+8OdfSMkd7aAgnr5Ys77rcloFJ6u1T5mUWQwpHWphDs
	uqQb3tCCCtD6PysYIu1ZnbLtYe7FFqzuXKyzPW4tL1C7hLHMjILw1W7TDlEJLUZoROwNCYj/ewq
	/FrQkBhk6RWN12D6sQhys9tTl/MS1VLynq6R6xkwZOpl94kctBqqE7bWVGTpcvlUyoJYj
X-Gm-Gg: AfdE7cnkCKIkqJmxXWu9fVq2so4fubGHgomlUJKDFuAIJgZLBG0TCaStgqXRwEyPfVL
	CbaW7nFvXAUCPJdANVQADqvbV7Vjcxhg2kguIhxqOVUYO9HjaPCTxdjg79U0uRfCQQWsskMSjek
	t7XmAFF1ffGONCRALTTpbEO9nABAyAS7wi2y/Lh0QBwIXdbFYMJl4VqXx/b8gF4k7Hq2h/PGygP
	Er2Fq2wvWXe8MwJSasVst3ZQSW2wDl2naOq2+SZXE+VqqR0xm7xiZsfJfQCfeY8V3hI93lj85Ag
	dVmDz1XHus4mVxg9+9zpH2NvFaVl/L4Y0+PK+QkdGqyvO7+j0cXjK2hzqTUbXdxrAFvBBoVezx6
	l54C7AjoW/vZY7kEoWiVUXtV9UsnBz3bHJx8to0tT5QgueZ7rzIJPT+vlPX0kRbCiZm3uYDOSdg
	7tJgFOG+OqFwIYXzrsyDbZv+GB
X-Received: by 2002:ad4:5c64:0:b0:8db:dd:4d85 with SMTP id 6a1803df08f44-903ffc6200amr71608386d6.26.1783882273874;
        Sun, 12 Jul 2026 11:51:13 -0700 (PDT)
X-Received: by 2002:ad4:5c64:0:b0:8db:dd:4d85 with SMTP id 6a1803df08f44-903ffc6200amr71608106d6.26.1783882273348;
        Sun, 12 Jul 2026 11:51:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caaf468sm2232344e87.68.2026.07.12.11.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:51:10 -0700 (PDT)
Date: Sun, 12 Jul 2026 21:51:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH RESEND v5 13/25] drm/msm/dp: replace power_on with
 active_stream_cnt for dp_display
Message-ID: <mys3u23vp6oi46djrj7lgp2bpmdlzaa6trmcmcprk7ws26ffx2@jzxkindvhuu7>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-13-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-mst-v5-13-2ed6aee1867a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDIwMiBTYWx0ZWRfX0mYUsDkjj08Q
 eOVRhXjaD+42pYqtr1iBjAwtYmztBJ6KBy+rWrBwRkR4JLwDQzA5PIQ3pGuBXnF2cJRPR1RESmJ
 jd/weZnPB2FTVtbUUZaLqd76VaKNscA=
X-Proofpoint-GUID: JcPX3VBBBPYbdnZJTgctFPJSB9k8-FA3
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a53e226 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=h03MF1EKYocQkuxwdUYA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDIwMiBTYWx0ZWRfXxmx1aSlcAM5O
 tBE/Wo0WI7jb3uTm7GVVUN4TupOZvYKlkjAx0A2j/HH+HeGuhP5gHEyLf6vbFUs1cgB2biHdpwL
 kf6E9QoEYFa51VBubEx/wbjxseGAfA6aFkNyCoC+zdCk2/ptLD7zR8VeuBo9Kd5CtGIGbUj4LZE
 nSMnz3Dam+L/3+xTv/Rrj2/ifItoXWDYUM7NM0Spi8tjlk9Z5Tsp1vN0sjDR3HD0oG+OtL3d4TU
 vQUJCn7VsuJIIuLRlOgg8ndb1n3xy+wOzrQdMrzrneDX5XlGTHZKvqHTnL124KhGM8Z8MTiQXxL
 GY3s6oY2PDm8Piv0kG8BaHRiiT6rAJhNCoqV5ADzw6/FSS2EEflPpYb2TWltpCki7DLBb7muO9Y
 R5x5gr047vfEbFC1TG0RDeK5ku853JKRmfoYi1ZMFYGFBAiiWHQAVVqtnPPkSi7XYjRios1usve
 FWPZ/4TW2ZKMx0R+GkQ==
X-Proofpoint-ORIG-GUID: JcPX3VBBBPYbdnZJTgctFPJSB9k8-FA3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120202
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118597-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim,jzxkindvhuu7:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92470745AAB

On Mon, Jun 29, 2026 at 10:14:34PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> For DP MST, the link clock and power domain resources stay on until
> both streams have been disabled OR we receive hotplug. Introduce an
> active_stream_cnt to track the number of active streams and necessary
> state handling. Replace the power_on variable with active_stream_cnt
> as power_on boolean works only for a single stream.

Last two phrases are redundat. Drop the "Introduce..." one.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++++-----------
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>  3 files changed, 19 insertions(+), 13 deletions(-)
> 
> @@ -670,14 +670,10 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
>  	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>  
>  	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
> -	if (msm_dp_display->power_on) {
> -		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
> -		return 0;
> -	}
>  
>  	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_display->mst_active);
> -	if (!rc)
> -		msm_dp_display->power_on = true;
> +
> +	msm_dp_display->active_stream_cnt++;

Current power_on prevents from calling msm_dp_ctrl_on_stream() several
times. How is it prevented after the change?

>  
>  	return rc;
>  }
> @@ -726,14 +722,14 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
>  {
>  	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>  
> -	if (!msm_dp_display->power_on)
> +	if (!msm_dp_display->active_stream_cnt)
>  		return 0;
>  
>  	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
>  
>  	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
>  
> -	msm_dp_display->power_on = false;
> +	msm_dp_display->active_stream_cnt--;
>  
>  	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
>  	return 0;
> @@ -850,10 +846,10 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
>  	 * if we are reading registers we need the link clocks to be on
>  	 * however till DP cable is connected this will not happen as we
>  	 * do not know the resolution to power up with. Hence check the
> -	 * power_on status before dumping DP registers to avoid crash due
> +	 * active_stream_cnt status before dumping DP registers to avoid crash due
>  	 * to unclocked access
>  	 */
> -	if (!dp->power_on)
> +	if (!dp->active_stream_cnt)
>  		return;
>  
>  	msm_disp_snapshot_add_block(disp_state, msm_dp_display->ahb_len,
> @@ -1535,6 +1531,11 @@ void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> +	if (!msm_dp_display->active_stream_cnt) {
> +		drm_dbg_dp(dp->drm_dev, "no active streams\n");
> +		return;
> +	}

If you get here, there was at least one active stream, wasn't it?

> +
>  	msm_dp_ctrl_push_vcpf(dp->ctrl, msm_dp_panel);
>  	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl);
>  	msm_dp_ctrl_mst_send_act(dp->ctrl, msm_dp_panel);
> @@ -1555,6 +1556,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> +	if (msm_dp_display->active_stream_cnt) {
> +		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
> +		return;

Why?

General comment. You are not just replacing power_on with
active_stream_cnt. You are also introducing sequence changes, but it is
not covered in the cover letter. It's not clear, why those changes are
legitimage or why they are required.

> +	}
> +
>  	/* dongle is still connected but sinks are disconnected */
>  	if (dp->link->sink_count == 0)
>  		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 55ffa22bb233..75dc40261723 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -18,7 +18,7 @@ struct msm_dp {
>  	struct drm_bridge *next_bridge;
>  	struct drm_bridge *bridge;
>  	bool audio_enabled;
> -	bool power_on;
> +	u32 active_stream_cnt;
>  	bool mst_active;
>  	unsigned int connector_type;
>  	bool is_edp;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

