Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58EFB2D2AB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Dec 2020 13:26:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgLHM0d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Dec 2020 07:26:33 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:16450 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbgLHM0d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Dec 2020 07:26:33 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607430374; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=xwubYQmXFozrF3h5pSqCHE8wPqNs2HP3Fa3BhJgvhZ4=; b=v3txPADZcLNIPcRm8UnicnHCyZik051UXP6dmpyPnYZcQoYkx9PpU18D12m3eroIKJIdRWPI
 plI3usCAvA7or8CnMjbxncplh1HOsbCK+Yx5tf1KN2Q1s93lZRP6rumXQ49fp0nGoEJIrvV8
 /E4Uc74rODERF6oa0GQH+RKlEEQ=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5fcf70c756444c64458a7012 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Dec 2020 12:25:43
 GMT
Sender: sampnimm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CE299C433C6; Tue,  8 Dec 2020 12:25:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sampnimm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 33964C433CA;
        Tue,  8 Dec 2020 12:25:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 08 Dec 2020 17:55:42 +0530
From:   sampnimm@codeaurora.org
To:     linux-firmware@kernel.org, jwboyer@kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        hemantg@codeaurora.org, gubbaven@codeaurora.org,
        abhishekpandit@chromium.org, bgodavar@codeaurora.org
Subject: Request to Update WCN3991 FW files
Message-ID: <d83f762bf0b5e27f624a57c17c9dc3db@codeaurora.org>
X-Sender: sampnimm@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Team,

       Please include updated firmware bins for WCN3991.
       Snapshot of pull request is as below, let me know if anything is 
missing.

>>>>> 	

The following changes since commit 
7455a36066741a6e52fba65e04f6451b4cdfd9c4:

   Merge branch 'guc_v49' of 
git://anongit.freedesktop.org/drm/drm-firmware into main (2020-11-30 
09:26:11 -0500)

are available in the git repository at:

   https://github.com/sampnimm/linux-firmware-BT.git master

for you to fetch changes up to 1a08ec9262e943c1e50b1223e3feb5845936b5a6:

   QCA : Updated firmware files for WCN3991 (2020-12-08 17:38:49 +0530)

----------------------------------------------------------------
sampnimm (1):
       QCA : Updated firmware files for WCN3991

  qca/crbtfw32.tlv | Bin 126892 -> 126772 bytes
  qca/crnv32.bin   | Bin 5407 -> 5407 bytes
  qca/crnv32u.bin  | Bin 5407 -> 5407 bytes
  3 files changed, 0 insertions(+), 0 deletions(-)

<<<<<


Thanks,
Sampath
