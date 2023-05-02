Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB0C6F404A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 11:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbjEBJkN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 05:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232402AbjEBJkM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 05:40:12 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A2E4C1A
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 02:40:10 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-63b4e5fdb1eso4090908b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 02:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683020410; x=1685612410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p0EM1KfEkWdmbenmmKTmndNQvUH4fhO8eMeYu5/GCBA=;
        b=CcW+T0V+YCJiGfqC3N51BuI7OGprNz3ll0jCqRG9PepX1Hnd8e9CuYcbWSQI13YIeK
         pYD+c/mRcFLh4xHW2eh4cmzJF3JbGi35yMohxKhNkcQh9baTgxwn8abtunikcJgHWzdA
         NzzJFr/aSW+JpJl49GG/yD/bSc/l9sHxoQ/b/rxjPf8rg7GYTeeOXZhNzTH1199DrzKN
         IeskilqAblrKSpUdFgDt7poc3spkR5qpIexKlfw646vrFRHHBL0k1adWYmaVEmtRcO4e
         GZe0cT6GPs2cNa+9CjaWzktTyANRcxVEqUw21whJL62WNCfZVjd3Ei+H8sAroW1e48ej
         spLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683020410; x=1685612410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0EM1KfEkWdmbenmmKTmndNQvUH4fhO8eMeYu5/GCBA=;
        b=RT4K571N8sbiwMF0jkFKSu0BoKKOUzhfQjq/tNr1rGvD8oLk4raiIcTcCkTA9UezEE
         N8vhEJwVOh22JXwFibwcBEBG0Dqa5GX0O43q2XpK1xEz0usSuV6YGpHaWjdLFQjqUwWR
         Qs9yQIG27B/RMPuv76eQrLTpFW6MCHUr7CHdTy3sjhrfUQI1tDY2Qdh3i+r2MKFDjz4n
         GZDE3CoMWStmD84kAn+IbFvRf03902bEGeipNtXHEmoRz+tsYQTk70sday0b19UjgyQk
         DeF8jb0pCjsLeIvZXK2YsUf5GIONTcHRguvWrLtzpgjBahkTBzo0qxXbCQ8qYi3wPiyO
         PZjQ==
X-Gm-Message-State: AC+VfDxvdb2H+F6qf1xZTFXXDfn4w007hIcJFFgzc1gRz3SXii10S+48
        894vSib24SqQo+GXk91bkKvKPGyHG5w6EOnVPqQ=
X-Google-Smtp-Source: ACHHUZ5VXg2nqQCwv/AlCxkqiRBLo6bI1j9hoX7TYxNQaIxXF69693k1ls6Q+JfRbKR+GkOLO+gk8w==
X-Received: by 2002:a05:6a20:158c:b0:f2:e399:b114 with SMTP id h12-20020a056a20158c00b000f2e399b114mr20821046pzj.1.1683020409833;
        Tue, 02 May 2023 02:40:09 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3b:58fa:39f6:37e1:bb9a:a094])
        by smtp.gmail.com with ESMTPSA id r78-20020a632b51000000b00520f316ebe3sm18201585pgr.62.2023.05.02.02.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 02:40:09 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v2 0/2] Qualcomm EUD: Some cleanups
Date:   Tue,  2 May 2023 15:09:57 +0530
Message-Id: <20230502093959.1258889-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v1:
----------------
- v1 can be seen here: https://lore.kernel.org/linux-arm-msm/20230104091922.3959602-2-bhupesh.sharma@linaro.org/
- Changed the commit log for [PATCH 2/2] as per Rob's observation.

This patchset targets some cleanups for the EUD dt nodes present
in sc7280.dtsi and also adds a missing space in the compatible string
in the example used in eud dt-binding document.

Bhupesh Sharma (2):
  arm64: dts: qcom: sc7280: Fix EUD dt node syntax
  dt-bindings: soc: qcom: eud: Fix compatible string in the example

 .../bindings/soc/qcom/qcom,eud.yaml           |  4 ++-
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 36 +++++++++----------
 2 files changed, 21 insertions(+), 19 deletions(-)

-- 
2.38.1

