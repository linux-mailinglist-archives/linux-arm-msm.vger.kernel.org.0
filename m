Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 208C165D1E5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 12:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234981AbjADLz4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 06:55:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234378AbjADLzg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 06:55:36 -0500
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C83A1ADB0;
        Wed,  4 Jan 2023 03:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1672833330;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=f+DZJZFA4HVTXZmXLLzVmB/8UhqVAKcG5fSs6Nis3wE=;
    b=J4OXV/y4N+Hdwv5ZxuGY4NklmyFS7kwZtt3MaGUcwNdzn8iANfYJ5VTV3KN8FaKDIB
    WCj60nEwyih9HNRm92fpkfiSlhZ7Jgrw3CKiHnlWlqX8ZTJN4OiMd1oko7Q4EfbuOE2s
    uurRn6c7yW/NBzx9EJVFWfcTx15ZBJfuAAmLiTKviYE5HmkGtkaXkVjWMlrE7UvNxXPe
    mEgig8/YQrXVv06gWHD4szx6RlJmCxyXBucfqi4STuX4L6S3GwmwpxZmH6M7getFQzOe
    gZidEfB3HkmIO5T4e+3ktacnOawhND6wCjdbtYcqT78KxwA0JDiM+YG7xv9Ds4nZBOxC
    0Ayg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIRvweF+KLA=="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
    with ESMTPSA id Yce349z04BtUkzH
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 4 Jan 2023 12:55:30 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 0/4] soc: qcom: socinfo: Add a bunch of older SoCs
Date:   Wed,  4 Jan 2023 12:53:44 +0100
Message-Id: <20230104115348.25046-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sync the SoC IDs in qcom,ids.h with relevant entries from Qualcomm's LK 
bootloader that is used for almost all older Qualcomm SoCs. This is 
meant to reduce the effort for future SoC bring-up (to avoid having to 
send a separate patch series for each new SoC) and will also benefit 
other projects using the same dt-bindings, e.g. bootloaders where 
adding support for all these SoCs is a bit easier than on Linux.

Stephan Gerhold (4):
  soc: qcom: socinfo: Fix soc_id order
  dt-bindings: arm: qcom,ids: Add QRD board ID
  dt-bindings: arm: qcom,ids: Add a bunch of older SoCs
  soc: qcom: socinfo: Add a bunch of older SoCs

 drivers/soc/qcom/socinfo.c         | 80 ++++++++++++++++++++++++++++--
 include/dt-bindings/arm/qcom,ids.h | 75 ++++++++++++++++++++++++++++
 2 files changed, 152 insertions(+), 3 deletions(-)

-- 
2.39.0

