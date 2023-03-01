Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F46B6A6B3A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Mar 2023 12:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjCALAY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Mar 2023 06:00:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbjCALAX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Mar 2023 06:00:23 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2396311C2
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Mar 2023 03:00:21 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id m7so17071649lfj.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Mar 2023 03:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677668420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DFtqc6k2ZbhyHcHm9I7k7RBkTVscIW6C9WabCc6elf4=;
        b=RjQd2oX8xNaWrk0IzHz3nPriXlGkICC+eKj6d4VeywqMp8cHMG4BIXiJOzcGH7UGYL
         BA1FCxP1tR2Y1BIcptspMtr7zMZtFLXHqe40cSnPOGVWw6QUXHSVBwogkxqTUk9c08b1
         S/9tpEsy5jhWKWKJELBWfg9m0OSEnip8+t48foVY+rrvneWzNZr0Vnp32BQQkmI23PaW
         416Nho1LviyPIpLkG0QgJaEYNKDMCwX7gsMVwpsbAsLfCQlk1GmApIRctlT7R5iMXKGT
         +VO6C9lV/nmNbHkHrcYxB7I8kxNL3NKm+/S1VqNwzW5KE9RVEKLub+ZXSt+MLsW0mHep
         vevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677668420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFtqc6k2ZbhyHcHm9I7k7RBkTVscIW6C9WabCc6elf4=;
        b=3ePG2+obhz0oSbY4z/HOW9+na2GZRmS+nYZCB3x3nUTzHbck8j6mQxdr1jVcVRSuT/
         0y8Xt0PE8rXVWwYx/YwJDkIc6SYNItac0jxmilEPfkVQsu6yIsl9dKqRjvP9XwYqQ5Dj
         lk6iY/daS0UlzHb6anv85GCIkYzx7Q69o9olqklPAXOAHmLb4gCKG/5RNiYQadam76DR
         JHIJUQe0379HFyZgKdaaSlUYyZxeAkXPj4zUEpPJJ+8QD+5pWcTnsdMApaPrTzeVWYNK
         RKvUcBDwzcIhqqqTKCTa6Qsby2UyamZDzDZIjyKYFDaYUizhmFcfZECmYaFvB6gE4IJI
         EoPw==
X-Gm-Message-State: AO0yUKXRa9bF4/1mXAWFj4nZChJVpWm5EDc2LriDDPvDlX7hnGLPw4/E
        wMcMjJFN2ONGg72jjP5pbcZX0ePAgzNX9Y+s
X-Google-Smtp-Source: AK7set8xUjrT6ZaFNF5YW1ChmAEKiKf8+LzWaos/eGhmKhpk56SrxaYEJLRj+Dd2VXub1tdbQm0k+w==
X-Received: by 2002:a05:6512:3d90:b0:4dd:a74d:ac46 with SMTP id k16-20020a0565123d9000b004dda74dac46mr1611641lfv.0.1677668419798;
        Wed, 01 Mar 2023 03:00:19 -0800 (PST)
Received: from localhost.localdomain (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id u13-20020ac248ad000000b004cafe65883dsm1686253lfg.122.2023.03.01.03.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 03:00:19 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Qais Yousef <qyousef@layalina.io>,
        Arnd Bergmann <arnd@arndb.de>,
        Vasily Averin <vasily.averin@linux.dev>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Colin Ian King <colin.i.king@gmail.com>,
        Kirill Tkhai <tkhai@ya.ru>, linux-kernel@vger.kernel.org
Subject: [PATCH] mailmap: Correct Dikshita Agarwal's Qualcomm email address
Date:   Wed,  1 Mar 2023 12:00:12 +0100
Message-Id: <20230301110012.1290379-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I recently sent a patch to map Dikshita's old CAF address to his current
one @ Qualcomm. It turned out however, that he has two of them, with the
@quicinc.com one meant for upstream contributions. Fix it.

Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .mailmap | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 5367faaf7831..8902a5f74a32 100644
--- a/.mailmap
+++ b/.mailmap
@@ -121,7 +121,7 @@ Dengcheng Zhu <dzhu@wavecomp.com> <dengcheng.zhu@gmail.com>
 Dengcheng Zhu <dzhu@wavecomp.com> <dengcheng.zhu@imgtec.com>
 Dengcheng Zhu <dzhu@wavecomp.com> <dengcheng.zhu@mips.com>
 <dev.kurt@vandijck-laurijssen.be> <kurt.van.dijck@eia.be>
-Dikshita Agarwal <dikshita@qti.qualcomm.com> <dikshita@codeaurora.org>
+Dikshita Agarwal <quic_dikshita@quicinc.com> <dikshita@codeaurora.org>
 Dmitry Baryshkov <dbaryshkov@gmail.com>
 Dmitry Baryshkov <dbaryshkov@gmail.com> <[dbaryshkov@gmail.com]>
 Dmitry Baryshkov <dbaryshkov@gmail.com> <dmitry_baryshkov@mentor.com>
-- 
2.39.2

