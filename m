Return-Path: <linux-arm-msm+bounces-14745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E58A88588E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 12:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8396282B06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 11:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7A958AD1;
	Thu, 21 Mar 2024 11:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c4phfgx6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E082E58AAB
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 11:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711021732; cv=none; b=Np+azyp767Zbj6uvOrIUXja2QLijr4lcBUxneDl6XomMTieSYZFr1yGktFMtml48la5pLTsDo5R967AC2VRsBIqBsYDY2aCR0Z9394pVVp89BmH+TGlYK0HHh18tI004JBK/ao7KezoeUnM44NLKtV47Cc9puvQ3Gn3mhpaIriI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711021732; c=relaxed/simple;
	bh=c14pcQ7llIjx8mdlZCcx/UxdVlyVw3faEieM5GK4g1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dgwy94nP9p3V3kTAEnKsYYapG38muUmeBUeN5UIGDhvgrykNDUQOWDn1lHoTzvN4QZUM09rh3kYmSTB01cfqVNbCcU0zdibD7jUUsTNqW4tdixYpwW1M1LT+dS5tublQsKVWFITagZUe3K4/EbvJ4Lt15+ZQTVVVf8OHBcpHZf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c4phfgx6; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e6b6f86975so627005b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 04:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711021730; x=1711626530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fieeCMbDbkwr4TB8UmD9bibJ0Comg/fOeaeZF9hfHUg=;
        b=c4phfgx6p0s78h38WbvAbpGNZ6pZ1VyMMRgU5wdm+07P2dQWQ6MS8PipDG3np3ouNq
         OiwGhsJpGlyhAH/DWwEY6RxedyPUuLoNYjkuyJU3ZA5ktmruTHeKy3Rq7GKFDULY89jx
         pnhxfP1V+9cEsa+A2k1TGIbHwxrxC7+hb7rEsesJWQQUNtV4wDl/Bz8bgTU7Kc5GYx9t
         5PAh+rfgTsNzDb59wknODxd+hfiQx3dXjh+DtgbsOB49IqCoJX1XJzP8TQ9iF/LM8EpT
         ofLm1/xxMGOXHfeioW+rWyMx8tnUiQyOUhavGhG6F5jl7SmOECvHmYrjMbHWXiK4kpCI
         g1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711021730; x=1711626530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fieeCMbDbkwr4TB8UmD9bibJ0Comg/fOeaeZF9hfHUg=;
        b=iQryeLDGiIA3eOrJDmIQdbNhp3+v8smOiE2tB5eKXa8jUcmdg33/qqsUjVU/c6EE4D
         l3BBX86devUmQNkBZivUiVC3jwQaQL6zcZVcNJDBC2zKGNtftM9GpATHeZ/JNBsUBOjx
         zSE86hu+7keGWzS4vSUD+C1zc2BlsdwvQmkLnkDQqGq5yWGz2ODcQaEomIxIqkpMQJYf
         7Ssz4n0I1Gbp6sCCvxnXLHCZdZStOZ3XSO5rAKeamaRXpBauq9dgaa0K6x+J6Cc0JEL+
         +bZxchDmyZbAWtd/P7EvoyERVDqxBmUjN+efHCKyrhW/jpocS1Rfg2oFoobPiWmC6dC6
         lvow==
X-Gm-Message-State: AOJu0YwaBrrjmWxVDs0m9jcXuxbZWTs31DbldoVs+PldMEIwPyCp/Pvu
	62sOZ3820zaFNM/k6oV5BenSaxzM0N00zEaJP4fwYe0YiF5bm19o+3NCevdmInpMOpREqxdzZ8w
	=
X-Google-Smtp-Source: AGHT+IGxTbaq4S1vZ5iHJph2Vg3zsNE+Ti2W0flAfFr7/pds+Tq30rnkmP5QzSsgj0OPYqYEx+gS+A==
X-Received: by 2002:a05:6a20:5481:b0:1a3:6faf:c0cc with SMTP id i1-20020a056a20548100b001a36fafc0ccmr1838079pzk.20.1711019861269;
        Thu, 21 Mar 2024 04:17:41 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:102b:a64b:d832:a82a:837c:6d3])
        by smtp.gmail.com with ESMTPSA id ka6-20020a056a00938600b006e7324d32bbsm5531120pfb.122.2024.03.21.04.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 04:17:40 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 21 Mar 2024 16:46:35 +0530
Subject: [PATCH v2 15/21] arm64: dts: qcom: ipq8074: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-pcie-qcom-bridge-dts-v2-15-1eb790c53e43@linaro.org>
References: <20240321-pcie-qcom-bridge-dts-v2-0-1eb790c53e43@linaro.org>
In-Reply-To: <20240321-pcie-qcom-bridge-dts-v2-0-1eb790c53e43@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1264;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=c14pcQ7llIjx8mdlZCcx/UxdVlyVw3faEieM5GK4g1Y=;
 b=owGbwMvMwMUYOl/w2b+J574ynlZLYkj9I87juUeyJOlTUEpJ2ZUqi9jl6rdWZWyP8V9kE63Px
 Skob3ipk9GYhYGRi0FWTJElfamzVqPH6RtLItSnwwxiZQKZwsDFKQATObeL/TdrT9jLAs9LQkU8
 GruFdRf9+5VT2W386Vrd3XO7XX/Ke8zrvsAdcmZLimi87sS5DGf+eU/bUJ7XwlanurrN+WCahZ2
 eZx6PZdyak2+v/hdav9NSIPj47crN7Bt7eizvp2SE1zYsk5n7r+d08OtXWV+u5SvMMmwU0Vq/Zk
 mcWWmD++2MLPbk37dMZI7O2ioq6vajSDovTZol0U/bIe/m3eRV3yqDXRqD7X6nbcmZ0PlK8ZlQw
 DcL7iKxKZs9js068fMG/8nZbJrBlT80trZnZx2fLrqJO+y90aIVAW7V5+OnNr9Q9sty/Os7R1yB
 reOp7o3IaU5HU72dVXseHP9RUOYYXx76I3/xdY0LHIt6AQ==
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index e5b89753aa5c..12324841d1b0 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -864,6 +864,16 @@ IRQ_TYPE_LEVEL_HIGH>, /* int_c */
 				      "ahb",
 				      "axi_m_sticky";
 			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0: pcie@20000000 {
@@ -929,6 +939,16 @@ IRQ_TYPE_LEVEL_HIGH>, /* int_c */
 				      "axi_m_sticky",
 				      "axi_s_sticky";
 			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 	};
 

-- 
2.25.1


