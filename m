Return-Path: <linux-arm-msm+bounces-4489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDBB8106BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 01:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2188F1F216C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 00:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C72A139D;
	Wed, 13 Dec 2023 00:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tXuP0pqR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7401D99
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:37:42 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50e04354de0so2448045e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702427861; x=1703032661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsqmSxmu0xJgdSY1TmM313rSjq49izbWLOeg9C+GMN4=;
        b=tXuP0pqRhT0bW8AdPRQYDH5/9Y8PPz4om4WszCboyOWstu7Jd8y47X5Rzz0OjWPNsc
         1cWhi3n7GT7oL1qWVFaqpCTkJ/fZUvpVwbxQ4S3xacGHO2aDg7JNtNPHYWA9y6uwgvOm
         hk1C9U+Lt8wTUapX4tufx92QEgLuLdgFwiuHN1L4jv424O3UBbl3OGxjzEzyIm3CMrEx
         kBm/HZtQBHQ6y3MHk+hgx8gGL6qns+/SlHRzLX5JchgGK7JZQ3Z7IrCxTyCIt2XWlV5F
         gozStkGRh1JogQn3zwnIm7ZPT/s0IKwAK8CTMd8aEv0vVsbAHMUTyuuhLo4dtpHv5Lox
         G7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702427861; x=1703032661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsqmSxmu0xJgdSY1TmM313rSjq49izbWLOeg9C+GMN4=;
        b=P+H+VemBOTd0lnXAJiemarMMOWU4/ENHV5tM9qinqkhnoHYF5ME3sEhNs6+2ozC2Fj
         nkGdZ7evYUAHXT+2lDCGlP94Qk21iu/mm6+DA4+CZ2m1bgIk78pSH48SUhvAAll1eD8g
         dLneRhTUAJ67oRkUFSnF/Tn6forrUg4FeCBX3rp9Y5GRtKUp5SEaiiqPqW0teTJOQ33E
         r9cW0tAXZdM8cXnFLuPW029HekUmL6fah5+xaiIcAh8JDOOa0ecmsqQ1ndjDo6SUxRsf
         3mdoGNc0C1qZjlJgoPkEBWWsaxDmdFVL3qOfqGNR5LU7i+uyeIyoLrMiKvHHAE7kDWND
         Q+Zg==
X-Gm-Message-State: AOJu0YyIyzkFrL0ABCvH8haDbr44InV/n97tP9+Mn1Q38odU31gD6ddx
	ibWpq+SO8x2hla8kCfs6D9dbsA==
X-Google-Smtp-Source: AGHT+IGnxZfmXwGRxl0TGv4YBCCiJhChbbN5+q6TcfpOdUL8OsGUwXj9gV6A/J74IBYf4XGclhNPBQ==
X-Received: by 2002:ac2:4219:0:b0:50b:f305:7802 with SMTP id y25-20020ac24219000000b0050bf3057802mr2753351lfh.129.1702427860287;
        Tue, 12 Dec 2023 16:37:40 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a4-20020a194f44000000b0050bef1c5a50sm1517467lfk.267.2023.12.12.16.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 16:37:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org,
	Paloma Arellano <quic_parellan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	robdclark@gmail.com,
	seanpaul@chromium.org,
	swboyd@chromium.org,
	quic_abhinavk@quicinc.com,
	quic_jesszhan@quicinc.com,
	marijn.suijten@somainline.org,
	steev@kali.org,
	quic_bjorande@quicinc.com
Subject: Re: [PATCH v4 0/1] Stabilize use of vblank_refcount
Date: Wed, 13 Dec 2023 02:37:33 +0200
Message-Id: <170242755503.12964.15556030852951255362.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231212231101.9240-1-quic_parellan@quicinc.com>
References: <20231212231101.9240-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 12 Dec 2023 15:10:57 -0800, Paloma Arellano wrote:
> There is currently a race condition occuring when accessing
> vblank_refcount. Therefore, vblank irq timeouts may occur.
> 
> Avoid any vblank irq timeouts by stablizing the use of vblank_refcount.
> 
> Changes from prior versions:
>    v4: - Removed vblank_ctl_lock from dpu_encoder_virt, so it is only a
>          parameter of dpu_encoder_phys.
>        - Switch from atomic refcnt to a simple int counter as mutex has
>          now been added
>    v3: - Mistakenly did not change wording of patch #2 in last version.
>          It is done now.
>    v2: - Slightly changed wording of patch #2 commit message
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Add mutex lock in control vblank irq
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b9dc09b4e534

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

