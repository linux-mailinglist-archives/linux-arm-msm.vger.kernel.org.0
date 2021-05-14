Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 972BE3803C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 08:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231671AbhENGwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 02:52:08 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29726 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229927AbhENGwH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 02:52:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620975057; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=d51erDtkha1RR6bdcED15Fv71pub36quAgP8GlBGWEc=; b=voVH0i+XZykK7nVnlT7J+MCmaBqHun5QpOkVe09cqmQ5AyRX1A0AvHktYCV18mwo1vrEsZAl
 cwBeg8P3EjCg2UNuyLnvnAGBP+xYA9LKi/qip0l8BSFNt2mg+mM+8vjh3jSvt0pWmpGmOOoT
 TyJWeFFBMZbf1EQgCFd/EeTXEFk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 609e1dd0c7220f8fd36165c6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 14 May 2021 06:50:56
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CE409C43144; Fri, 14 May 2021 06:50:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [157.48.128.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 399BFC433F1;
        Fri, 14 May 2021 06:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 399BFC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture
 begin
To:     Mark Brown <broonie@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
References: <20210513114539.4813-1-srivasam@codeaurora.org>
 <20210513133132.GC5813@sirena.org.uk>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <a6649fad-c2ca-1808-4227-8bcb373f66bd@codeaurora.org>
Date:   Fri, 14 May 2021 12:20:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513133132.GC5813@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Brown,

Thanks for your review comments!!!

On 5/13/2021 7:01 PM, Mark Brown wrote:
> On Thu, May 13, 2021 at 05:15:39PM +0530, Srinivasa Rao Mandadapu wrote:
>
>> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> +		ret = regmap_fields_write(i2sctl->spken, id,
>> +						 LPAIF_I2SCTL_SPKEN_ENABLE);
>> +	} else  {
>> +		ret = regmap_fields_write(i2sctl->micen, id,
>> +						 LPAIF_I2SCTL_MICEN_ENABLE);
>> +	}
> This commit doesn't remove the matching update in triger() so we'd have
> two redundant updates.  I guess it's unlikely to be harmful but it looks
> wrong/confusing.

Yes, It's not harmful, as clk_prepare_enable is enabling clock only once 
but maintaining count.

As Some times in Suspend/resume Sequence not hitting startup/shutdown, 
but Trigger, so for maintaining

consistency not removed in trigger.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

