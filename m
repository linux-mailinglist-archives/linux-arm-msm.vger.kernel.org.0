Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42FE062CFAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 01:32:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbiKQAcn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 19:32:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232126AbiKQAcl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 19:32:41 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1431A48767
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 16:32:40 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso3201678wma.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 16:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r7G4fVB+TT43vmZ+0Lh6W0bX1q4zqJhNuuMucC92SVo=;
        b=KayzsT5kEmIR/XizYJUu8zCpunlQVHDg8VmDJcK543bDEII7ZzGMn2QYbS93SV9sZ4
         bajPBpYF7gGkCegzYPPJl9CIQrS0KrTncfzrFbhSlbhu5hI1nd6pNWql/mM2RmK31LFs
         eoZx6yjIlB1B5c/n06W5P/PhFV/iLQPZ5SqnwytezfgclhH0A+nlsoUKrVt2j4mCkwxe
         7lHMGLnZSYoyJEXXuFToUH+0AqHpn+GlCPOYzm+zCwxC48Bk040kySdyhQ0+OfZH7zLE
         ti+NzpVIAuTMtUmmZUqKLfxC8bhOCflDaw67KPVLntQOxdMPhgN4hNqn8e9JTECXStn2
         mWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7G4fVB+TT43vmZ+0Lh6W0bX1q4zqJhNuuMucC92SVo=;
        b=NcwYZjqx3xxZKy9l7eO27FKfomd1TCk4T0iWlWkHVYHAgxcsUPtYONkmaLRJZPTIQ2
         VO9RE+B1mv9QrlJW+dDCNGoHPqeO8nmChZKvKdse0Io5YbzjmayhvAgcnPqrMQYDHg8H
         T3f6MbUxO3Tt5oW6OyKCxMJ/cK//Aod9qfFTEUHjwcF1ubl5Cfh21h5OdDN9oEbE79Z2
         c6ToKmK3MXcWuxCdaOyYdpbYKt8PVCb5KE/SNjnge66IDhyaQxP4Ex2flhiwHINermcz
         eHVDSw0TGud7bIDOyrXmNnrQ3HSYmncPUjgPmL7oByKZy78hupUUFVSI5iE1LRGPLkQx
         x7hQ==
X-Gm-Message-State: ANoB5plAdfzo3y0Ye02pb15Y5IzINTnRgf7cwaBDF7d2c4DkUGM4rjyr
        cOgr5zamgnI18d2x/TDI2CbmLw==
X-Google-Smtp-Source: AA0mqf4uCqD7gA+4y4pRW+AX5RQnY118jPoC/oBnV/rbXTm7hdZOYDXb6tEbqih+dnZEtgKmgZDZ9g==
X-Received: by 2002:a1c:7701:0:b0:3cf:7556:a592 with SMTP id t1-20020a1c7701000000b003cf7556a592mr62928wmi.199.1668645158603;
        Wed, 16 Nov 2022 16:32:38 -0800 (PST)
Received: from localhost.localdomain (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r18-20020adfe692000000b00238df11940fsm16472703wrm.16.2022.11.16.16.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 16:32:38 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v7 0/7] CAMSS fixes for rb3, switch on IMX577 for RB5
Date:   Thu, 17 Nov 2022 00:32:25 +0000
Message-Id: <20221117003232.589734-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V7:
- Adds further RB from Konrad
- Moves status="okay" below regulator declarations in qrb5165::camss - Konrad

Previous
https://lore.kernel.org/linux-arm-msm/20221116162801.546737-1-bryan.odonoghue@linaro.org/T/#t

Bootable
https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-22-11-16-sm8250-camss-vc

V6:
- Squashes down ok/okay disable/disabled
- Adds Rb as indicated by Laurent, Konrad
- Alphabetizes existing rb3 dts and new rb5 dts for camera
- Adds in ports@ definition per Laurent's suggestion for sm8250
- Adds in ports@ in dtsi for sdm845
- Drops reg = <x> in port definition of sdm845-db845c
- ov9282 for rb5 is omitted as more work needs to be done to
  get this sensor delivering CSI data.
- ov7251 left as-is upstream, disabled on rb3
- Plan to look at overlaying both of these in the future
  but there may be bootloader blockages for that so left alone
  for the moment.
- Tested on linux-next as at today

Previous
https://lore.kernel.org/all/20221112172650.127280-1-bryan.odonoghue@linaro.org/

Bootable
https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-22-11-15-sm8250-camss-vc

V5:
- Rolls three identified dts non-confirmances into three separate patches - Konrad
- Fixes the "both" left in the git log - Konrad

Previous
https://lore.kernel.org/all/20221112124126.86815-1-bryan.odonoghue@linaro.org/

V4:
- Rebases on top of Konrad's comment fixes to migrate into rb3 mezz.dts -Bjorn
- Adds -state suffix - Bjorn
- Adds -pins suffix - Bjorn
- Removes redundant newline - Krzysztof

Previous
https://lore.kernel.org/all/20221108021816.213084-1-bryan.odonoghue@linaro.org/

Dependency for the imx577 should be merged in 6.2
https://git.linuxtv.org/sailus/media_tree.git/log/?h=for-6.2-2-signed&ofs=50

V3:
- Ordering patch was applied separately, now dropped from this series.
- camcc disable patch similarly is already applied, dropped here.
- RB5 and RB3 now have separate camera specific DTSI files
  per perferences expressed on the mailing list by Konrad, Vladimir and
  Bjorn.
- Agreeing a imx412 change spiralled a bit into a wider discussion however
  after a good bit of debate and testing on different hardware there is a
  series to add imx577 as a compat string to the imx412.c driver.
  So this series depends on that series being merged.
  https://www.spinics.net/lists/linux-media/msg219989.html

  Given the addition of mezzanine specific dtsi I thought it was worthwhile
  to kick off a review now since the sensor name change is agreed but not
  yet applied and all other outstanding comments have been addressed.
 
V2:

- Adds fix for bug identified by Vladimir
  The CCI i2c_adapter_add() and pm_runtime_enable() are racy.
  This is a generic problem not related to the rb5/imx577 but, for the sake
  of our conversation/review's context I'll add it into this series.
- Include Vladimir's camcc patch
  I've also opted to include Vladimir's disable of camcc to make the enable
  of it in my patchset logical.
- Move address/size cells Konrad
- Remove newline in pin definitions - Konrad
- Remove sensor 'status = "okay"' - Konrad
- Add comment to qrb5165-rb5.dts re: imx412 and imx577 difference - Konrad
- Move pin definitions to 8250 dtsi - Vladimir
- Drop power domain from sensor definition - Vladimir
- Correct to "add to cam2" not "cam1" in commit log - bod

To make verification of the CCI race eaiser I've provided a defconfig both
with and without modules enabled.

Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-24-05-22%2bimx577-rb5
Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-24-05-22%2bimx577-rb5-compiled-in

git diff linaro/linux-next-22-05-22+imx577-rb5 linaro/linux-next-24-05-22+imx577-rb5

V1:
Linux-next now has everything we need to switch on this sensor both in the
qcom DTS and in the imx412 driver.

After this, no further dts or driver work is required to capture images on
the RB5.

Here's a bootable linux-next with a kernel config. I added Vladimir's
power-domain changes on-top to verify nothing breaks for me.

https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-18-05-22%2bimx577-rb5

Bryan O'Donoghue (7):
  arm64: dts: qcom: sdm845: Define the number of available ports
  arm64: dts: qcom: sdm845-db845c: Drop redundant address-cells,
    size-cells declaration
  arm64: dts: qcom: sdm845-db845c: Drop redundant reg = in port
  arm64: dts: qcom: sdm845-db845c: Use okay not ok, disabled not disable
    for status
  arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Add navigation
    mezzanine dts
  arm64: dts: qcom: sm8250: camss: Define ports and ports address/size
    cells
  arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Add vision mezzanine

 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../dts/qcom/qrb5165-rb5-vision-mezzanine.dts |  62 +++++++++++
 .../sdm845-db845c-navigation-mezzanine.dts    | 104 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    | 101 -----------------
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  16 +++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  62 +++++++++++
 6 files changed, 246 insertions(+), 101 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts

-- 
2.34.1

