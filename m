Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E236768643B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 11:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjBAK1a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 05:27:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjBAK13 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 05:27:29 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99FDE166E0
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 02:27:28 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id q10so16825290wrm.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 02:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O/v+SPim2TMK89Jvx/Fmdof1mWi2+HuLSg2Ll3qs1mg=;
        b=tNI1ucmQSvzmYci1AwFz8KNia8T70igmA0nmWM7jMTeHJhaj4/uN0p6P+L8XmTEzc0
         1GgdVuSV2wfN4bxYu6YX8jA//5zgO2H4bkkmCsK/NibIByBloCFffpxqBoEy0QlOF/Nj
         MFeelSbDDXOLPJnEV7PIRbhoN0OftcvYIKnODSOyiMq3jWIn4RhX7IzsUsvzFDuNRsuh
         UkUph8y0ZHveQE9FFADlp3botjVHNCReKUE5oOXXqpnLpdCh6SlpwrRHasTuMUwSwxVy
         Oe1T+F1sqFOoIYGm4BlDBuhfu3A5Qn+EWnHxPiiz796c1wgeptoPHin+jPpQPA2WanGr
         Tcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/v+SPim2TMK89Jvx/Fmdof1mWi2+HuLSg2Ll3qs1mg=;
        b=Ix5XhdeQ/q/AM5/v8fUuASfztC8JbmF7xh4ljJ7nsMsVnr5/rp7Hw0Iw/OcvCFKUAN
         D4BNp9alp3DzmHkUc3O0oraFQ8w8CXhPQIUnb88L6O80hhVpIeWU+/7MxIMPPjC3zk0R
         Gg82pWpyvDmAQ3V8UyZbWbdWP1X22dAt2xIjTqN++t+JrNqBnRRPdFfd4xig+XadJlWo
         oSRSsvtdgH1+Iyr1p8e6IlYyZ02xzKFYNzkPCtfOVRXwd6aO7hiwcvS2tLf/otUEyrrO
         COpI/xZr0ZcKc1KNKhNddJJcdFReqEhDkYdLZNBYBlm9aHuTZrlBaNhT46enY46GGQh9
         narQ==
X-Gm-Message-State: AO0yUKXjNhbi37mE1IWbyFoJbPRujU29wcr7lPurexGGJA8gOLbpP1gM
        MinkEQeD4qV3s8ffZh92miL+Yg==
X-Google-Smtp-Source: AK7set9iu65V+O8RIGaCGpDyfjKqbyK1T3EgcROLhAZNaDkQMLOHvG/glHc3T8xv+DE00T9waooAig==
X-Received: by 2002:a5d:6d8b:0:b0:2bf:dcfb:b58a with SMTP id l11-20020a5d6d8b000000b002bfdcfbb58amr2772815wrs.68.1675247247183;
        Wed, 01 Feb 2023 02:27:27 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g8-20020adfe408000000b002bdda9856b5sm17199371wrm.50.2023.02.01.02.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 02:27:26 -0800 (PST)
Message-ID: <d83949e7-d221-a5c1-4e96-19acbeff3d98@linaro.org>
Date:   Wed, 1 Feb 2023 10:27:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/2] PM / devfreq: qcom: Introduce CCI devfreq driver
Content-Language: en-US
To:     Jun Nie <jun.nie@linaro.org>, myungjoo.ham@samsung.com,
        kyungmin.park@samsung.com, cw00.choi@samsung.com
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230201080227.473547-1-jun.nie@linaro.org>
 <20230201080227.473547-2-jun.nie@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230201080227.473547-2-jun.nie@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/02/2023 08:02, Jun Nie wrote:
> Cache Coherent Interconnect (CCI) is used by some Qualcomm SoCs. This
> driver is introduced so that its freqency can be adjusted. And regulator
> associated with opp table can be also adjusted accordingly which is
> shared with cpu cluster.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

Nice work.

Thanks for taking the time to follow up on this. I had a look at the 
4.19 out-of-tree version of this we have and this code looks just about 
right.

With Krzysztof's comments addressed please add my

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

