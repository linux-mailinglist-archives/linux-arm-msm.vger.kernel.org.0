Return-Path: <linux-arm-msm+bounces-23381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB22791094E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 17:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7E932823DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 15:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454AD1B0109;
	Thu, 20 Jun 2024 15:08:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF111AD486;
	Thu, 20 Jun 2024 15:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718896094; cv=none; b=NVHChWafi8lseB08D8wX5wMq+os0sEr3BxZ7MU81BpF2T1aKnIlJ9T8ldHyJBM7nzyLFHPBDFXr3QgZPvf/NwwqoHFFW8YwNUfXK0Gi90dn6ACu31u0JOEeTzo+6aWXuosLynhEE/0+bL78PFbEdcvxTMw83uaM2PNn3JrYgsi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718896094; c=relaxed/simple;
	bh=1LTnd0+K0uwlyQFAdEjs3Uz+oYwPuiQS3UghjjYSi3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nr6+Ud1EGESF3oVyNCkR6YLRnBw1HhvDvXiIyJx71tKpsz3QoiwTddEHYDo+i48IvpxrstAHcmMDwN8RhL2039yGPNNCXMvIhc+ClVJ1zrbEBxEOQDL9alQkLQAuw+s7yQwqVS/F1JcaClOJZIFDxWDN+Zm3wJNab8Y67P7NqbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c01:9890:db34:2f44:25db:ea3c])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 14CF67E0195;
	Thu, 20 Jun 2024 23:01:32 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v6 1/2] clk: qcom: gcc-ipq6018: update sdcc max clock frequency
Date: Thu, 20 Jun 2024 23:01:21 +0800
Message-Id: <20240620150122.1406631-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620150122.1406631-1-amadeus@jmu.edu.cn>
References: <20240620150122.1406631-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSk4ZVh4ZTkhMTR5KQ0lDQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtKQUJDQktBHxlIT0FJHU9PQUlOHxlBHhpIGFlXWRYaDx
	IVHRRZQVlPS0hVSktJT09PS1VKS0tVS1kG
X-HM-Tid: 0a90362aca0003a2kunm14cf67e0195
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nww6NSo5MDNWEkxREz8hPS4S
	LFYaCypVSlVKTEpDQ0JOTUJJTE1MVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0pBQkNCS0EfGUhPQUkdT09BSU4fGUEeGkgYWVdZCAFZQUlKSk83Bg++

The mmc controller of the IPQ6018 does not support HS400 mode.
So adjust the maximum clock frequency of sdcc to 200 MHz (HS200).

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 drivers/clk/qcom/gcc-ipq6018.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
index 7e69de34c310..6c764e3e2665 100644
--- a/drivers/clk/qcom/gcc-ipq6018.c
+++ b/drivers/clk/qcom/gcc-ipq6018.c
@@ -1617,7 +1617,7 @@ static const struct freq_tbl ftbl_sdcc_apps_clk_src[] = {
 	F(96000000, P_GPLL2, 12, 0, 0),
 	F(177777778, P_GPLL0, 4.5, 0, 0),
 	F(192000000, P_GPLL2, 6, 0, 0),
-	F(384000000, P_GPLL2, 3, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
 	{ }
 };
 
-- 
2.25.1


