Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3942165AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 06:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgGGE6V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 00:58:21 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:23587 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726805AbgGGE6V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 00:58:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594097901; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=vQlGC+g6PBorvbW3VjCchVGAirpTLmSK6+Ls9tR3oXY=; b=w0u9ci4zYPq1RmMPF6ib3YkUk5Pc1FISPDtcPcApwVc+lg16LqJx0BKRtOcrBfjbMgazBPw6
 ujsfRfdzGltWd1aRz8QcIsYSIYuXJpdujdntDa/GCKB8DTaxx1cHZxJpEEbX3xDFYDhd1wHY
 ARJrDy59qASP1ECvT4E9GYHxgIc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n19.prod.us-east-1.postgun.com with SMTP id
 5f0400e1d07c1358553c02f8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 07 Jul 2020 04:58:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 82E12C433CA; Tue,  7 Jul 2020 04:58:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AF5F6C433C6;
        Tue,  7 Jul 2020 04:58:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 07 Jul 2020 12:58:07 +0800
From:   Rocky Liao <rjliao@codeaurora.org>
To:     linux-firmware@kernel.org
Cc:     linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PULL] btqca firmware 20200401
Message-ID: <ff2e158ad88a7bf1ce5e42de86342f35@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if 
you have any problems.

The following changes since commit
74ac3b5a7e7962cd1135ef691c72d48cb5210251:

    Merge https://github.com/bgodavar/qca_wcn3991 into main (2020-07-02 
08:23:09 -0400)

are available in the Git repository at:

    https://github.com/rjliao-qca/qca-btfw.git

for you to fetch changes up to c4e04b49b46a3e3e4c0bf4a3007f352d09c7ae0c:
----------------------------------------------------------------
Rocky Liao (1):
         QCA: Update Bluetooth firmware for QCA6390 (2020-07-07 12:45:15 
+0800)
