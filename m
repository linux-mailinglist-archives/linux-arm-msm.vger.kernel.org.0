Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA36D6966FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 15:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbjBNOiC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 09:38:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjBNOiC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 09:38:02 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57911B76D
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 06:38:00 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id c1so13900222edt.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 06:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTjCd+BTBOwE9sDOQS36SxqvJ+2iHM2C+hW+sfEZawE=;
        b=vvOmweQMYzoq4BXNjdktUTzAIyY46UzgPGmTdSy2tbn2plLKKg1RbxoQrgNvysG8dg
         Rq64tpyDAKJS3bTgoNjhHCshiRgHbfQEsN51qXxuT39BoLdOwtzYzRvsIuWoBIag0uca
         u3jp1mLVdY+5NIdTjFzOLOXGYnNeiC53jR3iJKfAH+UQJ/8+CfOO+cEuAFcd54SOXLAq
         RhtBMkq7BNwzsZnENqnBT6on/itYIKoHRBK4D+Q5BJMZiy3RE0VQ1tCU+W/Qmi+Tj2NG
         eWmzEi3SAinGdugjA75bkuKA2vlcM/DPXka9lpXvcoLes7PBiOsM0PSpTsbVY4dQ/hvH
         j0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTjCd+BTBOwE9sDOQS36SxqvJ+2iHM2C+hW+sfEZawE=;
        b=pi4FmL98IMFF/0VY2mngypO7yAKY9BlOWSAIg/bDmEQ6SNbNx3S+kjhsCLlLbFUq1t
         mqGFsXqqGCX85SyiH6ihA6l6TUmGLXfDdhvdMJ97oHGZEUb/kw+eDQ7fG3rucICuibjM
         LtO0u/fmWw1TyAJ21A3JZntT8mOJQBOYEd6yUx92Gd/HdCRpoyqxjdb8/JMjjbUU/moF
         8TfpNu80cNqzNK524KsRD3DxRw5CujWJguwaYQom4ZB+5KgLVKjzNWYSAodOGkRoCFXR
         JoNTQiIt9F4T3u9AEG2NKcFNGaNCESsO5GClPvAROwyBCynwfMxeUYs5QR+b+krVZkIa
         untQ==
X-Gm-Message-State: AO0yUKU/hA/38gnVJ6MWLCM9ai/qN9vkgfVAlB7hFJG3ezmhAXvKjNCO
        FQ9Wfnc+kL0f7mXnBAJFEnUsmC+IBWsIBtzn
X-Google-Smtp-Source: AK7set8RuMXSbsdnu5ic6aRgU032HXW3lzR5nMfMHi4xxe1H8wY9vijWER2mos8AgLjO6z7ilaHrbw==
X-Received: by 2002:a50:a455:0:b0:4aa:b7ac:e0d2 with SMTP id v21-20020a50a455000000b004aab7ace0d2mr2681199edb.19.1676385478490;
        Tue, 14 Feb 2023 06:37:58 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id eg21-20020a056402289500b004acb6189693sm5378052edb.83.2023.02.14.06.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 06:37:58 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v4 00/12] The great interconnecification fixation
Date:   Tue, 14 Feb 2023 15:37:08 +0100
Message-Id: <20230214143720.2416762-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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

v3 -> v4 changelog:
- Drop "Always set QoS params on QNoC", it only causes issues.. this
  can be investigated another day, as it's not necessary for operation

- Drop "Add a way to always set QoS registers", same as /\

- Add a way (and use it) to have no bus_clocks (the ones we set rate on),
  as at least msm8996 has a bus (A0NoC) that doesn't have any and does
  all the scaling through RPM requests

- Promote 8996 icc to core_initcall

- Introduce keep_alive (see patch [11/12]) (important!, will be used by at least 6375)

- Allow negative QoS offsets in preparation for introducing 8998 icc [12/12]

Link to v3: https://lore.kernel.org/linux-arm-msm/20230116132152.405535-1-konrad.dybcio@linaro.org/

v2 -> v3 changelog:
- Drop "Don't set QoS params before non-zero bw is requested"

- Rebase on next

- [1/9] ("..make QoS INVALID default.."): remove unused define for
  MODE_INVALID_VAL

- Pick up tags

v1 -> v2 changelog:
- reorder "make QoS INVALID default", makes more sense to have it
  before "Always set QoS params on QNoC"

- Limit ap_owned-independent QoS setting to QNoC only

- Add new patches for handling the 8996-and-friends clocks situation
  and optional BIMC regardless-of-ap_owned QoS programming


[1] https://lore.kernel.org/linux-arm-msm/14e06574-f95e-8960-0243-8c95a1c294e9@linaro.org/T/#m056692bea71d4c272968d5e07afbd9eb07a88123
[2] https://lore.kernel.org/linux-arm-msm/20230110132202.956619-1-konrad.dybcio@linaro.org/

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
  of important ;)

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


Konrad Dybcio (12):
  interconnect: qcom: rpm: make QoS INVALID default, separate out driver
    data
  interconnect: qcom: rpm: Add support for specifying channel num
  interconnect: qcom: Sort kerneldoc entries
  interconnect: qcom: rpm: Rename icc desc clocks to bus_blocks
  interconnect: qcom: rpm: Rename icc provider num_clocks to
    num_bus_clocks
  interconnect: qcom: rpm: Handle interface clocks
  interconnect: qcom: icc-rpm: Allow negative num_bus_clocks
  interconnect: qcom: msm8996: Specify no bus clock scaling on A0NoC
  interconnect: qcom: rpm: Don't use clk_get_optional for bus clocks
    anymore
  interconnect: qcom: msm8996: Promote to core_initcall
  interconnect: qcom: icc-rpm: Introduce keep_alive
  interconnect: qcom: icc-rpm: Allow negative QoS offset

 drivers/interconnect/qcom/icc-rpm.c | 101 ++++++++++++++++++++--------
 drivers/interconnect/qcom/icc-rpm.h |  41 +++++++----
 drivers/interconnect/qcom/msm8996.c |  35 ++++++----
 drivers/interconnect/qcom/sdm660.c  |  16 ++---
 4 files changed, 126 insertions(+), 67 deletions(-)

-- 
2.39.1

