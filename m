Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3F2605C58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Oct 2022 12:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiJTKbb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Oct 2022 06:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiJTKbY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Oct 2022 06:31:24 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 117BE17AA2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 03:31:23 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id j4so32835473lfk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 03:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nvzETyi58I2x9C8Q5sGM2W1oTSNPE/0QRrBwTJYfW7U=;
        b=bA9atUmGBhZXLqKhBlql+4s+YeTtyKqzxMtEjU5krKJI797Zk52xr9A+t5WK1aDSxG
         raf7noTQxTDgDfbTw04M9d9TL4A+sJA3x3oMlaaHduaRTYT+ZgcMOip8CaRdQ5U33Ulv
         9f6eOIwyl6wCV56bnAXoTmyBAtaltwR1knBEkyawU33g+QOmlGmN4i2w86vbtDFjkQM5
         ELeab+emvLzcPGdsr0hlIhil5u6z8huIxbaviAdSculy5CEcQFKV6oPR5BerqG5rfpMH
         61vgtEpqCVLwzKA7nzkhQ8p5QBfO9dFvCTNINwGL+ZnkUZzvbvqRLacAyasdP+yXtP+m
         a+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvzETyi58I2x9C8Q5sGM2W1oTSNPE/0QRrBwTJYfW7U=;
        b=QfwiK5zuJb0zk8J8dSQpqFyKhVCI8vsWVE16pR0eMs+6yx2UPJMLU94NfAEorvMFqk
         elLIRvYPy530kwlFdZHkwgWGwP37xmi3Bdpt2GiVtOR7lfpbUm0mZPIWfiT2RB9nANm4
         4/08NzbfEs5DWohAZmkX9yp/B0A34vrhkrEDNhlGpQFJZRc7RJmBSzpeRbH3CjLhFnbk
         Z2tlLYQbBO8djva1wT27BsWoHfWmJ4gQfhJMCOOO76bvCG2AAt0XmkR5IVtmt5KQ6sEr
         sN0BC7ukb/iKniH2zJA8aA5pumKRKP62V01XKQEmCUUb47uoP8/DeCM0Aj66Hm0bQyHl
         Qtxg==
X-Gm-Message-State: ACrzQf3xJKJQSkZyZNrWk9WQkVrYtfcup3jF8C4UGNVngWubjaHCDleP
        e/uxurMlvj6IxeG4RdRVV/Fyhg==
X-Google-Smtp-Source: AMsMyM7A6+ghP51jtjrPCu23VMI7EuEmnEGZYJVmwSboOMIFdgjTvievr2lO7TEaRt36YyFauhvhqQ==
X-Received: by 2002:a05:6512:114a:b0:4a2:58a3:95f2 with SMTP id m10-20020a056512114a00b004a258a395f2mr4710665lfg.7.1666261881316;
        Thu, 20 Oct 2022 03:31:21 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l2-20020a2e3e02000000b0026be1de1500sm2829019lja.79.2022.10.20.03.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 03:31:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/4] PCI: qcom: use clk_bulk API
Date:   Thu, 20 Oct 2022 13:31:16 +0300
Message-Id: <20221020103120.1541862-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace open-coded clk iterations with clk_bulk_ API usage.

Dmitry Baryshkov (4):
  PCI: qcom: Move 2_1_0 defines close to the struct definition
  PCI: qcom: Use clk_bulk_ API for 1.0.0 clocks handling
  PCI: qcom: Use clk_bulk_ API for 2.3.2 clocks handling
  PCI: qcom: Use clk_bulk_ API for 2.3.3 clocks handling

 drivers/pci/controller/dwc/pcie-qcom.c | 230 +++++--------------------
 1 file changed, 45 insertions(+), 185 deletions(-)

-- 
2.35.1

