Return-Path: <linux-arm-msm+bounces-95599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDV6M2xhqWk96gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:56:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D71210274
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 108DE307141C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFE7378D94;
	Thu,  5 Mar 2026 10:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OiuHQixj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374EF364EA7;
	Thu,  5 Mar 2026 10:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772708157; cv=none; b=UhW+N5q3C+6JemIkzPxtc2Ue+4WcEaaHyGg3/JB0klhAL4GWVceTCI7Uas+zzm3SskFkRmM6NNut3lmgi2LuE54t6fuX5f0rJhroJ9n1IX/tKPt4g/jpvxdLzMAdJoZw6Trhd6RzdQ4NJAwygJQc5HymV1GlUUazhHhX3Rh34CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772708157; c=relaxed/simple;
	bh=eYfB+3nrSefgeDnASipPyKT0DZXZjtE3Adi0GxcMCKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oht2Qr/KnA7hXaIgUS7KETCtVTU/LWvQUSXdqSNay/xcJBh1tFVO4dFM2ppsRMUhGx1D1IMssRmwBs4cQTSk3UYJ6UijMRdNcnuRP/ZXJVuPp3bD7Wz+oC1qmfKp1XVpLELw0p1KQzpNkxYEE6duz31zXYEmdxBpkd73gUXekFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OiuHQixj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D224C19423;
	Thu,  5 Mar 2026 10:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772708157;
	bh=eYfB+3nrSefgeDnASipPyKT0DZXZjtE3Adi0GxcMCKk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OiuHQixjoEWcvMSYnf7h5OKOW7VHmvbBTmEVFXvjkov/1g/Bjb8vXOZOHpB4qO6k2
	 2SzvOXEFvlTd7dPeKml8EV+3gMR39gFLvpP2mltGnR13ccOmgJkC2UwyP10gpCLQu/
	 Cc2Cb9kBWhfFdw7LdgSynzvBa5eR2NyuJ4ZIgQUyQqWqY2ywFd9/DUcepmpq1ahtvE
	 8AxU9/qK2R6HM1tmZ5tDue3bLmbRw9kUkyUMftJ90W5egKWuq+p7nEiLaeth1EaSV1
	 vUaoE3MZJNpsclySy/y+egKSIQsYCwe9tG7S036Opinf0BFB04WhfuM3v1T4s0NMRY
	 NxDVAz5M3phlA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 05 Mar 2026 11:55:40 +0100
Subject: [PATCH v2 1/7] arm64: dts: qcom: sc7180: Explicitly describe the
 IPA IMEM slice
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-topic-ipa_mem_dts-v2-1-5cb5b90902bf@oss.qualcomm.com>
References: <20260305-topic-ipa_mem_dts-v2-0-5cb5b90902bf@oss.qualcomm.com>
In-Reply-To: <20260305-topic-ipa_mem_dts-v2-0-5cb5b90902bf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772708147; l=1049;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=4KUBun2vAnsfNImlh6xwq+kN+e7QAi0MTjM3u4EjoTk=;
 b=lkbPkStSysnPBm4uEL2ZVPnahiVflPc40JhtfOzK0J50fb/dKDaV7jQ2H8A80nGp/AS2mVN/0
 DW7n6ShqfRtBmPVJ+YvVM7nO7CYeg+vqoL/661rcl4xU4RA7cA+0BmK
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 66D71210274
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95599-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.109.96:email,0.223.255.192:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,1e40000:email]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

As part of stepping away from crazy hardcoding in the driver, move
define the slice explicitly and pass it to the IPA node.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 45b9864e3304..21b20d988a90 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1646,6 +1646,8 @@ ipa: ipa@1e40000 {
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			sram = <&ipa_modem_tables>;
+
 			status = "disabled";
 		};
 
@@ -3587,6 +3589,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x2e000>;
 
+			ipa_modem_tables: modem-tables@28000 {
+				reg = <0x28000 0x2000>;
+			};
+
 			pil-reloc@2a94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x2a94c 0xc8>;

-- 
2.53.0


