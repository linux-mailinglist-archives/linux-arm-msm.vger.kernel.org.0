Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C78457F558
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jul 2022 16:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiGXOE2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jul 2022 10:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiGXOE1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jul 2022 10:04:27 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D503312621
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 07:04:24 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t1so14407710lft.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 07:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wHgGqB5xDouzblfEMIpjhP5cEx2FHrgiGDCoM04v+5U=;
        b=XBLNvwRTYF+ehQPfCYwoiQtRbyOYKo0PNlSRR6E7VZhZOOZtvqua5blR6PdC79dqVg
         u0SMp54HOmzWh5+W1RqDBq+tMwOY7NhScagDYyYjwpy8icbNYihdfPxjZ3C8kysQ18PF
         /hMPtfmM47tAHf9OOdTMn42BgxLHg/sKy07zsiVCx1G1qKGf6pHHzmZdszIb/wxw1EXs
         kMmSb1rflgsgf5lm3RZRAAaBVidg4EOHThk0Ju05lz0J+H+mFQqO/YPO+BDaqdbuJ/7k
         lkacycp3BFIzQ8QgkM7FR/fWy0AColONcGb1IX7B8oJvxiwAfHMSck6/lUc4dnZvaXQB
         /UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wHgGqB5xDouzblfEMIpjhP5cEx2FHrgiGDCoM04v+5U=;
        b=I9F65E6eqYXc4eVBjK3WhfdA7lywYkNKSdz1pGZp3c2NCkR0mKPt4Sxwp2OodIX6di
         jOLOW5YjwTnqK8gbaFrD/YaYQQqZvmn+psKKKA7wnIeTNz45mgrw3W2vEQ72emME4Fyk
         NiIWu6yZHvys06JwBr9wYEauR23mAVLccgRaOw9FI3XEeuFHH2oR/VLIY1qox53hK8ZN
         gtP2OIHAHKYZ2VDUcvzEumh4pMN3Aa+qGxyqpQ+bmMUt29a6JdwU7R2lIhfFVVdc6YTI
         6HJXaTF820uAK0PxBtYwikCZe/UVkeVc5mF7U1567exm/CjruSjmdE1YF1Xc4VgRDaKu
         BMqQ==
X-Gm-Message-State: AJIora8tH3C4p2HSCdWR31R9R14HbVDcK4axWKmTYLH3LDSR7CtdAJGq
        qQLTj9EzJmJlVfVW2I35YozPSQ==
X-Google-Smtp-Source: AGRyM1vO8nZ35Y7e88T5KA8QwmWOvUPuJKnCepjErWU0ipY+c9XW+wnQvK0WiBVZLnj1K4D2MtE5jQ==
X-Received: by 2002:a05:6512:3f23:b0:48a:90ed:10a5 with SMTP id y35-20020a0565123f2300b0048a90ed10a5mr32616lfa.93.1658671463024;
        Sun, 24 Jul 2022 07:04:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s13-20020a056512202d00b00489dedf1dcfsm2192622lfs.289.2022.07.24.07.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 07:04:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: [PATCH 0/7] arm64: dts: qcom: msm8996: fixes for CPU and GPU OPP tables
Date:   Sun, 24 Jul 2022 17:04:14 +0300
Message-Id: <20220724140421.1933004-1-dmitry.baryshkov@linaro.org>
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

The commit 90173a954a22 ("arm64: dts: qcom: msm8996: Add CPU opps")
added CPU OPP tables to msm8996.dtsi. However it went unnoticed that
MSM8996 and MSM8996Pro have significant differences in the supported
CPU frequencies. Moreover, differences between various speed bins were
also not handled in the DT. Fix all these issues by splitting msm8996pro
and fixing different opp-supported-hw.

Unlike previous attempts by Yassine Oudjana [1] [2], this patchset
doesn't require changing the cpufreq driver, keeping compatibility with
existing kernels (and thus easing backporting to stable kernels).
Yassine's patches were changed to keep compatibility.

While we are at it, also apply fixes to GPU OPP tables to acount for
small differences in supported frequencies.

[1] https://lore.kernel.org/linux-arm-msm/20220409035804.9192-1-y.oudjana@protonmail.com/
[2] https://lore.kernel.org/linux-arm-msm/20220416025637.83484-1-y.oudjana@protonmail.com/

Dmitry Baryshkov (5):
  dt-bindings: arm: qcom: separate msm8996pro bindings
  arm64: dts: qcom: msm8996: fix supported-hw in cpufreq OPP tables
  arm64: dts: qcom: msm8996: add support for speed bin 3
  arm64: dts: qcom: msm8996: fix GPU OPP table
  arm64: dts: qcom: msm8996pro: expand Adreno OPP table

Yassine Oudjana (2):
  arm64: dts: qcom: msm8996: Add MSM8996 Pro support
  arm64: dts: qcom: msm8996-xiaomi-scorpio, natrium: Use MSM8996 Pro

 .../devicetree/bindings/arm/qcom.yaml         |   5 +
 arch/arm64/boot/dts/qcom/Makefile             |   4 +-
 .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  |   3 -
 .../boot/dts/qcom/msm8996-xiaomi-gemini.dts   |   1 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 112 ++++---
 ...rium.dts => msm8996pro-xiaomi-natrium.dts} |   3 +-
 ...rpio.dts => msm8996pro-xiaomi-scorpio.dts} |   3 +-
 arch/arm64/boot/dts/qcom/msm8996pro.dtsi      | 291 ++++++++++++++++++
 8 files changed, 369 insertions(+), 53 deletions(-)
 rename arch/arm64/boot/dts/qcom/{msm8996-xiaomi-natrium.dts => msm8996pro-xiaomi-natrium.dts} (99%)
 rename arch/arm64/boot/dts/qcom/{msm8996-xiaomi-scorpio.dts => msm8996pro-xiaomi-scorpio.dts} (99%)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996pro.dtsi

-- 
2.35.1

