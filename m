Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4159D52D713
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 17:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240227AbiESPMX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 11:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237745AbiESPMW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 11:12:22 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4591C1EC8
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 08:12:21 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id m6so6089006iob.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 08:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jdEQHGju4mFfX3gcNSc2YY06HbqmiG/LBfB3okg7Tsk=;
        b=H+M1vvEAY1HUdr4mwKwcMiZ9S4s708i3vBZhoklK8wI4WLWY6GLH5gliSHOpi8GtIm
         QKBY2Kz7DdhAuBOPge1WiowgUkZUDguhSWtucGNZsLC7/wW4F8iixeFzeTQNrBHb8QDR
         +6j+dhbnZViGrQDs8V8P86J4n6AMcabcxvyM4UO97+9SOf11WmwCM8igCdbrdzl6oX9/
         PfvRMpGTvB/E4H9zUxR3qONIQT6jEpwnjugDYY9gfAuSvqZGos+TrTRSezIQrhONjb2o
         76T47GF2ky6ivm//VKPNTw71OP3ttSwYYDkPF2f4JrIgoewx8epSxvsuhvLziiC+PTfP
         e8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jdEQHGju4mFfX3gcNSc2YY06HbqmiG/LBfB3okg7Tsk=;
        b=JN6xNBPgEGOKZr7MQmFt16oYZzRvtldWboysaG1WAqLdcUCzUIrDTjBbd+HKyHxBOT
         dE90kCsno0OvRd7uVJ/CkeGSX6ot74TUuJKRxcr6AIx8yrP3dvxOQMW6RjiyowskJdss
         huZJb9LcH2BcsuOwGLn+nMdFhvS9YEV/ixO0IaYOpKr8tX7A5ZckymQefqp+ygWDvkuD
         vxvJ4X9YAikHhZLwoqbQ+Y7m5sYy+aSlAfVtVpRd4ixmAoQ/BSitKqyNSUwgC8PYFBpE
         Gs3wjRB+weiiw+viXManzefJheAlJKstbRlncIsG+0YgXI+ndSigYFlLJwctQNaPgWMF
         n3XQ==
X-Gm-Message-State: AOAM533U83qZOcLwVaL/c13vQDtzlEWTeW2fepdPRTlVCp4tw+rIZ2G2
        pMBDmlD849KZmx3tOCwzjyr1VA==
X-Google-Smtp-Source: ABdhPJz1AblWlFZFDd4U5+4gFWSoBUgTKLkMZvJTK94tEM0oRQkmEZCPGkhVzClVPww1qaEpg0h0Ig==
X-Received: by 2002:a05:6638:52e:b0:32a:e022:5a9e with SMTP id j14-20020a056638052e00b0032ae0225a9emr3070588jar.60.1652973140943;
        Thu, 19 May 2022 08:12:20 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id g6-20020a025b06000000b0032e271a558csm683887jab.168.2022.05.19.08.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 08:12:20 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/7] net: ipa: a mix of patches
Date:   Thu, 19 May 2022 10:12:10 -0500
Message-Id: <20220519151217.654890-1-elder@linaro.org>
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

This series includes a mix of things things that are generally
minor.  The first four are sort of unrelated fixes, and summarizing
them here wouldn't be that helpful.

The last three together make it so only the "configuration data" we
need after initialization is saved for later use.  Most such data is
used only during driver initialization.  But endpoint configuration
is needed later, so the last patch saves a copy of that.  Eventually
we'll want to support reconfiguring endpoints at runtime as well,
and this will facilitate that.

					-Alex

Alex Elder (7):
  net: ipa: drop an unneeded transaction reference
  net: ipa: rename a GSI error code
  net: ipa: ignore endianness if there is no header
  net: ipa: open-code ether_setup()
  net: ipa: move endpoint configuration data definitions
  net: ipa: rename a few endpoint config data types
  net: ipa: save a copy of endpoint default config

 drivers/net/ipa/gsi.c          | 16 ++-----
 drivers/net/ipa/gsi_reg.h      |  2 +-
 drivers/net/ipa/ipa_data.h     | 70 ++-------------------------
 drivers/net/ipa/ipa_endpoint.c | 86 +++++++++++++++++-----------------
 drivers/net/ipa/ipa_endpoint.h | 66 +++++++++++++++++++++++++-
 drivers/net/ipa/ipa_modem.c    | 13 +++--
 6 files changed, 128 insertions(+), 125 deletions(-)

-- 
2.32.0

