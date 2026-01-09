Return-Path: <linux-arm-msm+bounces-88245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0DBD08598
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B51AB3051C43
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B672335568;
	Fri,  9 Jan 2026 09:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1lMPgbW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86C233509A
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767952370; cv=none; b=Kacpp9e/KdfWzlhKvk1arm4F3WzSQ/1lm0lU531y+/d8p2uKqP7LD4+0RJI99oRUhX3o/s6vGQWNEukjOqvmkvy8wxXYHtYV/PMK0fPdN4ihgRkNARqQV01ovZZua7Wt3sZKLinGgxFepsr346lHBmyypn+ptL1SpNvb7E423N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767952370; c=relaxed/simple;
	bh=k7t2jg8TSxp8KRoqzxovCHEUEWlAjgb/zGHb4mBEL7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WviObC+tzai37kLq5HEGfhPcmr4yp8P/5T9FtSzSOiZUZGVhyG3QP/DQ+2Wie30LLvMggPtylU6fZLHepTa+kAqsvyY/mO10fo3qZHTuUUh/YU3TMIzmclYEhuduDQ6up+u5iDPupHj0er/w+qjufSc14drZm5Z+yVQXKeEwwoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1lMPgbW; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a12ed4d205so27181105ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767952367; x=1768557167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02VxwnYRNqoWSCIf3F0v0qpEcuEEv+/n0v8KVZh4ubE=;
        b=J1lMPgbWkXoKb4sSxYAyf+etGN+1ntQVrbX2bHi7jrnopkpTnp8XMNvfJM78Hw1pkR
         fdfF2P7dxIMXo9X7OJFOo85ZXH6oP7wPOvUijT7/Ba5/ZFBh8rh0kl0toipudjQv2yM5
         JI2jGz24q85pjUWmujfV6ScU7Caso0t6dK0BzIMYo3MfmRJaRQRE7i5geV61hKlWHW0E
         n2Fs30ZGoh55Xk0gyU+wSRftaBbjPAsrj5WulU7AGKVZhWZDIkDjTYxO++C4mP0MARDi
         ekhQCJwjoaVlwXLwBvmqkNk8rpsYdCBf7UCvSlxt8YhC9jjnp/yd+Cp4S85VY/fGnpmZ
         j69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767952367; x=1768557167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=02VxwnYRNqoWSCIf3F0v0qpEcuEEv+/n0v8KVZh4ubE=;
        b=a4URT5W3ER3KS5Oc+5rc+0XbzOcOS/aAx3yS62KgbE5olBCTen3ctEbRKmJbPwo+tb
         xnF4d3+wrYMQw2Ht11WCOclqiznKK01eZLGAZmjFvUL5sPVQD9qWnT6vt+qEiVOvygjT
         MyKsORsW4nkiYkmzgXqv8Nqq9DQXlwMHPv77uVfO6Zouc4tDVTCkoIDaiBsuL+VPRwU2
         L/lcqAAa8QBXMRL0XeXrgugosdIKjVugvkcsxA98LAZ43shwPRJoUb5QdyDcAC9lZqTY
         Qoq3v2rCpf8MVU96S5KzWiIgm6gOKxEnRdmGa7sWFplMgEb5V6f1dYpfyxcs6nuhwEyj
         v/Og==
X-Forwarded-Encrypted: i=1; AJvYcCUgmt9pWnu0Dt/tGEeQwKeBLVmz9hOBhzEOjg2I8M18asBeDX0rxLHmaLgnZnh8jb2LWauR1ge6b5i7+aZz@vger.kernel.org
X-Gm-Message-State: AOJu0YzostRWgSNr9XVIikHMNz+dOr/JVdcL/btjigG5w1r9aLxOoS9N
	dtcKe6g6cQg0wj+9A4qaczTxURn4KEe833PUMBRI2zhfq4eb+SkOwBYd5swG3w==
X-Gm-Gg: AY/fxX6ycBIqhr0OqFK/QioWqZA/Pb63X/RiQvND9LZ/6G0zwntcbgUKZwyaMSUDErZ
	VSWAjKXAPWdKKnWikEzf4hOThNMotxjEUGLaQcA6A1hKfe0Dvfoy0N/APwkyTUsx3FAagonWybl
	NKQZCukpJhwO3+SNEOcdalUrvOU/bUXlP/ejNy00oPOWy/jjOz3bdlGUebfsYd/BpseOtOmkedp
	L9B6p1gEGXWz9h+keZikIWXTxp9i2HUspZSZKG+esXjm09i/0zdtt7VJV3fX3RnVbDddLp49X8q
	AZd1KHsbXZWBf1HGZppVuqVd9wolmWutZJXkwXwnbjQdzj8fPXFVO31fz+kGPuCAr3DcnJ9sUjP
	+AB0HYznyJREDQVVvag5ZpyvWE2QFOQngwd74Dcu11lOE4bU4otKXazfpZmAWTeDumJylazBiZA
	1SX4MhFEMAuBUKRVdbrczpRs6vdCyJt5Q8dE2dKgCCoiDbTPVdEjYdwqLlFQ==
X-Google-Smtp-Source: AGHT+IFwb6T+56+c5A4a0khX6vNwn/D3tNsn9h+y9Uq+Yt2XiF6Tyn0uGmIMVI5X8uXiWztiG5oUKA==
X-Received: by 2002:a17:903:41c9:b0:2a0:a33f:304c with SMTP id d9443c01a7336-2a3ee4c0025mr98527435ad.57.1767952367068;
        Fri, 09 Jan 2026 01:52:47 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d79sm103081795ad.56.2026.01.09.01.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:52:46 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v11 2/4] arm64: dts: qcom: talos: Fix inconsistent USB PHY node naming
Date: Fri,  9 Jan 2026 15:22:18 +0530
Message-Id: <20260109095221.2847067-3-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109095221.2847067-1-tessolveupstream@gmail.com>
References: <20260109095221.2847067-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB PHY nodes has inconsistent labels as 'usb_1_hspy'
and 'usb_hsphy_2'. This patch renames them to follow
a consistent naming scheme.

No functional changes, only label renaming.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 95d26e313622..c7dc507a50b5 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -4304,7 +4304,7 @@ osm_l3: interconnect@18321000 {
 			#interconnect-cells = <1>;
 		};
 
-		usb_1_hsphy: phy@88e2000 {
+		usb_hsphy_1: phy@88e2000 {
 			compatible = "qcom,qcs615-qusb2-phy";
 			reg = <0x0 0x88e2000 0x0 0x180>;
 
@@ -4412,7 +4412,7 @@ usb_1_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x140 0x0>;
 				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
 
-				phys = <&usb_1_hsphy>, <&usb_qmpphy>;
+				phys = <&usb_hsphy_1>, <&usb_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
 
 				snps,dis-u1-entry-quirk;
-- 
2.34.1


