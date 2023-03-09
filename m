Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2A236B2706
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 15:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231839AbjCIOg1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 09:36:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231851AbjCIOgQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 09:36:16 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C33E7EC9
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 06:35:56 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id e13so2069947wro.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 06:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678372554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1dOA5NAW0Uw4MR5cd/LmYCKh7WIP5B2Eohn9tRKWQlI=;
        b=TrHSPIC1hKqvSTqGwgfV4kMYpfzoClytRetHFJU/NCIcJ/GVHP3nHuQsYxau5kt7Xq
         Vop2v6AXBNEqJqTkt5QRWq9h1MLQ+WxW+xIYdGCOnWXITPSBnx5vq3t83yFpxjx6ppwI
         5ZLHJEObDfqPp7Id/Q6raFuS8101qNRXKLVVH0trnODeHGX/bWCKODQBB5KRt/ZfVThI
         Oxe226F1xlInj7g33nVK9BmhY5/35nNpZrUEo9m7kisL0DcEvwcPhEoByQPlVnPhI3n1
         zIiOx4VaES6y1odbb27KZ1SBHQ24Kss3RPeSzqODhzB0uAR9qlhJDibDAjoxjC2388IU
         jjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678372554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dOA5NAW0Uw4MR5cd/LmYCKh7WIP5B2Eohn9tRKWQlI=;
        b=FpP8wwQvaK3pu1OV8siKSUPPCi+rGunOXox+Gb/4Yd0/jAFFdjKJpwDbule11GgGVs
         pRoQd7o3JPZbv3Q3ac2bBigdQ+sJhbahTD306wxqTYYwI5emYJ2jf0XmF0Ao99y5axWg
         /hYSyjZb1NSDTdhG9EmX/fVZ4AkvQmBl0XmBmJGFm/Ezkj+n6XfvYMgKTqjER1fgfZI7
         RD0eigC2jv5iqL9hUQL/txEQ7xaPNpjcJi/By34btUqVuIrHpq8yjfemphvIOJKm8K11
         FAohrpwUmVcS/LBA/uiLKvy69sE95SW07dmuCdeQVs2K4PcUgXMmmug9P83/o/bUrkWo
         tskA==
X-Gm-Message-State: AO0yUKURJJfAuCbD8mDX3c+fo6zFLHdb80tcjTTpPVQX+nvotWDLb046
        20t+txC/4wy82P4dQQWMvCgxbA==
X-Google-Smtp-Source: AK7set+YXwTBK/pZbxWNAXm4c5iFD+KU6hyN2NRJHWUBD67+t3K9Xl8gm3MHYAbjRo+IspauRD/e9A==
X-Received: by 2002:a5d:5689:0:b0:2c7:1b3e:362c with SMTP id f9-20020a5d5689000000b002c71b3e362cmr13544095wrv.42.1678372554626;
        Thu, 09 Mar 2023 06:35:54 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f14c:2275:50fc:c056])
        by smtp.gmail.com with ESMTPSA id z4-20020adfd0c4000000b002c5493a17efsm17871405wrh.25.2023.03.09.06.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:35:54 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 0/2] arm64: qcom: sa8155-adp: enable the high-speed UART for GNSS
Date:   Thu,  9 Mar 2023 15:35:49 +0100
Message-Id: <20230309143551.200694-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the relevant QUPv3 node to SoC dtsi and enable it in the board dts for
sa8155p-adp.

Bartosz Golaszewski (2):
  arm64: dts: sm8150: add the QUPv3 high-speed UART node
  arm64: dts: qcom: sa8155p-adp: enable the GNSS high-speed UART

 arch/arm64/boot/dts/qcom/sa8155p-adp.dts |  5 +++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi     | 21 +++++++++++++++++++++
 2 files changed, 26 insertions(+)

-- 
2.37.2

