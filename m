Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D318692684
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 20:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233030AbjBJThO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 14:37:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233355AbjBJThK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 14:37:10 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F2834F61
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 11:37:01 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id t7so970875ilq.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 11:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=07TRpjGJThNbRpil8R+GJhtN3IR78ky5A4wnbYV6tl0=;
        b=NXiAVz5tAANFIWUttw1fVhf07y5Gyv86EWH30F86zdMSRtWbMyolApo9MLj9c5EQb5
         TvXssifezqkdxxrUd9Ich0ZvF5AfiUEO9gSq7vMnrMAtKO49lkYiQ2QmrHIQZUB/UMWH
         rdwzrrfs0BquaANOsS5wJ2abuNi7gIBVR7V8EMk/89z41v8BJmeyhEkK1iO7VJZhI17M
         KzQPgkie15+Hn0HsY/Pzr0DZNdJ/GqslCZQSKr0SO5YAkwUedfsuAJ49MbjQc+JhHYQV
         ZOQWm8HKZhi5PYpi3sJwzWk1BKyEjB9zqIkoRjPUM8xROJkfE8sKRjYjsfyUNo5MH5f9
         NmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07TRpjGJThNbRpil8R+GJhtN3IR78ky5A4wnbYV6tl0=;
        b=iQgQbZhpZ0V0fP/uu1u0KcHGe855Xmo87kzcEoM9SzSsOdN+EkGZslWUh01o/11tPd
         zpyHqEB/Uv2ZrqUG6X/wTKE7EzfXUsv5p97vPkvWEVA8pKFXTVx+gwaUNQBQBNEh2cX2
         ybp4SZXexJMUYQ+Irv7crKEwsLXxHqyJRrjyaeP9oDXsgMIqVYb6AR7vKQqd/pWfGMqO
         9jmYh8h/MMqkkFMzZV1N2uNA9353z39AEsN8UpmFLfdvLMTGH00ANNA3ibm5Pybm8xWZ
         uGgXGytAU+J9Rii3fm7jILzJzp7xMYFNoWm8nRpPQydmaTWgvfiKkFfDycdv5MYE8v5w
         wDuQ==
X-Gm-Message-State: AO0yUKVhNYkmv2/oXces8ja5Y67L6WAO34RGddgB333N6SuQLdjZy6ba
        kmbZkKKj5+qWknGHqQ6Hn2ry2A==
X-Google-Smtp-Source: AK7set/LjN4QJ20d/heuJpxnfenyYxaCrvc/owc8IxFsHA7ILV7tQYn+2NZJqhsJurRgWGykqxrn/A==
X-Received: by 2002:a05:6e02:1a88:b0:313:ffc5:3dec with SMTP id k8-20020a056e021a8800b00313ffc53decmr10477910ilv.6.1676057821255;
        Fri, 10 Feb 2023 11:37:01 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id 14-20020a056e020cae00b00304ae88ebebsm1530692ilg.88.2023.02.10.11.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 11:36:58 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/8] net: ipa: determine GSI register offsets differently
Date:   Fri, 10 Feb 2023 13:36:47 -0600
Message-Id: <20230210193655.460225-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series changes the way GSI register offset are specified, using
the "reg" mechanism currently used for IPA registers.  A follow-on
series will extend this work so fields within GSI registers are also
specified this way.

The first patch rearranges the GSI register initialization code so
it is similar to the way it's done for the IPA registers.  The
second identifies all the GSI registers in an enumerated type.
The third introduces "gsi_reg-v3.1.c" and uses the "reg" code to
define one GSI register offset.  The second-to-last patch just
adds "gsi_reg-v3.5.1.c", because that version introduces a new
register not previously defined.  All the rest just define the
rest of the GSI register offsets using the "reg" mechanism.

Note that, to have continued lines align with an open parenthesis,
new files created in this series cause some checkpatch warnings.

					-Alex

Alex Elder (8):
  net: ipa: introduce gsi_reg_init()
  net: ipa: introduce GSI register IDs
  net: ipa: start creating GSI register definitions
  net: ipa: add more GSI register definitions
  net: ipa: define IPA v3.1 GSI event ring register offsets
  net: ipa: define IPA v3.1 GSI interrupt register offsets
  net: ipa: add "gsi_v3.5.1.c"
  net: ipa: define IPA remaining GSI register offsets

 drivers/net/ipa/Makefile             |   9 +-
 drivers/net/ipa/gsi.c                | 340 ++++++++++++++++++---------
 drivers/net/ipa/gsi.h                |   4 +-
 drivers/net/ipa/gsi_reg.c            | 168 +++++++++++++
 drivers/net/ipa/gsi_reg.h            | 258 ++++++++------------
 drivers/net/ipa/reg/gsi_reg-v3.1.c   | 201 ++++++++++++++++
 drivers/net/ipa/reg/gsi_reg-v3.5.1.c | 204 ++++++++++++++++
 7 files changed, 903 insertions(+), 281 deletions(-)
 create mode 100644 drivers/net/ipa/gsi_reg.c
 create mode 100644 drivers/net/ipa/reg/gsi_reg-v3.1.c
 create mode 100644 drivers/net/ipa/reg/gsi_reg-v3.5.1.c

-- 
2.34.1

