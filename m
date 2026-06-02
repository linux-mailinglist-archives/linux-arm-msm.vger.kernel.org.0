Return-Path: <linux-arm-msm+bounces-110756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMs4CZqRHmodlAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:17:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8078362A5D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F65B30117CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 08:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F1538735A;
	Tue,  2 Jun 2026 08:15:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A556221DB6;
	Tue,  2 Jun 2026 08:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388122; cv=none; b=OtdGZlqC1ZrFLGDCYqpo3tMV1DO58GSo7g3Lnnv/1dpDvvL6KHdMjjk7yt0a6nojJMjMO1fgroHaNHyJnOtfR44Gwrbx6to6CDORK54bLKkusxYTJtgMsGhWIYVPP5WDeHeUUHM2N1+RVW5IafVUVyVTgwFFvgOdvE3fwXVFU2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388122; c=relaxed/simple;
	bh=WqrIDrgZpkv/TgR+y0dcHqZFB4H0OxXvd1fGc1edKTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9+H53oT7JYYo7iak3932OjDTq/D2UupeAVeQK8WpjFalKbWQRrYTXkm9F3LUKW1tXtCxyPL5yA+SRWhAAzzvvE8XnvBHamyjBuCgo2ROBDszR44gXSEvLIquqeWyDQJJuyJtzVk7WT39eWnzT6ixeQggF0YtM+VF/w2A2+7HCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.15])
	by APP-01 (Coremail) with SMTP id qwCowAAnzNQHkR5q1DNrAA--.3395S8;
	Tue, 02 Jun 2026 16:15:15 +0800 (CST)
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
Subject: [PATCH 6/6] arm64: dts: qcom: sc8280xp: remove GPI DMA channel masks
Date: Tue,  2 Jun 2026 16:14:51 +0800
Message-ID: <20260602081451.3808833-7-zhengxingda@iscas.ac.cn>
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
X-CM-TRANSID:qwCowAAnzNQHkR5q1DNrAA--.3395S8
X-Coremail-Antispam: 1UD129KBjvJXoW7JrWfuF4DWrWxXw1fCF1kAFb_yoW8JrWkpw
	17CrZ7WrZagF1rCF1UK34rXw1Fyan0yF4rur4DK34jk34fuFyDtr43K3sakF47Jr4fXa1F
	9F4Skr10qrn8GaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r
	43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWx
	JVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQFxUUUUUU
	=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110756-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.954];
	DBL_PROHIBIT(0.00)[0.13.187.160:email];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,iscas.ac.cn:mid,iscas.ac.cn:email,0.12.53.0:email]
X-Rspamd-Queue-Id: 8078362A5D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It seems that different device may have different allowed GPI
interfaces (e.g. Microsoft Surface 9 5G's gpi_dma2 mask is 0x23 while
Huawei Matebook E Go 2023's gpi_dma2 mask is 0xb).

Remove the channel masks from the SoC DTSI file.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f472..d4ccca5e29319 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -937,7 +937,6 @@ gpi_dma2: dma-controller@800000 {
 				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
 
 			dma-channels = <12>;
-			dma-channel-mask = <0xfff>;
 			#dma-cells = <3>;
 
 			iommus = <&apps_smmu 0xb6 0x0>;
@@ -1363,7 +1362,6 @@ gpi_dma0: dma-controller@900000 {
 				     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>;
 
 			dma-channels = <13>;
-			dma-channel-mask = <0x1fff>;
 			#dma-cells = <3>;
 
 			iommus = <&apps_smmu 0x576 0x0>;
@@ -1770,7 +1768,6 @@ gpi_dma1: dma-controller@a00000 {
 				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
 
 			dma-channels = <12>;
-			dma-channel-mask = <0xfff>;
 			#dma-cells = <3>;
 
 			iommus = <&apps_smmu 0x96 0x0>;
-- 
2.52.0


