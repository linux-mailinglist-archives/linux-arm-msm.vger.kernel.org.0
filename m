Return-Path: <linux-arm-msm+bounces-101392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ji/LM6CzWnReQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 22:40:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D776A3804D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 22:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D594E3022213
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 20:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2649522ACEB;
	Wed,  1 Apr 2026 20:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oD5GHLrd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7859637B002;
	Wed,  1 Apr 2026 20:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775076017; cv=none; b=ifwH4EPv4D6E1obL50yzfmGI4Kt0aFUrC+rZu7++bqeQ15Nv38FzlHDnx2jCRdLhe0nxRjaN0einU9fvmcejGn2i60y5Gaj9+QOWPPQzSYt0O313t8mHedZiQmg7kOoYz6CvWmHD9K+u7bUi/3mBmr1+nvx600WezKEWSEpxxCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775076017; c=relaxed/simple;
	bh=Twx6Qy0Q6CaPFSgUsx1I5e69oNenyyYz8wjnnuZt1Dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O646hes2b0cgke/m5zuR+86j90x7GIWbmyW2C72RdmaokvwOB1i9FDugs47SGMDeprYMNY499E2wFR0RCPLQdXCjb1pVA3KVCV9eA88/WtNHrFu3RBmxPR7+tKME6rCwkd6MWfNGsepW3MGdqMPM4cmy8LaB7KO0SbkVZ83M/Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oD5GHLrd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09F05C2BCB0;
	Wed,  1 Apr 2026 20:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775076017;
	bh=Twx6Qy0Q6CaPFSgUsx1I5e69oNenyyYz8wjnnuZt1Dk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oD5GHLrdU8jcbdCZXndyaqlMDsj4hKcmiwugvWOhxMxfZmHaZYFiQ5QxNV9K/9Eho
	 i3dZl5nVYOigKH3gBt1UXPjc+SpYN8PQTBTSpcEnfftfKKrHEMUhQhXHT7bkYhu5lG
	 umlq2c6PxW1B2j7San0ElSMIKoqNPMR4u4wAFcpCuTxxylJ2kLIIKSbr7OTDWO97nN
	 bAbJ+bdgmyOrY7CtXT5j408q5IpUdDJkl8CieCAOWbIyHJqrhAEIIxlvzm48q+bwVN
	 qGhcOsv06k7CDYron6cx6gTrc/MyHUwR72HlcXmzQNCrso6cVsioyG/1ocxfEyV6Mb
	 GVDtD3dsDcBLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E2510FCADA;
	Wed,  1 Apr 2026 20:40:16 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 01 Apr 2026 22:40:15 +0200
Subject: [PATCH v3 2/4] arm64: dts: qcom: sdm845-oneplus: Drop address from
 framebuffer node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-beryllium-fb-v3-2-ec7d443402ab@ixit.cz>
References: <20260401-beryllium-fb-v3-0-ec7d443402ab@ixit.cz>
In-Reply-To: <20260401-beryllium-fb-v3-0-ec7d443402ab@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>, 
 Sam Day <me@samcday.com>, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Petr Hodina <petr.hodina@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=WpNRtN9KzfW/WJ6Lnvj3M30Ah3OBdedD1ihXX8o//rY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpzYKuSCC6LZ70kvSXAg4upE79cW3vXQixDTeb3
 scUrRZBgiyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac2CrgAKCRBgAj/E00kg
 coLiD/9UMphhTgj7BGZNyxfMKhDjjXFrLIsFmw9p1/UxbPbEqmw8tZtHya8irhlOos/krRoWexS
 oGURF8JGpTujRx2W65cwnAEAxcCFRIenmEniqS8VWX2q/a/7jnsW0mhqlvuFOcJ/LlkaOyOqIli
 8g++dioBLaWUCdaoJJ20aXWAsUVrN5naNv/E3UOeVW77eKhYUTaoQvmAi/u3+WxD0MjELwTv1gq
 p5PeYHC0wiu3g2K9DJCgeP9kL5MRWOb0vHMzzqvLnWvos6q+THa18bPwlDffVm1XFx88bZ1WOCB
 NUPLYXYiw54qTPVwHFf7nyhB78op+lpwkW8HDPSH3gFZ72XP7Q+0lIEorKZsW2wkjxhWAS5hiUH
 fNKz7/DKnFSZfO6tYrSlq/bic2vRj17dAvQ9WSziq3WkvpDwhe927uy2TtAXCbcHgS7TlxudmYU
 ZnnK6TFUKs7ME9yX4P/RApPOWBG89sxUY7rP2BVn7jLxQ5Ts4q9gH8Uh/s6trwUS2+ggH6fJNok
 CubrqtV2OzZeCuNQyBsARRnok2W1tcezM4R5czO4hlt9acMkZe0Q/jF23bGXbZ4bmdWRH74/+1p
 Rkd1RZTutpQ64YmVLfkd9CJIG8DtIqDSjHc7B0ratYAz5JPy9ZtPjjFe41BFSoFn3b/XSCFgdTq
 yJuCWWeDUkmu3cA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101392-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,ixit.cz,samcday.com,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: D776A3804D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

This node has no 'reg' property, so it shouldn't have a unit address
(after '@') either

Fixes: b0d5c96e860c ("arm64: dts: qcom: sdm845-oneplus: Add framebuffer")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 6b7378cf4d493..05b8d656b5fc4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -72,7 +72,7 @@ chosen {
 
 		stdout-path = "serial0:115200n8";
 
-		framebuffer: framebuffer@9d400000 {
+		framebuffer {
 			compatible = "simple-framebuffer";
 			memory-region = <&cont_splash_mem>;
 

-- 
2.53.0



