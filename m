Return-Path: <linux-arm-msm+bounces-13537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF8E874092
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 20:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50DD1B210B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 19:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4723B13F445;
	Wed,  6 Mar 2024 19:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yyipT7by"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A585213E7D3
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 19:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709753847; cv=none; b=gjTkNeQ6HQLuQMSfG+EsP4Hc3gO+JViQRS/fQqiSAKiVG9DOHLnnWt6iEmbGCGruxwGqbi1A3ymILdbcAooP/TfY/nV3xX6xbDotsLX5WFteA82vjPQ6HZ9eGS/ty3/jboPVYy4xqbWuebzKcmoFZeuM/nDHCvk16kvt3bdSg0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709753847; c=relaxed/simple;
	bh=6cnpZDUdkD29IWFwR/q5G6jtdmxkXbldKBzmXR0qa0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rpseq9sP4SYVgPi1YBOeYKzmm3Rlv1w1JB7JTplPgfuGVcan9S9gl6dXVjvDMSsADK9g4q2hspD7xy47CVxnY+GNyR2tXYq5JgWSPliGvvus113lRuQdAnJsaCfeLL5hwJGb/TEFSWEkqari6mauThDttCrKCcy5qpbjlAiTW2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yyipT7by; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6087d1355fcso958027b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 11:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709753844; x=1710358644; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GNGb5BZ7AINJbJgQXn/Q7jDuTAr3ISUOPfFvM1cAIAU=;
        b=yyipT7byMgTy1xWWkm9c8BWhf+0Tah4k419plUmM/Ny+1Xa5ArZq1+uhJRYGpGqD1F
         mHc7/HDPoNbSiEIYUJlT5igXpJ7C3JqLduWmnBXpaLE13DU938CqozHdj7fSm2rc098P
         aZZlRBFwG6iATUBXfi+yGBJEnhbbT+rqxgzQCI+QPQmtlPLFmg2YfircU649bLaZ79x2
         g0H3QAalXZAblrkc6MMGjIcCwtexh8LQ+uzxG6rrHSeBMKNWuOFhJueACsjvYQRds5wi
         HGEq0BvoGsqqeugtrxsx6hKx8HKEZ/DJQO2/lwkpbWANCGhOH0cW9KbXJSLYaijK49k9
         N/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709753844; x=1710358644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNGb5BZ7AINJbJgQXn/Q7jDuTAr3ISUOPfFvM1cAIAU=;
        b=KcZBGNb/E3q3H4QWk8ixFt1IV+I+xLt4ugDK2wyEJo4XG6QoHf++j8mghzs521X665
         nxva5O+BgmZOxf0HGqHdz56rcE7U4Ou+UvDkLtt4F+qcC1CcWjKjNbZyufwmyhTephep
         nOZR/oK+pMeYmYWCaADWRso4ryPreFDvoQKZ5vcCtNAnugf6nhtDBQhN436XZhd3/Hk+
         FU6iyUZbRY//gpBJM0rA0TG7WUKPMWAI9cb5qUG3+hQWl6lrLLmDQBSBg+uM7ZiAyzra
         6CJDtrs3vPJ2YLU8tgBWLafsnZooS4//g4JyokltQ5jGMWY81/2IXrAdCb03JimgfAv/
         yr9w==
X-Forwarded-Encrypted: i=1; AJvYcCW73Yeh7YGttYRwFG9wVj0v9TSsf/kSuT2yRKsajt8Z3HVWVVgEONBuRqtqSPLITNo1eQ2K43ke3Eeg9VNsw/rpIVILiLP4/WFyC8giPA==
X-Gm-Message-State: AOJu0YxFD1MJXcm/cVxrnlz7FaMZqgyViq1x4n4ByydJDOH9NeXOGHa0
	HqIZ0Cig0loCFB04Uh1Srk34vV71Dy5X+c/J4K4oSs1s5dMUEVzi2vD4mYH+a5/6Cfpi06skTCy
	Zjx+DNNesG4u1S2YdWtPOEtNUJVb2ymJD6+VSOQ==
X-Google-Smtp-Source: AGHT+IHuei9cSteH/A4mQ8tGokXyI8WejeGtf2o3u3B0yT5hvLrRj3UV5f5zbG98ZxwHbe98Gp2+giMbUEY+VqeSeS0=
X-Received: by 2002:a0d:e8c4:0:b0:609:845a:4a89 with SMTP id
 r187-20020a0de8c4000000b00609845a4a89mr16100721ywe.39.1709753844667; Wed, 06
 Mar 2024 11:37:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306193515.455388-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240306193515.455388-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 21:37:13 +0200
Message-ID: <CAA8EJpqATJdV6f7Yi4gDeSpmgd45TUxqFmtk-nniPe6EhtFtXg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: fix typo in dp_display_handle_port_status_changed()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org, 
	swboyd@chromium.org, quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, 
	Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 21:35, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Fix the typo in the name of dp_display_handle_port_status_changed().
>
> Fixes: c58eb1b54fee ("drm/msm/dp: fix connect/disconnect handled at irq_hpd")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

