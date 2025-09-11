Return-Path: <linux-arm-msm+bounces-73172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0D1B53BAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 20:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B585166205
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 18:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B082DC79F;
	Thu, 11 Sep 2025 18:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GALxb2rw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAC02DC782
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757615930; cv=none; b=acB8rdoJ5n0t3z30Yi9MxUhwLBKZ7h6R3zft7lsiHWbnylpb7Kmn6LwItkELwdhPoG2qOIRFE63aYGWRKU57LmzZrI/54fY2xPPYRMlkFm+luzExAVGYjQdD1Mo0zHHgJxC2J6GkCKE3aGMpVdfpU2LTAs/UjIiBd3ImyonPSug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757615930; c=relaxed/simple;
	bh=1zx/2dtTQqqMowNG8VNeNa3dgOrka7taR6ADJi7Ubvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sp4lvXU0qJNIpVWG0cda1q09kxQEAn8YuCKKgAZ6JaGc/1/MZxyTROKWguXCSs30NdPOA4IHfC1YG/Mm/aTpeDogkIFrcIxOKJ1miL3yiQ4wByPFHi/7muOjczp1mq0S1hp8b3dlNJ1OpJlr6DaHGqT0UjitsbZMTUYCfcPq2g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GALxb2rw; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so169148966b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757615926; x=1758220726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=av38I35wnqhbzTLi9E0zZZ4NUfZkQJIJBwv2dhdyRjQ=;
        b=GALxb2rwWKODvfDFwpR3PYK/t5WKF2WDuTiCEzl9keEyYOwZPalQ43zstFvIpGJDlh
         qf356Qy2tMe6cPGd1cbzZaJX9sKRKlHV0evJNen8qWGnbZKZOiMWBwrwnk+RBzhE9TWt
         4UCjTUxZMiDJTBU76BTvfBGITN0X3gz1l6RYtgVytRjRWoSqknvL/YzTCtOtCJPxYrrR
         pvJC9Csa6SKOq5QtMQ+Mhzlw4CvuyoVQrDu9IhvcorwSUxNKj/Gf+K3SaYW5j8cyfu6+
         gAnRHIfbKTE4QK9QZDLNHdPzY3WrFDA2ajEjLrljEIU4fFDsqylT6hkzy7J3Ho/DqNJc
         1B/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757615926; x=1758220726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=av38I35wnqhbzTLi9E0zZZ4NUfZkQJIJBwv2dhdyRjQ=;
        b=cZJFELdawLaHu8Q5XGyRdjG+PhwbUjkWfFW0XRDi2pxY6CWPFLzd4BZO/QE+9OFnkR
         gIqf1mRnlWxUKjXhn5ysmZuHXkEe7PXvzmUCooP9e4O6vtPrI3egGhRoqljAWFFpqzIG
         5PkFlVw/+pzmH6yDgEtE749Z7x07IYifn2JkQoAVb37K+WKcB4OOMrlEEg6dHTwaADTm
         n7JJRwR6xEq9XJLrohW6xTT58QbdSBPj9Bnt5Z/Tbb5m+q0nkVe+vAh+IGQtx6m+qH0k
         ncfoqBedETai0+LmMjqKc49tao4WNp6hdMI6/oL7DuLtM7AEGbcW/vZEmL505v/xSxbx
         Q/OQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8IE7hkgxdXMf2a7p/LuavxUqLK+/Yf7N5mUSae/IDuUY7AX2SWvLIMhlAdIOkelnvhkq6KBm6k4dyd+wX@vger.kernel.org
X-Gm-Message-State: AOJu0YzqIstOrhzYnm2LQTLjV5fWECiWSByWEkqFAVERhnOcLAoSikTl
	Ntt4H1cM+fyASDO89FOlRioLpSyGt6SVVimivQIaYpCA+g8I/7kSnEOEbMbkRcBmaC4=
X-Gm-Gg: ASbGncsaVfKm8Aofv+d2ifesdd/OpwfF+gV4VEe9NRrPbq+Sy8emSHJr406PJ5kDDm0
	FpzU0bp0quvXoGCLI5+UYghoAFgQ872vscVxQkfR4sKCzro/tYXl2H4urLI77miwhn3TYXo+ESX
	/8o/PO/fs4g30HX+oAYuO3bF8+lBv9CnCHs75qmAW8VWJ9qTNz97Ghbs17M4YddmoWZJY0UbhOR
	G+7V0seF3+VYFSqVm/iMIBfGLalX6o0KPGItUEq3A0+nRp1J6SSFH40cpgcZjXP4SQXWBuldVv8
	kTMK++bve0SqezJ+4vWyCgSEyU9Xp1Q7mf3YMTvbwWb7ysenH7e6Ul7ibtNHY1B2Tx87zxpDPeT
	dW9hUVQUBGOfi/ULplkrWHAsIQlvTetYNsf4Azn7LQ1INQx2Gp7A0n4U=
X-Google-Smtp-Source: AGHT+IHP0Z43RXFMeyewSqO+MA98H/+cMLb08ALXAhRNRNQlvMkoADDp/qrg066q1VtxN16gF94Dxw==
X-Received: by 2002:a17:907:d25:b0:b04:c11c:8214 with SMTP id a640c23a62f3a-b07c353ec2bmr20439966b.11.1757615925928;
        Thu, 11 Sep 2025 11:38:45 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:725:1e09:bed1:27ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b31715fdsm183999166b.49.2025.09.11.11.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:38:45 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 11 Sep 2025 20:38:25 +0200
Subject: [PATCH 2/4] arm64: dts: qcom: x1-el2: Disable IRIS for now
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-x1e-iris-dt-v1-2-63caf0fd202c@linaro.org>
References: <20250911-x1e-iris-dt-v1-0-63caf0fd202c@linaro.org>
In-Reply-To: <20250911-x1e-iris-dt-v1-0-63caf0fd202c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

The reset and IOMMU management for remoteprocs like IRIS is implemented in
the hypervisor for older targets such as X1E [1]. When running in EL2, this
functionality is missing and the PAS interface normally used by IRIS to
boot the video firmware is not working.

The Venus driver supports starting the video firmware without using the PAS
interface. The same code also works for X1E when running in EL2. However,
for the new IRIS dt-bindings it was decided to avoid using the dummy
"video-firmware" node in the device tree to describe the IOMMU [2].
Discussion is still ongoing how to describe this properly [3].

To avoid regressions when running in EL2, add a TODO in x1-el2.dtso for now
and disable IRIS even when it was enabled by the board.

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


