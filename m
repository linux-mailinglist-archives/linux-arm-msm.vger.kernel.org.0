Return-Path: <linux-arm-msm+bounces-49656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BA0A4789F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 10:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CB273B35C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 09:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB09228C8D;
	Thu, 27 Feb 2025 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B84DIOLM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CE61EB5F3
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 09:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740647089; cv=none; b=s0SEM3YMSjclr9K6U3CFECedVyG1fXhcO3ahi5p3U1vUnAcwAGGfOxYt5YqZSZ4n2qZScW3TATI28iwU+dyeeSCxfUxY1XY4o4ZMvQ7UyZt8A7dTlwWToGOTSUZ+ecFNBy5ze73L5Ni4AObxWdM+pjJcdC1qdB+kSh3uYVCd+ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740647089; c=relaxed/simple;
	bh=k/Ub0j4ZPZ5XJlCOR/aNVmHDxi435bw376+PW8znVRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dv5A/dQKbuDv3Cd8wTHDgjl9r4xa+3OI6o6Oy7EdYy43JpKlUs9knWfNFGIhWvNSK0BUQ24Qh+J2CFpMQsAwVwlYNG6Uc5jidzsj6QsmpOUT8ifWon5azrYWA7JKgkUSwOEY1LqCRDmnRYtByJEBQfq991MV2+j73oh6hY6cCo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B84DIOLM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4398e839cd4so11263045e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 01:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740647084; x=1741251884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkITjQmr9TX/26VhCMssjv/ZXVYw9RYOTlGukmEo+nk=;
        b=B84DIOLM+gyEsQ32YC9CBuU0tq1WoGUFveL/T16xI9T+4d5vXNVr9ThfI5p3vxQueg
         McVVt1ZUksXJojxof1WjbbMOxrqpCEZunupcqrn4xDs4BqJVt68D1ok+Pe5QYlpXHTf1
         5/qoEewRz0GM9VOAYo9SU2jun8Q1akes6l50YxxxCSUc2v2sBM2d6AhL9mufjhzicx0Q
         4AWLN4B7V+dMpMGrd+3DQ9zSUcTcYdOvBB5aIB2gHJWig0QgBJFw0zvzetIgkGJoIlbv
         QnsT59HPIW5k+IfCUJ3/brZ/ve/VpOxBSyNORxLyD2ActuzOqAbEgLf0zlZF+eTMZ6eK
         Z8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740647084; x=1741251884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkITjQmr9TX/26VhCMssjv/ZXVYw9RYOTlGukmEo+nk=;
        b=g+TEpVMcw5zb3i8WV+ibKjX8rkMQ8Ypzaf50QGJ1DpX0xqiPR6n+Epk9Qe10g8UTtM
         qgtyOqVSyKeI1li0nBtVr3Ch2nYgQJDnOGYrIL28sfVb3oTyG6iH6QXtQjqSvVNC8tic
         heu+Rr1ynaub1vqNYZqS8hBqUovWH7IJXfqJMALPMM+qTCrS74A1/NzbHiOdUZa7J/Lv
         JktYNQwyH5WzBs64dpU+9NUCoPzIWMU96MbD4sM5e5nuok7atUDgehVhLIeDivTwdqeW
         Kxau8NPQQ33laLpeTnA24khdg1ZpQ0sViRM0YHU+GEMCYaZfd6dqYL4hUk6UQVEhFXZf
         PfaA==
X-Gm-Message-State: AOJu0Yy3YpiLlg3yxOtCbuhUocYAfi7py811aBkguB4nCDHmGVTrKeCZ
	rGFSNQUHH4gZjXNISdC+LQPQEgMKySmgAAaGnQQhsdme+49+nTFl7ew2gncDGME=
X-Gm-Gg: ASbGncvh3sPSi/VpFXegJVon2MjEtkNt3daQ33YvfyRRKKvOgFgI+i9wHf0PsOuxfC8
	Fll3wqZKyNmhVYiMNDAEkmytAjIftHhxOBBtc0lDt1C7NvbrsDAsE+tE2/hx3fjcsu5bE64AlGX
	XMbdpVaLwoyUFZboGghRV+28+xgxQEqCm7m41luplJuKqDWM5kmmBU4HuSupKvtbspFRZIa+M63
	im/2X1i/0HM7igCLFl31XT/IoxdHs1JXEKJNoCixj5SflasOlMFcNTACPqji8WN6L0henpVqcYi
	AeanP2FLYMklnRF0WzcdUjZAifIFef8k+H/cuX7LTjBFBiE=
X-Google-Smtp-Source: AGHT+IEcDag0Zl9N8JeCicgWpNE4MUHLLL3hYvkjcECxSoUILvLCJFg5uEOCJSgHDKukRtdJsB91DQ==
X-Received: by 2002:a05:6000:1787:b0:390:df83:1f22 with SMTP id ffacd0b85a97d-390e18d20ddmr1771311f8f.25.1740647084194;
        Thu, 27 Feb 2025 01:04:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a7b88sm1362380f8f.40.2025.02.27.01.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:04:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 27 Feb 2025 10:04:40 +0100
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8650: add PPI interrupt
 partitions for the ARM PMUs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-topic-sm8650-pmu-ppi-partition-v2-2-b93006a65037@linaro.org>
References: <20250227-topic-sm8650-pmu-ppi-partition-v2-0-b93006a65037@linaro.org>
In-Reply-To: <20250227-topic-sm8650-pmu-ppi-partition-v2-0-b93006a65037@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1833;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=k/Ub0j4ZPZ5XJlCOR/aNVmHDxi435bw376+PW8znVRM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnwCqpDyLRWaVQvhbd2/CzIVYOqzXz5gMqHm0jDq8p
 UFIoxYmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8AqqQAKCRB33NvayMhJ0Wx8D/
 sFXR4XRXUMwe+wzOQZkk9549jr5pdzc0yfTGe8aPUSOvJ7kebnpgFn8oxriVn7ujC6W45uPEElqEmh
 6oG9Z66xvenLQUyHJayjH0pnZVOgWXFfyvMBPpGRchukp2ZuKXWm1xkRjAiVHmwBPx+Lw5e+PmETYL
 qBLHOXGLmtPvuwIWQY4+Pmppl+6V3xtwtjxXxC7SHCMsnwhU6XLLrCBThRzMgr+hsZUBf4yDtZRVAL
 3kmSXdx7GvK8A5vUiU3+Eoi8e0fJW3NfLYxwm1dHvmSw5Wb46zXeF3Nw8MALmg/xK3Z+UKCVvC6xzP
 baLnC0TcPN232EaM3XqbXvIBiEenwS6FkIjUakvlcZlgQJrf3Z14cJ1du+l91V422VASZNdummU1y8
 mup/1cFt+6B4QoUNciUHvUi4x7GG51bKGLmPbSGFG7HFnIRwrDYj7lPkmXXpIuUH5PCvmQ3bguWJln
 rEQSia5gYMuooHEfPGwN2hHaxvOFHK3A1TwLDdOHeKRaC6dpJNEKcrwqB6PJ8QNyHFzf9JpFMMHdoL
 5sr9ZoUqFky+1oh24qReBa5xdNHU8DfcO6Luyl+PMVdskiGKxEKQw44r+1rKsw+lsndQN+UwSPK4cf
 sIrhIsBXfYs2rpoyWRwbpoNwWHBsMYLre5yJWX1dR/jQCOZeyjgowOV6u5Fw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The PMUs shares the same per-cpu (PPI) interrupt, so declare the proper
interrupt partition maps and use the 4th interrupt cell to pass the
partition phandle for each ARM PMU node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 273170a2e9499b900b3348307f13c9bc1a9a7345..58646b50bb437fd5eb2ac8cf3955be2db020d6e1 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -1417,17 +1417,17 @@ opp-3302400000 {
 
 	pmu-a520 {
 		compatible = "arm,cortex-a520-pmu";
-		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
 	};
 
 	pmu-a720 {
 		compatible = "arm,cortex-a720-pmu";
-		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
 	};
 
 	pmu-x4 {
 		compatible = "arm,cortex-x4-pmu";
-		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster2>;
 	};
 
 	psci {
@@ -6590,6 +6590,20 @@ intc: interrupt-controller@17100000 {
 			#size-cells = <2>;
 			ranges;
 
+			ppi-partitions {
+				ppi_cluster0: interrupt-partition-0 {
+					affinity = <&cpu0 &cpu1>;
+				};
+
+				ppi_cluster1: interrupt-partition-1 {
+					affinity = <&cpu2 &cpu3 &cpu4 &cpu5 &cpu6>;
+				};
+
+				ppi_cluster2: interrupt-partition-2 {
+					affinity = <&cpu7>;
+				};
+			};
+
 			gic_its: msi-controller@17140000 {
 				compatible = "arm,gic-v3-its";
 				reg = <0 0x17140000 0 0x20000>;

-- 
2.34.1


