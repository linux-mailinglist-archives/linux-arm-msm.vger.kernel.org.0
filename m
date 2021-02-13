Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCDD631AAFF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Feb 2021 12:25:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhBMLZe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Feb 2021 06:25:34 -0500
Received: from z11.mailgun.us ([104.130.96.11]:47251 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229478AbhBMLZb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Feb 2021 06:25:31 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613215510; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WwWdTqspb8dts3dfTnbbRXtTvtaMdbxt2Yfgj+sc2Sg=;
 b=kzsBFjMJyj7uvxr3LBhDzlW2oh1HetmOdmFJLIS6481Xpfa2ZT5TDEsiei/kSXHE8vd3O8hH
 6zThNobMWq1v6w7nkipgSd7ZWtqKv0ztjZub6Q0EqJyix1XJYx1V9cOny/WATn0ASVrR9cC1
 twQTfg1ovf1BPX9YmW8lV9jBeZE=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6027b59b8e43a988b74ca40a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 13 Feb 2021 11:18:51
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7DEDCC43462; Sat, 13 Feb 2021 11:18:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B8F2BC433CA;
        Sat, 13 Feb 2021 11:18:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 13 Feb 2021 16:48:50 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Coresight ML <coresight@lists.linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] coresight: etm4x: Add ETM PIDs for Cortex-A55 and
 Cortex-A78
In-Reply-To: <CAJ9a7VgDxgVUhgrcZc7jX3psWrxWoqHOJ+O36eQf7+-MjVOVeQ@mail.gmail.com>
References: <20210212172336.20550-1-saiprakash.ranjan@codeaurora.org>
 <CAJ9a7VgDxgVUhgrcZc7jX3psWrxWoqHOJ+O36eQf7+-MjVOVeQ@mail.gmail.com>
Message-ID: <a0f2a95c4e4d3d079cf8379bd49b527a@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mike,

On 2021-02-13 16:24, Mike Leach wrote:
> Hi Sai,
> 
> This patch does not apply to coresight/next - possibly because the PID
> for A55 has been added in an earlier patch ( [b8336ad947e19 ]
> coresight: etm4x: add AMBA id for Cortex-A55 and Cortex-A75).
> 

Apologies, my remote was still pointing to linaro coresight repo,
https://git.linaro.org/kernel/coresight.git, I have now updated
the remote to a proper kernel.org coresight repo and will post
the updated patchset.

Thanks,
Sai

> 
> 
> 
> On Fri, 12 Feb 2021 at 17:23, Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Add ETM PIDs for Cortex-A55 and Cortex-A78 to the list of
>> supported ETMs.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c 
>> b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index b20b6ff17cf6..193233792ab5 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -1713,7 +1713,9 @@ static const struct amba_id etm4_ids[] = {
>>         CS_AMBA_ID(0x000bb95a),                 /* Cortex-A72 */
>>         CS_AMBA_ID(0x000bb959),                 /* Cortex-A73 */
>>         CS_AMBA_UCI_ID(0x000bb9da, uci_id_etm4),/* Cortex-A35 */
>> +       CS_AMBA_UCI_ID(0x000bbd05, uci_id_etm4),/* Cortex-A55 */
>>         CS_AMBA_UCI_ID(0x000bbd0c, uci_id_etm4),/* Neoverse N1 */
>> +       CS_AMBA_UCI_ID(0x000bbd41, uci_id_etm4),/* Cortex-A78 */
>>         CS_AMBA_UCI_ID(0x000f0205, uci_id_etm4),/* Qualcomm Kryo */
>>         CS_AMBA_UCI_ID(0x000f0211, uci_id_etm4),/* Qualcomm Kryo */
>>         CS_AMBA_UCI_ID(0x000bb802, uci_id_etm4),/* Qualcomm Kryo 385 
>> Cortex-A55 */
>> 
>> base-commit: 1efbcec2ef8c037f1e801c76e4b9434ee2400be7
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 
> 
> 
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
