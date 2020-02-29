Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0F4D17449A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Feb 2020 04:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgB2DBi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 22:01:38 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:14071 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726366AbgB2DBi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 22:01:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582945298; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=u2OpUr2umrKtDJgafiYKpCymL4SAGgM/B3m17xtMXTU=; b=AFGcDu0KMbO/KKq8K9TxtkFVfmYkIVg/EAJ4MNSUhx5H4MIMyviHyEEAdUTF4pVV+vh7igPp
 PyztSgUpRmkyHXA7Og3JV5SP10ptMhdSnQLG06nd23T2txiZdPo3+hBx9lgPFkUSqei3jDX6
 o5dMkGd2NwE43pzWE9PETjKq4WI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e59d408.7fafa40ffe30-smtp-out-n01;
 Sat, 29 Feb 2020 03:01:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 43CBBC433A2; Sat, 29 Feb 2020 03:01:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B2A24C43383;
        Sat, 29 Feb 2020 03:01:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 29 Feb 2020 11:01:26 +0800
From:   Rocky Liao <rjliao@codeaurora.org>
To:     linux-firmware@kernel.org
Cc:     linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PULL] btqca firmware 20200229
Message-ID: <87e4fd88a5a72fe40fe83d31a0762c95@codeaurora.org>
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
efcfa03ae6100dfe523ebf612e03c3a90fc4c794:

    linux-firmware: Update firmware file for Intel Bluetooth AX201 
(2020-02-24 16:54:19 +0530)

are available in the Git repository at:

    https://github.com/rjliao-qca/qca-btfw.git

for you to fetch changes up to 2db3978ce4a0c5b8ab04a81701b4eb010c721b2d:
----------------------------------------------------------------
Rocky Liao (1):
        qca: Fix blueooth firmware name for QCA6174 (2020-02-29 09:20:06 
+0800)

  WHENCE                        |   2 --
  qca/rampatch_00440302.bin     | Bin 64940 -> 66332 bytes
  qca/rampatch_00440302.tlv     | Bin 66332 -> 0 bytes
  qca/rampatch_usb_00000302.bin | Bin 64168 -> 66964 bytes
  qca/rampatch_usb_00000302.tlv | Bin 66964 -> 0 bytes
  5 files changed, 2 deletions(-)
  delete mode 100644 qca/rampatch_00440302.tlv
  delete mode 100644 qca/rampatch_usb_00000302.tlv



