Return-Path: <linux-arm-msm+bounces-32259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E36C98431B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 12:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16155B28D4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B712E177992;
	Tue, 24 Sep 2024 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NVwiXJcw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C6D176FB4
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 10:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727172393; cv=none; b=iK8TIt1ESAlzLCNyKrb4n5esYwU6sGnrOwEyo0TjKI9Hg4/JG5aD2DyGecxEsbG7R2JbQoWhF68+u3H+RDbazTxO61xFRqI3xl6MHTTcKvNi8fD/Z8IE+yHHFOCBsFSND6jzEoaeU6qAmtpXJY9vUlBRsKSk6YAXiEBry5nBBi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727172393; c=relaxed/simple;
	bh=k4KlAGXh4ZhoNVOj+GmoOae0vh13C69gHyii10Bpp8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JTO6cCU6L45GMvP5xXB9VY0RJm9ATREUb4kvZWKC1rggjs2g0jQUb8klzJcz8IkM/NChkoEmud4F2tEjErfGBbammNFuur12O1piv65JHKPhmPpWeOZQeTEe/GWpyDHU+XiZsEfzJhJYlc+AazOutLtuQ9d6oUMH1fVbyOa9Aeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NVwiXJcw; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5356d34ef19so652540e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 03:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727172390; x=1727777190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuPf5wcpYTuwtsDhcn0pvrCBSJatT3E+g0dWwC7g/+I=;
        b=NVwiXJcwBolOmkmpVN9B6+adPtXDK2JB40TSXazjEQzQeRVbCD4fiPn41U0aUBWDgy
         NTbFyYTpKc1ju7iCO5yj534oMQ4ea/GVnuMQRdkQNUeE591ktc+gUDCtTQEVwTi1KKNN
         yrNEtpfuEUvUqChOdYfaO6NZMGBdOYmuFPIbNxGg//yG/LoRFNFCx4mrepXSnuA7vA64
         kgTGIy46rkKqBSo6aYl6avh75mcc3BFbAc+zyOfKc09g/rFlrV5L++hi+0sRFuKV6RSH
         nkEXJRQg4lF6T2EnVkGIYKeUJgkQYEjSVeUTmN3+/Y/8Dka11FmcZ6M4avce/ld3rpCN
         HxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727172390; x=1727777190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuPf5wcpYTuwtsDhcn0pvrCBSJatT3E+g0dWwC7g/+I=;
        b=tm/x4LXSBSz1jNmuECkfFa3lv6EEtkedizjoDjHUHnSfF6Y8eJhOxl6gUiNDn1GVaX
         YoqviMd0zKO7f852DIol7k3QIxWJ6eazpr8YDeENtwT3vyMqR3kcmzWfH4zEzx6bWei5
         DZW9+rVgsHU9zB6PZejijhHr/hvjCBE4rnMPisEw9eg4CPLv417jqW6kmerw5aQcpDQ/
         GLH5niP6qvjGrdGr3FMfQp6wkGyt98G27k3ygIBUE43xpIrYvJ/zxs6yx+KzYsORQOif
         K+KMTRJ51PSf6QQxqntm/mo5ONn/OBTHc8on0Pn9S4M4KjlQyrZaAsHXf5kJKNl0bECc
         6ZOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcnsGLY1g6maR+XSsXypHOvY6OC5LBDijQORgjw2haLjro+uR+pERZAIWLfQ8oBftW7rs9dGY66so2IB4y@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/40j8XMmRDqqb4WUWZWA0q6KMcgOEWZjtCokT3k/U1MgooE/o
	BCi6n3z4r93Fto2EsYWBrn3PjnsLhi7tsk8cw5aW30pXV7IGxun9/fMRJjMFsOs=
X-Google-Smtp-Source: AGHT+IHmLtYZaU1Zk91moHDHsBUU4FekfVpxk5T+jz2XbND9hZFQIHw7d9uhHjJAvCCFsqWJ2Ouh6g==
X-Received: by 2002:a05:6512:23a3:b0:536:7362:5913 with SMTP id 2adb3069b0e04-536ac2d0367mr2290045e87.2.1727172390061;
        Tue, 24 Sep 2024 03:06:30 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864d937sm156713e87.273.2024.09.24.03.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 03:06:29 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 8/9] arm64: dts: qcom: sm8650-mtp: remove status property from dispcc device tree node
Date: Tue, 24 Sep 2024 13:06:01 +0300
Message-ID: <20240924100602.3813725-9-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
References: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After a change enabling display clock controller for all Qualcomm SM8650
powered board by default there is no more need to set a status property
of dispcc on SM8650-MTP board.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index c63822f5b127..0db2cb03f252 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -585,10 +585,6 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
-&dispcc {
-	status = "okay";
-};
-
 &lpass_tlmm {
 	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 		pins = "gpio21";
-- 
2.45.2


