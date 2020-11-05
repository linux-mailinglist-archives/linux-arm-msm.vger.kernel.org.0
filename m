Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 405CF2A77B5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 08:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725298AbgKEHGF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 02:06:05 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:41581 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726330AbgKEHGF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 02:06:05 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604559964; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=1Pctgo6qoLaBH5cW9YYonDcMS4/9/r69lL2AMog1LQI=; b=qx/CgSDxOqqHFeAYwr6tJ0AmtWxpN8VlzlCZUiqO/s7CKoUcWd7GxefcaBwgwYLsAtf8ti2k
 Rkh3V3Wakpw0QNxuU938soF7rr4s4kPhaMYDB6d7iWHRWnWwqlWo6PKqvTSSAzY3102YlPk2
 AERCPKQgw0Y6wF3TCxO21Z6zeP0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fa3a45ba6bf6cdf63ff63b5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 05 Nov 2020 07:06:03
 GMT
Sender: asitshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DAFAFC433CB; Thu,  5 Nov 2020 07:06:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: asitshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 645CAC433C6;
        Thu,  5 Nov 2020 07:06:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 05 Nov 2020 12:36:02 +0530
From:   asitshah@codeaurora.org
To:     linux-firmware@kernel.org, jwboyer@kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        hemantg@codeaurora.org, gubbaven@codeaurora.org,
        abhishekpandit@chromium.org, bgodavar@codeaurora.org
Subject: Request to Update WCN3991 FW file
Message-ID: <71acb08c5c7e7b10f4112b350707ee82@codeaurora.org>
X-Sender: asitshah@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Team,

Please include updated firmware bins for WCN3991. Change includes 
updated TLV file to fix BT SSR.

Snapshot of pull request is as below, let me know if anything is 
missing.

>>>>> 

The following changes since commit 
dae4b4cd084102cd49c37aa8b579b208028ab025:

   Merge branch 'v1.1.5' of 
https://github.com/irui-wang/linux_fw_vpu_v1.1.5 into main (2020-10-23 
08:10:37 -0400)

are available in the git repository at:

   https://github.com/shahasit/bt-linux-firmware.git master

for you to fetch changes up to d7793e53b156126f6ea09c8d6e17cc9a8fe0ca77:

   QCA : Fixed BT SSR due to command timeout / IO fatal error (2020-11-05 
12:26:32 +0530)

----------------------------------------------------------------
Asit Shah (1):
       QCA : Fixed BT SSR due to command timeout / IO fatal error

  qca/crbtfw32.tlv | Bin 126832 -> 126892 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)

<<<<<

Regards,
Asit
