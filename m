Return-Path: <linux-arm-msm+bounces-101394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 64ngMsOCzWnReQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 22:40:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 829383804C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 22:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C766C3016ED3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 20:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DF437DE8D;
	Wed,  1 Apr 2026 20:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzEVyVBj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABC237BE9A;
	Wed,  1 Apr 2026 20:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775076017; cv=none; b=JsjjZJRbZJ8EruZgz1mbRznxxscG+FJoMjWL7XKfVMtS5eNXGo7mKMEjxLjno8xfJSLQVaCLqeXQ+0shexO9aKiGQis3C0xFNtJLax6IA9CjAYfOEktxKiQwoKgYTupdsPS0G/AwmjG4BaQB++2G9AZ8oDb8GCyqVHCNyO2SZZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775076017; c=relaxed/simple;
	bh=jFxGbwEin6L02eSnQINsc7WtTy3pSmdJ1Ta0GfkUtV4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ofl0J5vNkd0wC+QtubGPdHtXttthfncQhpBDfe3kLzaRF3NWDTMqY3ebEJ3uEowCESt0B0cldF+4BPZ5IfsgT/gtlYMAST50obSIBtk+TvBD5eRT5Eo7EPcTg3WyfIJszG8jic9AlIOAwxk9qO8UkGJXhcy8mlq0luTpT5P7I1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzEVyVBj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D31FFC4CEF7;
	Wed,  1 Apr 2026 20:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775076016;
	bh=jFxGbwEin6L02eSnQINsc7WtTy3pSmdJ1Ta0GfkUtV4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=nzEVyVBjrj/QNoQ5FRTpdexsUbTiDgABpbWn9mGY5qDe+5qvRW4zHh4qX88PEEeYb
	 cAeNznocXGMQMqt9/vaba719T9x/ggxy7JUw2rRWaoOBJLMixLoYPcayU5c16yNM0J
	 Y+u6oN8+UgjEvc/Egkp45/SjLjTdWNxAfGyc6r+9Iglo8k3zcRtgcAsy6+r9XUpzcb
	 57rZwLuIBNPQ0cTc7HCMD/kGCTDCV7ONSXnXj8/8D0+GnCA3452HvAuxndDTHEfaul
	 z5xCzf0tYwkFuJQwzWspJIJv5nlqxLx/NpXYMkUmicIoe+JXisW9oovBKAHNCa/jkr
	 c2DJaFXlFVGjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE2E10FCADA;
	Wed,  1 Apr 2026 20:40:16 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v3 0/4] Add framebuffer on Xiaomi Poco F1 and disable the
 MDSS on tianma panel variant
Date: Wed, 01 Apr 2026 22:40:13 +0200
Message-Id: <20260401-beryllium-fb-v3-0-ec7d443402ab@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK2CzWkC/12Oyw6CMBBFf8V0bc20lYKu/A/jgraDTIJgWmxAw
 r9bcOFjeW5yTu7EAnrCwI6biXmMFKhrE6jthtm6bK/IySVmEqQGATk36MemoceNV4Y7hUVurAS
 DwJJy91jRsObOl8Q1hb7z41qPYlnfISXEbygKDnwPRZkV4ITM8EQD9Tv7ZEsmym/170OUSVXa6
 IOrTK7BftR5nl/kWwPv4QAAAA==
X-Change-ID: 20260107-beryllium-fb-d3e87bc20be0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=jFxGbwEin6L02eSnQINsc7WtTy3pSmdJ1Ta0GfkUtV4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpzYKuY2d9u8/IoyuOwReNEEB5Nlnmx96ewC13O
 MH/r+AiyNeJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac2CrgAKCRBgAj/E00kg
 ctueD/9/QokHBZ0ePZfGMS4Jhy8sFM5bznYUnG3DazaR3l8nID++qEh3r+ZpfrEqizSByR8Dyoa
 OEmW9fo/KOdnRrw2j6hUgINeoVErKy5DNceIMuj1D2PraDu9KiCgcC7NTIkc3W/ndCnYPLOLkwo
 +lPzb9t6tccJswvBZ1JP3vizKJHkhkjNK5wl5chnewE/reWdw4gy2PzicPknzVhiYhBTF+2WT6L
 vyPPkGwPo/kkkTc4CJLL8JlR6/Vg08J/pMa8D+NNgr2xeIuAT13VSDIDJ9Huf/VOEprgRtLI10/
 V49a6bO1UpioHZIZctyM0LKh8+hmf8MqI/tAOsa1vyUWYt/7PkYYRc3Wito3XHWIGLfdDSr9JNM
 KZXJyBP3cMWCYHviePYkFWm8QejvFBEaEtf6ejOUxr8RBCZy8A3AdvAmgstzUVvGzhRmcGfOUzr
 LGAZlOE5fD9kh91OmlH7weLj3GJTkjsc3YsE4GXRtmT1KapdYvDhvlJQyJ1tw1+XlWuyEJGlHkV
 fc9DmapaDNW/XEZ3T4mP8Oz3Ol/5WzL9M+r0LCidObCnBXlvMsGsfba5W/vcHebyLZpb7irPqrk
 KLcN7/WCzjR3IgkuY9/ZYkmRUBNw8WVMqPVHlPz1BCsxgVgtG3INSUmCS0ixpNaEkUmAFgpwqvO
 Eo9BfpsoQWNqZAg==
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
	TAGGED_FROM(0.00)[bounces-101394-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	NEURAL_HAM(-0.00)[-0.969];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: 829383804C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable framebuffer for early console output.

Due to broken panel driver on tianma and no visual output it's better
to disable the MDSS so the framebuffer stays on. 

In case second patch gets rejected, please apply the first one standalone

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
---
Changes in v3:
- Strip label from framebuffer nodes where unused and remove -0 postfix. (Konrad)
- Link to v2: https://lore.kernel.org/r/20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz

Changes in v2:
- Added few conversion to use memory-region.
- Corrected framebuffer node name. (Konrad)
- Link to v1: https://lore.kernel.org/r/20260311-beryllium-fb-v1-0-408a580d125e@ixit.cz

---
David Heidelberg (3):
      arm64: dts: qcom: sdm845-oneplus: Drop address from framebuffer node
      arm64: dts: qcom: sdm845-shift-axolotl: Convert fb to use memory-region
      arm64: dts: qcom: sdm845-samsung-starqltechn: Convert fb to use memory-region

Petr Hodina (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Introduce framebuffer

 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi      |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts  |  7 ++++---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts        |  8 ++++----
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi    | 16 ++++++++++++++++
 4 files changed, 25 insertions(+), 8 deletions(-)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260107-beryllium-fb-d3e87bc20be0

Best regards,
-- 
David Heidelberg <david@ixit.cz>



