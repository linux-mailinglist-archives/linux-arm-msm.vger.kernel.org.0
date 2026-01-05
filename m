Return-Path: <linux-arm-msm+bounces-87397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E84CF2EFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 11:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7D563004223
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 10:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04DB2F3620;
	Mon,  5 Jan 2026 10:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ndi1PNNh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8592F0C76;
	Mon,  5 Jan 2026 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767607985; cv=none; b=SLKqdvEVSCkUrtrn2UyOmrJOMivezSWdC5KtqZfDZLmaop5rQDDucCbZDbOyVtFzSg7Pmgwq5b9Lo098YVoyCQCfi1Tt+P5/z4CrRuRUkIQW0iBQ+JSaxAszuabfvuyzxnf5SW3Un9mWCA0O1F/PKBd66mmTqUsgaH7nBPCtdRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767607985; c=relaxed/simple;
	bh=QOd6975WCyo0eSf7E49gF/uHFYBsFU5cpPwnL0AOp6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gcVGtIJtn2FJ3N0hAKROge7Mphh58NkqkcU6rQTE/wDRPe3ZRBFsxNVAJzZUt8iTgsX8qdd3fk2rHk8OHMfCashpQWNyuZuvTkfoHTeNyj/pFikM1FKGdi5vdJzVpRQuB/ePLRf4eT2uQEt5EmdR695w8WaHmjgCnf0JmWUJKy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ndi1PNNh; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=rf
	PeyeSaYFGuyVfZjYDmodvgFrpI7db2grmXCZP9UU4=; b=ndi1PNNhsokrM9wpHV
	6vfT/C5Ho2RBHi4faPbJ9R16xn+zUxz7zXbPvcwkRe+vsOKjbvIm1yOdoLU5PdBO
	bwJLYt9DtRnmHM7gJ01YBIWoSXSbSyjMPv7iE1NSQbkGoeY8KP4zF6Wg25ZWyJdJ
	amJbgMsy5y/8BufuM5+PQaE9Q=
Received: from dev.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3n_2ZjltpZDCvEw--.23440S2;
	Mon, 05 Jan 2026 18:12:43 +0800 (CST)
From: weifu wu <wwfu06@163.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	weifu wu <wwfu06@163.com>
Subject: [PATCH 0/2] Add Acer Swift SFA14-11 DT and bindings
Date: Mon,  5 Jan 2026 18:12:36 +0800
Message-ID: <20260105101239.2591419-1-wwfu06@163.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n_2ZjltpZDCvEw--.23440S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr13urW7GFW8tw4xCw15urg_yoWDKrgEka
	s2k345Aa1xAFWvvFW5KF15JrW3GrW2q3s7A3WUXw1kX348Aws8GFWqq3s2kFy8Gw4Fyrn3
	XF1Fyr4kursFgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUb18DUUUUU==
X-CM-SenderInfo: pzzi3iqw6rljoofrz/xtbC2xz71mlbjpwupAAA3A

 This series adds initial device tree support for the Acer Swift SFA14-11 laptop based on the Qualcomm X1E78100 SoC.
 
 Patch 1 introduces the DT binding documentation for the new board compatible string.
 Patch 2 adds the device tree source file and updates the Makefile to include it.
 
 The device tree enables basic peripherals including the eDP panel, backlight, USB and PCIe.
  The changes have been tested by building dtbs and booting on the target hardware, with display and backlight verified via eDP.

 The first attempt to submit the patch failed due to an SMTP server error. The patch is being resubmitted with a different SMTP server configured.

weifu wu (2):
  dt-bindings: arm: qcom: add Acer Swift SFA14-11
  arm64: dts: qcom: add Acer Swift SFA14-11 device tree

 .../devicetree/bindings/arm/qcom.yaml         |    7 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../dts/qcom/x1e78100-acer-swift-sfa14-11.dts | 1650 +++++++++++++++++
 3 files changed, 1659 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-swift-sfa14-11.dts

-- 
2.48.1


