Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB47EBD09
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2019 06:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbfKAFU4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Nov 2019 01:20:56 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41096 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727332AbfKAFU4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Nov 2019 01:20:56 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1D49D60134; Fri,  1 Nov 2019 05:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572585655;
        bh=2zp/sfIOvfwFWoRF1xTceSxck6l1sLqfckMf67Y639o=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=oRrkdVYucz38PH7wWx8jyEGX3baZHShsaqsQEdPJJhpbB0hhjM/AwV+eY8PyCSUK5
         R2dmnrEVJH5Rh9i4OOSGZaCN8UowHCTuMPcq1tiEAw6FMNf79Tfd3SJ/+G5wQzqKhu
         Qf5mipaZu5A8a0FicOzAbvkNjqxBLYHNRUnsNzZU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7194160A4E;
        Fri,  1 Nov 2019 05:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572585654;
        bh=2zp/sfIOvfwFWoRF1xTceSxck6l1sLqfckMf67Y639o=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Oy4FLzxzno59bqhYbqNQQL/yevQmovbChqXZ1f1tZw1urZFSc/QJr3rG1unrbAFrK
         XNkfDJRFv44HDtYJlioviFfAOAAiBxv8B7/Z9U+omzH9YI3K0dqkmMAWWOL7vFYigv
         lw9p6srPwjkySEPXky0ed+rr+ZlYm4Dq9UGL0+Hk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7194160A4E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add cpuidle low power states
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        mka@chromium.org, swboyd@chromium.org, evgreen@chromium.org,
        dianders@chromium.org, devicetree@vger.kernel.org
References: <1572408318-28681-1-git-send-email-mkshah@codeaurora.org>
 <1572408318-28681-2-git-send-email-mkshah@codeaurora.org>
 <20191030065625.GA14823@e107533-lin.cambridge.arm.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <b85519a6-2725-3953-a8c2-e0627f20d4ef@codeaurora.org>
Date:   Fri, 1 Nov 2019 10:50:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030065625.GA14823@e107533-lin.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/30/2019 12:26 PM, Sudeep Holla wrote:
> On Wed, Oct 30, 2019 at 09:35:18AM +0530, Maulik Shah wrote:
>> Add device bindings for cpuidle states for cpu devices.
>>
> You are not adding bindings, but you are using the existing bindings I
> believe. Anyways good to see a platform using PC mode for cpuidle/suspend.
> What platforms does this sc7180 cover ?
>
> --
> Regards,
> Sudeep

Hi Sudeep,

sc7180 supports IDP platform.

Thanks,
Maulik


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

