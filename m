Return-Path: <linux-arm-msm+bounces-112408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Aw8SIbNIKWpcTgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:21:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DCF668B0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:21:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cs7mq+Rp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112408-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112408-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8AB3307CFF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FD8405C22;
	Wed, 10 Jun 2026 11:11:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37696404BD0
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:11:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089884; cv=none; b=VqQoOfQqaC+H+3JSPwwZjVpF9LjOSor45n7Sxor3/+ouki1ccg19FmsoQ/fwSgTHsGG1obavhCUZgMrx0VYPvTPjlQt32X5VovUhM3V8hAC9pAY/mVZC4J5HvYIpp6dVwZWQfhxQU+Kf3HpaXWmDIVS7sUa8NqaxG/I2bJciBLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089884; c=relaxed/simple;
	bh=TOj5OjxrruVphHTMiT2EGjrkwWWLSP4XZSWSQUFM7DA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fCsee4L9dXgD0GKh8VbDWBOX0PFZ2CTZ20tg/soV1CGt6FsxuX3McW4AQekCsj93I1wjCsixHfkELjkMwHAq9wdUz1m+UVsbFhMMvbkSah9CZNA/snIF2R+QEgUxcjWdEyPECeo6qgCYIYCwobn7Dps7/NB5OM/8m+3cIO4IDQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cs7mq+Rp; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf18c30bb2so48322485ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 04:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089878; x=1781694678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06m6eTJZDZPQJ7w1wtJsPkoURM31DLSHf6Zo31tPFoY=;
        b=cs7mq+RpG6dR6AXshfcBjj/ymvMRu6LxZjL+FKjjm4p9svuWUzwcHwP/ALx5BdfQok
         j+IKXV7L1qKkXEeR3e7XUnCRBNgDF1OsFRaJH9v1s+NTpangFRqraJ7xIWryM4/ldL+X
         M91b0ngs9QS1qx54kbTYO8zLCGsaC8FbKChbJ5g5fdOfci6I/3+kdoXZZRm8Y42Tcviy
         l5BAp5u/1hiS8KjtfdAjR1g0Gvsle/KvcUg+wDT2iEeXcpzEtp5DVkGknxiu15YezFBA
         mcKSqzNbAa3f0ajR9NZW3/vgqEJJiofkJ+lIHtRs50WYKTCzRNPaYe4dloOD5ZxFpjml
         ZwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089878; x=1781694678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=06m6eTJZDZPQJ7w1wtJsPkoURM31DLSHf6Zo31tPFoY=;
        b=ApAQD1Z+fZGoZB6MNUdIeDm0mKnQszcLsmHY2otdlhFddBL/PoQzkTF0+FQRSk9l6I
         nQMX79qWyXn51L33VGqwisD1yxx23EajF8UkrOjnZNtoAMSr9C9v8LRO6gkcHWX80WHb
         euvGK0GyB8irXU7XuxOZ6G1S7wAfx1pXYuQ4Fbj/0Z/dpZBEU/r1Afjb5/q21ZMfGwfY
         Nj8U/MRckVnouB97RcqhOGe869gTA/uZoCW7mr9phGuaCfPp/a79ytxJ9tQBWd+sVnJM
         TzCPMSJLTXpwjNg4uTvdkWe6b4QMS3dmmfQpVPKyImTQoNIiRZl1jwKSvH/RrvbczEuV
         5FdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8d81Ffe6XhTHNw3iaRyM9iKQhBCWXIOM+qUTZ2lU36nVm+14bCJLzMAYZKDCVQqM13Ct2umli4SdOY2ymG@vger.kernel.org
X-Gm-Message-State: AOJu0YxdIKcvevKHlsfF8fb61GVQs/fxGViP6jA/r31LUdpYQUlpZOzq
	RLnbrsF+yeZbGFDcSJr/iD+n1jlzzDQJ5Fj8wOzx8Npvx+SOE5+vbg4g
X-Gm-Gg: Acq92OEVuPRLfOD1IkxcYIlXm9vUydPTEXNrILp0eu8PWYWt5Ny6EvRYmBMrlJ00ZBA
	NFU9Oo+2+WVBDL+zy25vWaxA4o1AtaS4w5/XROwXFzhuzS7vN3AyU7+5XKhbra/e3bn2+hiV/89
	fbSFyb2NtMadvyAQuOvopWgXVtlTSYcMKwokGT0S1j62dFXeUpfqwHxPsZvnzqc8FFTFHImkqLf
	elm0iAVxE7ffqEDTfJPve4WHziSX7XcQZi0P/2IyusIp65VDJXlm2R5s39HSZgRT05vk/7BSXDT
	d/0b+4STcetzt4rBT12oqjiCvuwwrIPYwkPePxs9OIa4OTaY80VLZ1mSDomESNdpOw/z9kTJOFR
	Pvk5AEwIOKGcak1J2dRPz6hda/5BnQbzWMePxN6jbW6Wxve438cN32I/9V6ynXaDj6S6mmia/vu
	0ZS3TqwtKImkCYhqVFOnHwO7HpBquXVVJD66GkJQ==
X-Received: by 2002:a17:903:4b46:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c1e8979bedmr280552555ad.37.1781089878316;
        Wed, 10 Jun 2026 04:11:18 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:4111:52c8:138e:8096:a8df:e68b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm317175205ad.9.2026.06.10.04.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:11:17 -0700 (PDT)
From: Ramshouriesh <rshouriesh@gmail.com>
Date: Wed, 10 Jun 2026 16:39:31 +0530
Subject: [PATCH 6/9] arm64: dts/media: qcom: keep PLL8 out of Purwa camss
 hot path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-a14-himax-hm1092-v1-6-0c9907da47ed@gmail.com>
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
In-Reply-To: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-phy@lists.infradead.org, Ramshouriesh <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4179; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=TOj5OjxrruVphHTMiT2EGjrkwWWLSP4XZSWSQUFM7DA=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqKUYPxDDLtCkxvbn6f4FJreQtb2Zfs33lMRdPL
 +pACyui44iJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCailGDwAKCRAVlYpeERwF
 3ieLEACVICuCKoukuly4K7kScUxZ74qX8QAG4zbHFuiq7U94MhTncgezdfSWNrVxWQbmUtrbacm
 BXIBD2PS9ko97X5H0Ch32aHBTRmEX1oNGd+iIdOfsZwfapINTymnBGrDfZ4mWsGObV965OJi2tg
 TCmpD5TOFYOVQiHtlDRWrLLFCr6O0wUp4+4ebsCySQDTrs3eU7xqtZb8BheDCmmym0PCKreaF6D
 2r9G7zium9UGoIOcrcjIS5jbXRnYDWxG6aeFqotOZqIZw7YlHUCUQer+W1fMhKlILUFG7GVNWmj
 4ur/XNEc/31fSMZYppkLuQFJICy8BPKLPrNit/owy0WFTzJigxs/6J/L7L9h35fxWN/hQY890AS
 /nqA9WWoPtkO35gKQ/61813IxQL8GIBpp1EDpyBxt6Y9qB5sK/h7NH1PT0ic03qE7Db81FQbf12
 fox/NEdl634WSrlmowVIU1eEB+i4kFe3EGMY3F1M+WJrk5g70a34yodxVSIMlIrx8+uAEcgnxfJ
 PWhoWlwsvh9s6hFbGW3H5XrvDdTOjfVW4uozhpNYrmZ/zxSasqatK63fRDx1DTBhbhVLRxjapt4
 FPRGEMmLSNNTs/TIDF7yIM3CG7G87L3BosX5mKKbNHCQquuNoIQ1tc67UdGhRHBZ9Sjzve0uEXv
 xXKd0AWF4HyFvwQ==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112408-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:bod@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:alex@vinarskis.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-phy@lists.infradead.org,m:rshouriesh@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vinarskis.com,vger.kernel.org,lists.infradead.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rshouriesh@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76DCF668B0C

cam_cc_pll8 (defined in camcc-x1e80100.c) doesn't latch on Purwa
silicon. "Lucid PLL latch failed. Output may be unstable!" fires from
wait_for_pll() whenever something asks for a PLL8-sourced rate, and
the camera pipeline ends up dead with "Failed to start media
pipeline: -32" even after the qcom,x1p42100-camss compatible is in
place.

PLL8 sneaks into the streaming path via two RCG freq tables: the
slow_ahb RCG defaults to its 64 MHz entry (PLL8-sourced) when CSID
pulls it during csid_set_power, and vfe_lite picks its highest entry
(480 MHz, also PLL8) at streamon.

Fix this from the DT side:

  * pin slow_ahb at 80 MHz via assigned-clock-rates in purwa.dtsi so
    the RCG is reprogrammed to PLL0_OUT_EVEN at clk-init time and
    never reaches PLL8;
  * drop the 480 MHz entry from the Purwa vfe_lite clock_rate array
    so the driver caps at 400 MHz (PLL0_OUT_ODD).

I went poking at the Qualcomm Windows BSP shipped for the UX3407QA to
see what rates the vendor side actually uses. The AeoB resource blob
at qccamplatform_ext8380/CAMP_{PERF,RES}_MTP.bin lists the camera
clocks Windows enables, and PLL8 isn't referenced once. For CCI in
particular Windows runs at 37.5 MHz off PLL0_OUT_EVEN, not the
30 MHz/PLL8 alternative the Linux driver happens to pick first.
Whether PLL8 is fused off, trust-zone-only, or just unwired on this
SoC I don't know, but treating it as unavailable matches what the
vendor does.

Signed-off-by: Ramshouriesh <rshouriesh@gmail.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi       | 12 ++++++++++++
 drivers/media/platform/qcom/camss/camss.c | 16 ++++++++--------
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index cee72349da49..5e39355c38d4 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -409,3 +409,15 @@ &tsens3 {
 &videocc {
 	compatible = "qcom,x1p42100-videocc";
 };
+
+/*
+ * PLL8 in the camcc-x1e80100 driver fails to lock on Purwa silicon
+ * ("Lucid PLL latch failed"). Several RCGs default to PLL8 as parent
+ * (slow_ahb at 64 MHz, cci_0 at 30 MHz). Pin slow_ahb to the next-best
+ * PLL0-sourced rate (80 MHz) at clock-init time so enabling it does not
+ * try to bring PLL8 up. cci_0 already defaults to 19.2 MHz via TCXO.
+ */
+&camcc {
+	assigned-clocks = <&camcc CAM_CC_SLOW_AHB_CLK_SRC>;
+	assigned-clock-rates = <80000000>;
+};
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5c9530d52bbd..ca43ff309b26 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4437,8 +4437,8 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
 				{ 0 },
 				{ 0 },
 				{ 0 },
-				{ 266666667, 400000000, 480000000 },
-				{ 266666667, 400000000, 480000000 }, },
+				{ 266666667, 400000000 },
+				{ 266666667, 400000000 }, },
 		.reg = { "vfe_lite0" },
 		.interrupt = { "vfe_lite0" },
 		.vfe = {
@@ -4460,8 +4460,8 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
 				{ 0 },
 				{ 0 },
 				{ 0 },
-				{ 266666667, 400000000, 480000000 },
-				{ 266666667, 400000000, 480000000 }, },
+				{ 266666667, 400000000 },
+				{ 266666667, 400000000 }, },
 		.reg = { "vfe_lite1" },
 		.interrupt = { "vfe_lite1" },
 		.vfe = {
@@ -4574,8 +4574,8 @@ static const struct camss_subdev_resources vfe_res_x1p42100[] = {
 				{ 0 },
 				{ 0 },
 				{ 0 },
-				{ 266666667, 400000000, 480000000 },
-				{ 266666667, 400000000, 480000000 }, },
+				{ 266666667, 400000000 },
+				{ 266666667, 400000000 }, },
 		.reg = { "vfe_lite0" },
 		.interrupt = { "vfe_lite0" },
 		.vfe = {
@@ -4597,8 +4597,8 @@ static const struct camss_subdev_resources vfe_res_x1p42100[] = {
 				{ 0 },
 				{ 0 },
 				{ 0 },
-				{ 266666667, 400000000, 480000000 },
-				{ 266666667, 400000000, 480000000 }, },
+				{ 266666667, 400000000 },
+				{ 266666667, 400000000 }, },
 		.reg = { "vfe_lite1" },
 		.interrupt = { "vfe_lite1" },
 		.vfe = {

-- 
2.53.0


