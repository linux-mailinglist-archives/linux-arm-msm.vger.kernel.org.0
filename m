Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6636B21AE21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 06:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbgGJElj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 00:41:39 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:36896 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725777AbgGJElj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 00:41:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594356098; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=OVjdWKa1KuoweAYyp7yqaqBQuL2K9SPqsc9S8yXQW08=; b=D9XlEsJauKt/+WD8Io8NjI/G/yzV8QX4ku/zIJIquob2lu/lJOICKXYytMRKdcRG4b7nVETS
 VNa5KUzya1rs9c7lLz53d8VD2/ll6rpchJbBlZOi7vMJ6YD/dqL+AV5sfG9XhtPlGnRgF2Ci
 y8SqVnxIVnhKNKRmlo9fnYMhlaY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5f07f17ed8ca07a5739d5750 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 04:41:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5BC7DC43387; Fri, 10 Jul 2020 04:41:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.7] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B0925C433CA;
        Fri, 10 Jul 2020 04:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0925C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH v2] spi: spi-geni-qcom: Set the clock properly at runtime
 resume
To:     Douglas Anderson <dianders@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mkshah@codeaurora.org, georgi.djakov@linaro.org,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        mka@chromium.org, ctheegal@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
References: <20200709074037.v2.1.I0b701fc23eca911a5bde4ae4fa7f97543d7f960e@changeid>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <35e1b2de-b3ee-95f4-c7ab-dfa8544b744c@codeaurora.org>
Date:   Fri, 10 Jul 2020 10:11:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200709074037.v2.1.I0b701fc23eca911a5bde4ae4fa7f97543d7f960e@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/9/2020 8:10 PM, Douglas Anderson wrote:
> In the patch ("spi: spi-geni-qcom: Avoid clock setting if not needed")
> we avoid a whole pile of clock code.  As part of that, we should have
> restored the clock at runtime resume.  Do that.
>
> It turns out that, at least with today's configurations, this doesn't
> actually matter.  That's because none of the current device trees have
> an OPP table for geni SPI yet.  That makes dev_pm_opp_set_rate(dev, 0)
> a no-op.  This is why it wasn't noticed in the testing of the original
> patch.  It's still a good idea to fix, though.
Reviewed-by: Akash Asthana <akashast@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

