Return-Path: <linux-arm-msm+bounces-114734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I4ceM2INQGrTbQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 19:50:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BBF6D26FC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 19:50:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=CP7O+euk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114734-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114734-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1663B3018ADD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 17:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFFF340402;
	Sat, 27 Jun 2026 17:50:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5925227EA4;
	Sat, 27 Jun 2026 17:50:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782582618; cv=none; b=NYZ/zyUyz/tgSVr6afYFZUXlutJClbQIceHvEgrQMV61iH6zjBLXEl8WJHTluvHRbyXXzZ6SuDqVQh13sjWNCvnmgINkAzhU5b13EXIa3LcNelZQrLzHy6gjdr4TTflauy+4DUZjYd23I+0Y/o63u3mLDppA15nKDP9G0Ow/aOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782582618; c=relaxed/simple;
	bh=95sjByJ6X23yxLI1fA+uCFQUlNcIkNioqSp6CoX9/vY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BZPVeM0SMY4cUOuCjLqtrdI50pN54wM6bmXxsbMkESzSAWqhsLWrVbOTL7ygFd0tKI416p7GIinTbuk7ZVKX80cTT46r95NDTHC7HRk1QBMg2Slyr3bzEeS5ndNKhxhjrLGa9PMcclfvtxlwQ3h/HTZpVx+1h4crlgrs+z148Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CP7O+euk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6550CC2BCB7;
	Sat, 27 Jun 2026 17:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782582618;
	bh=95sjByJ6X23yxLI1fA+uCFQUlNcIkNioqSp6CoX9/vY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CP7O+euk8D3ibFJqAGFPapE7l/OhiPqa2f1X3De2yT2vWAnHW+9Ns2mvitpe0bdDc
	 tw4wY5lSrsqi3N8Tv/vYbz1OL0PeNNWeYlqtWRxP+z6k7jpkSvFlaD5UkHKATZYzNf
	 kxW3Q06IC4JBXyoUc3cjwZmX80QgB+cL2jNhsOBL0YydaAC3sQDYGHLwKMkCAKu7ha
	 QBonhfg6ZyL/z49wp3WRHXQkbuzFNS1LAC3OqMhdTLD2PkqqAHbFQ2oqSSCdMJpdW8
	 75ASPch9r9Fn7AsVHPpPqcZRLaDfE3QsmMcv1wlIA4euM1xQteZgYUUrfMjvEUJk4P
	 n/qblQU+TA7kg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53015C43327;
	Sat, 27 Jun 2026 17:50:18 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 27 Jun 2026 19:50:15 +0200
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for
 Snapdragon SDM 850
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-sda850-v2-1-44bf46ade42e@ixit.cz>
References: <20260627-sda850-v2-0-44bf46ade42e@ixit.cz>
In-Reply-To: <20260627-sda850-v2-0-44bf46ade42e@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=959; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Bm10A2IWOMTZFdIbMpHs4iv+z7ELDsn9bEjGsrnPnhg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqQA1ZEz5uBgL6oDUKQ7CKCqw/mHk4X73KlID2T
 11ntBZO48qJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCakANWQAKCRBgAj/E00kg
 cskcD/9BkgBphaSEH16x9zs+K/eXAf+cGtnNMb0LtrQdHt8j2Q+1ilCvKnRRyBNSKA2WRpm6PNL
 UXLzwIMiSLnlOsISfXT2knEdXk35Ot+SKCN4oQpy8VK0lJtdQ4r8FfKNFW19efDv7eqdJqONkDJ
 U2IQF33e9W1NDOmRoLzfMp8VVOCbQkEx9yswpgiu9T32IfuUD5ZviWpj/ARBrioQ7F4VM5RT3Uc
 LUZPnlvRWUzPoJURtb02vKIXF6U30jjrNPGNDGFOM614Wa1AAoqQXCWfbu7HYHPHB8oaq3lc90r
 kDqdLFmGQLp2rQU3dcet4oOF88pvd3WIvhv0iSpPxelXZ7rczsduV/k3XhKx1o75l7gBsvW20h5
 u7edyTSU34CSu1IHv6gu5sKNo96g/uoj/3mADsX7Lm2OOD2B6rEJHIW8fJuWD+gU+4A8sa2yZqO
 K8Enb4QfcGf2DnmgYXQ6bu/kWzSfrIJgCxsFfcGt8b4mHYPjIYaqoTbEJyUadBfIGSiMiJZewft
 Pr+OpZ9Uh1xtuQ3JVYCpfjXAQxAav0VjqUIuYg7F3QSFC+bzE0GaQD53hJyZFjQe6i0HWjW6sPb
 MN3i1L+G+AnT6yUdAsmiPNiNJ24+B02UGWjYmb2pXz3RFiAH54qILs8QMxsnZVKlCNKUHWTQi76
 TpYR4GzQZK+sJkg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114734-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ixit.cz:replyto,ixit.cz:email,ixit.cz:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75BBF6D26FC

From: David Heidelberg <david@ixit.cz>

Add SoC ID for Qualcomm Snapdragon SDM850.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 1af73c0ad41cd..2cf433f61d5e7 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -179,16 +179,17 @@
 #define QCOM_ID_SDM450			338
 #define QCOM_ID_SM8150			339
 #define QCOM_ID_SDA845			341
 #define QCOM_ID_IPQ8072			342
 #define QCOM_ID_IPQ8076			343
 #define QCOM_ID_IPQ8078			344
 #define QCOM_ID_SDM636			345
 #define QCOM_ID_SDA636			346
+#define QCOM_ID_SDM850			348
 #define QCOM_ID_SDM632			349
 #define QCOM_ID_SDA632			350
 #define QCOM_ID_SDA450			351
 #define QCOM_ID_SDM439			353
 #define QCOM_ID_SDM429			354
 #define QCOM_ID_SM8250			356
 #define QCOM_ID_SA8155			362
 #define QCOM_ID_SDA439			363

-- 
2.53.0



