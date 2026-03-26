Return-Path: <linux-arm-msm+bounces-100092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHzqG/4NxWkI6AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:44:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C93C4333A93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7738831403BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6C83E4C67;
	Thu, 26 Mar 2026 10:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DjrO1R/F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4307D3C7DEE
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520843; cv=none; b=VsRQKoSdMCXRCGcIDq0J4xUmoGjtzJDPdcTu5RPAWoMhwJ4qR4hvxvCKRcJe/W+0C+6KlDzTNEEjJCxVA0Jv3usYQLchWtWi8bKVpMPnkC2Ga7wXtlxLAOZAPfV+0057qlaWO+vSZpVh68hdxA6WMhryPVyIzh4V/m+Pu0/RWq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520843; c=relaxed/simple;
	bh=BLleNWxonxV9tOc0LMwQUQMx91HyaoyTOdZPoCkkiUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ls2zqGPfIIeO8vHfnsBULPCN4ZbbMHW02iQziWBiRJGyfKhv/qvQYW0nyo3VKIoHJucyX+NFGb7SeoyQoaSZEx+JzhgUoUaHRq8p4rr7fn9obpcX5AVs8fyYJlQnCmJzVf0gA7xKhIMrjy7Vv4EuXCOuE4YgRpK+U4McM/DzPvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DjrO1R/F; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b94a19fdso724206f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520838; x=1775125638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhZXtN5FXNWuWH7Q+3Ir4ViwJXN59VSLO5iJaxwXVMc=;
        b=DjrO1R/FZKrbyNTpH9tUOr8PiCWJ4UoIEVzX77xR7cDK0Rqe6Tr08xaKkjycQv4ikW
         NmHLNZBW7ykSlrHIch4yNiAMAEJRef+zjDctvE4f6EfntTE1tjtxFMLnoYzqO2bQ2+9X
         8eycGPAFR7vmrx7fN/bYbQNEvalhlJDqK6q+hBS9FWkfM/H9e6hiHvknkTj8C63P0TvX
         CoOoD+rqRiGqK5+NEQaa9NsslMUdKCRIGi+WJYuvSAoM9GE83zD0XKpo/WnytdIsn5xX
         PuMxBunh5350JHO/nmskhQyCjnY4YDskXpjaF9FYQROc5KvzOeTxg8g3kutKfCGaiRCO
         4BMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520838; x=1775125638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qhZXtN5FXNWuWH7Q+3Ir4ViwJXN59VSLO5iJaxwXVMc=;
        b=ZgEh8mNy+vBLXyJ70JFmokga8n0m0Cgq27oNzq/FAU7uKvgjVZAYzzzZLJPt0zfhJi
         aRkER8hM+VJgt0EpFC4zuRhGYVwNr2tfqTzDGdlYRSbHcNwWnxzuYJ8WkjLU0dA9wL8D
         NaZ7eMjHIAaCIM+A0Q8JR6wtjl9zOPd885lkZq7Jcw0o/tcmtAJ0sSNrXgeh0+Sm9P10
         0cjaD5/SMPNebIhw0r4pbody7kcfkJ5pGCqu0V7cLbW5YfgHsI+xr4wwjs/R3RluKb1p
         PrmvE8cdCc3hQ1H+j3WhUbbRW4uBVjyeYEzQ01w/0zKiL62+fL0C8JEH1bXaV9/AUiLY
         GJkA==
X-Gm-Message-State: AOJu0YxOhJPat2BJkdiy37dZJiFlO2zYt/YpshhIiXSXq/eWSl8Qsq7b
	8QAmhx1EoFcxtVwG204xi05pSJBx5EmxluJ+EeHknKsIRtFpXLALaUvX3k4uCLnjVeA=
X-Gm-Gg: ATEYQzz16fMQJUMpB9ww+e7zmL3Ic/ZfyS2dPNTrynSiXuqVKoMaLQWOqkS2OwSXagW
	AubuzjI8/r2IDXWKj8rnR3Hp91Z7RV4yqm9u6cQZ9we2PxCuBA4lfTjyUVIOX1xe6/OKK2a+IKI
	AxzMXJLjavhPzYSwcgVhlZUlVAlI622DfoNlmf8QntGCzRWZdjhw/Ggbfly5Anwh7DhceDOY1F7
	F2uxvWlT0aZ4F3tdln/FG76gJDDJviju+yZ0MWG+Aysz0k69UCL1mP+53IQugC39zjomcmgSXo4
	Opd0xjL8ws0rx2czgesTMu2ziVKApAmhTRUo876WimP8FuH24D4BjBbq3axBeHdUwD7edtkUZJP
	tOFwoN7htPR1qyYQT85KMizxZIIMjhRvLfrAI8XQNRrgA0OBjU9yHf3W2RmwvxFDUYifJGVZ3ad
	g4NNb5oNsuaP7IjsmAzHh3Vqv7CcFL91fdgQ==
X-Received: by 2002:a05:6000:4212:b0:439:c1f4:302a with SMTP id ffacd0b85a97d-43b8899543emr10349624f8f.11.1774520837589;
        Thu, 26 Mar 2026 03:27:17 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:17 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:43 +0000
Subject: [PATCH v3 06/11] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-6-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2810;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=BLleNWxonxV9tOc0LMwQUQMx91HyaoyTOdZPoCkkiUo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQockTcY5AFlpZIr3CssEoDhJCV80C6IkkVqY
 T9YGmvD1xOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKHAAKCRAicTuzoY3I
 OlwXD/9/yvkiee70v2xxqnsU1bIR6fP7i9LUTuldmVE2GNwwNhSxro6MiXKgrnL10x6m3i/cctb
 f/f28AB9YjWO9vXM32+Obd16nD0Yle0kXARbwcch+Fj/683fG6M52chInLXszl/77nussSIDPcg
 8Ys02+mOBMM7e6cH2jsK5PcSESiPkr6rejlGJRR2fylvh1Qwpw89UVXNxLtbDcuSxnaZINsEb8O
 W30EcdsJlclA+PSkw+Y8ICzlyq95KKAnZ6FA3cbluhf26OQpu0UqdHB9A6RJUFRACoiipunok06
 ORalaz5nMaKGQqZL47GQAKf7pNK5lIt1ZZPNmKkhfjbKZZw+PjIkthDEznVVvoidXpTmQIOdqvc
 1/A7WM0Vs92yc/1NQMiOvt2psSZLLpuGzWuZRCZjyR/6wXRNUVT9naviS2KE61uyLHUdsrZ4CPX
 yHZ3TZKp9/miGkRXKLkwtyEtPnYY9VZyvkTaZNCAbOiO1GD9nPcw07ZiPqgE03AObB/03iT3eRI
 VrkeApSNoM6i7AM9Xx2wvs0af2QBass5GW5UKDMohnFRKXrKiePwp/z7sRKR5+dT70h8oOKe58P
 AjrYTwYrx7b+c0UxyBxYZz1CEWLJ6cDOotnXQ1BKLYLp1xslPkkeiaGKsoip7FyeI3+d2mhb2pC
 HSLDT19WgmPkbyw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100092-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C93C4333A93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the PM8010 PMIC providing the following voltage rails:

vreg_l1m_r @ 1v2 IR sensor
vreg_l2m_r @ 1v2 RGB sensor
vreg_l3m_r @ 1v8 IR sensor
vreg_l4m_r @ 1v8 RGB sensor
vreg_l5m_r @ 2v8 IR sensor
vreg_l7m_r @ 2v8 RGB sensor

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 4d7fd51f370b7..ee49785c9d005 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -562,6 +562,13 @@ vreg_l6b_1p8: ldo6 {
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
@@ -805,6 +812,58 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l1m_1p2: ldo1 {
+			regulator-name = "vreg_l1m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p2: ldo2 {
+			regulator-name = "vreg_l2m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_2p8: ldo5 {
+			regulator-name = "vreg_l5m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
 };
 
 &gpu {

-- 
2.52.0


