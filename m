Return-Path: <linux-arm-msm+bounces-59192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43133AC1FAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 11:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FDC07A2BFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 09:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5EAB1C5D7B;
	Fri, 23 May 2025 09:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tahc5Wqo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15C2224242
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 09:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747992202; cv=none; b=Tdi6455FR1dLTtdK35mcl9HzO24GqtffzMP60xWczAVIyTTTOLonNNq6clhj/ApoD4LJ+sp3VbRbyZxGkvy8oRWiL1XH65D4PsHgKGm9A++WgohssB9+GujJWc/uFClxAX22HEd0HxlxovDvLA+aXfhAiE020/eP8rBM55XrK9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747992202; c=relaxed/simple;
	bh=XV5QgUTBjjCaabXf5Gk4PbSR/cXXofci/Q3D/+uopV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TkRNJ3BqdmcMjX2A+KKOAGjkGXSOs6036QivBMs0FvxM9/yoQdAUjNTXZ2IWNLcgEtwS/iaPL6R8nB+OXnnjCEv3GhlhdEaPI4kTmQ/UEpKimLJvbvzAHFOEX9C60NBW/EFB6+/w4VnHoJt9t0uSXzB6zxKnCfQ+8/WHy4lBGd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tahc5Wqo; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-550ed4a6374so1039358e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 02:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747992199; x=1748596999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVNvqzNDRM4iOeWFWzPDRj2DrvmnE6bu+I8ugM04R6g=;
        b=Tahc5WqoNgBXF3iUlOunc8EuSsHNFUNJqcos3iY7GRLAGAkg9S/ETVtqlBl3yJz134
         6xmMt/d/Db0O6yr+cvb9Vnx8CMcS7O4p7qSCYnbixXezWpHKIMi3YVN2B1udNp9Deyo0
         RqLEWmGgQ7EpAVmP0vJliMmX1dih5crfPaSLQEjBa0P4jzHGm+kZEh7wjRGq/8rLN6br
         Lou/QWSOiIJoCnwl4g7Q2j28dAsgdNgXe9UR9zD20Xt3aJrMhASzry9nZ7DWF6C0luwF
         vmSVLaGWXQ24LIiLsAYztv6a0YuaZSl49Iggz8YejNIKVgJtkHZEXIuvvoc3ojEBHwXD
         gSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747992199; x=1748596999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVNvqzNDRM4iOeWFWzPDRj2DrvmnE6bu+I8ugM04R6g=;
        b=EpdbSKfOwiYpWJBoYjWNRgvGksKyrD1AjD8DNUesQqg5woofYDGyQV5DpSRB6RuiDk
         fmL5hYTMN+ADP9+5q6XwaWum7ZcXU1ayWAhMM20j0CrPoK7vRsDOa+HEGjw8lbG7klO1
         xb422aSxzylC7M5mghgdikFft8U8QDitv5txR+uwtAVV97y7IUps4FFG64QImDXe7jtX
         hVkfbh5v2781QXSQ0dP4GZOBvXwlVtMJxkR+MPdPAiSkmSsTHBg9nDZYSAwf5SKrnQFN
         xY2N8D0ipSxh2he/mp8umW3aiB8QkQg74cOr33EfanXj2G1Azp0YGpOYCynwtE44rang
         HlHQ==
X-Gm-Message-State: AOJu0YxwFrBGP4uiWg098DPpUc51a0VatOXO53k0/b8u1PcP31PbNKI1
	swlripmVKOvYXfV3JnPfYR4sV57i3SgzIFWwX4vbC3Yu4zhjbADFMzCEPqZJMBfPiGU//o75UVc
	F7F3w
X-Gm-Gg: ASbGncvFNIs2HgrUB7pCraLfGYkkwX+ELB6bG92A/bZcVV/6ly/vumWDx/KknOOrCxy
	5++MyOuzplxtt09o9u9leYsjJ1WvQ5tzaTFnEl+HLPNUXh/HmXrhDlt+1abc7eVX1DUv0/pFEjE
	ZZghBihCkmizcR0D5sjH6Przub++wUlzdE3CvmGDC7PzpC2PBW8ITe7XH0hDvUZF9m9GRqPzlNF
	dXxOCGeqiGqdKLrj0HxxyU1oolAWXOuZ8d+HL6S8L6edjwX77xmvk8FFVhAkI2i6eosFdvHYs5p
	/222U4f67FSArmU+QODvUDkkXmJYcOIP5Ae07WYGPs8ppv0pzB8dEP3ITXsW94ZsxRDuC0f4ymH
	qx/q1Pac1DPGzCZyYoNhwL2kG72zMpX5lMH+UOaR/
X-Google-Smtp-Source: AGHT+IHtARSYZOYllV2N93GB5w8SmaiIgWAl+qZ3xuUPxiHEDse7s8CrC4EJRY0GcIs9HUYVK02Znw==
X-Received: by 2002:a05:6512:31cb:b0:54a:f6e8:85c3 with SMTP id 2adb3069b0e04-552179fce10mr159980e87.4.1747992198810;
        Fri, 23 May 2025 02:23:18 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f15d9dsm3779228e87.38.2025.05.23.02.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:23:18 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sm8250: enable camcc clock controller by default
Date: Fri, 23 May 2025 12:23:12 +0300
Message-ID: <20250523092313.2625421-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable camera clock controller on all Qualcomm SM8250 derived boards
by default due to the established agreement of having all clock
controllers enabled.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f0d18fd37aaf..a6f9b78c5226 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4653,7 +4653,6 @@ camcc: clock-controller@ad00000 {
 			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
 			power-domains = <&rpmhpd RPMHPD_MMCX>;
 			required-opps = <&rpmhpd_opp_low_svs>;
-			status = "disabled";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.45.2


