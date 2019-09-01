Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4E2A4C49
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2019 23:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728891AbfIAVax (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Sep 2019 17:30:53 -0400
Received: from onstation.org ([52.200.56.107]:48100 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728773AbfIAVax (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Sep 2019 17:30:53 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 78BEA3E993;
        Sun,  1 Sep 2019 21:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1567373452;
        bh=Zamozm0CnNg3m9y2HsnLTS1dXVZIfN56PD4UedvYoz0=;
        h=From:To:Cc:Subject:Date:From;
        b=MY7eT/Sw7QTSp8Ub9ouPBLRLKMK4EDxpfb/wOds4fJogOnuNENG7xFfcDOYkKOeoX
         35sXYnZQ0dfCxCd3AiY2uF3vYi3epuB+4rdIJqAc4WlZwHBPeUt0ZZ++XFU7ieAmZq
         BnbsFScUwPYY7LCk4V/ydR90ErsDmUSrJ0H5IicE=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH] soc: qcom: ocmem: add missing includes
Date:   Sun,  1 Sep 2019 17:30:37 -0400
Message-Id: <20190901213037.25889-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The kbuild bot reported the following compiler errors when compiling on
MIPS with CONFIG_QCOM_OCMEM disabled:

  In file included from <command-line>:0:0:
  >> include/soc/qcom/ocmem.h:43:49: warning: 'struct device' declared
     inside parameter list will not be visible outside of this
     definition or declaration
      static inline struct ocmem *of_get_ocmem(struct device *dev)
                                                      ^~~~~~
     include/soc/qcom/ocmem.h: In function 'of_get_ocmem':
  >> include/soc/qcom/ocmem.h:45:9: error: implicit declaration of
     function 'ERR_PTR' [-Werror=implicit-function-declaration]
       return ERR_PTR(-ENODEV);
              ^~~~~~~
  >> include/soc/qcom/ocmem.h:45:18: error: 'ENODEV' undeclared (first
     use in this function)
       return ERR_PTR(-ENODEV);

Add the proper includes to fix the compiler errors.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Reported-by: kbuild test robot <lkp@intel.com>
---
My OCMEM series [1] hasn't landed upstream yet so let me know if you
want me to squash this into the existing patch set. I made this a
separate patch so that the Reported-by could be included. The kbuild
report is at [2].

[1] https://lore.kernel.org/lkml/20190823121637.5861-1-masneyb@onstation.org/
[2] https://lists.01.org/pipermail/kbuild-all/2019-August/063530.html

 include/soc/qcom/ocmem.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/soc/qcom/ocmem.h b/include/soc/qcom/ocmem.h
index a0ae336ba78b..02a8bc2677b1 100644
--- a/include/soc/qcom/ocmem.h
+++ b/include/soc/qcom/ocmem.h
@@ -9,6 +9,9 @@
  * Copyright (C) 2015 Red Hat. Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/device.h>
+#include <linux/err.h>
+
 #ifndef __OCMEM_H__
 #define __OCMEM_H__
 
-- 
2.21.0

