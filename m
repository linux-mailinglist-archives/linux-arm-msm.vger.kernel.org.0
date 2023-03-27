Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77F776CA61E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 15:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjC0Nit (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 09:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbjC0Nio (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 09:38:44 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7B544AC
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 06:38:35 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id u10so8449886plz.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 06:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679924315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lc/YFwcJcimmTWUXpqZ6U83MS64mpkgpdY8muL+3Dfg=;
        b=BukT4RFJHnwvZp0owfSl97elYBKmXKnjGtYiklPiHMjIU/kbrR2tWl7xDmw8JDJ1XI
         rAR2RobLdf+rOT9bgXJGsgbzXuXFkP0basG4SqDpnsIIMDUHl2T7mTaj06rVLxGBdk8O
         06o4JScTKFLdoszXIIStWcg9nDZ46VTo2lLGU/Aj7B9EcjYi56BdXbSB/0uuaEFzo42N
         DpVxYFU+zaCWTK/pr2whswxEC+W/P4MZrr8EROCmRogSQNDpQ7eEhfxSSv8wkS1Orjal
         nTQtduNwn24yvWri8BK2C0raxE8/qs/6OWttxVeJPngXQodfJqR5Zec1z+bWYZ5mrgol
         EHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679924315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lc/YFwcJcimmTWUXpqZ6U83MS64mpkgpdY8muL+3Dfg=;
        b=Ypa0HqMEAnDuitJ0a3nj0JUcbjvhci+ViTECG0zd/dVgvBhvvQ37lq9ZCNF/PZZa/q
         FnhSFD5gFoGx5eyZYtetIqL86r0AkoJlcCBRq/aVIUYpNOqIodGvxJON7ffToyHj+Wgq
         zd+PVeomdHHyJ9MTNZskNtOvFWyZVXTkxFwYir71HMBu/1Dz8ExwWz+9dSffmKxD/ygo
         xZIEnvSAVjF3ki2baJHqhwcgnLogD7jDNCQwidZf/1dgoW5PVUrYredqKhMOKZPhS8ck
         /AhOUQ5xJeK9VQJmuIJVDt9JPGOH4x9w0j3lYHoE83L2I20bpnhB5bq7VB6H7a85mF7f
         6g3g==
X-Gm-Message-State: AAQBX9eWoQmnUPN79dvaSz87qNuBlzS1J7EeepooA3B9GAIVK29dGVE3
        kXsseQR3kF5jOaW+dY3QC7GS
X-Google-Smtp-Source: AKy350a/NWYQb/+aD6pg34D4t6v1OAM7UejA1X3H4u64RKKwIXOYLlUnE9XULN/oqXSuLhAIQNk09Q==
X-Received: by 2002:a17:902:e84f:b0:19c:be09:20d5 with SMTP id t15-20020a170902e84f00b0019cbe0920d5mr15914681plg.11.1679924315079;
        Mon, 27 Mar 2023 06:38:35 -0700 (PDT)
Received: from localhost.localdomain ([117.193.215.38])
        by smtp.gmail.com with ESMTPSA id p6-20020a1709028a8600b00194c2f78581sm19187668plo.199.2023.03.27.06.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:38:34 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com, robh@kernel.org
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org,
        bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_krichai@quicinc.com, johan+linaro@kernel.org, steev@kali.org,
        mka@chromium.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 0/1] PCI: qcom: Add support for system suspend and resume
Date:   Mon, 27 Mar 2023 19:08:23 +0530
Message-Id: <20230327133824.29136-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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

Thanks,
Mani

[1] https://lore.kernel.org/linux-pci/1656055682-18817-1-git-send-email-quic_krichai@quicinc.com/
[2] https://lore.kernel.org/linux-pci/1663669347-29308-1-git-send-email-quic_krichai@quicinc.com/

Changes in v3:

* Limited comments to 80 column
* Added error handling in resume_noirq()

Changes in v2:

* Used minimum icc vote to keep data path functional during suspend
* Collected Ack

Manivannan Sadhasivam (1):
  PCI: qcom: Add support for system suspend and resume

 drivers/pci/controller/dwc/pcie-qcom.c | 62 ++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

-- 
2.25.1

