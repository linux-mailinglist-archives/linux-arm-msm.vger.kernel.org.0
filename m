Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9B31FD7B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 09:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbfKOILd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 03:11:33 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:56388 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfKOILd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 03:11:33 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7548360F7A; Fri, 15 Nov 2019 08:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573805492;
        bh=tkjLr6SlUn+QeQ8qUjDOStzhyxXnXQ0fWPvfLy8QjVQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=cezKxZfDfOyerLWd8Kk4K5RTqVRcDbcLf3OQPeokcLGWWLFsmNHDQXDuvM3RW/GZ+
         Srhfkvpz/PlrBRPn+zw3grbK+Z0wgi01FuDLiSmsPnbHD8pzua7aUMyOvMKV3SlKUE
         N9TENW/DjHu1IHOIDYqHcDio/pGjkJf/5HDRwZog=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C954860AFE;
        Fri, 15 Nov 2019 08:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573805491;
        bh=tkjLr6SlUn+QeQ8qUjDOStzhyxXnXQ0fWPvfLy8QjVQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=DQHZwmxzPDvt9zpcAWw5Vc1WcijjbJhUPbUHqHeL3jL3nuopLlu5PlwMdfo+Scsf8
         Fr25pb2NfYq5Emdx75wYa6bLpaozLJsvhDW9ynlVZFM2hYnhL+mcckJgROeCht1lUR
         nvKwp6glWFcDtlsnAJyw58ykX5+qbCZjgRj0P8qc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C954860AFE
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 1/7] clk: qcom: clk-alpha-pll: Add support for Fabia
 PLL calibration
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org>
 <1572524473-19344-2-git-send-email-tdas@codeaurora.org>
 <CAD=FV=UjwO25HeVtYvzqEdUxyA4ED18ZxcwEaYVzBGRFTa2FTw@mail.gmail.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <87f22b35-5239-f128-3267-05a867324afe@codeaurora.org>
Date:   Fri, 15 Nov 2019 13:41:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=UjwO25HeVtYvzqEdUxyA4ED18ZxcwEaYVzBGRFTa2FTw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On 11/7/2019 9:54 AM, Doug Anderson wrote:

>> -       ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
>> -       if (ret)
>> -               return ret;
> 
> My compiler happened to notice that with the change to this function:
> 
> drivers/clk/qcom/clk-alpha-pll.c:1166:6: error: unused variable 'ret'
> [-Werror,-Wunused-variable]
>          int ret = 0;
> 
> -Doug
> 

Thanks for the review, will remove the unused variable.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
