Return-Path: <linux-arm-msm+bounces-43626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 490EB9FE5F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 13:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFA0B1623A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 12:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED391AAA02;
	Mon, 30 Dec 2024 12:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iaEaihNy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459001A9B51
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 12:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735562698; cv=none; b=Nnbn5twcct7NJNNpotkLldHZO2SEXbBvZhdWLD6J+iG0S4dQnc0W5xoZWqHSd8ZFXtGa27t5NeQ7HdrNMbx3S4ZG3miMJG3TuW0h9jI4E9B6jcDFo/KNw0fixULiHp4twrDbwwjNoYmYZmr1ppRQ5E53oHJyTJsGMBw+Xp24Yis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735562698; c=relaxed/simple;
	bh=MjE+gCPtd3g9S1tORrv2JHiLOE0a8BYC25RRtAjy814=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iGbtXmKvdWHDbgD7CUS7YZ8fgxd8rR0jR4i8q2x3I04AFa2ND7s0SnnO+zbPeDp0sak2DPD5VNb+K4i5zaFW4XstG4LfQSpyBeVzNcebFNYdTb1rgpJzu+WjO4DqJ110cr96DLjP6Ft+koi4kRpkO351cEy0xmUPkN6NfAUenpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iaEaihNy; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4363ae65100so96010915e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 04:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735562694; x=1736167494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDLpHZqYoth1wOxgJJwZS3j1+oo/RlvEJVFdtpMBXi4=;
        b=iaEaihNy2nCgjHitDeuTqKJxSUXsGqRqn5eVAZ7w2bK/36td65ki9utNLLmlp3KPvr
         OWGNaq/hSeUiEDqGujeIdH/Je1UKWRmDpfBTjoruIcrLwTN7UEftNY4Bk/LAacbdAVjw
         zS3k9F86cJZ8hK8u3zzTnQpBMlj5mFaYsdGeH5jgTEFj+qU++nwm8ktWR2H9h8/C2nLp
         zx1f9sBSLYW8w2S+2cV39RgNKj44a5dQr2YyrS+Bl8ZLxYRnRVf/4rf+MGIAmPjpCSsD
         SktvlAPFxFkGGyKbN0HUIPlJRvJrv4Ip+DBlOTiY/UzHi+bfIcpQRoTmgbGDmP36ekaO
         nn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735562694; x=1736167494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDLpHZqYoth1wOxgJJwZS3j1+oo/RlvEJVFdtpMBXi4=;
        b=FsNzm/nb2JespgP4yuaFppjnFoTs/IvLPXTz1lhpN2IN15WTStWFbR+kWDD+woZfCa
         Pvreu/fclYoum4urG/fmEbiwWFM76392a7/K2CbCyestL/mojWj/shGMaxzPt1MBttTi
         TvTMIU6yVZ1nfpYNT0S3ElCScKQfwu8+0JN0l9BiCXRdy1VVOVqBXBCr5vKqvbQyCfDe
         oqIkzcRoYTWPUZs9Nnr/6JlQwMYBLJMnNmsJTxJoFagDkLzzGIDs+zg0LnrYjeT/L5lA
         vQIXwNnfOFlojWixl1I/sz0s71BmXqwpq/HKCoa+F4gu1CNo+/YG0rFzfAxu7hjKS21A
         E3Iw==
X-Gm-Message-State: AOJu0YyJvwhThzmENiA5NLCtreYx4Czw6MmfTSmy6sjMd17V8oQ3k3BE
	DN5gTRirIhScdsuQuKESD0/WFy27S+Dh2bSCqAt6nnWvCM1Cc1hEYV+IDxDT3vc=
X-Gm-Gg: ASbGncsaayJc0CHmXZW4CSrYTdtLwnkVVFMzstNzfE0LW1AtdrNHnB4MgLhnMQYer50
	ajaT6R7JV773FMHJFdt360d4L8l3b0+x4kXa4F7bmb4P+fjcXFD6p3pK6QWhLHHEbfvH5GBq3tl
	9sAPbVXH1+G3LPJ8BG+BUrGJheS1lVFGlaEmgXm1JhzsfneVwES6ctjkUeUbGtbZ+pYaUj0tTvC
	VjlKojrMhulz+DVCzlSf1ESd4StL9mr0OxDfiXZjIYHcosAvRcEKs0hjfMNLDKVyf+tyAO561zU
	cw==
X-Google-Smtp-Source: AGHT+IEx+EjUvqrBzV4PAtPCBp243WaSXbZ+nFxE7SAb8/Q9eS/Y4pW6QHUW+vszeMVp4CD2bZZOQw==
X-Received: by 2002:a05:600c:1c25:b0:434:f4fa:83c4 with SMTP id 5b1f17b1804b1-43668b5f691mr289484785e9.29.1735562693049;
        Mon, 30 Dec 2024 04:44:53 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366121955fsm359913215e9.21.2024.12.30.04.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:44:52 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 30 Dec 2024 13:44:47 +0100
Subject: [PATCH v4 4/6] arm64: dts: qcom: sc7180-trogdor-pompom: rename
 5v-choke thermal zone
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-topic-misc-dt-fixes-v4-4-1e6880e9dda3@linaro.org>
References: <20241230-topic-misc-dt-fixes-v4-0-1e6880e9dda3@linaro.org>
In-Reply-To: <20241230-topic-misc-dt-fixes-v4-0-1e6880e9dda3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Felipe Balbi <felipe.balbi@microsoft.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=MjE+gCPtd3g9S1tORrv2JHiLOE0a8BYC25RRtAjy814=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBncpW+LGCJGzICf/b+yISccugtrJLqq7SowdHDcO6V
 4FcoekaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ3KVvgAKCRB33NvayMhJ0asvD/
 9z3WwwyTtac2VrqxP98TJpNPOBfwU3KgPwNlPRFFA0z5SoS6smEPbPjCjfo0EpwzQVkFqD31SqctRD
 W+Y6cqGR7fCnkNpj+rrBfJT3EcdIISLcMHEJNaSVXyEKVIY4J3jc43l+jVTY6Vvsh9s4uxHpJhf7lA
 NOJhqbrmcb+dnAd1Q8lMHn6V+HotTud8P9dtOMu0iY5T3OD9DE9avjp9zC0r0zVQ7MuwLyjHDA1bM6
 2MLUxainboUwDNnSDCNYDILGGGQ+H0mluVpi7vcJMP3Uku3w0ZdF6EkFqgecCqaN1407zRb8WL7ukw
 Z3RSIOL/X/yh6k+x0KwlxSeFrhQUkGxUiJ2N3ucNuS0qHvJfcZyWAvB/V53Jg0upGnuaaXrFq3vVcB
 l+tC5nXrboWNRkMRp4I3TKoe5uLrlx6tBpugVrsnhJh2/mLoPkTKOen5xFIM3fCTHC0AgwVP/cj+DT
 EaDhSe+bx29neFj8zbz8rZbT2s4qF1CSsumhlxQ8Oe88tc5UUV0DCxf732XJqfVMbxhidihWfmbIBb
 rA8/vTwBlbt4xmCB5Xz74sYdXi9Gnx8oM/cQKf2JV5TKgIvyF241M/sJFTOwNJ/I/La7sEHp4ujVjk
 2dsw2ysUBmsDqXhWBwEVAw169H8EbrapMArKJd4CzwQ4oRjC1aE244P5xYzg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Rename the 5v-choke thermal zone to satisfy the bindings.

This fixes:
sc7180-trogdor-pompom-r2-lte.dts: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
index ac8d4589e3fb74b9d9105a8ca2b0cce72de22d86..f7300ffbb4519a7973c74198fc0f9ca2d770bc3e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
@@ -12,11 +12,11 @@
 
 / {
 	thermal-zones {
-		5v-choke-thermal {
+		choke-5v-thermal {
 			thermal-sensors = <&pm6150_adc_tm 1>;
 
 			trips {
-				5v-choke-crit {
+				choke-5v-crit {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";

-- 
2.34.1


