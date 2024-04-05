Return-Path: <linux-arm-msm+bounces-16488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38251899821
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 10:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCE341F23142
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 08:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E3C15F319;
	Fri,  5 Apr 2024 08:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YvREwEcT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C810145B15
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712306496; cv=none; b=aJ5gHhldg7/CCjVwpmv6NuPcst3W4kHB2oLJtuIPSep16/N0tf6DteI5xHMmnLnmeLeanFz+CdNFYiyZ4O9HkpkXFzeayC+xtZr2eHWkGel2fyRCdWAJR22dKM1BJzVx1F5D+RJj9Tgx4By0dxOaPCEVyh9748H5FeNRrLSChbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712306496; c=relaxed/simple;
	bh=KByeQxkhl/XWYs5GJ5vtEh7jULyx8TcqbLXnGuYVMFE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZOJ3y0tABbuoycTZS3Fp04djLARfNR53GqS7Wco6g22xMrufMdFV9YwBrR+KD7bwP3xOITXHctsZfShzav60mjX0x07jd2CFUwXn0tMLIT6L6c1FrPg451U0Fbu14v0Br/8faEjRUEzbN9Eh/Uk13PexLpZCeXzXvNVz09p35is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YvREwEcT; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d29aad15a5so17030541fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 01:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712306493; x=1712911293; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UyVwl4wcBTL0fm1jyJbjKCwTiFZAq4OiQvDMf4uImBs=;
        b=YvREwEcT08EJBgaTvOU1DaxWaoMzCuGG6nJi/WOMKie4ytKWSBUI8ieKmb/2o0/cyA
         hKr5kF+2pPt96hhJMp8QaH95Khaud+hGzhhbUpg4P4tydBpuK2eSxiZSRzGFMeOW3XH8
         0VahD2lvEvDzq2S1C0ot3Ql/K23dPJAc1EXmU+HyAoounnbiJlgcUcMXh71Hb84GhLIJ
         h6IFzAv0Kcp3k8x+WgkY3dW1n37LHyGmU+PUyY+MqjhQOTLY6vNf2k+bt8TrZ2MdpPXZ
         oySCxHC3YASrqL0/Ly0KOgIe04c+9j3k9P3ayCa/kqapFU7D0wxRy7MQZ//Hob/8kIJr
         O6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306493; x=1712911293;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyVwl4wcBTL0fm1jyJbjKCwTiFZAq4OiQvDMf4uImBs=;
        b=rat7LJUOxAzocgotny13z0mI6h98wZrqwOMaWj9mUiOnq1TnpnFg3OAYQhl8fmSEAx
         xk+xnBvtYHDo02uRKOPLdwoSqDQ1vS1Q0FqCT+mZPNqJ0hIbxbbdAb5rZ3hVCUV1/IkA
         ARrxlgSnPiP6rbEvqtggxRDIhgZd5CLKZGAfkASVHV/Uy0RgxAyfZQ7ey8+uoWdbZ2Zx
         GgnPPZByE2ibD78YNaiTv8lRyJaXuS2L39pzghaE6ng4KG21VQMLxkkgxWbDXND0Wjqb
         EgxipBA98pshtIfEh1jCNp5pngz6VeBbNSOLuf0hQYoz1X/Aqu7YnFj4B8aS3GfOxbqf
         oX1A==
X-Gm-Message-State: AOJu0YzGgiS+3iP0/2zQq3/jmFuxDQPPfNDLDbzV2iO1pIkJvmxoPuTi
	C6ajN9knKTKUjhO+svHjA9u8tXyzl7ky9/RgoAAtzQs3spccnmSwUmLxyQIS3W8=
X-Google-Smtp-Source: AGHT+IHbl292QZthRyXDMWyPZYQmvgV/RRjdvK90fr35qQFnpwTw2Zvfac/WgKPYnzwcXhB1+Xu2Aw==
X-Received: by 2002:a2e:2ac3:0:b0:2d3:f3fe:48ac with SMTP id q186-20020a2e2ac3000000b002d3f3fe48acmr623172ljq.27.1712306492814;
        Fri, 05 Apr 2024 01:41:32 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-101.pol.akademiki.lublin.pl. [87.246.222.101])
        by smtp.gmail.com with ESMTPSA id y3-20020a05651c020300b002d429304a20sm116880ljn.8.2024.04.05.01.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:41:32 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/6] Add SMEM-based speedbin matching
Date: Fri, 05 Apr 2024 10:41:28 +0200
Message-Id: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADi5D2YC/x2MOwqAMBAFryJbG4jBQryKiGjy1C3yISsiBO9uk
 KmmmCkkyAyhsSmUcbNwDFW6tiF7ruGAYledjDa9rqgrJrZKPPwiCXAbBzU4wDq9YdegWqaMnZ/
 /Os3v+wGXQs2aZQAAAA==
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c

Newer (SM8550+) SoCs don't seem to have a nice speedbin fuse anymore,
but instead rely on a set of combinations of "feature code" (FC) and
"product code" (PC) identifiers to match the bins. This series adds
support for that.

I suppose a qcom/for-soc immutable branch would be in order if we want
to land this in the upcoming cycle.

FWIW I preferred the fuses myself..

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (5):
      soc: qcom: Move some socinfo defines to the header, expand them
      soc: qcom: smem: Add pcode/fcode getters
      drm/msm/adreno: Implement SMEM-based speed bin
      drm/msm/adreno: Add speedbin data for SM8550 / A740
      arm64: dts: qcom: sm8550: Wire up GPU speed bin & more OPPs

Neil Armstrong (1):
      drm/msm/adreno: Allow specifying default speedbin value

 arch/arm64/boot/dts/qcom/sm8550.dtsi       | 21 +++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 10 +++--
 drivers/gpu/drm/msm/adreno/adreno_device.c | 16 ++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 39 ++++++++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 13 ++++--
 drivers/soc/qcom/smem.c                    | 66 ++++++++++++++++++++++++++++++
 drivers/soc/qcom/socinfo.c                 |  8 ----
 include/linux/soc/qcom/smem.h              |  2 +
 include/linux/soc/qcom/socinfo.h           | 36 ++++++++++++++++
 9 files changed, 191 insertions(+), 20 deletions(-)
---
base-commit: 2b3d5988ae2cb5cd945ddbc653f0a71706231fdd
change-id: 20240404-topic-smem_speedbin-8deecd0bef0e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


