Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2006384A74
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 13:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbfHGLQo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 07:16:44 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35420 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbfHGLQo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 07:16:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id EBAB160E3F; Wed,  7 Aug 2019 11:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565176602;
        bh=wn8HVAyIf35oyGrdxkkAG6UgB7MluicsdBzxP+JPiYA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=PKRTDch+ILT5c2mLnwRwIR/5vZ1qGH/zvy5OYZdharsH60lYWPtZ76yCtGP9WF+VY
         BczYuOjejWeF6nE7qj1r75wHX3JND9awFU39HjG6wse2/nqCJ15BQJzd85zvudNug9
         j70jXNlmj3m+5aAzlvKS7fST2nyhfPMbjk0iQ2yI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.43.47] (unknown [223.237.242.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2FBE560795;
        Wed,  7 Aug 2019 11:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565176602;
        bh=wn8HVAyIf35oyGrdxkkAG6UgB7MluicsdBzxP+JPiYA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=PKRTDch+ILT5c2mLnwRwIR/5vZ1qGH/zvy5OYZdharsH60lYWPtZ76yCtGP9WF+VY
         BczYuOjejWeF6nE7qj1r75wHX3JND9awFU39HjG6wse2/nqCJ15BQJzd85zvudNug9
         j70jXNlmj3m+5aAzlvKS7fST2nyhfPMbjk0iQ2yI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2FBE560795
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCHv9 1/3] arm64: dts: qcom: sdm845: Add Coresight support
To:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        mathieu.poirier@linaro.org, bjorn.andersson@linaro.org,
        leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
        agross@kernel.org, david.brown@linaro.org, mark.rutland@arm.com
Cc:     rnayak@codeaurora.org, vivek.gautam@codeaurora.org,
        sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        marc.w.gonzalez@free.fr
References: <cover.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <be6d77eb6c7498df09d04e0a369d4d65b38f4b8e.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <b50c06d4-8298-7abe-4442-2aff336509f5@codeaurora.org>
 <b5cb08ef-ca2f-e852-f234-d0f693b58596@codeaurora.org>
 <adc1ac7a-877a-73cf-4051-4e3b4017799b@arm.com>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <20da41d4-7626-0fd8-ebd3-f8a632b3cac2@codeaurora.org>
Date:   Wed, 7 Aug 2019 16:46:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <adc1ac7a-877a-73cf-4051-4e3b4017799b@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/7/2019 3:42 PM, Suzuki K Poulose wrote:
> Sai,
> 
>> Any more tests you would want me to run?
> 
> Apologies for the late response. I had seen the results and they look fine.
> I was hitting some issues, which I have now root caused to firmware issues.
> So we are good to go.
> 

Thanks Suzuki.

Hi Bjorn, any chance you could pull these in?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
