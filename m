Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDBF2641E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 11:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730618AbgIJJ3s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 05:29:48 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:54732 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726760AbgIJJ3G (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 05:29:06 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 3A488CCA989BC0EEEE23;
        Thu, 10 Sep 2020 17:29:00 +0800 (CST)
Received: from [10.174.178.248] (10.174.178.248) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 10 Sep
 2020 17:28:52 +0800
Subject: Re: [PATCH] clk: qcom: lpass: Correct goto target in
 lpass_core_sc7180_probe()
To:     Stephen Boyd <sboyd@kernel.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <mturquette@baylibre.com>,
        <tdas@codeaurora.org>
References: <20200827141629.101802-1-jingxiangfeng@huawei.com>
 <159972862952.2295844.10882678924928944990@swboyd.mtv.corp.google.com>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From:   Jing Xiangfeng <jingxiangfeng@huawei.com>
Message-ID: <5F59F1D3.50905@huawei.com>
Date:   Thu, 10 Sep 2020 17:28:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <159972862952.2295844.10882678924928944990@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.248]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2020/9/10 17:03, Stephen Boyd wrote:
> Quoting Jing Xiangfeng (2020-08-27 07:16:29)
>> lpass_core_sc7180_probe() misses to call pm_clk_destroy() and
>> pm_runtime_disable() in error paths. Correct goto target to fix it.
>> This issue is found by code inspection.
>>
>> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
>> ---
>
> HMm.. presumably
>
> Fixes: edab812d802d ("clk: qcom: lpass: Add support for LPASS clock controller for SC7180")
>
> should be added?

Ok, I will send a v2 with it.
	Thanks
> .
>
