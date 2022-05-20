Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83EE752F36F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 20:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352592AbiETSzk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 14:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241499AbiETSzk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 14:55:40 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0474C135688
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 11:55:39 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id s12so6101016iln.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 11:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mArRYaTet79qWg4aT9i1BQ1Oc2erEeN8pNlKbQRrR8M=;
        b=ualBrRcP7e+k3KUn4GLZFLrV4hds2YoxfDqoZT4BCfFzHutom6S7aq5JQBbNWB2rEY
         66G6X0m0aSs+ezMF7U1Wo3jZsVuw5RK41NkNGi6+O26qiPWukbexQhe8Y+5blVHBdrAG
         6QFP6mSVN5g/A+Vc1OFn4OYShocnh/D+29QQOgEv2SyRSjLoJwDahRN+84S2HrBt+LSV
         Ah7fhEgNkGlXuZK6CiAe49i2XCFbwMB1r26f0ncWKQUgwnr4BIiC8tZ4tQzgpX2Fvgxj
         uzHE0c1Op/w07A/R5P5Eph1LjyOjmKHk44pusKFzHDGxQJ+XSrCzzy5T6ziYSZ2Fd7DS
         LK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mArRYaTet79qWg4aT9i1BQ1Oc2erEeN8pNlKbQRrR8M=;
        b=Hvz++RupyRQfaOgeY26+jOll0CaMSozL/M2IaBv91ZZZi3cGQ2eCC0cq1PDcGPuFtR
         fih1QM9mbV17O24uvGlcoMPfdJWbDEQjvwuS00FSUdwXbSEOYvbq1sHvKtvEUJkvFgdZ
         vk9JY2jIkbWbnKmLEy9Y6a1rhtoIo28RCX9cozzaAnDlMAsc7rHcTzB7KB3Tbo/wppUH
         hxEe4/vSDevetmztCFxtvCbzWWtm4zYCUfJTK+1xKfIfb9BAXhE3JJuHfRghRhXWanIS
         Db6kxZdNe+JOPlynjeBEkUqUvuIH1cn0t4u1/zQy9FDVxLBaswGHKN8xkYfrvUPwHEM+
         vqiA==
X-Gm-Message-State: AOAM532V1fOFrCs8oHECBOKSr2IgSUqugdRDNzw7JZAUO8OvrCjYbaal
        UBzcepGFriSUTxf91u8z1HEHkA==
X-Google-Smtp-Source: ABdhPJyn02gAnxK9OJvftt8ECl1MUwilfMuKGB16c3fHt8iVQAeGsszKjr64c5TGzT95+uD0u20IbA==
X-Received: by 2002:a05:6e02:1ba1:b0:2cf:232b:aa85 with SMTP id n1-20020a056e021ba100b002cf232baa85mr5903826ili.2.1653072938366;
        Fri, 20 May 2022 11:55:38 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id a6-20020a056638058600b0032b3a7817acsm871958jar.112.2022.05.20.11.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 11:55:37 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/8] net: ipa: a few more small items
Date:   Fri, 20 May 2022 13:55:25 -0500
Message-Id: <20220520185533.877920-1-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series consists of three small sets of changes.

The first three patches allow a few endpoint features to be
specified.  At this time, currently-defined endpoints retain the
same configuration, but when the monitor functionality is added in
the next cycle these options will be required.

The fourth patch simply removes an unused function, explaining also
why it would likely never be used.

And the last four patches refactor code related to IPA immediate
commands, eliminating an unused field and then simplifying and
removing some unneeded code.

					-Alex


Alex Elder (8):
  net: ipa: make endpoint HOLB drop configurable
  net: ipa: support hard aggregation limits
  net: ipa: specify RX aggregation time limit in config data
  net: ipa: kill gsi_trans_commit_wait_timeout()
  net: ipa: get rid of ipa_cmd_info->direction
  net: ipa: remove command direction argument
  net: ipa: remove command info pool
  net: ipa: use data space for command opcodes

 drivers/net/ipa/gsi.h             |   1 -
 drivers/net/ipa/gsi_trans.c       |  38 ++--------
 drivers/net/ipa/gsi_trans.h       |  24 +++---
 drivers/net/ipa/ipa_cmd.c         |  78 ++++++--------------
 drivers/net/ipa/ipa_cmd.h         |  11 ---
 drivers/net/ipa/ipa_data-v3.1.c   |   2 +
 drivers/net/ipa/ipa_data-v3.5.1.c |   2 +
 drivers/net/ipa/ipa_data-v4.11.c  |   2 +
 drivers/net/ipa/ipa_data-v4.2.c   |   2 +
 drivers/net/ipa/ipa_data-v4.5.c   |   2 +
 drivers/net/ipa/ipa_data-v4.9.c   |   2 +
 drivers/net/ipa/ipa_endpoint.c    | 119 ++++++++++++++++++++----------
 drivers/net/ipa/ipa_endpoint.h    |  23 +++++-
 13 files changed, 149 insertions(+), 157 deletions(-)

-- 
2.32.0

