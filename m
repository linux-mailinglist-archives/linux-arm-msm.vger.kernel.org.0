Return-Path: <linux-arm-msm+bounces-110759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHxMC16THmqnlAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:25:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9531762A7CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5A263027730
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 08:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9452F3BC668;
	Tue,  2 Jun 2026 08:21:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3254C37F8A7;
	Tue,  2 Jun 2026 08:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388504; cv=none; b=HiKP8XYQGQXor2awsOS5wbMCB1reiNBCR055t7CKcw/6j3Y33xT9A2K7dczyYPYdPkq2aNe5Ap2iPMkl7/wUD8QCQScigtUsUtzdBPcSdGJf7U8ZEsHWRtiV+5AgsmAacwcP+J0IVcizE/VOKsIBe4zfK/PS4nnGG4ai4QLvQOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388504; c=relaxed/simple;
	bh=RVA9MWtiDh67jOwsI0pEnhGUhezPTOUBQ6SlQVQVRZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F5hqa3xhDjRPj0YQgOxu2rDcjGiCTuUr6Fk8CgUYRP+w9bOqw84LtP0xsXRezbpPyCIbsZbvDv7hqrp+3bUt5mDtCQbkdUqU+4HtNiaB6qFUbVz5QifdKxrmZfhIIlSOyp4/c9+R0tUtv9wu7aWOh3f+BXH8bSQNR+VeVQH14FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.15])
	by APP-01 (Coremail) with SMTP id qwCowAAnzNQHkR5q1DNrAA--.3395S6;
	Tue, 02 Jun 2026 16:15:12 +0800 (CST)
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
Subject: [PATCH 4/6] arm64: dts: qcom: sc8280xp-microsoft-arcata: set GPI DMA channels
Date: Tue,  2 Jun 2026 16:14:49 +0800
Message-ID: <20260602081451.3808833-5-zhengxingda@iscas.ac.cn>
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
X-CM-TRANSID:qwCowAAnzNQHkR5q1DNrAA--.3395S6
X-Coremail-Antispam: 1UD129KBjvJXoWrtF45Kw4kuFW3JrW8uF13CFg_yoW8Jr1Upw
	43ArWkGF1rWF45G3WDWayFq3Wjy395try8urWDK340k3s8Kr92gr15trZFka1UGryrWw4F
	gF40qry8XF1qkr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r
	43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
	AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbPC7UUUUUU=
	=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110759-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.157];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9531762A7CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It's found that some GPI interfaces shouldn't be touched by HLOS,
otherwise system hang / reset happens.

The GPI interface availability information is available via the ACPI
DSDT table, as interrupt resources for \_SB_.QGP* devices.

Add such information to the device tree file.

The DSDT table is acquired at [1].

[1] https://github.com/aarch64-laptops/build/blob/534b169ba00230af434ce99fca8af93dc8ec0929/misc/microsoft-surface-pro-9-5G/dsdt.dsl

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index f2b4470d4407f..0dfff4854722b 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -444,14 +444,17 @@ &dispcc1 {
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
+	dma-channel-mask = <0x23>;
 	status = "okay";
 };
 
-- 
2.52.0


