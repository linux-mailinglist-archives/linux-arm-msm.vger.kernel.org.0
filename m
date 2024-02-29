Return-Path: <linux-arm-msm+bounces-12929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6E586BE47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 02:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16B4CB21B1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 01:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599C413D311;
	Thu, 29 Feb 2024 01:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jiPlFYOp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E1C17554
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 01:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709170507; cv=none; b=Ejp7WzXV3DVh2bfOaEjcZN9HHvGv+DSZOLYTsAcytO9YjB0HEEqWchPewOUd0hjlaYHY0tdHuVN4fG9xxpiWu0/ySF6FcjU5r3DADk113aFbYs32iN+SKh9Knl/yXTL79kj8yJ5BkiVoCmSrRjwaQZSMDZCxiOKVeaptFusCA20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709170507; c=relaxed/simple;
	bh=rNhXvztlPIMQxaT3uBcxWgppme382OuBdUXTLAuCzMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WAZlw2c9xeYt+bS8vQVvom6vvsaVQMScu1XML1A0hn26+qdxR/DEXHIkphSYAm7LfuT7ddkmjpOwnb1QqLG8pGsZcYkot9evTBqOplCLojHaZSZemheaGfBX/NsRqdkGHpIrbWnQCOvD6gm4x47g/j5g8luJJpnJh4nvCr1WUDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jiPlFYOp; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e5760eeb7aso306889b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 17:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709170505; x=1709775305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+iy/LQHSKsmIm2Ae2f5kmdkaP9KIdMysWT/fEuU36SA=;
        b=jiPlFYOpUGz9wYjFKfG1HdNQe55ZF6z44B5lFhR9TB4twaDKd8MsQ6u9kPk6n1vXxI
         APuBjVtKWLDs5IxvahQSunDhoR5kjO3OjIXtv0d8lyxErLAh0FVvaQzAbY3INgcP4L6i
         Y+kop3OMLnCpPW2Xlg904RVRrjThXBswRTBMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709170505; x=1709775305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iy/LQHSKsmIm2Ae2f5kmdkaP9KIdMysWT/fEuU36SA=;
        b=LTvQp/0RWJs1uAUYx14fu+rR7effW1DSNTngs7feHmna8NZHe/BBm9WETxvqvONCYf
         dGA7PAL4+k6khtDLrzjgiOeDauTkhXXvEUSgtMxBjo6VkKPLx13d+0CtkcKsdRR1vzUi
         Sjsj+ddPeopPgkmxr3bwx2JGlxYw/L9xl4e9yaMgoqIUkd9Rz6ajho2rR1P/rNedLucS
         Ea4EOuW8HbGyi+u0pDCMpbbKrH47SIGwZxGeaUAUhjFAgoccxAYey0HDbTM+RcJm0FS/
         DpbEuE6g4xIFbZcQ09hVFZ669zOaYEsFR1BBD7Hg8Yiba4PZQnJPm/v0ubGrdRlXnHG/
         SefQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7sDFz0f0YSJ4potkP/QR75hfXOY5oK5IlJ29uOo3CYVphMjrELladCM+FW+QGM90tCnpwyeGuBkB7vvEVExgaezBcdcgnbw++E0uxjg==
X-Gm-Message-State: AOJu0Yz90y7fPnVZDmqlBBa6BF6mOKRmn9UwdzRxU9cWN9qSah+h6MZM
	zEtZN/tkZU3SADPz3P7+6G5vxe6oBZIY93l18etV/C9O+CYd1p8EQvMNEBZBpQ==
X-Google-Smtp-Source: AGHT+IHe8q/7Uap3Rq440sONVc3d/cawGrolo7Z307D4Y05inxotsQMMYjUjiMMfqtXROHeogJrWVQ==
X-Received: by 2002:aa7:8482:0:b0:6e4:eb29:357 with SMTP id u2-20020aa78482000000b006e4eb290357mr839544pfn.12.1709170505147;
        Wed, 28 Feb 2024 17:35:05 -0800 (PST)
Received: from localhost (217.108.125.34.bc.googleusercontent.com. [34.125.108.217])
        by smtp.gmail.com with UTF8SMTPSA id b26-20020aa7871a000000b006e13a88d52esm97174pfo.61.2024.02.28.17.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 17:35:04 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	cros-qcom-dts-watchers@chromium.org,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: sc7180: Disable DCC node by default
Date: Wed, 28 Feb 2024 17:35:01 -0800
Message-ID: <20240229013503.483651-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We don't use this device on Trogdor boards. If we did, it would be
enabled in the sc7180-trogdor.dtsi file. Let's disable this here so that
boards with t he sc7180 SoC can decide to enable or disable this device.

Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Fixes: add74cad7c9d ("arm64: dts: qcom: sc7180: Add Data Capture and Compare(DCC) support node")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 4dcaa15caef2..f390bf3eccbe 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2239,6 +2239,7 @@ dma@10a2000 {
 			compatible = "qcom,sc7180-dcc", "qcom,dcc";
 			reg = <0x0 0x010a2000 0x0 0x1000>,
 			      <0x0 0x010ae000 0x0 0x2000>;
+			status = "disabled";
 		};
 
 		stm@6002000 {

base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
-- 
https://chromeos.dev


