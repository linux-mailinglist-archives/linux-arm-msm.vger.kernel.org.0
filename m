Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECA33FA3FF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Aug 2021 08:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbhH1GW5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 02:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhH1GW4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 02:22:56 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74471C0613D9;
        Fri, 27 Aug 2021 23:22:06 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id bt14so18734042ejb.3;
        Fri, 27 Aug 2021 23:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HiF+7zA8HBAPFwe6q7tlh4E2+gZ/+XWahT0QBwrHEso=;
        b=saQ0rnniVs/9gPzlpf0owvdwyXxzd4tkuHaCB32Ux2q/aBfoX7gviX0ODDOLrzjJzG
         Mi3aMS6SlYnqsImc9W+/j9Lr7fC/rxIAf8uP8oK5Kg8hdW5im7P+pfpmgla2s//z793c
         oE0J3WibmlszRD8Rgf/DLiXp7jNewaFIi4PECzFrONZoIRCOb5bRT6+FIpf3Md5pvAEw
         vnohrCncr8jtrW61yYr2ieNGutcls6fGRJp/SmBeJoIqEXcuZR77eeeeATBMRGjMJujO
         GCf9QmX4mNzHng+6eWpinmi2n8q2cdJzb8ti3AJfywDim3jc5h5bESwgKdnAsy0XMn++
         CTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HiF+7zA8HBAPFwe6q7tlh4E2+gZ/+XWahT0QBwrHEso=;
        b=bJxPrZvnHGeUl2z8rrCsRPNG1LnK7FbI/0z6ui3oW/CukrKnCb2FTO4ZX53Xm6zSa+
         qTL9BWBTsw1gfBprQ7TyHVr/Z+ug/Ng/NGGUS0wWhRRvIkXoQdgsKSgQ9ORVLKBq1yhN
         +wvxqKMxsxOq0iJiAxZty/4o5WirfrY0fQJ+33ti87P5CLPM9xu8KA19Y6iFW8T84TWa
         Z/YvoNHeL1UHVVNy+kAcfwlAD2nKXyAZvXSeNP7JZnhcpqPck4zSOTGwJUUIB9i/19xM
         /qCwlaI0Pl+XzqkkDerPMTZmtWC+JUH9oYiuuQDmiWpF2tLenL27wrXN9LVILNIXOFt5
         PAKQ==
X-Gm-Message-State: AOAM530Xe1bC6m+P+whrNweoaDQn4+SeN4/+wNlbnx/zr8Czd/NvvKNT
        1uuEb9d6pVAL7cfRYDmGQnQ=
X-Google-Smtp-Source: ABdhPJwE2CJiAC0MCQMsna3VgnY61/nhEjaKHPlghxDgpyUquvddyvu/gmwkRXkpnqvEe++QloGskQ==
X-Received: by 2002:a17:907:7252:: with SMTP id ds18mr14018484ejc.105.1630131725043;
        Fri, 27 Aug 2021 23:22:05 -0700 (PDT)
Received: from [192.168.69.153] ([77.78.38.236])
        by smtp.gmail.com with ESMTPSA id m17sm3826924ejr.27.2021.08.27.23.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Aug 2021 23:22:04 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] mailbox: qcom: Add support for sm4125 sm6115 APCS
 IPC
To:     Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20210622203759.566716-1-iskren.chernev@gmail.com>
 <20210622203759.566716-2-iskren.chernev@gmail.com>
 <CAP71WjxRpdoN9MMTH2Y2Xgc==tC2jWfm7X0_A1CrzZ40N_rg8Q@mail.gmail.com>
From:   Iskren Chernev <iskren.chernev@gmail.com>
Message-ID: <1085ae56-f164-27e3-0c00-f6b187eed1b3@gmail.com>
Date:   Sat, 28 Aug 2021 09:21:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAP71WjxRpdoN9MMTH2Y2Xgc==tC2jWfm7X0_A1CrzZ40N_rg8Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/27/21 6:42 PM, Nicolas Dechesne wrote:
> On Tue, Jun 22, 2021 at 10:38 PM Iskren Chernev
> <iskren.chernev@gmail.com> wrote:
>>
>> SM4125 and SM6115, codename bengal, have APCS mailbox setup similar to
>> msm8998 and msm8916.
> 
> subject and commit refer to SM4125/SM6115, but the diff below is about
> 4250/6115. I suppose it's a typo here, since 6115 is similar to 4250,
> not 4125, right?

Yes, you're correct. The issue was resolved in v2 submitted shorty after:

https://lkml.org/lkml/2021/6/27/167

>>
>> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
>> ---
>>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> index f25324d03842..1a4d8cca5881 100644
>> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> @@ -166,6 +166,8 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>>         { .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
>>         { .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
>>         { .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
>> +       { .compatible = "qcom,sm4250-apcs-hmss-global", .data = &sdm660_apcs_data },
>> +       { .compatible = "qcom,sm6115-apcs-hmss-global", .data = &sdm660_apcs_data },
>>         { .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
>>         { .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
>>         {}
>> --
>> 2.31.1
>>
