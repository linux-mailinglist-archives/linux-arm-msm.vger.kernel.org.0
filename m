Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB23720D3D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2020 21:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgF2TCe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 15:02:34 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:52563 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727018AbgF2TCF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 15:02:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593457324; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=vO5cQ9r6C1BPb1i55IQPk0kf5dp76XCzv2CyuUd7XPI=; b=ZvxUOkbFN6N5twlE7MFyWzsSJDPI1klt71sT+Mvox2pTybaXH0TkR68KIbtSA9Ui0AAzUK5P
 +5Co/NBF6z5/OFvQqTZRsLmiiop4vPL+oRXMSlDZUwcLnxlWu5HWABLlye8iGS1wfnqrhkS4
 YzkpFRh3mQf2uS8KE740huGoKRs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ef9d0db3a8a8b20b8dd2086 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Jun 2020 11:30:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CEB54C4339C; Mon, 29 Jun 2020 11:30:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.50.61.98] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AC8BDC433C6;
        Mon, 29 Jun 2020 11:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AC8BDC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v6 6/6] spi: spi-qcom-qspi: Use OPP API to set clk/perf
 state
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>, bjorn.andersson@linaro.org,
        agross@kernel.org, robdclark@gmail.com, robdclark@chromium.org,
        stanimir.varbanov@linaro.org, viresh.kumar@linaro.org,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alok Chauhan <alokc@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-spi@vger.kernel.org
References: <1592222564-13556-1-git-send-email-rnayak@codeaurora.org>
 <1592222564-13556-7-git-send-email-rnayak@codeaurora.org>
 <20200624170933.GB39073@google.com> <20200624171537.GL5472@sirena.org.uk>
 <20200624173948.GC39073@google.com> <20200624174417.GM5472@sirena.org.uk>
 <20200624175536.GD39073@google.com> <20200624180005.GO5472@sirena.org.uk>
 <20200624181245.GE39073@google.com> <20200625152527.GG39073@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <d35e45f3-faf6-6879-e9e3-19e395bdd77c@codeaurora.org>
Date:   Mon, 29 Jun 2020 17:00:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200625152527.GG39073@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/25/2020 8:55 PM, Matthias Kaehlcke wrote:
> On Wed, Jun 24, 2020 at 11:12:45AM -0700, Matthias Kaehlcke wrote:
>> On Wed, Jun 24, 2020 at 07:00:05PM +0100, Mark Brown wrote:
>>> On Wed, Jun 24, 2020 at 10:55:36AM -0700, Matthias Kaehlcke wrote:
>>>> On Wed, Jun 24, 2020 at 06:44:17PM +0100, Mark Brown wrote:
>>>
>>>>> Wait, so *some* of the series should go together but not other bits?
>>>>> But you want them split up for some reason?
>>>
>>>> Yes, this will almost certainly be the case, even if not for this patch.
>>>> I brought this up earlier (https://patchwork.kernel.org/cover/11604623/#23428709).
>>>
>>> I'm not really reading any of this stuff for the series as a whole, as
>>> far as I could tell I'd reviewed all my bits and was hoping whatever
>>> random platform stuff needs sorting out was going to be sorted out so I
>>> stopped getting copied on revisions :(
>>
>> Sorry this caused you extra work, I only fully realized this when the series
>> was basically ready to land :(
>>
>> Avoiding unnecessary revision spam is another good reason to not combine
>> technically unrelated patches in a single series.
>>
>> If I notice similar series in the future I'll try to bring it up early.
>>
>>>> For the QSPI patch you could argue to just take it through QCOM since the SPI
>>>> patch of this series goes through this tree, up to you, I just want to make
>>>> sure everybody is on the same page.
>>>
>>> If there are some part of this that don't have a connection with the
>>> rest of the series and should be applied separately please split them
>>> out and send them separately so it's clear what's going on.
>>
>> Rajendra, IIUC you have to re-spin this series anyway, please split it
>> up in self-contained chunks.
> 
> One more thing: when you do the split it seems it would make sense to
> include the DT changes that were initially part of this series
> (https://patchwork.kernel.org/project/linux-arm-msm/list/?series=278691&state=*)

Sure, I'll send the ones out for which driver changes are already merged/pulled in,
like sdhc, geni-uart and geni-spi.
For the rest, I will include them with the driver changes.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
