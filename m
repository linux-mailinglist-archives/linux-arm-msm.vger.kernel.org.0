Return-Path: <linux-arm-msm+bounces-34630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9129A13B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 22:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FE5A1C220DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 20:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB7C216A31;
	Wed, 16 Oct 2024 20:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mq91vJy3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119DF2141D9;
	Wed, 16 Oct 2024 20:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729110182; cv=none; b=T43e/4K/sDflFj6br1nmyKyKOyJgFv4n0GvfcHyYE8TZ4/04QYH5xOUyd+Qb3fPNG38YvNMdWLAYZLwDlwuykFE0oo5MJbYssNwgV0SjE3fBYLAA3O8fEfQR/OyLgCEgO+xyibJ2nw1jXREQAR243BNS7wackbdLaLmIP3AaFfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729110182; c=relaxed/simple;
	bh=Tm2Za2GFwBDd/rJwNv+GDFqn9OUyxgGWWmwTErJ/tnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SMNf7ybn6YUTJLUJxsgX6umMNjKT9V773Zh3a9yUJiMrW2Q8SZrXU2nnUHqz87K5LunagH2sCJovzaP0LXI1HMMMdMmBjDwXOKSjWPoVIkAeQFgkFK1xS1XvDdoJKzlT/YcZjeI5lsEYZ6OcXcL/8M/LPv8SMW0X4z4W+B6fjqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mq91vJy3; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so2422395e9.1;
        Wed, 16 Oct 2024 13:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729110179; x=1729714979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1rJtovV9sSTaUZHyJvF9H/cSrHfxrTlX/G5gzgaREM=;
        b=Mq91vJy3ixyGg86gJYbe4iPSD/mgSznX49/YQ2cDcwJhfB2ETci8xJLJbnZhdeFfy2
         qMio1xf3MW6gK0wgU5Y0soYxr8gIl+4Af5YU1EOoyuREjkFQx0XXkB2hAAD+lNma1Sua
         JHLGAFF3IB+tGADzVx6bj1FKYVdjzNUi9TXDLEpttTSINwiW2/pKvQ0zxS5F/gClpGKC
         0+9ZlWcDtSOQRuA3Bo36IX0GB+Z5PBeCiEGLznUztjHM/og9shYMU8WVmpi7pJR++3Mu
         vAYk2pXimslhlE9WFrggm9hYyIV1TnlUh+MXB1Fy+WOMSEqRmoLjgzz9t4VckcZIBuhU
         Z+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729110179; x=1729714979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1rJtovV9sSTaUZHyJvF9H/cSrHfxrTlX/G5gzgaREM=;
        b=CcRDSAa8hAxYOjVwpp6VbonlWz0lt5bCIY4wFyQMuhODPNjTZlOkG35lg6JuVY6hfH
         d1MR2lmnix06BOEKe0gNA9bK6U/GlkHwU+A7kHySq0g4CJsR5UNoHRTLAvCytcoPlxk+
         GyHLuy8MZgPb5kGECkppGzAdjxikFYRnLgfc+T4h75+Eey8yqMh9pR0Xnrzp1pv6PtwY
         FixSgfaTZqaIbsWWvf9eAuZpFsBiig7cQ9hRAgPL++gShV2io4RQzDeFDFnbVroZqExd
         HIZwXE4It4obv2H/WhF5bcdN29FArUlIBTR0vbFTLThtqGjbcCNv26jib6VKRc++3fSE
         V7jA==
X-Forwarded-Encrypted: i=1; AJvYcCVmCWgqtZH6IYu/YnqfwvE/1bmxojc/EI/o/gU240zh5dtb4OZaeyCE4e3mPlqqrjNgg/CS9KI+Va7u@vger.kernel.org, AJvYcCXNSdWRG493SbjkZ87eiMpsjhQE5NMg1Y9N6vQ9RLMMcLuqz/1wv54co/rwBKV6wnJuTWpHwdaHF0Y07AwA@vger.kernel.org, AJvYcCXlgy6jlfjBRxJPky/LYPdzMAztIPFBKvkDp4hSaHX1wLkkWo+1+G3uhB6kN62zkra5txY/I7X+xVOM4RbRWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlxgHXK1k2XCBUQhZTs0zdfLLiy5SUnpZgK27QU4BMVDqn3Rol
	kdZJdLVMXTrcN8ahiqUrsz7UtSb0klBQhvGYRv7sVYAkw08mkmo=
X-Google-Smtp-Source: AGHT+IG+pf5frP8Sl2tjASAeO6ILo4iCE9o/Nf3pK3nMS1Xjc8/C4xAmEgIxXrUfpb21aS6X+blCdg==
X-Received: by 2002:a05:600c:450c:b0:430:5654:45d0 with SMTP id 5b1f17b1804b1-4314a2cc434mr42695715e9.14.1729110178918;
        Wed, 16 Oct 2024 13:22:58 -0700 (PDT)
Received: from localhost.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c55a87sm3942125e9.35.2024.10.16.13.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 13:22:58 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan.Kemp@dell.com,
	tudor.laurentiu.oss@gmail.com,
	tephan.gerhold@linaro.org,
	johan+linaro@kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 1/2] arm64: dts: qcom: x1e80100-dell-xps13-9345: route edp-panel enable gpio
Date: Wed, 16 Oct 2024 22:15:48 +0200
Message-ID: <20241016202253.9677-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016202253.9677-1-alex.vinarskis@gmail.com>
References: <20241016202253.9677-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tlmm 74 was experimentally found to be panel enable pin, which shall be
high for panel (both low-res IPS, OLED) to work. Define it as such.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 .../arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 6f78b61f8da3..93d90209060c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -560,10 +560,13 @@ &mdss_dp3 {
 
 	aux-bus {
 		panel {
-			/* 1920x1200 IPS panel is SHP1593, PNP09FF compatible */
 			compatible = "edp-panel";
+			enable-gpios = <&tlmm 74 GPIO_ACTIVE_HIGH>;
 			power-supply = <&vreg_edp_3p3>;
 
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
 			port {
 				edp_panel_in: endpoint {
 					remote-endpoint = <&mdss_dp3_out>;
@@ -677,6 +680,13 @@ cam_indicator_en: cam-indicator-en-state {
 		bias-disable;
 	};
 
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio74";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";
-- 
2.45.2


