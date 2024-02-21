Return-Path: <linux-arm-msm+bounces-11974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BD885CEFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 04:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6DAD1F23382
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 03:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8025F3D0DF;
	Wed, 21 Feb 2024 03:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X8S00cOu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27F43D0B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 03:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486959; cv=none; b=hbg3rNZ1e0/p4/Dgb9JZ2Lxtn9GE2c1ACJeiiLwXgroFDMqZHrqqBHCOuoXj41LYF7Wl5kYhvzLX4hlhYeiSFw1hIatzk+20h6S9PTmHwDtcyGO2ErRBaSQ7AZKIQ1lc2zfr41F+Ux35S1fT73u9mmQafdDOjIKhemWzjSwawjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486959; c=relaxed/simple;
	bh=vlmqbgnc2zE6uRbXQ5io0O4A+An2Hq2nnGjL7KwYPjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YLwegcieYFlNm9ismi/ynuDNeHQ2xnK7YXzUd8iy6Z75RaQR/bsu3eElgQvrEPW7RClYhavD1W0G5Dl7Zu33UW9lZWzKS8+32T8dLIjlEh1F4ALpSotPRgiOGjYFYbNco3op9oQU1gTiDvPsiwijFBC/qdutmWTAhrXsiPLOzRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X8S00cOu; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e484011e28so752498b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 19:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708486956; x=1709091756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wT5zJKfe3mJSIBcjj+mcWeIeOdoNipqlSFuaNJP81Ro=;
        b=X8S00cOusS5jATk3guRg7LRsReBLOFuEh8w+RW0Zmb348xhRhIqyjNX0hzJKtphKBg
         dr5Nxcl30r4cx4sFirM7RItmW2ipFbqH7hXE19wiEZEU3YD7aQQyqkPoyUVdozJvy5Z5
         0FoDTGww6tCbeJpc+WYK7BAuChV4iRAG3plP6zUQN4v+XRc4aAf1MkRTlGMnbJSjsziu
         EedyZvEYviicqBpvdh6SII0pQXnGWosQQFv/7IOMT1g0drL7+QOlPSZkKlX5RNd11SHJ
         WCELqN9pe0MopENCb7ZvDCTZUwkENw8wHWe0OhOh4ftDjblBwk+EGHodbifFVyRubv5D
         7CzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486956; x=1709091756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wT5zJKfe3mJSIBcjj+mcWeIeOdoNipqlSFuaNJP81Ro=;
        b=cXknwRlh4OEswOtZZ6a/hyE+cY7wm92p/y1b7vv1OL2HxeSkmEg+rkEPs2z+Hh0GuG
         mQuKP8ToAEV4BQjZar1jeQO25v1zjlMZTSP+877ine//D64qXOjiPkRdDYts3nenq4sN
         5aAdHxM4uVEMyZ0GgI7x692Cuqxp7dFAUIiiIfDl3DZSfcAzPYKBQ+OM6iJAgMklbRFz
         ZHQoZ+I785gDHF1ahHWsonW1AS+zcV5/DLAB86cdtabKJxRFkH2DhauGnNbLk/bPKLGX
         NvjCgyojjj5JPOz4tZBHQTJKBnZpfGFKaPMQnTA+T+lTc/63BDjTM8ZYASprbNilcH6H
         le4g==
X-Gm-Message-State: AOJu0YwhznPavo2ERMt9T6QdHc9x2P9mS10tmNMtbyI/ygEZmg2wNAtM
	H582Dp20D96fnbduOHJWD5D/rP9JOvDkEGEjGm/pX0PgdVz/EJYDRNwZeVHEtQ==
X-Google-Smtp-Source: AGHT+IH4GNxHl26Lncg5+jO6OexRUEl88IC5CgFRF19guaqlF8W7eYHJXf++KDHXHJiE0AkPrzzoNg==
X-Received: by 2002:a05:6a00:4f92:b0:6e0:6c89:e308 with SMTP id ld18-20020a056a004f9200b006e06c89e308mr7579623pfb.3.1708486955880;
        Tue, 20 Feb 2024 19:42:35 -0800 (PST)
Received: from [127.0.1.1] ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id o23-20020a056a001b5700b006e466369645sm4436231pfv.132.2024.02.20.19.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:42:35 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 21 Feb 2024 09:11:54 +0530
Subject: [PATCH 08/21] arm64: dts: qcom: sa8775p: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-pcie-qcom-bridge-dts-v1-8-6c6df0f9450d@linaro.org>
References: <20240221-pcie-qcom-bridge-dts-v1-0-6c6df0f9450d@linaro.org>
In-Reply-To: <20240221-pcie-qcom-bridge-dts-v1-0-6c6df0f9450d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=vlmqbgnc2zE6uRbXQ5io0O4A+An2Hq2nnGjL7KwYPjw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl1XEGfNb2dYai0ReHxSZcuQoXXDUQKnXKg8McO
 thFk7Ih2/6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdVxBgAKCRBVnxHm/pHO
 9ZMhB/9zerMzSx5fPfv5g6wel9iiAjiESnN6iQj/RwJaLAL6RBXsgdSr1aPuuVrewus1+sE8gNI
 R8nhp35vemjWeGa1PXORJbDOpLkNpg62twtc6aNbkQ6ZPXqOjvGLhXDz+Qhsm61PbbJ7FYThFgM
 cTafYnUWkTnNFZ9uIVj9YPpSHgT9/28FNmiRjqzLG9DT+tg0BV8kwZq+Ci289uH52ErNj1OxKUz
 I07Zgs9bl1iOANT79/T9aqsdfCIdHtLnpS6DVf4vU1hFI7XDf1zQgGPPDa+k9ihTYlPavCNM3Bu
 0meHRN76lIy2I4CKruq5IWtdM9BURv92usq/sKKHTyFT09Ed
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index a7eaca33d326..2d810d64b607 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3584,6 +3584,16 @@ pcie0: pcie@1c00000 {
 		phy-names = "pciephy";
 
 		status = "disabled";
+
+		pcie@0 {
+			device_type = "pci";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+			bus-range = <0x01 0xff>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+		};
 	};
 
 	pcie0_phy: phy@1c04000 {
@@ -3684,6 +3694,16 @@ pcie1: pcie@1c10000 {
 		phy-names = "pciephy";
 
 		status = "disabled";
+
+		pcie@0 {
+			device_type = "pci";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+			bus-range = <0x01 0xff>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+		};
 	};
 
 	pcie1_phy: phy@1c14000 {

-- 
2.25.1


