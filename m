Return-Path: <linux-arm-msm+bounces-40353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE3C9E4689
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDA1EBC0B16
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 19:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238CC1C3BFC;
	Wed,  4 Dec 2024 19:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=helen.koike@collabora.com header.b="foW57rbE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630CC1A8F95;
	Wed,  4 Dec 2024 19:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733339696; cv=pass; b=NfrBlDmX8KdljdrKQU7DbQn3bveTh2gQ+8x0aT2sCgak8d7z0COPmCc1rfwbHbDiaayt0wLFN0PTjrVW4sVa4rhegUIFi6yGeKb0ZB83grycqP+mXbyl/GPGOWJC2Gs62CDYz+mG5pnrbzC0gQZ5z+WmLstacWXBIEiwoV7H49M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733339696; c=relaxed/simple;
	bh=4QEWfLZKhkRKHZmTv/xOicqSbHyQa9vjUoVZgI36YTs=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=fR8aBMjw4PmXnweC5Io4QQ+/iT265xaHOoKurkBO5LaguUs1tEZiBOX9oHAwU74HPW/RrUPkL9sVkLzje6tuccGirI1sW+w+p/ti1Fpv9NX5CCMrVHRdIH9Ul/kH/KCOI+ubJYDm3RscWok+5JuvhFQUne8jq6KUexLEv4d1vng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=helen.koike@collabora.com header.b=foW57rbE; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1733339672; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G0eYWHb1WI0eq99x3/jjESsRM0PHKl3oNj0IqguOBfaO8BT33SE7EpsgNdI0ejJqQDXmWxEwFeXCykQX56IipMeG/1VCpE/cPQE9/DXlr7QV3dTWJeFRDC3x80bd61oqlz6QJd3jBw+0Ra19pCp4KAVNtYkjaUMXE05PR81zq6o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733339672; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xNql7HZ635pXOjw9MZHeIc0tn8TsOE40r41049HwSoc=; 
	b=dBNfk5S4YhwVjEDRSRrcyPSaOJdTjN8q13HZIOEUBVp93QaVTQllesAb82o7RzYqZx/bvNVbHI+ZTC1wPwKvztAL09K1g61IdUbZTrJir1lccdEMoT9sjpUizy595xrsVxFUT+57aRY/sSZG5AlNHs1kGozdRJ0XAfW5Ke0ISRY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=helen.koike@collabora.com;
	dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733339672;
	s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xNql7HZ635pXOjw9MZHeIc0tn8TsOE40r41049HwSoc=;
	b=foW57rbEuBcp4jR/tr+riz2FgmIzIKT4dXFzTTm20NcXr35Gxd1dDNaWkGS3JoTG
	0En8FGYDzGHmB+lfu2SiAqrPd1TIx8hg3UQmGn7j5yvkY+g00Mv6V1GfLRzMxGilCDR
	oq6jiZtrY4SYwhyVNk1EZfj9foqahkkx35UERRy0=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1733339670975851.2409563242871; Wed, 4 Dec 2024 11:14:30 -0800 (PST)
Date: Wed, 04 Dec 2024 16:14:30 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "Abhinav Kumar" <quic_abhinavk@quicinc.com>
Cc: "Rob Clark" <robdclark@gmail.com>,
	"Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
	"Sean Paul" <sean@poorly.run>,
	"Marijn Suijten" <marijn.suijten@somainline.org>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-arm-msm" <linux-arm-msm@vger.kernel.org>,
	"dri-devel" <dri-devel@lists.freedesktop.org>,
	"freedreno" <freedreno@lists.freedesktop.org>
Message-ID: <193931869a5.f923adf2270026.8321075661083367617@collabora.com>
In-Reply-To: <20241204-cursor_tor_skip-v1-1-f5f0bba5df7b@quicinc.com>
References: <20241204-cursor_tor_skip-v1-1-f5f0bba5df7b@quicinc.com>
Subject: Re: [PATCH] drm/ci: add kms_cursor_legacy@torture-bo to apq8016
 flakes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hi Abhinav,

Thanks for your patch.



---- On Wed, 04 Dec 2024 15:55:17 -0300 Abhinav Kumar  wrote ---

 > From the jobs [1] and [2] of pipeline [3], its clear that 
 > kms_cursor_legacy@torture-bo is most certainly a flake and 
 > not a fail for apq8016. Mark the test accordingly to match the results. 
 >  
 > [1] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67676481 
 > [2] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67677430 
 > [3]: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1322770 
 >  
 > Signed-off-by: Abhinav Kumar quic_abhinavk@quicinc.com> 
 > --- 
 >  drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt | 5 +++++ 
 >  1 file changed, 5 insertions(+) 
 >  
 > diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt 
 > new file mode 100644 
 > index 000000000000..18639853f18f 
 > --- /dev/null 
 > +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt 
 > @@ -0,0 +1,5 @@ 
 > +# Board Name: msm-apq8016-db410c 
 > +# Failure Rate: 100 

Is failure rate is 100%, isn't it a fail than?
(I know we have other cases with Failure Rate: 100, maybe we should fix them as well)

Regards,
Helen

 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.12.0-rc2 
 > +kms_cursor_legacy@torture-bo 
 >  
 > --- 
 > base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b 
 > change-id: 20241204-cursor_tor_skip-9d128dd62c4f 
 >  
 > Best regards, 
 > -- 
 > Abhinav Kumar quic_abhinavk@quicinc.com> 
 >  
 > 


