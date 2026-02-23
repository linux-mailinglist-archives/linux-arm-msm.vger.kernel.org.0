Return-Path: <linux-arm-msm+bounces-93839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM8lAD/YnGkFLwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:44:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 911F117E83D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BBF330C6C5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 22:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4087A37BE71;
	Mon, 23 Feb 2026 22:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kqvDym6x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hcLMBF6a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511D6296BDB
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771886394; cv=none; b=dcKfT45/zVe0TP3gvJ6djNlZh23CosmAtmEM6GO1jyPGPCusa3zkwokIyA9JlRgDbBQqpe9UAWnAfuJvuWhaWU9aB81hhNERS3Zc4ZtMSVhoP7RW5wt3vr7YmdxSfcG8tQ/hUqQJtrYjQUlHY9dMsFWFqEtrgQDAbEn9eMonPpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771886394; c=relaxed/simple;
	bh=weupwFoIWkaFS/BOYuMucpezIPPWMRGr1EVbfFr6I50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bY8ja3GqnnZvP/84QPscx4LBruieObU27Rv6yaUa0JML6lIrIHjX3X9fNE0UV2D87GNBKnNG7WPJP7IpgtlhJuoepxKccN6854+WGkA4kk1QZqKSbCwbMMte5toRVkR1rbkgCOTGoucqCr/WcGxn/FzM4V1oicMQFTTt6k2RVrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqvDym6x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcLMBF6a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NHxmvP322212
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nUK32uPvxI2Vc2NAUq76VwMY
	c+Ah6Xyt+D23oW/zCfs=; b=kqvDym6xN5iYKhCrRoJnOe6QhUMEQmbDb5Q7Jt7G
	Nvp9xvYWF6ojiRHfKtEW3cbRLt/YsX0zowxZRSJBZnv1nqbeZuspdihEvi00mnu6
	Z9QkZNNmd/hUGeNWgthr0Qeahc7w9POljWOVqi5QDdmfcKREpryPqTyMqV6ifblK
	1BAE9zpA+zD8PNCTFr/vHaYa3QDy370T0uMnoLyMASd+AO0WM5X76QYcdJ9S2BM+
	U83C5vsR7m15pFs3KYJBntr/YxlhlApsKfA3KcniUk5kU/NfeAgQVCXCfWW/cfxw
	E9GfEazeVJ6kB4F1KY+H18iAQJ6Cj7nBeVSqTj6WjTzGRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y246v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:39:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c881d0c617so4304459985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771886390; x=1772491190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nUK32uPvxI2Vc2NAUq76VwMYc+Ah6Xyt+D23oW/zCfs=;
        b=hcLMBF6aaRjMEyMgqxNkoSwjOWqGQO/5IfgjTavRsYcKXoVuuHglqo/r4tF2g8XMt8
         kFKMxHlllxdDYpTIGVwY+yqYTeJLm7HYTeHsmcjME5WJCN6N/BylDf4bmj1bzNhPoMNd
         ynTXnl+yyP+iFoRGcL2s0grXm9KsoKr3e/v+9PbGC2E+StScA20SV+5aBkFlkEz5FH9L
         tr1mLcOXidq/RP0WfEEwYxnbnfBDnoYvO1W4WR5Cp98rftxlRHFuEAcGGos0iJsplLpf
         MU+PlSSWWHQBe98zjpBnsF4xB6Y5pk43OAe2gj/oEDPjWJTli96WpQalsRbLf+ZEt7np
         l/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771886390; x=1772491190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUK32uPvxI2Vc2NAUq76VwMYc+Ah6Xyt+D23oW/zCfs=;
        b=JmYo/y29sH6KNuDUCnYrsda/b3MW4kv5mB3N4PWbe28OLI3lCHbIZ5pQIspnyZo6/g
         dNPeaxkaFlz2yVmjPd8XtAW39ImKqdAyUxAMaD20QmyQrwaZMezIisAaTyixWwQaNmeI
         JelrSjJf/hLXhFHKbRoPRnbcY9cXX0JKEkrQgn+8Kak2YC19o8duzuegArZ6CV0t78sP
         bOgjFNafeeO+Ixwuo7GQcObR4ZhH4F2WxnrqDvbpIFq+p2/sn0UpDvPGRByLPgsctJdl
         7gWC2WIv/r7/QjMTqsJheYUJ5pI4FR3lCA8rJn+QSUgA5CqShIYDHDpOLBQpH7CEID5u
         GU3A==
X-Forwarded-Encrypted: i=1; AJvYcCVySHjF9CFSVcoN7Fzs5hPFYCKojs6t8KxxgGKGj2dwQQcRcpcVpRpIVo5ow6ZxgVvPzK3xzoDDPmC1wufl@vger.kernel.org
X-Gm-Message-State: AOJu0YzQtDuEegBtkZNMCfuFyGHbcGfGmO1kiCrlFHHdMc07om2um4J+
	E0+hzDyaE7q0jIOoS4vXjgMHnJ/hX+pceM7uN2vOx/522FHmykgMo6EJjZJJz0pK30fCVBZTo2V
	BOAwhTFSHJzOyon3YJv9pUYWyIXjCMGrnHetEI43YNoxXszEm/0cQs5RdwaMoaPC2EKPm
X-Gm-Gg: AZuq6aLrhZo4rP7+NheJLMTn0NrSxaIHmnHs5ylCHpMjBf0QOnnnlZFtWIHfXZsGItM
	cCldvvmxmITMNdzQ1RkO01U/7EnVoYFduX/fiEAsX9KbOWAbRe7Md3eSOQZmKHGhh9U7Wly5mOz
	Os9575b+Eha1kK/h1jC/n8rw2eUggUsUkieHkSE3YBp4Zy6/3NdA4x8jxdKbAO+5ozzfnuEuivr
	AzcYUTSfabTpfMeCUXY9s8SvVT+fqX7ZNXhyCMWAIXieDowIuX28iaHGDzRiZgGjUyoX7mGJDmk
	tH4Ac96jUy5kRKSKQcPuXvNQAcCJCaPAJPFYqcMdPL3QG3eEhbEjP+HpuZc4CxUJ87C2wRRBv+i
	uTTwlYuEN2rhn2rOy2xpKoatjP6P1iVLRLdmOFYNtB8O5zM99cT1+2lu3XzG8TFqhUy35Vjli4z
	i02sbnOFW9GiWe6iwRHcImJ6/4L/FxS8zj9C8=
X-Received: by 2002:a05:620a:319a:b0:8cb:4c79:b44f with SMTP id af79cd13be357-8cb8ca72048mr1249892685a.51.1771886389530;
        Mon, 23 Feb 2026 14:39:49 -0800 (PST)
X-Received: by 2002:a05:620a:319a:b0:8cb:4c79:b44f with SMTP id af79cd13be357-8cb8ca72048mr1249890085a.51.1771886389013;
        Mon, 23 Feb 2026 14:39:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb13873sm1823833e87.22.2026.02.23.14.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:39:47 -0800 (PST)
Date: Tue, 24 Feb 2026 00:39:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 11/18] accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET
 IOCTLs
Message-ID: <mkrwav44qxt66ojxvs2mh5jsjqirrm4sk653uglha3cjefevk6@fobon6vj7fhr>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-11-fe46a9c1a046@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-11-fe46a9c1a046@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5NyBTYWx0ZWRfX1cDwaIw2vatb
 DAPsKiiH1EMVOB8YfLH2/WJ6DM2MFwTNvtR60Skr3hBrHQnV9xiSJ8kWIqJXDA42jGI3CAjjuNe
 rKbUZ1VSkaYxZ2FWVnmiximCpO5Yiidmd0SGMJhb/gmc82B+kJr0+DKj5dW7B9w9G+3JispdV6i
 VO8eiDgymLZ6gfJAu5OIur9HWZ93h0+ydqKO5IT5VzrH23qcWTf2+4dBB4fZgOHzakTflc65oun
 t1i7QOB9EDRC6rsdBzsoxSqqXsPHfGPmaLqoQCYpH0X/1bWFtPCqmrZsoB4XScaTvSZdjHmRy8L
 0NLBdyT9fv8LNAFOr+xKZDAAGx+PPZsOZ9typSuXQTSDCEhIz1Z3tAaZYIhPFLdLjAdiynVRD26
 CZ/QWX2gqRtVEz7jq6NxjGVUtfboBs8PyTVp9JXsicfKOtVws9A6BvtXbalVLdlcPQGd96b6S2h
 hqxlRtApWkTbZvGA+Xw==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699cd736 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=03G4QXms81HB9-bpn8QA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: USFQRaDRa37hRpxVqiUTGDoIhwG0WCly
X-Proofpoint-ORIG-GUID: USFQRaDRa37hRpxVqiUTGDoIhwG0WCly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230197
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93839-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
X-Rspamd-Queue-Id: 911F117E83D
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:39:05AM +0530, Ekansh Gupta wrote:
> Add two GEM-related IOCTLs for the QDA accelerator driver and hook
> them into the DRM accel driver. DRM_IOCTL_QDA_GEM_CREATE allocates
> a DMA-backed GEM buffer object via qda_gem_create_object() and
> returns a GEM handle to userspace, while
> DRM_IOCTL_QDA_GEM_MMAP_OFFSET returns a valid mmap offset for a
> given GEM handle using drm_gem_create_mmap_offset() and the
> vma_node in the GEM object.
> 
> The QDA driver is updated to advertise DRIVER_GEM in its
> driver_features, and the new IOCTLs are wired through the QDA
> GEM and memory-manager backend. These IOCTLs allow userspace to
> allocate buffers and map them into its address space as a first
> step toward full compute buffer management and integration with
> DSP workloads.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/qda_drv.c   |  5 ++++-
>  drivers/accel/qda/qda_gem.h   | 30 ++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_ioctl.c | 35 +++++++++++++++++++++++++++++++++++
>  include/uapi/drm/qda_accel.h  | 36 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 105 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> index 19798359b14e..0dd0e2bb2c0f 100644
> --- a/drivers/accel/qda/qda_drv.c
> +++ b/drivers/accel/qda/qda_drv.c
> @@ -12,6 +12,7 @@
>  #include <drm/qda_accel.h>
>  
>  #include "qda_drv.h"
> +#include "qda_gem.h"
>  #include "qda_ioctl.h"
>  #include "qda_rpmsg.h"
>  
> @@ -154,10 +155,12 @@ DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
>  
>  static const struct drm_ioctl_desc qda_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
> +	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
> +	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
>  };
>  
>  static struct drm_driver qda_drm_driver = {
> -	.driver_features = DRIVER_COMPUTE_ACCEL,
> +	.driver_features = DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
>  	.fops			= &qda_accel_fops,
>  	.open			= qda_open,
>  	.postclose		= qda_postclose,
> diff --git a/drivers/accel/qda/qda_gem.h b/drivers/accel/qda/qda_gem.h
> index caae9cda5363..cbd5d0a58fa4 100644
> --- a/drivers/accel/qda/qda_gem.h
> +++ b/drivers/accel/qda/qda_gem.h
> @@ -47,6 +47,36 @@ struct drm_gem_object *qda_gem_create_object(struct drm_device *drm_dev,
>  void qda_gem_free_object(struct drm_gem_object *gem_obj);
>  int qda_gem_mmap_obj(struct drm_gem_object *gem_obj, struct vm_area_struct *vma);
>  
> +/*
> + * GEM IOCTL handlers
> + */
> +
> +/**
> + * qda_ioctl_gem_create - Create a GEM buffer object
> + * @dev: DRM device structure
> + * @data: User-space data containing buffer creation parameters
> + * @file_priv: DRM file private data
> + *
> + * This IOCTL handler creates a new GEM buffer object with the specified
> + * size and returns a handle to the created buffer.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
> +
> +/**
> + * qda_ioctl_gem_mmap_offset - Get mmap offset for a GEM buffer object
> + * @dev: DRM device structure
> + * @data: User-space data containing buffer handle and offset result
> + * @file_priv: DRM file private data
> + *
> + * This IOCTL handler retrieves the mmap offset for a GEM buffer object,
> + * which can be used to map the buffer into user-space memory.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv);
> +
>  /*
>   * Helper functions for GEM object allocation and cleanup
>   * These are used internally and by the PRIME import code
> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
> index 9fa73ec2dfce..ef3c9c691cb7 100644
> --- a/drivers/accel/qda/qda_ioctl.c
> +++ b/drivers/accel/qda/qda_ioctl.c
> @@ -43,3 +43,38 @@ int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_pr
>  
>  	return 0;
>  }
> +
> +int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv)
> +{
> +	struct drm_qda_gem_create *args = data;
> +	struct drm_gem_object *gem_obj;
> +	struct qda_drm_priv *drm_priv;
> +
> +	drm_priv = get_drm_priv_from_device(dev);
> +	if (!drm_priv || !drm_priv->iommu_mgr)
> +		return -EINVAL;
> +
> +	gem_obj = qda_gem_create_object(dev, drm_priv->iommu_mgr, args->size, file_priv);
> +	if (IS_ERR(gem_obj))
> +		return PTR_ERR(gem_obj);
> +
> +	return qda_gem_create_handle(file_priv, gem_obj, &args->handle);
> +}
> +
> +int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv)
> +{
> +	struct drm_qda_gem_mmap_offset *args = data;
> +	struct drm_gem_object *gem_obj;
> +	int ret;
> +
> +	gem_obj = qda_gem_lookup_object(file_priv, args->handle);
> +	if (IS_ERR(gem_obj))
> +		return PTR_ERR(gem_obj);
> +
> +	ret = drm_gem_create_mmap_offset(gem_obj);
> +	if (ret == 0)
> +		args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
> +
> +	drm_gem_object_put(gem_obj);
> +	return ret;
> +}
> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
> index 0aad791c4832..ed24a7f5637e 100644
> --- a/include/uapi/drm/qda_accel.h
> +++ b/include/uapi/drm/qda_accel.h
> @@ -19,6 +19,8 @@ extern "C" {
>   * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
>   */
>  #define DRM_QDA_QUERY	0x00
> +#define DRM_QDA_GEM_CREATE		0x01
> +#define DRM_QDA_GEM_MMAP_OFFSET	0x02
>  /*
>   * QDA IOCTL definitions
>   *
> @@ -27,6 +29,10 @@ extern "C" {
>   * data structure and direction (read/write) for each IOCTL.
>   */
>  #define DRM_IOCTL_QDA_QUERY	DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, struct drm_qda_query)
> +#define DRM_IOCTL_QDA_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_CREATE, \
> +						 struct drm_qda_gem_create)
> +#define DRM_IOCTL_QDA_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_MMAP_OFFSET, \
> +						 struct drm_qda_gem_mmap_offset)
>  
>  /**
>   * struct drm_qda_query - Device information query structure
> @@ -40,6 +46,36 @@ struct drm_qda_query {
>  	__u8 dsp_name[16];
>  };
>  
> +/**
> + * struct drm_qda_gem_create - GEM buffer object creation parameters
> + * @size: Size of the GEM object to create in bytes (input)
> + * @handle: Allocated GEM handle (output)
> + *
> + * This structure is used with DRM_IOCTL_QDA_GEM_CREATE to allocate
> + * a new GEM buffer object.
> + */
> +struct drm_qda_gem_create {
> +	__u32 handle;
> +	__u32 pad;
> +	__u64 size;

If you put size before handle, you would not need padding.

> +};
> +
> +/**
> + * struct drm_qda_gem_mmap_offset - GEM object mmap offset query
> + * @handle: GEM handle (input)
> + * @pad: Padding for 64-bit alignment
> + * @offset: mmap offset for the GEM object (output)
> + *
> + * This structure is used with DRM_IOCTL_QDA_GEM_MMAP_OFFSET to retrieve
> + * the mmap offset that can be used with mmap() to map the GEM object into
> + * user space.
> + */
> +struct drm_qda_gem_mmap_offset {
> +	__u32 handle;
> +	__u32 pad;
> +	__u64 offset;

I'm really not a fan of the pad field in the middle of the structure.

> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

