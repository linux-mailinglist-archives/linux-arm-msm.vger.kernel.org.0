Return-Path: <linux-arm-msm+bounces-35916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9248A9B08B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 577842828A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 15:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9332517BB1A;
	Fri, 25 Oct 2024 15:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vPArYkF+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E288515E5CA
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729871012; cv=none; b=q9QyfXJPIg5xuiH2O3nXb8atEjRZ4YOqhIDsq7mKX6+Yp+HxpijFAHqIvJMVF9ZHyR9pbJCz3hn4bIuAaLMZShs11KxIfVDqhc8vgAKPXo+YLJ2CySD9ErVr8e0TJ1PY8pyd2RPgtvZ8ZyawU/Kq6Dpm6y9d8CebuCc96rEmpu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729871012; c=relaxed/simple;
	bh=0OGkSu9fVMeO/ggQr8GmRV/6Fq7P4yGca3PaDQMq+zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PR9vXd41TbpLWWn3Oass0wm0xtRXjcCTgLLPFsnzIUB8e3YkyXhGialgUYiWC4Lk1CCULcJ3WsVazFGfGeq4awwc89oQuUJFowselRSr3utRW3SMlhtVgvlKP4F15KU55CoO7Iyh9Y1F/Hhhocij3FlHHmrrRHW05gTgY/JUbuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vPArYkF+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4314b316495so19969845e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 08:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729871008; x=1730475808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAvhKRhyCVaJwnIkEFPjzzUhPMWhbjYeJwcT/tBQFU0=;
        b=vPArYkF+CvO0rNs+zRNY4x6QDh7gf3/K3/swMd9Be+gcs8htzuk1U7sKu88F4XiVKb
         vbWikqwTVm/AGwQHgzKg9oXdnoxturmrbFIfnXNV90DM+YfKwLR00pR2ftFH8IrL8BKv
         UbIarwLe9ngX8feoRzdk/ALjurL8OFToaDM2yjXzt8VkXfZPnlqYJP1Qp2yhQe2aYIlz
         XgzqJ+i14vDNDvWO87xQdIZHjex5uYd9kwY3D2NPYtbvTu9RHvtfBtfVAeUR1BHFWCpp
         I5nL6cBFLs7gXYShv/S7JYLdwYGUDJSHi1N3Oeg4UI9+aaUtZTGH22AxQf4qeo/1d3Yb
         tj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729871008; x=1730475808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAvhKRhyCVaJwnIkEFPjzzUhPMWhbjYeJwcT/tBQFU0=;
        b=MfeUayZHyAyJFuZ8XL/1Rt8e7LJdxKd480JgaqQHii0E8vDoAsyhmF2AvYHv6Y7f3e
         a/EyKR92nuTaSnw7imTULibVB1vxvLGRa/s5kCj2hC9B0tXrgLIAEH2EoHfm7OZgWeik
         nYOQRySwEpLXv0gkWa7TuwYxRx35j9C6Z148SR1mwly5ntvhappXx9OLrnUPiIUly3kG
         sBR2Go504vzTgv9m3WcxzxmXOj/N4evzS0sYI4cJU4ldM2KCmXFXenN0QOD5mSzdF5b8
         bPzO0mmi7OQOkWNJTGIhuJQtyAmjMPUlpNoqT/KYspnVLRsCSroMn1BqdyvOmUWZgraG
         LSHw==
X-Forwarded-Encrypted: i=1; AJvYcCVCuTjfXqQELwB447cJ407pg2crBOr3GOJ+iFXfq6tnsuUc2CdkE8YjFt3b4FOm17EQ82vpd2O4sSWClbC/@vger.kernel.org
X-Gm-Message-State: AOJu0YxmK2U1/YzlgDNuAzUsY6njpE0t/IbbSHFo4KenUsc7oNnKrKgw
	UZXg7QUKlDa9fXgQi9hv8rcSEZkjaMFqrH5FjdF9dId3k7Dx1nn4pcDFKnDA+s/k7jN8SIIgIIx
	9X6U=
X-Google-Smtp-Source: AGHT+IGGijeTxGoA0dzwySSV7QmfufUp5vZNtDNrB7BBd9vPRhaNWh32zcGrgD8Yu6ae8r2kP/f0iw==
X-Received: by 2002:a05:600c:3b1b:b0:431:594b:8e2b with SMTP id 5b1f17b1804b1-4318413ee73mr88288655e9.12.1729871008199;
        Fri, 25 Oct 2024 08:43:28 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b479ffsm1829092f8f.49.2024.10.25.08.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:43:27 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 25 Oct 2024 16:43:25 +0100
Subject: [PATCH 3/6] arm64: dts: qcom: sc8280xp-x13s: Drop redundant
 clock-lanes from camera@10
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-3-cdff2f1a5792@linaro.org>
References: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-0-cdff2f1a5792@linaro.org>
In-Reply-To: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-0-cdff2f1a5792@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Depeng Shao <quic_depengs@quicinc.com>, 
 Vikram Sharma <quic_vikramsa@quicinc.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

clock-lanes does nothing here - the sensor doesn't care about this
property, remove it.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x13s
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 83208b10f994b282ed50c3ba8a82298b6fc50deb..15f59b622bcd4250f43d329fd9a371ae4d0a73c6 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -633,7 +633,6 @@ camera@10 {
 
 		port {
 			ov5675_ep: endpoint {
-				clock-lanes = <0>;
 				data-lanes = <1 2>;
 				link-frequencies = /bits/ 64 <450000000>;
 				remote-endpoint = <&csiphy0_lanes01_ep>;

-- 
2.47.0


