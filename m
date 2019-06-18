Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D557B4990F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 08:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbfFRGmN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 02:42:13 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48346 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfFRGmN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 02:42:13 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 576DC6086B; Tue, 18 Jun 2019 06:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560839046;
        bh=pcGOA1XuslGJrQpiDC/6Oj6FBvnMaBf3n7aBV/kUwXw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gR6/FPDeoNZ90kiWz351DZS0sKyMU7g/WWhXpX7DUVpZhRQBuDd0I1jm/bjMPClv1
         TuxteIW8ZJeO9jvZ0tMtZj6bl+SwrQT6J519/pxJ1KEj+m3ii9YnVH3ypBwTIGIJg5
         GMz4VWNut6+E1LnaBb1HmZuXdMsZbRUfK6yYBY8A=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.43.187] (unknown [223.227.13.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nishakumari@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1196C6086B;
        Tue, 18 Jun 2019 06:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560839045;
        bh=pcGOA1XuslGJrQpiDC/6Oj6FBvnMaBf3n7aBV/kUwXw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MujEB7/qmXQmRR7mC/iDoaBy/yeJBuZcpD3R0h8Dij0SY2rPIO7o67Um8bmUrOPKn
         6H4JneM0ZCNcDS1jRDF7QzUvwIg3kq6PDpZc4hjozRMZKU4BkDA8Ks0ErUcIvXRdC7
         132zpX/d/LjpIAHbCHAncsZ1Rotb1v0JUsUqfuY4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1196C6086B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=nishakumari@codeaurora.org
Subject: Re: [PATCH 4/4] regulator: adding interrupt handling in labibb
 regulator
To:     Mark Brown <broonie@kernel.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com,
        david.brown@linaro.org, linux-kernel@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
 <1560337252-27193-5-git-send-email-nishakumari@codeaurora.org>
 <20190613172738.GO5316@sirena.org.uk>
From:   Nisha Kumari <nishakumari@codeaurora.org>
Message-ID: <8294996d-84ee-dff2-7369-00c17348a09c@codeaurora.org>
Date:   Tue, 18 Jun 2019 11:53:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190613172738.GO5316@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/13/2019 10:57 PM, Mark Brown wrote:
> On Wed, Jun 12, 2019 at 04:30:52PM +0530, Nisha Kumari wrote:
>
>> +static void labibb_sc_err_recovery_work(void *_labibb)
>> +{
>> +	int ret;
>> +	struct qcom_labibb *labibb = (struct qcom_labibb *)_labibb;
>> +
>> +	labibb->ibb_vreg.vreg_enabled = 0;
>> +	labibb->lab_vreg.vreg_enabled = 0;
>> +
>> +	ret = qcom_ibb_regulator_enable(labibb->lab_vreg.rdev);
> The driver should *never* enable the regulator itself, it should only do
> this if the core told it to.
Ok, I will change it
>
>> +	/*
>> +	 * The SC(short circuit) fault would trigger PBS(Portable Batch
>> +	 * System) to disable regulators for protection. This would
>> +	 * cause the SC_DETECT status being cleared so that it's not
>> +	 * able to get the SC fault status.
>> +	 * Check if LAB/IBB regulators are enabled in the driver but
>> +	 * disabled in hardware, this means a SC fault had happened
>> +	 * and SCP handling is completed by PBS.
>> +	 */
> Let the core worry about this, the driver should just report the problem
> to the core like all other devices do (and this driver doesn't...).

Ok


Thanks,

Nisha

