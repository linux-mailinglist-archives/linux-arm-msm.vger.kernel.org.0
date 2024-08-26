Return-Path: <linux-arm-msm+bounces-29467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C934495ECF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 11:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 856B9282073
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 09:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33091145338;
	Mon, 26 Aug 2024 09:19:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F3813CA9C;
	Mon, 26 Aug 2024 09:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724663988; cv=none; b=BYf/A7hkaZukVws9qvY04rh1ZnVY2Vj80SJ6tU1kH/4ldTDQllOgtfgDzc6LdYl9vAk6E1PaSFw62PYeNfOthoIrD3yn2crYPfp+qEITC3GNpXh4CH9ZpGYxJB9xVTQasjM80Hf7eH1kZjRiXgzNwLfwWxwpf4xVeZIGBwm/KGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724663988; c=relaxed/simple;
	bh=qV8+CKwoO30VXOw+PKt182jD5HjXDob7z+JVG1PImm4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TC8DhaEBdqp6AJy4zOg7OKjD3AhvgDlHMjLi0Lnemj1YzmaiS2CABz6eQRUukm59BXP8M2iGijOSKL3j6c97LQqkvONsjMIqMvy5CcmeRNVyz69HJ1teOwhn70m6GKsGWyu42py/MoSnatJtN3yhEUNV0DAeh/78OVtYWyNiO58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WslV92TKXzpVsj;
	Mon, 26 Aug 2024 17:18:57 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 086F71800A7;
	Mon, 26 Aug 2024 17:19:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Aug
 2024 17:19:42 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <lee@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <krzk@kernel.org>, <jic23@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next RESEND 0/2] mfd: Use for_each_child_of_node_scoped()
Date: Mon, 26 Aug 2024 17:27:32 +0800
Message-ID: <20240826092734.2899562-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Jinjie Ruan (2):
  mfd: max77620: Use for_each_child_of_node_scoped()
  mfd: qcom-spmi-pmic: Use for_each_child_of_node_scoped()

 drivers/mfd/max77620.c       | 5 ++---
 drivers/mfd/qcom-spmi-pmic.c | 5 +----
 2 files changed, 3 insertions(+), 7 deletions(-)

-- 
2.34.1


