Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1F1742F32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jun 2023 23:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbjF2VBg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jun 2023 17:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbjF2VBG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jun 2023 17:01:06 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6203C1BF3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 14:01:03 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fbc0981743so9160415e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 14:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688072462; x=1690664462;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2a4XOvBfl8jkyMyXbTrIC6L2XcvUddWElbWmdZVx9Q4=;
        b=lQmas8RAFfOnCLsgrdNt9JjCe5SQJ3icAxuFDfXXofHxf/R6z1xuAMUQkf3hZ2MUkG
         MVj+PnP3eDBf1AL4qTVFZseMgrf1Fr4TO2rGk9To4o3fT9D/OWNbNu9c7FELAmh/1FMk
         inXNpPhn9k4H6Eqpyely5aTNXgzWLNSagRPHed46y3++IFch5XHBGc5uJCpWDYB4IHeC
         Oz7TsWYHV4z0uKGAd5UOzcfVaTuT12YwJmL4f0cWh8voyaJnjr2dGDYtq5e448W0bYEK
         s1z1V4pLJjSpybxoQ6zTN8tSQtr0Bebsx0SVnzmnvQljsKVI75JS+4/RPtyCHnXauC17
         GVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688072462; x=1690664462;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2a4XOvBfl8jkyMyXbTrIC6L2XcvUddWElbWmdZVx9Q4=;
        b=SGSloy0xATtQ+gcRpITk2h5R3H3jGJRKX5+i1NXCoTs40ozUJY3PE0tuHur3JivxYx
         VoB2qlpL9eJ4yP74FSeKD1EC3mYCjDTElxaqTp1i3fvCf9tBVv5M/XMUcJLcDtQIDDq5
         a71UnGGqVSzyrnKDlqvvCnondNsejEPgJ+PxilSCO6s4Yd+m60valP7i5r+U/skyl1LO
         XPm607M/5S2ebucwbD0uQIHMi6L/2Bk+Nrjmv5yAeCgYfuK6UP2gmxJD75JhX3kd6VOt
         WBnB1pGeCMBX4a2OfLf3rwbzXW5eKxYr74Vms56FcWNYRd8B1Eyhq3tyl9P/DUD93kvm
         q1bw==
X-Gm-Message-State: AC+VfDw1X0ANJcFJTCMInTVbPrFwY+vHpLCt0YwE7Vs/CZzTOCgo4Wbr
        8PoUbRdNtH0miAGhNiX1sowekQ==
X-Google-Smtp-Source: ACHHUZ7M5nUflafoNdqfIa1WrN58O1WA6yIYD+4c21sNwcF2PntOJeAfx1WYslvFt0QV0bXBTUuUTA==
X-Received: by 2002:a05:600c:218e:b0:3fb:b1af:a44b with SMTP id e14-20020a05600c218e00b003fbb1afa44bmr378629wme.5.1688072461815;
        Thu, 29 Jun 2023 14:01:01 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id c15-20020adffb4f000000b00313e4d02be8sm15745722wrs.55.2023.06.29.14.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 14:01:01 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: some sdm850/c630 bits
Date:   Thu, 29 Jun 2023 22:00:52 +0100
Message-Id: <20230627-c630-uart-and-1p2-reg-v2-0-496b581935c1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAATxnWQC/4WNQQ6CMBBFr0K6dkwpUISV9zAspmWAJtqSKRIN4
 e4WLuDy/Z+Xt4lI7CiKNtsE0+qiCz6BumTCTuhHAtcnFkqqQmpVg9WFhDfyAuh7yGcFTCOgrKp
 GN4MprRbJNRgJDKO302G/MC7ExzEzDe5zBh9d4snFJfD37K/5sf5LrTlIMOXNpFiti8bcn84jh
 2vgUXT7vv8AryjKutQAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=845;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=7YLSL57Hzq4sm+S8fpJcy+wBki6LlV+R/beBsDr+sLU=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBknfEM2SWHdAD7ka7R6kfzPE/AeIZc5rjJG/UqQ
 lHyVIht3UOJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZJ3xDAAKCRAFgzErGV9k
 tii5EACZ+QjFyD7MSFqn4Hr2ymzC+b3gD1yFV9nf47OqxzpCu4wly//h9+CpPA42C6KD6MtTb0p
 2vKqnajjGOYw0rxX8rjjV4q3FCsZNZiOv9/GNtIJaMAnhM1JDvOSSXnwiCMfRi1mg+U3dP0F6is
 55C6iTHy5XWitKDda+Ujs4lDAxERg+0lCDlUm9DwqJI9c9rfZo4Z8VQkt6IsteuHS8P5dCyI4xp
 Sg34APosoWDdTmpxsiykwKhKT3nEKwsV3+S9cHM1GcKYNRTm9nustdcubqb7srYVgJd2mVx2fBI
 Rtj4dA0FKxv1OFnxxBs+egVBUItDoI8QzEpOg7KZWD+bv6I1i5FtWXwPCD01mraTOTPVY6lVSjT
 S+ykHSIafaVV+nHKlnrsKbYjDl4+5sLEfKoJ57oQbm5RGEW36Gs51XU8U2VHCr2R6fkdGRkLiXn
 dBmRaidxt3Jhtzdnjh3Xw8j3x2oA7ppCEk1aZHu61nLTPaaeYw1mtacq8Oq8Lb9VM4qv7VA2RZf
 GqCl2JDBdyJVbAVf4BzW6jqDAuSPOcVYdgr8SKXMTBCIpHa4reWgriZVzHHlm4IJJnZvVkVdKLA
 rnV+OYXvM8Crpt4C+QuPkIcC230cg3ZK1aS6+cpheB++eRA5wZfj26jyP5k5KMFAIPPFqeoaLt7
 bIr7NVCJ++TIoXw==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A few DT fixes for the SDM850 laptops

* Add the missing eDP bridge 1p2 regulator on the c630
* Fix bluetooth UART aliases
* Enable debug UART on the c630

---
Changes in v2:
- Fix property ordering in patch 1
- Directly reference hsuart renaming commit in patch 3
- Link to v1: https://lore.kernel.org/r/20230627-c630-uart-and-1p2-reg-v1-0-b48bfb47639b@linaro.org

---
Caleb Connolly (3):
      arm64: dts: qcom: c630: add panel bridge 1p2 regulator
      arm64: dts: qcom: c630: add debug uart
      arm64: dts: qcom: sdm850-*: fix uart6 aliases

 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      | 35 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |  2 +-
 2 files changed, 35 insertions(+), 2 deletions(-)
---
base-commit: c3dae0fa8662b2848ccbcdc6187443ca64cd2808

// Caleb (they/them)

