Return-Path: <linux-arm-msm+bounces-76257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFFCBC271D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 20:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2BC13C5FAF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 18:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C942E975F;
	Tue,  7 Oct 2025 18:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GFtCGwrh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5A22E973A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 18:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863230; cv=none; b=Nax9vI98wY74G7DazuPVo2yDns+c10MX9uMSYwpLCaLNaoD7H36rj5qPSnqFTk1QOS3bs3+GQ6KYVQ87dwjPdr+EMqxUdllGG9pWVxzFJhDLPN8V3Dbaw3GxuV6u+a6NiRezIkux/Cn8egexRG3U9+YvQQ9PXXROtInKmKSrVFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863230; c=relaxed/simple;
	bh=Op+QTRcfwfbsxIix4ouiAegGQuvQEcmggnJefJxWt30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=F3Fe1PKGGdGg33hK+budgymnB8NNOOtitGBOLApEl639H9uXz8ZFE7C10dHUY3+63stqkZF1NWa+IfRKCE6RYgKS9RAikDh/J47cuPn2TyUx/AY3KG+dsiWefUNUBO+3919G9cQRxiIxUEeSFWh993wxbjrDc9cVt9vKiosib1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GFtCGwrh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e48d6b95fso57310505e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 11:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759863226; x=1760468026; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1B8FMEvRCjdBduWbBN4BHAuWdLmc7inqVvHYEcRSHj8=;
        b=GFtCGwrhkdsYQssycM8owoQtcjBxYxvPimzMEppIZXwkGysbaUiKbz4o9P7whVkDpP
         CEt9by12pLtniK+RV7vOonDINzTZtmzZKuY+pwKxcZ/TwAlZzF4ZzjHf2flZoCSTknvL
         yQ1N4KLPoTJXhuXiB9BLefeBKEh3YWRERUt+bfKPxneY3ERs/ma2e7Tw4VYCmda65fxJ
         GWQaHbRO4NYcdaRSRV7btDjVw1NfEKCY+o1KCuRyaC5BokHeWVzUUGRhHM2FvrrKLaT2
         z4WNlDo1lKoREAjzWGMuOmzgRnzFx1TJ0jzyfw7+c1yltXDdTVEnjqgvtHl9xEb4YJvR
         Bc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863226; x=1760468026;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1B8FMEvRCjdBduWbBN4BHAuWdLmc7inqVvHYEcRSHj8=;
        b=lqI114AehL7VNbJTYOI9WHJSpTxsfUBQDvuu1HNUoP3SoGRkhAyzePHkXxJbrgLH7E
         sLnQNkW6aCHw5j/SgKG+tuiV58qAo3XAC6P5m238uVy43K2gDGijEBZxf5Uo6g92fcEz
         jzIH7ODvv7Sw4JBlePWUDELWB3rWPfPD9UnKCOGv0JYbdtPIFDajvZV3lCCd+eQ0hpPm
         gaX5QGfKcnAp3N0EB8r/vVr05HCZY3lOa+asQQrktetiaa/96/Q6hBFHp1e0QMCNu68m
         K6Ly+Xb+0pjw7gmQ5PDDYSTR7qasd58n/b5Z6c7Xqocb5075r6dKoeSSQsNzJBmUt08J
         Sxwg==
X-Gm-Message-State: AOJu0YxEJXFRWvZHjhRFEO95NX+9y4ftx7Fkn31dsA50NdiuOY7pH+xR
	wcJ3ail1ZeN1rVic1hiNPMjdCZcNvUoDNPuoSrTNO+zbrmdPEXyCD13DjZFIdYl1uFKdMRN+ln3
	3jJf/
X-Gm-Gg: ASbGncsd1E0IsufT2idtN61YNnKlUdlmXFV4kSYWZdnFTBLnW3VztOPK766rlBpR8V3
	lCxq15X0X2DzYJ0o3t3VWVINm/RyfXF1Nwj9YXA+sZ9sUbFBe//MBh2vyqDYKqukKI6i7KWfU5N
	VAfTZkQjukaUhUY9fKYRWNja3391S7f2Mg0bikVhu9Fq4wtjVdQEeX/SJG0O1LZLJ5gvEWIW5TA
	EKf/63Xl9QzOZm2vJwmIkHQ64jF88akfhELOYq4iKDgMWNrHzQ2PUlKn9fiED8mu6udkaG8Mqm3
	Kiw1S/pvPmrDZ4aZ1eIqDuQ/IkEO2FV+iju5LhVGbvi4t+/9ajQQTkUbNeaTRuuC/vVPZNVzMSW
	dkeqjDW/g/9JWXfsBSi7F+zdGJo6JNxqX0KQzHNSs+Bqe0wBb3MD4tZ//Xd/YHYG9DfIaEGY=
X-Google-Smtp-Source: AGHT+IH5zHVLrizZeH0JOY25vGwDqk7lqwvYB2VQUuAGyhwLO96qot3/7SYhbnr39uYNrtvz3cFCdw==
X-Received: by 2002:a05:600c:4745:b0:46d:cfc9:1d0f with SMTP id 5b1f17b1804b1-46fa9af30e5mr5064635e9.19.1759863226080;
        Tue, 07 Oct 2025 11:53:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f01absm26399548f8f.44.2025.10.07.11.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:53:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 07 Oct 2025 20:53:44 +0200
Subject: [PATCH] arm64: dts: qcom: sm8650: set ufs as dma coherent
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-topic-sm8650-upstream-ufs-dma-coherent-v1-1-f3cfeaee04ce@linaro.org>
X-B4-Tracking: v=1; b=H4sIALdh5WgC/x3NTQoCMQxA4asMWRtoB1rFq4iL2qZOFv0h6Ygwz
 N0tLr/NewcoCZPCfTlA6MPKrU7YywJxC/VNyGkaVrM6a8wVR+scUcvNO4N71yEUCu5ZMZWAsW0
 kVAf6aFJwmV5kPcxYF8r8/Y8ez/P8AbXTiht4AAAA
X-Change-ID: 20251007-topic-sm8650-upstream-ufs-dma-coherent-6c0da5febe16
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Op+QTRcfwfbsxIix4ouiAegGQuvQEcmggnJefJxWt30=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo5WG5oSqx1X3ytDB+hQonl1G38RphNXIieR2OJJ/J
 QgykVcqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaOVhuQAKCRB33NvayMhJ0RdoEA
 DQdY3TtihKd6kF3vihFn8DFB4XXmIepTKeJbn5X+wHti6bMmXrMtOmqtClmF/y4xetCM46ktSNh2eE
 AGoWxAh0+0dhaTrNUfOhZHGkeUB2SiwGOpiaiMZIT16w2rFz8pBQHbNMTELtja6E7e/zkQ6aHMSoo+
 3vDJgllxAZa7bV8NaopaMKGHUeoUi1Y76kdn8BbcMM2+Hh0XQ/1kt5+oETiAOmJ4WJNdSHQzqXo6Ls
 0tDUVNqokvRigiIT0uz7/8vfBKqzm9s0WJdm2vlykhZkC4sr+oUj16T7OK9vyIGV7xp9ENub1KACX3
 DBaNLRU333kT5/yworEhF8ziXWjFhIMLTDA6eS9RCC54mLCMOSsKco+T8L3aXa/RPSx/DkLXQGr+vf
 pSoD8P6qRadJCtoMHML6egLtYmWb6mTE6CosbyFZsp6vfbYNiX41KADZPyF1wgiclloUPiR+B2xu5f
 MdJee3v1ZGGncxNUJ3kColvabHJYAzT0sFU3h8VvvHG/eDqHB/DKKTzmi6hn+FzxwwJ4ypShF+4xhU
 US1WEg7rdcVV5an1Ea030YXXbrqitgNOAN2N037WZwENcAZI8HoGrBJ0wtqOq7Lmcx84o9KO6ez7pd
 Y2G810bN8csB0kuz/MWhBGYSGbOciCA3sF/VfDDutdpjDMd4+MZXIjEDnTBQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The UFS device is ovbiously dma coherent like the other IOMMU devices
like usb, mmc, ... let's fix this by adding the flag.

To be sure an extensive test has been performed to be sure it's
safe, as downstream uses this flag for UFS as well.

As an experiment, I checked how the dma-coherent could impact
the UFS bandwidth, and it happens the max bandwidth on cached
write is slighly highter (up to 10%) while using less cpu time
since cache sync/flush is skipped.

Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index e14d3d778b71bbbd0c8fcc851eebc9df9ac09c31..d7ed45027ff453a2d7988678c9e9568837a1c086 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4020,6 +4020,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			iommus = <&apps_smmu 0x60 0>;
 
+			dma-coherent;
+
 			lanes-per-direction = <2>;
 			qcom,ice = <&ice>;
 

---
base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
change-id: 20251007-topic-sm8650-upstream-ufs-dma-coherent-6c0da5febe16

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


