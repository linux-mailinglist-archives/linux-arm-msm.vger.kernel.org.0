Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF4246669A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 16:35:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359033AbhLBPjF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 10:39:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241736AbhLBPjF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 10:39:05 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A624C061757
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 07:35:42 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id n33-20020a05600c502100b0032fb900951eso2620091wmr.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 07:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K9HkssWImBKo4dv3s9wAHpKIsxviV3OWoh1pMrK/FGw=;
        b=LkiLZv9W4lisDqFLtuHwYpJj2qkSwCtjsDZafVERHldYcs013qF8QNK1p1AeTn5gXU
         SXi8MRlnjWMkoT2lGtO4ZFSd7fTUVc16t1204++ebAIpgooEeD+X62JdY/xZn6+aOcPh
         3L8Xq/6gNBZ0Bedr+yo7LNDMyaE7BSyBCovZjt3sz+0aB8tDDj1KWiUsDSZ6wzaTlIeO
         kydHNgUzZbfibvyWGa026aBLfLjjI/gEhWwMlwuXpNIUocF551GxTZMLEx/bYs8ky4pb
         zVeGzDsCwKLIVnoiZF0HwHbq7g+G4TN61ikIBwnIHt3a0e427SSwzmxPH+5X7gzRPhIp
         5Vxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K9HkssWImBKo4dv3s9wAHpKIsxviV3OWoh1pMrK/FGw=;
        b=O/0HWJg8Xfs3Gaq3jG4sWT9CU9zMBWpNcOy6CzhyyQpSEg7rL19GQbuo+zFy9GjY47
         UrOGCl8IkU5BL4HtzvPmkROLv+OqYF4l2JB8X85b3zT8f7bOSHjMAT8XWZHxK9FcMY/2
         mCIglT3ZSfQxIYMcxc0fGLty60gXLKDI++Tg74D/6rjEY1lwJ5NVCCb9+LC8ounQmHqR
         Xu1xeeELbPHpe0XnjgncV5DaW6OrY7sMKDeVkeiV5JyYucwzGVZUaJTqOeetVDRFIHNs
         sQ+EMIwRZmNThccnjHnUlUS01Ybqxo/532mTNxa6RenilN/st/B8I7o27E0egKmNHgHO
         1NYg==
X-Gm-Message-State: AOAM533R1FF+eSmgFLAeSEGZeZiFM4lYr3uqRUF9FrnseFd3EZY/OQJ+
        aoQhNcV+irGjtAWeqH8iSziIFnOi9gZTyC+H
X-Google-Smtp-Source: ABdhPJybU9GTeXI6wScQbF0x/FRKJly0GaYA0FzFNcydzxx/pYWjk7DRtHTNavij9meWK3K1AdbRyA==
X-Received: by 2002:a1c:208b:: with SMTP id g133mr7421993wmg.128.1638459340656;
        Thu, 02 Dec 2021 07:35:40 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bd18sm3662wmb.43.2021.12.02.07.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:35:40 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 00/19] CAMSS: Add SM8250 support
Date:   Thu,  2 Dec 2021 15:37:10 +0000
Message-Id: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RESEND V2:
+ Cc: devicetree@vger.kernel.org on first patch

V2:
- Adds Tested-by Julian Grahsl as indicated.
- Fixes low-level noise checkpatch --strict
  I ended up having to push defines into static inlines for this.
- Adds Reviewed-by Robert Foss.
- Adds VFE/CSID fix for sdm845 as explicit additional sdm845 specific
  patch per Robert's suggestion.

I took the time then to test out on sdm845 to ensure the new patch breaks
nothing "./cam -c 1 --capture=1 --file=capture.raw" continues to produce
expected data.

Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=v5.16-rc1-sm8250-camss-imx577-only
Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=v5.16-rc3-sm8250-camss-imx577-only-v2

git diff v5.16-rc1-sm8250-camss-imx577-only..v5.16-rc3-sm8250-camss-imx577-only-v2 -- drivers/media/platform/qcom/camss

V1/RESEND:
RESEND: git send-email --to=inux-arm-msm@vger.kernel.org -> --to=linux-arm-msm@vger.kernel.org

This series is imported from excellent enabling work contributed by
Jonathan Marek which we have picked up in Linaro for the RB5 project.

Link: https://patchwork.kernel.org/project/linux-arm-msm/patch/20210511180728.23781-2-jonathan@marek.ca/
Link: https://www.qualcomm.com/products/robotics-rb5-platform
Link: https://www.96boards.org/product/qualcomm-robotics-rb5
Link: https://www.thundercomm.com/app_en/product/1590131656070623?index=1&categoryId=category0&tabIndex=1

The RB5 has a slightly different sku I think to Jonathan's platform -
QRB5165 in our case with a different version of LK the relevant bootloader
for the board.

As a result we needed to make some additional updates to the provided
patcheset, included here.

The most notable changes are:

- Addition of clocks.
- Addition of bandwidth settings.
- Representing the dependency on a VFE for a given CSID so that V4L
  subdevs will come out of reset right when poked.

A full tree which is bootable and capable of producing pixel data from the
imx577 main sensor is availble here, with this series being a sub-set of
the necessary patches on the SoC side only.

Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=v5.16-rc1-sm8250-camss-imx577-only

media-ctl --reset
media-ctl -v -d /dev/media0 -V '"imx412 '20-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'

yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Bryan O'Donoghue (3):
  media: camss: Add SM8250 bandwdith configuration support
  media: camss: Do vfe_get/vfe_put for csid on sm8250
  media: camss: Apply vfe_get/vfe_put fix to SDM845

Jonathan Marek (16):
  media: dt-bindings: media: camss: Add qcom,sm8250-camss binding
  media: camss: csiphy-3ph: don't print HW version as an error
  media: camss: csiphy-3ph: disable interrupts
  media: camss: csiphy-3ph: add support for SM8250 CSI DPHY
  media: camss: csid-170: fix non-10bit formats
  media: camss: csid-170: don't enable unused irqs
  media: camss: csid-170: remove stray comment
  media: camss: csid-170: support more than one lite vfe
  media: camss: csid-170: set the right HALT_CMD when disabled
  media: camss: csid: allow csid to work without a regulator
  media: camss: remove vdda-csiN from sdm845 resources
  media: camss: fix VFE irq name
  media: camss: vfe-170: fix "VFE halt timeout" error
  media: camss: Add initial support for VFE hardware version Titan 480
  media: camss: add support for V4L2_PIX_FMT_GREY for sdm845 HW
  media: camss: add support for SM8250 camss

 .../bindings/media/qcom,sm8250-camss.yaml     | 450 ++++++++++++++
 drivers/media/platform/qcom/camss/Makefile    |   3 +-
 .../{camss-csid-170.c => camss-csid-gen2.c}   |  32 +-
 .../media/platform/qcom/camss/camss-csid.c    |  56 +-
 .../media/platform/qcom/camss/camss-csid.h    |   2 +-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 184 ++++--
 .../media/platform/qcom/camss/camss-csiphy.c  |   9 +-
 .../media/platform/qcom/camss/camss-vfe-170.c |  12 +-
 .../media/platform/qcom/camss/camss-vfe-480.c | 564 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c |  17 +-
 drivers/media/platform/qcom/camss/camss-vfe.h |   4 +
 .../media/platform/qcom/camss/camss-video.c   |   5 +-
 drivers/media/platform/qcom/camss/camss.c     | 306 +++++++++-
 drivers/media/platform/qcom/camss/camss.h     |  18 +
 14 files changed, 1558 insertions(+), 104 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
 rename drivers/media/platform/qcom/camss/{camss-csid-170.c => camss-csid-gen2.c} (95%)
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-480.c

-- 
2.33.0

