Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 455B762C580
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 17:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233588AbiKPQzI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 11:55:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233843AbiKPQyj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 11:54:39 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 939BF6441
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:53:38 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id j16so30418951lfe.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iszrNYzajn9WkIQ37uHceVXicqY4KT0BT10PEKA+Zi0=;
        b=OvzBYo54+ajLTkRMVCCCunE5slbY8tg3GAkBYO6qtSuk0nb6E4/LzpHQFMznXu/lR6
         4eCeMhlvV6I9ZQ86Wn0o7TVW2YphQFKDdKzw1orUXtdfmIq2xvQyxW96NeY+3t3xdSy6
         YAdBOV1qVTjOmRtgggbUMsRtvGGMq1+1xwRMOI0RUF9oJsXh2vRa4hHVK3DFQM+PuJuD
         0VVxlBV92zYfqCObSeZ50UC/ytpRE6sTRs1zv6TSCPdtdvfCVPZEDAEBo0fWEXYQ28RB
         dHMZfienVtWZl9X18qR9uGoUlG1WrRQZWVcbGbFwRoznNlk/Vvx71PISG5Soob2Os+F1
         tKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iszrNYzajn9WkIQ37uHceVXicqY4KT0BT10PEKA+Zi0=;
        b=rCmPIxdTnGQKUKu5EHoNjSqlIhNepdp2Z+PznnDrNf6mYx7eUlvDPj/iXm4u5Zmegf
         37YX7OvTbDXkYSAuSR9umq51J6dG5H3wdVElnQH97X7qzhBH9GkW0vZWRzZ3zHI40LhC
         R9Lh5bt9nn9nsf6FMzbEWNWFxxAbdfZaCvaZyRofY/sjcYibOAFUKqYeBSyz8vrBHFJW
         M+hGcpjFPYjIixU8FZsxEOXTa8o3PD2giNWsujXhgfwdEFDhjgaDVxqJFQIwGOfGT8UE
         PIbHpeNVk9PE6DeBwDtwoVA6J/HzCTMid2o6o1H0E0FSGdllKH1/hD5FnQMVFl424K47
         A7uw==
X-Gm-Message-State: ANoB5pks7LPFDNmATKSptvIWBZgEYS3ky3LRIyI0NSe9oJ7urK+PCHcf
        1lUEmpUhyWzBcEjS8PZciJgl5g==
X-Google-Smtp-Source: AA0mqf6bwZzX7JUtRpxWrXYoVsJirzxUmGBYecHGrzlqrH3xShFnLBYgDd0VG7ilbfz8e++SjBO5rQ==
X-Received: by 2002:ac2:4bcb:0:b0:4b4:210d:7d2e with SMTP id o11-20020ac24bcb000000b004b4210d7d2emr7888934lfq.450.1668617616960;
        Wed, 16 Nov 2022 08:53:36 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id k4-20020a05651239c400b0048a934168c0sm2690947lfu.35.2022.11.16.08.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 08:53:36 -0800 (PST)
Message-ID: <d73ee3aa-6957-6bcb-5053-1002255d6446@linaro.org>
Date:   Wed, 16 Nov 2022 17:53:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v6 5/7] arm64: dts: qcom:
 sdm845-db845c-navigation-mezzanine: Add navigation mezzanine dts
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221116162801.546737-1-bryan.odonoghue@linaro.org>
 <20221116162801.546737-6-bryan.odonoghue@linaro.org>
 <730467dc-419f-bcb6-c4d8-24951b4dde62@linaro.org>
 <6fe6723b-842e-7a56-a15c-6b7e044c7d45@linaro.org>
 <5298da29-4f97-5bab-7252-380a15c06b71@linaro.org>
 <3f5af01e-8d7d-bab1-b6bf-e1d6fc8e4f33@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <3f5af01e-8d7d-bab1-b6bf-e1d6fc8e4f33@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 16/11/2022 17:48, Bryan O'Donoghue wrote:
> On 16/11/2022 16:45, Konrad Dybcio wrote:
>> Ok, but is there anything special preventing you from adding
>>
>> csiphy3_ep: endpoing {
>> };
>>
>> under port@3 in 845 and have it working? Does it need more driver 
>> changes?
>>
>> Konrad
> 
> I've tried switching it on and it doesn't "just work".
> 
> Removing it seems like overkill to me and to be honest feels like a 
> retrograde step.
Yeah I wouldn't remove it now.

Konrad
> 
> ---
> bod
