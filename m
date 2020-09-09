Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5176262800
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 09:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgIIHHg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 03:07:36 -0400
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:47244
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725863AbgIIHHf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 03:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599635255;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=IX0qpGF6RZPTD4fnxFnuXuw4dThJiaZOCS3toSRRGfU=;
        b=TPNA/FdSr2vG4KNbVuQpTvGu1FRogAMbk5/k2kULKXll4KILO9mFdoMMx0/mI8Ql
        MvJl+i2M+iOsqKVT1ZztRw04XJqu8E/s/bnwp9XRiSXyCdRg1aqegES/tEXqRakqg3m
        HhTPyu3Z+/hMBMnSaRbV2jtuBluc7aVahYP+09Pc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599635255;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=IX0qpGF6RZPTD4fnxFnuXuw4dThJiaZOCS3toSRRGfU=;
        b=MeQLCKmyFc+vYpCWdcqKqQJW9hslp+y0LGqldyG0zd45UIMRP3Ai54MSOY8wdH1K
        mOTfAHN9y9tWEqoOPBroUWIKWOQswpfq/Ma1bjBYB1/nLiv0TY2M9gF1ygszZ5UCyc5
        XhP+hb6eP5vfQIG2NHwv3X6Xn/qZoiPbn2H4Ugbg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 9 Sep 2020 07:07:34 +0000
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>
Subject: Re: [PATCHv3] soc: qcom: llcc: Support chipsets that can write to
 llcc registers
In-Reply-To: <CAD=FV=WsUopZPHJzHe1+pa=pzKQda0yQKUCtnPrni3Dmx7aV3g@mail.gmail.com>
References: <010101746c377537-ce93e925-598b-4dce-bb16-4cda020f4d6f-000000@us-west-2.amazonses.com>
 <CAD=FV=WsUopZPHJzHe1+pa=pzKQda0yQKUCtnPrni3Dmx7aV3g@mail.gmail.com>
Message-ID: <0101017471b0ee7c-d406adca-451c-418d-a07e-e6edb1643177-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.09-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 2020-09-08 20:30, Doug Anderson wrote:
> Hi,
> 
> On Mon, Sep 7, 2020 at 10:36 PM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> --- a/include/linux/soc/qcom/llcc-qcom.h
>> +++ b/include/linux/soc/qcom/llcc-qcom.h
>> @@ -73,6 +73,7 @@ struct llcc_edac_reg_data {
>>   * @bitmap: Bit map to track the active slice ids
>>   * @offsets: Pointer to the bank offsets array
>>   * @ecc_irq: interrupt for llcc cache error detection and reporting
>> + * @need_llcc_config: check if llcc configuration is required
>>   */
>>  struct llcc_drv_data {
>>         struct regmap *regmap;
>> @@ -85,6 +86,7 @@ struct llcc_drv_data {
>>         unsigned long *bitmap;
>>         u32 *offsets;
>>         int ecc_irq;
>> +       bool need_llcc_config;
> 
> Do you really need to add this into "struct llcc_drv_data"?  You use
> it once at probe time and you could just pass it in to
> qcom_llcc_cfg_program(), or just pass the "struct qcom_llcc_config" to
> qcom_llcc_cfg_program()?  It's not a huge deal, but it would make your
> patch simpler and keep an extra element out of the include file.
> 

I just kept it following how other properties were passed to
qcom_llcc_cfg_program(), but yes its better to just pass
qcom_llcc_config to qcom_llcc_cfg_program() so that any future
additions also can use it, will change it in the next version.

> In any case:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
