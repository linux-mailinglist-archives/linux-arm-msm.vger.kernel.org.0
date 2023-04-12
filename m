Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 250C06DF909
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 16:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjDLOxQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 10:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbjDLOxQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 10:53:16 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1018F1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 07:53:14 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id q26so2869421lfe.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 07:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681311193; x=1683903193;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vo0PVdHC7kP43WA73kPUfBUKoSLqf85EiM6RS5+7abY=;
        b=IO4AXact9XduaF0D+qwBwd49iBb3FQ/YCz4SFI8z2YIai6VApG1qyRZXQaSTX9Fp4B
         sKiHxQfUrdKE2/cqiuSMc0b3by1vRC07q50R1Y9z1KMowYEBNpgiwRpu6vZYmFaI/Vz/
         hgSspkbfkhc9XDzARqqeU1Co3txq5EVFTam6A9KH++L7z1UJD61VxNLGt2QvxhZYxBz3
         AThHeOHUEuUwJSbZlPBeE7Ce0fzMwppSvc0iv5ojVXg/FICpdIgqJsVeEyW0ahFgc0xx
         jZRa4T/p5EWzxRgAcp/t8KwNWUYX+RlNzox/iprORYwWkA6VPoFlk7N5GKgsU0uzDRm2
         L9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681311193; x=1683903193;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vo0PVdHC7kP43WA73kPUfBUKoSLqf85EiM6RS5+7abY=;
        b=NqXC3vzCKfik3sPiiUmeVoW/71KuiGtX6wIusbmRTZdIt2kqDLp31k4MKbxITMnUjN
         pVUrhDo7zNHWuPuUq2SCKaeMlTeC/MRDu8VpapyhqVXoSMbY3SiKJt8EDWyNR1AsH+m/
         eLi+jEj3Z8TmuNjvADwhAnI3y/1YVJEYZoyr8x2d5R8eR9846D/MrgreUxhbSfrkcJeT
         yQvwy3FfEYCBaMO4seYWhFU3E6vu6NnjuhhzJVrxt7xkf/MIDyvqZdUJINV8ufOhoty8
         YAEzv/IP3MrAXXd0+qWdwk6h8GKyAJIpucAEXCUGLSctkPR1JLZKKf4PFn04C9tfWgNl
         0zQw==
X-Gm-Message-State: AAQBX9dJEp8MR1fsN9QFp5+A55Zc/VWqmy3QZBm5n0QhaWtOWQL3T6ws
        7I51HzJg5FPdKGOk8lpjQeoZPSsBKQ17dFrTaSI=
X-Google-Smtp-Source: AKy350aryqi+RuV9ljHi+CiqeqROnOEaSpFLworokp2d3dRVTqbHuPLuSNQpo7lLT4JuNVeqQaf5VA==
X-Received: by 2002:ac2:418a:0:b0:4eb:2d47:603 with SMTP id z10-20020ac2418a000000b004eb2d470603mr3524825lfh.47.1681311192963;
        Wed, 12 Apr 2023 07:53:12 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id w5-20020ac24425000000b004e95f1c9e7dsm3015367lfl.78.2023.04.12.07.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 07:53:12 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/3] QCM2290 dispcc fixups
Date:   Wed, 12 Apr 2023 16:53:04 +0200
Message-Id: <20230412-topic-qcm_dispcc-v1-0-bf2989a75ae4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANDFNmQC/x2N0QqDMAwAf0XyvEDtZKC/MmS0aZwBV2vjxkD89
 4U93sFxByhXYYWhOaDyR1TWbNBeGqA55CejJGPwzl9d13rc1yKEG70eSbQQ4dTdKCYOHHsHlsW
 gjLGGTLOF+b0sJkvlSb7/z308zx9Qoh0UdwAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681311191; l=639;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3pZCCb38mF6dE6fGvbscnrKT4drmGOehX7gKEqn0iY8=;
 b=vYBbHNflqlhC9OjbffvWz7vSYZc7FAEIPLGCRDfUV8bc8j+/qXj1oyJSQeNY8xV2iG5Qc/V9L35X
 HF0hXTgXAh89Q1wW8RoJHXlP1dKvROOiYLpzVWsML1/ZXBnDAuJH
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I noticed some very msm-downstream-y bugs in the QCM2290 dispcc..
Let's fix them up..

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (3):
      clk: qcom: dispcc-qcm2290: Fix BI_TCXO_AO handling
      clk: qcom: dispcc-qcm2290: Remove inexistent DSI1PHY clk
      clk: qcom: dispcc-qcm2290: Fix GPLL0_OUT_DIV handling

 drivers/clk/qcom/dispcc-qcm2290.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)
---
base-commit: 7d8214bba44c1aa6a75921a09a691945d26a8d43
change-id: 20230412-topic-qcm_dispcc-f46cbdeaeb90

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

