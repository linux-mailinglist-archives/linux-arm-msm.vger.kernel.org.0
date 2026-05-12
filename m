Return-Path: <linux-arm-msm+bounces-107077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICdcEYgMA2pmzwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:18:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C4E51F3BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D00723036AD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9713AD50A;
	Tue, 12 May 2026 11:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tQjT+ydx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AEC38E8AC;
	Tue, 12 May 2026 11:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778584421; cv=none; b=EG5CvFqFxuzdZ2vk9/v32RCAqAbW+1G+jjp1XnyKTof6jAVSO4fMBTJ7qRpgVqh3jiI1WAesXc+SjWPDw9SLF/70adV5VlNeG3/14EqEWKC3toLw2vCA806UBzwHO32QdEi84YxMkw5L3Syh1/KKznZYA5vdjKm+CM17fIFk+1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778584421; c=relaxed/simple;
	bh=XZXTYRlzt5ev5f5aXmweZlbCBDc3d/2nuiuklTRr5PU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j15F543ID1qD1Zv8NkfjGrbNUU4IKuM28kns4tBRWNKMFH8cLvNUQoMlPGXbV1EP0AATdZ+6zUrnjyJGoSOfOxf2YVv5tKerD0CIuK9iFELtkAQ8lV4aS+YswUBYSH9LXrmbJhIi4CUnSy3s1x4TXw1q3RA/iZROADSNlO86f4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tQjT+ydx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A975C2BCF6;
	Tue, 12 May 2026 11:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778584420;
	bh=XZXTYRlzt5ev5f5aXmweZlbCBDc3d/2nuiuklTRr5PU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=tQjT+ydxbRNxgv+DjK194KtCJ+m3qWFatFX4gTzjaPm4ANlc8Z8klYXBMbLNNz3Cf
	 1cpGgvKvhB5sYozQnV84fH2+udymOTj9eYwLDZ9ntQbVy+I5aX/L0AYTwHr8XTuygB
	 iJNTZC/SWRzH+rzJp20YsQOB9vtkcPXmwKLLL3e8d+h67yzC8I5iTVNmvZmZKY8XhC
	 T7tVX/zJAf/scWyugxFxDEUP5ym8r4c1bCrqdMti5TVpNDsTrQjuF5/ARJl3q2M9fb
	 RiXcQC0GqTnLWCJJz6TkuSDvsSXPMB6pXwlepvOhnoA4GL7cH95GyazuOLUS6c/voq
	 LGXU5agL7FVDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C79CD4F35;
	Tue, 12 May 2026 11:13:40 +0000 (UTC)
From: Dipa Ramesh Mantre via B4 Relay <devnull+dipa.mantre.oss.qualcomm.com@kernel.org>
Date: Tue, 12 May 2026 16:43:36 +0530
Subject: [PATCH] dt-bindings: thermal: qcom-tsens: Document the Hawi
 Temperature Sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-dtbinding-hawi-v1-1-96149d06cccf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAF8LA2oC/x3MQQqAIBBA0avErBPUMLCrRAvTUWdjoVGBePek5
 Vv8X6FgJiywDBUy3lToSB1iHMBGkwIyct0guZy5EpK5a6fkKAUWzUOMW++1cEr5SUOPzoye3n+
 4bq19fdQfvWAAAAA=
X-Change-ID: 20260512-dtbinding-hawi-0cff91d55f39
To: Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 manaf.pallikunhi@oss.qualcomm.com, gaurav.kohli@oss.qualcomm.com, 
 Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778584419; l=995;
 i=dipa.mantre@oss.qualcomm.com; s=20260415; h=from:subject:message-id;
 bh=KOQ0xKaM2gpSifvcaPimSMSf2hpELPm2eIvMUK4YQpE=;
 b=rXhPDH9HDtxmlzKe2QNLiJ5FOTq62qlnuEqZjTPLFbZelHTpVqb/fm8DfNrPOB9NuV+B/SGeM
 tuG8TYpq/s5DVrlKRcV6AvgfPBFEU0ijGVvtWpxGp3TtV3RfbXj8Sso
X-Developer-Key: i=dipa.mantre@oss.qualcomm.com; a=ed25519;
 pk=IcrgHu2jFHNILPVydQwFqCQq05WcA8wBixw5s+yRMVI=
X-Endpoint-Received: by B4 Relay for dipa.mantre@oss.qualcomm.com/20260415
 with auth_id=736
X-Original-From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Reply-To: dipa.mantre@oss.qualcomm.com
X-Rspamd-Queue-Id: 41C4E51F3BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107077-lists,linux-arm-msm=lfdr.de,dipa.mantre.oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[dipa.mantre@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>

Document the Temperature Sensor (TSENS) on the Qualcomm Hawi SoC.

Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 7d34ba00e684..4fce027e44ad 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -56,6 +56,7 @@ properties:
           - enum:
               - qcom,eliza-tsens
               - qcom,glymur-tsens
+              - qcom,hawi-tsens
               - qcom,kaanapali-tsens
               - qcom,milos-tsens
               - qcom,msm8953-tsens

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260512-dtbinding-hawi-0cff91d55f39

Best regards,
-- 
Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>



