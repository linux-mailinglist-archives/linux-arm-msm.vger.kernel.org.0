Return-Path: <linux-arm-msm+bounces-99353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGPlKVlxwWkQTQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:59:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6702F93AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F29FC31439D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C4F1DA0E1;
	Mon, 23 Mar 2026 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeibyQZw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D5C3BD64B;
	Mon, 23 Mar 2026 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283268; cv=none; b=Q6h+LPjeTbVnD3pF0Y7bqFp06MhtFzjR9fnmuwhQFYUlbG5t+0Qoa0WOtPT2vDTi4f8TlyrT4RnpfXD3GW82yvm+f0mYbyXT3EOLOuU6VJoaKSL06GFXMOZSefz3OODZZiRyLKWVHoNpowP8alFOeZUTvqGnFWEWleNyIC6s0As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283268; c=relaxed/simple;
	bh=vabLmCmKX/+J3rXdTqzfikoes1bTZz70L0DuNHGncL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWXQK7yGrtVZkkgqVFtexT2h4GqLwMzoLCjeUy2UPBK7+sWZssF8at58M7vJ2vbnbkDVSOPHeBrGQ2AN9WDfjGKJ2xy2KOkMc6uOA1yvvn5ciZ/DNjK8wQBDMfJJsqtOuyvhsLMvqri22JAzqzxCmZDcyHa3d5aNdSl7WKvVxso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeibyQZw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F05AAC2BCB4;
	Mon, 23 Mar 2026 16:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774283268;
	bh=vabLmCmKX/+J3rXdTqzfikoes1bTZz70L0DuNHGncL4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WeibyQZwLasTSFoGRAaju2Rv2AK9ThGo8i+CBZsPBLXRQHdnEHSwVsAi7ije7Rxm/
	 LXUHpnBYTrYO+sn6bxBcoNyMphdHTmY1f0dL2XS3yIWBWNYYNIXltP5X6wjhW7+DPJ
	 6X4uU52c/jngpORoKAowS5kq6dOnYU2G2cE5SOfb1hm2NoYSuHOk02GCDB4Eehhoqe
	 N/R2nAZgU6AyJ1Yt0IpVdZTQTVjyP0vLNNYHk7r5lYeoEylD0Z05IfKykLi74nGiz7
	 7FC9e6FPGdiKuUdT0oq4EJ5fSsh+HLfJmySVDgRwlnaEZumXkv69S4y5el5DYgJ0uw
	 jBVpAyNMsTmNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC007F483CE;
	Mon, 23 Mar 2026 16:27:47 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 23 Mar 2026 11:27:43 -0500
Subject: [PATCH v4 1/6] dt-bindings: vendor-prefixes: Add AYN Technologies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-ayn-qcs8550-v4-1-33a8ac3d53fa@gmail.com>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
In-Reply-To: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774283267; l=899;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=51HjCxTlAcVkrzRblUjcKootVCBtxWuWQ8ylYfvfpOM=;
 b=0X5u49dIQdEXO9jdAppLYKcg+dF9p4YDRSo0qbeev+kBhTAT/Pq9rX6UL3U5TwFpN+Qm/y/9R
 NPSOZNlMs9WB6WObrnnFpaUs/5MkRh5/B7y7bZ73gwIiVrfnnYNucMD
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99353-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com]
X-Rspamd-Queue-Id: 5F6702F93AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Xilin Wu <wuxilin123@gmail.com>

Add an entry for AYN Technologies (https://www.ayntec.com/)

Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 306343407019fe74bccd931a78ecefc6889e3fee..e20d9dc6a8322b79a5d80e7d3f7135c2b4cfa2ff 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -221,6 +221,8 @@ patternProperties:
     description: Axiado Corporation
   "^axis,.*":
     description: Axis Communications AB
+  "^ayntec,.*":
+    description: AYN Technologies Co., Ltd.
   "^azoteq,.*":
     description: Azoteq (Pty) Ltd
   "^azw,.*":

-- 
2.53.0



