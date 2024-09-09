Return-Path: <linux-arm-msm+bounces-31308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A24DB9719B1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 14:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6100D28543D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 12:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C5F1B78FD;
	Mon,  9 Sep 2024 12:43:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A031B375C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 12:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725885790; cv=none; b=ienYzN6SFzi1mQfTbhqiO7R/RSzVD4KfqiaZ+Lv/BzgDSEh4wFQTmqFosIHKlaU8RinLcZk79fqexNHzB7PgIccGndXockqXb5GNIXeX2MU+2VWj3aWs4mEcr0vLjwyaGj//Y8ZIdy/2g2bQjzGl5xEuhAs8xdhx9t2bbwMs6/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725885790; c=relaxed/simple;
	bh=ZWZLogIUe146/2cs2vQVdRscfzhJS64XNekjxhkZo3w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CJVfqLsATgT5s/PO9akj45HMFtZzIbOFEEeifDhxaC1MTI/q7+5nhKpjB8io5vFSLKOhZMCM/e6bP73Icl/TR7mpEHppfQ2aqEF54sTE7LCDikbfQu8gGr1tdSbNi9516VCpWsVdZ9N5hOvu94M+Se5/AqVDl3TsmSckzhz1sZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X2RLk72kWz1j8Mc;
	Mon,  9 Sep 2024 20:42:38 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id A58501A016C;
	Mon,  9 Sep 2024 20:43:05 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Sep
 2024 20:43:04 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-aspeed@lists.ozlabs.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH 0/4] Simplify code with dev_err_probe()
Date: Mon, 9 Sep 2024 20:29:17 +0800
Message-ID: <20240909122921.12627-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)

Use dev_err_probe() to simplify code, and we can avoid judging
if the error code is not equal to -EPROBE_DEFER

Zhang Zekun (4):
  soc: qcom: rpmh-rsc: Simplify code with dev_err_probe()
  soc: aspeed: Simplify code with dev_err_probe()
  soc: qcom: smem: Simplify code with dev_err_probe()
  soc: qcom: smp2p: Simplify code with dev_err_probe()

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 10 ++++------
 drivers/soc/qcom/rpmh-rsc.c           |  9 +++------
 drivers/soc/qcom/smem.c               |  8 +++-----
 drivers/soc/qcom/smp2p.c              |  9 +++------
 4 files changed, 13 insertions(+), 23 deletions(-)

-- 
2.17.1


