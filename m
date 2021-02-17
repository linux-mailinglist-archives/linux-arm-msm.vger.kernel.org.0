Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D7B31D81E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 12:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbhBQLXF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 06:23:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbhBQLWi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 06:22:38 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE1BC0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 03:21:57 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id ly28so1531519ejb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 03:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nSSmjbLA+/KjLCfGlNJghiIhgRjhtmzpaZbEhkRgbnc=;
        b=s7kJo1sJ5k6R1o9gP50G3lbfHQ6MrYLqkvtr5oBhuDknmru2pjnrEgEe00DpgwbzOS
         CI5qXnuUAJobQ6TJtaYH4/W9xUYB6QoRAUQk1KnXLfF4fzWx7oi3bZvg97kUDZkfaEJS
         6BggrRqeFto35iTQN5FgT5eMHLbMLHUIO0PnZrZ+wvEkuQClSTPNz8KkLukAq9fMeCGG
         xiJk4ZWgDB1j2dNkjfBM9Av58MBt4wHPCMkKv7OoQhdtJPEkeGmFhgoZkZdLjom/PRwB
         9zfw2WtxyBnFuyYruQfDRfoJ0ZzzRiUSu/jWJpLLYkEZQI1gf1XdHWrB80lhWjdlcSqm
         UOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nSSmjbLA+/KjLCfGlNJghiIhgRjhtmzpaZbEhkRgbnc=;
        b=KdNQ+aAyLNuaXJSNhWSarK4iZ5Yr5TDOWkIKixa95AIKNOKZutiYOvt8Jq+t8zs6/e
         NElxxvzxA/h+a5/JN68AN1yR3pfGxL3w9MME86JJKdb/2gSGIZJGLCf+RBL5X04pwETl
         oc0P9mjt4YO6C83fEP8LkahMPpO6h0Wkyp2KwWVWweeXY467b6S9YzCo6Xq9rgcAlPC9
         uzSihQPnj0OKuut66nQ4Eg9kKnETFovhZ8hmm3guXbdV1Ii1trHG44BkSyU+BXy4+oRL
         z2whpy0jUJQQYHV70ivW53W/G3Hp0GmJuLg82Z/tjv/7DZAW6Mtlztm1i0ZZzQ3ZJabF
         iECg==
X-Gm-Message-State: AOAM532mljA3bSYIDqr9hgPoK4Nshn1RcTTQXp1uHu3F4OM6SiMmpwYx
        NxAD756T7cwyKboa5Ijj4Yubqw==
X-Google-Smtp-Source: ABdhPJwygshMu+2zNpHsr7EPW062OlH5u7LRBK0FeriJw6cxlUXYAcwGEjrF6O08hpihj+Lq3L3XPQ==
X-Received: by 2002:a17:906:d1c8:: with SMTP id bs8mr2380317ejb.7.1613560916066;
        Wed, 17 Feb 2021 03:21:56 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:4815:d4dc:ff5a:704a])
        by smtp.gmail.com with ESMTPSA id h10sm934344edk.45.2021.02.17.03.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 03:21:55 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v5 00/22] Add support for the SDM845 Camera Subsystem
Date:   Wed, 17 Feb 2021 12:21:00 +0100
Message-Id: <20210217112122.424236-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series implements support for the camera subsystem found in
the SDM845 SOCs and the Titan 170 ISP. The support is partial
in that it implements CSIPHY, CSID, and partial VFE support.

The Titan generation of the ISP diverges a fair amount from the
design of the previous architecture generation, CAMSS. As a result
some pretty invasive refactoring is done in this series. It also
means that at this time we're unable to implement support for all
of the IP blocks contained. This is due to a combination of legal
considerations with respect to the IP and its owner Qualcomm and
time & man hour constrains on the Linaro side.

The CSIPHY (CSI Physical Layer) & CSID (CSI Decoder) support is
complete, but the VFE (Video Front End, which is referred to as IFE
(Image Front End) in the Titan generation of ISPs) only has support
for the RDI (Raw Dump Interface) which allows the raw output of
the CSID to be written to memory.

The 2nd interface implemented in the VFE silicon is the PIX
interface, and camss does not support it for this generation of ISPs.
The reason for this is that the PIX interface is used for sending
image data to the BPS (Bayer Processing Section) & IPE (Image
Processing Engine), but both of these units are beyond the scope
of enabling basic ISP functionality for the SDM845.

Since the Titan architecture generation diverges quite a bit from
the CAMSS generation, a lot of pretty major refactoring is carried
out in this series. Both the CSID & VFE core paths are made more
general and hardware version specific parts are broken out.
The CSIPHY didn't require quite as radical changes and therefore
keeps its current form.

Tested on:
 - Qcom RB3 / db845c + camera mezzanine, which is SDM845 based
 - db410c + D3 Camera mezzanine, which is APQ8016 based
 
Branch:
 - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v1
 - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v2
 - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v3
 - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v4
 - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v5


Due to the dt-bindings supporting sdm660-camss, this series depends
the sdm660 clock driver being upstreamed. I've linked this series below.

SDM630/660 Multimedia and GPU clock controllers
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=366077


Robert Foss (22):
  media: camss: Fix vfe_isr_comp_done() documentation
  media: camss: Fix vfe_isr comment typo
  media: camss: Replace trace_printk() with dev_dbg()
  media: camss: Add CAMSS_845 camss version
  media: camss: Make ISPIF subdevice optional
  media: camss: Refactor VFE HW version support
  media: camss: Add support for VFE hardware version Titan 170
  media: camss: Add missing format identifiers
  media: camss: Refactor CSID HW version support
  media: camss: Add support for CSID hardware version Titan 170
  media: camss: Add support for CSIPHY hardware version Titan 170
  media: camss: Remove per VFE power domain toggling
  media: camss: Enable SDM845
  dt-bindings: media: camss: Add qcom,msm8916-camss binding
  dt-bindings: media: camss: Add qcom,msm8996-camss binding
  dt-bindings: media: camss: Add qcom,sdm660-camss binding
  dt-bindings: media: camss: Add qcom,sdm845-camss binding
  MAINTAINERS: Change CAMSS documentation to use dtschema bindings
  media: dt-bindings: media: Remove qcom,camss documentation
  arm64: dts: sdm845: Add CAMSS ISP node
  arm64: dts: sdm845-db845c: Configure regulators for camss node
  arm64: dts: sdm845-db845c: Enable ov8856 sensor and connect to ISP

 .../devicetree/bindings/media/qcom,camss.txt  |  236 ----
 .../bindings/media/qcom,msm8916-camss.yaml    |  256 ++++
 .../bindings/media/qcom,msm8996-camss.yaml    |  387 ++++++
 .../bindings/media/qcom,sdm660-camss.yaml     |  398 ++++++
 .../bindings/media/qcom,sdm845-camss.yaml     |  370 ++++++
 MAINTAINERS                                   |    2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |   23 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  135 ++
 drivers/media/platform/qcom/camss/Makefile    |    6 +
 .../platform/qcom/camss/camss-csid-170.c      |  602 +++++++++
 .../platform/qcom/camss/camss-csid-4-1.c      |  330 +++++
 .../platform/qcom/camss/camss-csid-4-7.c      |  406 ++++++
 .../media/platform/qcom/camss/camss-csid.c    |  620 +--------
 .../media/platform/qcom/camss/camss-csid.h    |  178 ++-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  182 ++-
 .../media/platform/qcom/camss/camss-csiphy.c  |   66 +-
 .../media/platform/qcom/camss/camss-ispif.c   |  122 +-
 .../media/platform/qcom/camss/camss-ispif.h   |    3 +-
 .../media/platform/qcom/camss/camss-vfe-170.c |  789 +++++++++++
 .../media/platform/qcom/camss/camss-vfe-4-1.c |  125 +-
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  246 ++--
 .../media/platform/qcom/camss/camss-vfe-4-8.c | 1166 +++++++++++++++++
 .../platform/qcom/camss/camss-vfe-gen1.c      |  763 +++++++++++
 .../platform/qcom/camss/camss-vfe-gen1.h      |  110 ++
 drivers/media/platform/qcom/camss/camss-vfe.c |  848 +-----------
 drivers/media/platform/qcom/camss/camss-vfe.h |  127 +-
 .../media/platform/qcom/camss/camss-video.c   |   52 +
 drivers/media/platform/qcom/camss/camss.c     |  407 ++++--
 drivers/media/platform/qcom/camss/camss.h     |   17 +-
 29 files changed, 6901 insertions(+), 2071 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/qcom,camss.txt
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-170.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-1.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-7.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-170.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-4-8.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.h

-- 
2.27.0

