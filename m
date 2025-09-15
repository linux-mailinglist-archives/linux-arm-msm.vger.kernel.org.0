Return-Path: <linux-arm-msm+bounces-73532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 680B5B57586
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45B4E16C22E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFC42FB628;
	Mon, 15 Sep 2025 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E65XAi60"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A062FB0B8
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757930793; cv=none; b=EWElcVMFUXP1KmvU5Kfg1cqTQzxvLLhYz2VwfBOPpkLmHXBgeGhvSOXo3PN2uwKw15ZWKA/5kJQ4WDyDeoFfqz1DKrTGKQ7HcA6Gy/qTonJiXLWf2MNRdK8SfCMcONTHhxzlMXNDbe9yJHC6AIBf0FB/43QfUibX777O4csJ9jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757930793; c=relaxed/simple;
	bh=MDfCdJ5kvasHFOiBfeJtUTsAbDg5HADtacgIr04WlG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VS/jhSi0s4SsdC8KZ9rITP0WsMpC9UT+0Xo66Gs3JovLwSUDXPsrn/hvVOu3Foc0vSfMhS0D1ucWECZpsrjJvRljymz5nyQLi80mI4yQr7bQMBniZyS6Odn1F1mb4g2Rdn1ts8dfAFmfxMxVsAARK4mDIhMdVwMWQhy0WyY3dCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E65XAi60; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3eb0a50a4d6so401117f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 03:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757930790; x=1758535590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6bLhOy3aQ+nTIsBm75KhRBxHYpZEyRQkCJbrV2nDCs=;
        b=E65XAi60IZKN+J2NYeEbIoFYBoNf3nsKm4jCFH7T1qfsllCB31tNoQtd84rU7okpEJ
         /Ga7m70duJ7emkC2QcDGUFt4mjjWnMZiC12xEIR3qG7uuD9QdpYv959+ZY/jE5aSXa1g
         /jRTu8JTFYuA9HYtTbVg0PBswQ8BTgRsGSiJ8T5yJIjgtNM83TWJhzj6GdmSZ+sLofPP
         0CzcXkMMtx7b/OcjHfT1e1svGhO9yhTlQN0qju0bGtxZvdVht/VMpIWpzumZm5jCitru
         nKITEhANx+de56CMjRU2KbdrFqQnDpSyb3/gLw0eBE3H01QTA1u/HmIeJkfI9qrhDZyY
         P0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757930790; x=1758535590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6bLhOy3aQ+nTIsBm75KhRBxHYpZEyRQkCJbrV2nDCs=;
        b=XU2/rzWUr6is70cEuzLWJfyFDMhlE9BGdyQ4wDP5BZhzV0oUFStqcN/S4heHECjk3u
         ni5uwnJ8vbgzJPyxUJpz2jtYqjsDvysiHepBLur9b3HgYVzWKs95LgZq5Sgv4yYCyckn
         zkl2z7a6Hl3L4im355O3Q7HIhhBQo6lKCA+OVNRA68bfoqvjLddo7IpjhmDP3+jy461J
         ImV8FeJnNlJBwOlyigL93a5CWcrqm03E+/CK16gWR2n107I9FbfpKXRx0fcQ+LtqXzcx
         o7BHwxzWSFIovcWUCCiAHrj6CYKD2mnEtzbXP8LsKY+MqfTr4Jm+hNqTTpWfY50dvlTP
         v6AA==
X-Forwarded-Encrypted: i=1; AJvYcCUDTS4g6ZoazcZLRwKnvs85RXUYkxbbatymNOVC4q1DIkxo0Dzww0es53MmUobhlbfxhzxqb8vL7Jh6sR6A@vger.kernel.org
X-Gm-Message-State: AOJu0YwCyicPo/3CXRW62cgB0WHoRt7op7GkfmPaThcBC4BI2RT8EWgb
	bIAKNumcWOr8XLZUK5oj2nkaOXS9P167QwlKZ7hjgpSG5Iu1kieKNnU6OauZ//fWQ24=
X-Gm-Gg: ASbGnctRLkL6+bbVRZ/XqJr5SlT1FkZLZxTVxjLRCXHTFSJSAKHzuXpzJv0JFIge26r
	3o9iHHFfQxdg+xmq2UEbF6WBjBb0vCVninxpDke87j9J8cN2KSYMBdweQDEh4fF0ULcyDD6VupC
	VJNrD8pRdKtIhREzXVqpS61eleqbx61ge9Jtucn5gIwVeuHm1bG5ORhn/arKc6FBrdmw+Xk8arH
	HVoiPfoN+mU0O7g876gcQ/5YeHO9VStTWksf6k2fYvZ/XdquMMrQdTxYWh2jg16Li2sJ/VT3lmN
	RB8wPWt9zuhqGJwwqncoVVkr3aXIbXL2u445uKYqK0yoAeR+qLHiFu1qyXxW5hFRh+eEk1om8yi
	rwruRYBcZ8Ab1LNWx0fQ1bXNhq96FsWBoY93xpvXFnlcT0w==
X-Google-Smtp-Source: AGHT+IHuHMN20CvPkXUvYZTGmiFV3ve4adeDICiqiLAsONuOwCFEVWmW+hAAOekUIPtlXXHNkbcI3A==
X-Received: by 2002:a05:6000:2511:b0:3c9:b8b7:ea4e with SMTP id ffacd0b85a97d-3e7658bb0b9mr8253628f8f.19.1757930789807;
        Mon, 15 Sep 2025 03:06:29 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:eee1:5042:e713:2e9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd4cdsm17209127f8f.37.2025.09.15.03.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:06:29 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 15 Sep 2025 12:06:14 +0200
Subject: [PATCH v2 3/9] arm64: dts: qcom: x1-el2: Disable IRIS for now
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-x1e-iris-dt-v2-3-1f928de08fd4@linaro.org>
References: <20250915-x1e-iris-dt-v2-0-1f928de08fd4@linaro.org>
In-Reply-To: <20250915-x1e-iris-dt-v2-0-1f928de08fd4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Anthony Ruhier <aruhier@mailbox.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>
X-Mailer: b4 0.14.2

The reset and IOMMU management for remoteprocs like IRIS is implemented in
the hypervisor for older targets such as X1E [1]. When booting Linux/KVM
directly in EL2, this functionality is missing and the PAS interface
normally used by IRIS to boot the video firmware is not working.

The Venus driver supports starting the video firmware without using the PAS
interface. The same code also works for X1E when using KVM. However, for
the new IRIS dt-bindings it was decided to avoid using the dummy
"video-firmware" node in the device tree to describe the IOMMU [2].
Discussion is still ongoing how to describe this properly [3].

To avoid regressions when running using KVM, add a TODO in x1-el2.dtso for
now and disable IRIS even when it was enabled by the board.

[1]: https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
[2]: https://lore.kernel.org/r/20250823155349.22344-2-krzysztof.kozlowski@linaro.org/
[3]: https://lore.kernel.org/r/20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com/

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-el2.dtso | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/qcom/x1-el2.dtso
index 380441deca65d1b443962fbe6151f4aadd918383..2d1c9151cf1b4aca79f7ad67328ffc3c721b9dc3 100644
--- a/arch/arm64/boot/dts/qcom/x1-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
@@ -12,6 +12,11 @@ &gpu_zap_shader {
 	status = "disabled";
 };
 
+&iris {
+	/* TODO: Add video-firmware iommus to start IRIS from EL2 */
+	status = "disabled";
+};
+
 /*
  * When running under Gunyah, this IOMMU is controlled by the firmware,
  * however when we take ownership of it in EL2, we need to configure

-- 
2.50.1


