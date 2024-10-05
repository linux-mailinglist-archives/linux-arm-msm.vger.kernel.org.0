Return-Path: <linux-arm-msm+bounces-33183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 203E499177B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 16:44:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EF571C21168
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 14:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CA51547C9;
	Sat,  5 Oct 2024 14:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="hb1qbJrS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CA414F10E
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Oct 2024 14:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728139484; cv=none; b=iD2axjB6JMZoZPRep9tNV1UbvK77mPZPBWgeBfExmgSoI7ZD3JLP/8oSrEg8329zvPVh9HSPj4DQOc76862ySPR8qBDxgzcfVBX6nnaumeaXLn9Fc6Aw3hyF2mdPbe8jZn1+tLN3LCzu1nn/YBJEjN+OivoKMMbW+xVTpl8y/5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728139484; c=relaxed/simple;
	bh=iTP6cWkPIw0pnJ4b1Y/YFozqqx/AGnE1FtMJLFjEtCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SqN1d88O+kS+LHpO7MUjClj9llfbdQ1QwZVoUJl0Ku1nzqZ+YzlV3cu8yi+Nq3eGMT0ClaVcs6NJSlmn8WMsHhEjd6OWsfUrkL0zQG1BT85Xerkloz/7wsm+sCHpxZeqc3BVDz8F4V9XtESU7Y10iy73ml5x9mr4vfZ0c9ITINE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=hb1qbJrS; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4581e0ed0f2so33698681cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Oct 2024 07:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728139482; x=1728744282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m2irbHzwF9Po9AacQzMPdPlNV6/mUQD92x4MGVS434I=;
        b=hb1qbJrSr7NF+KQklYyF5TofhiqcFxcjTe7Z5C5JXpb/Rr4xAeDGT15nE4gm2ObZr3
         BbRZWbe4R+rHYiMRdtkaG8a0xLl/cQ/WppElmI5xoSTDB0yDyX9s3ZXoMKDO10jBPP5f
         DGtehv+hPiayuVoFkIf3TxwDDRDVbgH+UWFay+x1DNCGcNBzJFjd+nqPc0AjYQWp0QQ7
         2ljlbf+g2IOKfeQdIUNivrz7RbPcGAsbIUvHLf3xy0JyjsGae1Z2qEMUsAxpLk4cV1W5
         JnK6DMtP0UinyNMsUKKwRvKveQ8ZQYqgJxSW552yAbG/6/kgeT+JZHp+AxYTtkFNRmw2
         RfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728139482; x=1728744282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2irbHzwF9Po9AacQzMPdPlNV6/mUQD92x4MGVS434I=;
        b=ek9UJ8FP+L8gUjCyUQSgulOcZ5ND0qNSNd6Qzo6dbYWB5AWoIorqxRC/9ealwoh30G
         yJA04rkfmj8HCrVh9oZg7839wsD/Uu17nxBpsf6BuUWBu8h0w1oreSvs7pqSwXPy60k7
         Dok83Ly1wM1k4IDtHtlW2UqQC8HCianwLLKLP+DiXWbNsnfqDF7dmQK/bDKdyeU7sE0S
         wT/devSidwOK7am5JWqGYgv3WUUGUa/EpdrdrjMWpatC6msXc1yeE8Neynhg2+/k+pIl
         FP9LMn/oOFknpC2QDpBRaB++StQAwNt398y3dN8aB0Qjf+mvt+m3Ba/rWvc3J7Ms/7Wi
         Uiog==
X-Gm-Message-State: AOJu0YwJXIAYlUFnzt1evu8s6afRD6OhFaR3RMSOfoVtz21DpLtef95l
	3MJ/BzOx0LRcnHLGv+Da+eElPJeCL0MoQhCey/kgBFBRpm+xDhcQLdJwgtI9e2V8POL3iDWSmgp
	5frg=
X-Google-Smtp-Source: AGHT+IF3OeNdLbZZWgL3Lk8D2SFyQw+kmrlDKPxNWjaeBMLNdMGFxCRq8dzDOwoamcsj9IIQDvGLAg==
X-Received: by 2002:a05:622a:1990:b0:456:80f9:debd with SMTP id d75a77b69052e-45d8d0994e9mr172726441cf.8.1728139482157;
        Sat, 05 Oct 2024 07:44:42 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45da74ec328sm9104721cf.32.2024.10.05.07.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 07:44:41 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: qcom: videocc-sm8550: depend on either gcc-sm8550 or gcc-sm8650
Date: Sat,  5 Oct 2024 10:40:46 -0400
Message-ID: <20241005144047.2226-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver is compatible with both sm8550 and sm8650, fix the Kconfig
entry to reflect that.

Fixes: da1f361c887c ("clk: qcom: videocc-sm8550: Add SM8650 video clock controller")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a3e2a09e2105b..4444dafa4e3df 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1230,11 +1230,11 @@ config SM_VIDEOCC_8350
 config SM_VIDEOCC_8550
 	tristate "SM8550 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
-	select SM_GCC_8550
+	depends on SM_GCC_8550 || SM_GCC_8650
 	select QCOM_GDSC
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
-	  SM8550 devices.
+	  SM8550 or SM8650 devices.
 	  Say Y if you want to support video devices and functionality such as
 	  video encode/decode.
 
-- 
2.45.1


