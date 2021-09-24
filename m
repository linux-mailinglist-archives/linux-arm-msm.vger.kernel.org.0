Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27C5417759
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Sep 2021 17:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347045AbhIXPTe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Sep 2021 11:19:34 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32102 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346995AbhIXPTd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Sep 2021 11:19:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632496680; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=5qolC4jFcMwSFM7kapELzpfX73mIYRcPlbRNqrVXTXg=; b=QotGoXXjFiOgniVkJ45TYjhbQEBMnbNMF3oOcvq5QLF5D/P/SDNutpQinuoq6X49IPOxs2Fj
 6BrHF/Hm/erBCqiU0NQyM5KzhCcGeG5F7Mk73szcJspINkotSoVwuq0jFHSDoa+KZ54r+5Sm
 U9SxEXNRCMRMA5OZhwIphtj8rqs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 614dec256c4c0e0dc3231a10 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 15:17:57
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8A2AEC4360D; Fri, 24 Sep 2021 15:17:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5DC86C4338F;
        Fri, 24 Sep 2021 15:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 5DC86C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Youghandhar Chintala <youghand@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abhishek Kumar <kuabhs@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rakesh Pillai <pillair@codeaurora.org>
Subject: Re: [PATCH v3] ath10k: Don't always treat modem stop events as crashes
References: <20210922233341.182624-1-swboyd@chromium.org>
        <98706efc03c88b54bfb44161566c8e4b@codeaurora.org>
Date:   Fri, 24 Sep 2021 18:17:49 +0300
In-Reply-To: <98706efc03c88b54bfb44161566c8e4b@codeaurora.org> (Youghandhar
        Chintala's message of "Fri, 24 Sep 2021 18:13:48 +0530")
Message-ID: <871r5eroiq.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Youghandhar Chintala <youghand@codeaurora.org> writes:

> I pulled the latest patch changes and tested them on SC7180. Which
> works as expected.
> Do not see this error message during reboot and can be seen while
> doing SSR.
>
> Tested-By: Youghandhar Chintala <youghand@codeaurora.org>

Thanks for testing. But this style of replies makes it hard to use
patchwork:

https://patchwork.kernel.org/project/linux-wireless/patch/20210922233341.182624-1-swboyd@chromium.org/

So please do not top post and always edit your quotes, thank you, Same
request also to Rakesh.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
