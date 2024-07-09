Return-Path: <linux-arm-msm+bounces-25620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B4F92B928
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FDC3283D42
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 12:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBBD158DC3;
	Tue,  9 Jul 2024 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N6xXcfQ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132C7158872
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720527535; cv=none; b=dGUugJlsSK2dU0nJmii3mbh9ErL2SegWXtzaVK98cXgik5VVPF0XWrafxYXKSxPeLaQ1T/QpGQTMLy6pdGAq1gInn/7rrTyf6wma97RQvTPY5YZ+izvUfpF4SKv0OOZJXs+tyCc1uA1f3gC4mCqtsaeJuDR5+KuuPTCXjZ4X2b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720527535; c=relaxed/simple;
	bh=lnpdHivpa0ZtGALVGMDdo0DO3IUBtoV7QZSuwbPAAcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CvsWwP7D39GkVBod2LjQp/vohc9SijNSS5cDmbq9teZGxtNyWfOUzhxDO/caa3WcNOv/Yu0YLpoPiWY0If2GvkuBMSZTqvGvV/DXVcrfJTsvofa7rs+pBMn6IJRkrZxL1R1h9ZOMYsNtSmbKc+DXpY7SFdw/ZaTNNKRq5EoFRCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N6xXcfQ9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so43134525e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 05:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720527532; x=1721132332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECapj6dpkD5GtOAKeD+vFFeZbzC5454tZ0kmlaK792w=;
        b=N6xXcfQ9VgD+IdV7SnG+2KEG9lmpCcRSWDWbbGoZhN+R97IntWOhHBtuMxrRwDL6X7
         zWo1uVq/NmiZ4jLLIoNfJO2afKQFJ+iHug8aIkjGDPM7hRcT3thxapjJuzdnG/IQVIAA
         gD/7eMpgw4De27pP0LpanbK+K/dajC0DdZRYHv0Ya8uocC/gotAVlgOr4f7f6aRt/+dv
         ZpOo7YyZNUhrGkVpbsCBAVlUk8eu3UOHBupJF73O/fgNwIXcVsY3UmzQwC51z/r/sICE
         L9ytw2YipSzYDOcxLgQSyE1LREE1bOjJNQVjBhZpFlGMB+vehU1NVdUwzb5eTsiDzxtg
         MSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720527532; x=1721132332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECapj6dpkD5GtOAKeD+vFFeZbzC5454tZ0kmlaK792w=;
        b=AYpKtksiWgXkPxwJx3BZBhnJ2TsYeAY8Nhd7jaSbBMt07aHzbgh9/yYg+3CsIyscu0
         tyum0fkUUWtjWcUo5AwlwXZhVlXw6GtvoSnJewJaJDeX06yIRGU57LujLOS6hru0Hiwp
         MYcOWu3cVf90uNP+R4aRWtjBYQJ2FlZzunDMd7qF6nnwMgfqL7sbHLt6Cxd4LEE7t+Hu
         ronCgmZIsYafAOLblu5t2p2s538y9LWkRH4uv+RnPgLuOKLoO7PKSxpY3HcT76bL5hTK
         35wVIujXieQGpoe8WFLUox0HoQCG8uAktrCFjd6Mr/xpXB2/4GOTfImp4gW1cVTQX/Px
         JhDg==
X-Forwarded-Encrypted: i=1; AJvYcCXryHED1Rtm/7m7aPevxGFL2qckqdBWYOGT/97+YgryBqETqhGElO2N+p//MrRALBIr1Ybb1ZHsl46RVk27+nxgoCOcywHIf/N5I/SxbA==
X-Gm-Message-State: AOJu0Yw7rz7+Nj2SNAAzY33F+D7oMdVO3bm9LPjOVaObjlutf/SFwi61
	hqueQR+Y8mg7byrHddvVWk2mGHNkrTgaOAzbRWG/4ZmaE6qdVGpSwtOcR9CBaRg=
X-Google-Smtp-Source: AGHT+IE5mNsJaZb0W9u7LKm5OLhrFNxxTQBmvoTQP7JiqV1MDRP/RpbcW8CS0+XL8gBe1CLKg4GSjA==
X-Received: by 2002:a05:6000:a8f:b0:366:f74f:abf0 with SMTP id ffacd0b85a97d-367cea67d3cmr2104598f8f.16.1720527532299;
        Tue, 09 Jul 2024 05:18:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c270:70c:8581:7be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa06d3sm2390574f8f.75.2024.07.09.05.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 05:18:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Jul 2024 14:18:32 +0200
Subject: [PATCH v3 1/6] dt-bindings: bluetooth: qualcomm: describe the
 inputs from PMU for wcn7850
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-hci_qca_refactor-v3-1-5f48ca001fed@linaro.org>
References: <20240709-hci_qca_refactor-v3-0-5f48ca001fed@linaro.org>
In-Reply-To: <20240709-hci_qca_refactor-v3-0-5f48ca001fed@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1853;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MP5aeVc3EiqpKpqEdBQnkaD+MInTgWkpRAZc9/j+Em8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmjSqpWv/nrTEkdQaChA3flySvrHZnmrx7Ws0zy
 IJPfBGwGLqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZo0qqQAKCRARpy6gFHHX
 cn77EACz9PrZC35c1YhRqZA+3b5QXDtGC1GtgOVx3UJpazSph8qUSv7pcXYHsI2RS7k4TdgHSum
 DsUUWT1NilZCdk7mkGSgoIQQCqJYowKje1KslgAXkeGuZilyje/Sv3t4qn7Kr7Bquq4p/4w3KoL
 G5lIPeOpp1DpELrUMo9MGBqLDe/7wWxFtppqSPmTRQSv+oABg7PyJ1jdOMqDej/UtaAmjDXU+De
 gLwopBSq1VNNx/izKVm0uGilkB97nxOAzs/syt5Tg8BCQv5s3JuAr/bAirj1KiVSN7qzZcHOO3o
 NpE51mOEMM+v1h/pfpDYEzVagULIAq1k+/wfYXS5/TQd7SaHSyqmZ3MU+6Ia5/7Q0PHdIejOdXs
 CbRwZmRwO4NQ+NhjfXjmX2UmOmTlIBHGEu+cY+aBon6Nky1KixW+5WoSS2xus2BtKENpZ8XjOQH
 XI0KuEGa/Z24I5hfZr1HDash+29eJ5zi8ah8t5hczhSQ2iPiC2vXgWGeGtpUZ9UMylXI6CjEMKb
 vmvcCS/2+LGtW2Yj9hxybDBUyesHvAfWc6Y+GZc3D9CWXXIE5Dp1eziotyMYV/QXFrMV56MHx/N
 B6sOmnEptb2j6a8WBwxNOl8u0EFOaiJ841FPGrsbtCqSpMtkBbKlDMTlZG5viqflKfkt+hQcaY/
 HNTWRwMQK1tuBEA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Drop the inputs from the host and instead expect the Bluetooth node to
consume the outputs of the internal PMU. This model is closer to reality
than how we represent it now.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml     | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 48ac9f10ef05..68c5ed111417 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -77,6 +77,9 @@ properties:
   vddrfa1p7-supply:
     description: VDD_RFA_1P7 supply regulator handle
 
+  vddrfa1p8-supply:
+    description: VDD_RFA_1P8 supply regulator handle
+
   vddrfa1p2-supply:
     description: VDD_RFA_1P2 supply regulator handle
 
@@ -89,6 +92,12 @@ properties:
   vddasd-supply:
     description: VDD_ASD supply regulator handle
 
+  vddwlcx-supply:
+    description: VDD_WLCX supply regulator handle
+
+  vddwlmx-supply:
+    description: VDD_WLMX supply regulator handle
+
   max-speed:
     description: see Documentation/devicetree/bindings/serial/serial.yaml
 
@@ -179,14 +188,13 @@ allOf:
               - qcom,wcn7850-bt
     then:
       required:
-        - enable-gpios
-        - swctrl-gpios
-        - vddio-supply
+        - vddrfacmn-supply
         - vddaon-supply
-        - vdddig-supply
+        - vddwlcx-supply
+        - vddwlmx-supply
         - vddrfa0p8-supply
         - vddrfa1p2-supply
-        - vddrfa1p9-supply
+        - vddrfa1p8-supply
   - if:
       properties:
         compatible:

-- 
2.43.0


