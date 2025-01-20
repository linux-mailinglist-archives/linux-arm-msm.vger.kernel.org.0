Return-Path: <linux-arm-msm+bounces-45619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 575E6A16F90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 16:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F13947A2468
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 15:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84C11E9B36;
	Mon, 20 Jan 2025 15:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e/OsChjM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBFC1E98FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 15:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737388027; cv=none; b=ctIsFMopt659nr6TzqnbS3XON4vZJMBabIdviU062TvPRWPDduCvNu6Py4kr1t+dJsnMk7yiV4p8VNRNXbcECBWBEFDDMjiOYFsyTVBVdgCF5YoCamuCKeOX2WY3aYtGJqNIf568QiyUV5CtNZ/pi5jyoAPU7/7epUpQr6EbpKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737388027; c=relaxed/simple;
	bh=EsAhlQ0kdVQQMdYgyq9N0u9/sT5XQUAlwZrK1lWZYQo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pjAAEn1UkScsGBXTZDPBC6bwV/Rm0u/1Miz/Xz13L9ZsJIb6/eJM2XZZKt/ibOfS3R65ntZFKtd7ffqG8Pbp0L9bvrT+CqQwzg3bJkaog35kod5zuQK/r7Bf+/t+jUJqWyY1Euyvx/f4F/wFL8qPZHiL0v9ezwYNVoOGnAE5yIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e/OsChjM; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385e0e224cbso2439505f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 07:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737388023; x=1737992823; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SUDe9mhZqr+E1Mw9gwWUdqElFVGIfpTqsFjD5jgI8hU=;
        b=e/OsChjMDiiS86fx6IiCDvf4/EJXdrNSZCwj/Z5xAsmL4+vqMIImB2x0TVTjiJFGu0
         ZpQnCy5FmiVBRDWXfSEVR64JxUDsu0jTbuxmkhZGIc7hEDPi5juYaBzRrX4JYrBaxX8N
         LQWgm6//bCSIlKWvF/ck1jHRdxBFXpmzb0wRT9y2/9ryVW368HPcs4pLSYJ9fbczrbQH
         aSXGOsgmpAyU6SwOjC5OcauYLrCrQYYbgLmLgK84rAgnZvo/zGAZSKvsW3YXLIpUocHd
         bXW9U5QO5uqNCU4GM2WBSf/xo/IojLbiNgtjkfPVySoiv3dBM+aPx65q2dQoxV7Hk3Wx
         YftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737388023; x=1737992823;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUDe9mhZqr+E1Mw9gwWUdqElFVGIfpTqsFjD5jgI8hU=;
        b=qsDFPqu8ciRsu8LRU5guwBLrQJQya3CfmaJhXAyeL0Vh3ayht5SIqTdgRK1KTX6DAB
         H55NxyORIiAzmjuOCrGUQk35DW9Rzz0aQ5NKTTyvSbMYQ7yLxzKn+0HCa7pgyLGTSUIR
         dRaAaQEDZt4/WQmaHpFhDXk44eg47coDH89YY9aifRZmscgQdU6T78Sbcp0QDoliStdY
         L+/swIDmeJChxflPjmrBzPDP/MsErdYz0f5YrFZE4+RSP1gvvcsa9k8kYnlkuJjK1WDo
         s7Lhyzuwr7xX1KyNnZuk2gXM0VNHHD9hconfhiJqckDahZUaaMcDSdBlFZATEcKBAViZ
         dNkA==
X-Forwarded-Encrypted: i=1; AJvYcCXCPMbEJ/z1HUd+oUb/zicEJQldtyNf++458mVz6k7rBHHQFCqY5l3l4EABkNPeS9WhSXml370/MUEKnOOH@vger.kernel.org
X-Gm-Message-State: AOJu0YyJNkljLWhLivJRYvcnQ+DYPhs8WK52NAHvEGKwp51FCOxOgVsj
	9pc7HlvvjyaA5CYpZLJVyoL3ZvpDsEHFE/g/TioztRbKfd0MP8QnKgEqhDpTu9E=
X-Gm-Gg: ASbGncvIkMMbF9SsBdaqWpqBiyN46O1haPs1mEsupZ0KRfPzZFSerVFrB78xuGNGMcv
	mitqHRFNQdVLx3bf2fno8Eb0ID1EXbtQ4nl0F2D55NhaldlLRjs3COu1hy9++fp5LU926t6+0Q7
	MpJmBOpBfL2i0AfoqVjYdXZH4y2JGFPhVCSEd3fYp0YtWMij2Z5Rkh1T2z6Kr/IcgZDo6emmarp
	eBY57z/uXmWPEb+FTUbP+6qM/hbcBiMSd/+2aula1GFbfFUHnN4Y9f+J2Ycrvq+LKywxw0jMsKz
	+PU=
X-Google-Smtp-Source: AGHT+IHYiioEspd9sOgHUo6FBLS4ezVdWMaTajgnWPR1Pu/oxB21vkHQXcIcxGmXumFNsSWAWI5SBA==
X-Received: by 2002:a05:6000:1565:b0:386:41bd:53a3 with SMTP id ffacd0b85a97d-38bf57c0716mr10912886f8f.50.1737388023115;
        Mon, 20 Jan 2025 07:47:03 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b70sm10645766f8f.26.2025.01.20.07.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:47:02 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/7] media: qcom: camss: Add X1 Elite support
Date: Mon, 20 Jan 2025 15:46:57 +0000
Message-Id: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPFvjmcC/x2N0QrCMAwAf2Xk2UBSqHT+ivgw2mwLaJVER2Hs3
 1d8vHu428HFVBxuww4mm7q+awe+DJDXqS6CWjpDoBCJecSn1l/DKu2LISIxdtdYEjER5unljsV
 0E8NUchTiNF9lhN77mMza/q/74zhOD/JlsXsAAAA=
X-Change-ID: 20250119-linux-next-25-01-19-x1e80100-camss-driver-8dc5e018f6e9
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Depeng Shao <quic_depengs@quicinc.com>, 
 Vikram Sharma <quic_vikramsa@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-33ea6

This series adds X Elite support to CAMSS.

This drop includes support for

4 x CSIPHY in DPHY mode 2 phase 5 GB 4 lane
3 x CSI Decoder CSID
2 x CSID Lite
2 x Image Front End - IFE
2 x IFE Lite

Dependencies:

link: https://lore.kernel.org/all/20250113043133.1387162-1-quic_depengs@quicinc.com/
link: https://lore.kernel.org/all/20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (7):
      media: qcom: camss: Add an id property to struct resources
      media: qcom: camss: Use the CSIPHY id property to find clock names
      media: qcom: camss: Add CSID 680 support
      media: qcom: camss: Add VFE680 support
      media: qcom: camss: Add support for 3ph CSIPHY write settle delay
      media: qcom: camss: csiphy-3ph: Add 4nm CSIPHY 2ph 5Gbps DPHY v2.1.2 init sequence
      media: qcom: camss: Add x1e80100 specific support

 drivers/media/platform/qcom/camss/Makefile         |   2 +
 drivers/media/platform/qcom/camss/camss-csid-680.c | 422 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 136 ++++++-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  28 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-680.c  | 243 ++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 324 +++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 11 files changed, 1144 insertions(+), 17 deletions(-)
---
base-commit: 0efbd85873320a5ed76c9505719a3b383c3b8815
change-id: 20250119-linux-next-25-01-19-x1e80100-camss-driver-8dc5e018f6e9

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


