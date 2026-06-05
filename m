Return-Path: <linux-arm-msm+bounces-111457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PNdNDZdGI2oKnQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 23:58:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C38CD64B7EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 23:58:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=qjVaOn5g;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111457-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111457-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 792583069622
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 21:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661E03B71D6;
	Fri,  5 Jun 2026 21:49:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2B53A962E;
	Fri,  5 Jun 2026 21:49:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696164; cv=none; b=uzcAGfbAXmlopUkDk0RZHBm5rs3KkrHNabNSaFLJaV4Q9KGDrMlLsSWJMrz819AQPyipE70sxcwcNrjHMLsccrmi3vtt9yPQUr9b0gCb58diX2qCgYEJR1KKKqTSX6sBjX+igg0fd90pSCGZrTxuHcLoeO/2/BvMZZg9m+7oEI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696164; c=relaxed/simple;
	bh=qdwBVv1RRqWOhlW5zW1bA6bewmmD7GW4TCzoLeibAUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tgdrfKQ33LGmlZOfbkBWOAYtpYRpfHFZW91GsfjaB5fEpafvVBp3uoyxgD7h3M+4+BhACA+2ECkq+6jvujpA5bCPcw6j8wcMa+Ro57algfaZ6MAQsws38FVkuC96mj5u0pbyHgpKlP6diSvZmS/AbW7HYiLQbtynB0vdI/4lvTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qjVaOn5g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8889C2BCC6;
	Fri,  5 Jun 2026 21:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780696164;
	bh=qdwBVv1RRqWOhlW5zW1bA6bewmmD7GW4TCzoLeibAUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qjVaOn5g2RM2+0WpNH9b6iSudYcHd5wW4NT+PlF+d29/g//nkFzG1rJ1EN1oDXJP+
	 omTOpQlqbnbkMsI7XDMG9yenZDYb/PkbHiZdbP0oehSOJv7Sub7XpDlmO8vq5ZEvnX
	 20q9v3fIAeLR30mOD0UCfztnvpBURoUxJ2SgdM5Qhu/Om8BmkQPVtB0aKe1QJNAfwT
	 vtqRnPRbOPiEOVaksyBJmarM285VL7fqWtcLjbksnzGAEO0ikpF83K57D1PYtoWVun
	 O1uCbJLq857TvKuDUae+0Xz7vL7wJBQ1hBlVs7smohucVJiYQ2wZWjJvyGcGl9pWkj
	 vpMMl5cjx4J5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23D5CD6E7C;
	Fri,  5 Jun 2026 21:49:23 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Fri, 05 Jun 2026 16:49:07 -0500
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for CQ8725S
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-cq8725s-soc-id-v1-1-bb1ef93de649@gmail.com>
References: <20260605-cq8725s-soc-id-v1-0-bb1ef93de649@gmail.com>
In-Reply-To: <20260605-cq8725s-soc-id-v1-0-bb1ef93de649@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780696163; l=738;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=6e0Ah17Wf7TzEakhG6V963usIXMZDDnLcXD9K/mhscA=;
 b=vL7rM0Gt1x33pVcnzIMeLv1lkmsDpyuAHNHUsvjaJOx0UQQOe6dtizJp6Yenwl0To1JWv7Mms
 YNfZsCMBiNfCFVoVlaO3LMuRx0JJl0R4h17445yJpcjUO3JthDaBXFR
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111457-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:teguh@sobir.in,m:webgeek1234@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,sobir.in,gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sobir.in:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C38CD64B7EB

From: Teguh Sobirin <teguh@sobir.in>

Add the ID for the Qualcomm CQ8725S SoC which represents the Pakala
platform.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 1af73c0ad41cd0..b571882d51874f 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -299,6 +299,7 @@
 #define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680
 #define QCOM_ID_SA8797P			690
+#define QCOM_ID_CQ8725S			706
 #define QCOM_ID_CQ7790M			731
 #define QCOM_ID_CQ7790S			732
 #define QCOM_ID_CQ2390M			756

-- 
2.53.0



