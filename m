Return-Path: <linux-arm-msm+bounces-3112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE308022BB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75A8C1F20F9A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3B49479;
	Sun,  3 Dec 2023 11:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oZgW4vza"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19D669B
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:26:35 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c9f099cf3aso12990451fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701602793; x=1702207593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmhXK4vL3E4nWjMPFEArxq3v2irEKwOONy77m2lg+qc=;
        b=oZgW4vzaIJ0QYKVsk1WfWjTsQL9R8/q1vUBt9nxk1ttQgC4b0632m5wQDiydbv5IZj
         Fr9J7DB5H7k84wr/F6qwof9hexO2hjMZiBY228kx58uHPgBxbBYGCS89yQ6gvBst3MWm
         L8lnVsm68+K7GbLIpKQEZkEi6GiSIEI3Tk8n6Q9p47KuorQguX2d+hzHMFcDyS++pNJZ
         Cm+oZHtmjUyTJ6GDrLk+fCe+A2kNB0s86DHO6ZRohsWJskkyk9xjLMAtBBRjlBXzMm7E
         oxSW6KuMdA8n6xlqe9KtPk1R/iFpBlbbq8qu0oYKoH7QL6/U88STCcMr5pgb1R0rnoHp
         rK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701602793; x=1702207593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmhXK4vL3E4nWjMPFEArxq3v2irEKwOONy77m2lg+qc=;
        b=WZOHsEyPaMA4XgQgJilloRV0oquHk9f6qAi377x5EUj3vvF3hbsX/AKvj02qdYNfKG
         uEPzGFrvBDRD/kE5Jh9/4G8ZMM1WyJWoh7ICSiZzLlaPF/AQc4zVv/GuO9rcKKihMwFM
         tciwtL6vTrPgpA4KXED1kI4BwoZDgaOOSuWdUA22zYbU+40xfSuZuUw985FlPnb22EDd
         xxXoqUSBvCJZtrgGm6lXT163E9e/BW+ICIOKOWBH7K0+J+cZV+fIcZK/9tTSGWtrufsW
         7e5CvakQ1ln3Vt/tQCPVPRUhXrBUJIaIqmjfT6MkYDNZK1EV7xBwDE0xydwyI7uWH7h6
         tDBg==
X-Gm-Message-State: AOJu0YxRKGIIJy1ArUsAOuUBlcPyvuhYMKMf3qTi/fN+P0fEy0195EnO
	UTjvtMSyAt5D0+KzbLu/xZ9DLw==
X-Google-Smtp-Source: AGHT+IHlLYyyC21TH0FtIj5NM4vWDxanSGH9w8egAW9vnCLxMxgkRyfvr22YsKy9g8OxxxGBM7H5hA==
X-Received: by 2002:ac2:4244:0:b0:50b:e4a7:93c with SMTP id m4-20020ac24244000000b0050be4a7093cmr913587lfl.11.1701602793049;
        Sun, 03 Dec 2023 03:26:33 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:26:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a6xx: add QMP dependency
Date: Sun,  3 Dec 2023 14:26:17 +0300
Message-Id: <170160265547.1305159.16031924969779572625.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231016200415.791090-1-arnd@kernel.org>
References: <20231016200415.791090-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 16 Oct 2023 22:04:03 +0200, Arnd Bergmann wrote:
> When QMP is in a loadable module, the A6xx GPU driver fails to link
> as built-in:
> 
> x86_64-linux-ld: drivers/gpu/drm/msm/adreno/a6xx_gmu.o: in function `a6xx_gmu_resume':
> a6xx_gmu.c:(.text+0xd62): undefined reference to `qmp_send'
> 
> Add the usual dependency that still allows compiling without QMP but
> otherwise avoids the broken combination of options.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/a6xx: add QMP dependency
      https://gitlab.freedesktop.org/lumag/msm/-/commit/96ab215b2d5e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

