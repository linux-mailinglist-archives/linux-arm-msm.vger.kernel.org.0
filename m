Return-Path: <linux-arm-msm+bounces-72911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0851FB51099
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 10:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E587C483CD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 08:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDDA30E0DB;
	Wed, 10 Sep 2025 08:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MYjZItM1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5E730DED5
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 08:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757491668; cv=none; b=TVSyKHKxyh10SQMAJzOE3PAcQAifMWgWOh1fr81zSGhah/DcgHSQ3vTbt9zmhtNy+IDMnnL0KaDNpXuGzXbnSnLanyPpIyFvh6alWUDMkb42YUXZ3/F1rf0n+CtaQwQsAEfhVxp1JbeMzsijaiiBYrVhlNcwsPrhzHhOAH5l7AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757491668; c=relaxed/simple;
	bh=dSk6AGhrmnQiBMVkm4iUfkoi5uR3VSQpSwlqk/H1gAg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ADbUE6MwDTL+uo6DY+PbF4F9ZUbPBlolAiYdPBvGlRy/pzwUdZaEH8ZF6qRA4pbfITMXcKoKeliTQ/WDdBT0rhE+/n+7lcRPTUWD5NZE3wwBVpyND01TaCFpXwbpVK9rbV/ol9v1BPQiC4nK7BNmNPX7mrZmTwAcJCmniTdPKy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MYjZItM1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45ded619608so14444655e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 01:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757491665; x=1758096465; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVm/deDTR4I7zgxqPdQwaIpbJb7N4tc5cNwrlaMAz50=;
        b=MYjZItM1610egb3sO7XF3i80Uwwhjm8rwfUOAl8r0+VH/TvAcS6fPd3dp7ibEKU7sk
         J3fRfRCO8Vw1akMF1ouq7CQAQhOQY1QWGifHGSb6Hc+//5938Id8AM+k+CNNOM3Za2Qw
         25tJRbipfv9nI/YJyQmn2Buooc+2cKQazuCj/7MKpHaixda4+fce7mF9ef6oeWX2VS6l
         BKQuCbl1o40ZZLD08v9AOO+a336SHed2rbZX+HcH7shkplTixv/bUpkTbaSeUA91fl14
         lTTQ5Iq2vt8DrZQyVd6s+ECXTLml+fI5YmeC2DNHRGCzrMTAMGiqcmIqsCVeIzMPLKiO
         c/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757491665; x=1758096465;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVm/deDTR4I7zgxqPdQwaIpbJb7N4tc5cNwrlaMAz50=;
        b=gRzcUT1XIKt1X+8gBzEn1Dd/AJSxJxWgW2p9Iv59WULdW7+JaTmmdX18kNv+KuBdA/
         Dw7j3u0PByP8fBvpdyp1/4Xy4X+jarei1jSkIoroFNUvJluxl46j4Iqe/ojH+VDV/bOC
         4KZRdK+CXF5whjfO3NlftIcd60qxkBP0zae9dLRQwdKzEZnGpr0gbtMv0Xm5TH24RgOv
         U/HyuklVm6r4WUmeoj0ahNyyo3/khLIyuuz07vyoAiD9dgPS24wCYKVmQ+CgKkA9vlai
         eNo+PRmGvTitoP7tJHvT4ZFhIeY12OF0TsG0tColfXyeRoTUUjfCLh+1g/Nzw/Eaku1x
         GB2Q==
X-Gm-Message-State: AOJu0YylZwLU/8nal4ovtdF5r5kE215OBWUZ4SvNscHvVfQC5qjzpTqy
	kC3PLRB0Xunt7l70UuhGgTSPJ4u8s4qz5ivbdi0CE0cepacq8DLy+vcVKLC/3p9OkS4=
X-Gm-Gg: ASbGnctufs/o41xmNXPfNbMsq7yCVtiNaNcz1sj8ykUqWLTI27YZlAvPEyMPjIhTjh1
	1ard+kJWiioMybXs1sFkdUUCYo3t5foHscEytSfXgDk90NdKwy2TVjmQgy8I0loIIaoH8R1ZxOb
	7aka1h46Se8b9rc2eKb1HbpE5MZC238Q4N1Eukei5vRwUeATwiwE56dA9r3GPD0tsChm0Yse8j6
	X9GxD7nWNk6QZqlyzTtswLOGbsCdrLIUe3EBtx2izGoBtnrIUfjsstERRFkTQw+WLwj5mX4w6QM
	BJFBKIKlYYsQ0ulARPyTlqk8uZDALOuhCspxAH0B+3uk8dT77jYAQIMOQW7A2O3bgfgmyNvq5PU
	XXxB8iTGA0T1JkxEYuDxN4sIcRop7
X-Google-Smtp-Source: AGHT+IFBs8UXGxgkaSg80fNb2XLa7R8prdLQ6TRj1KMntX+P6s5LJFVMk2sAxSEGFFCGhjD2XvI0jw==
X-Received: by 2002:a05:600c:5493:b0:45d:98be:ee9e with SMTP id 5b1f17b1804b1-45ddde6a3f0mr115055345e9.1.1757491663893;
        Wed, 10 Sep 2025 01:07:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247cc6sm17813605e9.12.2025.09.10.01.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:07:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/9] net: stmmac: qcom-ethqos: add support for SCMI power
 domains
Date: Wed, 10 Sep 2025 10:07:37 +0200
Message-Id: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMkxwWgC/x3MMQqAMAxA0auUzAZqNCpeRRxKjZpBrS2IIN7d4
 viG/x9IElUS9OaBKJcmPfaMsjDgV7cvgjplA1li29oaT39smFxHzAFlcx67urFUsfNcEuQuRJn
 1/p/D+L4fffhoTmMAAAA=
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1820;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=dSk6AGhrmnQiBMVkm4iUfkoi5uR3VSQpSwlqk/H1gAg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowTHMa0WXc9aZw47LWizXetwGI4lOfCYN4Ubg/
 S0JYjTkmO2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMExzAAKCRARpy6gFHHX
 cuN7EACjo0XR4wFpMDKfJ5JkLwH6gCaoqJ2aZHjkmrd16YbueY63wBPoyxG9WXQv0Pf1CaStyXl
 EgOiXcb0+VDPxR3B91vaK9IMbRiGNPYTMQdKA4yfwEsQE5v4Zkad+jyKkw/LKTklVjgk7SLWsCF
 GdZDPsOv3Ql1EjwsdolRyF+lV1G97YwOrgnh5I8Xcpdj5FZ7cdPyaG0jX2D0mAjUHLn5qQjeuaY
 LF1eOrWKp+jEO7c72nmCpUYiSoOYfms0RZf0ehpTDsivB6ZjRpE3ovGKQc818SKermDhNho1jhk
 J0up1Qexbsfn2ijnAtEPz6n01wuFc6kr24DVj4bwvM+X1GwezbR3Ta86Pb5T7CQdkiSCOUwhZX/
 c73JWNRheNuYte3uRpGaDwLHAKPfZfMAMIUFXN5yGUUCQbCcIYEu1DQbgv/SPE8sef+5v9zE1xN
 lngurd+guGXjCYXBBp2iLx6LL2WDHR5oe6FmXMbwo/3J4/+790ec4uy/xAPpVJiGZ26dnu8MNd3
 PrJgMyP8CUQLYrX6pDmy2ZcoXy0B2DR1cVZBsN+nFarBqZpwS/8F6dO2UkWhs5tun5ukzTs77mY
 j+/QSI9gT93gh018RqOXMK8DG+UWcl6UZ7cK69n4R/hqhgpU1szBSSzLSDOco8Hxfi8He9Lvjzb
 TCgZ4/r96lqxrVQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings, new DTS
nodes and driver changes required to support the MAC in the STMMAC
driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (9):
      arm64: dts: qcom: sa8255: add ethernet nodes
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: improve typing in devres callback
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: define a callback for setting the serdes speed
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 ++++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |   4 +-
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/sa8255p-ride.dts          | 201 ++++++++++++
 arch/arm64/boot/dts/qcom/sa8255p.dtsi              |  44 +++
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 345 +++++++++++++++++----
 7 files changed, 633 insertions(+), 65 deletions(-)
---
base-commit: b6a291a76ecaef3b49d8a9760865abb3d8480dff
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


