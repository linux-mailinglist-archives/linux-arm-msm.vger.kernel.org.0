Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B084574575
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 09:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbiGNHH4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 03:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbiGNHHz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 03:07:55 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22CE2CDDA
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 00:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657782474; x=1689318474;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AQwILkBEF2BfUTGSeHu9jpYIfHg66YOWZdRFMejC2SA=;
  b=thmtZ9CVDXzVv1/fqqqqmf2OnhhaQ7AXdMfp6bClWzRJIz5T6GrBkHeK
   FRFZMdk7YCms/k91Pqh2vvbNzeII+6+EQyNti0J55e7HRhftTIrVMRHaj
   nM9BoMyosXuLg4aodbeqt65NvQXi2zybEwx3FkFVugccjq3ZhrrRP6/A/
   o=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Jul 2022 00:07:54 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 00:07:53 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 00:07:52 -0700
Received: from [10.50.55.40] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 14 Jul
 2022 00:07:49 -0700
Message-ID: <7290abc3-8ec7-8128-9d29-651e9b8aa861@quicinc.com>
Date:   Thu, 14 Jul 2022 12:37:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: fix apps_smmu irq
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Parikshit Pareek <quic_ppareek@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Johan Hovold <johan@kernel.org>, Andy Gross <agross@kernel.org>,
        "Rajendra Nayak" <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20220712140009.20765-1-quic_ppareek@quicinc.com>
 <20220712144044.GD21746@workstation> <Ys2gSWpColgPW17+@hovoldconsulting.com>
 <CAA8EJprN-Y2cFR=9TSCw6Db8GAJC8eh08FgFBmxumEKt0iGPBw@mail.gmail.com>
 <20220712182627.GA7766@thinkpad>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <20220712182627.GA7766@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On 7/12/2022 11:56 PM, Manivannan Sadhasivam wrote:
> On Tue, Jul 12, 2022 at 07:41:14PM +0300, Dmitry Baryshkov wrote:
>> On Tue, 12 Jul 2022 at 19:24, Johan Hovold <johan@kernel.org> wrote:
>>> On Tue, Jul 12, 2022 at 08:10:44PM +0530, Manivannan Sadhasivam wrote:
>>>> On Tue, Jul 12, 2022 at 07:30:09PM +0530, Parikshit Pareek wrote:
>>>>> Wrong values have been introduced for interrupts property. Fix those
>>>>> ones, and correct the mapping of context banks to irq number.
>>>>>
>>>> And you ignored my comment about sorting the IRQs...
>>> Isn't the order significant here? Either way, that would be a separate
>>> change that shouldn't be merged with the fix.
>> I'd tend to agree here. Let's get the fix in first and sort the IRQs
>> in a separate commit. The order of them is strange indeed.
>>

As per "arm,smmu.yaml" devicetree documentation, context interrupts are specified in order of their indexing by the SMMU
and not the IRQ numbers, quoting relevant part below.

"Interrupt list, with the first #global-interrupts entries corresponding to the global interrupts
and any following entries corresponding to context interrupts, specified in order of their indexing by the SMMU."

And the current order in DT without sorting by IRQ number matches with the SMMU IP interrupt document,

For example, in the current DT order, you see 409 and then 418 instead of 410. Here 409 is app_tcu_cxt_irpt_vec[73],
418 is app_tcu_cxt_irpt_vec[74] and 410 is app_tcu_cxt_irpt_vec[90] and hence the ordering of 409, 418 .... 410.
Also the reverse ordering at the end from 913 to 891 is also as per this indexing.

So the current ordering is proper and do not require sorting.

As for the missing IRQs and duplicate ones, I will reply on the patch, looks like there are some other misconfigurations as well.

Thanks,
Sai

