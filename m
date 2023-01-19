Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D37F3673D37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 16:14:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbjASPOO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 10:14:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbjASPON (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 10:14:13 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3BA6676DD
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 07:14:11 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id l8so1785719wms.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 07:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HD3jSa6zl99b1k1iQFDMjEt5nT4zeae/hJhML5gvv2o=;
        b=FxNqCf7FYUdZoUA8KDytXhw/BOb3S+qc4gbNrZ37p892yoDAYgsyZzjNgpFnRyqlPR
         N+0cKqDvKFNo98kWKPg/XJLV1UQPr0sddD1k/bItHmQnxFn8XJ1p8TE+RWLX2MWKIhRR
         +gNR+BDWKwVU26J1wR18s2ZUDFQ8RjVvoeY2vA5iFYj7kfm3Z9erAJd1zHvczOSI/aux
         rvJg64HFjZ/wi5MXUPkdLltIqiyijcquE2UckRHTi4BRXhoY4YRASm9AqCSnjY/RYQI3
         F/HKzr8iETMLtDhQ7pVS8iIbS5/P62nxTwBvjwGNrvRs0YyfdfioED9mBNlIA+RtXIDI
         dNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HD3jSa6zl99b1k1iQFDMjEt5nT4zeae/hJhML5gvv2o=;
        b=56nWBF4byAiUApbDimlZSA7vCNYyqQ2eaSmTQ1q2Y6gOb7F5YZDkJthhryE7w28eKm
         fWdmEyNHH5N4/sNV/PeJAOOfb6kqWI8eFyZxu1BEmduLTTF71aS8NL74Aq94U3rTb/Kz
         t9A1R73ZWzo/dufpZfugiNbdxvx0VVgRmPzD7DvU8XV1xrIt1ftwViEgZfXDGkwUkI4F
         2M+pXmkkb/dQFYSZ0Wg2Tac/sC9ecmqCmmOKb9ymdkcosTmkd6wp8g515gzaztGWBYiH
         HLu4J2lAZVpt3VpIk9NbC6lc8ffIb6rw6tcgKHW1mHCYdyuO2rU5lptssg8Nh6JgX0tg
         bOQg==
X-Gm-Message-State: AFqh2kp0SviZa+/QsU6YYA+lJpurPe1bl/etGBz+/78JqN2nUrifdLeh
        jkB4WXKxw+enwMdJbbA9Zh1NMssm6cq0LH7h
X-Google-Smtp-Source: AMrXdXv9erm4zRyGtwJNCFo1mbvzOCOLFjZuhebCW2xo4EiMv+d2zQZFAHx0NYxVXcgYc2/G9z3ZfQ==
X-Received: by 2002:a05:600c:3596:b0:3da:1357:4ca2 with SMTP id p22-20020a05600c359600b003da13574ca2mr11196032wmq.11.1674141250122;
        Thu, 19 Jan 2023 07:14:10 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id o16-20020a05600c379000b003db15b1fb3csm4566605wmr.13.2023.01.19.07.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 07:14:09 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] ufs: host: ufs-qcom: Add support for SM8550
Date:   Thu, 19 Jan 2023 17:14:04 +0200
Message-Id: <20230119151406.4168685-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds UFS HC support for the new Qualcomm SM8550 SoC.

The v1 was here:
https://lore.kernel.org/all/20221116121732.2731448-1-abel.vesa@linaro.org/

Changes since v1:
 * replaced REG_UFS_PA_LINK_STARTUP_TIMER with REG_UFS_CFG0 and added a
   comment saying that the older version use the first name as reg name
 * moved QUNIPRO_G4_SEL in a separate section dedicated to CFG0 bits
 * forces the update_link_startup_timer condition to be skipped in case
   of HW version 5.x

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Avri Altman <avri.altman@wdc.com>
To: Bart Van Assche <bvanassche@acm.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: "James E.J. Bottomley" <jejb@linux.ibm.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Abel Vesa (2):
  scsi: ufs: ufs-qcom: Clear qunipro_g4_sel for HW version major 5
  dt-bindings: ufs: qcom: Add SM8550 compatible string

 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
 drivers/ufs/host/ufs-qcom.c                         | 8 ++++++--
 drivers/ufs/host/ufs-qcom.h                         | 6 +++++-
 3 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.34.1

