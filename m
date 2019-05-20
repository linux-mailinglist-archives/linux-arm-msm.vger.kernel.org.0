Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44659237F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 15:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732217AbfETNUJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 09:20:09 -0400
Received: from foss.arm.com ([217.140.101.70]:45734 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727319AbfETNUJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 09:20:09 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00BC880D;
        Mon, 20 May 2019 06:20:09 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF2183F5AF;
        Mon, 20 May 2019 06:20:07 -0700 (PDT)
Subject: Re: [PATCH 1/3] firmware: qcom_scm: Use proper types for dma mappings
To:     Ian Jackson <ian.jackson@citrix.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
References: <23774.56553.445601.436491@mariner.uk.xensource.com>
 <20190517210923.202131-2-swboyd@chromium.org>
 <23778.30265.117488.781364@mariner.uk.xensource.com>
From:   Julien Grall <julien.grall@arm.com>
Message-ID: <c78c372a-4cf4-9721-38f2-d173eecee27e@arm.com>
Date:   Mon, 20 May 2019 14:20:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <23778.30265.117488.781364@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Ian,

On 20/05/2019 10:41, Ian Jackson wrote:
> Stephen Boyd writes ("[PATCH 1/3] firmware: qcom_scm: Use proper types for dma mappings"):
>> We need to use the proper types and convert between physical addresses
>> and dma addresses here to avoid mismatch warnings. This is especially
>> important on systems with a different size for dma addresses and
>> physical addresses. Otherwise, we get the following warning:
> 
> Thanks.  Do you expect this to be a backport candidate and if so how
> far back do you think it will go ?  To be honest, I am not really
> convinced that backporting this would be a service to users.  The
> situation I have, where I changed the compiler but kept the old kernel
> code and old configuration, is going to be fairly rare.

I will leave the maintainers answering to that.

> 
> I think I should probably therefore disable this driver in the config
> on stable branches of Linux, at least.

If we decide to disable the driver, then we would need to add in our .config, 
then we would need to disable completely the support for Qualcomm (i.e 
CONFIG_ARCH_QCOM=n) on Arm32.

This should not be an issue in osstest as we don't test any qualcomm board so far.

Cheers,

-- 
Julien Grall
