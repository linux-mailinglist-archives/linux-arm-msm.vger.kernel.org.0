Return-Path: <linux-arm-msm+bounces-61035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B21AD650F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 03:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BAF97AC8B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 01:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB2B155C87;
	Thu, 12 Jun 2025 01:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dAXqvdJp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F6115C158
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 01:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749690962; cv=none; b=CUOUqg0vJtto6YDVfabZHceuZ2lT2h7DJlafEnHgvEEnfRS95txyhhRIwAnZ5NP/vGtjBvqlqU9cJWFOxHWKu5ySwQm29K9n0k7E9RUcCOUIeagvf34X6NGsdMFZAFYDlXirPYlH4mlzE8p4RroKDBlHdg8YP96aTOv+L8pirt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749690962; c=relaxed/simple;
	bh=XYwKha3UeOCXy5MI8s9ICvr5AKzds6ClCI+fu8IvSMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKyYdNVSAKXfvqobGA+n1HZZaMi2nKuZTYa5ZAk9eEEaB0z1tXiRX0EGe7H+mwe827liZd+YvubJUeuZF79ZLJ32oMYLHOqNGAgkKl0Vz3jqrLaQqTFilAD6SQwTesxdjq+1hGpwenBeKvghyCp8RcFSBWwi/r3Vn50Hue6Wz6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dAXqvdJp; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32a8abb1613so569631fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 18:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749690958; x=1750295758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfMw7lCjvYKdcM5p3TAGjbMu4qQ11U0/d1S9yd9mYvA=;
        b=dAXqvdJp9q6L20EicYlT8phaRuYr06yQxS7WX3A15C/MJvTRIZ81hx1e89jbVLf/wl
         s4me8zIuDicwLjJ+t1YfapD+6B22L8H9l6nLX7F9qJrkJUwmccbbhyrHZDXc7HG5a82O
         siGKJpy8QXfDpB95JbkPFWNxc9yCNifMesW5ivYENQIUbqqCz3u6jhcNzASX+MuWVKZW
         WwZJpDAjUv3kM2gGaSyzyigDDQ5Rfc7D+DBUXWFj/5aeucK1yYRlnejATRTYBbXxlYSC
         MMtxlPWmP8KL4f9Ugr5XkEtHydr9skvlimRwYmViK6yNA5MQx2nieVB36YkP9z23I7ZL
         YbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749690958; x=1750295758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfMw7lCjvYKdcM5p3TAGjbMu4qQ11U0/d1S9yd9mYvA=;
        b=BZ5KrvmJyS5pf5fCk/VoND12WIGHFQ5KmSGRBzhCAAhhnb5y8Q2HDlmGyNekpj4TpO
         9GthJiJQfu440I48fZtQbITfud3XEo5PdDqan+fIliK24lAO+UKg0t7MFetidFrXpkvp
         cj1gOQ1BpPc174Yg0JP8fxROd7FMS7WzA6ryiHKryUwA5iAeOGZvreyieQvfHkzJgfvJ
         jVU7IViGs5xoI9PH4v8GeefHdGxKD7YkC64sxJaRf6XogT29y5HpBhi+v8tjnekbQpRu
         hkae6AwwnZXevwl/14/5jKSI5gyQ7x1I58jN/TgkvI/Jz26wAPmk0UwZSguSlU2qG5Uo
         PaVA==
X-Forwarded-Encrypted: i=1; AJvYcCVpWMEgaH7/EkfZYlqj/+3tgt3941CdzPu18CEV54gUgtEn7VK/Flp8/f+rwQHq27F999v8hb1c4nQx5zlo@vger.kernel.org
X-Gm-Message-State: AOJu0YzRTH+zN97FTJeMUF3dND7RWGgj4KzppI3JoEu5VZwf8Cni6yVd
	OZDnJvSNq5TrVqSgQUq2n/Tt87s7t9b8WLBOwkEqdVzOqMGQcHjaUNv7rStWK03qsrA=
X-Gm-Gg: ASbGnctbbKc15Nv3TTxqZMr86wbFBPSkpYFYcK7CTcHHefLDV3mfmfKbP5CIOQ7Smjv
	whwgO4Sxjp8GWPM/5iyKy6zc2WZO3Mn2bgBm3EHdpYv8xys4csPWlxRbSd2ca6Xz83yPThd1Pc3
	pk1ap2jx/AEegynxWY/BvIywFwsGrOVAOS69iA0L0RgiQ1UJsRB+sJmoQa1QJR+zFtfUAuVSA/4
	GkVeRtp00bvgetZfY4kn33mWWuuo+WNsiZ227H+DZJGQprvNxd9+U/BwyVKc7ykvFmMGq3mH2+v
	SqJCn/pcdK/N0eOpg+zbp/blV5odtqHo9Bx1apZr16tR6QDjL6NgHQWpfyoKzoxSF9dUwvOhdwV
	FHXzSp7jTxC7ajfJvlaSIDUW+eHAuyUxQ2E0LXqfWVfYPQKyfgcc=
X-Google-Smtp-Source: AGHT+IGeelyLNCfDUasPCOxCiFIpmwYhXzHyBgUxVTWvZiNU2GFAsGcklviFQwAc52LvrzaoCM1JTw==
X-Received: by 2002:a05:6512:32c6:b0:553:35e6:af10 with SMTP id 2adb3069b0e04-5539c0d2457mr540666e87.7.1749690958367;
        Wed, 11 Jun 2025 18:15:58 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553a7018069sm62808e87.157.2025.06.11.18.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:15:57 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 10/10] [RFT] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: switch to new CSIPHY scheme
Date: Thu, 12 Jun 2025 04:15:31 +0300
Message-ID: <20250612011531.2923701-11-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The change provides a working example of using a new scheme of describing
CSIPHY devices under CAMSS.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
For testing only, do not merge.

 .../dts/qcom/qrb5165-rb5-vision-mezzanine.dtso | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
index 5fe331923dd3..939eec7a039f 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
@@ -14,18 +14,20 @@ &camcc {
 };
 
 &camss {
+	status = "okay";
 	vdda-phy-supply = <&vreg_l5a_0p88>;
 	vdda-pll-supply = <&vreg_l9a_1p2>;
+
+	phys = <0>, <0>, <&csiphy2>, <0>, <0>, <0>;
+};
+
+&csiphy2 {
 	status = "okay";
 
-	ports {
-		/* The port index denotes CSIPHY id i.e. csiphy2 */
-		port@2 {
-			csiphy2_ep: endpoint {
-				clock-lanes = <7>;
-				data-lanes = <0 1 2 3>;
-				remote-endpoint = <&imx577_ep>;
-			};
+	port {
+		csiphy2_ep: endpoint {
+			data-lanes = <0 1 2 3>;
+			remote-endpoint = <&imx577_ep>;
 		};
 	};
 };
-- 
2.49.0


