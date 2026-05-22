Return-Path: <linux-arm-msm+bounces-109170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gE8tOrnyD2o2RwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:07:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7255AF5ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD1A63014367
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 06:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBB43A5452;
	Fri, 22 May 2026 06:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bE3Djwvu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B0239DBDD
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430071; cv=none; b=FZS7gp7CGKMYP37nAd/ckbAwutvLV176UB45M51zgzqENY5vPp+sPFIm1RVyLN9CzPjvqxQj75tTWXe6X/h4sxOszTOCROw+LtxRZNypwn/Cm8/SsT43fr2OkH/Xx1okeWDu4Edx9rnIKj8Kbd6ydH6DZ3E0A3Qk6N5gSW2a+qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430071; c=relaxed/simple;
	bh=mrDDTyHidK7gIb+A0+rJo9vmv0kzw3uLhyTLM/pl1LA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f8pToFhFY/0tFkDJ8vyzkSwLCcJv2L17WhuN02m1otqThNjToiFk52S8wx2epmumjAySu9TpuuSQ6GzQlMy0pQ4EVkuwyTwqrqSH/L5qUThflK64jId4a19rH6dZZ9FVuVoWMtWtM4il9UZ5MrA5vN8XAbpiFFiArbD8kzLa3eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bE3Djwvu; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-368f25ff4c4so3732674a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 23:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779430069; x=1780034869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFcHoXp5EtCVviQjlRg/5s6sU9USys2y1GAqhGol8hg=;
        b=bE3Djwvuzd64qFyD5AdfgY5XUMPfCSFxpgObAEQG+NXSGimDhVYwic8zFzy0eI77dy
         /HPdgEgw27Gl0+eqeNWveeG1AkWQp7ThgexUxPLXQtRElPIe6JK0xqyqiUxNlARRBEwG
         S2saozu2FLPzPgPl+li+l2oKeOX5hep8gVyHJKSDh4W0CA6z3QhFBcv57rkSEckQ16Cz
         l9t7PmuBJriObcYkKu34eTijusJBkkuACzTcrWq2AsZjXbejyXdzxFi+pG+HxYZQAy54
         PhvOp1mKk2w5PBT9xomZm7MbrRRYZAuyh9H9jd6wt+mYzqc2nHrGftttUKFOETRP5Oqg
         6ozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779430069; x=1780034869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JFcHoXp5EtCVviQjlRg/5s6sU9USys2y1GAqhGol8hg=;
        b=fTPlXfwDvoJ2oyxvqIGcrhGS/Pr3L9KdqucJRGMk2NWy1WL2knv5idflcpQ9FDf4Iq
         6W04xiy2bjqwRUKdMc3iGhtg/evFrIw+JzsjWPZnBiJHK/JDKbcuc51Snh0qLKuIbuiB
         +3RuMTrqpu4v6LlzgTLinHPiLjGhqC5rwFNggAXYApuMTfEZiU2bp/10BN99B+VUq6el
         LDE2Hy8x1K2hPj/cFWBA/wpmqx1DThppOa5Znp8185b8nOFSR1CfGflAuFjemEYnUNqe
         SMpWpx4Cz0G/DoxmzXrJpUaJ+SJlFtTl2TTCx6eig1QFinu+eN6KWMFWrefE4o87Mcdo
         xLcA==
X-Gm-Message-State: AOJu0YwxVQh7jy37435LhUAOlhv5dKABGTlboH63ls3KYwA7RUgCidra
	89zTVKZlFVTegv9esxk59CNr+MsyZsIXnHEkIbBbGBCyMu11DMsAkf0gJAFwbbWwCCI=
X-Gm-Gg: Acq92OGv6/RY1+csHn29ccxnhV5zadfzRx2HHZ9ATnw3iwxJIhowxoZkNqom9WQkx2O
	0K+szgbZEwFgEktCnREJp+6aZtMpqHIK9zD/46NKgP+rNNREf7cEOvXSRcM1O5ctXwsgTtgjtW+
	lXXRh3HLqHlSJnfX4OF80C7RQuenTrLTqtzCP6bP7AR+lAoJjpdyDcuVVGihHqaT0QQqM4FWRIr
	cvrhsbuoWjuMh3xEHKRY92f+G+iqhL0vnhPqbffgTx/H5gvzXuMWWK3SEZSq2yEfiQBYFMiFp+l
	J0N2s61N4AzNdAIM/FNJ55asAqQrhSd4tEebeu6gyEbFge4C1Xmg3pMYtkZIU5r51FsBOO5RWCq
	XlYzxpBYamQii8HOLW2Dwd+iF6oNOyhjWvbfsHDrYXCfXmR7ZbmYdQN8LmSjaVgNps4JEOaKrTn
	f/4kdW7l+ezReX7Psg6fZX3lXBQup9o6nYRpXbJn2IwbbfhNsHeiGHLFw=
X-Received: by 2002:a17:90b:2246:b0:364:edd2:812 with SMTP id 98e67ed59e1d1-36a6789ac27mr2255781a91.25.1779430068873;
        Thu, 21 May 2026 23:07:48 -0700 (PDT)
Received: from radxa (122-58-25-162-adsl.sparkbb.co.nz. [122.58.25.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7212aa06sm428572a91.3.2026.05.21.23.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 23:07:48 -0700 (PDT)
From: Graham O'Connor <graham.oconnor@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Graham O'Connor <graham.oconnor@gmail.com>
Subject: [PATCH 6/6] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable USB3 SuperSpeed
Date: Fri, 22 May 2026 18:06:45 +1200
Message-ID: <20260522060645.4399-7-graham.oconnor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522060645.4399-1-graham.oconnor@gmail.com>
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,lists.freedesktop.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109170-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grahamoconnor@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 8E7255AF5ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the USB3-A port by configuring the USB HSPHY with required
regulator supplies and the QMP combo PHY with correct lane assignments
for this fixed USB-A connector.

The QMP combo PHY shares lanes between DisplayPort and USB3 SuperSpeed.
Configure port@0 with two endpoints: endpoint@0 for DP output (lanes
0-1) connected to the HDMI bridge, and endpoint@1 for USB3 SS output
(lanes 2-3). Remove the orientation-switch property as this is a fixed
USB-A connector with no orientation switching.

Add a usb-a-connector node wiring the HS and SS paths to the DWC3
controller and QMP PHY respectively. Set dr_mode to host as this is
a fixed host-only USB-A port.

Tested on Radxa Dragon Q6A (QCS6490) with USB3 SuperSpeed confirmed
via lsusb showing 5000M link speed.

Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
---
 .../dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index e8ad6e666..c16c3664e 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -1198,3 +1198,74 @@ &mdss_edp {
 &mdss_edp_phy {
 	status = "disabled";
 };
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l10c_0p88>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+	vdda33-supply = <&vreg_l2b_3p072>;
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l6b_1p2>;
+	vdda-pll-supply = <&vreg_l1b_0p912>;
+	/delete-property/ orientation-switch;
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			/* DP output - connected to hdmi-bridge */
+			usb_dp_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&hdmi_bridge_in>;
+			};
+
+			/* USB3 SS output */
+			usb_dp_qmpphy_out_usb: endpoint@1 {
+				reg = <1>;
+				data-lanes = <2 3>;
+				remote-endpoint = <&usb3_con_ss_in>;
+			};
+		};
+	};
+};
+
+/ {
+	usb3_con: connector {
+		compatible = "usb-a-connector";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				usb3_con_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				usb3_con_ss_in: endpoint {
+					remote-endpoint = <&usb_dp_qmpphy_out_usb>;
+				};
+			};
+		};
+	};
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&usb3_con_hs_in>;
+};
+
+&usb_1 {
+	dr_mode = "host";
+	status = "okay";
+};
-- 
2.53.0


