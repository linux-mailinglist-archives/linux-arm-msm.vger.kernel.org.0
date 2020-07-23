Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E260E22A6CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 07:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbgGWFOY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 01:14:24 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:45048 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725822AbgGWFOU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 01:14:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595481260; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=L8urZGZji+YiLr59Yc6bfwfReJYjnRXe3+RKFtKbzFU=; b=gjqBmy0C7wsETAkbtVrnQQ8xrV+LntRw+LbE5WnxV3XqR5qMEJJjjWdlZbE1nDkksHw3sh6+
 sU6hA/pNcVcgAXU0bAgr4YLobkH0jiC/JVT4x4tZBTeQCbzIfZkPgBrtlU2aYOx7/H2dbcAC
 yvbPhP2PenNpo/dPbkwWNU3/Ceo=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-west-2.postgun.com with SMTP id
 5f191ca2ed710aec620f7ec5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Jul 2020 05:14:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C8AB2C43395; Thu, 23 Jul 2020 05:14:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.13] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D823AC433C6;
        Thu, 23 Jul 2020 05:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D823AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH] soc: qcom-geni-se: Don't use relaxed writes when writing
 commands
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Wolfram Sang <wsa@the-dreams.de>, msavaliy@codeaurora.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-kernel@vger.kernel.org
References: <20200722150113.1.Ia50ab5cb8a6d3a73d302e6bdc25542d48ffd27f4@changeid>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <7a4dcef8-fd2a-e714-8b05-724c77c7a012@codeaurora.org>
Date:   Thu, 23 Jul 2020 10:43:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722150113.1.Ia50ab5cb8a6d3a73d302e6bdc25542d48ffd27f4@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/23/2020 3:31 AM, Douglas Anderson wrote:
> Writing the command is the final step in kicking off a transfer.
> Let's use writel() to ensure that any other memory accesses are done
> before the command kicks off.  It's expected that this is mostly
> relevant if we're in DMA mode but since it doesn't appear to regress
> performance in a measurable way [1] even in PIO mode and it's easier
> to reason about then let's just always use it.
>
> NOTE: this patch came about due to code inspection.  No actual
> problems were observed that this patch fixes.
>
> [1] Tested by timing "flashrom -p ec" on a Chromebook which stresses
> GENI SPI a lot.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
Reviewed-by: Akash Asthana <akashast@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

