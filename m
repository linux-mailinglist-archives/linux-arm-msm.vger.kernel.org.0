Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 379CE73A060
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 14:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbjFVMCb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 08:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbjFVMCQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 08:02:16 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 827CC2706
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 05:01:54 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f9bece8e19so21935185e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 05:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687435311; x=1690027311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wCOTNZfhd7+agr1wxdRguQNnip7k7RN73PzCcqk8bM4=;
        b=OleKPyhN3R4wczfN+QHAWvvG1WL9/mN+I/K+mCIcYDknUObAItercHBRDw+AYq5bdO
         rxVUFw4luQrnSpDFIYfIsD5LZo7ebRoAnNVqjZ4oS2gzThWzSX3Ubftwhkfdecfzvvoy
         gDuFBbgfvVU7pQ79DU46SdQ+Wzd+KEeeogBxIOXbxgjBfVMQZfcp5pfrQTRc3+urPClw
         BOr7IJ0iygFHiZiGjHtCOhj5gLEytQexoPD8Q9ejTB5+ToE0yLW0aWKVdUuToLth6JC4
         E4+nvFoQBaulTAhf4W/eV/8vRs2xMKS9gIbh31HPeaJ/OCFIrONsjALpdTSloLsRcg2D
         LKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687435311; x=1690027311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wCOTNZfhd7+agr1wxdRguQNnip7k7RN73PzCcqk8bM4=;
        b=UUmaJEI51NwXk0Xy5gBgUooS/T8WKgzGom/g0cCmMhAKM69aIo6zKkvFy5slGQBX/8
         BA9pk+poBDvr7ZAvnub71vOwen2iMxZzUc+rcmsYfETyZ8Sq4+Eo8HPBI9rYjwD+lJHY
         cW7u6ZaSZBgAfgZ7i5kgTYKm60ZMIoXnXj/wP+vb2+tibrP3RZ26uLmq7Zy1xxgcMSJb
         ga1RScuhQQpvGXJB6ArJVTSp5F2VjVYUZ1c1aZGWL8s8NzWMLnFsCmx0UoYJrbZu0zR9
         vc6xKjlXIjYhdzeLJ+Drc7cTdMvENetQT2C0J6xFScRLGdSNFTAtqudDjhxrI06xF2G7
         Ctvw==
X-Gm-Message-State: AC+VfDxyDgNdt9q9LL5zviq6zN81PKrhDNeLpYNN3iLJNafm/C09Esia
        bap8G7dsv5qsUINR/NI5lm+eaQ==
X-Google-Smtp-Source: ACHHUZ4q83MzrTYI5PC+sT3pKo1MxOyPmpZ1Le9Xh/MjC5lBvY/oPQVeLRdZlgcujE9VQ5+gnSMz6Q==
X-Received: by 2002:a1c:7914:0:b0:3f9:eaf6:1760 with SMTP id l20-20020a1c7914000000b003f9eaf61760mr3172664wme.3.1687435311108;
        Thu, 22 Jun 2023 05:01:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d785:af3e:3bf5:7f36])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c231100b003f8ec58995fsm7594296wmo.6.2023.06.22.05.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 05:01:50 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RESEND PATCH v2 0/5] arm64: dts: qcom: enable ethernet on sa8775p-ride
Date:   Thu, 22 Jun 2023 14:01:37 +0200
Message-Id: <20230622120142.218055-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bjorn,

Now that all other bits and pieces are in next, I'm resending the reviewed
DTS patches for pick up. This enables one of the 1Gb ethernet ports on
sa8775p-ride.

Bartosz Golaszewski (5):
  arm64: dts: qcom: sa8775p: add the SGMII PHY node
  arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface
  arm64: dts: qcom: sa8775p-ride: enable the SerDes PHY
  arm64: dts: qcom: sa8775p-ride: add pin functions for ethernet0
  arm64: dts: qcom: sa8775p-ride: enable ethernet0

 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 109 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi     |  42 +++++++++
 2 files changed, 151 insertions(+)

-- 
2.39.2

