Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1AFC1AA9B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 16:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506391AbgDOOSD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 10:18:03 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:14862 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2506386AbgDOOSC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 10:18:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586960278; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=6iCfcrxU4sYgyPvVveMgmAQUosoLnsjRKAovbj1C6qg=; b=bPdjGxqOK0LXLoFgWN0pFvW9Xm+B4A2q9RXigH1gs2YFFprYbG7UKCr8FbFVMvfloOE2GD4G
 YeD/RpU3gnZ7lWdVlUFeN445RFeJhZhVXWxc0q9SWgDlUzmPiAfHCJWrK0rnbNXVUlxgrqse
 cmNOgJ81qlmYHZoozg2Oehg+3QA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e971794.7f6a64109148-smtp-out-n05;
 Wed, 15 Apr 2020 14:17:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7EDD5C433CB; Wed, 15 Apr 2020 14:17:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F1184C433F2;
        Wed, 15 Apr 2020 14:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F1184C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Wed, 15 Apr 2020 08:17:54 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: cmd-db: Add debugfs dumping file
Message-ID: <20200415141754.GB3820@codeaurora.org>
References: <20200309185704.2491-1-swboyd@chromium.org>
 <20200414215015.GA3820@codeaurora.org>
 <158693222998.105027.13298557609451842017@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <158693222998.105027.13298557609451842017@swboyd.mtv.corp.google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 14 2020 at 00:30 -0600, Stephen Boyd wrote:
>Quoting Lina Iyer (2020-04-14 14:50:15)
>> On Mon, Mar 09 2020 at 12:57 -0600, Stephen Boyd wrote:
>> >+              seq_puts(seq, "-------------------------\n");
>> >+
>> >+              ent = rsc_to_entry_header(rsc);
>> >+              for (j = 0; j < le16_to_cpu(rsc->cnt); j++, ent++) {
>> >+                      seq_printf(seq, "0x%08x: %*pEp", le32_to_cpu(ent->addr),
>> 0x%05x is what we would have for a resource address.
>
>Sorry I totally missed this because the mail wasn't trimmed at all and
>it was really hard to find the one line that wasn't quoted!
>
Sorry, my bad. Somehow didn't notice the quoting has changed.

>5 vs. 8 sounds OK to me. Send a patch? Or I can do it if you prefer.
Apart from the nit, I think the patch looks good. Feel free to add -

Reviewed-by: Lina Iyer <ilina@codeaurora.org>
Tested-by: Lina Iyer <ilina@codeaurora.org>
