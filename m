Return-Path: <linux-arm-msm+bounces-51892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF34A6847D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 06:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C87B23B563B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 05:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B6624E4B0;
	Wed, 19 Mar 2025 05:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uan0LUyJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6D2A29;
	Wed, 19 Mar 2025 05:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742361052; cv=none; b=SJytOdlCZKQmU6zHCmqeejLnaYIaLbwuKA/5Iel+7UPlMIjsUAckV/rfhsRu337TFC9BZw5lB79LRTODzbWwW3ts+diODCJEK5nBcBSzdm8tSW8qfTdocxvj+OPOQVV765cEC7H/Xu/VZIbWeozJ25M+mqtWC8R0Wd1oLW6ebQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742361052; c=relaxed/simple;
	bh=9K6WGiNyXLEWMf+pKTpq+vrMLUXATUFTZFZdLOxv080=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YpTmF+0TeWVYQues8VCMVIs+JMG6DdnLJIPQTBiXqYir7SI4CXF4cLlRdUK+51D9Zt49A3Ifil7aJlFJfqQw3D5ycQ8jm7dJVy6/2FUiN8h0nJViWRaf7nxvR1gIKjQLbOf1kCdibGfkggtOGFJNBq+XecnXDjKHmiTEBk1gJqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uan0LUyJ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-224341bbc1dso122690145ad.3;
        Tue, 18 Mar 2025 22:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742361050; x=1742965850; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wXTO+0tQ4++St4DdogFMVrtMcS1fXva0YCFwwmEEQwg=;
        b=Uan0LUyJvp5kUvbmGDhi2Ho71X6s06kRX7tmGjhPtGzSJsGkpK80GgYl6ZX+tkzjBu
         q56Q9L5WzpasIJAHO/7AfP2WQMHOWcrULpn4l6KAfNfypOhEnRAZ2UCExkOahFOwyVkl
         5/55Prj7kCRD46BdJZPdh4duHzzqDSSyqw4ooOxvsZoG0TOkGehGEH7kHbDft+LDGvZG
         AyClNES5SoEyshCbTaLtjc5KfWTPuG4EHWc1itkrpF76s/V6+GtQ2T7jJ15bgP++8e1O
         tbdJUWRaxiV4gagz5VTAZCDIq+ulVuPFiUFv+eacfaOQ3c8Kp/RbZkShjWs9IwZj1GHb
         BQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742361050; x=1742965850;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXTO+0tQ4++St4DdogFMVrtMcS1fXva0YCFwwmEEQwg=;
        b=RmPU8YJJvgi3qQBNrIe+xzEYWgB6TAmxWC8tcpVVSFmRyuoPeo3m9kTZ1RpeqpslVs
         YC+Osla+9X9zk8zWVs/G5Z7CQL4Khc9m2G4eBhsamFPLNtWSsVtafETdH/i1XESzKiNd
         ro0YXT6Q/rmtdk/DWob6So2z7BF9QFNXQ+I6XVjp7gV49ZllDgQRkl1HX3fNhvYO5Z/O
         f/1kZ59yMkWChMgN0/xSynfIYAhlzs1FbR/YgRKXjkfageGcdvooBZGF03rUFRSCskXq
         oKHQtcGm3Ryp7cNHJleGEcYeIftLoW14CYA3DCBiKW6znOw9i3LRnSdxYgj4gxZASWAH
         N6Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUIVi9QseBNsJcNAgm1FIevMKV3YFjJ+HBqAKcaO8Ps4xoRH/OR4ORmXjwdvA0e5db1oQyHXIOAGNkO@vger.kernel.org, AJvYcCXRdL09q9kZvHKVsPiY8FJe6zU+mZpbGE7zJa1hFwysxe+KTRZS79sSdxU1tDT9aBlnePBr/YdqRFWp7s5A@vger.kernel.org
X-Gm-Message-State: AOJu0YyTf+2kYOm72kkuguC3vtPBmVXbMRYkB+YD24trY5NpNc/JJYho
	KXhDaiHmYGkMSP7sp3UwzSqUICV3tYMzDJ6+dMKkzB3gOdE64SkM
X-Gm-Gg: ASbGncucpmvMXyjo4uDbdliLaFReM4dbG4BvC68iLcTALalTV/3ae0In/Qof4fWMrnj
	44xk/MukLk8w0jRSIhmlB8GFPvjyTYL1qiZHZRkQR1BjsEzRvuqje7HTWTCz5lfZW1sCHhda/pV
	LkRx/9v9ZzW2R1Hw6Q0z5LDTtF+KuWBEBI24D4wU0P7OHp/wkgxkW+2phFD1+qQ8Eaz6vC5cD3V
	MTry03+Xgqo3l4Riloa67aPDYa8AeUAcbbJdf3VV/SzMGuwFjRns2FiR1gjwSG535w4NIiNSgZq
	Qec5iU8S7pLEjwIrReIkhtkr/G1/mLI+apOb1slSAidlTS/sBrI0CwSN
X-Google-Smtp-Source: AGHT+IFTXoznq4fx5P6CPA89QSOAflxCU5yvg1s0ajp9P3YZ7yIgXjNFD8ZSqqeIfJxVBlzub+qshg==
X-Received: by 2002:a17:902:d542:b0:224:6a7:a5b0 with SMTP id d9443c01a7336-226497ffafdmr21169865ad.2.1742361049976;
        Tue, 18 Mar 2025 22:10:49 -0700 (PDT)
Received: from [127.0.1.1] ([2601:644:8501:1640:50a3:6f80:2290:6f18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4af3sm104875715ad.236.2025.03.18.22.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 22:10:49 -0700 (PDT)
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Tue, 18 Mar 2025 22:10:47 -0700
Subject: [PATCH] ARM: dts: qcom-msm8960: add missing clocks to the timer
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-expressatt-solve-dts-errors-v1-1-14012a4bc315@gmail.com>
X-B4-Tracking: v=1; b=H4sIANZR2mcC/x3MQQqAMAwAwa9IzgasorR+RTxIm2pArCRFBPHvF
 o8Dyz6gJEwKY/WA0MXK6SgwdQV+W46VkEMxtE3bN52xSPcppLrkjJr2izBkRRJJotj1LrrgjLe
 Dh3IoZeT7v0/z+34sNfB2bQAAAA==
X-Change-ID: 20250318-expressatt-solve-dts-errors-359f9d91c86c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.15-dev-8865a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742361048; l=1226;
 i=guptarud@gmail.com; s=20250208; h=from:subject:message-id;
 bh=9K6WGiNyXLEWMf+pKTpq+vrMLUXATUFTZFZdLOxv080=;
 b=p8A5nK0/sXen7GL7s5HAwito2uNahUCx2fiGdVzczqj6Glh75RylsoP03ocoRAugv/441fS0x
 tZ2f1yOTa8nAsJh2/DT/GXT/TajbUBocF62lWcyUKsl6IxpeuDYNMjM
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=5lJNaiR/Bu7edToWFLriO5zXOrVqSQWrBKbAKwuEw04=

In order to fix DT schema warning and describe hardware properly, add
missing sleep clock to the timer node.

Solved by Dmitry Baryshkov on the APQ8064 SoC
Link: https://lore.kernel.org/all/20250318-fix-nexus-4-v2-6-bcedd1406790@oss.qualcomm.com/

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Running the following no longer returns any errors:
make ARCH=arm CHECK_DTBS=y qcom/qcom-msm8960-cdp.dtb
make ARCH=arm CHECK_DTBS=y qcom/qcom-msm8960-samsung-expressatt.dtb
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 865fe7cc3951..06b3fa5e1acf 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -112,6 +112,8 @@ timer@200a000 {
 				     <GIC_PPI 3 0x301>;
 			reg = <0x0200a000 0x100>;
 			clock-frequency = <27000000>;
+			clocks = <&sleep_clk>;
+			clock-names = "sleep";
 			cpu-offset = <0x80000>;
 		};
 

---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250318-expressatt-solve-dts-errors-359f9d91c86c

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>


