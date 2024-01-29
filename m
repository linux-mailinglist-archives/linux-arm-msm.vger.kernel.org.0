Return-Path: <linux-arm-msm+bounces-8843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2E2840550
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 13:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B034A1C21A0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 12:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5660661687;
	Mon, 29 Jan 2024 12:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L4jUIK/Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76812629FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 12:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706532368; cv=none; b=ByuaQuhHXid5h2HcaZcq+/fCKL6JuruVrajxRoGJmbal080XbeRZrlgThzfxABrQ9cxPuk3uA+DqvGl6wzl161zUrhDux239LHRQ5v94HFSntZ9+dgr+MdHv5QRk5Lzvr+vbiUd9Fqy5xNEtUZOkf8WAQE3PpiLiW3TyxqXuNJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706532368; c=relaxed/simple;
	bh=Z42Q6xkOTrQTsmOLrP2Z5e9O464q2Y3rJZ2PkdjxS0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mbRHTAweC9yOHIEXYNGTRGVq7Im0W+lSI5wrONnv930bgMS/Bc3AsTbhaU004XylGTnbYkMV+0LwbGrd/jek//y+OV8yMYxqK4W2pq/L8ThUySyQKt6voqBsOtxMYDvPwK9bMv7hWbwQFhFueRuohLU3vVd0wcuFwVTJEe+uxMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L4jUIK/Y; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5110c166d70so1762990e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 04:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706532364; x=1707137164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nSUoAEGodpT/nnxbj3AEPT4VUq3C0Xk/xRQ9kzlaI4=;
        b=L4jUIK/YJzdD7124Jnoe+kHRNBxmHSt5HexEl74AwzpLObMBI/pi0FhuRCv89phIcQ
         qNTgYKkiF/p7qVqQ5p8vfDN9xKXJN4v4ENgdytZ3MFwzgit8SPpPnldCvrsK6QNTx70b
         GQUTAL1ixiL2LvvKPzl4X0atO1LQEVSBoCaAUF829Cu4CHcRX1wHFBB4w59jJZxtP/Bu
         8YTXiGb+UyCFAgNHYIyxzGG8CrJOPSy0IF1r6PVsY+Gn4tTh4okWCtWFXqEF4m/lQLwE
         F1UyLeBSNIYICUS530NFK3RmZD1GT6bC39m9nAlsC3LU2Jfn3TmvAAZsjsxZwZqiNa7T
         Tbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706532364; x=1707137164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nSUoAEGodpT/nnxbj3AEPT4VUq3C0Xk/xRQ9kzlaI4=;
        b=Qg4aF7+ZzBQCUfqIxuH2sSbUmdGVTi7pjuWaYAo4l/VwsyBUILrRrad77GQaOiWhi4
         R46HhtY0ZkCMEqvXieaDnao9lh6NC74X94XXBaB+kk8aEw1XQhbOetpA9zeqa055eVNU
         GWYaeCny9DUfvxKHnTgyaIUD6bB8YhnoXVAPPx+u6ivxDVplc7XyFOzqjMaYfnPfDG0L
         qhfT4gaJK5rLVzZZg1Qn4V5MV0/H+zC9QF1NJCCVVUciGR6x/FJXzixvGXl/Gr3yWMDd
         xt2g6/hFn3WLKIX9JVVT7QvrciS4Qz2wW4p9+V3Uzhl1e0dap2Lm3sq1pQgVzfyTn0ue
         oR4g==
X-Gm-Message-State: AOJu0Yx+LBXsWOHPfDW+LSCjeV9zH1jGB81MmLm26zUMaIRmVi7AILD/
	e7SZy7DayIzNl+CoE63R9Bhl8OmcmJFAd7vdO6WS0RcdG6vyDQP2c0ct7a28kMY=
X-Google-Smtp-Source: AGHT+IFnvyM5aCOc/uryUcttgaEiMM5xVIifd+aWouDtbJrEMUl2c4KCoZ0GLvp6AUZtKeLyGOEBgQ==
X-Received: by 2002:a19:ca0a:0:b0:510:d29:cf57 with SMTP id a10-20020a19ca0a000000b005100d29cf57mr3342919lfg.33.1706532364563;
        Mon, 29 Jan 2024 04:46:04 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id 20-20020a170906329400b00a3527dba974sm3041495ejw.35.2024.01.29.04.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 04:46:04 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 29 Jan 2024 14:45:37 +0200
Subject: [PATCH v6 05/11] arm64: dts: qcom: x1e80100: Add TCSR node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-x1e80100-dts-missing-nodes-v6-5-2c0e691cfa3b@linaro.org>
References: <20240129-x1e80100-dts-missing-nodes-v6-0-2c0e691cfa3b@linaro.org>
In-Reply-To: <20240129-x1e80100-dts-missing-nodes-v6-0-2c0e691cfa3b@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=873; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Z42Q6xkOTrQTsmOLrP2Z5e9O464q2Y3rJZ2PkdjxS0o=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlt539DeTIBZk0L675oG7sTBXCNIKvpknFwRnYf
 BpPNFRm+KeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbed/QAKCRAbX0TJAJUV
 Vpu/EACSR0eUj9Ur/xMANcI1GVBe3B5TW0LQFUQY2stOlWLd7wGbyW0xoK5dj2uen9DF/ilv4kt
 vFqJiKVNgPJZAlRRhQyeixbCITZxYf4OMr8+AwgjJR3Dwm6rY9IOr6pwire2crdn4WTwUsgxPAe
 B/KpuO/aeWIWhCixDr6E4L0hCofHqUPkazhA8FLRSQqXBmPmYkbNAdreAQyCsrxQfXPwN6JNhVQ
 47D03DaGTGxW1T8g1R75fN19ds+gSB/eSOWETbWwuODRakB8tck6vC4gOPsRYS4Xyvy4ipXGX3F
 CzJZ9WhEsp1T/kKm5hTY+rtGKhq68V8VnMYaVWsMI18AXwUMldsSXgqh7gVYSlHEJIbO1KE8nVi
 XlVYfpiS0VkJKtoFUlAIk1RNDfVaTrzJr2VacFSurVxcehtgl0lJsmz0zraDDJhNHCSBcZbrhsC
 rYdMpUjemAEKr9N/GunWrQz74p/IBQnrftqArhkcslV4H6g+deCfCFYkqnXEF1GMDtVY5CmmhjZ
 7F/pC12wCe8ti+5o9FtrxP6kotb9DN/VhnWJKJnljxe0+UBQsQX3bEFt5yb6S+wHKARTSBPZQfr
 6/o35cu83QEMQttcfb4x/5YF27uamJpl2cuRS/leopC+2XTkQ7ErRp6lug66s0IJq5ggq10IzSl
 f2XvgN6T4poACHw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add the TCSR clock controller and register space node.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index be69e71b7f53..2b6c55a486b2 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2606,6 +2606,14 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: clock-controller@1fc0000 {
+			compatible = "qcom,x1e80100-tcsr", "syscon";
+			reg = <0 0x01fc0000 0 0x30000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		gem_noc: interconnect@26400000 {
 			compatible = "qcom,x1e80100-gem-noc";
 			reg = <0 0x26400000 0 0x311200>;

-- 
2.34.1


