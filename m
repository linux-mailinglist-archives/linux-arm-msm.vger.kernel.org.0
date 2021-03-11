Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63573369B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 02:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbhCKBfi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 20:35:38 -0500
Received: from m12-17.163.com ([220.181.12.17]:47963 "EHLO m12-17.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229608AbhCKBfL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 20:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=5WoMy
        ZTHQdfaqA4EOcYW9rkD3AGGiDpAdh4AxhYcP50=; b=gpvH1ePN0uk4Fyj6Zz+14
        T/Vh7g61LCZwbkbfao6OYQdf7uJ2GSeqpysDqS5DBU4lrpiTUQSJC6cjZ8aWEHlc
        EKGYtzMA5bcD3qCEoHXzsrEEY+N4RkTezVaQ+ppNM3klTtimVunxgUebqCBDTfSZ
        XRVok8d+MzLEQU7FINcpC4=
Received: from yangjunlin.ccdomain.com (unknown [119.137.52.247])
        by smtp13 (Coremail) with SMTP id EcCowACnG4iqc0lgV70upQ--.50520S2;
        Thu, 11 Mar 2021 09:34:35 +0800 (CST)
From:   angkery <angkery@163.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Junlin Yang <yangjunlin@yulong.com>
Subject: [PATCH] firmware: qcom_scm: remove a duplicative condition
Date:   Thu, 11 Mar 2021 09:32:35 +0800
Message-Id: <20210311013235.1458-1-angkery@163.com>
X-Mailer: git-send-email 2.24.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowACnG4iqc0lgV70upQ--.50520S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF1kuF1kJF4UZFWrJw4xZwb_yoW3WFcEkr
        1xuF48WryjkrZ09r1DKFW3X3s5t3yDWwsagF12vw4ayFW7Zw4DXr97Z3y8ua9rJw1xZFy7
        Zr95Zr4rCw10kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnb4SUUUUUU==
X-Originating-IP: [119.137.52.247]
X-CM-SenderInfo: 5dqjyvlu16il2tof0z/xtbCBgtSI13I0-ETNQAAst
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Junlin Yang <yangjunlin@yulong.com>

Fixes coccicheck warnings:
./drivers/firmware/qcom_scm.c:324:20-22:
WARNING !A || A && B is equivalent to !A || B

Signed-off-by: Junlin Yang <yangjunlin@yulong.com>
---
 drivers/firmware/qcom_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index f57779f..5483416 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -321,7 +321,7 @@ int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 
-	if (!cpus || (cpus && cpumask_empty(cpus)))
+	if (!cpus || cpumask_empty(cpus))
 		return -EINVAL;
 
 	for_each_cpu(cpu, cpus) {
-- 
1.9.1


