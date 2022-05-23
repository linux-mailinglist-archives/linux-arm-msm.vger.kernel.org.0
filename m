Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0934531D4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 May 2022 23:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiEWVEh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 May 2022 17:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbiEWVEe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 May 2022 17:04:34 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11E1C6C0CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 14:04:33 -0700 (PDT)
Received: from asfdasdfasdf2.riviera.ds.pw.edu.pl (riviera.nat.ds.pw.edu.pl [194.29.137.1])
        (using TLSv1.3 with cipher TLS_CHACHA20_POLY1305_SHA256 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA512)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 63C613F76D;
        Mon, 23 May 2022 23:26:45 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH] MAINTAINERS: Add myself as a reviewer for Qualcomm ARM/64 support
Date:   Mon, 23 May 2022 23:03:04 +0200
Message-Id: <20220523210304.19125-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f468864fd268..0eea3a655e42 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2520,6 +2520,7 @@ W:	http://www.armlinux.org.uk/
 ARM/QUALCOMM SUPPORT
 M:	Andy Gross <agross@kernel.org>
 M:	Bjorn Andersson <bjorn.andersson@linaro.org>
+R:	Konrad Dybcio <konrad.dybcio@somainline.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
-- 
2.32.0 (Apple Git-132)

