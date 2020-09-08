Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFC992617CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 19:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731046AbgIHRnV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 13:43:21 -0400
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:49592
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731306AbgIHRmw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 13:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599586972;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=9eKCnSiGU1Et4Lz5X3lyHQ0MYloqybuZZtvMbeMe6lE=;
        b=WR+gaJNi3BGtQxEVLyBd8Ve7h12hot4UDjEuLwDzdpOi57hWpMjDjdAhJu28WUS3
        z5q+kC9dvX5PlScSp4iHKMNHZl6CQrgMpHLR8cWEeW7pA7uH5bztgiS1v7TQ18aki1r
        umOqugTzl7reHE76lhrW95EziWAENLqBiN2qazUk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599586972;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=9eKCnSiGU1Et4Lz5X3lyHQ0MYloqybuZZtvMbeMe6lE=;
        b=jaM/uM9jMJl1bPRMujTzpccR2N2LSbjpqm3x9heBX4NpWt4P3h4n/Ni3XGQbhKhz
        4q7g6yYoBa3cMzF6SVAb+h1V79gzXusUPPbSrWp9fSExHqrkJ7Ftqyms55+HP6DDCpn
        waBByN1/jy76jwco7iI3JhWadcaKqQANe5mcRXFw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7F5BAC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v3 3/5] ASoC: qcom: Add support for lpass hdmi driver
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1598855964-1042-1-git-send-email-srivasam@codeaurora.org>
 <1598855964-1042-4-git-send-email-srivasam@codeaurora.org>
 <ac1f0b9a-8e07-464c-b0df-6b8e5665a632@linaro.org>
 <0101017458d94c82-96bbcff0-018e-4f5d-8273-7869c3599d32-000000@us-west-2.amazonses.com>
 <b18ed556-09f5-1d2a-b8fc-56a52429addc@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited
Message-ID: <010101746ed032f5-3967f10b-7d55-40ab-a674-63f1ff370565-000000@us-west-2.amazonses.com>
Date:   Tue, 8 Sep 2020 17:42:52 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <b18ed556-09f5-1d2a-b8fc-56a52429addc@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-SES-Outgoing: 2020.09.08-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for your reply Srinivas!!!

On 9/4/2020 4:54 PM, Srinivas Kandagatla wrote:
>
>
> On 04/09/2020 12:21, Srinivasa Rao Mandadapu wrote:
>>>
>>> Before going into detail review, I see real issue in the overall 
>>> approach here to add new interface to exiting lpass!!
>>>
>>> Intention of struct lpass_variant is to address differences between 
>>> SoCs or different lpass versions. But you should not duplicate this 
>>> and use it for addressing differences between each lpass interfaces!
>>> All the dai related register offsets should still go in to this 
>>> structure and driver should be able to know which dai its talking to 
>>> based on snd_soc_dai_driver id and select correct register offset.
>>>
>> Do You suggest to use separate structure like struct 
>> lpass_hdmi_interface in lpass_data?
>
> No, you should just put every thing lpass_variant as you did but no 
> "id" thing in that.
Okay. will change accordingly.
>
> --srini

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

