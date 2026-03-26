Return-Path: <linux-arm-msm+bounces-100093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHPaEQIOxWkI6AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:44:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7FD333A9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 978703088E81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275EC3E4C94;
	Thu, 26 Mar 2026 10:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ck2MbR+o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC54A3C2767
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520844; cv=none; b=ZK9bnzQWnnqBpY0bE83WJxG7nEHXYn+D4vrBMG7NRun23wRMQMPIOo6M+gv0BD+dGOWa/jMJAOet2ws6JtDGw12N0MJYicWR2t8kZqmMJDrE/r6WySPyI8ZfGPdn35+mYu+rVcJWjDXfZEh4cnX2QI1A+hdpkKHboPSCHTsuoXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520844; c=relaxed/simple;
	bh=OBKmCOYcz8QE5U8irX1KuYqE9atpmhfMPSWfgjZ3RMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GwILK4C4ZvG1N9WSJxEWeUu7XagRnVqM/g0TIsWSIJpvyqUQDSrfH0VqTA5zC5SQ0OxwV2Rq6DmWXv20IO6bkO57jWkeVrDvvzfr2bpgOlE8ii2DFnsvH3lkZOElkuK6YWkWLsxd1AMJCPgNgcVk2A3snAn8zpYJC/ZT/eOCAEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ck2MbR+o; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439d8df7620so540508f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520840; x=1775125640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2U9ZfzOl8dAf+aGpiM3Kfe8faOSXgQyyYf9gqfmYXo=;
        b=ck2MbR+oREKht+cT2xk7/mqJfHMBew+uXdgBivX5JoIx0reApeZFLf7SdyGBmVZY98
         wyJzeenyzf1RiWYCLvJN4t2RrwZy0MTWL1UX9bAXlc6Fe9TggoPyxErd5gTURnw+gcRD
         n/AxkJ0mJGtRv37bJoIGcKusk/YhU2QyPqbfNcYo0hlwLywzCsSQNoVOOsscvNvkop+V
         5KW+BVoZ4EkOj6R71QS4Upviu+hZapZohP7+UVinPX31UPuFdUwkdLcWo5GpN4Js8ACh
         72bdG4Ih8JPMD9QMnqcyAq3E5dy1B8zGmxkGIP3Rei3ANf6s5WRWSrgIM0WHmHb1SkWW
         OBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520840; x=1775125640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z2U9ZfzOl8dAf+aGpiM3Kfe8faOSXgQyyYf9gqfmYXo=;
        b=W600B4OZRxTtSMUXupnOMWDPh4nNZ3vqKz4/j93YdqcdYdqgDFPex0mvvLVadxEiv9
         4JS9Fz064zj4PwOhq1S5QFv0V0wlNQHtm4n5hsVG+ueQswSbb9wEFNXjTzrl3iYctAND
         aSYLF0unAzQMllhsqsMkk6XyDs7yYCywvV0Hh/xL7LWBIsVFe7Px8CM1s/spvAqQjMVZ
         t6dt0+hXf2kqr0LSfJlYJ0tlFPIMDGkl9LM59lElqmZGPYL/zRtyzw4tAAumvlNZYtqR
         xUokT6jpXMf++FYx6KjvbttWR9LQ71E6SWOga1Xo9gotMens7UtBT7AwvAqjYOdGtCCl
         Ab1Q==
X-Gm-Message-State: AOJu0YxZMpDaGM9+jdL1FoY56uwYho7sPpdc0hP7QIAMEWzQnJS9SVUL
	vX+h06KBU/QAzamWXL9+5YTfymXfIT3Gy6qGYeULF00Dr3xpBBd1qaxbWhRmcsMtq1o=
X-Gm-Gg: ATEYQzxB5gANg2+4vWQH3DHP4MXieNWZO0TeHc1WBwLWIEZH1AivI6FeABOkl46zDC2
	WG8XwrS6HK7YTJ+o7WZBUmpsUuyYWfQyN0YiukbPzmOXEEp2uNMzpJAhHCXDKW3HaUx/Qay/uAX
	UQo4ahKIOIbqWwFyvxZ7vjjCH7aGYB53ivtbt3fmzdOnEYJLthKGpvyomAwWN6sJ1prF4HLH7fP
	YfEy6dYQw6TJ9LzXhgkupht3Qm13n4Yt7bAne2T5J+RfbJ0dKdwtqxAxR8z6r8vyChPkWkATBh4
	tSVjdXrtVArUws+bD+2Hlzk2fIhy9nGTIC/PZt+9u6WJldTXfwSLPf9HiIy43aFT1Ov7uvm5sQM
	hFOKPI+tQ+FHQoz+bqzItcc7caDC4BuZi7mji/YMB4PGYU0VCNMnDBu+E2AiEGpY1feo+8KNlrc
	vBAt7gOXx5wCbKY5yERmYd3oqCZ/bRWOLz5Q==
X-Received: by 2002:a05:6000:2c08:b0:439:fd13:5c48 with SMTP id ffacd0b85a97d-43b889f5701mr10757525f8f.31.1774520839874;
        Thu, 26 Mar 2026 03:27:19 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:19 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:45 +0000
Subject: [PATCH v3 08/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-8-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2225;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=OBKmCOYcz8QE5U8irX1KuYqE9atpmhfMPSWfgjZ3RMc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQoc9Ov3/Wx1VhsZLMFlhP55eRCY2MI97EWJA
 hNpwpGRY3GJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKHAAKCRAicTuzoY3I
 OgBRD/9Zgqn5dJDotzB1xBcyxR8G6kzFRw0gc4AhShxrlSmMDsSf6+YpDHgguR5rya6uYyAAeMR
 NIio7xAa0CjJCBGKr30Qgjc1sS9ndbfforRZH6NzTDNy0gMDr7PEU8OSHR1Ep41Er0IiVkOif/7
 Zksah3iqGTPlAG1qkufOZzK9yke+JCuJ+Ze1Zvleqdg8sweNSYwjZWit8qQLjXRu90+A6D5VNmZ
 Bl3avuftn3Y8Rdv8Wf1V+ci17J+YwuQSiGDGSW4wF+ErTX8q+AhIDjDTWydwGQ+kIojHkhEVSOE
 RH93Q9X5ZVIWRSLqxtzTUYvWDFkTX7hLAVtCl2asOGUcqstDDp2Pj743kOkCnTVW3PpDuFRKnq4
 ueeVtuNjdNqVHlE2jFaSLlYdSC2a/65x6zFxRIz2JBA8/06MamqpuxoIHNGMWUeKrBD+lAVSM6O
 ePA0mA0x5TQ23GKEsHXhaJos0NHqBwwM5LE43PRnmgZoXqCo4EqbTfVhOjKz3/5ttWPZ5XyjrgN
 y6+MdlE0NHB8bGYR9hyyw6l5NTOy89h2z6aTJchPlmL+Hg5xRKhOFqke3cMSufgKUdnBC6Vzj4H
 cHo+ceqCfHrhXf9GjN4iviMEk1mkncVxj4BjgRtUzqsiFfuDfhI6urKH7I3wNnzTzV8t+or39jL
 tZcclvGxyCmPaUg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100093-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: DC7FD333A9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add voltage regulators-8 for Camera on slim7x including:

- vreg_l1m_1p2
- vreg_l3m_1p8

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index d6472e5a3f9fa..f10dff1da7f8e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -795,6 +795,57 @@ vreg_l3j_0p8: ldo3 {
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
 };
 
 &gpu {

-- 
2.52.0


