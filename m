Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92AB9520DCB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 May 2022 08:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbiEJG0S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 May 2022 02:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237193AbiEJGZh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 May 2022 02:25:37 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33A64BBA6
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 23:21:25 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id cq17-20020a17090af99100b001dc0386cd8fso1284777pjb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 23:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=f0ZQoiwRSTWeuW/E0qX/vgU+j2w7ZPOXgEISOXG2/K8=;
        b=rhbooEKxSweLF/hKTN6wo/TqGR2odyzF+HAlYzvlyW2M3o573J3e8/BCh4x6ye4QXB
         yBonBPk4b8Txqjxw55KdKLwjFjGvpDdHMaVkzzKJXz/EWKC4gDCIxtZ3agLZc+D/9KJw
         L9E2N6+SLNJPRBM7LKXwBGk+zIOFwr+WlXjm85lSXlSbQ6zIwI+FEEnLms/2EHfhV4eP
         FOVeKytypd7QBmIXueSRvKy8YPOLcmQ9KatpSEVnhApQToljdstSJxNPOAzxyH3ofGSe
         wpE9lnDhxaxMlnPRT/CvViVkG3odFeqfg39QVi93JMcRGyAMUJjbqXcEP3j3RGcqiii8
         T2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=f0ZQoiwRSTWeuW/E0qX/vgU+j2w7ZPOXgEISOXG2/K8=;
        b=xz73hg0Fjxx+5a0wGprornru2Z+bczS6093rs4OD26LFlxgzNxQOx1QjF5DYzHYNgt
         W8hka/jTQUg+qEvoWp9AKyJYmJFDvWP23UytcAF+JtAzsYPm11GZWnJjgu2MAoXZhhWT
         DYzc5EhDjTzr5snvw+pqEWbzrUBFEs4tEvhHb7HGBPBZombUQ2Y7KZ8jOpGsirmprRuh
         2ZjU4Pgzx+khFtTgYV6sFYcEWyjNRsu6kiyGIjbW/hc2S4fsUj+P+R0W9S8FSmb5SPDr
         EdZrQ+8xzFvjJccIvFW1upau5BB8b9XZcnB3s5A1KsFrOByWKCrrMI9H3uKt94rQxvCl
         5eWA==
X-Gm-Message-State: AOAM5328yjry0zYAnz6uc+U+X6YD9Vk720P4r4QJDDBrbj7x3PRbw43z
        o6dcOW1QvU1jKJwwCA08+8XG
X-Google-Smtp-Source: ABdhPJxbl+nGav8AiYmNljVz6gZZTrIxKjYDVGiZPJy5CyQg4eiieJxb9aDGLyuKH8TR5PaJAwb+mw==
X-Received: by 2002:a17:902:cecf:b0:15e:b10a:9f3a with SMTP id d15-20020a170902cecf00b0015eb10a9f3amr19895067plg.118.1652163685110;
        Mon, 09 May 2022 23:21:25 -0700 (PDT)
Received: from thinkpad ([220.158.159.212])
        by smtp.gmail.com with ESMTPSA id r3-20020a170903020300b0015e8d4eb22dsm1041830plh.119.2022.05.09.23.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 23:21:24 -0700 (PDT)
Date:   Tue, 10 May 2022 11:51:20 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     quic_hemantk@quicinc.com, slark_xiao@163.com,
        quic_jhugo@quicinc.com, Daniele.Palmas@telit.com,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Subject: [GIT PULL] MHI changes for v5.19
Message-ID: <20220510062120.GA9140@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 5d4be19cbe6aadfad0a5f40df91bd478cedd8344:

  bus: mhi: ep: Add uevent support for module autoloading (2022-04-04 10:17:51 +0530)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v5.19

for you to fetch changes up to 13b9b814da2de5006795ddcff2bbaea46017429d:

  bus: mhi: host: Add support for Foxconn T99W373 and T99W368 (2022-05-10 11:10:56 +0530)

----------------------------------------------------------------
MHI changes for v5.19

MHI Host
--------

Support for new modems:

 - Foxconn Cinterion MV32-WA/MV32-WB based on SDX62/SDX65
 - Telit FN980 v1 based on SDX55
 - Telit FN990 based on SDX65
 - Foxconn T99W373/T99W368 based on SDX62/SDX65

Core changes:

 - During the recycle of event ring elements, compute the ctxt_wp based on the
   local cached value instead of reading from shared memory. This is to prevent
   the possible corruption of the ctxt_wp as some of the endpoint devices could
   modify the value in shared memory.

 - Add sysfs support for resetting the endpoint based on the MHI spec. The MHI
   spec allows the host to hard reset the device in the case of an unrecoverable
   error and all other reset mechanisms have failed.

 - During MHI shutdown, wait for the endpoint device to enter the ready state
   post reset before proceeding. This is to avoid a possible race where host
   would remove the interrupt handler and device will send ready state
   interrupt, resulting in IOMMU fault.

 - Bail out updating the MHI register if the read has failed during
   read/modify/write.

 - Use mhi_write_reg() instead of mhi_write_reg_field() for writing the whole
   register fields in mhi_init_mmio().

MAINTAINERS change:

 - Since Qualcomm has moved the email domain for its employess from codeaurora
   domain to quicinc, update the same for Hemant.

----------------------------------------------------------------
Bhaumik Bhatt (2):
      bus: mhi: host: Bail on writing register fields if read fails
      bus: mhi: host: Optimize and update MMIO register write method

Daniele Palmas (2):
      bus: mhi: host: pci_generic: add Telit FN980 v1 hardware revision
      bus: mhi: host: pci_generic: add Telit FN990

Jeffrey Hugo (3):
      bus: mhi: host: Use cached values for calculating the shared write pointer
      bus: mhi: host: Add soc_reset sysfs
      bus: mhi: host: Wait for ready state after reset

Manivannan Sadhasivam (2):
      MAINTAINERS: Update Hemant's email id
      bus: mhi: host: pci_generic: Sort mhi_pci_id_table based on the PID

Slark Xiao (2):
      bus: mhi: host: Add support for Cinterion MV32-WA/MV32-WB
      bus: mhi: host: Add support for Foxconn T99W373 and T99W368

 Documentation/ABI/stable/sysfs-bus-mhi |  10 +++++++
 MAINTAINERS                            |   2 +-
 drivers/bus/mhi/host/boot.c            |  22 ++++++++++----
 drivers/bus/mhi/host/init.c            |  82 ++++++++++++++++++++++++++++++++++------------------
 drivers/bus/mhi/host/internal.h        |   7 +++--
 drivers/bus/mhi/host/main.c            |  18 +++++-------
 drivers/bus/mhi/host/pci_generic.c     | 133 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
 drivers/bus/mhi/host/pm.c              |  24 ++++++++++++---
 8 files changed, 234 insertions(+), 64 deletions(-)
-- 
மணிவண்ணன் சதாசிவம்
