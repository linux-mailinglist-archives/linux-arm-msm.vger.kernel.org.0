Return-Path: <linux-arm-msm+bounces-87409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B9BCF3370
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 12:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55D353068DDF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 11:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6BD327BF8;
	Mon,  5 Jan 2026 11:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="G9MMI0gg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5F031A7F9;
	Mon,  5 Jan 2026 11:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767611093; cv=none; b=U5JwI85Y3Eew4WR0v7YtN9pI4x9cplaJHylDc0WuvQbQWZw+aht2ixN9ENuhBGRSnGiAymR+V8LLQjegqU0oGhzRfon0AZ3jxIT89ySHYxU/1Xe8cq9c/rukwX58+VJ57cSa8L9VDkjnZzWgGde55G+oxWFW1Uc5i37P2UIaH6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767611093; c=relaxed/simple;
	bh=Imjv1PXhz/o6TfTaCW4W+D7adYuQKFMC4BKxQdfVpWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nQ+gQ5HTZ0TcTfTlDbmHdNd7P99ZiKp8vPgLz84/HBuTFAl9bSAk6VE1nqlgaBHEEFLhsgAH/00Zd/9ExEwMELJypi7Dj53VgWHVSQidW7cBRtLBLo/IqdpbrJ75Db1diQ2/Mmg0mA9uyiknRLu9YsvOLTvna1EL4HHbjDs5d0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=G9MMI0gg; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ou
	dwWSrWL+K7S6NafCMbCM3DPqs1nNS87hkoMyq7o8U=; b=G9MMI0gg0yVjZrTSBb
	NdfrTbl2yzsAjrKmjz/i6o28KICc0zGtaZsBbg60Jos+Jna3J28Vz5//Peu97Ztf
	TxLilDL++9hgSgajCg05Oe9eItAwlWOmVuNqGUNMfYihVesWEBxJ0c2SjKIXOquA
	7Vhhu0AwWApR+CPYZ7+z+aRcc=
Received: from dev.. (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgA3NNDAmltpWvyCJg--.1020S2;
	Mon, 05 Jan 2026 19:04:35 +0800 (CST)
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
Subject: [PATCH v2 0/2] Add Acer Swift SFA14-11 DT and bindings
Date: Mon,  5 Jan 2026 19:04:29 +0800
Message-ID: <20260105110431.2596253-1-wwfu06@163.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgA3NNDAmltpWvyCJg--.1020S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFy7Ww1ftr1fAw1ruF4DJwb_yoWxKrbEq3
	4xW3yrJa1fAa10vFW5tF45Jry5Gr47urn7A3Waqr1kXF9rA398GFWqq3yakFy8Wr4Yyws3
	GF1rJF4kXrs2gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUb18DUUUUU==
X-CM-SenderInfo: pzzi3iqw6rljoofrz/xtbC+AMI4mlbmsOYvAAA3e

dt-bindings: arm: qcom: Remove duplicate const and add Acer Swift SFA14-11

Patch 1 adds the device tree source file and updates the Makefile to include it. [Unmodified]
Patch 2 introduces the DT binding documentation for the new board compatible string. [Modified]

weifu wu (2):
  arm64: dts: qcom: add Acer Swift SFA14-11 device tree
  dt-bindings: arm: qcom: add Acer Swift SFA14-11

 .../devicetree/bindings/arm/qcom.yaml         |    6 -
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../dts/qcom/x1e78100-acer-swift-sfa14-11.dts | 1650 +++++++++++++++++
 3 files changed, 1652 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-swift-sfa14-11.dts

-- 
2.48.1


