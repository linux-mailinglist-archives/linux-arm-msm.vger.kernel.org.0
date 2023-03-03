Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 600376A966E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 12:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbjCCLfi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 06:35:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjCCLfg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 06:35:36 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD91855530
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Mar 2023 03:35:06 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso3740129wmb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Mar 2023 03:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677843302;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=++lCtQQa7+X6IbJitqa270p6tBDtglh3sC+2diUC4Wc=;
        b=P7KeZy0MbCpa8uokBo1HcPwWSBQ8BXNQBUVd/JOxbqUC4BgUIsA9wMjfs2JzHZQCid
         iYQ951Q3cExe7aIGtiEBWNWn5M+P8WsrHYoKScLTNJxMnbp8FraohdsXBMJ5/T8dHiv4
         ro2RXVqixmyKiPfFo8Luu7OF8KbASxrvdJwX+tJcJHb2uKj+bVnaWUrcWAgAqF1xwpy8
         /Mxr66G/ELW35keugG/WhgmVkGT4muQDK0SrS4M5h9uWAICgZ8Ujj4af4VSvl5A0kMKq
         6aOvco6ZhlXKEoBB7+Cu8N+9tTbhSgwDCPN6Ox7sDePyHZxLVrYmr/pnzcDVZ1cqhJ2T
         hsbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677843302;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++lCtQQa7+X6IbJitqa270p6tBDtglh3sC+2diUC4Wc=;
        b=flzO/HiDll1e16N7LImksCzMaUgZ0QVn//3rnfRdywTMWhaP11i7apLMqe3g0Qh81k
         HPDrpFzBkVfmoUNfvrTHjc/gSR8fV9Wvl72APMaUbrhovwvgL7DDztFsYHYf9P1P4/LA
         HupVq/cZPFzh3FdfPkul+sdAh+M2XG2Zl2uX6PjOP2X5RU9hfyd/gtYLypb//u3GU3YL
         VifEuCLLRi90qpm27lbUeH5ptjv6goL/ZVv82MrVBXT2kulS9JH8ctMfzpQmmaTjb3l/
         NgwdgsjBvxGW7iv+Z73X6uPrdwZGyloWB7Whlbr+/gbMrqfcIkPwLlxcwbi4yy8B58m0
         94TQ==
X-Gm-Message-State: AO0yUKVneiEyu5lMoYZD2NrdukfSIWYLmhjpwl2iqdv503XKen5VfI7z
        6rEe1pkSSn8yjHVV/0ygSX1KQP38MDuORobF
X-Google-Smtp-Source: AK7set/VoPy0DxdZaW+WU3Wk6rHfqx1Y9qwEwjfuG55qWo8QfcgBp4oUSSpbHD6h7QM5bXlu0pwfhQ==
X-Received: by 2002:a05:600c:5101:b0:3e0:17d:aeaf with SMTP id o1-20020a05600c510100b003e0017daeafmr1296633wms.7.1677843302111;
        Fri, 03 Mar 2023 03:35:02 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b003db0ad636d1sm6390616wms.28.2023.03.03.03.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 03:35:01 -0800 (PST)
Message-ID: <3116a08a-30a8-c9b9-f079-26739c9e6d49@linaro.org>
Date:   Fri, 3 Mar 2023 11:35:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH] interconnect: qcom: icc-rpm: Don't call
 __qcom_icc_set twice on the same node
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Georgi Djakov <djakov@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230303023500.2173137-1-konrad.dybcio@linaro.org>
 <59b28fb4-1367-9872-ed63-90847e380bb6@linaro.org>
 <29513b9e-8561-7f7e-370e-7515116c7ee6@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <29513b9e-8561-7f7e-370e-7515116c7ee6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/03/2023 11:33, Konrad Dybcio wrote:
> 
> 
> On 3.03.2023 12:32, Bryan O'Donoghue wrote:
>> On 03/03/2023 02:35, Konrad Dybcio wrote:
>>> Currently, when sync_state calls set(n, n) all the paths for setting
>>> parameters on an icc node are called twice. Avoid that.
>>>
>>> Fixes: 751f4d14cdb4 ("interconnect: icc-rpm: Set destination bandwidth as well as source bandwidth")
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>> RFC comes from the fact that I *believe* this should be correct, but I'm
>>> not entirely sure about it..
>>>
>>>
>>>    drivers/interconnect/qcom/icc-rpm.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
>>> index a6e0de03f46b..d35db1af9b08 100644
>>> --- a/drivers/interconnect/qcom/icc-rpm.c
>>> +++ b/drivers/interconnect/qcom/icc-rpm.c
>>> @@ -387,7 +387,7 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
>>>        ret = __qcom_icc_set(src, src_qn, sum_bw);
>>>        if (ret)
>>>            return ret;
>>> -    if (dst_qn) {
>>> +    if (dst_qn && src_qn != dst_qn) {
>>>            ret = __qcom_icc_set(dst, dst_qn, sum_bw);
>>>            if (ret)
>>>                return ret;
>>
>> Is it possible for src_qn == dst_qn ?
> As the commit message says, sync_state calls set(n, n) in
> drivers/interconnect/core.c : icc_sync_state(struct device *dev)

So you've _seen_ that happen ?

