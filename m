Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19C9D65F3E5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 19:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbjAESno (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Jan 2023 13:43:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235096AbjAESnk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Jan 2023 13:43:40 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9283CD104
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 10:43:37 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id az7so12625893wrb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jan 2023 10:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rOC/pPBc7T03HB36QyCOetz9Y1pQjcGpASUmzxJmAUQ=;
        b=KLDP33jF9H5Dayn+o7Q80o2HNHlo28RYSmh0cZVMKhrA7eIbPjromox6V8kvJbGZ4L
         VDdDUDdb+LkByYmvpwlRxZRNBFoyHxzrxJLsBVFZXvpjS2vGSP/JtTot5+pY1bgLOXZu
         dH6bLJMIzj3cSQ4XM40KDD/piQv0oQ3AK0nb+HDEuM8uoYMofR4R2uesQ/e9fTEGrfIR
         yayZSxumZXTtxO5xuL1Gu69StRDGV+PdEIlnDBrAIS6qKJ7UgOuaaSBBOOTtayy7tiJI
         dTR7hnFL9vPUqdiet10gDd4oB234ur8MQv4TU//WfUUjXe1pzVTuJI1YTcI28+lL9nFt
         F3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOC/pPBc7T03HB36QyCOetz9Y1pQjcGpASUmzxJmAUQ=;
        b=j/rQ4lxDlQfth0GLKjdqeWqkMYOba0bHKGsM8ZwX/CaX9LyKRk40Ef4hvMXa4Si2ma
         /KfXGbq/n/ZXApKRqTdZkypyNaKZO2TKqu5Dxxo0GkWG/ibjZOdnjG3NNW7nE43M3CR2
         P+z8tjz7Nrv6LiVmL/tr3JMX5hrXF6GTIDiI3STip+r7c3/NRqYkOB95VpUV7yraf9HJ
         JAkB4o59SGtjQEy0N4KSHo4R2ex16ZLrpXMOIEXs7WJR/CpLMDaw+YqawWsRHmV19DMV
         TRFCqAiZ8y51r82qURaba4rt4WcyG0EyjGCkOwy1QmiioR93+mvQcxvarl3DHOhEyNlW
         QQJQ==
X-Gm-Message-State: AFqh2ko9La7DX/ddSjZm5nd6+ytcXu4nhQk/8MScSg1LiEHVF63ILs20
        M3ZWWanl3x+EsNIObdbhVux/TejhTuCzUvQS
X-Google-Smtp-Source: AMrXdXsnhlKKaurxRjy6I/znYI2nvqvG+C4LYCd4bFGm0YbaP/egepH+5DqJZ8mtZdupUE824DEb6g==
X-Received: by 2002:adf:cd0c:0:b0:28d:ef8b:a3d5 with SMTP id w12-20020adfcd0c000000b0028def8ba3d5mr15711211wrm.69.1672944216186;
        Thu, 05 Jan 2023 10:43:36 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z13-20020adff74d000000b002366f9bd717sm43456593wrp.45.2023.01.05.10.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 10:43:35 -0800 (PST)
Message-ID: <4c822211-ef91-416d-2363-cd0022a417af@nexus-software.ie>
Date:   Thu, 5 Jan 2023 18:43:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v7 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robert.foss@linaro.org, akapatra@quicinc.com, jzala@quicinc.com,
        todor.too@gmail.com, hverkuil@xs4all.nl
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com
References: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
 <a885c324-8ac5-da52-2b68-848f36fd045b@linaro.org>
 <a4b0ad23-c003-b2a5-acda-07164048673a@quicinc.com>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <a4b0ad23-c003-b2a5-acda-07164048673a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/01/2023 08:37, Milen Mitkov (Consultant) wrote:
> On 09/12/2022 18:17, Bryan O'Donoghue wrote:
>> On 09/12/2022 09:40, quic_mmitkov@quicinc.com wrote:
>>> From: Milen Mitkov <quic_mmitkov@quicinc.com>
>>>
>>> For v7:
>>> - Fix an issue with output state for different versions of the IFE
>>>    hardware (for platforms different from QRB5, e.g. QRB3).
>>>
>>
>> Yep.
>>
>> Working for me on rb3 now and thank you for updating the git commit in 
>> patch #4.
>>
>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> for the series.
>>
>> ---
>> bod
> 
> 
> Hi Bryan, Robert, Hans and others,
> 
> 
> Happy New Year!
> 
> Is there anything else I can/need to do to speed up the merging process 
> of this series?
> 
> 
> Thanks,
> 
> Milen
> 

I don't think so.

Is everything still working on linux-next ?

e45fb347b630e...cc3c08b41a9c9 master        -> linux-next/master

