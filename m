Return-Path: <linux-arm-msm+bounces-90495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qETjFvw3d2nhdAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:46:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ED5862BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17B933025D1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 09:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ABAA32BF52;
	Mon, 26 Jan 2026 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2VBt17s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D88329E70;
	Mon, 26 Jan 2026 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769420711; cv=none; b=f3uZr61nOOosyb0bmxER5NKvdGxZw8C0m1Sox76XRBC/WR2dzvstyxJZrLDf2OPtyRszBlGTvsVJRm2k5EyQcDzUX5DPvdUIqSKlfCk6Cq7OiDQCiaczsFGXZj/ewhUfLblu09DvGNYdiVKkW99eGKf70BTizq0iJZCaLzLZLTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769420711; c=relaxed/simple;
	bh=TnN7kE/WLZlnKTxrvKz68BMVzCGJTte8F40yPZNv1wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iUJMkzUGHbr4y2aKWKiXF2vMFjinoEMERxeTZlDtGJqwgOwDMwORndXBu2ycsvrrj7oLM52uybnzkYEwk0tlH3vtwI40uNDHutEu9H/LPW0EUBxP8/L3UKPbYqpEdqyj5yN8ikI4MwQ+rqMSK5pMwJWNom7wB1uCg3UluXkC8kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2VBt17s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27913C19422;
	Mon, 26 Jan 2026 09:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769420711;
	bh=TnN7kE/WLZlnKTxrvKz68BMVzCGJTte8F40yPZNv1wg=;
	h=From:Date:Subject:To:Cc:From;
	b=m2VBt17sZyyD4/KjQdcX3d9P+2IHsK3Ne8yck4SUt+LROzAI09KDQ9zJYUKS8CIhv
	 95bshM6zqHy2w/5nOJZv5+uyd0tGQ4lVidm2Q6DSw3Q75JraCtEToYKKHA/f/NVkwg
	 MAKUQ+BN6bmqv+Dzw2Q7ngefsMire6hY3gA0iydGw5eukVccoAS0eJMG4vuJ/AWzas
	 /ddNSiV/Yp2XYGitd7XCC0UIvQdTGwsDvgRmfvbbKUYs20bkWDrqK6kkWF4W6LF491
	 HBUkztRLa/QrzFUZPGl1w36+R86I1COEuCkMPftHf5La8XTCY0KpItrFLEM4Z+b3dn
	 5+DjwtZYeb3bw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 26 Jan 2026 10:45:03 +0100
Subject: [PATCH] arm64: dts: qcom: talos: Add missing clock-names to GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-topic-talos_dt_warn-v1-1-c452afc647ad@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBPSaKiuEiFiUw2EikoF0d2Tl
 m/x/wOJIlOCsXog0smJvSuQdQV2N24jwUsxqEZhIxWK7ANbkc3hk16yvkx0ArsB7Yptb2mAUoZ
 IK9//dZrf9wPtBJ9RZQAAAA==
X-Change-ID: 20260126-topic-talos_dt_warn-6596cf638ce9
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769420707; l=1354;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=CQ9Pad4iJe12E/sk/vzxHdcgPQ0Cw8YMYtlfQsvziV8=;
 b=WzWzXiVkP1RdyIAawaZc4iocX6Y27Zh5Yq3ifwlpUwIv0J7silmREcqQrnYpdboJM2SZTY27q
 sfkTPhj9N84B8cUTB1eVlIW7YTlMiqMrlzv4jX/qqTun2kRplGhqWFe
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
	TAGGED_FROM(0.00)[bounces-90495-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,qualcomm.com:email,0.1.134.160:email]
X-Rspamd-Queue-Id: 36ED5862BB
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The binding for this clock controller requires that clock-names are
present. They're not really used by the kernel driver, but they're
marked as required, so someone might have assumed it's done on purpose
(where in reality we try to stay away from that since index-based
references are faster, take up less space and are already widely used)
and referenced it in drivers for another OS.

Hence, do the least painful thing and add the missing entries.

Fixes: 8e266654a2fe ("arm64: dts: qcom: add QCS615 platform")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 75716b4a58d6..6dab0d5dcbb8 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -666,6 +666,9 @@ gcc: clock-controller@100000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>;
+			clock-names = "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "sleep_clk";
 
 			#clock-cells = <1>;
 			#reset-cells = <1>;

---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260126-topic-talos_dt_warn-6596cf638ce9

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


