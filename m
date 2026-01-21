Return-Path: <linux-arm-msm+bounces-90000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yASaNPS4cGmWZQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:31:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2D356034
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E3E325C4177
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578893D3309;
	Wed, 21 Jan 2026 11:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="g9i1Dzvy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3065D3C197D;
	Wed, 21 Jan 2026 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768994872; cv=none; b=Vl/sa9zMJmapScBws61WvJG9Xzxx4eMylgEZuzFOobEg2xhs2cM5shwM3qt6oIc/FZnjIpWYcf8sqT0vNcmJ8d7wUcBWP1F6AsRyI9Uj9Ef2UCKSAwL5nxkB3vkYlNICqIc6qdbxRESVTyQIUGuhDA37xsBqKsoDYZ0K387D1wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768994872; c=relaxed/simple;
	bh=ONU+/tTPm7P065gKLZFaH3RLShF0CVB1GH3kFUvopyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y+HSm4TWsBK1MZofs19YwI8aGkg21KrsoD0wfCIRlZ0RqyWOYZgMKLdbhkFoTZ93O4eDzp6bi7htuL/l6DX2KRp8d6vnE3oeQeGDUfS0gPnIeNepm2SqeVaDIWcQTyv1G7TR7CRGh9YEiKq8R/LPvF5+FYEeij+AkUiAgS3xM5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=g9i1Dzvy; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=n0
	Idhw1YVNOd+eeqmLfJonmPgAITCx0p2fQGtJtHWwU=; b=g9i1Dzvy4DstMRHZcH
	0//nC29r8D2u5h8DrEDMbd4s2pcrrPKvnSag/0bbffAbKgD8W+I0XWNbrqlcfq4b
	MkL2wL269aMA4O8ZGA0+wY0peF4Irhj94jxpz2ydZVxHcowilFHLhjnjYIMt+X9n
	pfmI9esWUg2rae4hBBVPPHBvM=
Received: from dev (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnX0EauHBpJphfHg--.638S2;
	Wed, 21 Jan 2026 19:27:24 +0800 (CST)
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
Subject: [PATCH v3 0/2] arm64: dts: qcom: add Acer Swift SFA14-11 support
Date: Wed, 21 Jan 2026 19:27:19 +0800
Message-ID: <20260121112721.2981491-1-wwfu06@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnX0EauHBpJphfHg--.638S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur1DGFW3tw15JFyDGF1kuFg_yoW8Gr4rpa
	9Ykw43X3Z7uF1xG3WSq39rXr15Wrn5JFy5KrnxAryDKrZ0yF10vryfK3sYqF17Gr4xua1j
	vF4xZFZ7K348taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUjQ6dUUUUU=
X-CM-SenderInfo: pzzi3iqw6rljoofrz/xtbC3ByrhmlwuBxBDQAA3c
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90000-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: AF2D356034
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series adds support for the Acer Swift 14 Go Pro AI (SFA14-11) laptop powered by the Qualcomm X1E78100 SoC.

Patch 1 updates the DT bindings: it adds the new compatible string "acer,swift-sfa14-11" preceding the existing ThinkPad T14s entry.
Patch 2 synchronizes with the linux-next-20260120 source tree and adjusts the device tree node ordering based on previous review feedback.

All validation checks have passed successfully: dt_binding_check and dtbs_check both report no issues.
Additionally, the DTS has been fully validated through two steps:
1. Successful dtbs compilation
2. Successful boot test on the target Acer Swift SFA14-11 hardware

Test commands:
make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/qcom.yaml 
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CHECK_DTBS=y arch/arm64/boot/dts/qcom/ -j$(nproc)

Best regards,

weifu wu (2):
  dt-bindings: arm: qcom: add Acer Swift SFA14-11
  arm64: dts: qcom: add Acer Swift SFA14-11 device tree

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../dts/qcom/x1e78100-acer-swift-sfa14-11.dts | 1784 +++++++++++++++++
 3 files changed, 1787 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-swift-sfa14-11.dts

-- 
2.51.0


