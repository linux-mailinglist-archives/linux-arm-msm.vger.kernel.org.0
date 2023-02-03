Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85C7268986B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 13:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbjBCMVb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 07:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232315AbjBCMVa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 07:21:30 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885AD9DEC6
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 04:21:28 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 24E33345FA;
        Fri,  3 Feb 2023 12:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1675426887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=Kws4om6oBsVKE4tQBTnA2CxmicCJ9sBKKIg8whkmh4Y=;
        b=wX+zaYfaS04jeUVL0Lv99+dLirAU1tjxNPv/QPls/q6l7o6kKps2QD+O0kcS2KQFHqjmLl
        48oOKapwHPQXXyWG0T7MHkrceLHu/DqjXWMrZPbTDsJSQDPbtgAF0THbMG1jp73klMVVxb
        HLBHUU9wCuTh6aJKNfrBq61mMD1Qcxc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1675426887;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=Kws4om6oBsVKE4tQBTnA2CxmicCJ9sBKKIg8whkmh4Y=;
        b=Ann7z6/EWl6Wd75gqEVrnUAPbsrR1jXlEnCdy3SfZBaRoiBhbhjYJhb41D3sVfPDSWMl8Y
        mAmyuvTRWbWKEvCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B268E1358A;
        Fri,  3 Feb 2023 12:21:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id aq7AKEb83GPsZAAAMHmgww
        (envelope-from <pvorel@suse.cz>); Fri, 03 Feb 2023 12:21:26 +0000
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Jamie Douglass <jamiemdouglass@gmail.com>
Subject: [RFC PATCH 1/1] arm64: dts: qcom: msm8994-huawei-angler: Add regulators
Date:   Fri,  3 Feb 2023 13:21:18 +0100
Message-Id: <20230203122118.15219-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Petr Vorel <petr.vorel@gmail.com>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi all,

please what is the mapping of qcom,init-current from downstream to
mainline? Or is it not used at all?

Also, how can I verify these connections in downstream DTB?
	vdd_l1-supply = <&pm8994_s1>;
	vdd_l2_26_28-supply = <&pm8994_s3>;
	...

Thanks for info.

Kind regards,
Petr

Downstream
	rpm-regulator-smpa1 {
		status = "okay";
		qcom,hpm-min-load = <0x186a0>;
		qcom,regulator-type = <0x01>;
		qcom,resource-id = <0x01>;
		qcom,resource-name = "smpa";
		compatible = "qcom,rpm-smd-regulator-resource";

		regulator-s1-corner-ao {
			phandle = <0xba>;
			linux,phandle = <0xba>;
			qcom,proxy-consumer-voltage = <0x07 0x07>;
			proxy-supply = <0xba>;
			qcom,use-voltage-corner;
			qcom,init-voltage-corner = <0x06>;
			regulator-always-on;
			regulator-max-microvolt = <0x07>;
			regulator-min-microvolt = <0x04>;
			qcom,set = <0x01>;
			regulator-name = "pm8994_s1_corner_ao";
			compatible = "qcom,rpm-smd-regulator";
		};

		regulator-s1-floor-corner {
			phandle = <0x16c>;
			linux,phandle = <0x16c>;
			qcom,always-send-voltage;
			qcom,use-voltage-floor-corner;
			regulator-max-microvolt = <0x07>;
			regulator-min-microvolt = <0x01>;
			qcom,set = <0x03>;
			regulator-name = "pm8994_s1_floor_corner";
			compatible = "qcom,rpm-smd-regulator";
		};

		regulator-s1-corner {
			phandle = <0xf3>;
			linux,phandle = <0xf3>;
			qcom,use-voltage-corner;
			regulator-max-microvolt = <0x07>;
			regulator-min-microvolt = <0x01>;
			qcom,set = <0x03>;
			regulator-name = "pm8994_s1_corner";
			compatible = "qcom,rpm-smd-regulator";
		};

		regulator-s1 {
			status = "disabled";
			qcom,set = <0x03>;
			regulator-name = "pm8994_s1";
			compatible = "qcom,rpm-smd-regulator";
		};
	};
	/* ... */
	rpm-regulator-smpb1 {
		status = "okay";
		qcom,hpm-min-load = <0x186a0>;
		qcom,regulator-type = <0x01>;
		qcom,resource-id = <0x01>;
		qcom,resource-name = "smpb";
		compatible = "qcom,rpm-smd-regulator-resource";

		regulator-s1 {
			qcom,init-voltage = <0xfa3e8>;
			regulator-max-microvolt = <0xfa3e8>;
			regulator-min-microvolt = <0xfa3e8>;
			status = "okay";
			qcom,set = <0x03>;
			regulator-name = "pmi8994_s1";
			compatible = "qcom,rpm-smd-regulator";
		};
	};
	/* ... */
	rpm-regulator-ldoa1 {
		status = "okay";
		qcom,hpm-min-load = <0x2710>;
		qcom,regulator-type = <0x00>;
		qcom,resource-id = <0x01>;
		qcom,resource-name = "ldoa";
		compatible = "qcom,rpm-smd-regulator-resource";

		regulator-l1 {
			qcom,init-voltage = <0xf4240>;
			regulator-max-microvolt = <0xf4240>;
			regulator-min-microvolt = <0xf4240>;
			status = "okay";
			qcom,set = <0x03>;
			regulator-name = "pm8994_l1";
			compatible = "qcom,rpm-smd-regulator";
		};
	};

 .../qcom/msm8994-huawei-angler-rev-101.dts    | 267 ++++++++++++++++++
 1 file changed, 267 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
index 29e79ae0849d..cdd6f58efdf0 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
@@ -59,6 +59,273 @@ &tlmm {
 	gpio-reserved-ranges = <85 4>;
 };
 
+&rpm_requests {
+	pm8994_regulators: regulators-0 {
+		compatible = "qcom,rpm-pm8994-regulators";
+
+		vdd_l1-supply = <&pm8994_s1>;
+		vdd_l2_26_28-supply = <&pm8994_s3>;
+		vdd_l3_11-supply = <&pm8994_s3>;
+		vdd_l4_27_31-supply = <&pm8994_s3>;
+		vdd_l5_7-supply = <&pm8994_s3>;
+		vdd_l6_12_32-supply = <&pm8994_s5>;
+		vdd_l8_16_30-supply = <&vph_pwr>;
+		vdd_l9_10_18_22-supply = <&vph_pwr>;
+		vdd_l13_19_23_24-supply = <&vph_pwr>;
+		vdd_l14_15-supply = <&pm8994_s5>;
+		vdd_l17_29-supply = <&vph_pwr>;
+		vdd_l20_21-supply = <&vph_pwr>;
+		vdd_l25-supply = <&pm8994_s5>;
+		vdd_lvs1_2-supply = <&pm8994_s4>;
+
+		/* S1, S2, S6 and S12 are managed by RPMPD */
+
+		pm8994_s1: s1 {
+			regulator-min-microvolt = <1025000>;
+			regulator-max-microvolt = <1025000>;
+		};
+
+		pm8994_s2: s2 {
+			/* TODO */
+		};
+
+		pm8994_s3: s3 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		pm8994_s4: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-allow-set-load;
+			regulator-system-load = <325000>;
+		};
+
+		pm8994_s5: s5 {
+			regulator-min-microvolt = <2150000>;
+			regulator-max-microvolt = <2150000>;
+		};
+
+		pm8994_s7: s7 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		/* S8, S9, S10 and S11 - SPMI-managed VDD_APC */
+		/*
+		 * TODO: pm8994_s8 and pm8994_s11 (pm8994_s9 and pm8994_s11 are missing)
+			spm-regulator@2900 {
+				phandle = <0x193>;
+				linux,phandle = <0x193>;
+				qcom,cpu-num = <0x00>;
+				regulator-max-microvolt = <0x120160>;
+				regulator-min-microvolt = <0xaae60>;
+				regulator-name = "pm8994_s8";
+				reg = <0x2900 0x100>;
+				compatible = "qcom,spm-regulator";
+			};
+
+			spm-regulator@3200 {
+				phandle = <0x195>;
+				linux,phandle = <0x195>;
+				qcom,cpu-num = <0x04>;
+				regulator-max-microvolt = <0x12b128>;
+				regulator-min-microvolt = <0xaae60>;
+				regulator-name = "pm8994_s11";
+				reg = <0x3200 0x100>;
+				compatible = "qcom,spm-regulator";
+			};
+		 */
+
+		pm8994_l1: l1 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8994_l2: l2 {
+			regulator-min-microvolt = <1250000>;
+			regulator-max-microvolt = <1250000>;
+		};
+
+		pm8994_l3: l3 {
+			regulator-min-microvolt = <1250000>;
+			regulator-max-microvolt = <1250000>;
+		};
+
+		pm8994_l4: l4 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		/* L5 is inaccessible from RPM */
+
+		pm8994_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		/* L7 is inaccessible from RPM */
+
+		pm8994_l8: l8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l9: l9 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l10: l10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l11: l11 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8994_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l13: l13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8994_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l16: l16 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2700000>;
+		};
+
+		pm8994_l17: l17 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8994_l18: l18 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+			regulator-always-on;
+		};
+
+		pm8994_l19: l19 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8994_l20: l20 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-system-load = <570000>;
+			/*
+			 * TODO: downstream
+			 * qcom,init-current = <0x2ee>;
+			 */
+		};
+
+		pm8994_l21: l21 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-always-on;
+		};
+
+		pm8994_l22: l22 {
+			regulator-min-microvolt = <3100000>;
+			regulator-max-microvolt = <3100000>;
+		};
+
+		pm8994_l23: l23 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8994_l24: l24 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3150000>;
+		};
+
+		pm8994_l25: l25 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8994_l26: l26 {
+			regulator-min-microvolt = <987500>;
+			regulator-max-microvolt = <987500>;
+		};
+
+		pm8994_l27: l27 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1050000>;
+		};
+
+		pm8994_l28: l28 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-boot-on;
+			/*
+			 * TODO: downstream
+			 * qcom,init-current = <0x2d>;
+			 */
+		};
+
+		pm8994_l29: l29 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8994_l30: l30 {
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <1850000>;
+		};
+
+		pm8994_l31: l31 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-boot-on;
+			/*
+			 * TODO: downstream
+			 * qcom,init-current = <50>;
+			 */
+		};
+
+		pm8994_l32: l32 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+	};
+
+	pmi8994_regulators: regulators-1 {
+		compatible = "qcom,rpm-pmi8994-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_bst_byp-supply = <&vph_pwr>;
+
+		pmi8994_s1: s1 {};
+
+		/* S2 & S3 - VDD_GFX */
+
+		pmi8994_bby: boost-bypass {};
+	};
+};
+
 &sdhc1 {
 	status = "okay";
 	mmc-hs400-1_8v;
-- 
2.39.1

