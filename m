Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 645ED63FBA1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 00:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbiLAXJ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 18:09:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbiLAXJ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 18:09:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0E493806
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 15:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669936113;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=4JvfJWU7+uq7jrpATovd2AsryJuPNwIs+V/5GzjE+z8=;
        b=Hl1FmKGjn7bLR58i1TR/e+DgV7GR/Ln1FPyWoyuUhRqF2ohzIXnE7IsecQkCr45I7OPncQ
        uR93aCjIiL0SIRJHIXpmNPrVeGEdYGArXim/SWPZW/FtE1yVB2VRz5M1KhnG8ianuHV0cI
        sRIQmloarvaB4lfMuphRXAG3N4EglGY=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-391-d5JcLJUgNoq02XqYUfgz3Q-1; Thu, 01 Dec 2022 18:08:32 -0500
X-MC-Unique: d5JcLJUgNoq02XqYUfgz3Q-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-143d68edfa1so1503009fac.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 15:08:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4JvfJWU7+uq7jrpATovd2AsryJuPNwIs+V/5GzjE+z8=;
        b=QGmEmXv/7ingCGwEKuBdNoQ+jlyq+vJvk7sMVXVDjpJkM2Ovq4xeApQgGREf9sJsiB
         0A8GliPw5IcPqGSYMk9Ax5D/00CNbQm6w5JLMicGcPL6IJp0GiBCnaL+TbzdNMnS4F93
         VBc9KsfexyqxuXZJcFG0aDRy0+aY+ZptRYnwzrQK52Gh1gGzeUyT2ujR2ei/OznEGJZu
         /JKpT4m63pGzgYyl0g38wyHs5Eh8BACU5AOnoCjyTORG/xcjc4MMbHP3nW1X9/0zU5RJ
         YIv5sYj5yEBu3nVjiRPoUSgyjhwJJiQihCw83w1Ph5Y2dGwUOCFnyeYDYT6oim5Rtzzh
         XdAg==
X-Gm-Message-State: ANoB5pkiocjJTJRkdYeIMa0Rut6T6rFohzmriC53K/d8ySVRuaL4G5bv
        bAop3fZI0KifpH7bk+aY7ruAdx0ylfx4khlpXkBChDod3Gb6PATb3JU4HCuurWLjhRtQCHqYG7Y
        RA7M1U5CO/iEGVOGW1nN5ipNZ7w==
X-Received: by 2002:a05:6870:738f:b0:143:995e:807b with SMTP id z15-20020a056870738f00b00143995e807bmr14586263oam.160.1669936111499;
        Thu, 01 Dec 2022 15:08:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4R/AbnN+GXungjyYMQ/UXertPssHquQIq+R2j7hlnxk6+qDZ17QK95zUZPe2UXHoxhg7AYjQ==
X-Received: by 2002:a05:6870:738f:b0:143:995e:807b with SMTP id z15-20020a056870738f00b00143995e807bmr14586242oam.160.1669936111243;
        Thu, 01 Dec 2022 15:08:31 -0800 (PST)
Received: from halaney-x13s.redhat.com ([2600:1700:1ff0:d0e0::41])
        by smtp.gmail.com with ESMTPSA id y22-20020a4ade16000000b0049fb2a96de4sm2320393oot.0.2022.12.01.15.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 15:08:30 -0800 (PST)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     andersson@kernel.org
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, jejb@linux.ibm.com,
        martin.petersen@oracle.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH 0/4] scsi: ufs: ufs-qcom: Debug clean ups
Date:   Thu,  1 Dec 2022 17:08:06 -0600
Message-Id: <20221201230810.1019834-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series attempts to clean up some debug code paths in the
ufs-qcom driver.

Andrew Halaney (4):
  scsi: ufs: ufs-qcom: Drop unnecessary NULL checks
  scsi: ufs: ufs-qcom: Clean up dbg_register_dump
  scsi: ufs: ufs-qcom: Remove usage of dbg_print_en
  scsi: ufs: ufs-qcom: Use dev_err() where possible

 drivers/ufs/host/ufs-qcom.c | 135 +++++++++++++-----------------------
 drivers/ufs/host/ufs-qcom.h |  11 ---
 2 files changed, 48 insertions(+), 98 deletions(-)

-- 
2.38.1

