Return-Path: <linux-arm-msm+bounces-79902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AA1C255E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 14:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 706C23BE8C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 13:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B444F34B661;
	Fri, 31 Oct 2025 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ngo7cMjc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34643347FC2
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 13:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761918962; cv=none; b=p2bmjC4GvxkOdrLS9UCqdPgSarKYSnL4ZaA+wwJb8MNLE5P5OQdsYpW/lOSB8VjI97hHLmkWfjKPBotjcL0dI172Y9cYo8J/fHNbLSsX8aN1829OX5cBqnFOMmiEoiupEyUmKJVeqbAzk4TLrKXG1BKqO29Vrb5yKEEIYLs4KTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761918962; c=relaxed/simple;
	bh=rv1lakdnapd6shhm6W5A6hAx9wRV9T1vgsYATRaDRWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VMMVD+ZuwR6HbfaTnDfDLo/k5d0vYD545dLN6jqbj0Y7T9YnBs4Nvaad09CrFQX7mVyrSXeOYoUzpUR8yfGOioHvh+lRXBpJMAq9PdPHytbbWgikRhExPDMRafE5/rjBdJtVr5gGgQm+sm4jJTWAjm910c22M+dvMDkRNgYCPQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ngo7cMjc; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-781206cce18so2675773b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 06:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761918960; x=1762523760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rXy44YBpbFQ7ccTa0IVPqx57mQ389VTun+ngC3PqvuM=;
        b=Ngo7cMjcJTEvXJfB6Y+GPqQvaCcm4ZJwuykkefHlNxqrTBIDjA26jR4JlXE16EhoPm
         6mTCMQkvtK/1N5hmxSIMbrStNI3DF0VpLmg7S+97H822TuxIpvwJplJqjIKamaT7Oak0
         EAoAcG4e0JyCxdBHJHfSa9phYGy5ALd6KUhG54mkBkASxwrEURmzfSkmixapwiN1/inN
         yEiGPlkYyyr+keJqv0cu2DTPhdDzK0Ets0GgpLe9NbHu/7PQbNWNL/fXzO4oMdExi+R/
         p09tTz7bf+vdtszbE7I6387fWNys4K2YOZ32QAlJ8foTe4zVgkzephO6WhyrkPVYJoC3
         EWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761918960; x=1762523760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXy44YBpbFQ7ccTa0IVPqx57mQ389VTun+ngC3PqvuM=;
        b=nbR6KiSuCOleKklmbbm967SdKPJ5jVnNZ14CARXQtPveg7I6Xf6aBPlHA3XW3O23W8
         UsTBYlt9HPmgICvHbLa2cX4i4/bos6Tqka1gjdwectDkNadRcJzjnuPUKju8iSaNE47S
         r4mLbzVzdT5y6VsTzkg6iL/fpxq+X3jfATCA7dkw5nr2WSb4/r/SUnBF6Q/m+R20BMoN
         pMJ0JpEJ63c17r70dfCXoq1bEL5lqg+vLO5ji3OSRpoacnsUXWpNmSLQfN4a7cp8HEbm
         VZgn5kVqWGd2LY00UWRvVibUAb6YYk3sL76kH2R3/43wNLd87+qP6n2dx1qENIHAcn3p
         g+Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXgqw56+cEPOmbX64GfdYYT4RKYqP0vFuWwZMhwaWigV8+IOi/4BgMnVtHZLSG1nFfg9TJqGWC2jIacnAEI@vger.kernel.org
X-Gm-Message-State: AOJu0YzAExJIVjionEMF3O64mW2BZEIipprUXvjYMNQ1nrA0aZtOteVE
	O5exJjdsYKmt4Re65O0zQoozgCyPoKOfTq6Djvkd/LnSMVWWBCgjpisJRzhD5ngW1Bg=
X-Gm-Gg: ASbGncu74yZOjzKxb6eg4KAJ346pHTsUVcmuHUF2EmlzY6T9sxUuB46gIaGSGJaapZb
	l1MysvFKdNjhDN8fRDeznsx6l5A4wZV3tyLdPNx89mMDxsk3b6avoV3hho5KAKYtRwhqi0u/H8Z
	S5qaSqhuT+k21uS4A0HDF4dm9EHMtqyu3dT2Bk+TgNQr3xilnR5HUI3WJDbFtxFD5nsAkXJdyJT
	d8k3JJna7cufLX7g9etxeWZgCwMDKA9tnA43iAdDdAUfCiV26Wy6p23d4gIQ4HeBzecq0n8cKj0
	oxfM6c6Ik2/sOVqSwK16YmLATmBMTPjILHXfJoaBnyXpWLOEzy44R+YzuuTlZ1WO1ML+rVfGIHQ
	YAxeW7PAG/4+utGOvJOWcMhRw2z1hqsQiEfVoSn54T3vTN7FI2vUGoDmw6Qma1AlwGTVNWa5ms8
	UlEn3/2eM=
X-Google-Smtp-Source: AGHT+IFa+KtYs1Qd2wH4XD0ttk5HSiq6KyawmAxwbjG3Kjo7lM6fGlhfsK3Z/0aCWFdV/RCWUZ3TRg==
X-Received: by 2002:a05:6a00:14ca:b0:7a6:9f96:966 with SMTP id d2e1a72fcca58-7a756473a05mr5078674b3a.4.1761918960283;
        Fri, 31 Oct 2025 06:56:00 -0700 (PDT)
Received: from archlinux ([103.189.130.36])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8d72c5fsm2302271b3a.18.2025.10.31.06.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 06:55:59 -0700 (PDT)
From: Raihan Ahamed <raihan1999ahamed@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Raihan Ahamed <raihan1999ahamed@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: Add Lenovo P2
Date: Fri, 31 Oct 2025 19:21:20 +0530
Message-ID: <20251031135506.214025-1-raihan1999ahamed@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for the MSM8953-based Lenovo P2

smartphone released in 2016

Signed-off-by: Raihan Ahamed <raihan1999ahamed@gmail.com>
---
version 4
- rebased on linux-next
- enabled accelerometer sensor
- enabled gpu and add gpu_zap_shader
- add homescreen and one-key-low-power gpio-keys
- enabled pinctrl for gpio-keys
- removed explicily added tag

version 3
- sorry for explicitly adding tags
linked-to v3: https://yhbt.net/lore/linux-devicetree/20240226195516.174737-1-raihan1999ahamed@gmail.com/

version 2
- document device compatible
linked-to v2: https://yhbt.net/lore/linux-devicetree/20240226094256.5736-1-raihan1999ahamed@gmail.com/

version 1
- add initial device tree support
linked-to v1: https://yhbt.net/lore/linux-devicetree/20240226055615.79195-1-raihan1999ahamed@gmail.com/

 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca2010..cea9698fa4d8b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -200,6 +200,7 @@ properties:
       - items:
           - enum:
               - flipkart,rimob
+              - lenovo,kuntao
               - motorola,potter
               - xiaomi,daisy
               - xiaomi,mido
-- 
2.51.2


