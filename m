Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2A876F39BB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 23:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232749AbjEAVZ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 17:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232739AbjEAVZy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 17:25:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 638E826B6
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 14:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682976304;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=b4hWdlZUh/I1V34KeJHnhX0DVGXHnzi9BuAVJg9r45Y=;
        b=W5pnKgTQiokMLc2dZO3V8CTD1ExnvgCD7HrQcTi4BX8V9XLThqsFA3quKObs/57e3FQzdI
        zyuv9UguP4JXwcfhrf/uMMAuyixNsotitkTIyDljl5PSkUTdL/WXTp0p4VLoWDJb3KkGAw
        Dq0a0XHjTCbItNnRSLsxk2S8VZWm7nI=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-Yuhiw5Y-NCe4vxvzR6j4sA-1; Mon, 01 May 2023 17:25:03 -0400
X-MC-Unique: Yuhiw5Y-NCe4vxvzR6j4sA-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-38cff75386cso497488b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 14:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682976302; x=1685568302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4hWdlZUh/I1V34KeJHnhX0DVGXHnzi9BuAVJg9r45Y=;
        b=QU3LIpddov8IpkxrtC85Nbkx4+P8SbOQqLg7L6L1vShrWFwUcoMiqHRvtBp9QfySuD
         ZtCPn+lYJE23hwC/NZmz1W7m9tzXRqKSHROObF/q6DAWNwUEaNozNadB0fL7ZLNg6y6b
         AVMwnq1dL+VCVfwouuDP70LQhbYA0SF8pxXUUPGZ8A4NNeIZael8jZnd6y04odOjibEm
         5CnlKCZPYtXap0S3PKh2wV56xssuyezpOtDgSCJjHyNg+NK1BrOM9dZSG+gBRVf+NJM+
         c+5NaGxms+hIwlIGtufXagYga8cUGr4t16pjrAT7J/quyWgThMo9wGdAXmA/xMVvJvZe
         qTFg==
X-Gm-Message-State: AC+VfDzFhv4wzwktIdBtoPO6UMSmj8ru0Kb8iTA3QuhH6yMjUEQPWLzg
        OYcNCJG1byNcRThq2vKwuoG+DOCfLfa3oQoZqHYf0T3qYPMtzvPX+Bl3E9DM4RT8Nve1+64Wb3h
        i5jkLJQPlrfOizkMswRzrhNc6bg==
X-Received: by 2002:a05:6808:6344:b0:389:6b0e:9d97 with SMTP id eb4-20020a056808634400b003896b0e9d97mr6381218oib.1.1682976302773;
        Mon, 01 May 2023 14:25:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5/JTveP7hQ9LaVlU9ju8ERfkRoeXqvFL8qWujiCq0sEua2Qm+RjPehAuaWxO4bCATJSHkjKw==
X-Received: by 2002:a05:6808:6344:b0:389:6b0e:9d97 with SMTP id eb4-20020a056808634400b003896b0e9d97mr6381210oib.1.1682976302563;
        Mon, 01 May 2023 14:25:02 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id q5-20020acac005000000b0038756901d1esm11911385oif.35.2023.05.01.14.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 14:25:02 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH v4 v0/4] sa8155p-adp devicetree ethernet cleanup
Date:   Mon,  1 May 2023 16:24:42 -0500
Message-Id: <20230501212446.2570364-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series cleans up some devicetree conventions in sa8155p-adp based
on feedback from other platforms.

The hope is that by getting it right here, future contributors won't
repeat the same mistakes as I did!

v3: https://lore.kernel.org/linux-arm-msm/20230421205512.339850-1-ahalaney@redhat.com/

Thanks,
Andrew

Andrew Halaney (4):
  arm64: dts: qcom: sa8155p-adp: Make compatible the first property
  arm64: dts: qcom: Make -cells decimal
  arm64: dts: qcom: sa8155p-adp: Remove unneeded rgmii_phy information
  arm64: dts: qcom: sa8155p-adp: Move mtl nodes into ethernet node

 arch/arm64/boot/dts/qcom/ipq6018.dtsi        |  2 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi        | 14 ++---
 arch/arm64/boot/dts/qcom/msm8953.dtsi        |  4 +-
 arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts |  4 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts     | 56 ++++++++++----------
 5 files changed, 39 insertions(+), 41 deletions(-)

-- 
2.40.0

