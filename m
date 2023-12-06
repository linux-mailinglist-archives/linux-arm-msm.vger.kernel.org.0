Return-Path: <linux-arm-msm+bounces-3522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 550AE806AD9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 10:37:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C6D41F2135B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 09:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2811A5BF;
	Wed,  6 Dec 2023 09:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yv3GXFmH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E0F1BD
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 01:37:33 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c9f72176cfso47938651fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 01:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701855451; x=1702460251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9AmJwkDE0GOCanY4DoOGUdEEjQ004fTwlj8Vhw/CU8=;
        b=yv3GXFmHUzY09KPma7CuwF5PFmN6eqXT3/fEuCkrYlc2HngU8eSTtGatDv98IJ93vF
         x5jymA3A8Edzig9FDNGR74WoHTvo0vcWHw8dTkPFnENVlzgtcGTR47Ecu5tgd9dHuObH
         2hi/xC7V54wDbqOJ7rZ8Gxe65FmMEpfPF8t68q9NDmhsQ+0jWw1t8qAuPrrAfiODIrKz
         C6+NcVeyoCW0MLzaS11fZvTsFpu4gyC4OAR0c3im4h7z7HwBILRD7RRFYwPQb7ZoFiGE
         74Ip6lIyV1vlpGdF/gEbw0tFJHWKl+RxFse1TkLcmlQ2AM4TsvjEKAK/oEPmRmLUh/Ld
         6LKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701855451; x=1702460251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9AmJwkDE0GOCanY4DoOGUdEEjQ004fTwlj8Vhw/CU8=;
        b=JqgDSGG/dunQoEDU4uDAI/TycYtuzfuqWSTdGXMoU9c30sK0VRMNr84+Kni6zgUcFb
         N+vI0HcQraqWU99m5fi4CW5PrNciRrt6byXK71eW8tCcs7w17ETa4d9kAIILKCA1Qrd+
         87qQVGs6plh5D96Q19/BsvGCDnovx7yyNk4EHRX65tySwncRNSgq8GiYXXgRXqoZ1Z4n
         4vs0picZmocAsfMdDW+DtkAmbXoOWpmBEU6ADS6oawDbT9AKBfXUxrv3vr/GefhgdOvF
         Zbv1tZ+hz2qLVP5UWahY/GndMZ9rFS4bWwTEOrOqJFEa3R9N/OgsLqvlqLjAJxoFSjW3
         0lPg==
X-Gm-Message-State: AOJu0YweDYzn0m3lG9obqqZM/iJl5iTv5CvPAnScCv3vcSTObB9IKIjP
	opeyw9FWH66A4+YSfgtpA5h8EA==
X-Google-Smtp-Source: AGHT+IEY4J/JJbM2WamIhwg19X8ihrG/RFqOdsJ0LKU3kUEbxrVchenGFzk46YBsD//sLu4y397VAQ==
X-Received: by 2002:a2e:7802:0:b0:2ca:68b:4abb with SMTP id t2-20020a2e7802000000b002ca068b4abbmr209304ljc.202.1701855451548;
        Wed, 06 Dec 2023 01:37:31 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b10-20020a2e894a000000b002c9fbb50770sm1120102ljk.90.2023.12.06.01.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 01:37:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 00/13] drm/msm/dpu: use managed memory allocations
Date: Wed,  6 Dec 2023 12:37:29 +0300
Message-Id: <170185542751.1626201.7605667574857624404.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
References: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 02 Dec 2023 00:18:32 +0300, Dmitry Baryshkov wrote:
> In a lots of places in DPU driver memory is allocated by using the
> kzalloc and then manually freed using kfree. However thes memory chunks
> have a well-defined life cycle. They are either a part of the driver's
> runtime and can be devm_kzalloc'ed or are exposed to userspace via the
> DRM objects and thus can be drmm_alloc'ed. Implement corresponding
> runtime resource manangement for the DPU driver.
> 
> [...]

Applied, thanks!

[01/13] drm/msm/dpu: cleanup dpu_kms_hw_init error path
        https://gitlab.freedesktop.org/lumag/msm/-/commit/134c78c96227
[02/13] drm/msm/dpu: remove IS_ERR_OR_NULL for dpu_hw_intr_init() error handling
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b830b06f0087
[03/13] drm/msm/dpu: use devres-managed allocation for interrupts data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b19e6f7dd2e7
[04/13] drm/msm/dpu: use devres-managed allocation for VBIF data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/bdfa47d9b17a
[05/13] drm/msm/dpu: use devres-managed allocation for MDP TOP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1e897dcc4c67
[06/13] drm/msm/dpu: use devres-managed allocation for HW blocks
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a106ed98af68
[07/13] drm/msm/dpu: drop unused dpu_plane::lock
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b0311c1c4e06
[08/13] drm/msm/dpu: remove QoS teardown on plane destruction
        https://gitlab.freedesktop.org/lumag/msm/-/commit/bcc54a4c063a
[09/13] drm/msm/dpu: use drmm-managed allocation for dpu_plane
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0e00f9af95bb
[10/13] drm/msm/dpu: use drmm-managed allocation for dpu_crtc
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3637af92de2b
[11/13] drm/msm/dpu: use drmm-managed allocation for dpu_encoder_phys
        https://gitlab.freedesktop.org/lumag/msm/-/commit/73169b45e1ed
[12/13] drm/msm/dpu: drop dpu_encoder_phys_ops::destroy
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3285f4acb23c
[13/13] drm/msm/dpu: use drmm-managed allocation for dpu_encoder_virt
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cd42c56d9c0b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

