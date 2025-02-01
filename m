Return-Path: <linux-arm-msm+bounces-46658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 509E8A24B11
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 18:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 006A91885ABB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 17:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7297A1CB53D;
	Sat,  1 Feb 2025 17:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EEB+hGJG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935491CAA88
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Feb 2025 17:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738430958; cv=none; b=GhFduxrYB9d82XjQy0s7eW1+h++QhoYaJL2O+8QkWz0VmvuP390SVg3l47i7W3WFkRj0I9JCxkGHaHjFQ+KJ1N5Omtql2lSOBnTCKKpVCe++xrHl+rTO8uVnu5x9RPDawT+UXNAnk6AgGn2w2XlzantXaf078jN4DUyngRKPcc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738430958; c=relaxed/simple;
	bh=/d/geU3OxC4Nkibrq9A3Ew2gwBiXmZo2CHTH+6Gy0Vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JFaDa/dF3761tVDdlCdcWG05JrP7xHG+KXqnlRbUgUwmKIeQ1ggclLjtsQII9qOhOdGQZUsnZV1qQPNVdtNaCQvh9kE4vDV2burgpf3/IhO3u6HbJmJmySpmz6JYk2lMxPUy43IXobSbcJeKZMxHuG7xC+CYbETqDWomFmcKXxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EEB+hGJG; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30795988ebeso28041411fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 09:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738430955; x=1739035755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Dk7ljpeNS9WkTUfxOFg/JBajDxdcbPw39k3Tq9ImKI=;
        b=EEB+hGJG23MUswaLIHug+zBcLaUI7FgHBF7+31DvCX+D+AsY+l2aEyGy9Id1ZVruIA
         O9ljf+Bh/HRUstbg27Zm4m15lPZ0Uimkri7CYLVsOiYF31OTark2MDaWoecwS6eWpIMS
         Je0MCtBtgxgx/xwOgIgHk54XMUTKKLu8oJTt8x0esWnzo7QmEBm08HZyIE6onfVMgUJF
         x7YzxvFv650YA/qvjF9v45MHUdVkIgAqGmLzJ6lIhaUv4buLAqDXsEtkXmATkZfkf2Gf
         UdK8rVJe/DHJDFYd6UcitkcUDmfi2IpCosIpA57V/Kh5AXDLdl9nbYEMo/914o6Cb2Dd
         zysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738430955; x=1739035755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Dk7ljpeNS9WkTUfxOFg/JBajDxdcbPw39k3Tq9ImKI=;
        b=TiYTSCZD8l2jmaZOaQbKcQanVhxkUI7Quf+Rjxg36GMMjdp6nxPnmqJhbhdGYW2pTF
         OAS9oqWG2N8FfZE/JaVt5y3MBVfW6u6fmH85bBTOv+68ArVDYN+HanVRYpV58AWWdZEp
         2+VRkiF8InXuUKV6A8mokTD7/bGMvfr49ape84GjySX423IBhzYpoEOIuD9eNE1Z0ooK
         U0lqOYr/LkMDQLGJ0iznTuIlEnqLQpLUhOJJVSxdobPsAuOl17i6AbnrJ+cHbZT6C3ho
         gV3nlqFFsG3EPgrGIYMH1bzwkHJgPeOFzXzZXGMtagSJPU7Rw7OT/b2XzPWZXGARmiPY
         5zjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMd2IphKaE6NdFIlxGZ/kZs82OTEffVgiy+xVm0N3y3Ba8tOFuKocCuhOG37qome5cusdq6WkUUz8bKCvM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy42sCQ9yOAtnIXJ/XyTIrxyFURJn2QmdrOl1ejvI5gkRPWuVq+
	UpN2U6BCE1IHQjrFlH0OX+WM7htGD+AWgQ/eP0cDLMuXIIHKh8czwEj5eC3KkDE=
X-Gm-Gg: ASbGncs1ViNCqxptoA/gR8nYcbFteB/srtDmHgq0Af+0q5UzlJ/qJKYb1pGvl3V+Vp6
	I6F9JNAKGnaj3prEdGTWuSr8cMjAEvwnLx1dwUmJZni/uBvN6TUbs9OaoQWso8VQ76zXSrXLczD
	t/unhhmOAHh9WQ6gRhU9nH+ek5wuwYDPOcBr+WlG093GalfeCWc8QhEFmYm4OFYsU9n122cHlyA
	nx0htobFPDGvhJBSDQFUdzpCTZepK3PS+WNPYG+aRnLtaX58vdrSzSiS7lESC+CW7DGh7gI5mKz
	uyQwP6jJ4XeozJc6sGfIJTo=
X-Google-Smtp-Source: AGHT+IFQxLdgqV1VuCmiSKzy7E+QXwyUiqyAdxyDy1lhNZkJAj2DiV+iFyftVtLTyzS01O4ux7Ueig==
X-Received: by 2002:a05:651c:504:b0:2ff:a7c1:8c2e with SMTP id 38308e7fff4ca-3079694dd06mr58095141fa.28.1738430954016;
        Sat, 01 Feb 2025 09:29:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a3099ec4sm8852161fa.48.2025.02.01.09.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 09:29:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Feb 2025 19:29:07 +0200
Subject: [PATCH v2 1/6] dt-bindings: net: bluetooth: qualcomm: document
 WCN3950
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250201-rb1-bt-v2-1-fd44011749bb@linaro.org>
References: <20250201-rb1-bt-v2-0-fd44011749bb@linaro.org>
In-Reply-To: <20250201-rb1-bt-v2-0-fd44011749bb@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/d/geU3OxC4Nkibrq9A3Ew2gwBiXmZo2CHTH+6Gy0Vc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnnlnldnpgRM0nW8PS6YIAuy4YhrJbX7cj6BYnO
 B5keQ6cZ2SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ55Z5QAKCRCLPIo+Aiko
 1V2rCACNDKB2CIDYU4QR8+Ha7egrR/zbrKOgsECRWLewOohyIlcnXo6fluZVPXOuLXYY/fixjks
 YgDHawSRviONkIGOwNgN4/X+UCdXiu7KSuw6enXbGQaQEVBNtibf5gAkitbd2CmwxNa0ED+aNOq
 Wjcl3CC2MDkrUxnPnitHOBYvSIbUtSQSMbKXZrkm1khH4ueV0Rwao6VnvUdXJ/YMmlxdOqItlYm
 UxNJWpp7RiUl14118a+TgBlJAYgSAuzn7XE8P4seuArTn6vGNDLp7wCJQLAFHN8W3B2QGFkv0q1
 uJxif8MdAL/sz/wvo29d22rFhq+dzE4wKfBkmf1E7Srwwr59
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

WCN3950 is another member of the WiFi/BT WCN39xx family of the chips. It
requires different firmware, so document it as a new compat string.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index a72152f7e29b490003114dae1e36df85cba384df..6353a336f382e4dd689d1f50a624079aa83b2ffa 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -19,6 +19,7 @@ properties:
       - qcom,qca2066-bt
       - qcom,qca6174-bt
       - qcom,qca9377-bt
+      - qcom,wcn3950-bt
       - qcom,wcn3988-bt
       - qcom,wcn3990-bt
       - qcom,wcn3991-bt
@@ -138,6 +139,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,wcn3950-bt
               - qcom,wcn3988-bt
               - qcom,wcn3990-bt
               - qcom,wcn3991-bt

-- 
2.39.5


