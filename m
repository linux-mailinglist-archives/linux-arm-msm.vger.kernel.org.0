Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6736012B208
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 07:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfL0Gll (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 01:41:41 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:58619 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726297AbfL0Gll (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 01:41:41 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577428900; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=bUnd6Tdjo5oxX/cin4JeWlHGqzWNxWnqgI4tpkFIVOk=; b=gtv4hZnHHqHQjK5/HLqlw4qZdw318jMgdjqelTCffYj6AjfvNE9yHJsYRd8dteyOofTarNbi
 YYM7J1Cz3aELOqOEzqflxVQRkzlozFGPk1K2KGizUCqGqrXlLBxOFZcpR03sPNbJBUwboXjU
 6kjqObu0BjrCSM5YuNSBS+WbCnQ=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e05a7a3.7f8b45c0f8f0-smtp-out-n01;
 Fri, 27 Dec 2019 06:41:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5072EC433CB; Fri, 27 Dec 2019 06:41:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D6B35C43383;
        Fri, 27 Dec 2019 06:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D6B35C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 8/8] clk: qcom: Add video clock controller driver for
 SC7180
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org
References: <1573812304-24074-1-git-send-email-tdas@codeaurora.org>
 <1573812304-24074-9-git-send-email-tdas@codeaurora.org>
 <20191224023100.4ADB7206D3@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <f9e16f29-ab10-a47a-f678-7fd276c1cbf0@codeaurora.org>
Date:   Fri, 27 Dec 2019 12:11:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191224023100.4ADB7206D3@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Stephen,

On 12/24/2019 8:00 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-11-15 02:05:04)
       clk_fabia_pll_configure(&video_pll0, regmap, &video_pll0_config);
>> +
>> +       /* video_cc_xo_clk */
> 
> Please say what's happening to video_cc_xo_clk.
> 

Updated the next patch set with comment.

>> +       regmap_update_bits(regmap, 0x984, 0x1, 0x1);
>> +

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
