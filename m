Return-Path: <linux-arm-msm+bounces-6067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEA181FF7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 13:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDB551F219E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 12:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6740111A4;
	Fri, 29 Dec 2023 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xvWXhzq8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15048111AA
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 12:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-555aa7fddeaso1152919a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 04:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1703854403; x=1704459203; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9yisl/qxCJgxl4RARL8Z9GuuogERTl8/KSkOCVJhCvE=;
        b=xvWXhzq8BPIM8wrsxHiZjzme62E/yuCmAN5oHx6e5eNGNX+r35CV/bl7lWugfpPlmA
         PoGgSuerqmYXuxfERpE28FZvShH1rGVdlfOA9NiSQ7JDf9g40RWi9NDJyB+93v9gaLY7
         JY6C3mi0ZphmLSLUuQ/zADkMxfFQY2RW/Dk55psTaA0QezEHEXyHvb/ewpo5uFzJQrA4
         0hqp276mqLg9zSZBndIhXbzk9SNua1BF2lkSI3hJKJ1lHJVrBemQsBYzXxZM5xCaUXPZ
         OfpvsNFld1/A54YhRaO2kqH67dJW/cPF5HuVz7na1Dg9BT5zugsZS7m1PMC2TZ5HVluA
         bKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703854403; x=1704459203;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9yisl/qxCJgxl4RARL8Z9GuuogERTl8/KSkOCVJhCvE=;
        b=ayJw3p2gxtNRZnBXmEd++AWtfB2qbSVHrU8wUYM3VQ6Fs2AlZmAdH/yhI7BMa6sTYH
         BGdbo1NgVeBhjSwgytLShaTvbAdEbP/dcr0L15SoMVI4uBNq2VukVQ6G+FKS7dOs4PWa
         0DIjyGIjJXL8TQ9kyc9yYbcrBa21LmJGlTgY1BGkE9E2cray2vukQ6vOOZlOclp4TsWA
         oKi+qWVEozeTDxOsyWmZs4IiJTqUGnAl8b0zXjg/pCHA7yORW4v8/7ijVt4joMRitXSc
         Xkzel8KNo7/QpDokS+UHBH4yGDFambDkBSLItPQ7VpagttEo5kLFSMomfSAQijgbMIBo
         O+8w==
X-Gm-Message-State: AOJu0Yyund+PpeIbolQXEgL7wLDKr8g1NX0Z8MbZOX0QpW2eos4fjfiw
	Y8uZHWs8N4nM0hf6ZKz7wRi9bYKgs8lPpQ==
X-Google-Smtp-Source: AGHT+IGM12hQGxJrBT1b1jnlmiR9J9LvfpNlKO63uE/B4ep/qHZeEbX4mvQR5FNcuN+Oboaq43X/JA==
X-Received: by 2002:a17:907:928b:b0:a27:6648:cc3e with SMTP id bw11-20020a170907928b00b00a276648cc3emr1885631ejc.74.1703854403273;
        Fri, 29 Dec 2023 04:53:23 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ef5-20020a17090697c500b00a269597d173sm8345175ejb.135.2023.12.29.04.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 04:53:22 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 29 Dec 2023 13:53:17 +0100
Subject: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add missing
 reserved-memory
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231229-fp5-reserved-mem-v1-1-87bb818f1397@fairphone.com>
X-B4-Tracking: v=1; b=H4sIADzBjmUC/x3MOwqAMBBF0a2EqR0wI2J0K2Lh56lT+CGBIAT3b
 rC8xbmJArwiUGcSeUQNep05bGFo3sdzA+uSm6SUyoq0vN41e2QVsfCBgyfn4EQma6WhzG6PVZ9
 /2Q/v+wEs+PRHYgAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

It seems we also need to reserve a region of 81 MiB called "removed_mem"
otherwise we can easily hit the following error with higher RAM usage:

  [ 1467.809274] Internal error: synchronous external abort: 0000000096000010 [#2] SMP

Fixes: eee9602ad649 ("arm64: dts: qcom: qcm6490: Add device-tree for Fairphone 5")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 176898c9dbbd..1e85c43a6fd1 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -82,6 +82,11 @@ cdsp_mem: cdsp@88f00000 {
 			no-map;
 		};
 
+		removed_mem: removed@c0000000 {
+			reg = <0x0 0xc0000000 0x0 0x5100000>;
+			no-map;
+		};
+
 		rmtfs_mem: memory@f8500000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0x0 0xf8500000 0x0 0x600000>;

---
base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
change-id: 20231229-fp5-reserved-mem-b88e822b1127

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


