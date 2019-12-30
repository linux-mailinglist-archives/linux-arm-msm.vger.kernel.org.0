Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9F0412CE03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2019 10:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbfL3JLD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Dec 2019 04:11:03 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:43062 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727275AbfL3JLC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Dec 2019 04:11:02 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577697061; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=mqSVD307H7KfRIlgHTgsORGzqh16/74mQbEwil/iTos=; b=pMubvdi6GdcyNpRz4R/nXiFEm/wPZzyPJs32Tk1omzsV5c79Wvn30/7aWGrcKTuMStCm5YfE
 tOTfzBzFlktYKO4APgcaTFIRugA8BQc/2ymWIcMmVG+5+S8AFTWewgki/9+PxCQ3BTIbfmJ8
 hzH3oflHMfb3Af3+n3eUcMC5vNg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e09bf23.7f63b8ab31b8-smtp-out-n03;
 Mon, 30 Dec 2019 09:10:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9CB52C43383; Mon, 30 Dec 2019 09:10:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.201.2.161] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8D802C447A0;
        Mon, 30 Dec 2019 09:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8D802C447A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
Subject: Re: [PATCH V2 2/7] pinctrl: qcom: Add ipq6018 pinctrl driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        sivaprak@codeaurora.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1576752109-24497-1-git-send-email-sricharan@codeaurora.org>
 <1576752109-24497-3-git-send-email-sricharan@codeaurora.org>
 <20191229033530.GN3755841@builder>
From:   Sricharan R <sricharan@codeaurora.org>
Message-ID: <af83d26c-3f0f-3246-7270-522eeb4cb02d@codeaurora.org>
Date:   Mon, 30 Dec 2019 14:40:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191229033530.GN3755841@builder>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 12/29/2019 9:05 AM, Bjorn Andersson wrote:
> On Thu 19 Dec 02:41 PST 2019, Sricharan R wrote:
>> diff --git a/drivers/pinctrl/qcom/pinctrl-ipq6018.c b/drivers/pinctrl/qcom/pinctrl-ipq6018.c
> [..]
>> +static const struct msm_function ipq6018_functions[] = {
> [..]
>> +	FUNCTION(qpic_pad),
>> +	FUNCTION(qpic_pad0),
>> +	FUNCTION(qpic_pad1),
>> +	FUNCTION(qpic_pad2),
>> +	FUNCTION(qpic_pad3),
>> +	FUNCTION(qpic_pad4),
>> +	FUNCTION(qpic_pad5),
>> +	FUNCTION(qpic_pad6),
>> +	FUNCTION(qpic_pad7),
>> +	FUNCTION(qpic_pad8),
> 
> Shouldn't the qpic_padN entries be removed now? (Please double check the
> rest as well)
> 

 ok, will fix and others as well.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
