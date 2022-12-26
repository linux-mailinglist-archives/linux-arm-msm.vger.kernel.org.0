Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 542456564B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 19:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbiLZSzc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Dec 2022 13:55:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbiLZSzb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Dec 2022 13:55:31 -0500
Received: from mxd-1-a59.seznam.cz (mxd-1-a59.seznam.cz [IPv6:2a02:598:128:8a00::1000:a59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C48DF19;
        Mon, 26 Dec 2022 10:55:28 -0800 (PST)
Received: from email.seznam.cz
        by smtpc-mxd-695c6957-5rhr5
        (smtpc-mxd-695c6957-5rhr5 [2a02:598:128:8a00::1000:a59])
        id 2810ce789e3071232817700f;
        Mon, 26 Dec 2022 19:55:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz;
        s=szn20221014; t=1672080903;
        bh=Q/mxLavqnFol9Uk90wXB43EQ0DTXUnrzM3Hb0tHOEU4=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding;
        b=Ab7wekN8hDVY6PmeoGzDzjc3vUZiV5hxh9MSekMpVuEsiXktT6+FiKrXGMsubVvrs
         Mj24zKZgmlmxKYmNpJZE4Nt3AULa6FbhJDCOqQ5CeSiY6Ltw4RihGDCoMHUjCiHUa4
         7mlPeU7IDQMfwJiI7VK9b0t3YQvdhdxzpvN4z5UqmIkqBQzH2IFNierdqPBNUGGD39
         2HSnH3FDdWyopp/dYl7bX+rZi/YmWfe/sEWoe6ob5MRys/4PVI3vl8FDnJn4FMYYNf
         ErJZzKfOpA5y/bCIFhHFRRGxnJSI3X0L2pWwh0L9xvKiCEtN0DsHx6fYbQMl4DjV7i
         jbj5n2EjY8xuQ==
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
        by email-relay17.ng.seznam.cz (Seznam SMTPD 1.3.140) with ESMTP;
        Mon, 26 Dec 2022 19:55:02 +0100 (CET)  
From:   Petr Vorel <pevik@seznam.cz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 0/3] msm8992-bullhead: 2 DTS fixes + 1 RFC
Date:   Mon, 26 Dec 2022 19:54:37 +0100
Message-Id: <20221226185440.440968-1-pevik@seznam.cz>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Petr Vorel <petr.vorel@gmail.com>

Petr Vorel (3):
  arm64: dts: qcom: msm8992-bullhead: Fix cont_splash_mem size
  arm64: dts: qcom: msm8992-bullhead: Disable dfps_data_mem
  [RFC] arm64: dts: qcom: msm8992-bullhead: Fix smem_region, mpss_mem

 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

-- 
2.39.0

