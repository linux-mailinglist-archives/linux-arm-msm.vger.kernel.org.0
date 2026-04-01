Return-Path: <linux-arm-msm+bounces-101393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMacFb2CzWmaeQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 22:40:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E89893804B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 22:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A29730067BB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 20:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C4F37CD35;
	Wed,  1 Apr 2026 20:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EISuzuLZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794E137BE8E;
	Wed,  1 Apr 2026 20:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775076017; cv=none; b=aPVtO5J6BNiIRD1F4J9yKAL2+GJlT3ngjwI7GBVD5LSUfbpDAJEObp7k5mIIxE2PJhZYl2+rqzo4+TKNDBWqEihH8Fwlxb2SoKSMQIidebhSaWNYslemNuhH3Ud0YHWl7HvLM/VUdK5TQZXtNGAyt+YdPzICW+9oNu/XTnyoims=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775076017; c=relaxed/simple;
	bh=+3IVt1E+BzUQ1QcVG0scDrNeFg+bYzOqv78h/27GnuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ggLd7Vw+6AgkrPRd4Q+cZQm3Gsp4Jbl1UJisMrZs86rahKis8VOLJ47CEMVvk2YNF6/g3wwXrjNqxruFa2ub1rzvRlQaqTGOokZ0VXRBagSRKhqwv3kMLs5AWLBS1uqw4KpT9JnVo04WxPZamzjK2YR8VkMJ7tMgcm0D6lRxBik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EISuzuLZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECD5EC116C6;
	Wed,  1 Apr 2026 20:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775076017;
	bh=+3IVt1E+BzUQ1QcVG0scDrNeFg+bYzOqv78h/27GnuM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EISuzuLZMjUDk01Rs6GVAyhn0yup8UEsVKcboeeUz3fJvNH449t/EvwNN1IQrTChH
	 yWrNKbMDNtQSDvukplWP74DrabpcaCO3DNfekn/9isvPYjhee5RXYLBUF0JVqp/2eb
	 gjW9aRQBVMKVTfY88DQyjMxcfbjf27lh41LY1MS50jCa1nvwxqi3m7duMg6vJu7TQg
	 iNO1KrV4dj0fmOI7oxrpHAcnMj3YAJyXx5lfJlyR/+qpkuP1VzHpAh39OevlLwBStV
	 qZZZrAlfXgK/SSSlCiIfF0luzuHIA1mMHO8Quyo7Xk2eeZgSE5c/srK7Pq9Mgymjky
	 WEDhIpU7DMRvw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D264810FCAD2;
	Wed,  1 Apr 2026 20:40:16 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 01 Apr 2026 22:40:14 +0200
Subject: [PATCH v3 1/4] arm64: dts: qcom: sdm845-xiaomi-beryllium:
 Introduce framebuffer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-beryllium-fb-v3-1-ec7d443402ab@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=SnKFfm4qN/M+jaL16XHBrfpNpLQrOoZvc5aNlTISLv4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpzYKuEAyDlig9CdL1SulbmT00rBOvPNJfXjnDC
 zWbK6I9BBOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac2CrgAKCRBgAj/E00kg
 copkD/wJhhvuabsJfXdKoj3O6zIl1YjXzTSDBw7vD555UuKZGPywTtwAzDdMCcePydVx0CqHADA
 14V0hOecEACczuy395lLpZKImzRF5NkatglxISf2ylA2h1QfaL5e10gbLRnbYo6xV3h6gtqRrnu
 LSx+rwmQHjt/bWLTU7+W79kj/Vu7L04Di8M3SiOsoGHZ1lR+eOQGQfuzz1IQNagRn4tFZYYRR5w
 O7NQ6lubsH5sgqHES+2fbxZR0zod8ckRnllcTbYeXf9acgQ12PiqM/8IjfyllKSf3iKp46njLUv
 VwDjhoSjL0LpHotVqMMN4kLh5BUhOf/Pr5y8n/UY7peD9yZsSNvTXLxVHyood/pNx3556/ohb0b
 Yn1ims7HoW0BEOS0VefKFvgc3QWMP7LvQqZGtlI1LKBICjXAsrMJEfzE1fSX+CQj67VjzZnzJHC
 spVf3nDkF8fi4S8NcKPElPkg0xLElXuc+K2RI4guiNbOpAYGMAgUM4kI1aVFEKSed7zvIrX11gp
 d4YFmXuKgBEvfe4JX4jUFI9SYPXufTTDkj4CygexXLOBg5orOq/MgnzqLQzF1xIdOX+W+Te+XsA
 3LEYVyTk8dqc6qJ7Lkh0OV4oHpYuedbxJpBfWMv9rr82S7td8fgg5HUWnMNt1VT2OdRZTsjKoao
 iCIFBRZFdym47GA==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101393-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E89893804B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Petr Hodina <petr.hodina@protonmail.com>

Add framebuffer for early console and u-boot support.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 1298485c42142..a6ee3dd171def 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -39,6 +39,22 @@ aliases {
 		serial1 = &uart6;
 	};
 
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer {
+			compatible = "simple-framebuffer";
+			memory-region = <&cont_splash_mem>;
+
+			format = "a8r8g8b8";
+			stride = <(1080 * 4)>;
+			height = <2246>;
+			width = <1080>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;

-- 
2.53.0



