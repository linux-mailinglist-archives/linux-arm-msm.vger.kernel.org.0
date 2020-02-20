Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8849C165BA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 11:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbgBTKgE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 05:36:04 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:51073 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726501AbgBTKgD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 05:36:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582194963; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=IvusCc7SfQWheL3qpyxJjGggUjJ0Q+qu37ojxqfgpPg=; b=hWOYRbRhXL9s9qU0B7Dhm1acPV0OaLZCk/o4x0ZXjzJAHuHPIdTGmpv49bFnCq5frQ+yA4cn
 psocljpApkfZ9kna/HH5C1Oca1ocTLq/YXyRt79iC2pb8EwOgpb7Qv/eCDUNObXd+iDY0aJi
 IfrqNxJNiUwtapg+Ymwkrg6PZYw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4e610b.7fa682926c38-smtp-out-n02;
 Thu, 20 Feb 2020 10:35:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 95211C4479D; Thu, 20 Feb 2020 10:35:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3AB2AC43383;
        Thu, 20 Feb 2020 10:35:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 20 Feb 2020 16:05:54 +0530
From:   bgodavar@codeaurora.org
To:     linux-firmware@kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, gubbaven@codeaurora.org
Subject: Firmware files for QCA BT chip WCN3991.
Message-ID: <3d3a530f11e6bc9a87573389d72ddd3c@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

The following changes since commit 
54b017d06a44bfd9b4c2757cace6cc349afd5bf2:

   qca: Add firmware files for BT chip wcn3991. (2020-02-20 16:01:04 
+0530)

are available in the Git repository at:

   https://github.com/bgodavar/qca_bt_wcn3991.git

for you to fetch changes up to 54b017d06a44bfd9b4c2757cace6cc349afd5bf2:

   qca: Add firmware files for BT chip wcn3991. (2020-02-20 16:01:04 
+0530)


Regards
Balakrishna
