Return-Path: <linux-arm-msm+bounces-47133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63078A2C09D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 11:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFD793AA8AE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 10:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877D01DE895;
	Fri,  7 Feb 2025 10:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IksXxoeu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6181DE2CD
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 10:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738924286; cv=none; b=CVD3uP+yTFDY3Qmae5X5z7MwKFkg/91+hnu5IlCTI/1kcXAo2HqqEbZ3qwpCYpyMHCthUYtjj2NKmukftAJN+GEAGoZzLdD2VUSWiLXYnOJUaRoK/qMZ7TpwAPYDIbgr2Is7G+ydwQh7gZLVE0a2si1OKKojHFVEhzkmBCqxlK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738924286; c=relaxed/simple;
	bh=K5sfaUH/v+Xme55AC7a2g1rmK4tSrrtqeCU0W09g/y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NyfgXSSai64ZaS8RGrTOYnIbsQfstEtKBp6oh4lYg5tWuk7ITd0CAlUoQRPpNsajovtxoex5n8gIhU2ICILC1rQ7jvbSpRsnYqwceDwN0+ZGvhVMMw47L5S5CVNjArrsgL54KdRR0LolQk7DrFhvt9FV3pbGeN1ZFkobuAESkBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IksXxoeu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso18048725e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 02:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738924283; x=1739529083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=muM4RfPWKZm4sTvqUifE4gQkttLJde/CjxBLEswDbTI=;
        b=IksXxoeucOrYQVokAXduoVLaT5g+79T+eKlVsLf9pdWOjVimehz+ceKW58f5JPP070
         YTqiMhhzQA1DJLZQgASQsZLdFg0t8ZsjljQIWlBytogoUbUKEh5QHoxrfe0vPgwmKhQG
         Um/CGn6QdaMdwRXahGaATYG7gv+W6XmYCVvBTuaPbaaDqe8JchUmxpzBw95QoHiE91iW
         8S4qb9EFeAXXjx+DYJ5S8IGYaksOLTAZ67BXq1pUD1wt5l3lCKG2a6yH6LYt0FUfFBUu
         5sVIhzPE/WCHIkx+Ibs6440B2E3Lr/2P+6Rp0O6ztuJmnoExhLYnnKsTlHkFgbZ7y1wN
         PWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738924283; x=1739529083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muM4RfPWKZm4sTvqUifE4gQkttLJde/CjxBLEswDbTI=;
        b=Hu3PCiDG2TgMYI1QCaML0OGn9v37QGAz0r9mSxm0EgaXLVjew+6pJmTzMi5Q3/OoBo
         6CpHzQ5T5l0wAxqviFXZaESLnvD+cNBWBmCs0U4TnMcdCOPSjYUymJmqYw+1TSkLfseo
         Vc4PoC591DA71Ks7xRyef3htWWCZNLkSr8nocuxoAY0JpLmM08ikgZWdmhjyIGVAAf76
         iXR5CdSLrseXEQlsnm56BKEhPa/FShyy/iO/yJ6QwPp5dudcnsK2Uw3IMkGgonysfXGZ
         aB6Pmlbhbt7gW5j/2TJA/rbgrm0IiqpN42Osbky7O8LOFgDNzoBS0rre4U5A9TW6K1rt
         lLPQ==
X-Gm-Message-State: AOJu0Yxmtnwl6gx4rWKs6fXJAVIYpKIr2DytK5RdLbKClz1f7ygiVzZn
	rcpe2+1M6HIiadNkJ88B7vsygzC1dCCLKBEr3XppOUvBuJO3ioNk6N6e8FAn8GbXT9/I0gVB6Uc
	F
X-Gm-Gg: ASbGncu/nlJN/X/rUc3PotgyPAsTs/PDUZQNKUO+2TjigcnjpZQt0wWwqw/ZzyelbHR
	lh2gzoDpTWTIUKJToc53F9wwqQQbNNu35aGRrwrH9FBekHelptUfI0/QSmu8hERtbikpEsYr35T
	8Y2KI/E6JzfIWXlt/FB9+0wI9YGnleGn8MtXtQAv7+83FVUuJUAkO0sBEFDNo0fUqk2kvZNdvzH
	49563IjEpmhsJYj0LU0MHOOUsgA2YvMapWE2InNKca9StzJa4weVQxK0ykNgccAfsIRiOGs8v4x
	flu2QIp+O7A44trLuTAjiTNJDwLU+B6E/okI
X-Google-Smtp-Source: AGHT+IFGdGdIhadADE7cmK1bLsd6Nc3kFhBN2GRPPvJhx5Sk3tQzJhO0bVYCpCfVxhLdKv/ZDNnOUQ==
X-Received: by 2002:a05:6000:144d:b0:38a:9ffb:ff02 with SMTP id ffacd0b85a97d-38dc993fe00mr1464775f8f.12.1738924282740;
        Fri, 07 Feb 2025 02:31:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc2f6aeafsm3170442f8f.20.2025.02.07.02.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 02:31:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 07 Feb 2025 11:31:16 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: sm8650: add PPI interrupt partitions
 for the ARM PMUs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-topic-sm8650-pmu-ppi-partition-v1-2-dd3ba17b3eea@linaro.org>
References: <20250207-topic-sm8650-pmu-ppi-partition-v1-0-dd3ba17b3eea@linaro.org>
In-Reply-To: <20250207-topic-sm8650-pmu-ppi-partition-v1-0-dd3ba17b3eea@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1771;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=K5sfaUH/v+Xme55AC7a2g1rmK4tSrrtqeCU0W09g/y0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnpeD4NhguBpm1qETE/4MjIVc3wXqcbdL5PkFVmB3N
 B5wVxYmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6Xg+AAKCRB33NvayMhJ0VpQD/
 43tKzgGqOo3VLPW03rrmzg5tz4YJWDhJFyF1n7qmOc0T1xDWOmvf76uFlkRJUTBwvII8ujF1lsbOjO
 SumHtolszSE+eWYJKm8vjuNIz+MKD+69lwcyEHAssBR0R5KIrLw7+u7a0d3ZU2F8lrz0sIPwTZcZKX
 j7iryGfKi4JpHbtgw8naquzBbNG6HndsDUASoTn2pD7wXgiwVH7eELhlhVf9sI72eBuNc1xu/U6TFD
 kajtU3M5zHQBpt5/HcZnwziiqvYbWOGGB9frJOzbmhj4ss2uzC1DH39XBzptzH+ltupvGpuUXpjDUY
 oW0MkoqAVVNwrcB1WH41tNhHx6sHL2tS6nBQSbbgyV36m5554/qzeX1guJPTJn6Fd9KjCDip43Mz5t
 9bgrGZtdt4wb+DA2QO6Hdpznf5K5Cdb2vtNa9KcqdUQ1bQPlqrwyvCm9k2z+HhKjWHCoUfrnk35Pxe
 To/OdbX+askL3/XNS6E3jvGj823OtMnwllTxVyc6ShO7PNknbqYG5XX827XbWmOeXI7z5F4SgOvMkm
 CXwcohSe6F2WJetSs/mFoOKWebCtNq3DaUQnMIWJoZbfmsoOMJuo5bHlwSQLQHBXmM5mQdsnIE/GVt
 GjmDTqyV8CdDq+yq3Rfq04YG6KOb0cGJKb3SYOe9oX3ubIPskqCsEGShfsWA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The PMUs shares the same per-cpu (PPI) interrupt, so declare the proper
interrupt partition maps and use the 4th interrupt cell to pass the
partition phandle for each ARM PMU node.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index eea73474bc857260fce26ca417d286a737ac8ddb..47df1ca020331421a14fca3fc0002a46f2083291 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -428,17 +428,17 @@ memory@a0000000 {
 
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
@@ -5309,6 +5309,20 @@ intc: interrupt-controller@17100000 {
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


