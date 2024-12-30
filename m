Return-Path: <linux-arm-msm+bounces-43624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5D79FE5F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 13:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52DE07A0F88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 12:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF5A1AA781;
	Mon, 30 Dec 2024 12:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fsGkQ/Y4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DB71A9B35
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 12:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735562697; cv=none; b=fDxfdacbdhxcSfdfW/nWxknNGaqtQ9zPVcJBp4nBYQ+gZf3nhXREeQfLvLW69uXshEV1/n7A+aFvsZku6rckbdnjvXOZ0CEjK/jqEMWIBimmsVuru4o8Do6v4kU5wsAcT0RQX1Eat1oSGI5VVNOv++aOK7uN8ZmBuHlp0jXBAQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735562697; c=relaxed/simple;
	bh=HHt/umcpRq+rs/P2wbiPKSdjqZ1QwYbx9ZVZDypcOTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGxMwA4DL/18BvhpzJVAaBC557iBcJhcxkxSwMh8DM+2+YbC/0FUd83IOQiwBrEjyqtu6eq6y2gmKYjLdbpco4ncAJ1pKL7NKPeEFwGxieedLpCnbLG28+oa+zUrRILELZ9sJCDOv+IuTfpTEuKf5q+Ytz7ORsbnD2OTNXynnVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fsGkQ/Y4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so91578425e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 04:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735562694; x=1736167494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVKyCHkPbEDOof6AiuTgileClIawd2CAXyMde6tHgVA=;
        b=fsGkQ/Y4Qkj074SPDYva2GiYN2WBaIGJ45iDtHTUGVi39r+aZq8JiNsy6mp6hhGbZl
         Kh+RoA5VRqdo/IIsbRfDjz8G3IiV/4YJ+n+s6YeyCJCrhow050PnlpQRs2XvvZwqaSrf
         0xcZGtRb7iovW63uII8q77KKK4r5tIbF9GsJtfXqhMSIP8C5TBC2CME+o7AtThRJ2bPf
         LZZXvaoJm+2Px3AwuL1EmQzL4cGxm1ywhv9cODTmqjhoK0ukK8OkQ7Dg6YER8RKZkM8J
         LWVokqS7S4w/g3UdpswJzN3VBHeACkh9Zgaw3kXyCcowwEWY+7Dpxee3EZh76AYkXSiQ
         fFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735562694; x=1736167494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVKyCHkPbEDOof6AiuTgileClIawd2CAXyMde6tHgVA=;
        b=Nba86CbFIozf85F9sM47yw0cVLzx36D2T6p4Fm98wlTgdNc4kXNzGpTOGln1jsKoX2
         ilYWPF01aHt4XdpV5svzTA5a7uJjc1Zo47Ckft+/RIpuBD9YIkvSeHqE+IctKS1f7bK1
         8pJZmKicijfS/vu04Vd5l2Lxq+nb0Y2PVDweAuuJL/71W77rH3ZflONbKxN0Anj2pI7r
         mBa4dzxDOEkOxNQ6FuxelXNnICmu0rR/oxCwWHRx/J3EnRZTj8nLZCr6+sElX4CqbCy2
         9wlOLcH6JCkDU52SVWTaOgGR6XwI2x8Qf8XPhSHFnwzKFYIy9NKjNI49HciAcYII9Eta
         nPdQ==
X-Gm-Message-State: AOJu0Ywu74X68azlRmaRiZZG+FRlKAXtCbyEixmyW+q4e9M54tf+7ooV
	CboTXbOwrKH61qfryPir1xzTdJ8Z1+h5jNNmS16gnmH2MDQB1g5qQG/OaF1LX3o=
X-Gm-Gg: ASbGncvtXClG5W74LbBVwSxq9YFQla7Vt1hFiRVD01d2NTKOc+8vQHt5xl5usqDUAWV
	fRRaVmcEv+m0pOAdT47TfY2Snit9RhTbUToxtxvtDeaa8MCxRPWGI2o7crZocaLlfpLE+8jCaLX
	Oj4L3E4JVGVhBI+ZJ4PMdr8SRdNitYU7FiMINMP4QzmA1S2xhaQD5a3A71n6PYY4VFGoedFBKPn
	UedGrazbaP7zI3VAD+8/1i22TwjL0wr+q8cLKy2c91+Uw3KnQv110GyTEVAX6jeqED1JoK/qn7a
	jg==
X-Google-Smtp-Source: AGHT+IHLNM7+iDeQTJwbQ4JSfmXHmGJMvhNrT5BFNXu72WMl/JDaYhYvAvviVLjeJzsAkAItitNQmQ==
X-Received: by 2002:a05:600c:3c82:b0:435:fa90:f19f with SMTP id 5b1f17b1804b1-43675cb1ef4mr271014435e9.12.1735562693936;
        Mon, 30 Dec 2024 04:44:53 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366121955fsm359913215e9.21.2024.12.30.04.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:44:53 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 30 Dec 2024 13:44:48 +0100
Subject: [PATCH v4 5/6] arm64: dts: qcom: sc7180: fix psci power domain
 node names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-topic-misc-dt-fixes-v4-5-1e6880e9dda3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2701;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=HHt/umcpRq+rs/P2wbiPKSdjqZ1QwYbx9ZVZDypcOTg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBncpW+1CX7IG+ankH+76iUzIWoTNZp1XGfb8X3uaFH
 VfIVZUeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ3KVvgAKCRB33NvayMhJ0ciiD/
 9VtLJQCLgYSB5iC2uDef7LrsoYQy+9W5C0DAbUKNJdHn7A3ZtQw65Nz+ayOsLLWy5YaxfW59DqXk+3
 /xrFJZl3YuB4c9Zf04yGRWOo3ywJwWWAs+veUN0pOkPqZFlKchVSQV3YxUtx16NEdHnua4J1FAAkrN
 rM5a7sJsbpJOtX7IxrYaQZMScBAuxPo0Ra1hItVswsO5J0jiYoMhAwuu2EMVio2Lv2cOHH82Ej9anK
 hqFRovdniNLgkNFeXi1/5FdSmIqSSZWQlJsLiH3h7kgPjyQuIPow5VUF7+f6BVtFDf50YRr+t5lp8C
 cl+OmJ0DrEa/QmkiwogxzTNZgOKU972+PKnpJLSWVE/ZK/ZRJ+IsAfKfjqbQ7MqzTpAG6068f5KlJH
 mo0BmBa86PIcVTRpSZaBMW5IPOhc0DgFAWXPDOTezgw8i3ekriZCycKjbWcGQDcJH2VHE1ziHuRpFv
 aoRK1sbGOB4FeoLiHbY3MxB5G0XURvIWpR/hG/f4ScL4MFdbqjmQatL/OeoFXghMPlUjbYzbL8lr5j
 c+YF7KqOaRyQiwmm+AK9feZeM5yck+qXJCcNLPnrQ/koemonsELsw5B+dUZso7d6BBaiyZQbIaI4Qb
 mSycB6hZzUIvKblCrx+ULbKnaF7ffpfct5hm+b7fUjQc4UibIk3kwvsydXyA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Rename the psci power domain node names to match the bindings.

This Fixes:
sc7180-acer-aspire1.dts: psci: 'cpu-cluster0', 'cpu0', 'cpu1', 'cpu2', 'cpu3', 'cpu4', 'cpu5', 'cpu6', 'cpu7' do not match any of the regexes: '^power-domain-', 'pinctrl-[0-9]+'

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 76fe314d2ad50d002ee6adf4659fa685ddae89de..e7773d215f34eba9a42808eb37fac7fa1fda87b1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -580,55 +580,55 @@ psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
-		cpu_pd0: cpu0 {
+		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		cpu_pd1: cpu1 {
+		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		cpu_pd2: cpu2 {
+		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		cpu_pd3: cpu3 {
+		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		cpu_pd4: cpu4 {
+		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		cpu_pd5: cpu5 {
+		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		cpu_pd6: cpu6 {
+		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
 		};
 
-		cpu_pd7: cpu7 {
+		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
 		};
 
-		cluster_pd: cpu-cluster0 {
+		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&cluster_sleep_pc
 					      &cluster_sleep_cx_ret

-- 
2.34.1


