Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF6752198E4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 08:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgGIGw3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 02:52:29 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:11491 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726185AbgGIGw3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 02:52:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594277548; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=FduXKrGEYtQxuGDpvIdMVnnvzBix5AEgLPzAi4lPSHU=; b=tTqe9fN63EH6h5pGYjg7qE69GUE2IaBHOuXjBCPVMioA6EdDW+duqHKXVI3mmUH14rQP6IxR
 W2MOR2T/XhdngA3MnFNRnzKhaPRNve89ZKxCouURxzMAZkiVb9I3lwgva1EFw08HgAUsvpx9
 OhmjYoWbMwhi5UIfvSg8jTKhwEk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-east-1.postgun.com with SMTP id
 5f06bea9d07c135855367007 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 06:52:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7BF49C433C6; Thu,  9 Jul 2020 06:52:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.104] (unknown [123.201.173.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: msavaliy)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E9713C433CA;
        Thu,  9 Jul 2020 06:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E9713C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=msavaliy@codeaurora.org
Subject: Re: [PATCH 0/2] spi: spi-qcom-qspi: Avoid some per-transfer overhead
To:     Douglas Anderson <dianders@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, Akash Asthana <akashast@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org,
        ctheegal@codeaurora.org, mkshah@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
References: <20200707201641.2030532-1-dianders@chromium.org>
From:   "Mukesh, Savaliya" <msavaliy@codeaurora.org>
Message-ID: <d5d10877-d24d-3e60-afa9-78d00b6c07a7@codeaurora.org>
Date:   Thu, 9 Jul 2020 12:20:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200707201641.2030532-1-dianders@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/8/2020 1:46 AM, Douglas Anderson wrote:
> Not to be confused with the similar series I posed for the _other_
> Qualcomm SPI controller (spi-geni-qcom) [1], this one avoids the
> overhead on the Quad SPI controller.
>
> It's based atop the current Qualcomm tree including Rajendra's ("spi:
> spi-qcom-qspi: Use OPP API to set clk/perf state").  As discussed in
> individual patches, these could ideally land through the Qualcomm tree
> with Mark's Ack.
>
> Measuring:
> * Before OPP / Interconnect patches reading all flash takes: ~3.4 seconds
> * After OPP / Interconnect patches reading all flash takes: ~4.7 seconds
> * After this patch reading all flash takes: ~3.3 seconds
>
> [1] https://lore.kernel.org/r/20200702004509.2333554-1-dianders@chromium.org
> [2] https://lore.kernel.org/r/1593769293-6354-2-git-send-email-rnayak@codeaurora.org
>
>
> Douglas Anderson (2):
>    spi: spi-qcom-qspi: Avoid clock setting if not needed
>    spi: spi-qcom-qspi: Set an autosuspend delay of 250 ms
>
>   drivers/spi/spi-qcom-qspi.c | 45 ++++++++++++++++++++++++++++---------
>   1 file changed, 35 insertions(+), 10 deletions(-)

Reviewed-by: Mukesh Kumar Savaliya <msavaliy@codeaurora.org>
