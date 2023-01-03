Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3635265BB6A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 08:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbjACHte (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 02:49:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbjACHtd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 02:49:33 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB515F33
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 23:49:31 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id v23so32113171pju.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 23:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2bQEpT5MvpfK5tRet1xVf2lC1kbc6OSmWkVz7dqkqMM=;
        b=K53cKFoe7bZhP1UOS8i3DRf/wKlU1n8Z5hEhsZdGhtiNetXRryOIvnersLNAqAGJLR
         W9qXHQTeW7PgVK/R2qgijHCrAHhj+hAFesxPJkKOrrG4jvOZy8v96l1SXkh6qdo5YAKP
         veEwg33O3vv/vRitpyQDgSqfvAeiK3olVvzRxu6roN8ZLFIM1AYbPT7Bx7SVutxTy2l8
         B/DQIOubhXSmizOsMH1G98H9ipXr7oIIB5gFxIWRMHdsbxs4EWzLXYpr0dBexvyLeT/Z
         AwpKIKI5uPORbIe60HcBCA9uaIlo8SSxCaAKUPZ1ag4HYPMRlm7I/E2aoT5TtgYzWxcd
         bVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bQEpT5MvpfK5tRet1xVf2lC1kbc6OSmWkVz7dqkqMM=;
        b=z19n0LCYbjkiENh5FyLhbTdmX4bxZB5ntJq92B1npz7v8VaBTifDAxCmUECuhrlmvl
         OpD2GEn/ajfejnpkjGBLFb6RsKrKLIQtqJt9+ATkwGbJWDQMzE43+fdsihRGiJGWKTxC
         ek0yvM4S/iVilcCgAhoofTifcQg8qwaofaZfJGMsXYeQODcz58EDixnM0ARGgGA5gLj1
         fAd8vZJfCeW9CVR26CL6hbNoROHt2UkDnqOP+YI056WdZqPOqddPPHJJ41ju2GkUtmXY
         83aXaDRHAuOZCm9wv+nUYYIgTH9/deC82pqd43QzM+/ZrjTLU/HJben5V2LN7BG+Zz3t
         MfNQ==
X-Gm-Message-State: AFqh2kpBTw+6YmkzsC5PdSpk3SET4D5gVrq2s02poR8Vh+9fcU2c1h4X
        mv53wq71LEOwwk9HLKFb7mAC
X-Google-Smtp-Source: AMrXdXue3QLdlbIw5reccHBJ3tFgBJJIijQexoZo8Haz9S/OLMwrG7l5ohRBsh0N5Nbri86w+5tWUw==
X-Received: by 2002:a17:902:7048:b0:18f:438a:cfe1 with SMTP id h8-20020a170902704800b0018f438acfe1mr47197819plt.59.1672732171238;
        Mon, 02 Jan 2023 23:49:31 -0800 (PST)
Received: from localhost.localdomain ([220.158.158.30])
        by smtp.gmail.com with ESMTPSA id q15-20020a17090311cf00b00189f2fdc178sm21488305plh.177.2023.01.02.23.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 23:49:30 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, kw@linux.com,
        bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_krichai@quicinc.com, johan+linaro@kernel.org, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/1] PCI: qcom: Add support for system suspend and resume
Date:   Tue,  3 Jan 2023 13:19:06 +0530
Message-Id: <20230103074907.12784-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This series (a single patch) adds the system suspend and resume support
to the Qualcomm PCIe RC controller.

Background
==========

There were previous attempts [1][2] to add system suspend and resume
support to this driver.

In previous versions, the controller was put into low power mode by turning
OFF the resources even if there were active PCIe devices connected. Thanks
to Qualcomm's internal power topology, the link did not enter L2/L3 state
and the devices were still powered ON. But during very late end of suspend
cycle, kernel tried to disable MSIs of the PCIe devices. This caused access
violations as the resources needed to access the PCIe devices config space
were turned OFF. Series [1] worked around this issue by not accessing the
PCIe config space if the link was down in dw_msi_{un}mask_irq() functions.
But that approach was not accepted.

Then, series [2] implemented the suspend and resume operations using the
syscore framework that disabled the resources at the end of the suspend
cycle. But that approach also did not get much acceptance.

Proposal
========

So the proposal here is to just vote for minimal interconnect bandwidth and
not turn OFF the resources if there are active PCIe devices connected to
the controllers. This avoids the access violation issue during suspend and
also saves some power due to the lower interconnect bandwidth used.

Then if there are no active PCIe devices connected to the controller,
the resources are turned OFF completely and brought back during resume.
This also saves power if there are controllers in a system without any
devices connected.

Testing
=======

This series has been tested on Lenovo Thinkpad X13s.

Dependency
==========

This series depends on the host_deinit() callback patch [3] submitted by
Johan.

Thanks,
Mani

[1] https://lore.kernel.org/linux-pci/1656055682-18817-1-git-send-email-quic_krichai@quicinc.com/
[2] https://lore.kernel.org/linux-pci/1663669347-29308-1-git-send-email-quic_krichai@quicinc.com/
[3] https://lore.kernel.org/linux-pci/20230102174313.GC16638@thinkpad/

Manivannan Sadhasivam (1):
  PCI: qcom: Add support for system suspend and resume

 drivers/pci/controller/dwc/pcie-qcom.c | 52 ++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

-- 
2.25.1

