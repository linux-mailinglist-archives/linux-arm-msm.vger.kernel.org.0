Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C26E6B720A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 10:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbjCMJG7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 05:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbjCMJGa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 05:06:30 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF01948E04
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 02:03:49 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id z5so11807346ljc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 02:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678698227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iu174ytUrTrCTEP4Asg2x55uLRT0uwJo4VNezGSxNOg=;
        b=AAcqzUyag82ddZqSchFoJY+B+X7N+YaZVsCOk3YCjNgercK0HJ6Q5kh6fg0cecFJBP
         wJuJNYz+bl2ip8B8OwU7ED3BFpNjwWFC6EOiFdHIKX1bVk6jJMxpIksoHl/wz38aQxSe
         8kpNSVGjZ8AdgxMDjQaGgHTAl5ikhC74jDbD9aRiI8MuhiuA+LkoabRjbunKFmtjgmEI
         2EtENRfZ2T/JT6wDgiftNFlR9I5tRcB2eXSNmUyvDLNgQU+FaqVjkcMdhseE59ybw1xL
         EG7D+U5z0FchLN70tm/pX+/U0MLF5KyILBYdkAVUGwIgArBKjFRAGcL2sQ3Q+uyD2gvW
         C6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678698227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iu174ytUrTrCTEP4Asg2x55uLRT0uwJo4VNezGSxNOg=;
        b=GI29EhVelYZMoovqfDvVbs8an16NPxD25hJt8MOwKqcDfwa8KeTd6+cBJbtKzCj0Jn
         4uapd+lIl1+n9k3ahlHVzLI9xNkuzDgWtV941pIXeuREni8z8gmwrn7qkfXpFkmutVUE
         Y9R7PKVNI2NMSzSVCcOWG/d7Tp7C2iS+7Ro850PahnFUOvFqgUVgtPkjXDHTqGrA4oIN
         5b3gP+dgVCM/nsz4+2PUjZG29xfK5t7av7hcpfjnklplOVVYXhsA0Hg5oeR6nRt8EGfw
         Uto50c558aGgEh+7ek6BHM2SzbbkuXsNdiY2NnV2N0s/9ogO5ZgRarazu5ITSgtZF75K
         jc2Q==
X-Gm-Message-State: AO0yUKWXTcgtYAENFM030ea0AhWmgCn5J/vhP1eYYVDDeo6Krwkuuujq
        5BGORNlp41M4gEj8y/AhfSAFmQGRWr2pv8NfXsk=
X-Google-Smtp-Source: AK7set8JdgYIMjhUu8MM/2F6YXBVJHA9y6vIZBap4DG76qGnHcXgoTNJrKBzfoyhgYmENoj5sU4NlQ==
X-Received: by 2002:a2e:544c:0:b0:293:5cce:56eb with SMTP id y12-20020a2e544c000000b002935cce56ebmr9124489ljd.43.1678698227436;
        Mon, 13 Mar 2023 02:03:47 -0700 (PDT)
Received: from localhost.localdomain (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id y7-20020a2e7d07000000b00293d7c95df1sm926182ljc.78.2023.03.13.02.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 02:03:47 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Qais Yousef <qyousef@layalina.io>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Vasily Averin <vasily.averin@linux.dev>,
        Colin Ian King <colin.i.king@gmail.com>,
        Kirill Tkhai <tkhai@ya.ru>, linux-kernel@vger.kernel.org
Subject: [PATCH] mailmap: map Rajendra Nayak's old address to his current one
Date:   Mon, 13 Mar 2023 10:03:43 +0100
Message-Id: <20230313090343.2148346-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rajendra's old email is still picked up by the likes of get_maintainer.pl
and keeps bouncing like all other @codeaurora.org addresses. Map it to
his current one.

Cc: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 94a4d32ccdf6..a7182bd90879 100644
--- a/.mailmap
+++ b/.mailmap
@@ -373,6 +373,7 @@ Quentin Monnet <quentin@isovalent.com> <quentin.monnet@netronome.com>
 Quentin Perret <qperret@qperret.net> <quentin.perret@arm.com>
 Rafael J. Wysocki <rjw@rjwysocki.net> <rjw@sisk.pl>
 Rajeev Nandan <quic_rajeevny@quicinc.com> <rajeevny@codeaurora.org>
+Rajendra Nayak <quic_rjendra@quicinc.com> <rnayak@codeaurora.org>
 Rajesh Shah <rajesh.shah@intel.com>
 Ralf Baechle <ralf@linux-mips.org>
 Ralf Wildenhues <Ralf.Wildenhues@gmx.de>
-- 
2.39.2

