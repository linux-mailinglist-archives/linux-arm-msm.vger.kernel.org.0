Return-Path: <linux-arm-msm+bounces-110760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AELXBBOUHmqdlAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:28:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F93762A843
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DF853044C02
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 08:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A953C37B6;
	Tue,  2 Jun 2026 08:21:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325E238735A;
	Tue,  2 Jun 2026 08:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388504; cv=none; b=fQAQG7T1tvYvtibVtqNU8FfN3zHDarEzfFAgxq/4BzAGEvj9VHWDsKunydtphUkcF4OCsJ6xFBdROHxMeCHN4DM4Ml6Sr4BjwJCIOoO+MYOoR301O2KpiGFEzdwshLKx2HVM4tUd5i8JhhVssGF3tcYXcsTgu+AOtUkAZ4/RlUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388504; c=relaxed/simple;
	bh=xmpFbyOlj9eWXPn/nYRL55tzoosSsjqC946K/DxL4ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rNKO1uPBTB8H1YTzeBC0wsppyOUbFV4+xnHD4CTnwGYXDtKgqnHaWmbl0d4GcRSsN4viBvNl25SyR54+vB7oCt4FSxU7IEP58N6oZf4lLkzDE+jiChEeZZp9VzR9MoHUC6MwQRNBeV1OqP5L157w8diiYSqwWlyW+CQyhtq9rAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.15])
	by APP-01 (Coremail) with SMTP id qwCowAAnzNQHkR5q1DNrAA--.3395S3;
	Tue, 02 Jun 2026 16:15:08 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH 1/6] arm64: dts: qcom: sc8280xp-crd: set GPI DMA channels
Date: Tue,  2 Jun 2026 16:14:46 +0800
Message-ID: <20260602081451.3808833-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAnzNQHkR5q1DNrAA--.3395S3
X-Coremail-Antispam: 1UD129KBjvdXoWrtF45Kw4kuFW3JrW7JF4DXFb_yoWDuFb_ta
	17uw48JrZ3Cry0y3409rZakrW2q3yUWr4xWwn7Xr92qrWIqa98JFWqq3Z2kr18ArW8KrZ3
	Jrs8Jr15AwnFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbhkFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
	0Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E
	0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67
	AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48I
	cxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUtVW8ZwCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUqkskUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110760-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.157];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:mid,iscas.ac.cn:email,qcfirmware8280_nvme.cab:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5F93762A843
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It's found that some GPI interfaces shouldn't be touched by HLOS,
otherwise system hang / reset happens.

The GPI interface availability information is available via the ACPI
DSDT table, as interrupt resources for \_SB_.QGP* devices.

Add such information to the device tree file.

The DSDT table is acquired by extraction of qcfirmware8280_NVME.cab file
version 200.0.68.0 from Windows Update.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index c53e00cae465a..5fcc1782ab35d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -491,14 +491,17 @@ &dispcc0 {
 };
 
 &gpi_dma0 {
+	dma-channel-mask = <0x3>;
 	status = "okay";
 };
 
 &gpi_dma1 {
+	dma-channel-mask = <0x3>;
 	status = "okay";
 };
 
 &gpi_dma2 {
+	dma-channel-mask = <0x3>;
 	status = "okay";
 };
 
-- 
2.52.0


