Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B095B17F089
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 07:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgCJGfL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 02:35:11 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:40178 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgCJGfL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 02:35:11 -0400
Received: by mail-pj1-f67.google.com with SMTP id gv19so1026202pjb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 23:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nP9PNS9eIJgQJAIRsXlp8n4P+pGeRNDem1/JAJ9CZoo=;
        b=yJby5aKYmht78gbCPLKW/yR9kFDyyMOl0hhOcLl9Yv1XCDJgxKqDFQ/VY/Cm4+78Du
         +IXhtz6sRqDL+pbulDPLtlduJdTc0rLACLbmB2Ldp9LZJkHsAZAWrnhtozeQAnDVoSBI
         styPVyZA5xIQFeRnye0NpOM8eKb1OABAEcMq1qLc3FxW4gDXggoW3CCdKelcxrovDwfy
         JckNwcerrnx3xqbuTV35u5gOMdGzCLXP41n/GdmEWZ4gEReWLNM6aV4BcDHwPs0/9OcX
         xgVyrlM+ScKNfn4uMWnrGj7zEPMfT8CFJnM1bzLHDW9mTBewjXgc9m2s52hNUBAtMyVW
         6/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nP9PNS9eIJgQJAIRsXlp8n4P+pGeRNDem1/JAJ9CZoo=;
        b=MKOayb5axef2XSjMnLoda389MWh1uzrmCN//K7Ntjqvp46nKup7BtLnL+H9oswgyzJ
         c+gVcOQO7vy2kJcGqrL7Y9RzegF4PrGrewpX/UbU+Fh/nrqoHCwGQtrRLVnYq/3Rm1Ul
         ebBNQ7WKcQ6sA5AXUowRLhHrsDFvgbUicEOHrDG4ttZj8dM7N3YwnHqpe3OA3+KD3B0a
         EOHjRVflGttcOiWS96YP6JwmKGxUEav5RgsdXAapn49kE7/kJn8bF+oVsqnoq33P4a8L
         Bmcp6jKdlTzNdQI5Boq3POBiDhRiUKrpyBYUcI30ayCXQV8eUPiQbUKAqYVe4VsTmC0U
         iYaA==
X-Gm-Message-State: ANhLgQ1bpFflucQbQzJlZoqbCgw5BLxFs9bXvu4LPLu+/mXLhi/iVgqt
        fVsxkFg+Jmit66pXKMACian2VA==
X-Google-Smtp-Source: ADFU+vvNU8SVNQz3C9Imsfqn/W1TG5Peq/nh++Xv6kdj+KouUr/6rTO+KMeCdRN12xY5J1qFbutcuw==
X-Received: by 2002:a17:90b:438d:: with SMTP id in13mr202775pjb.114.1583822110408;
        Mon, 09 Mar 2020 23:35:10 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v8sm1388029pjr.10.2020.03.09.23.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 23:35:09 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 0/5] remoteproc: qcom: PIL info support
Date:   Mon,  9 Mar 2020 23:33:33 -0700
Message-Id: <20200310063338.3344582-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
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
  remoteproc: qcom: Introduce driver to store pil info in IMEM
  remoteproc: qcom: Update PIL relocation info on load
  arm64: dts: qcom: qcs404: Add IMEM and PIL info region
  arm64: dts: qcom: sdm845: Add IMEM and PIL info region

 .../bindings/remoteproc/qcom,pil-info.yaml    |  44 +++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  15 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  15 ++
 drivers/remoteproc/Kconfig                    |   6 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_pil_info.c            | 180 ++++++++++++++++++
 drivers/remoteproc/qcom_pil_info.h            |   8 +
 drivers/remoteproc/qcom_q6v5_adsp.c           |  20 +-
 drivers/remoteproc/qcom_q6v5_mss.c            |   7 +
 drivers/remoteproc/qcom_q6v5_pas.c            |  19 +-
 drivers/remoteproc/qcom_q6v5_wcss.c           |  14 +-
 drivers/remoteproc/qcom_wcnss.c               |  18 +-
 12 files changed, 335 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
 create mode 100644 drivers/remoteproc/qcom_pil_info.c
 create mode 100644 drivers/remoteproc/qcom_pil_info.h

-- 
2.24.0

