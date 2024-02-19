Return-Path: <linux-arm-msm+bounces-11669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F9085A35D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1264B1F23FFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 12:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909E9339A4;
	Mon, 19 Feb 2024 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y4nxilcF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E5C2EB1C
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708345850; cv=none; b=Qba7qLLr9n+AfKtivj8M3i/xJ9Uw6uTs39iS1RgbpNaw9obE0IbK8YSuCMxmoqqeszKJAgHo35jCQCJlA3WJg9zs6e64x3V8D+2GNX6/zAfHJwCMiV4IrFd+LAKJdS61mmz4Y4BSNF93U/wUMe4sOtH1JBAlGtbFD7SgyI/yBEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708345850; c=relaxed/simple;
	bh=ZSygPkfC30/eefu+ciKBDcNMZ+C7PmsJgRdlCXu7o4o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LSo2S/ZR1vsHc+Qrjy6qtlh5Qf/xuL1Nivr4BsBeChj5LJhkwZCfOVH2kYbyM43geWPgcZg7AdMfG1pexGDKSer65asjKKu0ZvJ/t4p2vF8bjaiIZ3/2AmaJSZvChpXbVf0Dv6NwOSrbQJtWcPYuZ6QGVbNZVfdZFUeuJ+vPVj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y4nxilcF; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-512bce554a5so477977e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 04:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708345847; x=1708950647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvrkezDo1rHjICZL2s/PVn57PqWpvp8fU/617NnrWFE=;
        b=Y4nxilcFDHvxoKsxsS+eRZoLqbYp1FHMM5LzVyk1/FrJ/vdEnV1WMVZyskmLytEjvI
         y69hJPpTm0+FoZO/911ynrgAAmSFf/AvSiWBRdQBPpD0BVB3mdSlGdrRsoJDH9/9TIUF
         qUq6tbiTIzy0XTWvDY+fOKvZLc3M8vZLDG3a7RkGdwHClxOqTwR/OH+pRQtzCUrVzaM+
         1hzSy34xzVBegiTkez3vtJdLHSvgXOM0SdcChVfNq5oJBF64LyCHGGAe/pyuFNlslCPd
         1/dmYvYsmUmPd8S4y+wT3PwfL75n3E9DNiAuT5UksLPZKIpe7rKQ/8keY7+YYOIS1qB8
         DGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708345847; x=1708950647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvrkezDo1rHjICZL2s/PVn57PqWpvp8fU/617NnrWFE=;
        b=WuRpws0a6DuhM7NMvq7SV7mQ/tYxuENpR6gJ9smCxnIUOhIImb1Q5tSTjEEoMzvtB1
         lR3R/TJzddNuPGXmQggZayLWRqqtKbbTfSzwja93WbZqPVubNGLZV4htxefSeM/KNHF0
         bEjMJitnL1gQNwWYey5HAn6Do2GK/IpvQ9w/UwpxkMAjs4drjQKUzKA76lLIQiNIuojp
         TjE7kvqfXHppp3G7ayGWgQld9G2MjifCnJbKf8quxncShqlkU66djrzCZ/KqViy0qFRU
         NjmrUgtqGyMHMZ78nTzTuR1cU20cIw9BRolT/fidWHnIzcpPp79y6XnVFJ7fo6umxsev
         goLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ2sgHndJ4w4R52eGwnpuuOVm/VeT4zFnigF9Qq2IBt7D3o9x1dYVV7yZTV1ZbTq4Z0KveMrG6ZgRwF8vwChIIzdb7yS1zodiUOQed7Q==
X-Gm-Message-State: AOJu0YxqC9CSfYHMccI1bmKQULf0cv2O6aVbX4ywRvxH1QO9Y5RcfYgv
	/OGSqCmo/GUgXR2yOBumnXvIxlDUcGi6i4T1pbbpzfqGF8f3xzZybRgiPkmMdbY=
X-Google-Smtp-Source: AGHT+IFDU3sQwKWrHgyZRrzoOm3yG95OWAiaYRW2V2ZKFFmF/CCC8Nh72finlmtQYDZPlBB5ipFAfQ==
X-Received: by 2002:a05:6512:3ba5:b0:511:2e7c:768f with SMTP id g37-20020a0565123ba500b005112e7c768fmr10094521lfv.46.1708345846969;
        Mon, 19 Feb 2024 04:30:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:30:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND 0/5] drm/msm: cleanup private obj handling
Date: Mon, 19 Feb 2024 14:30:33 +0200
Message-Id: <170834569500.2610898.14807948698250442590.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
References: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 03 Dec 2023 03:05:27 +0300, Dmitry Baryshkov wrote:
> Note: I'm resending this patch series as I haven't got any feedback from
> the drm core maintainers to the first patch.
> 
> While debugging one of the features in DRM/MSM I noticed that MSM
> subdrivers still wrap private object access with manual modeset locking.
> Since commit b962a12050a3 ("drm/atomic: integrate modeset lock with
> private objects") this is no longer required, as the DRM framework
> handles private objects internally. Drop these custom locks, while also
> cleaning up the surrounding code.
> 
> [...]

Applied, thanks!

[2/5] drm/msm/dpu: finalise global state object
      https://gitlab.freedesktop.org/lumag/msm/-/commit/49e27d3c9cd6
[3/5] drm/msm/dpu: drop global_state_lock
      https://gitlab.freedesktop.org/lumag/msm/-/commit/abbf3108bc63
[4/5] drm/msm/mdp5: migrate SMP dumping to using atomic_print_state
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f9c27e649a0d
[5/5] drm/msm/mdp5: drop global_state_lock
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ffa0c87f172b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

