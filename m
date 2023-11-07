Return-Path: <linux-arm-msm+bounces-8-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D382E7E32BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 02:56:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DC4D280DEB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 01:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D72A1870;
	Tue,  7 Nov 2023 01:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BZFblLgj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63A0186E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 01:56:08 +0000 (UTC)
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24883109
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 17:56:04 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5a90d6ab962so60437147b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 17:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699322163; x=1699926963; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qRdFl5udOcDDgpUUHFmtzTJy5y7ihwibQnaHgGQmu7k=;
        b=BZFblLgjjM8OPrYN1LQG8qQwUVwf1K6prfsGbAy4Bhzm8h+623wqk2iEmra2LeDRLe
         0hIOjLbH+rlPSWP6psoPUqmwG/ubWml1CUtslEYTcFiiv8b5PYZSlBfIbdtVfRa0hsxm
         v2oymDSdKZXJuZH2AAB1/Ov2Uepwti+X7H++7YNazEaqbxY6vK2m2vTi4qvsMnunH+/j
         9dbEMsxQpbgXCiIm2fPH6dBoCHU75yR9WJOLPHgwwFfPGkCrnhXPSr3idkcnD5hMqVxr
         pq5K4Qeq1R3AW2jMycFL1w58bExHzcxhpaD40E5JCMFY/TAOmKGNTUndfSYyPZse4Jzy
         yzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699322163; x=1699926963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRdFl5udOcDDgpUUHFmtzTJy5y7ihwibQnaHgGQmu7k=;
        b=Mtjvd1b6NXhiwedrbXDpduZtIlxiDLcL5RpQjiONdsfJEApxcE4EzWfc2/16Kl6jSo
         QHD+j5W7QH5vdjZUoUfwJoq+keXNu/Y8I6GkEZDfRMUS/jJ1UPnM02xPkc+kmpo0wZsM
         XL9XQlNvqfSFW99Lh/O52OGXbISXBe2oPetpX5MH2tOH4svGBRKmXOyyZ/qwY88WnEUC
         Bx9Odc1lkxZYVrU0qvvKx5fVkCUwtF7nqXp8AQJUOncb8D5O2kmoLoLaOsopZES3hep8
         wqy4iOr4QLvpxenwroWNOXPWthSkVNn5mcxLF7sdOu/Dcph19ctFzIckmJ3RpZyAdNZm
         rm/Q==
X-Gm-Message-State: AOJu0Ywb8Maym+N+KWWQRoape4+hsd3yTjHU6NmcMLgz2sGpCysevsMS
	hBIiC4IAQSN/0o3XgOfwIsf6jCVUk5iDxycFj3GICQ==
X-Google-Smtp-Source: AGHT+IFtN3nj1SFB8choYmUK6+L0wPLOEXRz8UqI3Ocfv/fDkJmkQoE2qADkYCuPiioo32CihjU/UeJ2DjK7I3fYw4E=
X-Received: by 2002:a81:9a54:0:b0:5a7:fa8b:3fa6 with SMTP id
 r81-20020a819a54000000b005a7fa8b3fa6mr12601421ywg.9.1699322163303; Mon, 06
 Nov 2023 17:56:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 03:55:51 +0200
Message-ID: <CAA8EJpoFRp+7GyO=F3Ar21tfG5Yt0cL6zkAquqg7D1XXQjp50Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] incorporate pm runtime framework and eDP clean up
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
	swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, 
	airlied@gmail.com, agross@kernel.org, andersson@kernel.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Oct 2023 at 01:55, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> The purpose of this patch series is to incorporate pm runtime framework
> into MSM eDP/DP driver so that eDP panel can be detected by DRM eDP panel
> driver during system probe time. During incorporating procedure, original
> customized pm realted fucntions, such as dp_pm_prepare(), dp_pm_suspend(),
> dp_pm_resume() and dp_pm_prepare(), are removed and replaced with functions
> provided by pm runtiem framework such as pm_runtime_force_suspend() and
> pm_runtime_force_resume(). In addition, both eDP aux-bus and irq handler
> are bound at system probe time too.


With this patchset in place I can crash the board using the following
sequence (SM8350-HDK):

- plug the USBC DP dongle
- run modetest at any mode, don't press Enter yet
- unplug the dongle
- press Enter to stop modetest

=> the board resets to Sahara.

Please ping me if you need any additional information from my side.

-- 
With best wishes
Dmitry

