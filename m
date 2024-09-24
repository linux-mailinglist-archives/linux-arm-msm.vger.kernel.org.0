Return-Path: <linux-arm-msm+bounces-32257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A0C984312
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 12:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5689C1C228E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DDE15624C;
	Tue, 24 Sep 2024 10:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M5Yolc8d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA392161935
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 10:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727172389; cv=none; b=lvjd34d/wx1aNNgrZvMDJrnqZ1X7W4tF+p519BK4TWohujzzj3e7AvEkISeIBZYhJn8UTwZbmjv37N6Z8GjSfX2BXZ6NL1kI0xQ7jUmE/WQ9kNxSG4+5u68DdoR+FnDl8pcQeIZbGdC8U1Lsqa0myavvZPD8F5APaDIwrROnbTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727172389; c=relaxed/simple;
	bh=FelF0BlrAomhptuojX7mKtsehjTjjUP7bVwzo/Z4yGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ujGoMVKNGowxwtSFJx1Q76CUbdrMacIAlpwt+ZREJD6C2XdDWY2VZ2rvrcmeneGqGkia711SmTqxfPxXc/PAlqUfME52XD2L4JYET6wlx2cpLr1gng7vn94NAHFEDKDvI0+PBeAZa/NsuwMiOqKiMYkR0kbVMMQWX1d9my4YEY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M5Yolc8d; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5356a0a56f4so709620e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 03:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727172386; x=1727777186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxsVR579g6PfU5n1DCcV3zfGnweAUpswK8KEPTBCKQ8=;
        b=M5Yolc8d/k8AI8nRcL74kphGp+gc13nJAmbEqtff/Ql/U5SLySj4ddBYOwiQkixuY4
         6KXMeK+lSwzTCfvomoKb4HUXg2SYgHzcl3fipEiUTdTrWhNfFT5oi70CU4bpZMU+Tim8
         MQ94CICHQsKEb+rm3SYS4MRHh98FCGtjwmeWkhF9k0qjRomUvV+yg9ioN2uY24GXd3pW
         wpS8MfZhY8gBGPVB3RBpNTiftXpD3yb1sJr+oBfAtnIihhD1a2oH/l9+5LdTIRJfJHkC
         j1omOSzYWk6ZDtc9zvINb0JFic6cOaRa+0iaNQPTh3snTGwFNg4pqK3CmbrGkeoyTUtR
         Edpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727172386; x=1727777186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxsVR579g6PfU5n1DCcV3zfGnweAUpswK8KEPTBCKQ8=;
        b=SYFT0IbQuXhBTb25OlsDD+EnYYS6Bt0/zz6MQtoiubgS80jfP0To/CU673Lvt8A0zI
         tDL6Ob5d+deAEaW9eOPo4Z639eINuIWfmVuP8VfZ7HFPuVnMoMr1+u/vK7Uk658BNIob
         bp9HpWcvkj7crAbeqTL2b8GVKPqopWswk1YlgFquJM5bitijOZBAgc2mQA/b0JCm3WuS
         GehpHtOpkDtNrTcqFbM93HFPsj5n9sfDf8EURWKsAGIrzNlPmnjQURS2SpvKa2aDACEP
         /e36mwBAwn/eR8UC2NPjQLt11zqO1NtvWMjMd8ZsPOdTagB7ywiolH2F7mMnlZEUZ25J
         tH7g==
X-Forwarded-Encrypted: i=1; AJvYcCWW8Sgts5kLtdWUOsJNDbyp4D2QUTm0quVZKAf1CklxDN5YEeDUkPtVkBQntht8s5r8GmnEG5jCf5Wimgdh@vger.kernel.org
X-Gm-Message-State: AOJu0YySirKsVfRNidp81MH5lQ6oxH/KNTRV1WSwZSNSaLcg+Q0K2ryS
	pst90yN7/Eq81Ox+RLUkU+OsrbsGT9m1wL6RQ3vyohMVHkG5O7d0JNldYB/VNXE=
X-Google-Smtp-Source: AGHT+IHBle5v6k3PHQe43h2EvLgn5jobBnId82rcpsBc+/47zix02oWq1yt2KgTl6Ua404teiyOVFQ==
X-Received: by 2002:a05:6512:ac1:b0:535:3dfb:a51a with SMTP id 2adb3069b0e04-537a77eb8admr373866e87.5.1727172386014;
        Tue, 24 Sep 2024 03:06:26 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864d937sm156713e87.273.2024.09.24.03.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 03:06:24 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 6/9] arm64: dts: qcom: sm8650: don't disable dispcc by default
Date: Tue, 24 Sep 2024 13:05:59 +0300
Message-ID: <20240924100602.3813725-7-vladimir.zapolskiy@linaro.org>
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

Enable display clock controller for all Qualcomm SM8650 powered boards
by default.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 01ac3769ffa6..173e092b15e2 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3841,8 +3841,6 @@ dispcc: clock-controller@af00000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-
-			status = "disabled";
 		};
 
 		usb_1_hsphy: phy@88e3000 {
-- 
2.45.2


