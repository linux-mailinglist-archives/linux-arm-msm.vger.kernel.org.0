Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B529DECC36
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2019 01:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbfKBAQg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Nov 2019 20:16:36 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44272 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbfKBAQf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Nov 2019 20:16:35 -0400
Received: by mail-pf1-f193.google.com with SMTP id q26so8072135pfn.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2019 17:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UJDwDvYCbETHlfy37MRMYfaTm1etyKUgzvKJNRBP0QI=;
        b=rljSI96ig4BvqVumSplCYvvpgTfW13DjVd1NMadGW9l4HAOm4XjAcaZtkqwwgmOXlm
         eCeV2VeAJUXSA83jFrPluhpVjvUoIZcL8CB9S5hSaWH/8+UiMi96aOkTyKEFJO+cztse
         sk1xFnWCaJvWtHWqRoDOnIsB0+xliFGHKsT0lIjruVKO/nqELZEybsmZHzvI2EBXzXzu
         G8F3e8B9BOgfaCRoHPxnZpYTR0C8EPw0ozLdBiBJhepb8rajZ/Laj4VHep7xXJ0uz+Wa
         QDobu8ZfEDEH5S9FreXvz2lbdlMLkuVEIjHNUiplG/FxmQ2qp3RfB0pMvoOamromCOHh
         KNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UJDwDvYCbETHlfy37MRMYfaTm1etyKUgzvKJNRBP0QI=;
        b=t2I2elTG9oKeXyssLll4E8o5y/5aW5Qo5QEBq7sUOfCdMPQ8P7oJGmhTuLxEvmLCWt
         4W52pXNJKCyT4IIeiry3a+MfvUabK/rjK7nq026ZiEIY/cUNtdX2qUypW4hMZieKliGT
         ZsywKPo1wF+eY6vxKGaxHLy0Ch3tye7ZQq7RTbRSD+R+Ph0Ffrx11Az7/DlO5jo2ZTXr
         UzBCp+a6xUNiUkp6ap9ul23dVY8ZS5Fx8iLW5PKTQT2SY+oQo4SIYq7jHiVXEimmsO7V
         VsUd4bsee4mux74BxSv4mCll78sIlv9ZFT1lV6hOBnhl0dvOFyhhySNlqC9kmeC+3O+S
         sYNw==
X-Gm-Message-State: APjAAAUEArqxnjXjSRCQ79CapjubAT9t0BUK5yt4gA9rSRNdlvaG/nng
        d8c7uRHQfeUoIt3gfG41lVkHnw==
X-Google-Smtp-Source: APXvYqxpru0og3UcqRbD9qrHUO8grlb9amuAcAQup7uyA6pS4DEWkjqbuM2uL7Ip75n74Qoia0uKMg==
X-Received: by 2002:a63:1703:: with SMTP id x3mr16742073pgl.263.1572653792733;
        Fri, 01 Nov 2019 17:16:32 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j11sm7876250pgk.3.2019.11.01.17.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 17:16:32 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/5] phy: qcom-qmp: Add SDM845 QMP and QHP PHYs
Date:   Fri,  1 Nov 2019 17:16:23 -0700
Message-Id: <20191102001628.4090861-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In this second iteration of this patch series support for the GEN3 "QHP" PHY
controller has been added, now enabling use of both the PCIe interfaces on the
Qualcomm SDM845.

Bjorn Andersson (5):
  dt-bindings: phy-qcom-qmp: Add SDM845 PCIe to binding
  phy: qcom-qmp: Increase PHY ready timeout
  phy: qcom: qmp: Use power_on/off ops for PCIe
  phy: qcom: qmp: Add SDM845 PCIe QMP PHY support
  phy: qcom: qmp: Add SDM845 QHP PCIe PHY

 .../devicetree/bindings/phy/qcom-qmp-phy.txt  |  10 +
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 321 +++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 114 +++++++
 3 files changed, 441 insertions(+), 4 deletions(-)

-- 
2.23.0

