Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F87D21AE27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 06:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgGJEpi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 00:45:38 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:51620 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725995AbgGJEpi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 00:45:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594356338; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ioolGlSOdMyvePP6UJ8Y4ZlHaR7JnX0cp6/PAPPg0WI=; b=T1AZwGypwswuIJp07FNFfhYnXA+8ZBqYWPtaTCP+F4wWozKLFZzfYk2pLamE3yKHICxxfWCH
 m+NFxlhCSAgrU937IG26z13Kel9d7glbXClHz/uf1AiZwffMkFdx81ANQ7WbKu/xAle91h5T
 Om+bhkrUDXxaYm9A/gRi1LPUYmE=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-west-2.postgun.com with SMTP id
 5f07f26d9b7f1f3df7c639b4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 04:45:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 589B3C43387; Fri, 10 Jul 2020 04:45:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.7] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 30D2AC433C8;
        Fri, 10 Jul 2020 04:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 30D2AC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH v2 0/2] spi: spi-qcom-qspi: Avoid some per-transfer
 overhead
To:     Douglas Anderson <dianders@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        ctheegal@codeaurora.org, mkshah@codeaurora.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        georgi.djakov@linaro.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
References: <20200709145145.4055619-1-dianders@chromium.org>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <9fcbed05-de8f-9794-6cd5-2623fd79dbb5@codeaurora.org>
Date:   Fri, 10 Jul 2020 10:15:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200709145145.4055619-1-dianders@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/9/2020 8:21 PM, Douglas Anderson wrote:
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
> Changes in v2:
> - Return error from runtime resume if dev_pm_opp_set_rate() fails.
>
> Douglas Anderson (2):
>    spi: spi-qcom-qspi: Avoid clock setting if not needed
>    spi: spi-qcom-qspi: Set an autosuspend delay of 250 ms
>
>   drivers/spi/spi-qcom-qspi.c | 43 ++++++++++++++++++++++++++++---------
>   1 file changed, 33 insertions(+), 10 deletions(-)
Reviewed-by: Akash Asthana <akashast@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

