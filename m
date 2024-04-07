Return-Path: <linux-arm-msm+bounces-16645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE99B89ADF8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 04:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59D4DB228E8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 02:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24485EDB;
	Sun,  7 Apr 2024 02:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="alHsG4c6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68493EC5
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Apr 2024 02:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712455442; cv=none; b=Y6KTcusHJfR1tdzx+BqV+5xiBiV6TaEVr0FSPC9MJuQ1hpQYSGBo2ydgWfPoCubbI8NLvNwE7XsL91UReqMmIlAY7XFQtmydV9VaW35sNZP/Zp9xcg/Q0k76r73PuDoO4Wm6bHMb2l8ZF/3lLdL9YuscSFQNTFp9/4Jt7kgge58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712455442; c=relaxed/simple;
	bh=U56H5A/lEPmEDEZ/TGhdwmTeuk3T08HKgselsQ/ZGh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gllv57W4i6IBjiGVx5rqVLlOgx93awV0iGaf0j9qMDB6BVuOZBSBptRdoqkAKLcohvjGile0TbF83J4NARdgghcMz5oSZ+pGMxJIZ7UJoi+XVGiuzO9ofa5ZUUJdIXPetix8czUwsj7iU4QpZ3hsAvC65Yok4LvnK8O40u+V9Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=alHsG4c6; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dd045349d42so3154639276.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Apr 2024 19:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712455439; x=1713060239; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/EZBl0kCTgMxcq/jZN2+jK2LUFglvi7j7hmZF1Wp3+U=;
        b=alHsG4c6geKLnfMqUrwCG1qYC4vZPfN7HGfTJD48t7rEbHZWu9FZpu05fyxsj3EmcC
         z9NFl8W/XJV7pgG0aTdRwcMl0EtlvYFtqbzHy1QwWw69va6+LPiKcNGdFFUnZH7Rn5O7
         Z0pYoXLXdSdNOAGuYIGb05avGJtMTtDrk+5KAE6pG5HFfA7ta1OZtlXABegTrYSmmKwh
         zrU8/dinRa2eowNKKG5+lQIj+cAlC4aH4Nb8GMwfLFYh0r751tGtjEpXo1EvvFs+t884
         rTq8rzCpkpYjHNjtM7kt4k9slVKWEm4wFkTnFVfubkS+Vd4PjauBk2DU2WW1MNLG2OqS
         S/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712455439; x=1713060239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EZBl0kCTgMxcq/jZN2+jK2LUFglvi7j7hmZF1Wp3+U=;
        b=gMORijJW+72jhadiFB0mm2qI1D0R/6x10l4LYuSaqPe5/eDkqS2Iadjgu/gDbbHWRc
         42bFPtNybj1v6HTJqlwEBo57t0BJPdvKzXBkdUr4WIY+2AisIRmuRgWsQCrucgh3IFoZ
         /2PGgEF7AMA98B+Y7KcDfTnShsXgCAni1L7mfFx47/9J4sR/qiMgnKvL+F+mYRjRtM8b
         R/f9aYM3xdBVDt386MnWJURkP3fHVU1Mm2Vm92uTr76BFOXrYGARStXhGSUD/ppQXmht
         oiy3nuncd5m21XV8+Jm9v6QiFraEpJDFJ66xkRlX9X7kF6cXqhmkjwJXPvc0qy7B/QXC
         M+iA==
X-Forwarded-Encrypted: i=1; AJvYcCWpUtZ0DE0Rs7gY/+xMwgDFU6SkWhP36xi4rIU7Vmv8oc/Jd8ecWg6WYqApXB/E9OS6l4LEHcD1pa5jYv5HM+wm0OQpKp7Ral3og6Z0UA==
X-Gm-Message-State: AOJu0YxdlojSoBA7DUeHLBD4q5Gi9Tjsdp0KrUg/ku/gpPUvJtVh0mla
	kpH0xF82DVAaUaKYtfapPzXt26xpxtWs10AjFa4iQHQ5eCM+EjQNDGxGNQoszN7EGkpUoQj84lf
	bSsDItSYS62JQvgglYl/ydTivVjdRf9OauBtFQQ==
X-Google-Smtp-Source: AGHT+IESVmqrBCQSNOIT/MkWy80FprAX2aIJsvoJBlMs+XmRvzK7dLUtQxc4/cWFcP0mJPU8jaki6SnYPrG6VITHuTM=
X-Received: by 2002:a25:a282:0:b0:dcd:6722:c728 with SMTP id
 c2-20020a25a282000000b00dcd6722c728mr3984209ybi.14.1712455439287; Sat, 06 Apr
 2024 19:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240406031548.25829-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240406031548.25829-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 7 Apr 2024 05:03:48 +0300
Message-ID: <CAA8EJpo5=t7JUDmq9cbzBgk+MVmwUC=QD3XTtiVY+F9kPyyLwQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: call dp_hpd_plug_handle()/unplug_handle()
 directly for external HPD
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	dri-devel@lists.freedesktop.org, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, quic_bjorande@quicinc.com, johan@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 6 Apr 2024 at 06:16, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
>
> For HPD events coming from external modules using drm_bridge_hpd_notify(),
> the sequence of calls leading to dp_bridge_hpd_notify() is like below:
>
> dp_bridge_hpd_notify+0x18/0x70 [msm]
> drm_bridge_connector_detect+0x60/0xe8 [drm_kms_helper]
> drm_helper_probe_detect+0x94/0xc0 [drm_kms_helper]
> drm_helper_probe_single_connector_modes+0x43c/0x53c [drm_kms_helper]
> drm_client_modeset_probe+0x240/0x1114 [drm]
> drm_fb_helper_hotplug_event.part.26+0x9c/0xe8 [drm_kms_helper]
> drm_fb_helper_hotplug_event+0x24/0x38 [drm_kms_helper]
> msm_fbdev_client_hotplug+0x24/0xd4 [msm]
> drm_client_dev_hotplug+0xd8/0x148 [drm]
> drm_kms_helper_connector_hotplug_event+0x30/0x3c [drm_kms_helper]
> drm_bridge_connector_handle_hpd+0x84/0x94 [drm_kms_helper]
> drm_bridge_connector_hpd_cb+0xc/0x14 [drm_kms_helper]
> drm_bridge_hpd_notify+0x38/0x50 [drm]
> drm_aux_hpd_bridge_notify+0x14/0x20 [aux_hpd_bridge]
> pmic_glink_altmode_worker+0xec/0x27c [pmic_glink_altmode]
> process_scheduled_works+0x17c/0x2cc
> worker_thread+0x2ac/0x2d0
> kthread+0xfc/0x120
>
> There are three notifications delivered to DP driver for each notification event.
>
> 1) From the drm_aux_hpd_bridge_notify() itself as shown above
>
> 2) From output_poll_execute() thread which arises due to
> drm_helper_probe_single_connector_modes() call of the above stacktrace
> as shown in more detail here.
>
> dp_bridge_hpd_notify+0x18/0x70 [msm]
> drm_bridge_connector_detect+0x60/0xe8 [drm_kms_helper]
> drm_helper_probe_detect+0x94/0xc0 [drm_kms_helper]
> drm_helper_probe_single_connector_modes+0x43c/0x53c [drm_kms_helper]
> drm_client_modeset_probe+0x240/0x1114 [drm]
> drm_fb_helper_hotplug_event.part.26+0x9c/0xe8 [drm_kms_helper]
> drm_fb_helper_hotplug_event+0x24/0x38 [drm_kms_helper]
> msm_fbdev_client_hotplug+0x24/0xd4 [msm]
> drm_client_dev_hotplug+0xd8/0x148 [drm]
> drm_kms_helper_hotplug_event+0x30/0x3c [drm_kms_helper]
> output_poll_execute+0xe0/0x210 [drm_kms_helper]
>
> 3) From the DP driver as the dp_bridge_hpd_notify() callback today triggers
> the hpd_event_thread for connect and disconnect events respectively via below stack
>
> dp_bridge_hpd_notify+0x18/0x70 [msm]
> drm_bridge_connector_detect+0x60/0xe8 [drm_kms_helper]
> drm_helper_probe_detect_ctx+0x98/0x110 [drm_kms_helper]
> check_connector_changed+0x4c/0x20c [drm_kms_helper]
> drm_helper_hpd_irq_event+0x98/0x120 [drm_kms_helper]
> hpd_event_thread+0x478/0x5bc [msm]
>
> dp_bridge_hpd_notify() delivered from output_poll_execute() thread
> returns the incorrect HPD status as the MSM DP driver returns the value
> of link_ready and not the HPD status currently in the .detect() callback.
>
> And because the HPD event thread has not run yet, this results in two complementary
> events.
>
> To address this, fix dp_bridge_hpd_notify() to call dp_hpd_plug_handle/unplug_handle()
> directly to return consistent values for the above scenarios.
>
> changes in v3:
>         - Fix the commit message as per submitting guidelines.
>         - remove extra line added
>
> changes in v2:
>         - Fix the commit message to explain the scenario
>         - Fix the subject a little as well
>
> Fixes: 542b37efc20e ("drm/msm/dp: Implement hpd_notify()")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

