Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02EAB4C7DE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 23:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbiB1W7c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 17:59:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbiB1W7b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 17:59:31 -0500
X-Greylist: delayed 179 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 28 Feb 2022 14:58:51 PST
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 972879F3BE;
        Mon, 28 Feb 2022 14:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646088947;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=a/gAEMN65dNbL3ATcc5dOu/F+K7mQe5TkMeEHj9kOHk=;
    b=kcn99mJFc13QRBZ1qprlucgyIq80zEm146rskwegsrB7yf41cOdtAd6uMPP+nOlBPs
    TB670z7v/Q390MezIP4S/HzmFPlyMcOYQeXT64CWfy09iaeEyi80DmHvqZ4xcvzcHzSI
    kBIDwxMEfLB7M4yi7ucc9gdr8PkszcTg/Ze6e47i5y5oG0wERpW66dxAGXvFwIPD1Ju8
    PQz119l3P0KTSL4UlB9O2ci4vyDPQynRrzzuOR0IgScNeCky+Fa/Y8BXCor/B9Kp9JQU
    E+T6odYpQbNoM8TaTJAeMZm4MzZLi1itW9tLxTtZDauMAGlpxRUUpCA/U9ugFhgmBH6F
    GhYg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fyL/oVo="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.40.1 AUTH)
    with ESMTPSA id kdc58dy1SMtkWqD
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 28 Feb 2022 23:55:46 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, phone-devel@vger.kernel.org,
        Aleksander Morgado <aleksander@aleksander.es>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 0/2] Enable BAM-DMUX/WWAN on Qualcomm MSM8916
Date:   Mon, 28 Feb 2022 23:53:58 +0100
Message-Id: <20220228225400.146555-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series enables using mobile Internet/WWAN on devices based on Qualcomm
MSM8916. The network driver for that has already landed in Linux 5.17.

The device tree node of BAM-DMUX does not have any own memory resources.
It just bundles resources from other hardware blocks. It could be added to the
device tree root node, but it logically belongs below the modem remote processor.

To allow adding it there, the qcom_q6v5_mss driver is modified slightly to
create a platform device for it.

Changes in v2:
  - Avoid using of_platform_populate() and create platform device 
    specifically only for "qcom,bam-dmux".

Stephan Gerhold (2):
  remoteproc: qcom_q6v5_mss: Create platform device for BAM-DMUX
  arm64: dts: qcom: msm8916: Add BAM-DMUX for WWAN network interfaces

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 30 +++++++++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_mss.c    |  8 +++++++
 2 files changed, 38 insertions(+)

-- 
2.35.1

