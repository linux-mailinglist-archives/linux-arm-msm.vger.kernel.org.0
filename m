Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58C866B5C72
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Mar 2023 14:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjCKNwd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Mar 2023 08:52:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjCKNwc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Mar 2023 08:52:32 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D8CB12B95D
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Mar 2023 05:52:26 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id h9so8225770ljq.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Mar 2023 05:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678542745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jvgHzZP6duBdKPk8LZDKNHr0yVWeUXrSp8nq1pPiUCU=;
        b=dR6gd0RJlU8aweRFlz2U9JJ7Z9HfzEjj3VgyhfmDBdIcJR1unTuacW2utIUOT7sw2Q
         xcigT1+UzRqjd4QERw6WTxQ82WoNg40xZkXPUyZvz9PvQlPf1dfltjvjkCbUoEs+Anlk
         cui8Vrv2tKT6zUGnjsqF1hcFOR7AMXNx2f2xikQU908iHZ3ueFWnqjnOwytgw8f2Fprp
         GyBmUqg7E7kEdK5+FaQcrmGCT0g7GP6z8LqbOU+CroYj/jLoFMbCwG41FE8v+QM5Vz2s
         3eKyPNQLaXRJSLOqMp8iUSFLSW5P91M3+wG6JXNF4tgTiv4kULKg9dmU/iZ0eVhkVY8D
         v6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678542745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvgHzZP6duBdKPk8LZDKNHr0yVWeUXrSp8nq1pPiUCU=;
        b=nLV4+z1GKyrom4sX1qgtEZLh1SM6nyByuPUGAkiPWaH8FNTQ1Ud+WqIaPBfDV/bzc8
         iXeTz1lTSy//Ccl3CqsOZMDMmyy8XXJXqOrkdLZnKpRYVuepeIHLVjBQn6BMb2uYxfwa
         jTVHGL5VlD3GJa3Wvv3Gh7xmK/a0F4+BRANdFQIG33m83kMJluMaQemXaOKBfz8hy8DX
         D4UswCK8SJXuBVl5zvALVao6qala+VnDmptSEudZ0i3BNuiG+9tjlK0eb4u6Gn03Dv2l
         sHi2YANremnd5niexT5QIf03VkKOP0sc8TVKxRq3vlP0aeqnLyojeS6eOUXLa4rAbX3E
         +Ccw==
X-Gm-Message-State: AO0yUKUnjIDqamsknlsh4Zdqf84NN4p64/NWx8UBpFh6uBGmA5XmuXRH
        ZNoeqEp1Hk/MdzfvaDSQgaeZcw==
X-Google-Smtp-Source: AK7set94nyJ5uuOgspSNFWc3OCJIjN1NGbo5rYP3/hTqJeX440u0vllnccEq17uLd9x5QubIBZ+oeg==
X-Received: by 2002:a2e:7308:0:b0:293:4e6d:9194 with SMTP id o8-20020a2e7308000000b002934e6d9194mr8293403ljc.24.1678542744932;
        Sat, 11 Mar 2023 05:52:24 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c11-20020a2e9d8b000000b00295b1b6e063sm333375ljj.34.2023.03.11.05.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 05:52:24 -0800 (PST)
Message-ID: <0ae6e2b3-721d-f43c-0913-0586a8e8e220@linaro.org>
Date:   Sat, 11 Mar 2023 15:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 1/9] interconnect: qcom: rpm: make QoS INVALID default
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230228-topic-qos-v7-0-815606092fff@linaro.org>
 <20230228-topic-qos-v7-1-815606092fff@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230228-topic-qos-v7-1-815606092fff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/03/2023 23:40, Konrad Dybcio wrote:
> Currently NOC_QOS_MODE_FIXED is defined as 0x0 which makes it the
> default option (partial struct initialization). The default option
> however should be NOC_QOS_MODE_INVALID.
> 
> That results in bogus QoS configurations being sent for port 0 (which
> is used for the DRAM endpoint on BIMC, for example) coming from all nodes
> with .qos.ap_owned = true and uninitialized .qos.qos_mode. It's also an
> issue for newer SoCs where all nodes are treated as if they were ap_owned,
> but not all of them have QoS configuration.
> 
> The NOC_QOS_MODEs are defined as preprocessor constants and are not used
> anywhere outside qcom_icc_set_noc_qos(), which is easily worked around.
> Separate the desc->type values from the values sent to msmbus in the
> aforementioned function. Make the former an enum for better mainainability.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

