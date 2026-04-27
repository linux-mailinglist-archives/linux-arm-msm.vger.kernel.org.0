Return-Path: <linux-arm-msm+bounces-104787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GWYEJOf72nwDQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:40:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B446E477CEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E851D30684D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95BB3E557D;
	Mon, 27 Apr 2026 17:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNmIGO0/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UjxugvnD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9186B3E4C8B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311417; cv=none; b=MyaYwGwrz1YgKzfPWw/G14l01CXU/1vKsVwZURIHHuhKx7jppKhR+xjyJq8I5EP8sK3WXci+O6ABgsjWkYF4u/xgl6cmnJIkRUWzOPzUHUwnxYLisU3M/7iTdWFuF4hy5ZholAzKwQTVZazjh4aS74xfPR9SOGVO9rpyvzc82l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311417; c=relaxed/simple;
	bh=lzFmHffITL4MZ7Zhg3ubOyGGeoOeSnOg+B50ouxJsO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lS9jKt+jT4RjU+TR5psdxKbD7/sfo8pF7ZZLcBdZjJd9sdPp7JKf2bAEk2MZgFLBpd6IZ1HdNtTa8znWVTv+lFsDg770BGC+EyISEhnXf+ghCT4FoenJG/Wc23cMEwcbQSPY2/UQbyxzVWyM4IpDUOqniD5zunaqmVE6NZL7N+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNmIGO0/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UjxugvnD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCYZui429204
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q/yZ4bIJyOI7G4zqRHN1bsvi00G0rNpCoyBy2l1oBTs=; b=oNmIGO0/RbQPH5mY
	JAzuBa9qDcZ5+3btq1ypb+yXum2qudj6qLr/7W3ovxv71MyXPsqvLIaQX6+/tglJ
	7Yv/ed3eh84VHBS8J51wBfNertGUzw893ZTwItDPNZwWNAuXITblVhFsD1rGsrHr
	2n2Satt2oMFq5AxEDc0HgSF1z+rVFvdfmB9owAJAojCgfofdRqfqYZvYFd4QrhbZ
	+r9fayRmSH+2CkqgKYmypRQGy+V8eFWciJDGhQdjwwD5vU+B+w3l5IjC5Wlv0D3r
	3LfakyVZATidcLQxflcjm9rYRmb7cdz+tJBWpGNB2RIOG5K5KY+HPHVcr56O6nhN
	ARzzEg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x315bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:36:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b242062308so195449885ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311414; x=1777916214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/yZ4bIJyOI7G4zqRHN1bsvi00G0rNpCoyBy2l1oBTs=;
        b=UjxugvnDCpdw2hjcD7FtmB6Cn+JwnRAvQof9tjS1MwPjjyccpT9Sg7+REZV8c+GsQm
         FhYtN3StaIp5/BlG4qe0KXygiaRrtgVz5VAGd9ZXwfclDrNVq2oyYyt8xJCbj/bY3qlJ
         ew+E5WmVyLdPlswIIWT6RjCWF1BLTEVvuOBCmR61XvvLxBmFzJYtCNTPEEYT3djaIbym
         +XCWIAuQoIt9JBf69FqOfoiB2NCgOHAeIUMES8eDAaRpHi2nxi9lfBQ0Q18ZJsLBMJ1f
         x/jxG8JVdfduBYq5BRCEURAuTBRlaCfb9ReFJVrY46ARgm0gDbLfVoAfBpLesdT2MxQl
         0feA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311414; x=1777916214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q/yZ4bIJyOI7G4zqRHN1bsvi00G0rNpCoyBy2l1oBTs=;
        b=LFh66VDO0c45WOMB9CBsLGMLwu9O3wDi14j+ATLutxYOCAE7JrlYSTEa3rRNTWqxB0
         MZUEUelCDnFVuEZ8m2loimflGttuXHw4xaHp3fSmef7pl3Av+eyEXyl7wy20utYcCvfv
         PGTJ0f2G4fqBR0dmIKMMrj2fRpJvgVg1Nnz8QKPtqvS6NSuyy4y1wBsO2sA1vuHI6lZ4
         ps5Hi8Cl84nNopLWasXerw6NpJ7qbR/rbrsM1O3FMNGI1ZJhWFPxw41wl30ZIeRyohrb
         ZeWNDoDvaVukvM33xIGGBceyimOuNunh2QV8YFiizYb7YmKU1MeUV2oPoOGNWKgGb/9q
         6XJA==
X-Forwarded-Encrypted: i=1; AFNElJ+FOLHASLPW/8eC2tRhZmH1wwoCRTdHHzK2URbzJWjCHYjAXOYQQSsfEEo04AFVahTXijAU2NQzVzjSl8zA@vger.kernel.org
X-Gm-Message-State: AOJu0YwaS369AtN3sjZnRUPENo9pM5KQ0RvRBawu2qXVm3HWX1I2KNHl
	WCF0Q3CXVgJXf0sdSTNyD0V4E3dEZ17r9bwm1HzoMEr9fUNdJVfRDxujJcZhM8aa8mXLxmWNXJf
	Bh4m9eVpi/2rVtoRFrLcFEdoW0XJBAwq2GdyD7QZmDInoe2dWj1efTK+D2wFM+FVzZislbZ14o/
	x5
X-Gm-Gg: AeBDiev1GHlr+6FxoQQGcQkeUTJvtDCJROZOb4tRJHGMRMuz/vYCpdmHGWlwdN681FH
	X8ZAMdMInGjvBCRkkZpOuaudxolRrcDN0jvwayd8M00n3S4x1PQDfurW9+lW1WsMzrmIBT1LSEc
	gUSbDDFanLtybTxUOg/0OLLxVeMiNkea6meiin0ESkzD/z6SA6ZLtnfU73mHTKRaLQQ06uJfaoo
	kaA+kthycP2PQ/7s7TH+R2ssN2BliNXLSfo4TmsjRKojK7kqCzjuT0wUMixHLaHhwcwiMJ8AI7H
	JRl+rvVojy5adhh8kDDfERfAHQ0N430RgZtB1qGio05b2J4hOAWFKUOypTApsJ4mg+DpywxDMB5
	zebTi1wBwVprdXiKb5/SDSNXwauQ6cBjbshMtDi6pB7SOcJpWjzEJLk79hr/JIvwIMzgq
X-Received: by 2002:a17:902:930b:b0:2b9:5d1b:73da with SMTP id d9443c01a7336-2b97a9498d1mr1240345ad.30.1777311414263;
        Mon, 27 Apr 2026 10:36:54 -0700 (PDT)
X-Received: by 2002:a17:902:930b:b0:2b9:5d1b:73da with SMTP id d9443c01a7336-2b97a9498d1mr1240115ad.30.1777311413824;
        Mon, 27 Apr 2026 10:36:53 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:36:53 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:50 +0530
Subject: [PATCH v21 10/13] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-10-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=2240;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=lzFmHffITL4MZ7Zhg3ubOyGGeoOeSnOg+B50ouxJsO0=;
 b=98cReqLFE1VvbI3WMdumayFbZvKuX+6jokI+ZbKawI/g6LlmRmm1VnxCiGnVLXZwxNIU5qBGG
 YfhdC626zMjAwn8yAogRwMIqB5/RL9mpWKk8xilVRkbwq7id7zsCDrI
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfX/N81gfe2WSir
 p+GVQzkKdxuPuy3nnU/CDr3lS+rGHs6cmIMaaTJBk4eVPVwhN3r1pHtvJzCv5s0p4iRpNxvXica
 ccI98OgwrVR11BLG7/AhdTkem8/pSYtkqRZOkvdtiFQhNCanUnQc3ngyTP5eiFbSK4+wltwbyIa
 33W/6zmmDpK3J7Orsb7TPN5o/HxGK2LwXPqf9LOfC2XrVcmxZUkl6Zlfi5Kpkd54jk09k0dFVWc
 g9C45UJjpMn3OgB5jH5LJ6Ag6QRDTS+y5aCthFmPM9+wxndQLRWnMTSbDxkVI8fanmMyG1VurEo
 1gFhTWrpWQHI7fslqWB4lXwIWCxIqTwuvavlrg7Gk8eMkcEHaY41Y8y5w0TdawgbzietRObNFcG
 tI2cwt0TWRTP9X8CS43iCt8fdjC2gFmegoNA6tgmsnctT4IX9eMW8P5R42p3/L9CuvvTDf1lmha
 VNlR0KA11i/ppVAgl7g==
X-Proofpoint-ORIG-GUID: 0Pb6zZe2XS2QM9TsQsfuXhATgRpDKObA
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69ef9eb7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 0Pb6zZe2XS2QM9TsQsfuXhATgRpDKObA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270187
X-Rspamd-Queue-Id: B446E477CEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104787-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0ec5196c88881f529236c321ad617..72bcc732ab7b64288e1848edb8a55e2c7fe34f98 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -863,7 +863,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902bd37242ba96b90a858ff091e0c80..b7a0b53476395c25f264f2808176588f5943c4c7 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -786,6 +786,13 @@ &qup_uart7_tx {
 	bias-disable;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e393ccf1884afde7816739053d41ca789acfca91..ec614003bd83664b5485940edd366c9ddbd57340 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1088,6 +1088,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


