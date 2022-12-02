Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B40D6400DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 08:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232475AbiLBHIU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 02:08:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232383AbiLBHIS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 02:08:18 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB60E7F883
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 23:08:17 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id g7so6083578lfv.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 23:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RF/VFY3dE6HvlADMNFmhf0bwnZ216KUVTt4am6cDwSM=;
        b=JNz2Ff9g45D33khcjLFFoaYQC2lWVLq3MiIW81LNpaIdGvqh+8TNYydWPbVk5b3yvA
         UO1m8rSBTik9vSsemEEhPSfdHlgO9sW4NMW4fmWxuJTkAf2oSJ1iiTsVUiNzbjrCkqm8
         nWmPrX/hdS/rixQttsFV9xLkNd4q6xvv8cXXTMoihMRq/NwsBb1VaNjinJjdJoBDIHdr
         TuDVhbWENtS3P+PHEBOJOdTsnp+xtHg0KG174cpCQrcA2VTq60BI7NV+s3/k3Rg325EM
         LcLtrplwv3GuVIUBlThQ2cTA8aUSw/Dtei91BwNSlifUywMphchRTkgiFAbIAFI1ave7
         vNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RF/VFY3dE6HvlADMNFmhf0bwnZ216KUVTt4am6cDwSM=;
        b=mGGx6LCsdf8HX6j0HPtV/nF+/bkXXHRZ4aP+PF4JhGG9x7koMCwtd+6YyLEvje/v1Z
         5MtRLgd+WnICz8XxhzqjD3TOW1+FE8/SLOSD+VQZ1q/iYyFAbaFyo5m/+6IjdtIvszec
         wzLQEWw0FmeLsx0QecEyyJjgtzICYWYOb8EnufDmiRhO9namPcIlE85M3d5msprBNSv6
         vLftedIcZrqbeMzvK4DglVaP6FsLp9TEmEQ5dt8AFsH7J627oxPjy89/fAEZtadxmizD
         tzHcpwvUMT3v/wUN6qFJWD02tR+ROsOB6AAd0m2friqsjzUmzUVIbn4RchZGdL6zxqH2
         24vg==
X-Gm-Message-State: ANoB5pmtGIMzI66MVaCyJt3cC7bQ5tQyACU7806Rk+DhUzGRfAPsFdpo
        28IvGQWwBgK+2dmONrQgpgiEPg==
X-Google-Smtp-Source: AA0mqf46niS6m9nsPKGyHzSX30gnliypAXfMQDEmMMJzJPlF1z9rxgSh3hWqUpdtyuEPyT5K4d4fww==
X-Received: by 2002:a05:6512:4017:b0:4b1:be16:4a4a with SMTP id br23-20020a056512401700b004b1be164a4amr26613277lfb.0.1669964895966;
        Thu, 01 Dec 2022 23:08:15 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a2-20020a19ca02000000b004946a1e045fsm913097lfg.197.2022.12.01.23.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 23:08:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 0/4] clk: qcom: rpm: drop platform names
Date:   Fri,  2 Dec 2022 09:08:10 +0200
Message-Id: <20221202070814.482470-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

The RPM clocks driver uses platform (SoC) as a part of the clock
definition. However there is nothing really SoC-specific in this
part. Using it just leads to confusion and sometimes to duplication of
definitions. Drop the SoC name where it is logical.

Changes since v2:
- Split from the RPMH patchset
- Dropped superfluous active-only clock names when there are no actual
  clocks behind
- Removed the _clk and _a_clk suffixes, moving them to preprocessor
  macro, no need to have them all over the code.

Dmitry Baryshkov (4):
  clk: qcom: rpm: remove unused active-only clock names
  clk: qcom: rpm: drop separate active-only names
  clk: qcom: rpm: drop the _clk suffix completely
  clk: qcom: rpm: drop the platform from clock definitions

 drivers/clk/qcom/clk-rpm.c | 204 +++++++++++++++++--------------------
 1 file changed, 94 insertions(+), 110 deletions(-)

-- 
2.35.1

