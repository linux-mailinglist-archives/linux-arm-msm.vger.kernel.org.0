Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9F84368EA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 03:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfFFBCy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 21:02:54 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:47002 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbfFFBCx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 21:02:53 -0400
Received: by mail-pf1-f196.google.com with SMTP id y11so360887pfm.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2019 18:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=A3e4mWtDvoL8bXfJvxffe+5ZazlEmjOb3McggPS9Avs=;
        b=rSnkgkj7ns3K16zuZcdEi6cb801U98fio5fbEzP2UdnS/Nm4wTOFB6zXqdsagDI7z4
         LKdZInQq92yZmswl5tfO9W+Ot7TtGbvsHYYvsRNld4K+vceHus2drvCDK5sr/EnAap48
         g4GtCQaKr8sOBQbiOUIwaEmhT8dw6tAFE5Zl9bU2jZODV/MWMw+XqU43kP4sAhggQXnu
         HzsRG1Eeqy3AAIaKEKkIz5DjBc6N2VPIPFjO2rs+H4cVjaXNAHwxbteF1LHbXD0M83I9
         1M9XmhZ/Nwc3zlJpnE1z/3I/eq1YZgL/j+N3qg5CNtg2ehMuN5/Jjnrtr3sIdmpa+9zE
         /G2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=A3e4mWtDvoL8bXfJvxffe+5ZazlEmjOb3McggPS9Avs=;
        b=oRggt+jS/4R+eBvnFo77P6MoMKzC0Cxk+hnARebpqdTS4Culc0ZubqWMkyaU6SOaol
         lQpcLSHWB4JwPhl2qRaRT5REa+PAxnc2YxnVTXo/U8HtyX34hqY9tc5POliUjWxpHrHx
         DHEOUDRn+qo2LZHQ5a2W7/46kmDCVZmThhO5Iv+5dhQ2YRNDGfTVMfLEPbkQY00aXt+X
         I8qje92p3gjQb3Hsi8b0zqiLINf0IDqixQ/0z/IivYqfd+hI3h9d8qYZKku3WIwQ6zsZ
         zedUNCmNT6wrASoGIj0C8K66kf4ViHaHsl13iQcA5sZfhw1Txc8gtjVqPA+fVByUIqia
         NdnA==
X-Gm-Message-State: APjAAAW9Eah7JrHiRGnj4KNTPkueL4FIk30Jjvbny8Ejax5SF//Lg2fh
        +cfhVF7d7jxaPKCkd6DOzAlRqQ==
X-Google-Smtp-Source: APXvYqx/bSa1Dbjvq7bqSIloUGEE/H2kkQfxUwX8mrfDswpMxtORjizTjCmCVJCEazDcEZ709fA5UA==
X-Received: by 2002:a63:eb50:: with SMTP id b16mr711499pgk.150.1559782972862;
        Wed, 05 Jun 2019 18:02:52 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 144sm170856pfy.54.2019.06.05.18.02.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 18:02:52 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Evan Green <evgreen@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: [PATCH v2 0/3] (Qualcomm) UFS device reset support
Date:   Wed,  5 Jun 2019 18:02:46 -0700
Message-Id: <20190606010249.3538-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series exposes the ufs_reset line as a gpio, adds support for ufshcd to
acquire and toggle this and then adds this to SDM845 MTP.

Bjorn Andersson (3):
  pinctrl: qcom: sdm845: Expose ufs_reset as gpio
  scsi: ufs: Allow resetting the UFS device
  arm64: dts: qcom: sdm845-mtp: Specify UFS device-reset GPIO

 .../bindings/pinctrl/qcom,sdm845-pinctrl.txt  |  2 +-
 .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  2 +
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |  2 +
 drivers/pinctrl/qcom/pinctrl-sdm845.c         | 12 ++---
 drivers/scsi/ufs/ufshcd.c                     | 44 +++++++++++++++++++
 drivers/scsi/ufs/ufshcd.h                     |  4 ++
 6 files changed, 59 insertions(+), 7 deletions(-)

-- 
2.18.0

