Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75E281E387E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 07:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgE0Ftv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 01:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0Ftu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 01:49:50 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD3C8C03E96E
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 22:49:50 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id q16so9735307plr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 22:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVRQ/dG/ulblJ6XfEmveJlaTO6rV8wSk5XBgKB7R2z8=;
        b=BynqfQ+a5CBlSg++kvXtdKorWt70nAbQ+AB4vsASLLrHpIBhbOhM6OAKRk2lZNj+kA
         WljhD0oBMlc/5i9E1DkVKQJ8SlYlQI8ucYCGfJftn1M7eDYZVNv+eXnXqtfCdZVWoqrH
         dwemZk680kcFLHibchlHCwPFcGGcic+56SbpnjYYqq48OyOGyXH1OsPAMTwr2Vv0EWRw
         YqPozv5/lTy7+D/29KN9QuzT0GCdxf0Bq0dRR4uu+JpanFNmFH19PORWmbC+n9QnRSe2
         S1wplBoDTWOL1CDlIbBl+Wa4YrUZcx6hx6repqVSqIFvYNCjR4n2EdmiO145otuDW/Ug
         8FOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVRQ/dG/ulblJ6XfEmveJlaTO6rV8wSk5XBgKB7R2z8=;
        b=BJNGUdsDJi/hDVHuKaF8zWnJ5sZEgd55e2HWlXXjPqJUwNtFi0kyIMNwlG3y38HW/2
         0N329P1gtRa7ZMkH1ISy5d2kXFqHqPirpgpR9rRkCR2NnX2eV+T/B03Ch9xipiUMlCg0
         HdllsOY7RbAdKfxYCyqkwu1iv+nkzgU0oG9Ex3IJZXhXUsOOz+jHj3YrynRRLYsXPAdr
         Pz+lmkiqqeoA8Alja0bf9xpXTtf/ggq4C3qrvtKA7Axs9khtIY1DiRutPamLUfh7DhZN
         Ey2nf/9PuAfJyKUwpjR5YyqcrNM16K4bsfeZ55mA0l5CCuHU6/31q15cSfxoN587zcfq
         GSpA==
X-Gm-Message-State: AOAM5307Vm27xkHgp8/ZXU+39jgavlDe3NCWzACJ+2T6WJajVf44b9d3
        tMf0zbB78BFpl+S7nLLWEeomlw==
X-Google-Smtp-Source: ABdhPJxxYTWCxpVs3/p7Y4l6Rw8F2L+7yqSTCrCkinr/sKBgmzP+kAYhcMGEhULY0IXMqrNttZJoMQ==
X-Received: by 2002:a17:902:c004:: with SMTP id v4mr4526725plx.46.1590558590090;
        Tue, 26 May 2020 22:49:50 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 206sm1015873pfy.97.2020.05.26.22.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 22:49:49 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/5]  remoteproc: qcom: PIL info support
Date:   Tue, 26 May 2020 22:48:44 -0700
Message-Id: <20200527054850.2067032-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce support for filling out the relocation information in IMEM, to aid
post mortem debug tools to locate the various remoteprocs.

Bjorn Andersson (5):
  dt-bindings: remoteproc: Add Qualcomm PIL info binding
  remoteproc: qcom: Introduce helper to store pil info in IMEM
  remoteproc: qcom: Update PIL relocation info on load
  arm64: dts: qcom: qcs404: Add IMEM and PIL info region
  arm64: dts: qcom: sdm845: Add IMEM and PIL info region

 .../bindings/remoteproc/qcom,pil-info.yaml    |  44 +++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  15 +++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  15 +++
 drivers/remoteproc/Kconfig                    |   8 ++
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_pil_info.c            | 124 ++++++++++++++++++
 drivers/remoteproc/qcom_pil_info.h            |   7 +
 drivers/remoteproc/qcom_q6v5_adsp.c           |  16 ++-
 drivers/remoteproc/qcom_q6v5_mss.c            |   3 +
 drivers/remoteproc/qcom_q6v5_pas.c            |  15 ++-
 drivers/remoteproc/qcom_q6v5_wcss.c           |  14 +-
 drivers/remoteproc/qcom_wcnss.c               |  14 +-
 12 files changed, 264 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
 create mode 100644 drivers/remoteproc/qcom_pil_info.c
 create mode 100644 drivers/remoteproc/qcom_pil_info.h

-- 
2.26.2

