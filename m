Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6BAD671F70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 15:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbjAROY1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 09:24:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbjAROYJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 09:24:09 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D67B1ABD7
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 06:08:36 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so1479979wml.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 06:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=voyq36MDE3tAT+mEidIfHFRQCvxeo+KUD1PRZZG5SU0=;
        b=5rJqASU9iSQiHx66T22qg9IDXWVbiYgoGS8cNgZDYhwZdfKKzQJKdcjCv5DLl06Bjo
         o58a4idkz25Ws+/09qIAhmYNhjHCybhAT87d4icilSN7YN2wdQuXuxs7nuBe7RP4mWRR
         hZPYrStS6vPRQCjX9n+35t3f9iME5i4wJpZTrh5TetbJTl9auY8nSdt/FPBYNbJ9+VG4
         wAhjRrBsq5Ypbz09PxPWHIVry9Wfk2DqD6AMWi/XHQvxJix22gTS+UamF486xuupwZ+O
         y/rGZ3GYWXB9gYaYSfV5W4TO6HkC7ncIa74Ru5+5pTHSrAl4T4NhAy+HtPbkGK1InMqQ
         T9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=voyq36MDE3tAT+mEidIfHFRQCvxeo+KUD1PRZZG5SU0=;
        b=rjbHMtONibqx/x2AFXaZmkLHd8GRS2PWNHnx7mZekeSqqQGNRgLP96zT9xfoa9gxrS
         /eK1aI3sZdCPVYJcl6c70/AraPya5/Pt2BJLbR+6hVi0j7fwMcnk4ADwK11Yp21mGFND
         D8XEje2xrCbXYMOesEr2TBlux/GzDbnAcPUF87k8fawNZx55O1d/mTHMlUixx0d7l6jO
         7q6bn0GzGKRN4cj3DK1Amk+uaxshAOxNQwIMH8uK+jn3/Z8IdEUsCRNcCmAK8UuF4OtD
         /VTJr0OrxHdIg6UY/pp89/eIrs6KwIpFQjP816+zObAUfHeWI27ZzJGNqdyiLJ45tic4
         uT0g==
X-Gm-Message-State: AFqh2kpYInvL9/7o8fx98cjNiYmggukV3/fw3ZNW86vfhgkHsbkd1dew
        VTyThlB4i9UdccXVq6m34qIZXg==
X-Google-Smtp-Source: AMrXdXvS075M7JzYZCCt5HQzpUsJnMKuIoUn0gu0aeia6fZtLwRS2+eMnr7izJtqNAXCiAddzDVa1A==
X-Received: by 2002:a05:600c:3ca6:b0:3d1:caf1:3f56 with SMTP id bg38-20020a05600c3ca600b003d1caf13f56mr15628618wmb.9.1674050914743;
        Wed, 18 Jan 2023 06:08:34 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1866:5d91:a429:aba])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b003db012d49b7sm3193431wms.2.2023.01.18.06.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 06:08:34 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 0/2] qcom: sa8775p: add the interconnect driver for Qualcomm SA8775P platforms
Date:   Wed, 18 Jan 2023 15:08:23 +0100
Message-Id: <20230118140825.242544-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the DT bindings and driver for the RPMh interconnect on the sa8775p
platform from Qualcomm.

v1 -> v2:
- create a separate DT binding document for the sa8775p interconnect
- drop the lemans code name from the driver
- constify the qcom_icc_desc structs
- minor tweaks and improvements to the driver
- make sure the bindings pass tests

Bartosz Golaszewski (1):
  dt-bindings: interconnect: qcom: document the interconnects for
    sa8775p

Shazad Hussain (1):
  interconnect: qcom: add a driver for sa8775p

 .../interconnect/qcom,sa8775p-rpmh.yaml       |   50 +
 drivers/interconnect/qcom/Kconfig             |    9 +
 drivers/interconnect/qcom/Makefile            |    2 +
 drivers/interconnect/qcom/sa8775p.c           | 2541 +++++++++++++++++
 .../interconnect/qcom,sa8775p-rpmh.h          |  231 ++
 5 files changed, 2833 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
 create mode 100644 drivers/interconnect/qcom/sa8775p.c
 create mode 100644 include/dt-bindings/interconnect/qcom,sa8775p-rpmh.h

-- 
2.37.2

