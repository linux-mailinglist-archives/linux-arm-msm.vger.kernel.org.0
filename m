Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88B1039731D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 14:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbhFAMYe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 08:24:34 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:19214 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231219AbhFAMYe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 08:24:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622550173; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JAcNP7Uo9zJKWgXCjvCXGiHUwrw7I6s+Af9UbfhFRic=;
 b=LcEwrfCjEUGcZwmIWdqTs6QCWgrA7709mTA/KNQeQFjK0Cb784h1Di3bTXb2GWf4AzC0Bn8q
 5iF37dvSIeC9QzfA9rM7zbEIiT/1Q/QgNnXmt3aKObX8eBdJJcVLrGLoz1pZyiCyPvkL2Cu+
 5j/E1tp2bvcl9gdJWCQA6T7V2ng=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60b62695ed59bf69cceb7186 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Jun 2021 12:22:45
 GMT
Sender: rajeevny=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0A672C43460; Tue,  1 Jun 2021 12:22:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajeevny)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4B0A4C433F1;
        Tue,  1 Jun 2021 12:22:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 01 Jun 2021 17:52:44 +0530
From:   rajeevny@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sean@poorly.run, robdclark@gmail.com,
        robh+dt@kernel.org, abhinavk@codeaurora.org,
        kalyan_t@codeaurora.org, mkrishn@codeaurora.org, jonathan@marek.ca
Subject: Re: [v1 2/3] drm/msm/dsi: Add PHY configuration for SC7280
In-Reply-To: <7a3facb5-d118-f81b-65f8-381b0d56a23b@linaro.org>
References: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
 <1622468035-8453-3-git-send-email-rajeevny@codeaurora.org>
 <7a3facb5-d118-f81b-65f8-381b0d56a23b@linaro.org>
Message-ID: <b37617c61fbdb11dc2c903878c05e0ac@codeaurora.org>
X-Sender: rajeevny@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31-05-2021 23:27, Dmitry Baryshkov wrote:
> On 31/05/2021 16:33, Rajeev Nandan wrote:


>> +	.min_pll_rate = 600000000UL,
>> +	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : 
>> ULONG_MAX,
> 
> Could you please follow the patch by Arnd here?
> https://lore.kernel.org/linux-arm-msm/20210514213032.575161-1-arnd@kernel.org/
> 
> 
> 
>> +	.io_start = { 0xae94400, 0xae96400 },
>> +	.num_dsi_phy = 2,
> 
> Judging from the next patch, you have one DSI host and one DSI PHY.
> Could you please correct io_start / num_dsi_phy here?
> 
>> +	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
>> +};
> 
> 
> With these two issues fixed:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thank you very much for your review :) I have incorporated the
review comments. I am waiting for comments on my DT bindings patch (1/3) 
and
will send v2 in a day or two.

Thanks,
Rajeev
