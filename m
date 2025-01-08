Return-Path: <linux-arm-msm+bounces-44266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCC6A04FB6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8272318879CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 01:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B051A7046;
	Wed,  8 Jan 2025 01:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ff6CKKif"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28DA86AE3
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 01:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736299740; cv=none; b=gfAfLdbEZc0EKMmMoNv9k2UOngT6eKAF/uEUJPjQaLtDi4fPXq4bHaHPz+9PSwqxnZwI4WK/GImn49gJ4ETxkSSnia0U3TIR8ZgFJWQPu2W0nQlloyhWxW+9IV9/4duoBN7S6fI7eSNGW/yobhSYL1r/ng8KWsIn5+WCx7z5J9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736299740; c=relaxed/simple;
	bh=5zubYY3zABlZ5Mj79nxt1+Y1cBxawP+c6+xykDpJnXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gefxWVLz36WbOk8dNX0YJlT25dx03jlSKMdt1HtEPGTeJ2bt82kK5yUfzirHc55picf79azsPX7jnbgzmlXyF3JEkhanhHGIUnCShxmUf4VHftXIbWmiDEaWeR1x0KhuaYc0hGVI7++iEyt7Cb4Ry0i6mT3fJvnqkUUkU4Jz62k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ff6CKKif; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-216281bc30fso22196165ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 17:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736299738; x=1736904538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffCbyZidm4yUSXcZ/TPGQgF5jycQyA1Mr5Btdy4Z8FA=;
        b=ff6CKKifk6rzvT7CB+l9IXC57TTANSF2rUpoGziP0szUnCmoaWxCOsYQoLPnKlBI48
         kwOu1lF+wPKc4j7ZtCI78o1OV6Rkjdt8k8+m6FT1kpOwA588BvMY8Pg2Qg1C9pScf7dF
         V84N98MN7ocGSbzs9lfIGt7KubA3v1plKM8ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736299738; x=1736904538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffCbyZidm4yUSXcZ/TPGQgF5jycQyA1Mr5Btdy4Z8FA=;
        b=ByEXTvmOiIQ83/1JN3iwp4xusyaBGC6+PEfUcYcU9zh8zrCCGubSM/dc4Z1XswQ8hL
         fj8CufWknLMR0AS/zqayuXx4SWsMyruORtJvZlr/+0sq7xgs60RB0H7ypE8plOYEjmGr
         YvOw3PsL93jFyjGwQ4DkKrQUeLjEuf+wYsKold+6+JmpsxyEg60FaYOn8LhZje/XjWxS
         +V6cId+W4zfL791YgdZkB+cKmMumEY3BVivQ8uJ5icbQS3j0FAYzCcY8eJQwd2uI5BIp
         zZKUEpIYH1a8tFjGhUM45yYhmNrPEAlyhrVOUC4q3igAEca7w3JgG/QQZV8ssnXV8H0e
         w1GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy9gVk7JMrfGZq1dr0mlKJjguUHdvVuhiMxZbPqoigVjexwoOHAABlT3C/VGvs3sVcn1AIxTvyxjGJHYJi@vger.kernel.org
X-Gm-Message-State: AOJu0YwmRjRuRMUQeqUIM/ykhle3hX49oQaiPfd8mqO/3VtXrTwHMCB8
	G4RjU878iSseJRvt/3Fqz1aqVshKqgwBo/sRgID3zq0p2LgWZ1MPQNSbYJ3oYg==
X-Gm-Gg: ASbGncuqQFRMNNRs/AZERa8c/sEs7Izdmu67+TwvIlPDxvfanobSPNXCKyY6mqJYIqK
	24u+WOM37ZNx35mUk0dfpcqAcR9gwrra1Kwos2t7mezF9GPrZYKdZ2nR5eOO79mP580jy+2rAqW
	mFeXq+10++19VJ6xjOuejg0j2kqvTNDudsxLzZcQqy8xuYCitd4aC0k68ghrkkwX3pi85TsmZJm
	uFj/GsPpI0f3zqYE2XJDTSCgknWBuB3kT/tlRoVBwyNLDJbFnwBhAWk4WQBdSYglyzAyzaLSMLk
	Va2Pa99xZRNR1NyW7YzF
X-Google-Smtp-Source: AGHT+IHCeMvnncVDMOJc7OiMB5lgPXTsD1S7AH7eB+5fQgbjHbeY0walQs9/plkYtVkogihuKxqjag==
X-Received: by 2002:a17:902:b18d:b0:216:1543:195e with SMTP id d9443c01a7336-21a83f3f501mr14970345ad.5.1736299738102;
        Tue, 07 Jan 2025 17:28:58 -0800 (PST)
Received: from localhost (129.135.125.34.bc.googleusercontent.com. [34.125.135.129])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dc9d4474sm318577745ad.142.2025.01.07.17.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 17:28:57 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [RFC PATCH 6/6] arm64: dts: qcom: sc7180: Add SoC specific compatible to soc node
Date: Tue,  7 Jan 2025 17:28:43 -0800
Message-ID: <20250108012846.3275443-7-swboyd@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250108012846.3275443-1-swboyd@chromium.org>
References: <20250108012846.3275443-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow an SoC driver to probe for these devices. Add the SoC specific
compatible to the soc node. Leave the original simple-bus compatible in
place so that everything keeps working.

Cc: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 76fe314d2ad5..257890a193e6 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -782,7 +782,7 @@ soc: soc@0 {
 		#size-cells = <2>;
 		ranges = <0 0 0 0 0x10 0>;
 		dma-ranges = <0 0 0 0 0x10 0>;
-		compatible = "simple-bus";
+		compatible = "qcom,soc-sc7180", "simple-bus";
 
 		gcc: clock-controller@100000 {
 			compatible = "qcom,gcc-sc7180";
-- 
https://chromeos.dev


