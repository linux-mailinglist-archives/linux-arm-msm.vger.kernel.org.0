Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60CE03EA03D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 10:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234970AbhHLIFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 04:05:31 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:47085 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235018AbhHLIFb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 04:05:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628755506; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=BTZa5fePxxkz3HSgkb8loFU1bJ39a9DfwrlgYrh6H10=; b=qKpYyg8bgsyjZwR3vJngJ4T4zZMRSE2M5rvqop6p0oVa6CqxNPp+2HET3XimS0HDOs32N14d
 0ue8LUBFj4ya7FlRDBqPoUMpYqQXzn54kdZDCpU0xvqzSxF7QAVQo6PgAPVuL0SlHFXkOvL9
 9KbSC7Tvh9reEt5slqIK1g9C/sA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6114d631b14e7e2ecb11d585 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 12 Aug 2021 08:05:05
 GMT
Sender: smagar=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0E41CC43460; Thu, 12 Aug 2021 08:05:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: smagar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7BA76C433F1;
        Thu, 12 Aug 2021 08:05:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 12 Aug 2021 13:35:04 +0530
From:   smagar@codeaurora.org
To:     linux-firmware@kernel.org, jwboyer@kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluethoth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        hemantg@codeaurora.org, abhishekpandit@chromium.org,
        bgodavar@codeaurora.org, adhudase@codeaurora.org,
        sampnimm@codeaurora.org
Subject: Request to update WCN3991 FW file
Message-ID: <0a05c2062052704d788511cf7edd874d@codeaurora.org>
X-Sender: smagar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Team,


Please include updated firmware bins for WCN3991. Change includes 
updated TLV file.

Snapshot of pull request is as below, let me know if anything is 
missing.



The following changes since commit 
168452ee695b5edb9deb641059bc110b9c5e8fc7:

   Merge tag 'iwlwifi-fw-2021-07-19' of 
git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware 
into main (2021-07-19 14:35:47 -0400)

are available in the git repository at:

   https://github.com/suraj714/linux-firmware-BT master

for you to fetch changes up to 6a3a985022e1194045fc46a249ca29f8bf2fb427:

   QCA : Updated firmware files for WCN3991 (2021-08-12 10:03:49 +0530)

----------------------------------------------------------------
smagar (1):
       QCA : Updated firmware files for WCN3991

  qca/crbtfw32.tlv | Bin 126772 -> 126036 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)


Regards,
Suraj Magar
