Return-Path: <linux-arm-msm+bounces-30700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D3596BA16
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 13:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9C4D285609
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 11:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491121D0DD9;
	Wed,  4 Sep 2024 11:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Djr51pIV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840E61CFEC1
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 11:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448601; cv=none; b=aVRvMycuw9d8ksOBTspx0qaDMdcJc0D3NPzzRj90tWBAErY2soOrlJHxVheZF44rrfmoEP1xTGFGHdPDMHM4RlwKESFnBEymu2KleLVlUhoFzIxYSpOs5JZOVxZQqeBjsfUf+9wS18NFDaPVz+k1c079+AdjvPXnEjJLqRoO1pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448601; c=relaxed/simple;
	bh=uy2aOnLjQ2+G8PZE1lwvy23FpuYKEzMelgcbSLPR/e8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dE9+tnQ6TEipGZPSC9ud7F4yF28btieLizfytaMBCdvzT81FyThOGrNQ966mHgoHkz+pv8jLiy+uIAVR1lfWokOjhK8YROX6+HGCp5SyawMb33yMpIbAc0ue9ZMrDRTT1Q/WYqCVBmc4z6EsTAdD3iK4G/B+h1TPAdUQZOZuWno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Djr51pIV; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a86a37208b2so766315266b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 04:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725448598; x=1726053398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VBd4o6Fs/+WR6gKfBUJAZ3gI+DtPok8STYaws7NRe20=;
        b=Djr51pIV7WwwmaBY2dSE7PrQBDXiwwq9J+KiRPyK4y4cNDFk9kDBZgfmL4ewnWrKEF
         Ptusumej0qZR9zsoOgtTzvpEwgEEB8T/cczpbXCXmSYiSfZMId+HLWPyZQpXAyc7NY62
         YO/sQv/NY+LjUwiCx5elN7y5T3KKq3xP6jrlNnc23crQ/bMTxcvwCpD5nYIEzzWB6+ZA
         c1O6XZ+MRKJNm/HdS3UQ4kIyL1EK1ALQPcVFIaNVq2zdplOUea4D+hRfXPVhnLJPsYYF
         ttvUYEQJTUt1DEnxqC0nZEXFLD3PW3CleYF+M0auNS3+tmufAx/hIL+Eqn0MZlQwnT/p
         adHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725448598; x=1726053398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBd4o6Fs/+WR6gKfBUJAZ3gI+DtPok8STYaws7NRe20=;
        b=u9Fw+ZqLpwqdQbM0ZbI3kwobAvew6cuAql6ODX9GeY1H+rpKGh5OlXUwf46t+PPHtv
         Arr1V1fmTEjn08+QPu7bvS7zW+dn1c7UAeM7xI6n3rMIMzj+gSFKtOLkOdIeOfmjG0bu
         JcaSk2qycqITlKBhHmSnCh2w0wYUw58ROrmcB/RDcn3hzJVGVIHFtX3YLFSXaV53UQu5
         tZ5Zj07/uaDGVhBxcZsaK3IkGArE32H8GOLToR1iLMlzX/4H1JlDXL6TcTfgF98AV70I
         uYBrXRBd5sshS1ebv8Ch/a0fHVYUCoBJwVrtN2PMOLD67EisKvfVBwWaURu4b/r4vRMU
         NNeg==
X-Gm-Message-State: AOJu0YzhYabC0toSNQfkoY3ZAnRw24JLOkQwSAIZAYsISmCxqw/sMB8b
	GslB2ynFAvydDuL8yFo7VYf6Id9BUdUQLlC6qtFjzQ4b4iZvsYHU3GCE5u8HQ8dg6LIc856AOSQ
	N
X-Google-Smtp-Source: AGHT+IEaUDRcmq3hFpgGLvAT0wRkoJ9UYPEA7OJVNw+XAZA0oup7t5wPyJeYX4X6GGdDipTNzld6DQ==
X-Received: by 2002:a17:907:7ea1:b0:a88:f826:3792 with SMTP id a640c23a62f3a-a897fad2923mr1515355566b.56.1725448597487;
        Wed, 04 Sep 2024 04:16:37 -0700 (PDT)
Received: from lion.localdomain ([2a02:8109:aa0d:be00::a253])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988fefc12sm793401966b.9.2024.09.04.04.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 04:16:37 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Wed, 04 Sep 2024 13:16:24 +0200
Subject: [PATCH 1/3] arm64: dts: qcom: sc7280: convert usb_2 to support
 multiple ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240904-b4-rb3gen2-usb2-v1-1-b858e681195e@linaro.org>
References: <20240904-b4-rb3gen2-usb2-v1-0-b858e681195e@linaro.org>
In-Reply-To: <20240904-b4-rb3gen2-usb2-v1-0-b858e681195e@linaro.org>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=uy2aOnLjQ2+G8PZE1lwvy23FpuYKEzMelgcbSLPR/e8=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhrQbjpP1zt/nq/l8JfbDDFmfPwemex8JuPJw2fMtoZZS0
 11+6Me/6yhlYRDkYJAVU2QRP7HMsmntZXuN7QsuwMxhZQIZwsDFKQATuajJyND4upjBjWfWeTbv
 CY23gj72nt3QMW3ttml78uQECvdxdJxj+O8q9yHHnkeu0cdc0JD9u923+E8rK4yVY5rdTX9vP8P
 SmgkA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47

We might have more than one port, so use ports instead for the second
USB controllers.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3d8410683402..06a74601c2d7 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3712,11 +3712,23 @@ usb_2_dwc3: usb@8c00000 {
 				phy-names = "usb2-phy";
 				maximum-speed = "high-speed";
 				usb-role-switch;
 
-				port {
-					usb2_role_switch: endpoint {
-						remote-endpoint = <&eud_ep>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						usb_2_dwc3_hs: endpoint {
+						};
+					};
+
+
+					port@1 {
+						usb2_role_switch: endpoint {
+							remote-endpoint = <&eud_ep>;
+						};
 					};
 				};
 			};
 		};

-- 
2.46.0


