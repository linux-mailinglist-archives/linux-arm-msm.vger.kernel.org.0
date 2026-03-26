Return-Path: <linux-arm-msm+bounces-100094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPb6IKUMxWkI6AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:38:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0143B3338CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BC71306B3BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA373E51DB;
	Thu, 26 Mar 2026 10:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tYr0AiiA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EDD3C8732
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520844; cv=none; b=m/2ov5skYyprU9qPr7rRUjXn6qIt5OPOiEhKARzQeSY+hpo2mFb2v8fRUtgP6EjLxc640tHi8CGpx7ZSEgXZcm8CPuuahmO/+mz7vlfBB7dm5ZsKLychuX2zsKViNbbdyRggCXqyekdPn6Kfvl4tJtCNy9F1q5X8Zj6mthYBZrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520844; c=relaxed/simple;
	bh=A1+PPN+ZOaz3K3/onvE9mBZ0QQ0QnXOga5ILQXc9ACI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VyUTtL0d/pJCJGNHWzKVG4d2wQSHQFx7FU/W0pyUju/6nzUMhM+SkP/63hEiBRz80QGxE5TGLSVV8DrHYq6camE6Sp7tNG6LeUEHms+I0grXB90k4fcJRiQwb6FW0xCji2UVirF6YiXpX39dNv5orACVnS2gSKUAbZYzejvon1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tYr0AiiA; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439fe4985efso587631f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520841; x=1775125641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XlEsJL64WOZVJt9wnraS3EcQnsaIsfnsMni1+t4/jZI=;
        b=tYr0AiiAZKRFLu9N+Nvnv9GW9lvbcia3lUKFaDpjFalDev4Q/K59JNcrzMu+OrTkP3
         oxrRaRUhMLfGFnARiged1SuZvsEhlhDnxhfBtVu3S3TxTfF4mUgwMmJauXd/Rrlcih8H
         DNmj27yluUZfPcXrzwe9QMI6Cj+BtP5jA7L2POQGu7sMnIVoleazRrnFH5shEEwLLuvh
         IRyytkKIK5ZDZxbQSd5aiAComxOPJwYZ/LlrChmSWTRZYJeptgTNtFYi8Vt/K+bAbJYR
         qzbdiTy2IhFQY8cUT33DxeToDtS4MqCyQhJ/bl2PXd+D6AZNGoyp235CTvZa5Qr+2fBv
         eHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520841; x=1775125641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XlEsJL64WOZVJt9wnraS3EcQnsaIsfnsMni1+t4/jZI=;
        b=dcf7H50tRk0rxPo0WovpA0VKkZPqVXL1vEJ86q7TibsbCAkoEWv0pNK5pFZahM3lt5
         UADSYUlJgrnMcoYw7ojMIW+bT37qbm22Q5rx46TYXr5YGU03s0/L6wTriO2JPQustDC2
         sAP6jxqVNVgp3+GqIVmCEMz4TCVAxG+4iFGa+8GHnqSLVRdUs80uP79902Cx1A4mdWWL
         VeCC/nhj0a4+KCCpMVsk4piFtQ9TfFAx7FcfpyV6TY/iUGlcyMFowmHr7IB6eUKodUmV
         DgbOwuDWeut9ZDkVVVJE6t/w0nZ8hQtH+lrWaUVONnCy1RNsUKhsB+/qIsudsOpDZEiM
         +5QQ==
X-Gm-Message-State: AOJu0YxzW9ZcDXc87s6Mts7ydfHyD28GYmh3zF1C95mHl7GpKacg+tw7
	t1RoY5HRBOG+kr3c6tpHmsfrboWoRDC4zSK/WElAer33GN0V7cX75KexxF+uS91XCzREmZ1Qp5e
	60jmZ
X-Gm-Gg: ATEYQzxJU3RP/hqOU9G8B0tTBeRLxxmJc0j9wSEg2GRmmjxwZZXL+LVwU9RYs8lfCJI
	zjRdk9y9OMoeY0njLews8VbzwSjk3LbxRCRYmB56PB9Y7DdS2FB1M0KL/QbNieFlipF39X8IOkT
	D7qmWP1ygmwwJgCeopxDKlCg07DyzwarMg472qTf9gm3f0H7w827JBpDFedfMf6THahW3slGh2p
	5ByuXvGOcW2fEFDkbg6sdz0k7WdnmPD4DsO197AyyIA+fBonT1oCNCsdexItws61SU+gutkgJkv
	GwcXvvjp/E4+cbwdqfQkZj9CN4M+X1mMoN9iNy7jFrNS2VpMluco+qxyfRutRPz0PNQZqshbnFi
	uZLCgjWL53HRjWhxI+VK3iyzsVQhmfD6JJVeN+Xcl2B5wGHvPt1AjKRUFYhVuuD92rQ5w1jBbG0
	bv2o5okcbClI2UtwdYSObA2Efp1fkxWeFQ2g==
X-Received: by 2002:a05:6000:1847:b0:43b:584b:96a8 with SMTP id ffacd0b85a97d-43b88a36584mr10856779f8f.47.1774520841044;
        Thu, 26 Mar 2026 03:27:21 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:20 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:46 +0000
Subject: [PATCH v3 09/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add l7b_2p8 voltage regulator for RGB camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-9-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=A1+PPN+ZOaz3K3/onvE9mBZ0QQ0QnXOga5ILQXc9ACI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQod+R7uaWXuxiweRyU2Rd9JoFv69ibQaTtFv
 HkpDxFtnC2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKHQAKCRAicTuzoY3I
 OgMCD/92DiRpNI4s2VZ2cfhRL93LMx+EOBSnKcro9fU8uac+fI4ym6wQZ0AhPYZMbD+2yL3XKWq
 qBB5zXw2WbKdNFk66YC5e8DxowZNEvz3G8GcBgqsQ34UE5oZb+x3ywSCrn1n1kCIgleajWS6Vu2
 82YBSIpP9nGL4ZGoQyeqy94WjYI1nXzTla1sxB+5htJH9VD1AqwHQF2BFGqj08EAZtv66mQ3AGv
 CPO1lIDpMaDO9DhL+X4aJhJneqpi3LvilTvAE4tmKiIyI7PrZeKD0Ll8RCdYYxnPkp2km6VRLEb
 MgYhM5HpY03+EQ6xrm0RJFFI0/chrU8HpxTCng2yPSNGvyoI6/pDX+tjzwYFp4IeuYNAaXlJxx7
 /yEGRo91WkR4qnzrb1gjWqx5HAO7z2LDfrdv7Ols2WUqjGjfsQV62WgoWwmhwH01Ms8EIVSgtWT
 s516KioKILjD+7Akfzm0jy5diYD6XfNDVVFEMnzCp4wNtuvPhBTjDHbVeakQpvWeD63wM2Y2TWh
 UblJ3MtQTUMlelp6zeLqUvS/FkEvj+qoi9q9Sug6PZDEsV/DKXTf1iZPJUBlaFVSEhEKVjcqRWB
 /tOtjZK4jKh9otmH9fr0qm9jBX56fji/cfOFADoqd9X+pScRluJC7/KxOh1xerpvstiTkRhejKI
 Yc7bUlSHgisYOMQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100094-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 0143B3338CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some sleuthing work by Aleksandrs Vinarskis in the bowels of the ACPI
tables for this part shows we need l7b_2p8 for the avdd supply.

Suggested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index f10dff1da7f8e..b09b6c87132e9 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -552,6 +552,13 @@ vreg_l2b_3p0: ldo2 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l7b_2p8: ldo7 {
+			regulator-name = "vreg_l7b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l8b_3p0: ldo8 {
 			regulator-name = "vreg_l8b_3p0";
 			regulator-min-microvolt = <3072000>;

-- 
2.52.0


