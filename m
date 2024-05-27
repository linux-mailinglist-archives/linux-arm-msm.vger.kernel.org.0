Return-Path: <linux-arm-msm+bounces-20552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 018FC8CFBEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 10:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FAC91F21626
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 08:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA7213C676;
	Mon, 27 May 2024 08:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PRQvNue8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EE713B598
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 08:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716799373; cv=none; b=hsJjUsD++Ug7v6TODfD06XLZOQblu31FUCGq24N55meukc3K+49MY2a4/mEnL+/2dwcP+gtwzWuUDragD+kRnRQvF0576jZpsE13Xy+tDvA9eFlpexkvMug80k12FPabVTM97ZO+r+XtwndqS/o3LQsZOnpiztP1qRwfb+Hc4cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716799373; c=relaxed/simple;
	bh=bUymvKgHwGJMNeWdO4E2xoRI1NZeMZTfq1gbdx2kTBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+e3Cw0wIR7DcRLDINHzcMiWPbV18NMfEK6NOYah39Jgjif006U6Jp1yNp/xplVVEXA9y8kElNZlPOuh6d6wK7fd7CS0IKRlVUGaWWEoLym+eL47XArfgI6rNzMBzUKtfdqir+BX66CvuadaoBrrt4pIyZSdTLedFyl6BhEllUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PRQvNue8; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-354fb2d9026so3668808f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 01:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716799369; x=1717404169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VaEF4gO72oykFIStkZdCU9USqrBYmrQ/jBFI2aUzk2E=;
        b=PRQvNue8ssMepn14rkyG4/OVbE4cQPbTqnXUWkTQCK3q9IZJHRlfs9S1+MNXwobkNX
         RZuDEAlhZKCaaG8HIkvCIbGpIyTvolaD+mHCyOwaef9MzUE7NWvjuCTUecunvIrSiLc3
         MxNuFD4EhYEbIikoPZhUoRw8KmFpRW0whwpGMAaKXgDD0yJtA8I9IYqA2BteAKYMxFhI
         27YjPcMrOFrEIGBjuJs6rXctJjZDy4zR92ALygf0jL3wBn8o74aQEioDXT2DRoJDHmg6
         yGiIhT8utkrsoB3k9bfYnoFYonMZJS9Kik2lqsCNZLDKMfFb0LNEwGITuWpecFnIzGAs
         WCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716799369; x=1717404169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaEF4gO72oykFIStkZdCU9USqrBYmrQ/jBFI2aUzk2E=;
        b=hgNQlRm4LmtZVrFOZnqyLjcg7SOomA11WTZcfHPs2VvFzyEz/Zh8tF64sWyuxMXoEr
         qrRP76a81YoJmmwn2L14A4/8ksMuTaYxalv5njqgePDzQZQ4PRZLoWBoEkXa83FRuEQ0
         RmS2BV8FJ2dtRz05tut9FJgZQYAIa5LNqV7JfqJQg0GNo52yC2M5zChkzDfjY4hp4i78
         b4aOPrTFhM6KfavitplN0EJtLvipMumQGqqCTImiq4GERwNJfx7Yqt5+9uFbkc4Sj6to
         15K3prMZr4L62nxmI/Iqdq/7zlxy9rqwMMrHKDFUnhXRQGoFrdHCS4QNj8CzROYpRYah
         wGjg==
X-Gm-Message-State: AOJu0YzK1vQP5bb3TTmFEAwjNKVzU815O3AXrl8d4fvIbIp7YB4yILwm
	WZLS8nnKIpyVWcVtNPTtjHilPjbv3ZmEjfPpl595eNdcdFmkuP23ivkAJajaig0=
X-Google-Smtp-Source: AGHT+IFlox+JYA/TQIiL3yZKdwNn/gUx+Gg1nkb+lMnlc1O4u4ePjX9SmBqGsxeiC8TMhuH9h/OxLw==
X-Received: by 2002:adf:b1d3:0:b0:354:e746:7515 with SMTP id ffacd0b85a97d-35526c560f5mr5700618f8f.34.1716799369100;
        Mon, 27 May 2024 01:42:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3558889fb57sm8447292f8f.114.2024.05.27.01.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:42:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 27 May 2024 10:42:37 +0200
Subject: [PATCH v2 5/7] arm64: dts: qcom-sm8550: allow 4 lanes for
 DisplayPort and enable QMP PHY mode-switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-5-a03e68d7b8fc@linaro.org>
References: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org>
In-Reply-To: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=bUymvKgHwGJMNeWdO4E2xoRI1NZeMZTfq1gbdx2kTBk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmVEd/+QFKuSFUK9Ik+eL30bDuvC5I0nJH7qROWMla
 eO0Zq6CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZlRHfwAKCRB33NvayMhJ0Q2DEA
 DNvwrXulOdcNRZRXI8w7ZpiXjlBiyTvyLLHoh4wv+9NlSrnQkFT6jfza8qR6v2QtHV9qs+cJSiVl47
 1lqQ+8yIimZEbAnykiQdlFF39DtdZQQyBibDSpvxFqNLUFz3UXdGj8PFh0cq3RPypNegcL2taIxJ1a
 9lZNNxFhWEuTbJu68k7DkcxiBaRb7LCZFgfNwnF8YsJBXQXB3A/CxpCdDxa3Iavpqm3n5ZYLtEENjT
 U96loPeH/OrecX2XVaqSWnvpBOJPB4N+SbwKYy8ZOZhqZ4wuVGmjL3ZCHIcAhwroTgIWdX31ZOIYSk
 hiZilxmaH7rOl0j2l7UemGBALP4yOnDgFey8g9a99pgXbpXJPEy+IcthMsmgaVScBDRWtZp3QEf5CG
 4LrE3DF1FsKl4kZMdaVV7lOEvFrYPZ/wgK3hdJU5iqbbbaaLqDEIQvdwzTCWcLjiKw5DLmeK5Rv7rV
 r9le0N1HO+F6snQPXI0+VfneAh7gxCvciV2x801DAGFzw2zfX7pMkgDUfj/uMBiqDniCkfFbL3ap/U
 mOcdK+LJJn+lsepGqd7tGUZyOtdTF8TRDQnlTdzYmOaseH4S8ep2AmvKCB6dV/sLg00tUMX/47TlrU
 NVQiPQfoOZ3cSVgn8RKyi2sQdh5x9JCchZHscZvlqiQsTrCHBYB4Ycoxt8tA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHY to the Controller
and allow mode-switch events to the QMP Combo PHY.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 3 ++-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ccff744dcd14..a95949c01f25 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -941,7 +941,7 @@ &mdss_dp0 {
 
 &mdss_dp0_out {
 	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 };
 
 &pcie0 {
@@ -1280,6 +1280,7 @@ &usb_dp_qmpphy {
 	vdda-phy-supply = <&vreg_l3e_1p2>;
 	vdda-pll-supply = <&vreg_l3f_0p88>;
 
+	mode-switch;
 	orientation-switch;
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 39ba3e9969b7..fbac5270b4d7 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -795,7 +795,7 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 };
 
@@ -1142,6 +1142,7 @@ &usb_dp_qmpphy {
 	vdda-phy-supply = <&vreg_l3e_1p2>;
 	vdda-pll-supply = <&vreg_l3f_0p88>;
 
+	mode-switch;
 	orientation-switch;
 
 	status = "okay";

-- 
2.34.1


