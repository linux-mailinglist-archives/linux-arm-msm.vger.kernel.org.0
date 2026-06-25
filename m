Return-Path: <linux-arm-msm+bounces-114522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GWp4HPkaPWpfxAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:11:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D13F06C56F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:11:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b=P06byZLM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114522-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114522-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=qq.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B2C330AF624
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDDD3E1688;
	Thu, 25 Jun 2026 12:08:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83663E0227;
	Thu, 25 Jun 2026 12:08:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389329; cv=none; b=IeVoPq+2ELYhVuZE0SzRo8CsdiiDKeC6LFhkbNj3nbuYSESSvzErXJ5TtOUdQzoiUl+ixmWdHQP4Fk+knqOaLuZN3dkyKZ8zz3+4pRKpF709Ry5p4IuUJ+DgFCa40MJMSeXk+KlST9SVfeLX3iPDCVh5eTaFja6JJVedg89+u4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389329; c=relaxed/simple;
	bh=+gW/dxCfCvjxVY8J4WXF0u36MFzHCGobvXYeAjIJIjc=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=EO8n6sumQ8MmCNjq8cH61ixUwsT8CIN7DUuNKysr657OzfKA/3tFcw7CRvXWac38mAszl1prx0g2Hg7PtLZMI4vW8Pgr/YqVds3P3YUJX7Uu6xZOEXig6nZZ/OBVYGffTli20UeQNXMokmjlFxr9kTgUiOtcOV4DVK2knJ7OF+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=P06byZLM; arc=none smtp.client-ip=162.62.57.252
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782389321; bh=O+yWps40dKKQYC+R6y9Taw7mXjAZhWRj9exqhyPa2Do=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P06byZLMjZrbxqcYNvEJPyNMh8FIXjw8Nn6IZBUw0VmRBnG9yEwTbdK90XnGPpLAD
	 1XACFIdXEe3Ui4c6RS5jFiQIFgU56j5YP3xWXOIKj5wo3l5TB0mDdSR+CGhhQTMo6h
	 demE98l3OrMSjlC4dm72oTL2lwUUQ0sDTjOKudYs=
Received: from 8qyomHQF3vPjMe ([163.125.234.54])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 225AC25A; Thu, 25 Jun 2026 20:08:37 +0800
X-QQ-mid: xmsmtpt1782389317tecl7r0x2
Message-ID: <tencent_A89D858754397A68C4C830EA0487CB255A05@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5b+CUFQoZPEfMAgkzhLw3bmLO4R3nYLgLoK9bK6NNIUCPjkLqGE
	 Nwd36d9dwenXn/i0twQW9mb53N8xevaK+avkzq2lQwuo0pztlE5uCcB/nj24JieUEvLDhSZGhQNg
	 URmJXyiWbcyz/FPFlX3Wz4qrwb6bXi/wtTWlRYwAc4cQm71aF327neBt5usfiHR8yeToOZKQL/Et
	 XN4T9VVNbmADEC6eMN7dEEYQlMv/6r4DXQZtoGmvPeEvY5YLDwizccNQtwGuPee1AxRRo+5iMDZO
	 PTgX+Z/jNo2xHRzT4/LmjkC0KtBxe5Oar2wDOgM0mVBl+AYgiAFHhsIfsKTUKwWsCKy83TXMDUQi
	 867Yl18TVYXakPACitZJ5TmLfnvsXG/3sbRa9kxLv0ehCL1tP8wU5pn7ChlbAQc7Gs29gCmWBmXo
	 dOWF5Cq1D53aultd+tGNBLoXuTc9JUVRSLcBRWep/CAZ1cnWcYnQPeh3fGtDmpz8egrc14yOsSVV
	 4ucL6q6QluHUgBrcv/HhpKF/jdienIoKIOlyFbbYROHk8XzSjlNQYCprhYiCRUlcVSwCSH6aEiDa
	 1qlScg/9d0T4VHbpCaRJUIZq3bueWVOf/LFRIGke3Xd92jtkj2S5ifmW+5pDjJYv+Z0lYPqJLrcs
	 J2Crcw88vADfxRTO4j7DwSY80JZ3dBAXPFF0WWxB8Qah67aW/HEUfuEHjUnz4vUsuRFNCO2GAPD9
	 clKoOr0TdVMnWxiCW5ictCVHo2cyzovruGk6ijdpTeEla+/x26jnPVPb6GSMC3IP92TCDRW/07By
	 NzUd619jJv+EU3NUlwNmE+WPHJ6hy8B1IwrDXJ48ACxVVdmJWF2SGWtvc/KG03KBe6fE295t2foE
	 mbx6rjUm/ZKyYLHzBMqFchP70qLqlWTFpMi4QlSCL2yB7K9ndElADmkle3QPRNI3uOPBsrEczYDh
	 qfSNViluM4OrT1mj6zlfOzXKUwBwFCyvAWrSSKv9FMev0mw6Rg+VnMy4mkAFgpRzAZI+n9CglmSJ
	 WHJqTQUBJdWkmgGDr/q4rOwP04+KVcQSdoX5wjixS+wsb/Bvzn6rE3zVBJSm7NnU9wZlArHU6Dlv
	 XUrVFDHF92Xxl4R7qP4wm39kv3MHb1nR/PKiJGhFVfZNVCngHI5XtL8Bn7xQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Xin Xu <xxsemail@qq.com>
To: konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xu <xxsemail@qq.com>
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add ov8856 front camera
Date: Thu, 25 Jun 2026 20:08:14 +0800
X-OQ-MSGID: <20260625120814.18797-1-xxsemail@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <tencent_47473BB31C9142449F8C7C1BE69D9071510A@qq.com>
References: <tencent_47473BB31C9142449F8C7C1BE69D9071510A@qq.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114522-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xxsemail@qq.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[xxsemail@qq.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,qq.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xxsemail@qq.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[qq.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:dkim,qq.com:email,qq.com:mid,qq.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D13F06C56F1

Add the ov8856 front camera, connected on CCI1 to CSIPHY4 and
powered by pm8008 LDOs and other supplies.

Signed-off-by: Xin Xu <xxsemail@qq.com>
---
Changes in v3:
  - Reorder pinctrl properties in camera_front_active.
  - Use the new cam_mclk3_default from sm8250.dtsi and remove board-local
    mclk3 node.

Changes in v2:
  - Fix coding style (property order)

 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 05c366eaeff1..19aff83ecf7b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/usb/pd.h>
@@ -531,6 +532,61 @@ vreg_l7f_1p8: ldo7 {
 	};
 };
 
+&camss {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+
+	ports {
+		port@4 {
+			csiphy4_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				remote-endpoint = <&ov8856_front_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera_front: camera@10 {
+		compatible = "ovti,ov8856";
+		reg = <0x10>;
+
+		avdd-supply = <&vreg_l5p>;
+		dovdd-supply = <&vreg_l1c_1p8>;
+		dvdd-supply = <&vreg_l1p>;
+
+		clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		clock-names = "xvclk";
+		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&cam_mclk3_default &camera_front_active>;
+		pinctrl-names = "default";
+
+		orientation = <0>; /* Front facing */
+		rotation = <270>;
+
+		port {
+			ov8856_front_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64
+					<720000000 360000000>;
+				remote-endpoint = <&csiphy4_ep>;
+			};
+		};
+	};
+};
+
 &cdsp {
 	firmware-name = "qcom/sm8250/xiaomi/elish/cdsp.mbn";
 	status = "okay";
@@ -891,6 +947,13 @@ pm8008_reset_default: pm8008-reset-default-state {
 		bias-pull-up;
 	};
 
+	camera_front_active: camera-front-active-state {
+		pins = "gpio109";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	wlan_en_state: wlan-default-state {
 		pins = "gpio20";
 		function = "gpio";
-- 
2.53.0


