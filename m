Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1327D527D9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 08:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240279AbiEPGcM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 02:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232090AbiEPGcL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 02:32:11 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2861628E12
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 May 2022 23:32:10 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id t11-20020a17090a6a0b00b001df6f318a8bso293287pjj.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 May 2022 23:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MWyLCcRrtXqaWbV9pz/nch+ilZHclG5FSEfzAoH1u1I=;
        b=H4Ik+y7eaE6vP9bww4+V6BXwts9KNfHrkG9uHkhBAAzRDO+8hEjZKmG2dyJstYkLZ9
         UZGuJBANxWsQsBSJPKdAG0ZfloaCZjbib0rbxp7mvMq9BgSLDHXwFQhP4I1wZwQEMXy8
         ULkl7fY00L61ZQ57aDoPumRtf1LBSrWjrwm/l1PWQlf+x7d6B8GXeJFSSEt7G+VPRp++
         pe8P6/EldPxjiI3WwhvrpznZ79lGX5KR3s35Mm5BjB/CiwkLqZuDghz4w/mqmTjOkkMI
         UBNzEruSFYJTaBiZ4x2Jtz64l+Llh4DHIGLWPLVo+0FHGNcDXffm2KCKfeN9yEidBXDH
         D+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MWyLCcRrtXqaWbV9pz/nch+ilZHclG5FSEfzAoH1u1I=;
        b=PCoqErfqHnHpafCSReGEx69XqgrUZHB5vRk+kXxbxqDkoIAumTjPcoIjkBteyiXFC1
         cx/v2RkDRxMzAw9VBrdOOzlkEL+HNtI9RJmrJi9n26bXfT1lwb6R/aSzpR3cTAxDjrIg
         3kaTZSe/HeSCEmi78TNdK90fqikPDHJ1tzLB+oow0fB3bW9Y65DqKTgJRhRRU+E3+E8x
         TmGWqvJwzxnh3AonuZNSANhArWg64UxgScb2AByqGxXCuD/Fdm2FByUAX1pr4j0ctbnY
         Wp5Zglx46kN8k5y1XIpxN7Ihrbmnvl1oJAOa3s6QN+pCcI02RMt4IAJmyvA0g7TMOCHM
         V7pQ==
X-Gm-Message-State: AOAM53218LdX9ykHkMr2Wde+aemtmhRp5rejmuHmmufQ5U0FsoW8vv4L
        olp9Y0aqAJBTWC+mBw3134BTjN6nnsrIvQ==
X-Google-Smtp-Source: ABdhPJxYi8ELNV89KBzQB1W5es4pcM1Hvra1FK7aPNMReCpXqzLqp7e+aaZ+kxqKuk8m52xBkIbsfA==
X-Received: by 2002:a17:903:215:b0:15e:cae9:7622 with SMTP id r21-20020a170903021500b0015ecae97622mr16091224plh.28.1652682729308;
        Sun, 15 May 2022 23:32:09 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:931c:dd30:fa99:963:d0be])
        by smtp.gmail.com with ESMTPSA id t9-20020a1709027fc900b0015e8d4eb1e2sm6053647plb.44.2022.05.15.23.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 23:32:09 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        robh@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org,
        konrad.dybcio@somainline.org
Subject: [PATCH v4 0/4] Fix  dtbs_check warning(s) for Qualcomm QMP PHY
Date:   Mon, 16 May 2022 12:01:51 +0530
Message-Id: <20220516063155.1332683-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.3
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

Changes since v3:
-----------------
- v3 can be found here: https://lore.kernel.org/linux-arm-msm/20220418205509.1102109-1-bhupesh.sharma@linaro.org/
- Addressed review comments from Bjorn.
- Dropped [PATCH 4/4] (sent in v3) from v4, as it is accepted in
  linux-next now.
- Added a new [PATCH 3/4] which added 'power-domains' property
  to the dt-binding.

Changes since v2:
-----------------
- v2 can be found here: https://lore.kernel.org/linux-arm-msm/20220228123019.382037-1-bhupesh.sharma@linaro.org/
- Addressed review comments from Rob and Shawn.
- Collected ACK from Rob on [PATCH 2/4].
- Since, Bjorn accepted 4 patches from v2 already, drop them for this series.
- This series is rebased on linux-next/master.

Changes since v1:
-----------------
- v1 can be found here: https://www.spinics.net/lists/linux-arm-msm/msg104871.html
- Addressed review comments from Dmitry.
- Addressed the remaining dtbs_check warnings rasied by Rob's bot on v1.

Shawn Guo recently fixed a large number of 'dtbs_check' warnings
on Qualcomm DTS files for qmp phys. However a few warnings are still left
(possibly due to new dts files being added over time).

So, I decided to clean them up.
After this series, '$ make dtbs_check' leads to only one warning for QCOM
QMP PHY bindings, which as discussed with Konrad (see [1]), will be sent as
a separate fix with Konrad's sm8350-sony-xperia-sagami regulator fixes.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>

[1]. https://lore.kernel.org/linux-arm-msm/eb54c810-8121-7de1-e2cf-008bd59552ce@somainline.org/

Bhupesh Sharma (4):
  dt-bindings: phy: qcom,qmp: Shift '#clock-cells' property to phy
    (child) node
  dt-bindings: phy: qcom,qmp: Describe phy@ subnode properly
  dt-bindings: phy: qcom,qmp: Add 'power-domains' property
  arm64: dts: qcom: Remove unused 'vdda-max-microamp' &
    'vdda-pll-max-microamp' properties

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml | 24 +++++++++++++++----
 .../qcom/sm8350-microsoft-surface-duo2.dts    |  2 --
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts       |  2 --
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts       |  2 --
 4 files changed, 19 insertions(+), 11 deletions(-)

-- 
2.35.3

