Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C95A3B54CE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jun 2021 20:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbhF0TAU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 15:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231298AbhF0TAU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 15:00:20 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8C5DC061574;
        Sun, 27 Jun 2021 11:57:54 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id d11so17968057wrm.0;
        Sun, 27 Jun 2021 11:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M/3/joTnhRd17fCBvR7XJw02bsdVZrFj5dA6ttjMmdo=;
        b=L7wp89raLmw2Qhvg8cJyD+vjhtQp9x60n5BoouREW91gbZqyVqpX2yJd8YNlrF0FpK
         fY7Zy1yZhMUk8D21USjI+XjmPFkXVCEgvJ7APRKoeCMk3WYX4krWXvo0NMwJTIyVzkuh
         6xM6RVzM5duxFlEb+f7fYZqrJpAjtLVWL2VDgLybOflPcPTFqqFH4Q83q9Cs4SOYDA6J
         okRlWL5Jb5+AysEfv98Re033KkkkY/MCjPKl68xfewRoDPLrvXZn8WiXF1oKgvNpVaLe
         4548stdjNIV/yn5w/v3uPpuoIvvaxtDimQusO/JovK8fMybBGwL8YqKuzK7xDtTmYOLt
         pe7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M/3/joTnhRd17fCBvR7XJw02bsdVZrFj5dA6ttjMmdo=;
        b=BsiumquqABMCj9F6J98AJrheqI3ZNxPWESjOeeZ9T4c/KcOpD6sDamctshyVkjWIVi
         EDLfpNQ1IHvvTyv1ylyqTiFnCCi9AvURb3sMYYB3d5+Bg8gLXQlHdM4rSYRaFQNO1S0C
         mvkpTrh5ROfPzYrKjXFeSpWY2yKebAlsdBy59DtqC2GJierFTnJC7SeWRGo1QQ0rscHe
         C4YzzDrcKwb1eS4ZcnkGgR5CrHBuP2UIYXiA4W9FoTgjRJ4sJPhPbSX/K9VKihFMrt8i
         rp/AcLqtbU8H+Mvb1ppg/oKYmF8EQFsdowUAv8kokU7B6eGHi/YgNIBP/V7fxAft9zqA
         +2sQ==
X-Gm-Message-State: AOAM531pPS2W0GSvQeEss/m2RVa7LNf4N/+BHyhIn40QZEFjgeQiNN5E
        E1x6iKBcP1JKAUJfVhDbYIA=
X-Google-Smtp-Source: ABdhPJykFvXVZYIxBISkFs/2/ZDJTHrGDO7IOLNgjL/04Qhbm/69bPZ322YUI3TVd5AwaTBZyGtdTA==
X-Received: by 2002:a5d:5685:: with SMTP id f5mr15391725wrv.101.1624820273454;
        Sun, 27 Jun 2021 11:57:53 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id a4sm4022812wru.55.2021.06.27.11.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 11:57:52 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v2 0/3] Add USB HS support for SM4250/6115
Date:   Sun, 27 Jun 2021 21:57:47 +0300
Message-Id: <20210627185750.693222-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The USB controller found on SM4250/6115 is dwc3 (phy v1), very similar to
existing supported phys (like msm8996), with slighly different tune seq.

PS1: I know the series is already in usb-next, I can make a new series that
will remove the 4250 compat from the existing code (but it would be 3 commits
as well), let me know how to proceed.

PS2: I kept the Bjorn Reviewed-by, because I'm only removing the compat string,
which he agreed to, in a similar setting https://lkml.org/lkml/2021/6/25/351

v1: https://lkml.org/lkml/2021/6/22/1183

Changes from v1:
- remove 4250 compat, both platforms will share one dtsi

Iskren Chernev (3):
  dt-bindings: usb: qcom,dwc3: Add bindings for sm6115
  dt-bindings: phy: qcom,qusb2: document sm6115 compatible
  phy: qcom-qusb2: Add configuration for SM6115

 .../bindings/phy/qcom,qusb2-phy.yaml          |  1 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml    |  1 +
 drivers/phy/qualcomm/phy-qcom-qusb2.c         | 31 +++++++++++++++++++
 3 files changed, 33 insertions(+)


base-commit: e71e3a48a7e89fa71fb70bf4602367528864d2ff
-- 
2.32.0

