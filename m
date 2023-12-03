Return-Path: <linux-arm-msm+bounces-3123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAF28022EA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A677DB20A3E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250B7D309;
	Sun,  3 Dec 2023 11:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z3GgnW1z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309CFC1
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:26:45 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c9f099cf3aso12991261fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701602803; x=1702207603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYIyCDkC/kqd/JcF0O3oBfyGO8lhYZEcVarBXABCrBw=;
        b=z3GgnW1zBXtX8GUsY3VMT/iYFhJgt5Evr++/HawDhuw647Obg68L8xyYvUqt4VxfEG
         l4ZgcWU3jej5yo4836ZuH9m1U3r7amPJ7uXrK0IhnA7Qx5Oy5uIyjuJ58KdhdgEOFkAh
         XaMRs6sT75GmhoRuCuM8bLVKCcsVBfsxuhOVgT+1inxCZnva5Wywi6+3QD+iWpHDTo/A
         wl2iGzwAwL+0Zze9hs1l8BiKe10eEhR/qMLS5AfdvSnE47fqUQeC9jtondaY6/VhS9tv
         e4Tt6IAzmbn/Lvgz/NXkX1SNvhEPylVvlD6ZELvDGb+xu91Od+fmTdE/0xP7carkSU0K
         ZNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701602803; x=1702207603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYIyCDkC/kqd/JcF0O3oBfyGO8lhYZEcVarBXABCrBw=;
        b=NYDGF1YnznynrmjVfLXxj1vWOykyqzsIBqyS0UaKa5SXz1ZqgY+zDUa5sWQDRi1g7u
         cqwz13bpAVTSF/IZom1lwIip3B+f+z31wrgvKqJLOnEkYYBOX61dQ+wR35oXIDDra6WO
         TVeEfALGrKQjN83Z0oACs6bdrTQAU35qqq3+gLmhiqNQx9srF4onbmKu092LZIk3YQDX
         7EmaSH28ANjTlbVyE7+M839lp7pqGnxkgiz5Ih+89iORGvlzoI1K+UryNujg8dAM1AJI
         r+a5dKBXELOUjTJ0u+9dMnv2hjB9iok6GFr3MhmsEJ4QUWBxDk1zxb7WqY914GQhzaUG
         RVAA==
X-Gm-Message-State: AOJu0Yw9Wkqse9/zCePxazm8nEIs0Dsf+goWOiS93f2B37/Y0RHc3Wws
	yQ9xlsKz3PqqWUi1mxqJglESxw==
X-Google-Smtp-Source: AGHT+IGkd+42bCTta1PfLIbw2fWVI0/Gsi2Zxy2u8tGHbjUtLnbjt5NNhDwljHVNXb84baNOjl2LcQ==
X-Received: by 2002:a05:6512:23a1:b0:50b:d764:76ef with SMTP id c33-20020a05651223a100b0050bd76476efmr3048680lfv.126.1701602803553;
        Sun, 03 Dec 2023 03:26:43 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:26:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add missing safe_lut_tbl in sc8180x catalog
Date: Sun,  3 Dec 2023 14:26:28 +0300
Message-Id: <170160265538.1305159.8059575871895403270.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231130-sc8180x-dpu-safe-lut-v1-1-a8a6bbac36b8@quicinc.com>
References: <20231130-sc8180x-dpu-safe-lut-v1-1-a8a6bbac36b8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Nov 2023 16:35:01 -0800, Bjorn Andersson wrote:
> Similar to SC8280XP, the misconfigured SAFE logic causes rather
> significant delays in __arm_smmu_tlb_sync(), resulting in poor
> performance for things such as USB.
> 
> Introduce appropriate SAFE values for SC8180X to correct this.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Add missing safe_lut_tbl in sc8180x catalog
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7cc2621f16b6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

