Return-Path: <linux-arm-msm+bounces-99173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OODAlUOwWngQAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:56:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AA02EF79C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8CEE302441A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139D931F9B7;
	Mon, 23 Mar 2026 09:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="LExfvP/K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD9829BD82
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259611; cv=none; b=CPUOhYheFuZ8FUoD8LX4DNPPVkeMRQ9lCx6V3b28Q5UkPXTM5N7ij35LvD2oZon7Qdnwdf5QFNObJ7JuSsMsIgKyOgbnNiFmxnaO/b/0O+c3GSky49fVvtdGhgKVdfn5wpA/KqqH0xOyUJCek961aCZRVuK05W5WsEsri59EHv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259611; c=relaxed/simple;
	bh=OivYALViO51BXcINyYIeEqbR203oMRr2dTdm3NCcmYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CszjiGMtKy0mCMTuhGLEagpPj4pkiQjROEPtTjK7YV4x/spWtUITxgmKgWuVCW3kpEVyAbzghKqzBfda3jVDG26dOV5VY4B5o2HUumRYnF9Bp6OtDo12vp3OXXuxBheuE1gba90dwe8q1WbilUbL7JKiOx+0qpOR6rqeyHDcjrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=LExfvP/K; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1774259607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EuKMePKdS8l8qYgLmVMy97Flyhc6OjI0UHTXF3Gjx9U=;
	b=LExfvP/KzHYY0mQMeFyi4pYbSJJVfi7MB7kADGdegn4IXhz7Iy8TXGd0zdsV5ZvFhb6Ttz
	tmqvmHLi3TkTGuyl7x4ACgZO0CjpKp73J2FTFTgYkWw0FH3/IyRQNajl+bxuPylJEpo3nh
	tu8ptgKXPj6iWbW0PoBf+jc4OCVfG/kiOMNrQfxppkq8zpBtptqhtH6LmW9aCN8xc6Paf3
	nPJBfRfHHk2Udqwb0dY6cURB0S56LbPHMYey1fLgK2Z6iMvlJrLuaNE2x6AJ/LtKRd3Zyi
	M49fglR65+TiI8/kpet18iGD4eFQIrVWBM5bFLLjBkaO9rUjUl5LYuGH4FddLg==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: kodiak: Add LPASS I2S2 pinctrl definitions
Date: Mon, 23 Mar 2026 06:40:47 -0300
Message-ID: <20260323095247.92890-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99173-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[packett.cool:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,packett.cool:dkim,packett.cool:email,packett.cool:mid]
X-Rspamd-Queue-Id: 07AA02EF79C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the pinctrl definitions to configure gpio10-gpio13 of the lpass_tlmm
for I2S output.

Signed-off-by: Val Packett <val@packett.cool>
---
Similar to ff9c117c32bc6ace7 which just landed, this is for the other MI2S
interface on there. It is the Senary MI2S, so actually using it requires
the series from [1] and then more changes on top, but I have sound working
on my device with it, so let's get this DT chunk in first / at the same time
as the other prereqs land as well.

[1]: https://lore.kernel.org/all/20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com/

Thanks,
~val
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 52 ++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 343da1b18095..f393d1c22223 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3088,6 +3088,58 @@ data-pins {
 				};
 			};
 
+			lpass_i2s2_active: i2s2-active-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "i2s2_clk";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio11";
+					function = "i2s2_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio12", "gpio13";
+					function = "i2s2_data";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			lpass_i2s2_sleep: i2s2-sleep-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "i2s2_clk";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				ws-pins {
+					pins = "gpio11";
+					function = "i2s2_ws";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				data-pins {
+					pins = "gpio12", "gpio13";
+					function = "i2s2_data";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+			};
+
 			lpass_rx_swr_clk: rx-swr-clk-state {
 				pins = "gpio3";
 				function = "swr_rx_clk";
-- 
2.53.0


