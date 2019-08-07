Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB8058491B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 12:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729411AbfHGKIS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 06:08:18 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48712 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729407AbfHGKIS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 06:08:18 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1C2EB60E57; Wed,  7 Aug 2019 10:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565172497;
        bh=gU6ZPaKh9dAzkbWbOv9DhaSWpALlsDO/188gFBItDO0=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=CBZWenHGnnA0tPLWexyBodtJPUj9QVzi8QntloAs3UqZAh9hgmFeMukY8ogtotNN5
         lWeIYzKje2yALMAJdtqvdVqwbCXe3U+vjuS2oofH937YBWGEFw1CO1IXsQ9m/x3tl4
         GAtbO64nX6MRsZr33k4r22duNhE2gyO2+NM17Kfk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.27] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E6F5760E42;
        Wed,  7 Aug 2019 10:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565172496;
        bh=gU6ZPaKh9dAzkbWbOv9DhaSWpALlsDO/188gFBItDO0=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=Te+Ko0OfuQkyQ7e5aV31TzE9Y4VNHKu8pvkNxHEbsO2ZwpFVcP9nuBZQdYDqerJlT
         5uJSzVmaXWgIrCtLJOURITHj/loUV4W+ChytdhhAgrHDy1COrdwoP3B6I43WTiFz83
         NcZ9075LPeIg0lx0H5IJKwx2g4nT7WmVaIkk0xv0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E6F5760E42
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCHv9 1/3] arm64: dts: qcom: sdm845: Add Coresight support
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
References: <cover.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <be6d77eb6c7498df09d04e0a369d4d65b38f4b8e.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <b50c06d4-8298-7abe-4442-2aff336509f5@codeaurora.org>
Message-ID: <b5cb08ef-ca2f-e852-f234-d0f693b58596@codeaurora.org>
Date:   Wed, 7 Aug 2019 15:38:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b50c06d4-8298-7abe-4442-2aff336509f5@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

On 7/31/2019 11:35 AM, Sai Prakash Ranjan wrote:
> Hi Suzuki,
> 
> On 7/31/2019 11:28 AM, Sai Prakash Ranjan wrote:
>> Add coresight components found on Qualcomm SDM845 SoC.
>>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 451 +++++++++++++++++++++++++++
>>   1 file changed, 451 insertions(+)
> 
> I have tested coresight with scatter gather on SDM845 MTP and MSM8996
> based DB820c board and posted the results in
> 
> - https://github.com/saiprakash-ranjan/coresight-test-results
> 
> Please let me know if you need some additional testing done.
> 
> I could not perform coresight tests on MSM8998 MTP with latest build
> as it was resulting in crash due to some AHB timeouts. This was not
> due to scatter-gather and mostly likely the problem with the build.
> Maybe we can keep msm8998-coresight on hold?
> 
> BTW, patches are based on linux-next.
> 

Any more tests you would want me to run?

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
