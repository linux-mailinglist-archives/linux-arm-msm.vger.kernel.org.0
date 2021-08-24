Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83DFB3F5751
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 06:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhHXEf3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 00:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbhHXEf2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 00:35:28 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A88C061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 21:34:44 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id b9so7095216plx.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 21:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=q8uzaPXyIk7Lcvi592FTGr3MgKXDVxicIMraBhYYobU=;
        b=MOqWr+rYqzs9v5DGkcIzlsNEj+S78cflalafLAXsMg38vy4TPgOxS8QLtGdongQ6wh
         K8IG3goZ1Nzs8V8uFJc/Im6kt4eLN0kSQzxAML7JXnOaxnREqSwOj46LJyvDWKimK/yi
         UIwg6Qj0Nv6NNdCPNIxnKQ362kTJhj+8NORcQ5YFMEat5v2cJ+MbDV5kkKtMbEIrM+QD
         363ggDyLRMFXJ/uqv3shKPSnHYVmQDIlI8XKS8DAWSloM43+dNn2dyCbyiL52rT0UUGu
         srmED6GhVR9H8I1wkZHoered2tYWhTq2dHOPRh3ErLBlM/5RcTnkgHF5L085Wn5b/Pry
         SWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=q8uzaPXyIk7Lcvi592FTGr3MgKXDVxicIMraBhYYobU=;
        b=NlaMwtgxprgx0KeBJDN5T7NIjCyHo2TIo/U59OAzoMaxM6EqblMIF8zdDShd9p1VOD
         k2mjSyMuuhrSMqeK3BcM5xg+AvFkITHaSBG0Gr2VKw+m4clFAmJwCjdo066b153UwnFG
         jmjnQejw5bSbAjCi+7ih5QiDjEBTq0Dle+av4PsscGUzUhBSZEt0/uM1sVqXI484i+c/
         mIH7kuorGVzz8pn7DSaY2rGk3txeIwhBr481GU1Tjx8ruYww5FJLokVjVysVfVOXIuvW
         1cB8O1Yx1OXKn357Vp50DqOfKpBPVPTy08c/09bqmbmYEi5596kg4Qn5UjKBfM7i43cB
         Q3qQ==
X-Gm-Message-State: AOAM533sm+IF0D40bsAYoWUP+DHyXTod0sBC4S7TM6bNOplp6UluZumJ
        LSTUMDTbqckxong6txR7zIYMBA==
X-Google-Smtp-Source: ABdhPJz4PUk9snxRhgduyAbRQLaYlZ9h2aubaN3MV5x2WQGNtpLvkCy1pbtlyJ6VHwer1jpbQdcutw==
X-Received: by 2002:a17:903:1cb:b0:12d:b9c8:4e22 with SMTP id e11-20020a17090301cb00b0012db9c84e22mr31577278plh.42.1629779684108;
        Mon, 23 Aug 2021 21:34:44 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id p10sm789401pjv.39.2021.08.23.21.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 21:34:43 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Georgi Djakov <djakov@kernel.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 0/3] Add missing A2NoC QoS clocks for SDM660 interconnect driver
Date:   Tue, 24 Aug 2021 12:34:32 +0800
Message-Id: <20210824043435.23190-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The series updates SDM660 interconnect bindings, driver and device tree
to add A2NoC clocks required for QoS registers programming per downstream
kernel[1].  Otherwise, qcom_icc_noc_set_qos_priority() call on mas_ufs or
mas_usb_hs node will simply result in a hardware hang on SDM660 SoC.

Changes for v2:
- Fix dt_binding_check issues
- Drop 'reg' change from DTS patch
- Add Tested-by tag from Bjorn

[1] https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/sdm660-bus.dtsi?h=LA.UM.8.2.r1-04800-sdm660.0#n43

Shawn Guo (3):
  dt-bindings: interconnect: sdm660: Add missing a2noc qos clocks
  interconnect: qcom: sdm660: Add missing a2noc qos clocks
  arm64: dts: qcom: sdm630: Add missing a2noc qos clocks

 .../bindings/interconnect/qcom,sdm660.yaml    | 46 +++++++++++++++++--
 arch/arm64/boot/dts/qcom/sdm630.dtsi          | 15 +++++-
 drivers/interconnect/qcom/sdm660.c            | 14 ++++++
 3 files changed, 69 insertions(+), 6 deletions(-)

-- 
2.17.1

