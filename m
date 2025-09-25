Return-Path: <linux-arm-msm+bounces-74894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 755B2B9D408
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5528132624A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE822E610B;
	Thu, 25 Sep 2025 02:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/kyzwY7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E3E2E62D4
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758769057; cv=none; b=VofA+XfVv/aQD8kINyAmmwaGARL1GtpybzUWoItNupsztMn8dwUy0qX+r0coDtuZFAhBZbTiaHeHrJQzaq0jdAa5bCOsDRpJM50A94FdHsp+kCbPemf4TSGwb4chUTrVMIHpE0ih9zit9UfRI+g4OCehKAjuWusfoM4H08O1DlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758769057; c=relaxed/simple;
	bh=IY2UafMGiV6MFrTEPk+Dld7eSLB4ya57gcYUl0TEpjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uN0k0ZhQqt0jJocgp5knRNF15wBdTC4Tpjj6wWdDa3tJQET3A616u0QMfsI5UVUFgR8JRv1AKjsg0YIcZNEjEmhZMIyTp0wJ8l5NkSGltLVWu0VvJKOMYP1ZuNlOP1ZAIv9o1gsaxX1MRdN47vnuEWed/oPQZbBSlpvl6lJ2ju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/kyzwY7; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-26816246a0aso1023395ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758769055; x=1759373855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jO/X08ImXnlJLtZODeURBgewU5TmbSWs4cNn87Dfvnw=;
        b=F/kyzwY7BSANZlTZxPfqAP24j89hsLlyvnL8tLWyDuBPuJqpsBwUpd1wtIOgRnVcXf
         ztCEAVi0iI7cYaC5kLuwnkumOVOCQ4qMxiIB4JrKKFzirBDOAFUxjIbtky+QSHX1l5zv
         wel42c7vFbGmejflEwlygO/4PvP0cQQsser+K+A1L5UB+i3mGjcrZ5Nglw29gRZ0P5Nb
         FuVf9/JSG8XLL2XRMsqbatZv/B10LU1QpriUj1cMKPzO72Do3hYFzzGzYhLZNeMW6Kyn
         4YPSTWPkkjy2c/Oj/2grQ1vjw5USCOoSvwWYg4b7AUqI7VeR8tD3pkLA0bRsNsj9KxZB
         z/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758769055; x=1759373855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jO/X08ImXnlJLtZODeURBgewU5TmbSWs4cNn87Dfvnw=;
        b=IO2cV2IQG59flyTi7hzDfAkpwcPAR2Rc0aw5RxF6otaLeJzZdzriitCdKAlOV7n9sw
         W5zo6Qx7CkquFg1pdPee5cHd0OrmgosOQKS2T+vBlR71OZ1QrotE1zgjItZcLI28Nvue
         bWm9Go7CY76bvWj512QlJ3D0fZSDjTVYxG+UcmOkaEy/SgB9y+AQXD1n7uinTAs+NSli
         sIquJ8i4cwVwBPCvULnqJQ/BRJeeg8p3esGOGryf1579hWdfKCPUJZ+9+vJEUYxlNzvp
         jlb45ucv/4N9sFeIUfJ+/7G1brUW2TedtFndBvDyIdfqXXWhtq3X0dpK2aGz9Xqups9t
         /ICQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYQ9QToErAIvpfUTBdpX8MM/Frr/iEZn+OmPPz97E2KFgeOnztg1l47ULCB1QqUsMtqPWqyPwZeRK81bU6@vger.kernel.org
X-Gm-Message-State: AOJu0YxlDJNIuTeRZ4cLl/096v4Bh0lTMOMovf8XpMK9O+2WZfqM1a6E
	KOvUhhrnopmdM0NKJbqaFq+HUpeGYh6h2QOR0SJqwZwS6biFR1P+am8inPi2WA5E
X-Gm-Gg: ASbGncuEzjXfivK20ECzjLRuHd8ipP0fmvGhVjL1BkI5i0IKsi37ZEOfFE95JIIs5lG
	bDS4+XPW2t9SKcfGqt1K3Kq9l7fmR/2nP2u97Rlbpga0YT52RSdi2T+Qq2qmd0NgK/r6awzslqC
	MzoiQVP5QWbR+zzWDIQKi07GRnclHxTNUTSqPYfhy2Z1Lsonpi2NkznQvbjtovWJy9EF+IjP/h/
	f8yyIm1kpz7xH0WJnIhQZkYzKNTE43EsQn64e++aZ+5tIlyAjjplp6rmV3mH1i/YQdo+BhrVwOr
	mj7AlmpXmVUTH1RomGtb6sO2SeqSxNJ4V0sPmLHFCh6D3ITEue4jxj77b32xFoBQBkCSV1oJWqL
	SpfQ8rfUxOkno33ytBUE7RZE=
X-Google-Smtp-Source: AGHT+IGhAyjSgkqQcjQzf9J9hcNvGanR1Lw4+TA+GtCM6Eqw/j9sgyv1kMSgHwLk1Yp+OR0ToC7EWw==
X-Received: by 2002:a17:903:1d1:b0:27d:6f24:ceb9 with SMTP id d9443c01a7336-27ed4a16b79mr12216545ad.3.1758769055210;
        Wed, 24 Sep 2025 19:57:35 -0700 (PDT)
Received: from rock-5b.. ([45.32.55.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ad15e6sm7402485ad.143.2025.09.24.19.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:57:34 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: airlied@gmail.com,
	broonie@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liujianfeng1994@gmail.com,
	lumag@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	quic_abhinavk@quicinc.com,
	simona@ffwll.ch,
	sophon@radxa.com,
	tzimmermann@suse.de
Subject: Re: [PATCH] drm/display: add hw_params callback function to drm_connector_hdmi_audio_ops
Date: Thu, 25 Sep 2025 10:57:14 +0800
Message-ID: <20250925025714.20121-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6mq5morx4kuwmxa3dhpxf42uqedtveectlbeodl5oj74rqk4gy@oweda3unauqj>
References: <6mq5morx4kuwmxa3dhpxf42uqedtveectlbeodl5oj74rqk4gy@oweda3unauqj>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On 2025-09-25  2:18 UTC, Dmitry Baryshkov wrote:
>When does q6apm_lpass_dai_prepare() happen?

q6apm_lpass_dai_prepare() happens both before and after hw_params/prepare
of hdmi-codec:

[   14.055198] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   14.067225] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   14.089925] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   14.105988] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   14.106027] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   14.122707] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_prepare() started
[   14.132017] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   14.197843] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   14.633992] msm_dpu ae01000.display-controller: [drm:adreno_request_fw] loaded qcom/a660_gmu.bin from new location
[   14.635452] [drm] Loaded GMU firmware v3.1.10
[   15.929293] rfkill: input handler disabled
[   19.406507] qcom-soundwire 3210000.soundwire: qcom_swrm_irq_handler: SWR Port collision detected
[   19.415672] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   19.465864] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   19.581446] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   19.693965] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   19.694012] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   19.706621] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_prepare() started
[   19.722543] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   19.775071] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started

Best regards,
Jianfeng

