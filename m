Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C14C92FDD18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 00:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbhATWgZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 17:36:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730543AbhATWWU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 17:22:20 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97FCEC0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 14:21:07 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id x71so10984424oia.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 14:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iuuB/jOlzPElZfMvk5p2UDvJi85zELwSvE3glw8OPIw=;
        b=e2o98l27C2vaXITzOO4ZXqZ4QA16q+H8vup/3a0lHVCDl1dlwZmg+AwCy/mdauli/1
         tXjQ3FLWcMf+lEq6r7IPBOZvlP9a4E8IwTwsa/dw6uWlTNk/2shXK+4TDAejDTO46O/N
         APFPzMl4dfG06AxgPuyBnpMIPZfmnjcEbnSdtSxIy6zj3egxRf1bQvw3+DJ2nMwRa2Tt
         WKixlcmo1MfHtx5NwsfK5CMZujrUhC0DTwAOUQ5CRTwLvQKdS04LajteEys2UH1Cvgwu
         1q3pNSTXhFEqanuq8hrhkQ9imy2VvBtou79eF/53c9C0SsfLrDjMTW7ri3vAklH/HL3X
         aJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iuuB/jOlzPElZfMvk5p2UDvJi85zELwSvE3glw8OPIw=;
        b=hSba8/Gb6eL6K7EwQSTxx4ZF/LqtOZLoTX1BYSWt5oNq/jiTaMzshzFbkvoY8Wx0wy
         BFEkwT5niz+sNWfoPxrUZ3uIc/ZckzY9vkLxSjATBbZcqjTBNeKF/C7EXg+VrBpxckEF
         QXjmmsC80Ugn6qE7UGNCPL1ioFMjsq5ZiXxI2G3NcbvMI+I1rG2HztMuN+TNwkK62uzx
         FoN70t2oKgrgqTHKvg35zslmdxYW3aowyEBOC8UA68GNCkXXbDuLQuxzOJ8W2PMLWSWd
         oSGKweZzmnJoggjvn/2FnSnhWc3GuMUGXvoxWsT0gBVWO2a/iY3yStnzRKhLzXdB96fd
         9Jhg==
X-Gm-Message-State: AOAM532xvxEXCB5vTKQKDCyCJMCHc1EHT5OTvOnE7I8OK51SJmfQcxaa
        kiaA01ndIC7lvHqTFcgUvQnSAA==
X-Google-Smtp-Source: ABdhPJytfmfxPYq2+G1uFOWDMntzi0gw0jgFPSvVK1kERm0z+jCb/zumi/rIT1FeyHa6hU0hHsiMDg==
X-Received: by 2002:a05:6808:9a:: with SMTP id s26mr4254499oic.124.1611181266962;
        Wed, 20 Jan 2021 14:21:06 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h127sm660819oia.28.2021.01.20.14.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 14:21:06 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] pinctrl: qcom: TLMM driver for SC8180x
Date:   Wed, 20 Jan 2021 14:21:11 -0800
Message-Id: <20210120222114.1609779-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches introduces a binding documenting the shared properties of all
TLMM blocks, then defines the binding for the SC8180x specifically, followed by
the actual driver.

Bjorn Andersson (3):
  dt-bindings: pinctrl: qcom: Define common TLMM binding
  dt-bindings: pinctrl: qcom: Add sc8180x binding
  pinctrl: qcom: Add sc8180x TLMM driver

 .../pinctrl/qcom,sc8180x-pinctrl.yaml         |  153 ++
 .../bindings/pinctrl/qcom,tlmm-common.yaml    |   85 +
 drivers/pinctrl/qcom/Kconfig                  |    9 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-sc8180x.c        | 1624 +++++++++++++++++
 5 files changed, 1872 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sc8180x.c

-- 
2.29.2

