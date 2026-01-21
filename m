Return-Path: <linux-arm-msm+bounces-89999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aETVFMa4cGmWZQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:30:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C25656007
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9B9433A71D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C8C340D92;
	Wed, 21 Jan 2026 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="afXhcgWL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47ED330332;
	Wed, 21 Jan 2026 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768994866; cv=none; b=NL6xUi7DHClXIBpUUvTAJNYWjfwDjrmIyH62Tj+9L7m6xRI1Td3MeR3z4lD5igPVpT2qV3OOMzBcRPUwkMDsi+2GXD8KmFiVe/E1hahInJQMHF4i7uUv5NfJGwTgJnJ17y2W7wxYNN/cL1FCvaerXNlZoYtdZEdO8NY1Hn7Yxh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768994866; c=relaxed/simple;
	bh=nJiKyEFy3NycFn2aqdfmk6rBElbJDF+OudVwAdCGA0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cs/akYytckVUY9+HZNUiP0FjadERYbX8/4t5WIlpE3hMhMKOhnY5VN4asSkSaOFTjc/owMrp1PtxDBgm0VvpdiHfb4f48Q8o8b57BLG79mUk78t1eTm3ldJDlEd2pKMvyLR0aaVacifrhFkrli2uvX1/NtWTdtFESML5KmxvqM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=afXhcgWL; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=aW
	DL3NhpTV2DlRfG+4JnVvIT2wqsclMherU8MG9SAig=; b=afXhcgWLCJlvQ2MPxf
	7+jRgEryHh6W1Eq3bJwQAwDW58nsaBC7JHZHXsFN6jb1+fEnQtld+3AAsSzdZhSv
	PDyJZqBWiO5O43VOCCOMgINNJW2ssDCmrXCtdDTYvo3nfUw5U9tTUbDZibCE3bUu
	io2uCtX/2hvIipn6+uMQ0y5ZM=
Received: from dev (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnX0EauHBpJphfHg--.638S3;
	Wed, 21 Jan 2026 19:27:25 +0800 (CST)
From: weifu wu <wwfu06@163.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	weifu wu <wwfu06@163.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: add Acer Swift SFA14-11
Date: Wed, 21 Jan 2026 19:27:20 +0800
Message-ID: <20260121112721.2981491-2-wwfu06@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260121112721.2981491-1-wwfu06@163.com>
References: <20260121112721.2981491-1-wwfu06@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnX0EauHBpJphfHg--.638S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrury8Wr4DZr48Jry3AF4fZrb_yoWfJrg_Ca
	n7Gw4vvFs5AFsYvws0yF4fJr13Gw4akrs7C3Zxtr1rA340y398KFZ7t3s3Ar17ur47ur1f
	CF4rJryDZFsrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_DGYJUUUUU==
X-CM-SenderInfo: pzzi3iqw6rljoofrz/xtbC3B6rhmlwuB5BHQAA3M
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89999-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,163.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[163.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wwfu06@163.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 8C25656007
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add DT binding documentation for Acer Swift SFA14-11 laptop based on Qualcomm X1E78100 SoC.

This introduces a new compatible string for the Acer Swift SFA14-11 board.

dt_binding_check and dtbs_check passed without errors

Signed-off-by: weifu wu <wwfu06@163.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..3de631667701 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1076,6 +1076,7 @@ properties:
 
       - items:
           - enum:
+              - acer,swift-sfa14-11
               - lenovo,thinkpad-t14s-lcd
               - lenovo,thinkpad-t14s-oled
           - const: lenovo,thinkpad-t14s
-- 
2.51.0


