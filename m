Return-Path: <linux-arm-msm+bounces-100303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id g+3SAQGCxmkhLQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:11:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3104A344D5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A91E305E9E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575A03E929A;
	Fri, 27 Mar 2026 13:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rImuipt0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232463E717B;
	Fri, 27 Mar 2026 13:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616830; cv=none; b=rfc58uVufoDZgPKIqUNW1W9zKm/Mc1K/65nwSaSoFFBihBz3R4S054yvCT5OV0iyWAgu9cx1ly/VWAVfgep+1Se2s4tLegSGRn9x6yiJfn/JM1zsDT08l84RSCVDGoz1NvdlTFRVtc4r2Sirbrq4lTCgqILFQw3blQQ3J/CCofQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616830; c=relaxed/simple;
	bh=To8Qup3MXF6u7fIYte72oP+NECphIimOxx4PV03mpZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8kBCnf84SdaccHvj9tjgGVF320wh+WRtYgwmjma09N5zoKrmbDW0kjWCQDQ9gWAEEBUGpDlj4lgXpgOfohnmP3IXzQKA/8qiLnMsCt1hiKnvzf3cUyiaSoWyAyoAMQyyJdIhBlDOTdIfzUkR3J3Ezbvr/B8usTgTWwySWHXS30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rImuipt0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BEBBFC2BC87;
	Fri, 27 Mar 2026 13:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774616829;
	bh=To8Qup3MXF6u7fIYte72oP+NECphIimOxx4PV03mpZA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rImuipt002pwIfwOaIkXOp1zEJ1STqNeHSJm/JPgQbHJ1r+mjFBB4BScUtYN4e+52
	 Ssxt+KwFIupvmmyfffhQgpErRLgWhE8Kpjco2fDV6qSwsZkFJYRtcq4CdLH094W2dz
	 yfK0vCU1LSBv+YCl0cJtBMX0QS2Mlm5yot9snb3WWnRk2kH/P3FojcRQmWFpEt3/M+
	 TTb7tqvG8IEF9keZ+WFkDUWgA6xMMwPzQePl6S3EJSWjTpQlFNMVLGbgQ8T6uB9DbG
	 5TgNLcioqndTxhC+EYxEk3v31Mlqgei5rTZBO+5hn20rXPP2pojiH7WIyKXKXxyq6W
	 3BAFn2ukxYDKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA88810ED674;
	Fri, 27 Mar 2026 13:07:09 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 27 Mar 2026 14:07:08 +0100
Subject: [PATCH RFC 1/2] arm64: dts: qcom: sdm845-google: Describe Wi-Fi/BT
 properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-wcn3990-pwrctl-sdm845-v1-1-3f5c34e3fdd0@ixit.cz>
References: <20260327-wcn3990-pwrctl-sdm845-v1-0-3f5c34e3fdd0@ixit.cz>
In-Reply-To: <20260327-wcn3990-pwrctl-sdm845-v1-0-3f5c34e3fdd0@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Sajna <sajattack@postmarketos.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2285; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ZdsZlqRm3/oxciwUtKAmARcIeJyJp34l/WYfXSWVTDk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpxoD8X3UHY8pX88+zhKXwHwfDLK4KyevZawF/N
 WB8LSP1NLOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCacaA/AAKCRBgAj/E00kg
 cql4D/0fFQTGC79+QPPPwY4Zs53+E9cFblgQy0wmQmkicMTkYG5vExKjTaarCUaglJ/Xfjw/1jM
 N6rkezDgcASHcKi+9OWujRB8An1lZzyRORGc4UOhYiM1p0nAI/mavcu24SLQfub6SfEjHVx0VVd
 9HxISKgtDUMeLwEmv9gt+WqXNs85ILPrEdedgpGnwjTTdLRM30z2hDLEvF7yZvtM4rpd+cRDHZu
 PXAcwNCmbO4IDr8CiqjMhdTq3M2gVEJJvhJQvC+LUsHWXesQ/aaUIzWfEHLmVeWrSYMt62rhFlN
 6TZhXQR/AgswhvTkqida71CU93U36v9uLyYQdvZLq3+icerOwBx8Em/5Bbw1QLJizJqDGeb6Wyo
 FoXONlDEhUoUD3CEHJkwUFH7F3lRqTlJXU9ZIJILAoT+EuquxsEG3SvdN90h5GuxYfernAewprc
 fxzuVxSE+w3+BL6W6VVMstOdoQv8LiE5w7QD0wy3NK6wQwakqtyL1LSnlMje6at1Cf0Ix+d0TFm
 Otlh6DU8KTmLTBJf5jkDiwiKtZFUlBzkDkjf6M/FSMWsN885ctAKi0tLAjqOveYBwbTg2HC/V1F
 caIHO8iZhViJvg41o8F8+K42VrhWLx9Lgx4nlFt2ZMh3ADBXRGP/4hNbxjzo3hfQk+dg/TCJ26+
 MX3RxiMjtBWhL3A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100303-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: 3104A344D5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

The onboard Wi-Fi / BT device, WCN3990, has a simple on-chip PMU, which
further spreads generated voltage. Describe the PMU in the device tree
and rewire Bluetooth and Wi-Fi supply properties to use the PMU LDO
outputs instead of referencing the SoC regulators directly.

Couldn't verify the swctrl GPIO thus omitted.

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 42 ++++++++++++++++++----
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index fd9788d5c3f54..6930066857768 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -131,6 +131,33 @@ vreg_s4a_1p8: regulator-vreg-s4a-1p8 {
 
 		vin-supply = <&vph_pwr>;
 	};
+
+	wcn3990-pmu {
+		compatible = "qcom,wcn3990-pmu";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p3>;
+
+		regulators {
+			vreg_pmu_io: ldo0 {
+				regulator-name = "vreg_pmu_io";
+			};
+
+			vreg_pmu_xo: ldo1 {
+				regulator-name = "vreg_pmu_xo";
+			};
+
+			vreg_pmu_rf: ldo2 {
+				regulator-name = "vreg_pmu_rf";
+			};
+
+			vreg_pmu_ch0: ldo3 {
+				regulator-name = "vreg_pmu_ch0";
+			};
+		};
+	};
 };
 
 &adsp_pas {
@@ -462,10 +489,11 @@ &uart6 {
 	bluetooth {
 		compatible = "qcom,wcn3990-bt";
 
-		vddio-supply = <&vreg_s4a_1p8>;
-		vddxo-supply = <&vreg_l7a_1p8>;
-		vddrf-supply = <&vreg_l17a_1p3>;
-		vddch0-supply = <&vreg_l25a_3p3>;
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
+
 		max-speed = <3200000>;
 	};
 };
@@ -526,9 +554,9 @@ &venus {
 
 &wifi {
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
-	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
-	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
-	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
 
 	qcom,snoc-host-cap-8bit-quirk;
 

-- 
2.53.0



