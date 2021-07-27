Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317393D6D7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 06:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbhG0EeK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 00:34:10 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:36698 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234905AbhG0EeK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 00:34:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627360451; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=W7zvpkjh3FGjE7HCbUFAsydfL0Q+RqStFjpoCfjPt4g=; b=Z1o7hrZjm99o4qYVqplT4Zjm9nWVK1xCV/6JUIisvqSXSippedkOKMjHb73yAtnn5P/JwTzJ
 Ii9hQsfUTzoL0vfakIOtZFCOO0oFs3UKdI8sU3yQfmVC5C8hYvYwtu+NP4LlYmJtl8qHGOTB
 9VJxXGfw8T26MLHBGbAHUP0i4Bk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60ff8cb017c2b4047de68ce0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Jul 2021 04:33:52
 GMT
Sender: smagar=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B7CB8C43460; Tue, 27 Jul 2021 04:33:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: smagar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 25FC5C433F1;
        Tue, 27 Jul 2021 04:33:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 27 Jul 2021 10:03:50 +0530
From:   smagar@codeaurora.org
To:     linux-firmware@kernel.org, jwboyer@kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluethoth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        hemantg@codeaurora.org, abhishekpandit@chromium.org,
        bgodavar@codeaurora.org, pbadge@codeaurora.org,
        adhudase@codeaurora.org, sampnimm@codeaurora.org
Subject: Request to update WCN6750 FW file
Message-ID: <9196f77c4b203dce3982e31d241392de@codeaurora.org>
X-Sender: smagar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Team,

Please include new firmware bins for QCA BT SoC WCN6750.

Snapshot of pull request is as below, let me know if anything is 
missing.



The following changes since commit 
168452ee695b5edb9deb641059bc110b9c5e8fc7:

   Merge tag 'iwlwifi-fw-2021-07-19' of 
git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware 
into main (2021-07-19 14:35:47 -0400)

are available in the git repository at:

   https://github.com/suraj714/linux-firmware-bluetooth master

for you to fetch changes up to 5dd32d878e7561789422f3e1fe0f7c48fcc00e04:

   qca: Add firmware files for BT chip WCN6750. (2021-07-26 16:38:01 
+0530)

----------------------------------------------------------------
smagar (1):
       qca: Add firmware files for BT chip WCN6750.

  WHENCE           |   6 ++++++
  qca/msbtfw11.mbn | Bin 0 -> 129348 bytes
  qca/msbtfw11.tlv | Bin 0 -> 117136 bytes
  qca/msnv11.bin   | Bin 0 -> 5633 bytes
  4 files changed, 6 insertions(+)
  create mode 100644 qca/msbtfw11.mbn
  create mode 100644 qca/msbtfw11.tlv
  create mode 100644 qca/msnv11.bin



Regards,
Suraj Magar
