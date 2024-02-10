Return-Path: <linux-arm-msm+bounces-10499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 562108503C2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 10:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8892D1C21940
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 09:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988D032C9C;
	Sat, 10 Feb 2024 09:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L6Xt/L41"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55B02B9CF
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 09:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707558797; cv=none; b=UFleaSHHR3Wx9r90CoHJwckGFv13BDpmUaY932iYMAeWrYWKeJUagK0lgJbedq54Im2dvnz2d5Brer+odnbgPFm8yiamRthrrnDS4jnzPH+drWHchIlK0AvMkvwWNhJ9zStfVyZlzUvvJ+5CZZNI7qT3p9WGuLj0qwnhG47Eh7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707558797; c=relaxed/simple;
	bh=VNOSB7/IwjjowPyp7hKaLmKfR9ieTgEiKp0KRTyZJ44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OC58SmHSGdQvhQNnPEuKxkmXpfi2LmTatuTo6a/jXaCyyByKvDklQsS91QTmwV0UDyFPxen079/91y2Iph+4vtx4/fF606UQBG7S7jGKNpC6/K1bKwHEib815IOQi0Eqq4mmtVScQdnQ33szMINqm6RHIBECEu6P7CS/rh2OuoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L6Xt/L41; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso1789740276.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 01:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707558795; x=1708163595; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=paMHnlZbd0L+LSbZCuSA2TzUf7f5lSfJb2Dcn2AqQWc=;
        b=L6Xt/L41aGMEyYE6yJ7r7ZgKcmsq1xjX8hz5BUyzxmneNpVRC7rrZRwOgfH61EvkXI
         r9fhXnbWjxAyk/TuFjU6szFKpMhqYKQg6lgDwkSnL/41wlZuqBnDUswwSjzK6gpvV0m6
         PpXJOGsC5FO0XQtZlWs8iEy/qLVwLp+p8NADcobB7WrYC8O7mI9KttUuq5/KP2FV6CRN
         T+o/gvmZdLtuO+Epc4QIriiFFRFm2mRc58kv/ePPdQC6NBrpKB/Keaa6ID1xHjPNNMT4
         E8TIT3x2aqmZ60Ig60DPc7fujtYg23rPNRtpVPLLgJ9MevKT18MOBsj0nO6oTIHfEMhw
         Ld2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707558795; x=1708163595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=paMHnlZbd0L+LSbZCuSA2TzUf7f5lSfJb2Dcn2AqQWc=;
        b=ENwCZKHMru4bxrE/s8T/F5svvE4WWntjck6RnKqX8e6231MB+vZl2hxUZAUseKRUg2
         LN+EkckeH2X1NCNaeVxOMvcRobLPl4bxPRlbme8mD6XvwlhmF6J2kXTa0hM046p2zU3y
         dHi7hYFVxslFEl1SRiAN3EfNtyAnADYRDBbZfWQrUN7MCJ2hqwMN0rqXMs7h52ARIvc0
         aCHWRETgRV+wyXBMNS/u4ZoKhE3N/fSsD5CyaH6KTPgoehvnMXSTk1HoQjTOVZuW/znE
         Ca9n0yfDpz3ixKcgRbYXiuLnpSzkF/9KSzsmjcjWeBia1lSj/AodrzRZrum6WX6oOfOe
         d1Vw==
X-Gm-Message-State: AOJu0YyilTilCUbBXmMXprUpnOJFPC3xLSnrh39yb/YmAvx+EYZLctBd
	OC++Eb2zhSdxceFP1S3c6dQg+Gn/XXeH3Nm85D5KW27ll3/+e3PI68zPilH73VdNyg4UVSn6uM2
	Rr3RxdNpPptyqLOEvl8Ba5RYPEuiK1f3UfDM1YQ==
X-Google-Smtp-Source: AGHT+IEt0icZ3HR90tgs9nZHGdrHeqyx5vG0a8WaZsSVBg9mGCCy3byO6qznkQZSNknMA4a0NfGh5osh8gRgsT4Yais=
X-Received: by 2002:a25:b117:0:b0:dc7:4439:d14d with SMTP id
 g23-20020a25b117000000b00dc74439d14dmr1348647ybj.54.1707558794810; Sat, 10
 Feb 2024 01:53:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com> <20240210015223.24670-12-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-12-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:53:04 +0200
Message-ID: <CAA8EJprUf_TVUo+aWPm-dL10wxLu+UF6c7h8DhZwKZRXGvfqEA@mail.gmail.com>
Subject: Re: [PATCH v2 11/19] drm/msm/dp: change clock related programming for
 YUV420 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Change all relevant DP controller related programming for YUV420 cases.
> Namely, change the pixel clock math to consider YUV420 and modify the
> MVID programming to consider YUV420.
>
> Changes in v2:
>         - Move configuration control progamming to a different commit
>         - Slight code simplification
>         - Add VSC SDP check when doing mode_pclk_khz division in
>           dp_bridge_mode_valid
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 5 ++++-
>  drivers/gpu/drm/msm/dp/dp_catalog.h | 2 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 9 ++++++---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
>  4 files changed, 15 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

