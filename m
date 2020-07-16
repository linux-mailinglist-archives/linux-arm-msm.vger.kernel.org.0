Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 573E122283C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 18:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729249AbgGPQZ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 12:25:28 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:48826 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729253AbgGPQZ2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 12:25:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594916728; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=OmL2KI53czE52TZ8+f9g2m5kzP3WpYA0NVG5N/4LwQ4=; b=uFT37cXl0E6eeZMZa9OVtA0NoVymfAwf5ACJvZ+1AegYb8PQJa7GscHl6JeoKn+1L2pNLKie
 6EcycbQ5CVmwVY4FBkPC6fQoYiCol3Li7XqkTOUZ8w2J93MbozeHo3Ra5KngZ5CIQ8Mouqa0
 XsL3PaudTh8cJsUKUCyujzyMFfw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-west-2.postgun.com with SMTP id
 5f107f70c9bd2efa2effe877 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Jul 2020 16:25:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3C60DC43395; Thu, 16 Jul 2020 16:25:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D70DEC433C6;
        Thu, 16 Jul 2020 16:25:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 16 Jul 2020 21:55:19 +0530
From:   bgodavar@codeaurora.org
To:     linux-firmware@kernel.org, jwboyer@kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, gubbaven@codeaurora.org,
        abhishekpandit@chromium.org
Subject: QCA: Add correct bin file for WCN3991
Message-ID: <6abd991d5d7d5175f5b7c6b168af770b@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 
3d3a06f720856cb897a8541951edd0b8f6f54a98:

   linux-firmware: Update firmware file for Intel Bluetooth AX201 
(2020-07-13 07:51:54 -0400)

are available in the git repository at:

   https://github.com/bgodavar/qca_bt_fw/tree/qca_0714

for you to fetch changes up to 3882702815e4b88bfd2f20b7eb66a3e85cbbb9b9:

   QCA: Add correct bin file for WCN3991 (2020-07-14 11:00:13 +0530)

----------------------------------------------------------------
Balakrishna Godavarthi (1):
       QCA: Add correct bin file for WCN3991

  qca/crnv32.bin | Bin 5299 -> 5299 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)
