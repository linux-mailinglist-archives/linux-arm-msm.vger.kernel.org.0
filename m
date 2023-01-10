Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F29E66417F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 14:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232546AbjAJNWK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 08:22:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232250AbjAJNWJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 08:22:09 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0DFACFC
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 05:22:08 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bf43so18393130lfb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 05:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uaL0f7ibJmPwyao3yTcw4Hcp+YgoGvPsKoTWHW5pFAI=;
        b=moAvkz626Du+yo+y/ViXu4AiCtyZUtHtIijT7vZW0CyxTT+eMwfIVYNwRPwGmRWoC0
         9wElfcgXjkY0ioVjRxQ/ZMDKV9VbXicWAVCT17UmLZvpokDXovaqxSO/ziwBf62tSwAT
         ZSNm4UlTIPVDV/dYx0NUOg8PfZ9vgQ7g77K+c8zT/ASlZ2zOFcH669k0C0cPSLDx8q7m
         AdfDrwrrzvLuXq51GQ4cD9DyoVUVE4JhOdDROXPuOzzXhyThFQAjBM2rQXwYB2GBi7EI
         I+/E0FKr/a1oE0drBDbq9l9kgEVAApW6Al46cnzi9rRLyyEZJfxEv3yUXQNPVUI/w6yb
         3ZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uaL0f7ibJmPwyao3yTcw4Hcp+YgoGvPsKoTWHW5pFAI=;
        b=OaiI7+LTo0qAJtxL8m94gQfZva+vIWJ4uA58zNqgWvoC5FjqMw9PghB9oVcOOBZXDR
         m/eEXoRPAHHzbwCSaRfRkpdkx3BhurIBBTDV06OeCXfdeafSLeWcYVDo0hn7hp6q1wUc
         /HJdeuYNSgYJo02pfMYmXijXBex9MQSD+HvfoMSHwYK3etOpqyV2KBmCO8PDbQaRUmzA
         TWIz7BKNLp4UBYDuyHvCBJTcSUbGaDaCGQpXpASKbd5Z9GzYVl1n4f6Pgh/jA3cHRQa5
         b7VqzKKS3B80/pK0IJk6WXUKuOEiy95hTpcKb1DoV6gw4NzaU4KDFNxNpGdV8lr4GU86
         ehwQ==
X-Gm-Message-State: AFqh2kqSL9Eze+bAKi+9Z3Mq3bmwWs6ag1deOnobXmXkqm4hg/tVJZz1
        jWw+V49T54iWNe+ZpZo+XxT+GnGirBKpMINN
X-Google-Smtp-Source: AMrXdXveSpfd47w6Yz939G0f43wgKgmpcWnDoW4QKsIomzAlE9ieLtLv3ep2XSx02BJvZqAVARysRQ==
X-Received: by 2002:a05:6512:3ba1:b0:4b5:8fbf:7dd6 with SMTP id g33-20020a0565123ba100b004b58fbf7dd6mr30441795lfv.61.1673356926681;
        Tue, 10 Jan 2023 05:22:06 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id w4-20020a19c504000000b004b5812207dbsm2183000lfe.201.2023.01.10.05.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 05:22:05 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, bryan.odonoghue@linaro.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 00/10] The great interconnecification fixation
Date:   Tue, 10 Jan 2023 14:21:52 +0100
Message-Id: <20230110132202.956619-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Hi!

This series grew quite a bit bigger than the previous [1] attempt, so
I decided to also add a cover letter.

It addresses a few things that were not quite right:

- Setting QoS params before a "real" (non-zero) bandwidth request
  makes little sense (since there's no data supposed to flow through
  the bus, why would the QoS matter) and (at least newer) downstream
  prevents that from happening. Do the same in Patch 1.

- QNoC type buses expect to always have their QoS registers set as long
  as there's a non-INVALID QoS mode set; ap_owned is not really a thing
  on these anymore, Patch 3 handles that.

- The recent MSM8996 boot fix was done quickly and not quite properly,
  leading to possibly setting the aggregate bus rate on "normal"
  hardware interface clocks; this series handles that by limiting the
  number of bus_clocks to 2 (which is the maximum that makes sense,
  anyway) and handling the rest as "intf_clocks", which are required
  to access the   hardware at the other end. Patches 5-8 take care of
  that and Patch 10 reverts the _optional moniker in clk_get_ to make
  sure we always have the bus scaling clocks, as they're well, kind
  of important :)

- Similarly to QNoC, BIMC on "newer" (which can be loosely approximated
  by "new enough" == "has only BIMC and QNoC hosts") SoCs expects to
  always receive QoS programming, whereas BIMC on "older" SoCs cries
  like a wild boar and crashes the platform when trying to do so
  unconditionally. Patch 9 adds a way to take care of that for newer
  SoCs (like SM6375)

- QoS mode INVALID was assumed by developers before to be the default
  ("I didn't specify any QoS settings, so the driver can't assume I
  did.. right? right!?" - wrong, partial struct initialization led to
  0 being set and 0 corresponded to QoS mode FIXED). Make it so, as
  that's the logical choice. This allows the "Always set QoS params
  on QNoC" patch to work without setting tons of what-should-
  -obviously-be-the-default values everywhere, as well as fixes older
  drivers that set ap_owned = true but left the QoS mode field unset.
  Patch 2 cleans that up.

- Some nodes are physically connected over more than one channel
  (usually DDR or other high-throughput paths). Patch 4 allows that
  to be reflected in calculations. This will be required for at least
  MSM8998 and SM6375 (which will be submitted soon after this lands)

v1 -> v2 changelog:
- reorder "make QoS INVALID default", makes more sense to have it
  before "Always set QoS params on QNoC"

- Limit ap_owned-independent QoS setting to QNoC only

- Add new patches for handling the 8996-and-friends clocks situation
  and optional BIMC regardless-of-ap_owned QoS programming

[1] https://lore.kernel.org/linux-arm-msm/14e06574-f95e-8960-0243-8c95a1c294e9@linaro.org/T/#m056692bea71d4c272968d5e07afbd9eb07a88123

Konrad Dybcio (10):
  interconnect: qcom: rpm: Don't set QoS params before non-zero bw is
    requested
  interconnect: qcom: rpm: make QoS INVALID default, separate out driver
    data
  interconnect: qcom: rpm: Always set QoS params on QNoC
  interconnect: qcom: rpm: Add support for specifying channel num
  interconnect: qcom: Sort kerneldoc entries
  interconnect: qcom: rpm: Rename icc desc clocks to bus_blocks
  interconnect: qcom: rpm: Rename icc provider num_clocks to
    num_bus_clocks
  interconnect: qcom: rpm: Handle interface clocks
  interconnect: qcom: rpm: Add a way to always set QoS registers
  interconnect: qcom: rpm: Don't use clk_get_optional for bus clocks
    anymore

 drivers/interconnect/qcom/icc-rpm.c | 118 ++++++++++++++++++++--------
 drivers/interconnect/qcom/icc-rpm.h |  36 ++++++---
 drivers/interconnect/qcom/msm8996.c |  22 +++---
 drivers/interconnect/qcom/sdm660.c  |  16 ++--
 4 files changed, 124 insertions(+), 68 deletions(-)

-- 
2.39.0

