Return-Path: <linux-arm-msm+bounces-43627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AB49FE5F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 13:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C6883A2340
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 12:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0EB21AAA1B;
	Mon, 30 Dec 2024 12:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/ryiXrT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6AE1A9B5B
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 12:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735562698; cv=none; b=Nwd2y2JnSj2ADumWJS2s5J2FaYq8jDcEInpRZTrWMXwd6DjtxAbZgjX3Gy1InehMjvqS/CsNsMA4/hXyx/dWQ+f8ocNbRF42tiCNidBKu6KXysbfsViAG3V59W8KU5nYd8cdT6mBXOVlGEzr0uCjoyAa4ALPt4j7v0AioAco33U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735562698; c=relaxed/simple;
	bh=s//vtdkbw2Gb2QkhA0NkGSHzJ9RvMOOZFJDWLiU/OYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1+R19LmCFO0dYvx6B+5efhqdIRDw2wFGmrKAEX3jpOd6FXM7fWkom4Hq6/Y2sL3wbTVTL4fPtyoo8/9AeUfIdicZocNn4OXArYwIma11zK5pT1Y8mB+DM41aHVyY0An6KU1fnlw+72EnJKGmP3aGcvdXeWmw7xIsUpSSAfyvKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/ryiXrT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436345cc17bso66546605e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 04:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735562695; x=1736167495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6g0PdC8VcNsQn6CXAGeXre0Evydn2mlkdKiWM2V9YXc=;
        b=q/ryiXrTIk1vjv1nmNNyynWykRw5KVdgqSC4xau42WGfJoHO85/r0fhSxyfMe9J+0Q
         0RJhmTyytBpZzPu20KZ4tmKpJWZ8ORfxARj8Jibq9qJesPbdXN/PMl7YM12s3JIoQYRx
         j4vj31AKjwSVcPxLe+bjhDn0HE34zzD7sbRbWrmgxIIUvy6kpXQ68dswoW6dyq9gjUrz
         ULJ2/z41lsleejbKbtr9SeDUdVisSQbhZ+kuIwJWTFphIyI82b++6BmiVWOud6e/3gtd
         UMiz/WScVX0y8z3gw9sqsZnhJA67lvEgNIY/XCoISAyIMotSU9vTaHHANV1iDoW24VN+
         Se5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735562695; x=1736167495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6g0PdC8VcNsQn6CXAGeXre0Evydn2mlkdKiWM2V9YXc=;
        b=eX3po2Dpu7J81cKDtbdt4laU6d1IoclqYBJzzelfIZD4PH6L77zXWXAm5K8mEod7++
         T/F62OLwXYmnf1fHN5bZgvAZHHrBInZSwsBAwLeSF/Zoo663cmRlLwrKQBZGIW+ZUS4v
         4J0O2U7nIGIOVHhOfEwDF9xd+B4iYqai0PUbcYJxtQ+HqVCZ1Arc6b7JyA4nuprimmQC
         /83OxEGefx1pzp2KmOeS0kGvFom6ZSvX+3E7aKMgK7ZKP5sF3eH9TvjOMKms8cjkS96a
         ln49BCQNrg9VLyL3cfldymTLBkc5QxJSugQzbxQnWLlsQvlGwBe8eNWeb2FuHaSq+Hny
         adiw==
X-Gm-Message-State: AOJu0YzBLuTGzncF0AWJG2rr1k6tbyW/eT78MU1fvEmATOwdckCJnSVP
	NfTuvzrMmP4GwsHyvHrlfNBwCN5RNvuHW2vFB+oBCdCFFzzKlOlafpkOKmBaeb8=
X-Gm-Gg: ASbGnct041HoV0tNBLtt8yGirPkYm+aIuYtZnGpcIs+WptkFlzOMkWP2Qy7nvcw/9Lr
	K5Cw3lz44X9SNIzLF0KfYBslIuGUUwUtEU3ZU0kdO30SUMzlmuvpzfwmRjJRRXdqRy858IrY/Zi
	gBlyEYX50yRNiJPaG4O2nYkWgmzdpJ2gxzapD6fHCaR3/eFqIykfwYx8gpVNRFlRGt8/hrqCmZ+
	lM+wFLAYYaexY9tGjZNqNEbWblHPDO5y8wiZAKHy+k/l5L5I2wSL59no/RxmXDlwkJNs6ogxT32
	0g==
X-Google-Smtp-Source: AGHT+IFvrE2j0qJnRai3SKRr6+qxaKvvEjRZeszr9BxBlYVlvHTNbguaG1wre/ysLfldKsgzIFSD3A==
X-Received: by 2002:a05:600c:35d2:b0:434:a929:42bb with SMTP id 5b1f17b1804b1-436686464cemr319289305e9.18.1735562694768;
        Mon, 30 Dec 2024 04:44:54 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366121955fsm359913215e9.21.2024.12.30.04.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:44:54 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 30 Dec 2024 13:44:49 +0100
Subject: [PATCH v4 6/6] arm64: dts: qcom: sm8150-microsoft-surface-duo: fix
 typos in da7280 properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-topic-misc-dt-fixes-v4-6-1e6880e9dda3@linaro.org>
References: <20241230-topic-misc-dt-fixes-v4-0-1e6880e9dda3@linaro.org>
In-Reply-To: <20241230-topic-misc-dt-fixes-v4-0-1e6880e9dda3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Felipe Balbi <felipe.balbi@microsoft.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=s//vtdkbw2Gb2QkhA0NkGSHzJ9RvMOOZFJDWLiU/OYo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBncpW/z6rom+qlt29QBs4FCeDbE1/fa3w9YY7M9nVA
 n/xsefWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ3KVvwAKCRB33NvayMhJ0VMqD/
 4mqPE97swb0Vl9duYEuDVtJCbpPmT9ekp33eczkVmczUVPvFtwLoSKNdj9xgYl97Ra4rY/d3HP1AHl
 8Qwbm7hvUBCwG7v4H60nKQx5tdUzx7/rlhj56hUffTue83RBoBkOoVtFhmxauPjp4APpCKbVjC0YVu
 NEZbBI9lCWdwRAz22qSJEyFc37XPwsINqf1B28gGLWc9lr6c1MWsblq7Q8LTmm7M7MDPpOFoZBQBYo
 paI0ieLFRghdBlqNji2GDUboI6cvHoTg5utzUen16eDrT7zdJaTE+ktzn21QXNQJMzfFKC3+9FBB3T
 jYW1NjzL3dfFeoQGPWttPXFI12hyICSsgqLxT/sy9SiPofGhWCwLEGZMZHp88wYrjRdqYTrXyUz1mx
 YRBDE3MUhNSlzOvIZN+q1INmBlYvMuQQLz5XGl22dN4VAydUGZL4btJgBrRPa39YPOSlYkaUzQfWZy
 gTXqfqN0yPvn2FsI2PWZxMxS/WBX6n1ed4kb1n6qWzQR/upeFRCC80J0pl/PBTVXKEdA1gLSKYkJWO
 Sk4SSNMguyh4Fo+1e5LM+yLiJS8aXPgubNwpnyRxEMC4kLdElFF95V5kg80wmL4CeM5xdsYVy981YA
 AdoJ4bpV/NQ3tl5JPfQsn6+Bgu45AhQJ3e0g41eYhJ7cPOq4KiLo2g1oPvmw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The dlg,const-op-mode & dlg,periodic-op-mode were mis-names with twice
the "dlg," prefix, drop one to match the bindings.

This fixes:
sm8150-microsoft-surface-duo.dtb: da7280@4a: 'dlg,const-op-mode' is a required property
	from schema $id: http://devicetree.org/schemas/input/dlg,da7280.yaml#
m8150-microsoft-surface-duo.dtb: da7280@4a: 'dlg,periodic-op-mode' is a required property
	from schema $id: http://devicetree.org/schemas/input/dlg,da7280.yaml#
sm8150-microsoft-surface-duo.dtb: da7280@4a: 'dlg,dlg,const-op-mode', 'dlg,dlg,periodic-op-mode' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/dlg,da7280.yaml#

With the dlg,da7280.yaml converted from dlg,da7280.txt at [1].

[1] https://lore.kernel.org/all/20241206-topic-misc-da7280-convert-v2-1-1c3539f75604@linaro.org/

Fixes: d1f781db47a8 ("arm64: dts: qcom: add initial device-tree for Microsoft Surface Duo")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
index b039773c44653ae8cd5c2b9fdeccbd304ad2c9e5..a1323a8b8e6bfb556a2d6d865f8b560bd6c4d429 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
@@ -376,8 +376,8 @@ da7280@4a {
 		pinctrl-0 = <&da7280_intr_default>;
 
 		dlg,actuator-type = "LRA";
-		dlg,dlg,const-op-mode = <1>;
-		dlg,dlg,periodic-op-mode = <1>;
+		dlg,const-op-mode = <1>;
+		dlg,periodic-op-mode = <1>;
 		dlg,nom-microvolt = <2000000>;
 		dlg,abs-max-microvolt = <2000000>;
 		dlg,imax-microamp = <129000>;

-- 
2.34.1


