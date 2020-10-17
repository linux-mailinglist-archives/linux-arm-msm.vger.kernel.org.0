Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2602912A7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Oct 2020 17:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438531AbgJQPeB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Oct 2020 11:34:01 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:17546 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438526AbgJQPeB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Oct 2020 11:34:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602948840; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=DRLqp+BG+RCQ8V19cb9tD8UX+5ec5+v4I6X9n6/C1PQ=; b=vA/98subzJvj9YzuGt9pKqKCvDGZiH9grusd2T7xpRCkThQzQHGoyQ350sPMbF8TBNL+AC16
 gxoBSNulKtyH6KbeEwMzoFqveUu9isfsmX0owqAIHUDwBu20BJi76Yspa5M1B/LxLP+pLQp4
 +kB86WY+AMJZLHipFbsZxQqKwM4=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f8b0ed657b88ccb5622d754 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 17 Oct 2020 15:33:42
 GMT
Sender: asitshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BA80CC433F1; Sat, 17 Oct 2020 15:33:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: asitshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 400B1C433CB;
        Sat, 17 Oct 2020 15:33:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 17 Oct 2020 21:03:42 +0530
From:   asitshah@codeaurora.org
To:     linux-firmware@kernel.org, jwboyer@kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        hemantg@codeaurora.org, gubbaven@codeaurora.org,
        abhishekpandit@chromium.org, bgodavar@codeaurora.org
Subject: Update WCN3991 FW file
Message-ID: <b74ea9cb201bb98691ecbfb3893d2a49@codeaurora.org>
X-Sender: asitshah@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi Team,

Please include updated firmware bin for WCN3991.

Snapshot of pull request is as below, let me know if anything is 
missing.

>>>>> 

The following changes since commit 
58d41d0facca2478d3e45f6321224361519aee96:

   ice: Add comms package file for Intel E800 series driver (2020-10-05 
08:09:03 -0400)

are available in the git repository at:

   https://github.com/shahasit/bt-linux-firmware/tree/master

for you to fetch changes up to 8877322c1254f327f47c86ec02c46013b68b9a47:

   QCA : Updated firmware file for WCN3991 (2020-10-17 20:53:36 +0530)

----------------------------------------------------------------
Asit Shah (1):
       QCA : Updated firmware file for WCN3991

  qca/crbtfw32.tlv | Bin 126300 -> 126832 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)

<<<<<<

Regards,
Asit
