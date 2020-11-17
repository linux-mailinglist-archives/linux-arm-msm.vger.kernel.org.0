Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABD42B5A26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 08:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgKQHPH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 02:15:07 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:48142 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbgKQHPG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 02:15:06 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605597306; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=F+0hhCoD2WD3yTTBazhWHu/abFlHBp5GwIq2XdTJMr4=; b=f2R2Nz3lBYyKpS6tbQgyyjdKVFjTddeI/C6vOHWeH9KiRLDHAXvQtb+XpeJpRvbP5RcJaVYb
 qViocSdcDlwc6q50t9eo5d0vkomU8ziMooh9CwRdgZVxXX2ecEdrsuAy3eCnMwLhlPWvaT1E
 PX5wF6wIuMCkRJVVuWmt6P8QxkY=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fb37877309342b9149f0e9b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 17 Nov 2020 07:15:03
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B4CB0C43460; Tue, 17 Nov 2020 07:15:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2EDDFC43461;
        Tue, 17 Nov 2020 07:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2EDDFC43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Subject: Re: [PATCH] ath11k: use MHI provided APIs to allocate and free MHI controller
References: <1605571300-4438-1-git-send-email-bbhatt@codeaurora.org>
Date:   Tue, 17 Nov 2020 09:14:58 +0200
In-Reply-To: <1605571300-4438-1-git-send-email-bbhatt@codeaurora.org> (Bhaumik
        Bhatt's message of "Mon, 16 Nov 2020 16:01:40 -0800")
Message-ID: <87tutozc7h.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bhaumik Bhatt <bbhatt@codeaurora.org> writes:

> Use MHI provided APIs to allocate and free MHI controller to
> improve MHI host driver handling.

How does it improve the handling?

> This also fixes a memory leak as the MHI controller was allocated but
> never freed.
>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/mhi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

For ath11k patches please CC ath11k and linux-wireless lists so that
patchwork sees it. So you need to resend this.

Is this a new API? I need to understand if there are any dependencies
between mhi and ath trees, or if I can apply this directly to my ath.git
tree.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
