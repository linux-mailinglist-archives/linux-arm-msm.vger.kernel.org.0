Return-Path: <linux-arm-msm+bounces-101402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIhjBQ+fzWm9fQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 00:41:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E10381102
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 00:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EF53303C013
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 22:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863763EFD29;
	Wed,  1 Apr 2026 22:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cIPwRvCx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2A23EF0B8;
	Wed,  1 Apr 2026 22:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775083180; cv=none; b=blxJh7xclnCCTrm36+TXU/oObDcRd8zH3MxOMQnMSvhOgvjt76aZPVkqc3fEg71YcU485sXJL3AueNWy4hq0UkgkLibjyMC0CuE/aSyME+BXuLskCPkJJi9McsJTSwizX864fh0bMPYRR3EhAfynb8d0VPlclz2OwonKoAEouTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775083180; c=relaxed/simple;
	bh=8jf4SyBZnuamo9yxA6X2gUyXF2+YjaYRWpKRHaiG1N0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=drXVU27ECJLNsx4LarKjJ2afFUI/uVfHOhgUyxmdeumD3E++QeljuX31gasvBckgtAC2pA1wh0EHDxhRyh7pbF56WCCgRZjb78QZRxUs/0nXXwqM+ec5Kp65j2nevWxpChSZ9GBErxFOWteaDLm4DCUOFQQQYrHEspayZoY1xrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cIPwRvCx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45760C4AF09;
	Wed,  1 Apr 2026 22:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775083179;
	bh=8jf4SyBZnuamo9yxA6X2gUyXF2+YjaYRWpKRHaiG1N0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cIPwRvCxFyzYU9BdmbP+svlncZYq5pnVY7KDO0uJe2CZ7rrbCJzqZSBbHE7NgGOej
	 mSlaEX7P2kkbUf3Jj/5qCSfGZEkTMixq2cBEBbkyyvAyKzEF0HF+YB3YqVdiXfSEBS
	 LOIOXIXhQj+XzhsqlqE/0CJMhZKAqhMfrqWEgU0+6D95NZzL/SNQrfZ1D14D9UAiGc
	 JADnCH82cR0jXeWTOlo+VU4p2e2xyO+usExc8x0Di2i0TXi8/W0XnfhAGkLUMy4bfd
	 SD+H0SqkKvm5yW/X34KDmQ0JbZqACDUW+nN5le9s83041bD/UpH0zFGlJxlhVuVuGV
	 An6kGSFJWk5og==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3655910FCAE8;
	Wed,  1 Apr 2026 22:39:39 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 02 Apr 2026 00:39:36 +0200
Subject: [PATCH v4 2/4] arm64: dts: qcom: sdm845-oneplus: Drop address from
 framebuffer node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-beryllium-fb-v4-2-46170004da28@ixit.cz>
References: <20260402-beryllium-fb-v4-0-46170004da28@ixit.cz>
In-Reply-To: <20260402-beryllium-fb-v4-0-46170004da28@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=922; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=3F91mVa3Gd9x1DELoQbgKGtwlkPBJMsvIBMfbezJet0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpzZ6pkMueddY1VCqQOnTwZYt2gdA8bwJiqAX8/
 VNfaRaeavaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac2eqQAKCRBgAj/E00kg
 cn5SEACYRsmEJ22J0d5fuuiv0HOMjRr0ZYbQ/KrFShXlFCwI8Z05EpiksguwmZQuoorn/wvWSVk
 zC7qYcqnxfd58LKnF09zxLZ2pRwW6sqy/iETjZ0wjGXkEyTgfDWZwan89qAVQSu0yF200pilkJp
 2IHdUGLByI2ryOWww1Z4rUzxza27q8LBzA7XQ7nudK2WJFNiXN1WPlfQSKLuu5DMwYIuhdGc8I9
 FxwSp7BQ2fKF65V+MJKKYtBG8I9FXkcfI539O3VPXtMPNqbCjTBMbYcLrI7btG13BQF3X39iSfc
 f9wft6IdI3ltiGFCJVffABBq6oUfmInHfVtX8pXJEj/LpYWS8p8hB7GVpM3yGlvla7UzoNDxgMQ
 hcrq66GtSn+afIrMucV7t1t25e6q5MyJYaHi4IunEAKTCtVI+Ew6UUspwEsDs0XQylug0JQLV7X
 BYIYxHwJmcuiYp9Z2vF7QczKFPzG3TS7y0iPWs8ISbm1EAZlRgpEF02awhxd1/hga/qGvvejx6f
 zdV9NQAxLA/UdQR8wbbGtnR/N2FhrIn8UmdOc5opblXIfqw3s+Qj0sC98yLbgYSJUfxKRZbG8rH
 rGtn8fBV+GNolVle+Xv4lzFBtiNdLxm5jEhz0OHcXrCxW1Xtx8wU3iDKk7yafihUcBlMgyO+sQ+
 yx7FXMCurpqfYxQ==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101402-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,9d400000:email]
X-Rspamd-Queue-Id: 66E10381102
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
index 6b7378cf4d493..b0b9baf01ec29 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -72,7 +72,7 @@ chosen {
 
 		stdout-path = "serial0:115200n8";
 
-		framebuffer: framebuffer@9d400000 {
+		framebuffer: framebuffer {
 			compatible = "simple-framebuffer";
 			memory-region = <&cont_splash_mem>;
 

-- 
2.53.0



