Return-Path: <linux-arm-msm+bounces-106018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEm4B71V+mlPMgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 22:40:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E034D3B9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 22:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFB00303DD1D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 20:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D873D75D5;
	Tue,  5 May 2026 20:39:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.chunchunmaru.org (mail.chunchunmaru.org [45.79.219.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792573D4103;
	Tue,  5 May 2026 20:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.219.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778013550; cv=none; b=JI4vB+XZnoOpcsHQGxIBMrq2Ret8Ja/GO5k+L5wZcoKzComw04f+6BVxl8SIFAX7aTxQlvDemaMlA/3ncrO1FUUUPgS76JGZa6XkLyRhKaem7SfEiW2aAPfaN5YwtDqaFm9bUXpitHRNsMzPWHJSRKEsqAh4VlWn1EGQAVS3j4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778013550; c=relaxed/simple;
	bh=Z/eZw702I3TcSoONToHzuh+MNR+lK3SrqxsgxZVHi/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wuw0xp5xER0q09ZYWSPzyxIrqz2yI991oQVJZfwv5Di4yMs920TP2JHVACUcXvWBlwtV+UMFgwHqMMDixz7L6H2/Qti5cIVYQ/myzV25zbvxUDxoPVaqmMHkJztVPNmqHlCEqYbO3X1oLDX0/ZCquy0d4JAuWzDeZEccb42waNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=floorchan.org; spf=none smtp.mailfrom=floorchan.org; arc=none smtp.client-ip=45.79.219.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=floorchan.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=floorchan.org
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B78932254A;
	Tue,  5 May 2026 20:39:08 +0000 (EDT)
From: "Catherine A. Frederick" <serenity@floorchan.org>
To: andersson@kernel.org,
	sboyd@kernel.org,
	krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Catherine A. Frederick" <serenity@floorchan.org>
Subject: [PATCH 2/3] dt-bindings: clock: qcom,rpmcc: Add MSM8920 compatible
Date: Tue,  5 May 2026 16:38:40 -0400
Message-ID: <20260505203845.192140-2-serenity@floorchan.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505203845.192140-1-serenity@floorchan.org>
References: <20260505203845.192140-1-serenity@floorchan.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: A6E034D3B9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106018-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DMARC_NA(0.00)[floorchan.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[serenity@floorchan.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	BLOCKLISTDE_FAIL(0.00)[172.234.253.10:server fail,45.79.219.101:server fail,100.90.174.1:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Document new qcom,rpmcc-msm8920 compatible with rpmcc changes.

Signed-off-by: Catherine A. Frederick <serenity@floorchan.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index ab97d4b7dba8..e35a003f270d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,rpmcc-msm8909
           - qcom,rpmcc-msm8916
           - qcom,rpmcc-msm8917
+          - qcom,rpmcc-msm8920
           - qcom,rpmcc-msm8936
           - qcom,rpmcc-msm8937
           - qcom,rpmcc-msm8940
@@ -112,6 +113,7 @@ allOf:
               - qcom,rpmcc-msm8226
               - qcom,rpmcc-msm8916
               - qcom,rpmcc-msm8917
+              - qcom,rpmcc-msm8920
               - qcom,rpmcc-msm8936
               - qcom,rpmcc-msm8937
               - qcom,rpmcc-msm8940
-- 
2.53.0


