Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0076D6DE598
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 22:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbjDKUVU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 16:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjDKUVU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 16:21:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7401346B2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 13:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681244425;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=1X1257RiPm0+EqIQdLdY8EZJdNOboaVApm9s8W5RPoA=;
        b=VUOCpcvpr9wsNj9SWXB+DvZTkYCav0TQy2bYRPwb9gV+RI/I6up6fHe46YyGwuKEj3J0w2
        47+1jW4XxnpbeEFy8HegdxQqMGfveZRxz6e8Sw7QLvzMnVRmoLKlbTzkaAu8lmw5Gf7nok
        czwN4EW5M5zlNnHAwirRElOQgZkpBg4=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-SCM-nM6UOaq_2EYRX6ggIA-1; Tue, 11 Apr 2023 16:20:24 -0400
X-MC-Unique: SCM-nM6UOaq_2EYRX6ggIA-1
Received: by mail-oo1-f70.google.com with SMTP id z141-20020a4a4993000000b00537d702c199so3110497ooa.15
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 13:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681244423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1X1257RiPm0+EqIQdLdY8EZJdNOboaVApm9s8W5RPoA=;
        b=Kvv9eyzyJA/6hywIKF8Mf8RgLY40O3r+tmc+492ilL3Zhdmf+uwdrSZnw04zWa+drY
         KZDmPFBNwNt9SV1aAnUDz7sr9Xl3+tB1HGrVtLQCqVsdY69nSZCWlgn972a/1jE5ywyC
         a7FCPL9KTGHgLHoXvo7hGiLm72bNVHpO9Q1XAL7JSZeTuKT/j3zBpKW9mpseVIqov9p1
         yL7mE6FjUTsB1l0QmBziF/oNKyctm1zIsSRPVDDiVOKN+GG6rlTEM6ES4PA8s0JA5kCv
         BUDJ56DXbpUy4iNu5qmqB9v/zWpkxwNuga/86eF8Ek8S71USuTjbZMID/XZ2aq6T4KLq
         tFLw==
X-Gm-Message-State: AAQBX9dIwIvO7Iw4+vIsKbtn1bOpylkvoqlassMRG7LltsjnErCiBIDZ
        vG2cx7prt0TCS86wuVzsjH9hJloaLkk/3EGxoUDRXqL+uLJSQTyE4N3ubcp8MDQnlGzZjJIN+w2
        hjAjk6GrRC6QTmPBy02rPRSe1mA==
X-Received: by 2002:aca:2116:0:b0:384:2d3d:8dab with SMTP id 22-20020aca2116000000b003842d3d8dabmr6403627oiz.58.1681244423570;
        Tue, 11 Apr 2023 13:20:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350YJHMM7YveuM1hzKClhx7F7zKb9Wmh+6PKHIi//bXeiNy/POD5elG9ihQ3BmihU0dfLzqgvfg==
X-Received: by 2002:aca:2116:0:b0:384:2d3d:8dab with SMTP id 22-20020aca2116000000b003842d3d8dabmr6403605oiz.58.1681244423339;
        Tue, 11 Apr 2023 13:20:23 -0700 (PDT)
Received: from halaney-x13s.attlocal.net (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id a6-20020a056808120600b003874631e249sm5976710oil.36.2023.04.11.13.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 13:20:22 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        richardcochran@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        netdev@vger.kernel.org, bmasney@redhat.com, echanude@redhat.com,
        ncai@quicinc.com, jsuraj@qti.qualcomm.com, hisunil@quicinc.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH v4 0/3] Add EMAC3 support for sa8540p-ride (devicetree/clk bits)
Date:   Tue, 11 Apr 2023 15:20:06 -0500
Message-Id: <20230411202009.460650-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a forward port / upstream refactor of code delivered
downstream by Qualcomm over at [0] to enable the DWMAC5 based
implementation called EMAC3 on the sa8540p-ride dev board.

From what I can tell with the board schematic in hand,
as well as the code delivered, the main changes needed are:

    1. A new address space layout for dwmac5/EMAC3 MTL/DMA regs
    2. A new programming sequence required for the EMAC3 base platforms

This series addresses the devicetree and clock changes to support this
hardware bringup.

As requested[1], it has been split up by compile deps / maintainer tree.
The associated v4 of the netdev specific changes can be found at [2].
Together, they result in the ethernet controller working for
both controllers on this platform.

[0] https://git.codelinaro.org/clo/la/kernel/ark-5.14/-/commit/510235ad02d7f0df478146fb00d7a4ba74821b17
[1] https://lore.kernel.org/netdev/20230320202802.4e7dc54c@kernel.org/
[2] https://lore.kernel.org/netdev/20230411200409.455355-1-ahalaney@redhat.com/T/#t

v3: https://lore.kernel.org/netdev/20230331215804.783439-1-ahalaney@redhat.com/T/#m2f267485d215903494d9572507417793e600b2bf
v2: https://lore.kernel.org/netdev/20230320221617.236323-1-ahalaney@redhat.com/
v1: https://lore.kernel.org/netdev/20230313165620.128463-1-ahalaney@redhat.com/

Thanks,
Andrew


Andrew Halaney (3):
  clk: qcom: gcc-sc8280xp: Add EMAC GDSCs
  arm64: dts: qcom: sc8280xp: Add ethernet nodes
  arm64: dts: qcom: sa8540p-ride: Add ethernet nodes

 arch/arm64/boot/dts/qcom/sa8540p-ride.dts     | 180 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |  59 ++++++
 drivers/clk/qcom/gcc-sc8280xp.c               |  18 ++
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h |   2 +
 4 files changed, 259 insertions(+)

-- 
2.39.2

