Return-Path: <linux-arm-msm+bounces-102822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id exnwL6jE2mn06AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 00:01:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1AC3E1CCD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 00:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92C953011873
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 22:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E33184039;
	Sat, 11 Apr 2026 22:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gl4m2sDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R2KfjRFD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B498920D4E9
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 22:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775944870; cv=none; b=QX06IngZ9baIqqr07te8tgL1bM3DfkFMoYKQ7wuhQG6Ybsrg1TKk56134y90BNJy6jZRH4arOT/PC6B2tkylWTGWoPq083fKenGDF/QzVBOtpOkDNADa5k2RZcfj2pZFNxTvkmiq4luQ4IiUAnBJ1/yMD/cYIFv+UFLZNr4zs8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775944870; c=relaxed/simple;
	bh=vhnROLNr3NMTZpNZJH+ZpPxoodnSWZAbF02BtPbNNes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3LYHwNazvz91aFDg6S2ZPIDWJUZTbPPM1XS/8T5NhEmV5T4YLIvkbp+W7Jfccc+QpzGdHTMNdRgWChNQMCO4HU/2C6DF+4v9l73ku8obhnvgSZqRcV7qvR+Zpl/gnt4MHZXIMzJP2P7DsaRbyH+TlhXDFAo5meCMY5lNClcyhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gl4m2sDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R2KfjRFD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B4dtnu3873783
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 22:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7krwbspUA8eOw0MPOmMxuFzr
	M4c39W9ftJGUY8qhkbA=; b=gl4m2sDmcVHs5KzjIwuh35diJO0huLQWJL5fiKpD
	/Nj3HhPvq5Cx1RixGLRgoLNb74qpRwv02VhM7TAqJVUT7w+mqFikZqAKZd9YzKML
	brhIcaL0Cr0v/jx3N16k7c+8KYXmjhng6kpRvY1lmTCGYbc7iDZ3qmYd18YWPVhp
	4VQGTUypZo3Z2OAgmix7MtwHlq1mn/MCfs1cB1v8FYVNlR8DeB4b8dyX1oDtz3El
	HEFAKnMGqBAeUeLFr+3BO3cUMxdFzOXhgv34hJylJa3LZ7aP6qcxgfxvLB8EkQ8D
	hyEPsdOqyvoA/HBsFEn3420KWJW217DPQNuODrLth5fLQg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhscuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 22:01:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b6f869676so60374171cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 15:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775944867; x=1776549667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7krwbspUA8eOw0MPOmMxuFzrM4c39W9ftJGUY8qhkbA=;
        b=R2KfjRFD9JKEXu3fuobqPF2rN1IiOqHhB9IVV3Cl1G6odsqgftGgW7uVuUsNr8c1Rb
         v/i0399MAx9dwsvetYwpc23Cd07ZIPyeqjpM9uojgXdqNY5vp47d+8FlxlDpBJON0ce4
         1+zIiq9sg0frBnzkYRp2ohopD/Pq4LsTHqtyWgtM7rtQGjw6rTfszE4Qa5VQxa3n7aZb
         v+ys9VBwB7g8gLpYS1fTUr5v7MP1LcRfHK061ccVwljkc8RwNgAubx8mc9a1mUnn2OA4
         zODtNp2cNRrDgjnSCu2KpaA13ac1x7uxkye2jAAgNQYw3WcLUvZHd3hRcCgzx+22LR/3
         CcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775944867; x=1776549667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7krwbspUA8eOw0MPOmMxuFzrM4c39W9ftJGUY8qhkbA=;
        b=H9ZYoLF670M+dCZ9WNQkMRxpCMw0HhLCq9zz5ve4gT5VfslBNRWH0rJKVgYshjyWUs
         yU9p0XmTJEBJG8r63ftz80Xz/ceQt+VnUmXrPJNnIKihovpCK2y1K885H7zWiD1/dRA/
         umtnLWySgm8vLJ8AK0EAxGf3ZuDHQNuObwH3VZOlQsqf2hWDM1YHgCHBpvx6Aj/PYFDq
         hReKw8didJRm8/YYUN3IKzbOaIYZUSCXeJ4ZdNBQOtyceLrPOlVUUqxX+jXvpgeZzUeD
         dsJjZKAAzYBuJbmMM0AbDk1/Us8H1mphdSPsuenuPdkGr4y8hFhvJSN6/maHWffVovBO
         Ex3g==
X-Forwarded-Encrypted: i=1; AJvYcCWDDNaWfabu/MImHy5Nr8Gpg2H3ei0y/1hgwxHvXs+I0lKaVwK+uoa11C9SV2SpoAp+xA2/qIxXRp14r7/y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+0P/1h+y3nSjBIKWTj38OZSWbF6bfbf0KNJa2h20SYcNmxi39
	SF/9KgSfa3Qiyhd4YARpSGYDhCwMm5Q+4KSpvmMpxjT28o7aF2CwHZIYtfeknA2oCh72q4CwrzV
	DbmItV+c5SDCHekq6iTWJXYZcZSI68J3xfXALLig1EmtG4s0LR8uGcUQ6cShiCnllZcMd
X-Gm-Gg: AeBDievpJLNyRD+ZpibNuiCOMqsiZfL9SfDqYLMHVx9Uw2QSEagG+8ibU2CM48XLRoT
	H/qjnHAr9+ZCizvQ1PzteTtYMqqDFT3ACuu72UeRGwIyHxXL13yvP2qQ82onGUIg6f+Ri5hLAY3
	aq1dJuu57d/Q5tQC6XNgXcsqmtx00vGYN2k5Nu09NEmd5IVunX2Ix+CgJIUPO3iteNHyjTP9siy
	oYCU/J+SIjiJWjrqy6l1ViJ2ZOTdxNNpwf9XyjPwYX0tVjLH+dYbANLOAEkJ95biAnsj5cttlsi
	yLxLYP/lw+N2p8PakbIRcEQzCUpmle3jeP0cMJkZDaQAOSPXOG1Gsjy24TKYwk5cxq0mpIccA5W
	/ZLN4iTRlvSSwhYQrWzfkbAU9As1/2q1IgyDHMXr2ffxjhSpXL0Ilx/fEWcfHw6xeSBesVIGCOQ
	Wpy0tRLiXTwogtbp9+5j5gdzOQC8f7BGNvBQo=
X-Received: by 2002:a05:622a:408d:b0:509:25ab:f545 with SMTP id d75a77b69052e-50dd5a81499mr124838281cf.11.1775944866819;
        Sat, 11 Apr 2026 15:01:06 -0700 (PDT)
X-Received: by 2002:a05:622a:408d:b0:509:25ab:f545 with SMTP id d75a77b69052e-50dd5a81499mr124837311cf.11.1775944866220;
        Sat, 11 Apr 2026 15:01:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeefcc2asm1653410e87.70.2026.04.11.15.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 15:01:02 -0700 (PDT)
Date: Sun, 12 Apr 2026 01:00:59 +0300
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
Subject: Re: [PATCH v4 37/39] drm/msm/dp: add HPD callback for dp MST
Message-ID: <ml35zldwr6f7euzmw6noy7j5mufyhfhmwoigkwq5ykyyl3amgb@5eo63mfnd4tg>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-37-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-37-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDIwMCBTYWx0ZWRfX9I9UJkF5jbhF
 gsgCB9uc8vdn929h3F25YuciAkEEsMOo8xowtBY7/7CQCcQLrffg/apfNSKTIbFWTS2SE+xVukx
 ACZwi5Vno1NxZ8dtdV8pCp0OK8k4VFiyfy3N9J1BfdndlrQ5ROZhNfZDMDl5xnfF5xtyZsSOIJF
 /NPQM0QFylbSW86kfMndwRHifwqzySKCdTZSvPV3/fITdXyPjKDK0W3OOXUsPX2F6xFWwrN69I5
 0ATxWe8rKPikL1RDSyswpUpBdw93wLZijZ8dGDqWTb8Szzw/ke9WeqnFdudRjqjXG7AaoS+H/IA
 tGGPCoNwXw5U++QC+De3UlzjINlDIwVH6jziPbqyUHxe3cPaswM7la0Ht8fEVwIVLlw0ENjvU5L
 H1FdK+qei+IqixiiqXGKCy8uzB6kf90YSUah4mCz6IlM6xoAv+XIiOv4A42s5+m+VLbqTny7HGi
 WY7rGRYbrz2BtuJh4Cw==
X-Proofpoint-ORIG-GUID: kKSdiGquztbI1yrERnsb2VtpmxsXKUVM
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dac4a3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=xKepnNgkf2uX7vV7bD0A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kKSdiGquztbI1yrERnsb2VtpmxsXKUVM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_06,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110200
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102822-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D1AC3E1CCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:34:12PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add HPD callback for the MST module which shall be invoked from the
> dp_display's HPD handler to perform MST specific operations in case
> of HPD. In MST case, route the HPD messages to MST module.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++----
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
>  3 files changed, 54 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 919767945ba5..ca89e20b7563 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -454,6 +454,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
>  			dp->msm_dp_display.connector_type,
>  			dp->link->sink_count);
>  
> +	if (dp->plugged)
> +		return 0;
> +
>  	mutex_lock(&dp->plugged_lock);
>  
>  	ret = pm_runtime_resume_and_get(&pdev->dev);
> @@ -556,12 +559,19 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
>  {
>  	u32 sink_request;
>  	int rc = 0;
> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>  
>  	/* irq_hpd can happen at either connected or disconnected state */
>  	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d\n",
>  			dp->msm_dp_display.connector_type,
>  			dp->link->sink_count);
>  
> +	if (msm_dp_display->mst_active) {
> +		if (msm_dp_aux_is_link_connected(dp->aux) != ISR_DISCONNECTED)

Will this work for USB-C?

> +			msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
> +		return 0;
> +	}
> +
>  	/* check for any test request issued by sink */
>  	rc = msm_dp_link_process_request(dp->link);
>  	if (!rc) {
> @@ -1125,9 +1135,13 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
>  				      connector_status_connected);
>  
>  	/* Send HPD as connected and distinguish it in the notifier */
> -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
> -		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
> -				      connector_status_connected);
> +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
> +		if (dp->msm_dp_display.mst_active)
> +			msm_dp_irq_hpd_handle(dp);

No, don't touch this code. HPD notifications might be coming from the
other entities. This IRQ thread can only send the HPD notification.
There rest should be handled in the notifier.

> +		else
> +			drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
> +					      connector_status_connected);
> +	}
>  
>  	ret = IRQ_HANDLED;
>  
> @@ -1793,7 +1807,8 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>  			msm_dp_hpd_plug_handle(dp);
>  		}
>  	} else {
> -		msm_dp_hpd_unplug_handle(dp);
> +		if (hpd_link_status == ISR_DISCONNECTED)

Why?

> +			msm_dp_hpd_unplug_handle(dp);
>  	}
>  
>  	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> index bb3898b1f6b1..71d3f63973e6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -490,6 +490,40 @@ int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
>  	return rc;
>  }
>  
> +/* DP MST HPD IRQ callback */

Useless comment.

> +void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
> +{
> +	int rc;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	u8 ack[8] = {};
> +	u8 esi[4];
> +	unsigned int esi_res = DP_SINK_COUNT_ESI + 1;
> +	bool handled;
> +
> +	rc = drm_dp_dpcd_read_data(mst->dp_aux, DP_SINK_COUNT_ESI, esi, 4);
> +	if (rc < 0) {
> +		DRM_ERROR("DPCD sink status read failed, rlen=%d\n", rc);
> +		return;
> +	}
> +
> +	drm_dbg_dp(dp_display->drm_dev, "MST irq: esi1[0x%x] esi2[0x%x] esi3[%x]\n",
> +		   esi[1], esi[2], esi[3]);
> +
> +	rc = drm_dp_mst_hpd_irq_handle_event(&mst->mst_mgr, esi, ack, &handled);
> +
> +	/* ack the request */
> +	if (handled) {
> +		rc = drm_dp_dpcd_write_byte(mst->dp_aux, esi_res, ack[1]);
> +		if (rc < 0) {
> +			DRM_ERROR("DPCD esi_res failed. rc=%d\n", rc);
> +			return;
> +		}
> +
> +		drm_dp_mst_hpd_irq_send_new_request(&mst->mst_mgr);
> +	}
> +	drm_dbg_dp(dp_display->drm_dev, "MST display hpd_irq handled:%d rc:%d\n", handled, rc);
> +}
> +
>  /* DP MST Connector OPs */
>  static int
>  msm_dp_mst_connector_detect(struct drm_connector *connector,
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> index 5d411529f681..08e145399cfc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> @@ -9,5 +9,6 @@
>  
>  int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
>  int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
> +void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
>  
>  #endif /* _DP_MST_DRM_H_ */
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

