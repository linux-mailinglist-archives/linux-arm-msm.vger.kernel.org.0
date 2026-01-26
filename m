Return-Path: <linux-arm-msm+bounces-90538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCFdNkdUd2mdeAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:47:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E7287CD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D92763007217
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D918C332EC4;
	Mon, 26 Jan 2026 11:46:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84352333729;
	Mon, 26 Jan 2026 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769428016; cv=none; b=Ai6fBHSIBn2e+rOYtoIhlE6xKsvRl1v+mGzdByLJDiHtPa2j1vK7AdchIamnOSQKFnFKFBe15a6gFh2IaSHFf39D54ZaxqylZhS5GW5Ln5ds3JTKL93h6uphAP3Hw+Eoo3CwzqvTjdxgWiYfX/0+p75/G9uWlplU7OK0qD85u6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769428016; c=relaxed/simple;
	bh=Ujl9YS0+fZ7IiZ9W7k222CK/XsTemUSZY78aIMY8+Tw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vC2xmiCTrPHj5xjkfpdHGztOa/7l8swYk+HvCEQ057Gb4CzUofUoqCkyKUVTUgWPGRi6fSmgEUzjyhm+QfZnJyObtzFMZQTTaNyT1zlM5KoMoe1PonSR5o7XjQuCr1ohiStPeBHufYlLIaHd9M+uQn3jMZyIgRakPw2/iqJjbhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz1t1769427929t1c42b85a
X-QQ-Originating-IP: Rfa6DbbZm+1vuZAT/eJ6XIX9TSNim9BfhYRpLc/O2Js=
Received: from [127.0.1.1] ( [183.250.239.212])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 26 Jan 2026 19:45:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6064080622083273045
EX-QQ-RecipientCnt: 10
From: Junhao Xie <bigfoot@radxa.com>
Subject: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
Date: Mon, 26 Jan 2026 19:44:50 +0800
Message-Id: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WMTQ6DIBBGr2Jm3WkGag105T0aFwhjZaE00BAbw
 92L7rt838/bIXH0nODR7BA5++TDWkFeGrCzWV+M3lUGSbIjITtMdsH0CdHUKksk00431kSjUlB
 P78iT307hc6g8+2P8Pf1ZHOlfVRZIqJwZ3V23TivbR+M2c7VhgaGU8gNAyoWXrAAAAA==
X-Change-ID: 20260126-scm-storage-v2-0a4f3e900b88
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>, 
 Junhao Xie <bigfoot@radxa.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769427927; l=2625;
 i=bigfoot@radxa.com; s=20251219; h=from:subject:message-id;
 bh=Ujl9YS0+fZ7IiZ9W7k222CK/XsTemUSZY78aIMY8+Tw=;
 b=eTaCv1zhLOp9/ViZssM8iZQ0NAXPcsbDsYt3CfvHBkhprUeu6zrvnS0FBXELUgVSno2YpGVCQ
 VsauMzQYCK1CVz1X4SgsZWExaspZy+rQlsWszN+lGw6mFHLIydjMBEJ
X-Developer-Key: i=bigfoot@radxa.com; a=ed25519;
 pk=aP5LX0jneuAa4pTVEww/6IbMlyp5VzzCwzcbMt1cpeI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NVi1raGH3MCScA7tli4eeDVw+6YKUdFdzzZQG+JoU8clDXJCADv2jo/x
	Ld+St6/jDBZzBrXT9qO+l11X+JAkK3BQOdyBnSi0O31YDYVwh85IuN70944uICLarikrgYU
	hbv7+GRHGCrvyitIc9Vs4+L79TpjdjtY6WjhB6JJgbLWjHO++OhZUW4L8r2S4O9p842JfnM
	/Qe+oyZMPvKCG8yEt16NWI0gcJAxmsKx2ebyQ9GnXSaW4H2+BwcsF9+5Klfs2HzjDxv009z
	5qgTcsrehcwjxkC5F63bMZSqi9Gtq5UKVdCwxSjyVT7DhpsPSFpUI6KS2RZCI5tYKa8WTqu
	CuX5umbDlWy2bkZeh/l17V60tuozUnpc9m3UE/jK4LzcmKtT3iMSimQMCxdTHeDg15ROJ77
	sz5eBnbgtYvcO2q1WOg713eFvg0DlIMt0shiKCIrsxCc2rNddxFcg2PQ0je5DZ7++yuUpsq
	eUrplPBbMp0+IwvqaOkTS2bSDGbroYacl4Oj7nj6GZfjqy8QOnMNZnA4KEeopLUzX6DjWJb
	NJD2oYS8go/tDe1XbvHUp6+NUAVwWHV/dfIU0nNJ0DVIy2rhuKBXzjM+HF0frrYUOJxANjc
	d1TdfXi9GpvlmCKvyJcbrR/THkP6o52lNOopsEmZGqlgRNphFRxrRM1ByUSZJF6LM3JRLuN
	UQb7eYZO3mZUwIP2WzTp6XLz4R1+MbjjxvwFLMYyXfKb2PSI5/1M0LdltfpZsUehRTs8+Ya
	iB6ynLnnGz463GCGIIwvNWVpZ1K3ooDGuHDiTtX7rGvYhkR53un6z3f2TQROFjC+MKz5uU/
	4CaqzUu3EztVEDyFogOaO1VvbtzuaMc199Z3HYce/gnwuBLwARKva7qOJRRxRLt8IHB6DHx
	xtDSZLJPaOswgRlPUYO0EAam20X6ToBfYsUPTMhaSqR0MKYKvf9zeIrx403AeWjkI7ZoTW/
	XYM6yRzfLd/eJnU1Ge/WC+Ox4EShWYojFCL6gLAWr9U+n+BuDcVGey0hUl1qZje6uKGD66p
	7eV8CNEp+2p3FmGu0SaoUAoc5WL5x/AmIQ1GOtzS3XgvESwzjX43Icj3HnB/GmZHpKK8KE8
	tof0/b8Ee9lV4q15S/AlW16RTgXk8tB6U6ims3O8b98U1K1JTkAIVt9D7yejCp745HcG+WU
	SAnS
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigfoot@radxa.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-90538-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 09E7287CD2
X-Rspamd-Action: no action

This patch series adds support for accessing storage devices managed by
Qualcomm TrustZone firmware via SCM (Secure Channel Manager) by
introducing a new MTD driver.

On some Qualcomm platforms, firmware or BIOS-related storage (typically
SPI NOR flash) is not directly accessible from the non-secure world.
All read, write, and erase operations must be performed through SCM
interfaces provided by the secure firmware. As a result, existing MTD
SPI NOR drivers cannot be used directly on these systems.

This series introduces a new MTD device driver that exposes such
firmware-managed storage as a standard MTD device in the Linux kernel.
The driver is built on top of the existing Qualcomm SCM infrastructure
and integrates with the MTD subsystem to provide a uniform interface to
userspace.

This driver has been tested on Radxa Dragon Q6A, based on the Qualcomm
QCS6490 SoC, with a Winbond W25Q256JWPIQ SPI NOR flash device.

Note that this platform previously used the standard Qualcomm Linux
firmware, which allowed direct access to the QSPI controller without
needing this driver. However, we plan to migrate to a Windows-compatible
firmware which is more feature-complete but restricts direct access.
Device tree changes for this transition will be sent separately.

If kernel boots with EL2, access to the SCM storage will be denied. This
needs more investigation.

Changes in v2:
- Convert enum qcom_scm_storage_result to macro definitions
- Use __qcom_scm_is_call_available() instead of a machine allowlist
- Add missing __packed annotations and endianness handling
- Introduce struct qcom_scm_storage_payload to improve readability
- Always compiled-in qcom_scm_storage_send_cmd() and qcom_scm_storage_init()
https://lore.kernel.org/lkml/F138514E18CB55B6+20251218180205.930961-1-bigfoot@radxa.com/

Tested-by: Xilin Wu <sophon@radxa.com>
Signed-off-by: Junhao Xie <bigfoot@radxa.com>
---
Junhao Xie (2):
      firmware: qcom: scm: Add SCM storage interface support
      mtd: devices: Add Qualcomm SCM storage driver

 drivers/firmware/qcom/qcom_scm.c       | 161 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   3 +
 drivers/mtd/devices/Kconfig            |  17 +++
 drivers/mtd/devices/Makefile           |   1 +
 drivers/mtd/devices/qcom_scm_storage.c | 265 +++++++++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h |  34 +++++
 6 files changed, 481 insertions(+)
---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260126-scm-storage-v2-0a4f3e900b88

Best regards,
-- 
Junhao Xie <bigfoot@radxa.com>


