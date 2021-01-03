Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B71F2E8C66
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jan 2021 14:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbhACN5N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jan 2021 08:57:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:35096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726163AbhACN5N (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Jan 2021 08:57:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB7E9208C7;
        Sun,  3 Jan 2021 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609682192;
        bh=/ukaI8TKo+cDOQeZ82bimBKorxyRnnfYUNmKR5e2BRw=;
        h=From:To:Cc:Subject:Date:From;
        b=Ps595AIpuc4iWk4cw5FK1zOO8MgStHLU1lL3uDXmXmf8RmzDX1cARZU0cBVLORyNG
         gLzb8uGC5NJOL0oBbghHW8TQwBTUl+cvF8pKJb9vmrXII3p7ie/Mp2WfpVyyTHwEAA
         ouxdfn9LH7NZYKOHx1EJrGSW1YboAUy4cWbb4T4i2CztIMZpwibOd7PgH1h87j5rPv
         +gRUNZizOXALFIlDMrXUlTxC8btcrWeYLvbZlu9XDjr7CYRQwNjCXdsjKKNfkIb79x
         QHFol/jd2ut0EA8+TyRjqqF51VwCGlYhyZBEYb/lUoXaDw9OYC0F2Ko1N5cIx0y9+O
         4yE5Yxgrr2wyQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: qcom: pil_info: avoid 64-bit division
Date:   Sun,  3 Jan 2021 14:56:12 +0100
Message-Id: <20210103135628.3702427-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

On 32-bit machines with 64-bit resource_size_t, the driver causes
a link failure because of the 64-bit division:

arm-linux-gnueabi-ld: drivers/remoteproc/qcom_pil_info.o: in function `qcom_pil_info_store':
qcom_pil_info.c:(.text+0x1ec): undefined reference to `__aeabi_uldivmod'

Add a cast to an u32 to avoid this. If the resource exceeds 4GB,
there are bigger problems.

Fixes: 549b67da660d ("remoteproc: qcom: Introduce helper to store pil info in IMEM")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/qcom_pil_info.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom_pil_info.c
index 5521c4437ffa..7c007dd7b200 100644
--- a/drivers/remoteproc/qcom_pil_info.c
+++ b/drivers/remoteproc/qcom_pil_info.c
@@ -56,7 +56,7 @@ static int qcom_pil_info_init(void)
 	memset_io(base, 0, resource_size(&imem));
 
 	_reloc.base = base;
-	_reloc.num_entries = resource_size(&imem) / PIL_RELOC_ENTRY_SIZE;
+	_reloc.num_entries = (u32)resource_size(&imem) / PIL_RELOC_ENTRY_SIZE;
 
 	return 0;
 }
-- 
2.29.2

