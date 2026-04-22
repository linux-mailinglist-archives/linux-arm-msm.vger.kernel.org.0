Return-Path: <linux-arm-msm+bounces-104014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMgiI2VD6GmZHwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 05:41:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4705441DA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 05:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FF473011108
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 03:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FDA3A3E88;
	Wed, 22 Apr 2026 03:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aW8U178A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H9cqaaOj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C8039B944
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776829283; cv=none; b=aUCWLi0I9k38U5SZSBCYrs1L33gQnaLObt2cTl9IyXMnY6AC+teIcyX7TpGBrxwzw0Bb3BEBZ+UP7sajlY/1DeBnj9QQL32dSdJeQ1sY51lLOWLiwUotKNU19ScbNMaRJquFsRW4BZ+mztSjV2OT14wk9EVz4EblHSU87oo+7SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776829283; c=relaxed/simple;
	bh=cYc2gwzIgdP3vQZ9KGPmCJVu8o5+ga7i/ClaEiLWnXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5Zz+SRvWz3Xypz4Dtb4iFz5i13yzHUuztg7fWnaB8odL+u5+gm/fSBHL7xr1DLEH8CEI45UVUdb0D7f3I110KSWLuLJYhp7XSwHrFxN4oeZ6cwwfvg58ASJHEfJS3Nu8Qc1Ru0bCJ9DI76NCQxYVMdtqwUF8gz+5biTJwv4QUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aW8U178A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H9cqaaOj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZra52123716
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MMug9LqgfVUt6SjvE7w1lQYp
	otHgvj76086AHDBtW40=; b=aW8U178Avbx8lafqkfk52PCJTETxSIZwJu+uVMp3
	SJu6LLsQpHNMCYWAUTylbZFxI9dldZNjl+IVyDClvzmKq2w/Iq47VpOnBiS91XiQ
	y0Bn9DWieq3gUavus8+MOsEzFEijThAz8oOz2cpY5mUxxo1szOfNh0+VGU1G60GT
	O456hp5gWd7w59W42tTu8Zo+TBc8PEr+HzHEnrUWQDDXoHp3MCMvI2wpFMs4NDKj
	vmYRpZPHfzoqeVBIRiqYGEte3uZcLv/YljOuGMIwZd+Idp7yceFBLWxaDtVN1Xdd
	hcSl8jBAjjx6qWRq7tY4nhK0PTygKW2+iP+TutlV0+cSpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfsfn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:41:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fba8d8c40so30258701cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 20:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776829280; x=1777434080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MMug9LqgfVUt6SjvE7w1lQYpotHgvj76086AHDBtW40=;
        b=H9cqaaOjnmCZKKhSbKmOQeAY1STiiRdPZMAoA/PcIdOeeQdN3uTm0dRT9EuYinnTg3
         f8VkIpu7z0EIM5WZkjb1qeP7kfpAT1UqfKugLnnYKQVbLinjQcqKREtHqsXnsHbD8wAk
         SYtiFs1uQnkAUrMTJJc0twHCXtbTjwAkm6PquSN1Z6sfDsJAq7DKITQbu0by4zuTh8zY
         y2N8ONvY++ZQhK8Ue0i3FoFQjsvOS25iOeWSB3z+l52gMuGF3WDaTealDEw+aAoRNfug
         Wa3zhpxqXqz/iz6ZF+Hw/o6fpdrQ7cshACbWk5A30OEQd6eVxvZce/kXUpreBC+YKYps
         ocMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776829280; x=1777434080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMug9LqgfVUt6SjvE7w1lQYpotHgvj76086AHDBtW40=;
        b=AJTcDrz3/RIHLcDtJzVePbGGl7pMB0eBxdVxwMTeg557ctF3u4w6pSc2TULJ04R+eU
         NDKXgwNKAX2sttHx6Gn5GEz+4kmffUgS3J+c/ryzw43MozE0/IaOnF2NqnjNSYtddopM
         wjBWKdF2+733B5ewDyQATBN1JAhiOwk792RNSwxuzxFr9Aey+t9YEgcGOaf/OgCWh08z
         vojHE/LwYi7beJAUx4p0nQ/FaSmBlX0Fc50RU4oV+u2TyS7eAMyAmV/QH5ySbgGi31wd
         PaolMqaFysaiUBc++KeFDmrSeYiVPEJN2s7cWA8IQ9tu5TZARAjjy3TKQkdhzpwvfo6c
         PpbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OZH06UKYLo5hv425SsprS0xsLu7RiSVF7tvdfwKdYLLVX5c2deSZsieL3DvOW9KeN6pxWOAQakr16uhbq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3a5WEueUzOgBKAghU8OKWmlPRrTp1cknVhirWn29SEct1u/Rf
	FAdWBdLthakCCGLjEi5RPoDQBsAPP4A4UL7URDbJStXF8724zFTD4y9VXKdP7qzLeBH2GMTcoaW
	OHgLW9+3/veduzWfiX1/Y66wBmtnvR6ueyU830VYX1Hzo43vg61k1Gsko8cu8C81wvSbh
X-Gm-Gg: AeBDietVidptycYrB4vfGwCbNBkJ2lUBEg42iIGXi8MPoGMASMv84ciB2e8sU0q0ydt
	ZXQ9OzPnm/iQ6C5do3uVuP1ZRcungaIuifm3vHCqn2TDoZVPzzD4wgkfWIy155bG48a40dD4aLO
	kylkDfood/uhlQgtRvByaq4yYW7m76i5pC9j2Rrg7EGm7fq5ho/AM6tVu1YKqZoZsvYoakOD/od
	Wx1R976BZA2qSHk6R1ikBsNPMYI15MW8RbGltceqYA3cpranf1//eyM7B1n+hn4qonIiu0Yimfm
	drefofCcS8CdCtZ4pZfiFvfEUufyIc6h+JDiuWA5jPeSZKVuXas/v8m1nMBs5t2CinJPe7Wke/6
	F5XpIhzH4/qH2eSw7A5r4jtjkvMJcJ+RnTLw+DUCnIBmXKBzCOrVp9y5emTxBExdL0BkVhT4USr
	q+/NiNEanGr1YOIc5wPOhFLueeNhoLmSU/Xi6JJuMc7Z3/pQ==
X-Received: by 2002:a05:622a:258b:b0:50e:89e9:2728 with SMTP id d75a77b69052e-50e89e92bcbmr154258071cf.19.1776829280326;
        Tue, 21 Apr 2026 20:41:20 -0700 (PDT)
X-Received: by 2002:a05:622a:258b:b0:50e:89e9:2728 with SMTP id d75a77b69052e-50e89e92bcbmr154257801cf.19.1776829279860;
        Tue, 21 Apr 2026 20:41:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc1f6sm4044337e87.20.2026.04.21.20.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 20:41:17 -0700 (PDT)
Date: Wed, 22 Apr 2026 06:41:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 13/13] drm/msm: Add PERFCNTR_CONFIG ioctl
Message-ID: <a3nvz2coifdazaoyssm7xtxmyiusvofxu5f2p44kvrgvpa7hbc@jmj6gyttetcr>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
 <20260420222621.417276-14-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420222621.417276-14-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e84361 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=4q_80zGUEmdwlJpOyfQA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Fy4lfSm393btl9E2TcL6ksUyaRFJmsrv
X-Proofpoint-GUID: Fy4lfSm393btl9E2TcL6ksUyaRFJmsrv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAzNCBTYWx0ZWRfX1EcscfVKAzOn
 0IVKS6a5V4YDYRfccO53byCVLspVRz0rjE42AxDtLFzBEpzEQQxz8lASQ5rUE6FPln3xFkwCojt
 7CSU/X2tFIKdPzZl3xM7fmt717DoXS7G3WRqu80XptMt7EQ8qA36mOmQm0EvMbBrad+00Pblw5A
 pgMfHMsGWGRH6I4DH2Es+/+Fs/gbG13f6XNgpZXRubghtGFFmEerwhmUoTtXrW0siUSsTStaxxT
 WHxL5NQCUJLulAnYr7YQJpJLg6JXliAxfjDUn5r0AyxIWyFE6PkMMzVKEtjwOUedC32Ys9by/G/
 qYtlUy0xNkbglxAlx7Ur0YJZ8fwcvMF3To+HM6Drxbc/KIaho1/OnLWpr1Crq+V4nyUhQszvRH7
 etin+VpBmFUL+XViURfh4ZxD+YLFQ/2EC4sLZs1Ah5WT4BeiYZKH9si2UOWo0Df8ZUq4GCNTr4x
 J1D3WXMAAioQrkeci8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220034
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104014-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D4705441DA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 03:25:35PM -0700, Rob Clark wrote:
> Add new UABI and implementation of PERFCNTR_CONFIG ioctl.
> 
> A bit more work is required to configure the pwrup_reglist for the GMU
> to restore SELect regs on exist of IFPC, before we can stop disabling
> IFPC while global counter collection.  This will follow in a later
> commit, but will be transparent to userspace.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c      |   1 +
>  drivers/gpu/drm/msm/msm_drv.h      |   2 +
>  drivers/gpu/drm/msm/msm_perfcntr.c | 489 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_perfcntr.h |  54 ++++
>  include/uapi/drm/msm_drm.h         |  41 +++
>  5 files changed, 587 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 3066547f319b..0a7fc06113e0 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -801,6 +801,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(MSM_PERFCNTR_CONFIG,   msm_ioctl_perfcntr_config,    DRM_RENDER_ALLOW),
>  };
>  
>  static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)


Should we also increase MSM_VERSION_MINOR?

-- 
With best wishes
Dmitry

