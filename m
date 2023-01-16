Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF1866BF9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 14:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjAPNWD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 08:22:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjAPNWC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 08:22:02 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 661EA166ED
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 05:22:00 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id m6so42683381lfj.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 05:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fYHFBSfsmrvjZy0cdVUXnzJoMQUjlp6rsLDDn+96Gig=;
        b=Fr3cpqby+CCnA2bdDfyf5fyhkb0wuZT0NnhHKn35v/K9YHP/AwxO4/WFLneLuYXl+5
         9aYZyW3phRkZlZ2LixIEkY+StyBrEKTCzKx6VW9S+A6LJDz0DTHi/eGZK5hcg/1/qlX4
         8/781/uv2OkL13n8Ea4hTO8Eod2y3Vw8y9u7kYZoXv0FOMTMk3B6S2UbVPlCKy0W7BAM
         guCHz98n28zTlT9+isnqkXfDIRITDRLCgbypdN3Jzi9P1H0LIeWHeC1mPZM3UN1Pg94U
         SQco/kT0DlSuT87F8GdNwfLqJDLpACs0pHAyOhn1wq1dfbpjQteK7/3xS6KUEqy8po/F
         1H1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYHFBSfsmrvjZy0cdVUXnzJoMQUjlp6rsLDDn+96Gig=;
        b=quI3ji87nuzJ2vAVZ31cYRjhYDX8jlVnh2J2ASgyEm4I6wV+EIcMFerMfZzfxzf3+w
         M/aZtzaMvn6Bjypr8FTsvE0Jj3bossLu1UO5Py4Vasv10uxrpFbbFdCFiCDg7/Nulpjd
         NODcPr4at/CgJz6DtJq03UtVt2yy/GEtCVmKMWpE7UbW6EvxMtSWUe8nzN6cgteKX4ln
         KchEA2zSOyniOGCNZRCwNmzWlHjszOzKdt38A6lnf8uKOKwuZ4dXXPF9xFVplocjCO4b
         +AEkhf2tIvHJ/UDywUzuoGNbNtFp2cB+iHpBh3G5IIMORG2SEzOj2dXrVbSO+gN3Ol49
         KT1Q==
X-Gm-Message-State: AFqh2krFoojj3FebpwEdQv6XA75BT9/GWHgyytNG+AqpikKIVE2VUtnv
        wIDlSU2/Cr4TK1rz7XD1A3DW0SxJ+kFgsrYb
X-Google-Smtp-Source: AMrXdXubqzXir96QFSuI3vVb/oUN66BPMRdDEUXTR07dch6Q8VtzThXI9OjNgoYyyi00+n1c0+nbuQ==
X-Received: by 2002:a19:8c51:0:b0:4b6:ed1d:38e9 with SMTP id i17-20020a198c51000000b004b6ed1d38e9mr2986883lfj.64.1673875318453;
        Mon, 16 Jan 2023 05:21:58 -0800 (PST)
Received: from localhost.localdomain (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id p9-20020a05651212c900b004cc58b91177sm5016653lfg.239.2023.01.16.05.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 05:21:58 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, bryan.odonoghue@linaro.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 0/9] The great interconnecification fixation
Date:   Mon, 16 Jan 2023 14:21:43 +0100
Message-Id: <20230116132152.405535-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Hi!

This series grew quite a bit bigger than the previous [1] attempt, so
I decided to also add a cover letter.

Link to v2: [2]

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

v2 -> v3 changelog:
- Drop "Don't set QoS params before non-zero bw is requested"

- Rebase on next

- [1/9] ("..make QoS INVALID default.."): remove unused define for
  MODE_INVALID_VAL

- Pick up tags

[1] https://lore.kernel.org/linux-arm-msm/14e06574-f95e-8960-0243-8c95a1c294e9@linaro.org/T/#m056692bea71d4c272968d5e07afbd9eb07a88123
[2] https://lore.kernel.org/linux-arm-msm/20230110132202.956619-1-konrad.dybcio@linaro.org/


Konrad Dybcio (9):
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

 drivers/interconnect/qcom/icc-rpm.c | 111 +++++++++++++++++++---------
 drivers/interconnect/qcom/icc-rpm.h |  36 ++++++---
 drivers/interconnect/qcom/msm8996.c |  22 +++---
 drivers/interconnect/qcom/sdm660.c  |  16 ++--
 4 files changed, 117 insertions(+), 68 deletions(-)

-- 
2.39.0

