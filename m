Return-Path: <linux-arm-msm+bounces-75597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDB1BAD2F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 16:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EF31189D0D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 14:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CEF2FD1B0;
	Tue, 30 Sep 2025 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4yngYK1t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26270212FB3
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759242757; cv=none; b=rhwg/tUiJW9SysDMYSKjUc9/gd2f6tFdTArqEd7eufG5A/tpMvi6IwLb6ob1wR/gt/puDZY6BCGUkLlw5NnMnYhRaKSHA/aXxLUbZGqYG5jyXFTUWH/LQYFsHEtaHFZQEI+hHLbR1QFVFgykyrRJG78iW2x0jD3EirUIfBThMVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759242757; c=relaxed/simple;
	bh=e33Ua60plf36TGZ8AqkpnW6fFz1iOr2OCUIOOUwqFxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JqMOrKZKcV/apeSb68VHSeSRtNuOQLKymMMVo9q+Qk20UN6TW0muSIvPBDauVgsHmhUF6koX4uT1xhACC4BD92GriN8KhT+zjNg3tt56exchR7aa24vACgW8T26TXTPEMccjMPqCuf2XMmyU+Sg0u6O8CczYMpXHQPFbISYjy8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4yngYK1t; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b41870fef44so306196566b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759242754; x=1759847554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIXFkHTmTBNdoxIiGuiXY5Mb/iVkGyXh19PiQ5Z7rqw=;
        b=4yngYK1txH4CiwIHx7cTJTv8qMwBRP5wznfEtNYWAAWxDTExd1ieTWuQvp6mcLkqpM
         Q15XYAZ7GtE9WzwWhtAfZj8bMt0LhuuzGnaQp5+1wiDkrqCa/6JzMPbJzz9FbTga/0qp
         9/j+2H9e3Ve9dSvHF4yiiIzrhXXZ06WUYVHO/DQb8rqIQ7tekvWttW9Y7MWbDQ1/1UBH
         2hM75zMfneGfyvsWApdPQxm1ph0QzFwnV8yT2gvICe94nU42aaTiMJK8KtUyThP+ZRUu
         Q4jIitb1SgPUZhJhErUejthTkwCO41lk20Y/v8KUxdFX61BDMAcxTQfgOiHo/jIgpUXb
         /FWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759242754; x=1759847554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIXFkHTmTBNdoxIiGuiXY5Mb/iVkGyXh19PiQ5Z7rqw=;
        b=Blay0qu7Pq9oYnInbzFLyEumu0vnYYz2T6i7bM2UsDUvy7Vi1qoao1XwN3PN/AcJKX
         l35xuQGeA1VpqOG0o07wRHsDI3eKIPYZkn/IJHkAifu6Kz9p4jA2+Y9EsY+kfyfJOQpu
         harIlclu8zIBpbusfJzgBSf6GPGDMcCTfFrhfseRCKVKwCOKPRfi+JrL9A5OadJcLrba
         tvjXN0cS4+DYV6L2C7DgRJYqs2gg3X+gTL1OLEFpz32IPGUs46ZDUzoNcbdf4cvkiyDS
         YFjY1dLyNx6y+KpB+BsG15ykXak5xEXZr4uNwBPTW4+9Igaz7eAIHKmikraISBVwJ/60
         CX+w==
X-Forwarded-Encrypted: i=1; AJvYcCWDihD67eezMpH1fyCmqEAzhwx6ZlzM6w0e16ZRmasM6Qd974zBjl12rfOcloiWgzBUg4G1xHRtiEy8w86V@vger.kernel.org
X-Gm-Message-State: AOJu0YxOIhMFAzgt8Yr07Z5tsu2wVuMrD4f/+5TWEux/zDgMeckjiK08
	+6WMGvjz3bap6YvTaznNAmGzwMKha8dI9KMxHAdyeWDJ4D3Vk++xmFbvyClgQWKflBg=
X-Gm-Gg: ASbGnctFCdIlRThL8hoJIJsqQVFQt2wz/aO/5rcewd2aWm7FuA2g6Fq0k3F3VSjtOUQ
	a90LlAePOuOnkLUhn/cVRznTEHl+SpLskcP5PS9ptgsY+yrvS6auIa1N/Vmvzoh/C6arefKZ7Za
	+aCIEf6Fm/6cnwrCuSgV4FjxXuqtAHJQj5KyXbvcJXnW0hR1d/hQ8yC+kuiSEctnjRWJMDcRk/j
	zli82S4DX3MgpI5u88vqMYr90MwFEi2rKUMpVU5ChYdC07nFXOLUZAexxbUCZYOp9YBFPc2UWP1
	c3DBt7IVI6QGHlOer0uGqyD39u7zTO6dYpGk+yDDR9g9Zsla1Uioicg7ejLeMJ6YaIXmUkdE4ep
	ZZdzyYlu29DaUjU1AaEF/uSVWXcPbIk/ZL/auANUkKUHSmwq5CcIjmxgo/Nd36kHI+4kFnQ37Sr
	4p2cq5q2XrDZZx3IZgOIbpilp7/839
X-Google-Smtp-Source: AGHT+IF4zIeQ3qsHZ3+7UkuA/aOdurdD1kBt+SKdxxprt50KcUOpEsL/VmP3CuG2akjIJLRWC6zMMQ==
X-Received: by 2002:a17:906:9b52:b0:b3e:1400:6cab with SMTP id a640c23a62f3a-b3e140077cemr768626066b.17.1759242754466;
        Tue, 30 Sep 2025 07:32:34 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3dc2cf61dbsm499858466b.29.2025.09.30.07.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 07:32:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 16:32:19 +0200
Subject: [PATCH 1/6] arm64: dts: qcom: qcm6490-shift-otter: Fix sorting and
 indentation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-otter-further-bringup-v1-1-7fe66f653900@fairphone.com>
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
In-Reply-To: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759242752; l=1473;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=v6xz/ZGwlg/QGlKUsUnQN36bAJwH/12cvFwX4EAV52I=;
 b=i4zuAYPuetFXrwGGozmgWJMqu0/p6T19lPn9Mw22TYB9UCGPqRugYCz9/k18mXnwUbkTDkMGp
 /WXsZdhO6SYC/NFQ30eCPSEPTu8dCpDT+g2/wr3ktFUkmwsMCKeGG+V
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Alexander Martinz <amartinz@shiftphones.com>

Make sure the nodes are sorted correctly, and the indentation is
correct.

Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index eb8efba1b9dda422dd0295db2a52420a1a23d070..8d45e6ac0e445b9e20bb9c1520f804623c505653 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -857,7 +857,7 @@ &uart5 {
 &uart7 {
 	/delete-property/interrupts;
 	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
-			<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
+			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
 
 	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
 	pinctrl-names = "default", "sleep";
@@ -920,10 +920,6 @@ &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
-&usb_dp_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -950,6 +946,10 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
 &wifi {
 	qcom,calibration-variant = "SHIFTphone_8";
 

-- 
2.51.0


