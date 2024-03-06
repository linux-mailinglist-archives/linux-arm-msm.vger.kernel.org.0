Return-Path: <linux-arm-msm+bounces-13430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 094C187306F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 09:17:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A5021C20CEB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 08:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69EB5D75D;
	Wed,  6 Mar 2024 08:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qd92PTgC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1725CDF6
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 08:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709713013; cv=none; b=l5L5nohNsCn6yt7atSczzWDeB/kX+ep4/oFDTB3h6qyMWyAkwFmyZsMC44o+Goj5HME10jU6cpSPsCIGxvusUGtjgLCpBioBJiBsJQZuaV588By/g5mLEada8QFqAsZ4EJPzn3KkzUYr0psiyNOL2Ap866ruZYyvaLwSJe1ThVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709713013; c=relaxed/simple;
	bh=fe8+GtFdC9olGNH3KClNdX80yaQnD8GK4+UPZdW/CLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jfEY4PcIxk+Gl5rl8zAjMuWtjqkWHQ9ZrYVmeO5wFsGbkY/yVf5QkiUmbRzTcmCncEdPN5SaPvM39iwiVedfpmDnjNDtuxR7dxTou7qA+N8jU9nFZjOA98KMD3Xqxy3tSqiU8GgKGtBxGa5Z95Plf+KIU3vXzhxLSdedtUlom9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qd92PTgC; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d240d8baf6so77096421fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 00:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709713010; x=1710317810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTS5XY8s/SB49nhKp8RUK1O5fLNMn3hDEEbsJMc9miA=;
        b=qd92PTgCUxW0cKHTgeGFj7pOw0B7PqcFeB6K6/UdEsyi0cwon1TGAwxZEdK9wnSuKj
         C33/rjwS3I1XK6Db1JGXcsccj80/vCQdUjD9S6FANXa7RcF+Ghj4cik6ruEYJGQPfXv0
         5hitXQFlucxcqRNQt9w9s1ahUrIJXU2GxRWoGw5eHvlcYmDuzwBlb56+saWmimvhaVa7
         RmpEEDwm7TQFnK7exK90lJISltp9V136zFfYhGUfJ5dGmNu9qDB4C4+z3T7u5YArdvdy
         kTX2+M2ow2DHuHHiPq4J0xQCyVoHTST+TyCd6nfseCuIz2Dn/0ugs/aEJOMDkR1b1p8D
         gl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709713010; x=1710317810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTS5XY8s/SB49nhKp8RUK1O5fLNMn3hDEEbsJMc9miA=;
        b=o/Q6Tsgra4rIU3dEGWMJHvROFE10WSHEn4qvC8zZK7LbdgLfe5IqipdI6dG6VyIVrr
         IKCpCFh58K+8G0JkhdBlr8bEI2GSagqvUH11F1uL3HKvGMTyX4D9RDlFJLqoQ1cfpqkS
         qAdg/RNwjpz3S4QI8fC3Y0IMK3sCmGsXyQ4LydVhY8qLfsI8g8N9HQKDzuelQFuGJ/u1
         D96QoAe2m1GNUEX7p/V5EYPYQ9uVt3qrSp4g4uOf5/Zw/YVEMGof0+vCz6+TV7Svw6RX
         9iprHaYgZ21/FcIcJ+OS8mbPfsyjyqnfTF6nlyuTkX/jQ6M23g2LWUGtE/Rv81MoB0v/
         5Yug==
X-Forwarded-Encrypted: i=1; AJvYcCWUR3orap2AeJMtpt0CIzMiD4XtFDnAl2F+jmuTMta0Ecsc4VsdYHpLeh6GAwAev2BVaWq7G4Z6FwOW3K0iJ66GEy7w6aHhHTJu6YJRYQ==
X-Gm-Message-State: AOJu0YwGWVOYtSHOoc3zDKs5ObDo0V5t5huYT8SI7BJIGHWpPuHMjhiq
	TnGN8GijFUusH1PsuAbaHRtdXKGJKwkYu/pG46o9arauwhz19OK2B+qGi7ewVMI=
X-Google-Smtp-Source: AGHT+IEgaHSdksPyWwI8qXV0kLecP/kL8C/QFpX5KJwzlk00ddfN+2+dolSWeoST46cRkr7LtXpzUA==
X-Received: by 2002:a19:ae03:0:b0:513:46f1:f9cf with SMTP id f3-20020a19ae03000000b0051346f1f9cfmr2671834lfc.59.1709713010005;
        Wed, 06 Mar 2024 00:16:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s9-20020ac24649000000b00512dc23bedcsm2162366lfo.99.2024.03.06.00.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 00:16:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 06 Mar 2024 10:16:45 +0200
Subject: [PATCH RFC v2 1/4] dt-bindings: net: wireless: ath10k: describe
 firmware-name property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-wcn3990-firmware-path-v2-1-f89e98e71a57@linaro.org>
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
In-Reply-To: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fe8+GtFdC9olGNH3KClNdX80yaQnD8GK4+UPZdW/CLQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6CZudY3K+ERBgn01quv3X8bd6xQuJWaIyalJA
 c+k4QH2lX+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZegmbgAKCRCLPIo+Aiko
 1anHB/4yzEiv8VSiingmEI1JCac3UkFIWFWh+CZLWXZg7RPJ9Dyc279bV5TL7vQwqmJE1AXGG3n
 7dSo2z8dXpcNlJzouUEfuWljFKbWs7m6JLeZakJ68QXRIJ7iES1n6tDi3OHGmQDu+Vuo+nkTPMt
 bRx5sgWjIc0EjSlY1M6Q+wWHW9F+vIZww+LPJ95CDO50u6M8R8jCSmYAw+Ulr4KJ08jEiXIXpkd
 54VuzZcg0zu8GZCrH5hwTEuXJGO0SKN0KhMDa9NGY8RCi0IM+1h7ZlXZfrNR+eIpepENSVi+k+j
 1/ZDr4pgr4Zqrjzc0MUvNLBgGO2iH9CMQLdr70OJgVmIOGOn
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

For WCN3990 platforms we need to look for the platform / board specific
firmware-N.mbn file which corresponds to the wlanmdsp.mbn loaded to the
modem DSP via the TQFTPserv. Add firmware-name property describing this
classifier.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index 7758a55dd328..d978d850ce93 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -72,6 +72,12 @@ properties:
       - sky85703-11
       - sky85803
 
+  firmware-name:
+    maxItems: 1
+    description:
+      If present, a board or platform specific string used to lookup firmware
+      files for the device.
+
   wifi-firmware:
     type: object
     additionalProperties: false

-- 
2.39.2


