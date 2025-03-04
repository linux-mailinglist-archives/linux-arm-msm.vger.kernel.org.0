Return-Path: <linux-arm-msm+bounces-50196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 506C2A4E133
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 15:38:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6EB3188AE78
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 14:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F7323A984;
	Tue,  4 Mar 2025 14:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a1+JpL1H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2AB262D3F
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 14:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741098722; cv=none; b=IL82vEokISttU6nH4DWRWrBi8BiZZCpIZdsJxme6B4shqnQ6WyeCQ0bDHv6Dv8nvSqxOuPYgjN9ZJaR/IY7CvU0EGaWkhCGklz1Xbw7dxb+dKoEjGsoBrYS3ziv4LqVH+Hj52SCnprX2IzECFTbmW+WKXDoCyMhCZsWOtIIwpos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741098722; c=relaxed/simple;
	bh=VL1eomr7TYKNMZFzlAbBFJ5Cl5ZiG3QKGLhOiDkJJFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FMlxxYfyoCQ7J/FnLLH3u3xYdw2HOJada8VXvndCrv9qElWMBtn7W69BC8sqZMFN+65dEQTvVXITA1lozrjNc5sUn5c+f4it9PoIF0xXLItxvXlNCEwFXIGzq7V0u5tjonHulXsnXq/Wt2h4t/4vndEiH4AVJDXTmsi9YqxCMHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a1+JpL1H; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5495e1e4389so404488e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 06:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741098718; x=1741703518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zQnSQpQb2bQVsADPOwC5vQPziAGbC3qGxhORonLAzC0=;
        b=a1+JpL1HTOxL5irqgn/SRJoUMD1jfWfrSSuQwewTaPQJNBe0+GPiTHS+Ls8LvmsLBd
         r3xM/1jCJXL2T7Q9aEk59C4s7YCXBUrCEYZ9LcjV6lvpHiOhycO3IoYqPTaLrjN/0nc7
         l2WO5FpzYrLpklz6oAPfro4wX50edtVv7gxN2hRGzv9/XpmKHEePTKroZadRDcrUg/aR
         05pSdNmCI9PGDbVFhTeu0Ee4fF2hzE1pLl0rWkVVKgWQ1hC6b158NaR7jL0ytcDPNR6m
         PClafMTpQkFiZ82Se6e56lttZiFqiQh0TNtmcVc34Co+SWr+U176KVQ/8qAMoBz2+hDU
         U14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741098718; x=1741703518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQnSQpQb2bQVsADPOwC5vQPziAGbC3qGxhORonLAzC0=;
        b=NfUlG2kM3mXqopJNGyGUj7F2fnuHH5ulD/QmdircLFcTHVdjgPsvadhI6ZVe7LH65Z
         Zci2/FRLZJ9xl2tfVuUNXBR2jvW9kdmh0aEQMLFmyUGQjr1MLIshypBGspRqEhxZ5oCD
         BBwZscupRCHGMR+f7UFxd1MlrgQdAHHPQeV+2SIQoeTBW67MWggyCP2qcAv26ub9kI83
         AoLR+IKlBj3AdQh8pvSqYs34B58H5Ign7RZiqkCtDzVfBb6C+TW8XNxAzwTy403fGS5y
         x672QOMEJ7k8LpDqGb9ucN7bQ3drIIRfnm+eKZRdxEaHre7IhR6LO7vSlq/r9CrNKWbe
         /B6g==
X-Forwarded-Encrypted: i=1; AJvYcCWoJmp0F9LWQY9AJ91JeTQq233qTI1yoQxo7Ub3FJLurjIfMwJfEHH4a41Jmc9PbkH5AAdVeTAShMLMVkko@vger.kernel.org
X-Gm-Message-State: AOJu0YyNPoqK4R4rMiSzSOSXEA3QzdqZjzeSvn8AefLGT8M/dHvjQXKp
	stNUUTVgzyawbclGhWmiRhJvpVISp2H7zdQRFISl6nHu7OzJoL1K1n65msYuwMg=
X-Gm-Gg: ASbGncu8zi9jHiVzG9uOtzU//1BrnlCMXA1Vq61dMC9zEpodkCyfD3yCauIt7dVnJKO
	783F4HyzOmnD3WotmQ5+6BIlOdYA/WynJffCz9ZIXNkvYe7IvXYmeJtjn/l84c6KGdtxiRI7DUM
	li2vN1wJPg5h+CwlI+dNwq+EfxsxN7kB4ogwMkvjmI4TP87/5n+5RALvFtkFq+Yj+ZBLnYW9DDR
	p1HBZTIP3UcA9R70tEV6L5j2+6sptuimEK36d8IQPniW5u8TXjzHXJ0mxriGijMmRHrRu+i1yxE
	bYOowS7w8OxFfHMv65RIzUSrGllABa+mjQwldc7G1zLhKGztZSvExKWX9mtabja+vRXFGO4gp1m
	6q3IIFmWe8E5xANaOv0grcTiZG/YHQQbxdw==
X-Google-Smtp-Source: AGHT+IFhc6yFO+VR/PFQ6SlkWPLfhadsyPa+Xiq2trlhv6hTkDGgE+oaR83aYaPKsRsQzXMcSNIbbQ==
X-Received: by 2002:a05:6512:3b10:b0:545:8a1:536d with SMTP id 2adb3069b0e04-549763adbb1mr409879e87.2.1741098718068;
        Tue, 04 Mar 2025 06:31:58 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5496862ee0fsm672202e87.189.2025.03.04.06.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 06:31:56 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: qcom,x1e80100-camcc: Fix the list of required-opps
Date: Tue,  4 Mar 2025 16:31:52 +0200
Message-ID: <20250304143152.1799966-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The switch to multiple power domains implies that the required-opps
property shall be updated accordingly, a record in one property
corresponds to a record in another one.

Fixes: 7ec95ff9abf4 ("dt-bindings: clock: move qcom,x1e80100-camcc to its own file")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/clock/qcom,x1e80100-camcc.yaml   | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 5bbbaa15a260..938a2f1ff3fc 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -40,9 +40,9 @@ properties:
       - description: A phandle to the MMCX power-domain
 
   required-opps:
-    maxItems: 1
-    description:
-      A phandle to an OPP node describing MMCX performance points.
+    items:
+      - description: A phandle to an OPP node describing MXC performance points
+      - description: A phandle to an OPP node describing MMCX performance points
 
 required:
   - compatible
@@ -66,7 +66,8 @@ examples:
                <&sleep_clk>;
       power-domains = <&rpmhpd RPMHPD_MXC>,
                       <&rpmhpd RPMHPD_MMCX>;
-      required-opps = <&rpmhpd_opp_low_svs>;
+      required-opps = <&rpmhpd_opp_low_svs>,
+                      <&rpmhpd_opp_low_svs>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-- 
2.45.2


