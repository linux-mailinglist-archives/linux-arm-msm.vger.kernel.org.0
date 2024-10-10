Return-Path: <linux-arm-msm+bounces-33798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB12997F59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD692843AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1531E47DF;
	Thu, 10 Oct 2024 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLUAU6EH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7689A1E3DE6;
	Thu, 10 Oct 2024 07:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728544961; cv=none; b=d/6yJ5YqTjo0+IGEMm5Zr5vFuRX4VpL6DX/gCvBmN1bB5Onm3vyNbVdEEiE8ygtksWAkKiarLZ5Csvha4C7KJIPf13Fi8nXC7RitswmvXnI+RXVnNgqQvJ+eyALsc5SLLthPJYo/Imy49oHU59e02ri5LvN/C+5qkfnUQWjjXs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728544961; c=relaxed/simple;
	bh=irHePT7jxSRj3l9cjSlyLGCDNqsK9TkuUk0x+DqrhnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qc54LMbqpycpLOqfHMLztdVAskfU5X+0gzVsZvAmPcpCxgraFptMpEuyAd9CMWbfV7Tz4TulWJvTbyaYreh3T3YHJZGirPknMKuPJs5rlBD7dTbZWQpO0PZkkQH1eb/+dgjH2S0g78FUQwTH1jwQQvl3VYop4axqhfOqLmWmAPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLUAU6EH; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20c8c50fdd9so1549855ad.0;
        Thu, 10 Oct 2024 00:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728544960; x=1729149760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpFy5FxhMWXNV2yEqbcX+eoDVHfJa3z53SbIDrRh8fA=;
        b=KLUAU6EHsMd/uW+UGcIufai+jdfAjXpAi3u7Yy9vZrlf10oasXO8VrhNu+8CJe7JsU
         mvSjF9VJAYNzCH8C1fgiDDhnmeKuXnTxm0m7Q9QIdUoqEkY8XAo7KRALiWco0tFhUS2x
         dapM5ntw5E3spkWFvHS0CMhTHRhseHJ3mJpHgHR6iu0yDma7SSYqYdUM+OmZUAfufIZG
         5rhagsUpRbOwAbNRDjwR+/c/BSKo0xnttZ/2lCoeI//gwZGXcFly/rdxXg17y7SWSyYz
         nwhWsBpd/WyYs2ve9pF8x4O8qXfwreAkFRT3j8hfmmBRvz+itj+hRScQtqHXLmxgMsK8
         jqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728544960; x=1729149760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vpFy5FxhMWXNV2yEqbcX+eoDVHfJa3z53SbIDrRh8fA=;
        b=FcrNg8Jxyj4ZWsuUxP85GbHX4niCJIeBmlDZE1fvdsFB+g4/Uto6/vHmgNFy5ny0fs
         4w7RXvVWElSdL3C0oQgkYoPMQLn2axRw8D1VDRFT3vpObOHdpVheQHpRCrLFHfx3naDK
         5KHhYym92v7du3z5ETbk3gUfjd9l/XkyMYmBUR2BHRItrHDD//wLPvvN1HcwBfXLa1OC
         LSbEfEnbXDuVFQPpBmLehZOYdH5Uci8VMKidjPWXo+sBTboWA270y0kqc1gSP7DwDoij
         pmtFoxzq5CRB6Q3Dlqins4AouzxnmCLLGxZWRZi0tD1Q0a7wDeWahDCH9t1lIQIIPsXB
         Dt8w==
X-Forwarded-Encrypted: i=1; AJvYcCWQ8zTSRAPGpVKdsB4K4l1Wg5MLQV3ibNh1Re6vZHzWpVQDNSESXQhut9qb6quwYrnOg8LE9bDkShQR/Hut@vger.kernel.org, AJvYcCWR7PTYiOPuJvjyJnqyi6ZMnS7AuaKaycLwpsUfVwqvh667YjecJWFuTIIy8PdjvE9lwiLHYCtkBAWV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzct3iO/bDBdj6VzjJCFXBbfzH345Oxb12OGtr0hNXt6GqtV7QQ
	7KV504jNwWHQpcNrsTTDnkVU/ics4pQMoK0fxqXGPA0YZdqsh2CT
X-Google-Smtp-Source: AGHT+IGCY0d5/Qj+wIFS/XBm/sG6iNLJ29I4Eo4vbbDr/u4NiqbohxygQN6qqz8hnNNVbtV6BPr+pw==
X-Received: by 2002:a17:903:230d:b0:20c:5960:bd60 with SMTP id d9443c01a7336-20c804444e8mr38534905ad.3.1728544959784;
        Thu, 10 Oct 2024 00:22:39 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c21616csm4413865ad.224.2024.10.10.00.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 00:22:39 -0700 (PDT)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add bluetooth node
Date: Thu, 10 Oct 2024 15:22:43 +0800
Message-ID: <20241010072243.10227-3-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241010072243.10227-1-lujianhua000@gmail.com>
References: <20241010072243.10227-1-lujianhua000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bluetooth node and this bluetooth module is connected to uart.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
No changes in v3.

changes in v2:
1. pick up Dmitry Baryshkov's Reviewed-by

 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 7a55e271c3ac..100607da42ad 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -30,6 +30,10 @@ / {
 	qcom,msm-id = <QCOM_ID_SM8250 0x20001>; /* SM8250 v2.1 */
 	qcom,board-id = <0x10008 0>;
 
+	aliases {
+		serial0 = &uart6;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -799,6 +803,21 @@ wlan_en_state: wlan-default-state {
 	};
 };
 
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
 &usb_1 {
 	/* USB 2.0 only */
 	qcom,select-utmi-as-pipe-clk;
-- 
2.46.1


