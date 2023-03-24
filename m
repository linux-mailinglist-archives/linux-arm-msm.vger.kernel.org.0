Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7176C8699
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 21:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbjCXUQV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 16:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjCXUQU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 16:16:20 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 495C51A492
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 13:16:19 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id bf15so1248558iob.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 13:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679688978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FhG5hmbsQCxfij9PTmIxoJDULuk5TqU9FpKRgA6qb/s=;
        b=p9TqYaVC+WnmOlAZ137r6ix90B/hbaxPGqgZtlYCn2aq7I9isG13SxEL/1SGbVzHkd
         jdCQY2WjFSQ2KZjFeJqc8sD1gXFX1uOCpghHlLlXMRVa7rUOBWjfsSzU2aPENTStZWUu
         1CDCz9qedaiZnhX1rxlRKdBzwDWN2u+ofbcOvMxXPNwBcZSYmrfO7mGRjtcZJvygzutE
         y3UNnGvgW0w1Xxg5FBZpRxLjntLW00HTWFjuAxweknmNGoCpBAbcRbxpnzsZ5SS6X+R+
         IovVHDmaDAdtgqysO18F0sh9yeAFqPc5vokmEur9FVv9D+iUELYn1t1EpK/eMUyU6+0W
         mTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679688978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhG5hmbsQCxfij9PTmIxoJDULuk5TqU9FpKRgA6qb/s=;
        b=aCpynkMDweaHcxiVrrbwKB27kQVd2cj8RXPa004psigbM7u96ZrbZ2xBX3wSN6N8zw
         dYsNt2aiIYN4hHXuKPeH51Ef4l52HwXlSwdvhVCxQuenOtKReolmz9MoTz5iDPEt6JYB
         ESW9gWZOe5NXJ+IXe0g8j3eWwJFHvPObhuLd6Xj8HssArGKJVUl7Cl5/CAC6JEItjKbV
         gUq2Pdny7KLUPmTjnOkt0Wr9YP0p+sCCo42DsvRcMWr3ENLCPws+J+nKw8xGkw1H+MU6
         CnAyjbXmCdoKtNuSbvJ8NrdqK2gyst72E6+VMKtNCSQCYfjj3utwWaNVKEGoiP1+sO1u
         bWiA==
X-Gm-Message-State: AO0yUKWJhDWum1HCSKTkW/5T9j55e3I4UnNjehtWo7cX0ITzpTQGZqsj
        CgNRfLseSmiYRDVxtCKk7h+eBQ==
X-Google-Smtp-Source: AK7set/NcsvsgDS9YLJ9i8Anr2KSynB1EM8QlTXAhoJz7Z5vLYiyFYZJYj7qoM6P9RKW2mY0kih9Mw==
X-Received: by 2002:a5e:c810:0:b0:753:121f:72a8 with SMTP id y16-20020a5ec810000000b00753121f72a8mr3145282iol.8.1679688978592;
        Fri, 24 Mar 2023 13:16:18 -0700 (PDT)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id q12-20020a05663810cc00b003e8a17d7b1fsm7173445jad.27.2023.03.24.13.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 13:15:32 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org
Cc:     quic_rohiagar@quicinc.com, caleb.connolly@linaro.org,
        mka@chromium.org, evgreen@chromium.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ARM: dts: qcom: sdx65: support IPA
Date:   Fri, 24 Mar 2023 15:15:26 -0500
Message-Id: <20230324201528.2540564-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The upstream IPA driver now supports IPA v5.0 for SDX65.  Add
IPA-related nodes and definitions to "sdx65.dtsi", and enable IPA
in "sdx65-mtp.dts".

Having touched these files, Konrad advised I should update them to
move the "status" property to the end of nodes where it is used.

					-Alex

Alex Elder (2):
  ARM: dts: qcom: sdx65: add IPA information
  ARM: dts: qcom-sdx65: move status properties to end of nodes

 arch/arm/boot/dts/qcom-sdx65-mtp.dts | 11 +++++--
 arch/arm/boot/dts/qcom-sdx65.dtsi    | 46 ++++++++++++++++++++++++++--
 2 files changed, 51 insertions(+), 6 deletions(-)

-- 
2.34.1

