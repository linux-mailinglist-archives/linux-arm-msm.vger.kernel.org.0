Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF36B46168B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Nov 2021 14:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhK2NiH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Nov 2021 08:38:07 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:25698 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239789AbhK2NgH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Nov 2021 08:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638192764;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=gi23SGT/K9YoXpcCcls21EuR/fDTjd/FuL/5ViyQjhg=;
    b=TfQWq19/hLRBke38VDdCZVzLoy+ZDXZSI2f+0mvl/dymgwxPDxoRIsWa1/fEhPcAVa
    uu48k2uy3tsc4tG2ATgbRM+dd3t7sUQWg70RpqOsv7/Cmzi+pbCxMFhpZ/wLUAIBV1MV
    aUUejydmn14+OCosAQiKn/QmskGshXw9ppCnABuVUXVdAt7+ZpVKkZ267z35KF6xy2Bn
    1Du+5F6IfAniTwrQebuglNJiP+3C20qu7OVneO73BUQMwgFil2DY7C7liLhbayNfNrQ8
    ytHfiWiddkSTGPDC0mikFWejoNQ7mKdbM8OZAOPzVKGHt9gradMSPzXuzAXyAUcmSWX5
    UWsw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL2YvqQ"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.34.10 AUTH)
    with ESMTPSA id j03bcbxATDWhPUt
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 29 Nov 2021 14:32:43 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, phone-devel@vger.kernel.org,
        Aleksander Morgado <aleksander@aleksander.es>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 0/2] Enable BAM-DMUX/WWAN on Qualcomm MSM8916
Date:   Mon, 29 Nov 2021 14:29:28 +0100
Message-Id: <20211129132930.6901-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series enables using mobile Internet/WWAN on devices based on Qualcomm
MSM8916. The network driver for that was applied earlier today to net-next. [1]

The device tree node of BAM-DMUX does not have any own memory resources.
It just bundles resources from other hardware blocks. It could be added to the
device tree root node, but it logically belongs below the modem remote processor.

To allow adding it there, the qcom_q6v5_mss driver is modified slightly to
populate additional devices from the device tree. Finally, the necessary
nodes are added to the MSM8916 device tree.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=688e075748645b43cf4d55e8fd279f5249699b7a

Stephan Gerhold (2):
  remoteproc: qcom_q6v5_mss: Populate additional devices from DT
  arm64: dts: qcom: msm8916: Add BAM-DMUX for WWAN network interfaces

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 30 +++++++++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_mss.c    |  7 +++++++
 2 files changed, 37 insertions(+)

-- 
2.34.1

