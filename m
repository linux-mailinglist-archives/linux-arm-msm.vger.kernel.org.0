Return-Path: <linux-arm-msm+bounces-35272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 622ED9A7236
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 20:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 440701F260DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 18:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C211DACA1;
	Mon, 21 Oct 2024 18:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KfKSUZDK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43E4194AF6
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 18:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729534961; cv=none; b=eG+Bqm7xA5bBp2CFNJY9eCrD9pn6d61w8Y4DcQmyC0RVvYXMGqljJlWasuwwajbFeMYp4Ibs8k3Qd4OUrnnMG7GSntJBqVzE6KAsFnsap+2zu0W9GT9gH2alHzrksW3tYhWrlTOC0Ol6ybUAhVl93DlMIE0fv7soZWZm5T/OQaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729534961; c=relaxed/simple;
	bh=BVbpqEJrxCJQmdvTl9tyIfyxOsKqtNndpOAHb8fKZZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLbnT8wB8Z5GeNljZ2ZhU0lKBu4ing9oBR0LozccBNYr6RVX9w4XwhTGThYr0uSPEAWob0BQHX/4vqrtH/k4UxmRQNQI0u9Lm/TsKtPv93U+ZurMGzKGWnoZdvPJufru7y3vwhkbKNpkIVJ7YUMvaPe53adXz40DuAWjq9/l40c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KfKSUZDK; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e5a15845easo41402087b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 11:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729534959; x=1730139759; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7k7BD7pY8wACVBPmoOy5iE04EKB02xBbu0iFx0TdQp4=;
        b=KfKSUZDKJIeuQTp9SBJPk1g9tgQ084bNnlCsMPD1kMcWEB692Rit9TRaCxHZQPeTIW
         84rAkZzasjXZmw42w5TI9SBePEu2Ec86o4nj3vqfDOFsybmOIP+5QWK1V2ibxx2d989H
         MOZp2jqGyEsL4mCLUwt/OkPB/rVfQvwLKv4x8IC3afC4QjLOd+xzotKrMDCKRXOiBjOM
         kIRk+ze2evX3P39W2HbYZPqNLbQbiOMhonfgoRQPfZf7XCVpq+daRZnvMM9L7q07B4vg
         FD8cvCWpHBGtR4Z1PS9JtWHoeHUgYJTZEcqe23potdw3/IlwIZotoAx4G/dd3WIL3zUk
         A6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729534959; x=1730139759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7k7BD7pY8wACVBPmoOy5iE04EKB02xBbu0iFx0TdQp4=;
        b=PflYY1dnZNzKR5GtGe20jmJ44M01Fqx6VsarlfoVY1qiDCARDcKIwnSulkFpAn0lDU
         PS8ImfrR0mvgKyQ7fGkIiloiHp6jaDcyrCesekaVLtBh8nRGR0eXupED+jbYg+08s5iv
         WWkdat/FddbCBkCfGtGv8UiIXXYrMs3bc24Woy29UTp6GWbG6E75KqlwbESXmMbS4Qez
         T8j0GNEGDtKBfwAmiWW74Su+b8B6bA6JnN8BM7C3FtDPOZOaEwQoPHipbQS4qKyvG6cZ
         vwxiIVPJhIGJUK6D/8x2Wo7jrVa3PTh5f7w3Lr7wkriauNFVzf709JD60IRSeRCqDUOw
         QDIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWkpF2EnePQ++py1bE0EJ8vNkX7ptG4MywlxKJta6Ne1Q9W3yIzv5/RKOmtCh/kMgnPbiSMK61R0XS/XIm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1U0vb85O/aqbsHBB++xhluQCl95iSI4HYhSh0k8UzFUiQANyb
	ysgb4FZAd0Cq+K+LdvjVH1hlrqzajC0XYASAK0LO/OrB/KWIDe0pGugyxjB/Uqcx2zR9wjgbNcH
	T946DsmyakrQfuNYNWpClS3wi9nofAlBH0pFXHg==
X-Google-Smtp-Source: AGHT+IGIMQHSXKfZS5IiFigUoVnDbS0TTJP2IKElXl4CLNq16EHDVx2/Vt4LNIpric/HMhxMB7f3RTFLhbckcNrQFR4=
X-Received: by 2002:a05:690c:2b0f:b0:6e3:39b6:5370 with SMTP id
 00721157ae682-6e5bfa05685mr86769367b3.24.1729534958749; Mon, 21 Oct 2024
 11:22:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org> <a2d20619-0724-4b16-a9a5-4a3680f21c99@linaro.org>
In-Reply-To: <a2d20619-0724-4b16-a9a5-4a3680f21c99@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 21:22:28 +0300
Message-ID: <CAA8EJpoy=nYMix3m2n7KkwemCNoh_qg8FH0ENaa8VNcLtqZuww@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/bridge: add ycbcr_420_allowed support
To: neil.armstrong@linaro.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Oct 2024 at 15:32, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 18/10/2024 23:49, Dmitry Baryshkov wrote:
> > One of the features that drm_bridge_connector can't handle currently is
> > setting of the ycbcr_420_allowed flag on the connector. Add the flag to
> > the drm_bridge struct and propagate it to the drm_connector as AND of
> > all flags in the bridge chain.
> >
> > As an example of the conversion, enable the flag on the DW HDMI bridge,
> > MSM DP bridge, display connector drivers (for DisplayPort and HDMI
> > outputs) and AUX bridges.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Dmitry Baryshkov (6):
> >        drm/display: bridge_connector: handle ycbcr_420_allowed
> >        drm/atomic: add interlaced and ycbcr_420 flags to connector's state dump
> >        drm/bridge: display-connector: allow YCbCr 420 for HDMI and DP
> >        drm/bridge: aux: allow interlaced and YCbCr 420 output
> >        drm/msm/dp: migrate the ycbcr_420_allowed to drm_bridge
>
> How do you plan to merge this serie ?

Once Abhinav ack's the msm/dp change, I'd like to land it through
drm-misc. I think it's the most logical way to go.


-- 
With best wishes
Dmitry

