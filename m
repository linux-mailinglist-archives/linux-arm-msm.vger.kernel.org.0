Return-Path: <linux-arm-msm+bounces-108775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBkWFpDIDWr93AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:43:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC05958FE41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16C9F32E41EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F40C21773D;
	Wed, 20 May 2026 14:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZmVQFG/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XY1sgy5l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77943E9C31
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287395; cv=none; b=X+wcx3Mb1C1AJ4z6Jm0DSndBPGSqZnBdntcQX9EXauZMZWZFJii0/m7lUk0NgkzMl8DlwCi07luFqhFI2qPWxLtoEGeA7oPTlyaj1yd9btaUlVl14Q0NuD7fRK85SCsj+2u1hl0QEd/TugjkvbUUjtWCe9Xv9C5H1l3OY0I/IQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287395; c=relaxed/simple;
	bh=oTAaOfFsFc8YiZ5sMXWMZAs7U4u7jgj04sZm//ztqmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5ydJzlbQTGE5skAjx8WXDJ5qGK5dh43P5wv/UejKyDrZF2dkrKI4LZ+rYankUCxBZZLOTIp7TFWbga2SrCx3erocOBp4Ji78GYrXFugvNK+nchiKVQsaR5yQngmPd4NacIc0d/TEdKMgN0qbTUW5GzYQx004Skaq/zRSkQvFBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZmVQFG/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XY1sgy5l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KBZYYc3085003
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pxOt6IK/i3ibZ79BpGFSHKfb
	P+cfEih0yG4dCpDnkIo=; b=eZmVQFG/A3xV3qUS4A0vUqI9P0C7ARkGzo0UX+4z
	ttYkvelNRt8/3mtaxRtZiGQMTYFTeZa0qD+e+bbTtQHPMtb1q4FYEuaA+E6SpUun
	Rx865+RpRmohzVR612Om1+ptNWx/pRYRS3zumRhYDpLpUS8x9iJiLkusgJmgrPR1
	9tIDn/ZN/vkOXo416xZlg4nJ6VktEK112DGJ6p3UWQ3vbesOi1ZExRo3Nsy/p4H2
	WHiuTbU8kIvFlttlPUhPEDnlSV37cheZyCntY42NL/EsMEsbGpG+KF0imZCp9Peq
	hCYYKSLFaSysZA8ODrnuxfkbMTqKpPyj8oz87joZg74c8g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f0mnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:29:52 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5751772dec6so11002078e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779287392; x=1779892192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pxOt6IK/i3ibZ79BpGFSHKfbP+cfEih0yG4dCpDnkIo=;
        b=XY1sgy5l+3Ol6vZbV3kMcXCKv78tcGIbin8uOj24cHsgeXBwNTbSDwi9IxXakQWJdq
         oHLL3BiJT3wVLJqaKypt3atzSpTtrGrIZJBnfyRWlPzkFo4akqguxCOh1GhoxMcpABR0
         u8KmIQMWY08LG6h4+MMEr+P9NLWWNPRRkxJBUrPP/8b2n7r0Lus1rwIQpp52zqBUpMnt
         BWYjH8Dh9E7SLyp3f/ot/77NbqYUhA6XBBrLf9QRWx8mHPoDtBHsDG+192c4wIVfeOJO
         ouWPRH2Z+hsSa6DvV45e3BzdcuZKtOZZ6bxYyUJD8s/2l9z8PfgSMdOQYyJ6iAj3SAiZ
         93Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287392; x=1779892192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxOt6IK/i3ibZ79BpGFSHKfbP+cfEih0yG4dCpDnkIo=;
        b=fjPzGtvOa97fe0CbeK1KD7n25vylQKChooHNlVjfTsHrC/A292AFCUs3fCwltW7kwd
         lrox217EYGNzw9u9+Q2P6V0lHLLE8V3bIrglhvQ746ChyaA4oMY6Yt91pzvIANIZq788
         38aAixoML3X3ItdTgYf/wOk8rePCXZkJcjn/bXwThLf3wZkdyGHSTpUXlaAsW3eyUMXq
         uofDCMm1lEXCmbP8ovTefQ+Vc3zkMNs1x8x5Rvge3BF8Sb74VNUPdSztOORHbAoQkIeS
         beHkTxZBcncv7RplVl2ooZhdSzUmJNc+pgrIgIdbkInPYJwWs7ErPk5YUGuar6VKEUIb
         68Fg==
X-Forwarded-Encrypted: i=1; AFNElJ87c9uKEgeave1em/Oagxo0vVR1I4x5zGjNwei8oosj6xEJ3UP9AiN5Y6kd7/m/2GSsqv9n3dosWBfzH1zl@vger.kernel.org
X-Gm-Message-State: AOJu0YymP7vpl0ed1LeWhf7W+ugDp7oeX/SxcfoxqTy90h6T8oAbd1V7
	13dc6dx/wUwHsGxp0a6uwqivxs3SJNd6FB6GFHc5z/YoL3smdlODxsSlS8gFcyp1keACrc9WYtb
	bC9KN42Jsjqxqi95fZhYwiZILJzLooExWZQCHuPCvignrEhSoEzwlLUmjPXnup2Et8SmB
X-Gm-Gg: Acq92OHsqQ2G70AtUw960SIZHyXT0hDyUYfD/auJbIAsS4nczJezdn0JXWfC9a2oxB3
	JlRU5weW8NPrY5WWlg+PnIyC+lv+qUssdhPNOdoqzcynQ9xTydJ1ClEscvOeVtYXn3bd0Xkbdka
	vmIN2A8fR+Obgs8t3XJODEO9bqnpQIw3Meo51veGUm+uj1Nm/MXRMiiUCLo7QUP0a6M4grDLuDn
	7izxAu6bfKKlkaoHlKR0OLTGBotHM8DrT4LtN/IpiKv9xGEp4SnYIfPT9PuSDbdOAsFsIzGl1yR
	hbCqgp9l2xzty0xh/05/URBe5F8z8RVxfs33ip6FIeVxUaC1p4+9lMBj6yjT5hzIzaBuKXMBFcO
	+aoLqZTt02PCQc0WNVvXyF5+ZYMFxW2bawE9w3nsUmhW5QEbIS37GR0ZdV13/cuiJ4OBb0ypYJM
	vporwcPF22+vJYxvHbeCJXIyQaLy5nKipaZ6o=
X-Received: by 2002:a05:6122:910:b0:56e:e9cf:7134 with SMTP id 71dfb90a1353d-5760be33374mr13875389e0c.3.1779287391899;
        Wed, 20 May 2026 07:29:51 -0700 (PDT)
X-Received: by 2002:a05:6122:910:b0:56e:e9cf:7134 with SMTP id 71dfb90a1353d-5760be33374mr13875318e0c.3.1779287391196;
        Wed, 20 May 2026 07:29:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cf0a5sm4942878e87.75.2026.05.20.07.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:29:50 -0700 (PDT)
Date: Wed, 20 May 2026 17:29:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ekansh.gupta@oss.qualcomm.com
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 08/15] accel/qda: Add QUERY IOCTL and QDA UAPI header
Message-ID: <m4zo2nkxtl5yeyo7riuata6r5saflmdgqf37cz2g2ezrwhk53m@mnad6bb7n3ik>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-8-b2d984c297f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-qda-series-v1-8-b2d984c297f8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0dc560 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=KrLRuONc4nWYnVYYFb0A:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: iYY1EeU4_no2DnCA2l6zMRJSLxGCdKlc
X-Proofpoint-ORIG-GUID: iYY1EeU4_no2DnCA2l6zMRJSLxGCdKlc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0MSBTYWx0ZWRfXw84pBe/ZUWe4
 kUJwx2PEhzMDTtbgKMd0DZ78oa8o3/U/6jf3lBf+LTk1kGAlpBxb/A+ntanC7gL8xsBzh3PDtep
 /MbdDUX81e5ckGqWCHOtvPwBo5nzO+UIu304jTZmgX0qW1jnl39/AoH0Man7m3Zg+j0L22bnQZ8
 /XpbJ2JSTyvj2k6ocrFeB2SlAfGp9R45eMRUYduQy2vK9DA7rzsCAnKd0HsaVMX/T+4jsH5OOPS
 7J/Ylx3k8UPtCnYKO/3cIwCTkLc6MDcQ17FBGWeb/PPd7fgHr8ltiqN14Dvb0UQtW6OY99EpxDu
 X14MiuOwkdijNrfMRcXe1nrQ0O4naqZq4mSnrp/DbDovF94px8OCTWPa2Sh8XLcmwDZpA8+SFTO
 VxtZh6Vv/WuyJdgx67Ji9kLlpJh6++05njKfsWFiMOAQb09PSw+Dv+odD7UGipTDKXj4+G8AhlG
 NT40wxI92Ig3XyhNgbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200141
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108775-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC05958FE41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 11:45:58AM +0530, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Introduce the DRM_IOCTL_QDA_QUERY IOCTL, which allows user-space to
> identify which DSP domain a given /dev/accel/accel* node represents
> (e.g. "cdsp", "adsp").
> 
> include/uapi/drm/qda_accel.h
>   Defines the QDA IOCTL command numbers and the associated data
>   structures. The header follows the standard DRM UAPI conventions:
>   __u8/__u32 types, a C++ extern "C" guard, and GPL-2.0-only WITH
>   Linux-syscall-note licensing.
> 
> drivers/accel/qda/qda_ioctl.c / qda_ioctl.h
>   Implements qda_ioctl_query(), which copies the DSP domain name
>   stored in qda_dev.dsp_name into the user-supplied drm_qda_query
>   buffer using strscpy().
> 
> drivers/accel/qda/qda_drv.c
>   Registers the qda_ioctls[] table with the drm_driver so that the
>   DRM core dispatches DRM_IOCTL_QDA_QUERY to qda_ioctl_query().
> 
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/Makefile    |  1 +
>  drivers/accel/qda/qda_drv.c   |  8 +++++++
>  drivers/accel/qda/qda_ioctl.c | 26 +++++++++++++++++++++++
>  drivers/accel/qda/qda_ioctl.h | 13 ++++++++++++
>  include/uapi/drm/qda_accel.h  | 49 +++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 97 insertions(+)
> 
> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> index 701fad5ffb50..b658dad35fee 100644
> --- a/drivers/accel/qda/Makefile
> +++ b/drivers/accel/qda/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>  qda-y := \
>  	qda_cb.o \
>  	qda_drv.o \
> +	qda_ioctl.o \
>  	qda_memory_manager.o \
>  	qda_rpmsg.o
>  
> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> index 0ad5d9873d7e..becd831d10be 100644
> --- a/drivers/accel/qda/qda_drv.c
> +++ b/drivers/accel/qda/qda_drv.c
> @@ -8,8 +8,10 @@
>  #include <drm/drm_gem.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_print.h>
> +#include <drm/qda_accel.h>
>  
>  #include "qda_drv.h"
> +#include "qda_ioctl.h"
>  #include "qda_rpmsg.h"
>  
>  static int qda_open(struct drm_device *dev, struct drm_file *file)
> @@ -36,11 +38,17 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
>  
>  DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
>  
> +static const struct drm_ioctl_desc qda_ioctls[] = {
> +	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
> +};
> +
>  static const struct drm_driver qda_drm_driver = {
>  	.driver_features = DRIVER_COMPUTE_ACCEL,
>  	.fops = &qda_accel_fops,
>  	.open = qda_open,
>  	.postclose = qda_postclose,
> +	.ioctls = qda_ioctls,
> +	.num_ioctls = ARRAY_SIZE(qda_ioctls),
>  	.name = QDA_DRIVER_NAME,
>  	.desc = "Qualcomm DSP Accelerator Driver",
>  };
> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
> new file mode 100644
> index 000000000000..761d3567c33f
> --- /dev/null
> +++ b/drivers/accel/qda/qda_ioctl.c
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#include <drm/drm_ioctl.h>
> +#include <drm/qda_accel.h>
> +#include "qda_drv.h"
> +#include "qda_ioctl.h"
> +
> +/**
> + * qda_ioctl_query() - Query DSP device information
> + * @dev: DRM device structure
> + * @data: User-space data (struct drm_qda_query)
> + * @file_priv: DRM file private data
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv)
> +{
> +	struct drm_qda_query *args = data;
> +	struct qda_dev *qdev;
> +
> +	qdev = qda_dev_from_drm(dev);
> +
> +	strscpy(args->dsp_name, qdev->dsp_name, sizeof(args->dsp_name));
> +
> +	return 0;
> +}
> diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
> new file mode 100644
> index 000000000000..b8fd536a111f
> --- /dev/null
> +++ b/drivers/accel/qda/qda_ioctl.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QDA_IOCTL_H__
> +#define __QDA_IOCTL_H__
> +
> +#include "qda_drv.h"
> +
> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
> +
> +#endif /* __QDA_IOCTL_H__ */
> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
> new file mode 100644
> index 000000000000..1971a4263065
> --- /dev/null
> +++ b/include/uapi/drm/qda_accel.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QDA_ACCEL_H__
> +#define __QDA_ACCEL_H__
> +
> +#include "drm.h"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/*
> + * QDA IOCTL command numbers
> + *
> + * These define the command numbers for QDA-specific IOCTLs.
> + * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
> + */
> +#define DRM_QDA_QUERY		0x00
> +
> +/*
> + * QDA IOCTL definitions
> + *
> + * These macros define the actual IOCTL numbers used by userspace applications.
> + * They combine the command numbers with DRM_COMMAND_BASE and specify the
> + * data structure and direction (read/write) for each IOCTL.
> + */
> +#define DRM_IOCTL_QDA_QUERY		DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
> +					 struct drm_qda_query)
> +
> +/**
> + * struct drm_qda_query - Device information query structure
> + * @dsp_name: Name of DSP (e.g., "adsp", "cdsp", "cdsp1", "gdsp0", "gdsp1")
> + *
> + * This structure is used with DRM_IOCTL_QDA_QUERY to query device type,
> + * allowing userspace to identify which DSP a device node represents. The
> + * kernel provides the DSP name directly as a null-terminated string.
> + */
> +struct drm_qda_query {
> +	__u8 dsp_name[16];

Are you sure that you want to query only the name? No extra options, no
attributes, no hardware capabilities?

> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* __QDA_ACCEL_H__ */
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

