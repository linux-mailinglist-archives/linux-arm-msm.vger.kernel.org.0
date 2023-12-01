Return-Path: <linux-arm-msm+bounces-2829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA9B8004F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 08:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93FE7281645
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 07:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B641715ACD;
	Fri,  1 Dec 2023 07:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IqkHNRv+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C7A1712
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 23:45:14 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5d3d0f862f7so9313937b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 23:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701416713; x=1702021513; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bAyzCXYFTtB/vr3pXCQx6aGmKFlokRzACie3Yxs1gkk=;
        b=IqkHNRv+VlIBVjpnyq8f/FFML4Igs+2yYElhzsu3y86PWCUwXcfVtJnQRSrFdKmBxB
         nze87aH4GebK0qnO2geEBpk6uNfkXrCZJW+YpmXvJC5nRTwJuiA+V1l12+PWdWwCtJ/5
         woulgzM3h46ixgk4CHvGRxF73MMbxJxpwxqXuwT67xY0u2fQgnXzKcGc0JPd8o7i4LRc
         BhjabdknHHF4+eDlnefrP0CPNIWa92fofDuXncIlUbvgSHPHh5yCEERYPd2g0IPN8821
         qrPghIhPpDgt03tfFASc1Z4IVe/D5aKgFWGvHXr/T3AFd/n8nzjG1NVp+NhN642gZpDa
         YvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701416713; x=1702021513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAyzCXYFTtB/vr3pXCQx6aGmKFlokRzACie3Yxs1gkk=;
        b=uEK9gTOmGq+zAwzM907nmjgnRLOqYatprIJNRQG1/3iUKyKo1xZ41eQXbIf8fO4rF6
         avZhWffpSLAh48DnYKpmDV8ZDQ3Xp1ysRBeAd1ft5byiCL4k7IrMZPo49VqFsvT6WYa3
         rLWH7dUyJQEJm03lX7uuFUNfmWyLsOAS4mLizTu/ydbRaJ7KtXfKeEsWgqC9cstQTJ57
         BjZHh0dKTyAsx6Higm+ZbceVE9SaknMtLRReRZrRf064SmUxt/jVj1k64kVo1jfxzIar
         knbMkuVKLpPCmdbgXDJDlx1Kh0XRrGVppIK259vQ0QxOz5mUkWkOJfJumWlp2LbKX9d0
         zNew==
X-Gm-Message-State: AOJu0YzNzzAVBBb6I52vzQLq3ixsDA7Nqb2m+bIAd5yT0MkW2s79OyMd
	/GYAir2hwsCsamyzOsDBIXQJO7s/m8lYEJlLKqqf/Q==
X-Google-Smtp-Source: AGHT+IFS4C7LCzDwL4Hj38KGzIxRLCyE0RQvsnn0ZgHweV0zxG/M0rJEcXuB5HAkf+D7lbK/o5D4Z747vtaw3IpSu0M=
X-Received: by 2002:a25:f44d:0:b0:d9a:e397:3b4 with SMTP id
 p13-20020a25f44d000000b00d9ae39703b4mr22927544ybe.46.1701416713218; Thu, 30
 Nov 2023 23:45:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201014101.15802-1-quic_parellan@quicinc.com> <20231201014101.15802-2-quic_parellan@quicinc.com>
In-Reply-To: <20231201014101.15802-2-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 09:45:02 +0200
Message-ID: <CAA8EJpqGx3eQ3o6bJhv3OBmHqtp67x8ODupZgKfSLSfFcRRmHQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/msm/dpu: Modify vblank_refcount if error in callback
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	marijn.suijten@somainline.org, steev@kali.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Dec 2023 at 03:41, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> When the irq callback returns a value other than zero,
> modify vblank_refcount by performing the inverse
> operation of its corresponding if-else condition.

I think it might be better to follow Bjorn's suggestion: once we have
the lock, we don't need atomics at all.
Then you rearrange the code to set the new value after getting return
code from dpu_core_irq_register_callback() /
dpu_core_irq_unregister_callback().

>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 9 +++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 +++++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)

-- 
With best wishes
Dmitry

