Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49E0F6B9524
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 14:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbjCNNC0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 09:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232233AbjCNNBw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 09:01:52 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496E7AB8AE
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 05:57:35 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id n2so19846692lfb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 05:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678798572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3hMvSC+BwObtW4Q8mntRdXujCz2/mPi6i3Y7x4GRtLU=;
        b=PiaAt0UyYAO5nF6bBvEvzGBk0bnkTJmi8qbVJvHyAs1DwnTG2XllL+BoysCWsK59a/
         q0lgTplVbn//IP3Z/2UynB+qlP8BLTqx0o4dwqJOTBuzGjssaL8k9VhfjrghYbAqeGj2
         53EszeJdxlbXR3srZ1Sa1oYIEW37VqbGj+8Ta+hkO5wJyNpnjvdf+NjBXRlZi51za/Sz
         G6oX5352BjAfowCZxQZufK28z/B1QT63Azr2ggzRlJmgC2H1i9mVPURF8k5QYJohPCN9
         FVExYyQsY5NIM1d50yH+QmTZ4bnuydUb3dzpa4DO6JAd7e1JiWVqf+OPiq7UG6/45u3D
         iCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678798572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hMvSC+BwObtW4Q8mntRdXujCz2/mPi6i3Y7x4GRtLU=;
        b=BvZH0yT4vu6gbKx1gYZmGbOubSavr3IROIUMPrE3mxd6JgwKQw4VKdRK59v/TP8rtc
         FkrtiSthU3LYZF9Mo+n2Jync6OlKmxK5yvQHdUqEL5Cdyuyv5NvhN9gB8X8NVoRrXpmD
         cFl8qeJzm6SnH3OACrea1uD5O4MkQIJGBHT20kHSG1OJ3+5DHs6BmIk66MS59KfvPuHP
         uWGlaQa6ltpsQJSDh0RJJnICWjNLYEHWevPvURzp3j6j4FrPIpGm5qNjisZVo5c06RAP
         eotBDOl1n1F0gbJOgusb+zWBO2syBiDss6BeW/LEeqIf5RIJezrrqVHIa470oM+n7UXP
         xRKw==
X-Gm-Message-State: AO0yUKXcNwf4BS9QZo2feF7C8b90urvvJ+lyLYSarLYZkDv70+tPDPl1
        8S0gJ0iuzl6yeJFa56k+GthH0+Joi5JUqqIfdPs=
X-Google-Smtp-Source: AK7set8/DJoCwgP0J+uo3ZeC5Z0xvLjgMcq+y3wtuX2Fh5hnwrqDAasTBg1ziDk3I3Lx1nmwfuB68w==
X-Received: by 2002:ac2:485c:0:b0:4b3:d6e1:26bb with SMTP id 28-20020ac2485c000000b004b3d6e126bbmr641299lfy.29.1678798572659;
        Tue, 14 Mar 2023 05:56:12 -0700 (PDT)
Received: from localhost.localdomain (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id y24-20020ac255b8000000b004e670ce364bsm389031lfg.277.2023.03.14.05.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 05:56:12 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Qais Yousef <qyousef@layalina.io>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Tobias Klauser <tklauser@distanz.ch>,
        Vasily Averin <vasily.averin@linux.dev>,
        Colin Ian King <colin.i.king@gmail.com>,
        Kirill Tkhai <tkhai@ya.ru>, linux-kernel@vger.kernel.org
Subject: [PATCH] mailmap: map Sai Prakash Ranjan's old address to his current one
Date:   Tue, 14 Mar 2023 13:56:03 +0100
Message-Id: <20230314125604.2734146-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sai's old email is still picked up by the likes of get_maintainer.pl
and keeps bouncing like all other @codeaurora.org addresses. Map it to
his current one.

Cc: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index bc213f9eaf6f..3c7f00496072 100644
--- a/.mailmap
+++ b/.mailmap
@@ -398,6 +398,7 @@ Ross Zwisler <zwisler@kernel.org> <ross.zwisler@linux.intel.com>
 Rudolf Marek <R.Marek@sh.cvut.cz>
 Rui Saraiva <rmps@joel.ist.utl.pt>
 Sachin P Sant <ssant@in.ibm.com>
+Sai Prakash Ranjan <quic_saipraka@quicinc.com> <saiprakash.ranjan@codeaurora.org>
 Sakari Ailus <sakari.ailus@linux.intel.com> <sakari.ailus@iki.fi>
 Sam Ravnborg <sam@mars.ravnborg.org>
 Sankeerth Billakanti <quic_sbillaka@quicinc.com> <sbillaka@codeaurora.org>
-- 
2.39.2

