Return-Path: <linux-arm-msm+bounces-21622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA4F8FB6D3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 17:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2738DB2784F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 15:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B626143C6B;
	Tue,  4 Jun 2024 15:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eWwVuLMg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5076A13D524
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 15:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717514433; cv=none; b=dOtWAxaegd2D2mZVK9f+gyY46pS9nLzJgnEQ0CK6EV1Qmt/Fxu46B0D3GQWJlXMJv6oKCWo/llUPX4enS7XgsJkcrBBkxxqtEO7TQcLKT6Paa+M3SfFyBY3gN+Jede9FXL6KYBdk0eM3wKS7VhAwBUMiauGl/0A9SZY1+WbQOYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717514433; c=relaxed/simple;
	bh=DRlJ5yB+jL9oj7S5uPqNBdhic3bTfsOGq2BvTaqTig4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SUT6jlVWFzonWmN/p+UV9qt+WtKT+bo3By90AMAmWBlttQQzD9jEAIkRxGZYKWsxFm7fcvGGfiexNTzUIEU4N9Zjr1r2R4JdcAwAx/v3VNDcXG2BEOanRDClJ6t1LiCTpWr1RqPU6jSfxaxeAIprQtP1j5IdU+HyxE1qCpRr78s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eWwVuLMg; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57a68b0fbd0so2227672a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 08:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717514429; x=1718119229; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qu+Ktqbr70Fl0EXEKSWGa6Z8asWwZOwbqMGQT7blGcw=;
        b=eWwVuLMgc2nKIgKtITzK+Pcns6XQG+JAqelrF4128Bmp/bOWkuYxeQ3adbGdeq/Zrj
         4LmEjPPGSim06jLKmpvGZfOKE0zPDeBz8z6s4nxbR7HhULyKbfFnkUMobkL3oAfW8See
         UF4jpG3ZvmZ0mgUMDAC0zuW0UzGKnx2YFtyzvhrZVha9uycgs2wzW4GhU+rF9STdzv4l
         DSB+g8+4u7BcfnM0GMpK7pMH+xSrRqATEFmDNp9wX56KWRcxREt8H/YSVsKhTnSgo8J0
         Hy773YFejQ70g+tHTJfF1kq3Mod1WkFCWvJ56uFaFK+C3Ul7Qd2EECiTH/opNqd4l9wX
         tQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717514429; x=1718119229;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qu+Ktqbr70Fl0EXEKSWGa6Z8asWwZOwbqMGQT7blGcw=;
        b=UaI/kw+j9D+rTgE5qTSdLZh1GmyqGTwU/F2FyhUWjdwyyy0FIba85Prdbfjy4Onvkd
         JvaCqAcpm02x+zh/V1S0+RCOGwe3Z8W8g+rcmjgAerBGte22Gdu1pVHPKXZ7uDE2uU80
         iKiIqqf64Fp+Fnu9PuJPpy9p6/2+nWCT9kAf8vqrZ4fwa1I/yXnkcyk8o92d+0CfsS2c
         iddjt2mQ4tnKBeZfDG6mwGq4Uirn8WpUV7SfcqCWe4OjlgoK52J5PX87y7QFB1VDtAYK
         1pBHkR39Rk1hwwg3r1M4CvwZrV3nPRbabWCi3eSjRsl0Msjv4sAkXzVI0JmvH9hYBeMC
         9CVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQiBIPENrGELgBq8AZNrA/iDMJ91gSyRpCcCfJ2wWfBkNUavGaHOmt5eFBu6C0oMyKbDD8qeACpenvov+hq9gO93rxLaR3QZGuX4KDzA==
X-Gm-Message-State: AOJu0YzBYY1kNCEWCLVssgzsQzelil9H7SGkchxf5/xWgdd3tjD02+6t
	WkIFW15wZ15aj+YVdh4rhuYSTmESk3gohL/ZK4XtgejuXDB4km2Kh1wM2IGzlIzshXlRGCg2eZP
	f
X-Google-Smtp-Source: AGHT+IFT/gu+iXIw1FyazFLHgySd1ZeZkBXTazh7KSbQtI8SI2vRyQvZs4QXU0Ws+N/sE/bijqRglg==
X-Received: by 2002:a50:d011:0:b0:57a:254f:67bf with SMTP id 4fb4d7f45d1cf-57a6ae8e518mr3135539a12.27.1717514428495;
        Tue, 04 Jun 2024 08:20:28 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31bbbe18sm7540793a12.37.2024.06.04.08.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 08:20:27 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 04 Jun 2024 18:20:24 +0300
Subject: [PATCH v2] arm64: dts: qcom: x1e80100: Fix PCIe 6a reg offsets and
 add MHI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240604-x1e80100-dts-fixes-pcie6a-v2-1-0b4d8c6256e5@linaro.org>
X-B4-Tracking: v=1; b=H4sIALcwX2YC/42NSw6CMBCGr0Jm7ZgZsEJceQ/DopQBJjGUtKTBE
 O5u5QQuv/+5Q5SgEuFR7BAkaVQ/ZygvBbjJzqOg9pmhpPJGpmLcWBpiIuzXiINuEnFxKneL5Ab
 T1cY23Ajk/hLk9HP91WaeNK4+fM6rxD/1n9XESMimrqRzVnLs+dbZBn/1YYT2OI4vUR0/m8MAA
 AA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=DRlJ5yB+jL9oj7S5uPqNBdhic3bTfsOGq2BvTaqTig4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmXzC5FC1IMRZJNSzyPlX31zXD+CdMbSWI6a+p8
 Ws82r7lu/GJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZl8wuQAKCRAbX0TJAJUV
 Vs9iEAC6OQ4ab0nzj5ojscz7+5NTPP+3zCXCBOk8CV5VAEUjUwcoVaL3vLFpe2jgPAEnuEuLDG9
 7WethkERUKPF99kNhJaoEJOs/ny3z5hWxskk9IZ+lKXZZ7EcvQ2qtu8oXSNzdhYG8BQVWvH1+ke
 noG607lzURYgNi9KMck5xWmTR0xXIO0HREuFMj642/kXKbkRkkbZQmZiEt2WjJQAnRKhbrYm3JR
 XrneQHBaKmF+nE24CQodXxFRoAUKS/Atf0tqPEG3Aht/UTYGTk/byqLXbrFJM8OzTjWoGXJjDy5
 AKpAaj1a06FyGcRtIb/M1lGFsWQN6MorUtdL7KywMFnEkmf03Xd9+fyGNHUi2JTDejNIhIumyQP
 7BfUbXKtvhjE7fFFM+hdcb/fK4+DVQaRz5t3/9WDa91aoE9TCfYNFol0alEt73ct5veCN34246B
 VWjtO2YBk/n304P1qkQZ+6I9sP2sN1KW5oAP3twXCT/BNc3sFtHIXoWr27PYbjfCTl9sj90q1qJ
 4+XhTaMLxNcwXCwCb7+Tc2KHG6F6BYgke37/7R8O4uv0T8/MjOIGC8ljPrM+lc571Hp7gUPc8Gv
 bwFRNXWPSyHleL8DidVp8F1Eddb5noipfjQvHgy6R/T1nlu5cqXm12/JzziyZCCfEgCCyG/bltD
 6Ax2kQhZ9Mojs9w==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The actual size of the DBI region is 0xf20 and the start of the
ELBI region is 0xf40, according to the documentation. So fix them.
While at it, add the MHI region as well.

Fixes: 5eb83fc10289 ("arm64: dts: qcom: x1e80100: Add PCIe nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Dropped the 4-lane mode switch patch entire.
- Fetched Konrad's R-b tag
- Link to v1: https://lore.kernel.org/r/20240531-x1e80100-dts-fixes-pcie6a-v1-0-1573ebcae1e8@linaro.org
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index cf8d8d5b1870..fe7ca2a73f9d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2818,15 +2818,17 @@ pcie6a: pci@1bf8000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-x1e80100";
 			reg = <0 0x01bf8000 0 0x3000>,
-			      <0 0x70000000 0 0xf1d>,
-			      <0 0x70000f20 0 0xa8>,
+			      <0 0x70000000 0 0xf20>,
+			      <0 0x70000f40 0 0xa8>,
 			      <0 0x70001000 0 0x1000>,
-			      <0 0x70100000 0 0x100000>;
+			      <0 0x70100000 0 0x100000>,
+			      <0 0x01bfb000 0 0x1000>;
 			reg-names = "parf",
 				    "dbi",
 				    "elbi",
 				    "atu",
-				    "config";
+				    "config",
+				    "mhi";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges = <0x01000000 0 0x00000000 0 0x70200000 0 0x100000>,

---
base-commit: d97496ca23a2d4ee80b7302849404859d9058bcd
change-id: 20240531-x1e80100-dts-fixes-pcie6a-0cf5b75a818e

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


