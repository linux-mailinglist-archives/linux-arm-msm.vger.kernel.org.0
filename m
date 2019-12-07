Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC704115E89
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2019 21:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfLGUgL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Dec 2019 15:36:11 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46486 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbfLGUgK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Dec 2019 15:36:10 -0500
Received: by mail-pf1-f194.google.com with SMTP id y14so5131305pfm.13;
        Sat, 07 Dec 2019 12:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2kMIJY/eOkF08UFC83+z2Yvw2OEsP0PRB4nAXO2fCAU=;
        b=L1ah2JgjYkVbYTJrHXreZ/M03kKDjwenY8BAjQ9xJEx0gbKashe1+23y3HRp0Xx+WC
         Ou2IQzV+8QXgBlKXvhkEtaCLdSQlIFo+qkXefce0BZdNG5kYKpv3JpAoWpMuy2Lnzwu1
         C5J6apBOhbPYAqsgiW5bhXn3gix9FaHZ83rezWyEV1Za4Jt7ulew6i1DNB5bkjQK02oY
         AzRWp4LLJR/ml+NOxujgBGeSnJuNQbye7c2/YNqS7a8ZU6zfZYHpcI7skbX6dyLODERj
         T4J7zxloGX09YN0DMYOZYbEmtWXI+va/wJdXFZd3GaR71EWPoJJv2wwzxMOu77Q2F70I
         7G8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2kMIJY/eOkF08UFC83+z2Yvw2OEsP0PRB4nAXO2fCAU=;
        b=K6h4yRGw5uWox67kFymH0ajVt4RiTLH+5xeGxxyxSDmNJIOpBxivyzq515piFlL6t/
         RUe2ksGW5Hec1JC1memiWXLu0JMRCRvv59QFAP4d+BoUzPZGF/lb84fztjnPOwpBCPEP
         R9IXO30VkHNxbgmlNDb1jOhJ2+56EDkEPSRn5oGpcMyoEo60ZN/FamiAaYtZ/yQKa+1p
         UfdAKaVtWqp2kvYSZqFm7G1N1sS9yBusctiQl9UpVpyjYAg1LqWwtFW6/IYJbTyc1Rqg
         9vFw4siazumvbKdC2h9f9htrHJ02fuueOpIcTqh/DvWd4Zu0OHEQO37889ljNwSWY+6H
         JbsA==
X-Gm-Message-State: APjAAAVBJEF81vcQXBeyqeUh821lllHhZlRjUQMFyklLfbPtP0MzXP9f
        T2MN+HLKYLSWweESFng4oY8=
X-Google-Smtp-Source: APXvYqyHsn0JRBAztc8gkWedID4H+F1dMmOijtBZeWWN976EbUglK6Cd/j6zKuX60a2hGwZ5Nhn3NA==
X-Received: by 2002:a63:d958:: with SMTP id e24mr10614053pgj.31.1575750969811;
        Sat, 07 Dec 2019 12:36:09 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id d24sm22327447pfq.75.2019.12.07.12.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 12:36:09 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        aarch64-laptops@lists.linaro.org
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-kernel@vger.kernel.org (open list),
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 0/4] drm+dt: multi panel selection and yoga c630 display
Date:   Sat,  7 Dec 2019 12:35:49 -0800
Message-Id: <20191207203553.286017-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

It is not uncommon for devices to use one of several possible panels.
The Lenovo Yoga C630 laptop is one such device.  This patchset
introduces an optional "panel-id" property which can be used by the
firmware to find the correct panel node to enable.  The second patch
adds support in drm/of to automatically pick the enabled endpoint, to
avoid adding the same logic in multiple bridges/drivers.  The last
patch uses this mechanism to enable display support for the Yoga C630.

An example usage:

  boe_panel {
      compatible = "boe,nv133fhm-n61";
      panel-id = <0xc4>;
      /* fw will change status to "Ok" if this panel is installed */
      status = "disabled";

      ports {
          port {
              boe_panel_in_edp: endpoint {
                  remote-endpoint = <&sn65dsi86_out_boe>;
              };
          };
      };
  };

  ivo_panel {
      compatible = "ivo,m133nwf4-r0";
      panel-id = <0xc5>;
      /* fw will change status to "Ok" if this panel is installed */
      status = "disabled";

      ports {
          port {
              ivo_panel_in_edp: endpoint {
                  remote-endpoint = <&sn65dsi86_out_ivo>;
              };
          };
      };
  };

  sn65dsi86: bridge@2c {
      compatible = "ti,sn65dsi86";

      ports {
          #address-cells = <1>;
          #size-cells = <0>;

          port@0 {
              reg = <0>;
              sn65dsi86_in_a: endpoint {
                  remote-endpoint = <&dsi0_out>;
              };
          };

          port@1 {
              reg = <1>;

              sn65dsi86_out_boe: endpoint@c4 {
                  remote-endpoint = <&boe_panel_in_edp>;
              };

              sn65dsi86_out_ivo: endpoint@c5 {
                  remote-endpoint = <&ivo_panel_in_edp>;
              };
          };
      };
  };

This replaces an earlier proposal[1] to use chosen/panel-id to select the
installed panel, in favor of adding support[2] to an EFI driver module
(DtbLoader.efi) to find the installed panel, locate it in dtb via the
'panel-id' property, and update it's status to "Ok".

[1] https://patchwork.kernel.org/cover/11024613/
[2] https://github.com/robclark/edk2/commits/dtbloader

In this case, DtbLoader, which is somewhat generic (ie. this mechanism
applies to all snapdragon based devices which orignally ship with
windows), determines the panel-id of the installed panel from the
UEFIDisplayInfo variable.

As I understand, a similar situation exists with the pine64 laptops.  A
similar scheme could be used to support this, by loading the panel-id
from a u-boot variable.

In other cases (phones), a more device specific shim would be needed to
determine the panel-id by reading some GPIOs, or some other more device-
specific mechanism.

Bjorn Andersson (1):
  arm64: dts: qcom: c630: Enable display

Rob Clark (3):
  dt-bindings: display: panel: document panel-id
  drm/of: add support to find any enabled endpoint
  drm/bridge: ti-sn65dsi86: find any enabled endpoint

 .../bindings/display/panel/panel-common.yaml  |  26 +++
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 165 ++++++++++++++++++
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |   2 +-
 drivers/gpu/drm/drm_of.c                      |  41 ++++-
 4 files changed, 232 insertions(+), 2 deletions(-)

-- 
2.23.0

