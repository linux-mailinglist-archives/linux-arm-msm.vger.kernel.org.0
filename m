Return-Path: <linux-arm-msm+bounces-114056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7/lhKAWGOWoPuwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 20:59:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E15D76B1F30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 20:59:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b=nF7pwJOE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114056-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114056-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=qq.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F5C93062D4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 18:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04019346E74;
	Mon, 22 Jun 2026 18:53:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7A6344DB1;
	Mon, 22 Jun 2026 18:53:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154398; cv=none; b=aVzskw/IuiXC7BP4yHD+82iFjeVhFi8ch8OelmNfYrXshhrdkWmgrIJSQwFZxlTEPo8gvXAYBMjOnfl8j7FUGRJBjAj/HLXjxq2I930JdIY6tfLfFOY5a7v1tPw6qeMGn4rmapBGjXGhwDSUbk55KYJsdE7pOZoGa/CxsP0cUng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154398; c=relaxed/simple;
	bh=L1mjaKzjhiy9eXZ1lJDHFdlG4o4Zl1cfbTaD11I44Nc=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=JxmWfM/5mdVa5kOqQJg4jw58+bQ2g36zc4i0fbvUqV5DhwDAWVDoE5jwJkl5Cv32uP8AXHy/M/bPop+tw4SS0wrrk+yqRcTGdZ5208iIth+mmt53JqpxSH3oD4Xo8lh1QnwWNQqFS3186VOS3FXoH6FYoqB/nQCpSmnoedkdNhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=nF7pwJOE; arc=none smtp.client-ip=162.62.57.137
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782154391; bh=ylJRSRAHd4hlxrWTOWx4Yys+C8XMWR3bRp7Ic08pPNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nF7pwJOE1SuQZhAMnDnlihCWO2LQMffhtg7Rnqm8Kl0JgTjRg1kQv8ff0fmHBYIQn
	 JknTDvHWJzXjN63ys3Yze//yzztQjGkoRgj5ppFNUyG6B1umi8XH8geoEY6rPfoUcj
	 WU/vCxcoI82bRmdNf0IdydU3dkdHzB5NawKVaoNE=
Received: from 8qyomHQF3vPjMe ([163.125.200.111])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id D46AF44B; Tue, 23 Jun 2026 02:53:06 +0800
X-QQ-mid: xmsmtpt1782154386tbkn9johf
Message-ID: <tencent_A7DA95458754255A62A4C730EEE484AB2905@qq.com>
X-QQ-XMAILINFO: OcszTHya9Hkx8gwzKDGF/t5MuMW0ZjBdIMvw5o4s0ZTuj+IlF9E877oMOUtO7v
	 anCMGUO6Cf+fCn8AOnK7vU8F+nrJrMgV11lx1x0WQ6F11o43OBUhqyce8NAoAeKc9ub8lIDQ7jWB
	 QMtIEYijab8dENjEd0DMMgjAzRaYzTZO8c+94OG3kdYHHCFbdW1setRVBac59OrTn6OK5MT/tYg1
	 EGCHOHbtzFQ3mVIBey/jCb+HPFQqdrtF+0E1xK4eoenQ4+MFrnuxIoe2vZPphMRezS3UAzhQJn0P
	 Rc4HJPp/FOl4QNbR2p3/lfOxaE2gRvhSsR9HbMthq+bFpyX5nXutodYECcMisEqeNyELvLLeUVYc
	 3mI5519SFyUAMBS27uKl/B2Cb0ejiuIIH+BjWebYpnP/p7D0+IQyNRadHvTuHvFLaqm39AUfERN6
	 noIGFOQ6NgWlCtg2pfun80Mr6p2Vhfi5JvEQ24UzdQei8Yvk5QNIz6I57RIBhPjuUzZuNUah+T/O
	 fXlZ7G4yDXzjv3XyHyykcIOuevqAr+GFwdL3IeiFDOJNSG56jIyiPHPPe4fGnfee8NE2qKWjvC50
	 4p3Jy+phW9m6ku71OHrcyRCerS4XVJzhihv5C2K4//sRBoRrp/A4bZlhxmXEL1gsdEF/WAeGGr4c
	 fvw8czkgSgYvJb7CM1m/Q6WKa65D1BYxqqid0HCWheCb9epgLrGtqSyIn3+7Du6T2FZWBzhx8Jiu
	 Hx6BPYSVCHCz0Hq1K6keqvtu7MGHg/JR6CyqE1wmI7S8lABH7IQ+WIuCUCCgyl+x0UVtDYp5fFdj
	 0iYbxmImzbNC04O69EdgdarcMJW8f+J+ZP5wP1L0kP39/lbii3XsOywvtTGRVX5X0lCbkURC4hde
	 /iOvXUoFtR9A53pIlbSvxygIDWPNUiJlTVMLNALxra4kXELd4hwgQHvrHD4T5gSxBvJPTnbIEIxx
	 TN5YX7AtYi4NdvLo5MB1t4KuL4PmTHDBJRijCKjxg0Y8QNAVePvtMnoU3xmS5Wb9gNm+Y1J3zujr
	 nAoHfPB9tAkLLvMvpPJtBMeLcafpA2tCPfAGH2PMmgemFtEBetZDKuPN3cw9tb/+hwQ2RK61WO0v
	 TIz62Hsr0LNyzgEHMgaOt6PWYhgdziE5dd63wDBAKoZXE3MbxzY+VDS7Xj6JBmny4Xq0sRynSdAS
	 sJXQQ=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Xin Xu <xxsemail@qq.com>
To: konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xu <xxsemail@qq.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8250-xiaomi-elish: add ov8856 front camera
Date: Tue, 23 Jun 2026 02:52:36 +0800
X-OQ-MSGID: <20260622185236.41873-1-xxsemail@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <tencent_A65CB41DCB0CA96634CF8883E1CF89059706@qq.com>
References: <tencent_A65CB41DCB0CA96634CF8883E1CF89059706@qq.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114056-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qq.com:dkim,qq.com:email,qq.com:mid,qq.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E15D76B1F30

Add the ov8856 front camera, connected on CCI1 to CSIPHY4 and
powered by pm8008 LDOs and other supplies.

Signed-off-by: Xin Xu <xxsemail@qq.com>
---
Changes in v2:
  - Fix coding style (property order)

 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index c514478cba4f..262cb9f29ebc 100644
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
+		pinctrl-0 = <&mclk3_active &camera_front_active>;
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
@@ -877,6 +933,20 @@ bt_en_state: bt-default-state {
 		bias-pull-up;
 	};
 
+	camera_front_active: camera-front-active-state {
+		pins = "gpio109";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	mclk3_active: mclk3-active-state {
+		pins = "gpio97";
+		function = "cam_mclk";
+		bias-disable;
+		drive-strength = <4>;
+	};
+
 	pm8008_default: pm8008-default-state {
 		int-pins {
 			pins = "gpio84";
-- 
2.53.0


