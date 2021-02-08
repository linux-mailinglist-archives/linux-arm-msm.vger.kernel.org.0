Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C51A831333E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 14:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhBHN2s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 08:28:48 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:31475 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231139AbhBHN0p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 08:26:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612790783; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=fswM5y6W+PBXhZObXryia2PwKlc/w0gNTSrV11Ri0dA=; b=Xmo6IH7gGEKNGCgRyuFWJyiyIgN1WGxVWieRMiy5Lc+rozXhJGYgNVFr/Jl8ZBJUVJRif0/C
 MYZJW6auqpzlrkvPwJPZ62saKR5YfkH2mVkraPWXDvkfCOheVKP+FDRaPC2HXQ+2IJ3OvTal
 pj8vD9/as/UvJKbddDB+AH7ZyUU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60213bddd5a7a3baae448e60 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Feb 2021 13:25:49
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D00E2C43462; Mon,  8 Feb 2021 13:25:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BC709C433CA;
        Mon,  8 Feb 2021 13:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BC709C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org
Subject: Re: [PATCH v1] Bluetooth: hci_qca:Fixed issue during suspend
References: <1612539436-8498-1-git-send-email-gubbaven@codeaurora.org>
Date:   Mon, 08 Feb 2021 15:25:42 +0200
In-Reply-To: <1612539436-8498-1-git-send-email-gubbaven@codeaurora.org>
        (Venkata Lakshmi Narayana Gubba's message of "Fri, 5 Feb 2021 21:07:16
        +0530")
Message-ID: <87k0rik7xl.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org> writes:

> If BT SoC is running with ROM FW then just return in
> qca_suspend function as ROM FW does not support
> in-band sleep.
>
> Fixes: 2be43abac5a8 ("Bluetooth: hci_qca: Wait for timeout during suspend")
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>

This patch does not apply neither to v5.11-rc7 or v5.11-rc5. What tree
did you use as the baseline?

$ patch -p1 < raw
patching file drivers/bluetooth/hci_qca.c
Hunk #1 succeeded at 76 (offset -1 lines).
Hunk #2 succeeded at 1662 (offset -3 lines).
Hunk #3 succeeded at 1720 (offset -3 lines).
Hunk #4 FAILED at 2107.
1 out of 4 hunks FAILED -- saving rejects to file
drivers/bluetooth/hci_qca.c.rej

$ git am -s -3 raw
Applying: Bluetooth: hci_qca:Fixed issue during suspend
error: sha1 information is lacking or useless
(drivers/bluetooth/hci_qca.c).
error: could not build fake ancestor
Patch failed at 0001 Bluetooth: hci_qca:Fixed issue during suspend

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
