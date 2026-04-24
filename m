Return-Path: <linux-arm-msm+bounces-104406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Fn8IEA062lfJwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:13:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8863D45BF89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C87730718F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C8C361DCB;
	Fri, 24 Apr 2026 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uIQY71HE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95391374160
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021694; cv=none; b=U7mS8rouaMrXfnWht2OAvdP/qsR11ykf67PG2YUq+ZuVjjiMo9boXUJhrdLjiHaIeF860j15kJcjQRr7HpMwzmJm1zOwe/L11VwVIHqNv0SB7eq4KlkSL+2gNEMM4pvVzxIsq0wtdAiuOShjCTEGc3wMsWJwimMJfkrtcTWU0Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021694; c=relaxed/simple;
	bh=cjheP4H0PwmMUZGzXHCF/PwWHjhyTfpHFF0F+eUTSpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WzoxVWe3LzcYGYuRQkucSuQ/ePQuvG1ET/eGxVitqApCv2zbLbPMgrRlfX4WDUtx70x18CpBVJlg3PePhbufGkCV9WC7VB9XRUbwO9Q1bZ1NuVm8/dVAKnr9Mo2yAfHeejFXoTxCFPwfOVO4LLbch6xmZn/V84rnSpcyIimvjDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uIQY71HE; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso103832855e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777021687; x=1777626487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cvEvBA/4PYjw500G7t1DTztuhJdzXFRKOSaHuj0ipo=;
        b=uIQY71HEAKnzyqB1bupYFuwpHp+IqHEkPpacj1sNrGcEW7R7g1KsYKh7i1zaW/v4y/
         aRKZK+zdku/v2ysF8tS+mOgE+m8ZwJpdNVEDW/hpJ31W0x0ardyytJXXvgPXIJ0pHkRI
         y9WbgGJ5zrt5Iv4xeLrMxfnBBlLAQSSCTcKNFbpTEFUR5ECSyjfJ+IRJtr1P5B5q2uIk
         ygJ6CRI8PvCZBYNViWWjXoWcT34bzhGJWzHuMt+1uegNEX9dRKhG6aR9DRh2xnSnYL8x
         IS0pijxyX88rwikCXmnY3KYNktBR1Sm/BLiva/YH9HULOt5xgOSAsZvQU6y/tooStyvR
         xl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021687; x=1777626487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1cvEvBA/4PYjw500G7t1DTztuhJdzXFRKOSaHuj0ipo=;
        b=avODXb3tcMmAgDXb/Qnhn677p5yHx4jlXbZ3fkLk1bspEQH3hg8bGtPMmaiNnb2hYZ
         O0XNPhDkn4vhmG+qI2SC3JfA9XTEdLSMg1V7CzdTfVzlJySkvWd8Zx3WixTd/UJfZqMJ
         XPV4nZdg/PPqF4C9WYsZI0x52Iiz5CFcE9Body2wGZpwVvtZmy7FyjIcv2fATQFewnZ+
         deFacEv9GxMFJIjUsUsbmicl3HGFUGgqRgpqAM4IYx+gUg+SDDrhCPazTPknKU+Kb6Nx
         OuMW6tPlZjO8vL2fvs6qODweKzDrzggBl8NW6UVuTNX66sivfaf8wV0SLCjO6zL9ZnR3
         gqXw==
X-Gm-Message-State: AOJu0YwrDica/qAhvoEYIOtOtTpL1ppoO5stt74/7h4VaWuIwum9NpHM
	pOvpHCyCAQW7XwCdyAtOf/x7U0gsI30CvkP62WyYpP9MrCkCyw8zZ1mdOkHPL0ufG44=
X-Gm-Gg: AeBDieuB7obHT8X9ex/ueWBueb/oMjSbvK1qR+iggGPr7ZL6tvUKY4ZoHyUdcfhZsHp
	/sOkq1LOgDb51uZO8q98uFARGmfC05t4P0qTzYh4bU8wco2cO5nb/q+obKXaTJrXTxDYdn0FwUD
	yO6z56lh/FwyTaX/LE9P6MK9qTYe+BepnHKzQPd9vgOFWFp8HJz5YGR2VLRsP+Bnzmr94S0fsNa
	STmbZgGJs//jltuyoMoQ2a0tp1ajMeYnJ16tOXaAd2TLiToyN1RlVVsMX17kyHhd49jRGOiSZ9z
	SPRcZPx34Yr+BHyrF5097JUsPaP/artxgfxwM2S5KkIuIjzVSucZbfCiFlc7Mt+pvRZCNgCR7Et
	gtOl5lu/Kks6n4DHDEZj3LXhUsDsuuAhSNWK/E2X7vqB/FsFWXtt8E0hLR4DD2Fy4W5kos3Ish6
	dC62MwDfQuMwpMcS2Jc9imvKF+0gVK0ILe2y32NIM61wndjfxK4FF1Qyk=
X-Received: by 2002:a05:600d:8447:b0:489:1ff5:edda with SMTP id 5b1f17b1804b1-4891ff5efe1mr218788105e9.6.1777021686901;
        Fri, 24 Apr 2026 02:08:06 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm537222545e9.11.2026.04.24.02.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:08:06 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Apr 2026 11:08:00 +0200
Subject: [PATCH 6/6] arm64: dts: qcom: sm8650: Add missing CX power domain
 to GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-6-4b6e09d532ce@linaro.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=970;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cjheP4H0PwmMUZGzXHCF/PwWHjhyTfpHFF0F+eUTSpI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp6zLvNnJdZU5ZlYNnUi0u1g2pFQCN62UQfj6XSqYM
 Id9mGZOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaesy7wAKCRB33NvayMhJ0Rj7EA
 CAcsyGSldN2J0xl88Vcgleo/lbKWR1Es8VCnpI7KMVoLb6cdNgLmyqsB7NXnbIZ/Z93aLcAd+sNDgC
 2Crd0I7zxhjdI16bbLlfBGI0aiqhoXIu97na2H3zgKZzyCv2p7t/RWQfNKBw/Lx/pScpFPJPTX4NJx
 eiSbwl5fFzNAY3At+RXuKX1G+IN2/M04537m6gGjdWwEs13OmzZRwd2E5wDzp5Ay22Ew9v+PbudBV3
 rx8BFyIQakWkCqy5lASkv/RotXy5nS1Zh/RNf2yfNe8Fs8q7Eh6hS43n4/+WbyCxxb5za9YasNPAg8
 1ZHd5WZkn2Q7t8OMqFo/vvpY/yCLXBLj0BhmOoCM0d5vW/AaU/b0GycPjZMtQoYb+RR4p9E72eB1YH
 BQIN9+gs7KYGN652Eewy3APavYyMgwk5oYcv2QKF9CKfm1ELgbqOuqyasrtErxZE2mpoobKabR8e+g
 kVGbwaNQPwv8BHtvQq7QHaHRsBFhfKXcz1Bcb03yv3pq5gx/Ylh2mfB9n9hRmke151L/15Eh5szKUb
 igW/TcyhPCi8IkzUFlSp0zxMg6iv2fX73Ea4Ex0gveJ1SkzdIQiW7Yz3WgXA6kdHdjb38sHeFSjjpF
 8WTjyT1O+p4q37fUv7NQEJx2+nzvtCoVIs3U5EfGAGnB2MFXNxqer23hWb7w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 8863D45BF89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104406-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.1.134.160:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]

Unless CX is declared as the power-domain of GCC, votes (power and
performance) on the GDSCs it provides will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..adfb737afefe 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -1963,6 +1963,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1


