Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8541F681C1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 22:02:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjA3VCa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 16:02:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjA3VC3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 16:02:29 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C180045BF4
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 13:02:27 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id e2so2235433iot.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 13:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tqiYGrAmfasm6lQ8vFsVNt3ikeeBgKSbwzGX4HertYY=;
        b=GOVd6u2ieN8ZGU8y66kFT6PF7W6+SfL4LTPkS+jmZR4QDvpgdbiLuiJpwS6fY9WTad
         ldCcWhlgbHnzm/JZEJhXeB5mga8Vi/07XPX4FVSqAoctajjwX7/BLgHM4/jfcuFeiZf7
         HrWH0bP4vnnLQmTqE30k40fR6+sdx8JrSPhZQ+zPcXnFaDpAR/JPRk/0RtHtcIMrla74
         Nqu011nqmcKmUoaJVlZADdltOp8mGTKqAwzXtkc9zqMwhil3olfyHNhDD979rotGmWCj
         pJ29pICkOFd/Ll9AlDtCt6dgUwq89L/nr3kKYJvpmVXtsuxv/blcbsa5ur11u3BY0dJg
         QFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tqiYGrAmfasm6lQ8vFsVNt3ikeeBgKSbwzGX4HertYY=;
        b=v9/7FQp9vMx4L8kbaSUvuw2tACDfbf4jan3DBO4THHz5JNM1wqecNcEt2mb2kLfhNE
         IZeDV5DNHXySQ/og4xqRXOwgYckVUL1B8jCY5El1jqyuQFXuxjSdPGbcMglvhq/Bi90H
         UpngWWDv2nz7Bsa4vwaNBXoe8rvSdX7NDbT24Q5Xph8uuTgGxBNNi+X4zRspUYA541gV
         98pQDJy5jLcN17/YoDX5CKAg224E86YFfbjITdlEF3IuXiUxsehpvXhexqxE97OvRl5b
         gWDpqKrQjrj5Agnk3VAaqdi0dYMmPUgAROmheXF0UC3nk2TDTfuyJeHPKmY1A00S3gH1
         UZyw==
X-Gm-Message-State: AO0yUKW+VoFJiCQC88C2eqInREQjMySXQ3wxz+Ejvuo9j/EBBSdAmGa4
        Qf20Cx4Rph7Nw6KvLzTOvJ/asg==
X-Google-Smtp-Source: AK7set/L4+20oXstDi7/0z2f8rHrqw8wonXy2WYYfxVyB1zXBMeRcBS0lAtlXiUReQtK4ONZmXBHWQ==
X-Received: by 2002:a05:6602:370d:b0:716:948a:8871 with SMTP id bh13-20020a056602370d00b00716948a8871mr7157020iob.1.1675112547060;
        Mon, 30 Jan 2023 13:02:27 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id a30-20020a02735e000000b003aef8fded9asm1992046jae.127.2023.01.30.13.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 13:02:11 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/8] net: ipa: remaining IPA v5.0 support
Date:   Mon, 30 Jan 2023 15:01:50 -0600
Message-Id: <20230130210158.4126129-1-elder@linaro.org>
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

This series includes almost all remaining IPA code changes required
to support IPA v5.0.  IPA register definitions and configuration
data for IPA v5.0 will be sent later (soon).  Note that the GSI
register definitions still require work.  GSI for IPA v5.0 supports
up to 256 (rather than 32) channels, and this changes the way GSI
register offsets are calculated.  A few GSI register fields also
change.

The first patch in this series increases the number of IPA endpoints
supported by the driver, from 32 to 36.  The next updates the width
of the destination field for the IP_PACKET_INIT immediate command so
it can represent up to 256 endpoints rather than just 32.  The next
adds a few definitions of some IPA registers and fields that are
first available in IPA v5.0.

The next two patches update the code that handles router and filter
table caches.  Previously these were referred to as "hashed" tables,
and the IPv4 and IPv6 tables are now combined into one "unified"
table.  The sixth and seventh patches add support for a new pulse
generator, which allows time periods to be specified with a wider
range of clock resolution.  And the last patch just defines two new
memory regions that were not previously used.

					-Alex

Alex Elder (8):
  net: ipa: support more endpoints
  net: ipa: extend endpoints in packet init command
  net: ipa: define IPA v5.0+ registers
  net: ipa: update table cache flushing
  net: ipa: support zeroing new cache tables
  net: ipa: greater timer granularity options
  net: ipa: support a third pulse register
  net: ipa: define two new memory regions

 drivers/net/ipa/ipa_cmd.c      |  32 ++++++++---
 drivers/net/ipa/ipa_endpoint.c | 102 ++++++++++++++++++---------------
 drivers/net/ipa/ipa_endpoint.h |   4 +-
 drivers/net/ipa/ipa_main.c     |  14 ++++-
 drivers/net/ipa/ipa_mem.c      |   8 ++-
 drivers/net/ipa/ipa_mem.h      |   8 ++-
 drivers/net/ipa/ipa_reg.h      |  43 ++++++++++++--
 drivers/net/ipa/ipa_table.c    |  61 ++++++++++++++------
 8 files changed, 187 insertions(+), 85 deletions(-)

-- 
2.34.1

