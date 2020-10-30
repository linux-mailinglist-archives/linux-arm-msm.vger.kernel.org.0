Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9FC29FF35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 08:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbgJ3H5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 03:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbgJ3H5f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 03:57:35 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB5BCC0613CF;
        Fri, 30 Oct 2020 00:57:35 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id o3so4506618pgr.11;
        Fri, 30 Oct 2020 00:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+vb6m+GtPCOAaRlHA7iQi9d/A/nU9vGONoKDqZKALL4=;
        b=Hw0FvShzQ10z5Mfp1Uq+GIfJp03i+3rFFtGa5DlmBczPupdV3qOV2geLAdIrXvVsc2
         JcnNopqWVAnoD4MlSfHX2FD2iPaaewVLnghRHO9jDQ+aXYY6jdKuAe7tmt/2u8L/LKJ9
         E+p3kL89fkSKTfA/iT3BTCLQUF1CXrHf1vttL9mchkQkVHApWmhPCMhWeSPqFhLdT4q6
         S9GPB416pGe8T1yp6kv1EXQ/U3tH0WaC1nbNYfdmoexUkCUsSiTdxfI+rb5I3DdjhPSg
         UvowSeX3lCovJCuVAjNwjqyqTYmPfzyc4fhkvqrsXYorrTuWQTpBOhxk4bBikqAW7uXv
         cVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+vb6m+GtPCOAaRlHA7iQi9d/A/nU9vGONoKDqZKALL4=;
        b=eX5S/FwVeqnNIXSAfUgEFuoqFbNP/K7+u37ypHvBE38OrCi/tyrJQjjNFjCDoKTlk4
         2JdkK05zF/rmTzIkxnP/kB9W0XSRRAAFNQrXNAfPaMRCPt+FxZFkusRTVRZK8ZUcE7F4
         OUxId3Y0CMCc82U93s7rP8GYSofdbFI5hJX6HWQzjX7aR8pvazM+R9JvkC50p6WbwxAo
         50MMWGm3OvHjo6gnaKawUd0TVtv8QXvc9j7nw3yLV3LIZ+iq+80ab0pLQUlPRIzi+pOy
         KIJpNuOgSmiyJHIlEoa7mP7C+PZt/2kydFXPPE4LEFQEaoXZTuHayCLWMiy9zRMxAdWg
         AOXQ==
X-Gm-Message-State: AOAM531rSfAkNX+L/it37ImkIMxw+c4cXJg5gj1U1IpRevKDHC7IcWwy
        ruBPktNEowMFLomagghOy26xc7iTeZgKKA==
X-Google-Smtp-Source: ABdhPJy4Oy2cf9uRsN+HTvti+TO90lHjvCcMcN31+n+9a2UFFKXw0iZ/MmkyYiUvvE/R4QmBWJ1Xsg==
X-Received: by 2002:a62:f20e:0:b029:15e:1332:63be with SMTP id m14-20020a62f20e0000b029015e133263bemr7667148pfh.72.1604044655103;
        Fri, 30 Oct 2020 00:57:35 -0700 (PDT)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
        by smtp.gmail.com with ESMTPSA id p188sm4638176pgp.65.2020.10.30.00.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 00:57:34 -0700 (PDT)
From:   Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        srinivas.kandagatla@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, cychiang@chromium.org,
        tzungbi@chromium.org, dianders@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: [PATCH v2 0/2] Modify documentation and machine driver for SC7180 sound card
Date:   Fri, 30 Oct 2020 15:57:22 +0800
Message-Id: <20201030075724.1616766-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Note:
- The patch is made by the collaboration of
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>
 Cheng-Yi Chiang <cychiang@chromium.org>

Changes from v1 to v2:
- Ducumentation: Modify the dimc-gpios property description and examples.
- Machine driver: 
  - Remove "qcom,sc7180-sndcard-rt5682-m98357-2mic" compatible
  - See gpio property and use anadditional control.
  
Thanks for the review!

Ajye Huang (2):
  ASoC: google: dt-bindings: modify machine bindings for two MICs case
  ASoC: qcom: sc7180: Modify machine driver for 2mic

 .../bindings/sound/google,sc7180-trogdor.yaml | 58 ++++++++++++++++++
 sound/soc/qcom/sc7180.c                       | 59 +++++++++++++++++++
 2 files changed, 117 insertions(+)

-- 
2.25.1

