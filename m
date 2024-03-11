Return-Path: <linux-arm-msm+bounces-13787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4EB87794F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 01:33:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 354201F20F9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 00:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3622801;
	Mon, 11 Mar 2024 00:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G06A5gyO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7069622
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 00:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710117210; cv=none; b=qniaq8/RU+JdMlp/onCKENVK+7sTA8V55HtgYWRa8ZWIDhH3qVO+qN1gDOOYaaA62ozLBZgYilYsAuDg2vvId5Lco2LMrdfxqU9f6FWvySgjFbxNnDh07koqPWiT6WE+DxZsV9rjHDQxDVnGGNzz3lbUGngXBSn41erxye33nlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710117210; c=relaxed/simple;
	bh=q3MFamMIr6NFVpUFcDH0jWX4vsZYOAYFx1MyZtEqvyw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S9nWjyvZwtF22Tk5i+YqIu0SiZIGlID2eKHOJ1+Rpx21ZbUn174a+ui1ZgH164CztKLK8ncSGu4xbnG4wJ+cro4mHjx3JZDyMh+xBY/FkPfyUX0RZi59b4Mk2P/bM0YpD1EvZeAKy+GeqULKzRfQiz8e5cdE1IFCYsPHgSck3Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G06A5gyO; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33e7ae72312so1985091f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Mar 2024 17:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710117207; x=1710722007; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mfyiNRPXIKA0wIGpSVJEarVeJ6YjuAYZ6W8XU9TBWZg=;
        b=G06A5gyOSWhOCdfOvpciP7O2FLtr30VEiftt/DxtYfV14qmKq7XDpfFAEJnhtoUH2Y
         RTF8Y1mVo6eMhN6ONniokvzIb7h1tdEIf3+8KAyxdmoD9zlJ81WPOzcJUlsOQup71Llh
         SO04Nn+77qKjtPZD91xoBFL4CAKgJCaE0phv3vxhmlzck09GpfkZgZSSKOcC2vWGCv9m
         kCA8HcwikSpbcyQsjPfFCGu3S2jQOJqP/ag1CdcwFCI/DmqS99t5s+i+/sIRDwwCCv97
         rrx5WeeXQglQznyprjrrFZXIN4sP8MTMvt8x0n96iRW6HWnOvf8wPgXiOmxB9bTnm6wf
         t2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710117207; x=1710722007;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfyiNRPXIKA0wIGpSVJEarVeJ6YjuAYZ6W8XU9TBWZg=;
        b=ouw2Ot+cZ+6AAQY4fUyFGOG7imh1D9b6miTPZHWSlMLmHmJarSskfy7VxUPAqD1RYy
         jkENrVpXcOONxwOEjsD2MoAwWWlsTv2s/fOtn0W+Xw8NYZerDJqXKvKOOjJe6s/yrLy9
         It0lNxXMaQFlarx7zcoheK1Ds1OltyQ0/DJoPruWRitMkL4VxhVzzpPs/VVFSF0l6KOD
         UY2g+dNZvKHRBwqxSP4SDkofSNHw6HSPOYCSzPzVdlDqHGHt+IFrNaq2YO52LNjpnIJP
         yK92EqS7DTI+mfd0NVPfZpG3+dVOYf1SvH9f2K0qPhmr0/ACa/zrU4CNVATl2h87gJsI
         c/Zg==
X-Gm-Message-State: AOJu0YzfFj3uEfclqGKSK4W3xazlSxwFI1kAbdJTXBFjeSDakc292MmK
	9Rw0xgxjI9qEVkACa/ylKBRU0s20vuyBduKgTir2XWrTvzIskzP3vg/q93mhwxA=
X-Google-Smtp-Source: AGHT+IFwRUunT+Ya9ZAsaCyFZIIhiHE6ops/oFZR1frJlejjxGjqW5MNXAD/9FWboTVWVIXp+oDlPA==
X-Received: by 2002:a05:600c:1d86:b0:412:f8c2:869a with SMTP id p6-20020a05600c1d8600b00412f8c2869amr4095684wms.30.1710117207063;
        Sun, 10 Mar 2024 17:33:27 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id m38-20020a05600c3b2600b00412b6fbb9b5sm13881720wms.8.2024.03.10.17.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 17:33:26 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/2] qcom: clk: camcc: Fix power-domain definitions on
 x1e80100
Date: Mon, 11 Mar 2024 00:33:24 +0000
Message-Id: <20240311-linux-next-camcc-fixes-v1-0-d126ae0b9350@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFRR7mUC/x3LQQqAIBBA0avErBvQMaK6SrQQm2qgLLRCiO6et
 Hx8/gORg3CErngg8C1Rdp+hywLcYv3MKGM2kKJKGa1wFX8l9JxOdHZzDidJHNHWjSFqdV2Rhjw
 fgf+Q33543w9RZaGpaAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13-dev-26615

There are two problems with the upstream camcc implementation at the
moment which this series addresses.

1. The camcc block has two power-domains MXC and MMCX however, the yaml
   description doesn't include MXC.

2. The code for the GDSC definitions for x1e80100 camcc fails to list
   the titan_top_gdsc as the parent GDSC of the other GDSCs.

This series addresses both of those bugs. There is currently no upstream
camcc dtsi for x1e80100 so the yaml change won't affect the ABI.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      dt-bindings: clock: qcom: Fix x1e80100 camcc power-domain declaration
      clk: qcom: camcc-x1e80100: Set titan_top_gdsc as the parent GDSC of subordinate GDSCs

 .../bindings/clock/qcom,sm8450-camcc.yaml          | 37 ++++++++++++++++++----
 drivers/clk/qcom/camcc-x1e80100.c                  |  7 ++++
 2 files changed, 38 insertions(+), 6 deletions(-)
---
base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
change-id: 20240310-linux-next-camcc-fixes-a68322916421

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


