Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD052607EC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 21:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbiJUTLL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 15:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbiJUTLJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 15:11:09 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B58824B306
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 12:11:06 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id h8so4953480lja.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 12:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9N0quDGynabuTnZpTH6+L+PseJlLMHF0ftpq0x+i50=;
        b=ivJnr3EVAaMbX/61XT9Fla7Vz4RzD/bdgG0NFNWNPvmqymlecs7UvVuOneEF3LGdH5
         yMmishz/tlU6bbaO4oztwg4OJ7zO3pOb0/BYueOK+lc57zJoNu99JkYAfICUqGXDSBIN
         GWJG/Vid6uT5K0KDGrwuxX0HxceB/4U2mHwx7SjxY5ucX4aqOAi6DDN3B8M7zMR95Djd
         8xr6CBymWaOTplhYIa1fgjAEPZwLqGXpP+fuvnfna2WOms7MkOjR1Wc2XkQE+7w+mFKZ
         jSQJqaPdouyIJoVGdcNanb1ZG/5oTv1DeinUCUPq3uNIvKWDF60NOkRnznkhd1i9o/fp
         DTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9N0quDGynabuTnZpTH6+L+PseJlLMHF0ftpq0x+i50=;
        b=ljXjC7Qw2cQy0CVg5zmAShgU/sR4GoH8RI9t0n2JEUVvpTg9gZB/EM/NHSLuB0DE9L
         tcopWan7HWqf60Qk7ZwJ+EvtYtTu6a6MzHwAWH3AZ7j+EttmY+9bHpj9K8QRWUrJVltz
         Kau/bYjUorDZrgw3hoIHpQi3aLf9o2p1ktCFRdSS3IqhfWgtbouaSJxtZDgxJUEXoMpB
         cbMaotkJAHWFQV1TAy7NVp81hDMrzgXgInXgRaylQ94YEU+YHh2STP9lldJ+LahXx5mY
         T4HPVRNF6Lb9trnpHZXvfP0Krw/THYWt7hZ8peXG2S9EPjre/lReCUUiPtF+bpRQZ0V6
         ftSw==
X-Gm-Message-State: ACrzQf3wdYA0UEpAC1vOv0jq/cgmXCReRlYlhNE76L/bLfpxXjH/LdKE
        AvbEzfZsuLaIhvFaMFPAhauzeLUozMLFDA==
X-Google-Smtp-Source: AMsMyM7Om9Qo99zfePmjfmWjdKbj+bCXywZjrwsrk5ZvhWF4xm1XxXNXvV8YGUWm8+TmpewkgEdfzA==
X-Received: by 2002:a17:907:7f1c:b0:78d:ddc7:dfb1 with SMTP id qf28-20020a1709077f1c00b0078dddc7dfb1mr17382708ejc.189.1666379453437;
        Fri, 21 Oct 2022 12:10:53 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:25b:e73e:85eb:ae6e? ([2a05:6e02:1041:c10:25b:e73e:85eb:ae6e])
        by smtp.googlemail.com with ESMTPSA id fe7-20020a056402390700b004587c2b5048sm14014709edb.52.2022.10.21.12.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 12:10:52 -0700 (PDT)
Message-ID: <c9fcb7f4-5bb3-a5d4-ee2a-0e65282d9d73@linaro.org>
Date:   Fri, 21 Oct 2022 21:10:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RESEND PATCH 2/2] thermal: qcom: tsens: simplify debugfs init
 function
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20221021181906.16647-1-ansuelsmth@gmail.com>
 <20221021181906.16647-2-ansuelsmth@gmail.com>
 <f1e9b309-ba98-bba2-8d12-9f13ac34587d@linaro.org>
 <6352eb65.050a0220.3eb5e.14c7@mx.google.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <6352eb65.050a0220.3eb5e.14c7@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/10/2022 20:56, Christian Marangi wrote:

[ ... ]

> Hi,
> thanks for the review! I have to be honest and do not create some fake
> excuse for this. This patch is a bit old and was pending from a long
> time so out of despair i just tried to RESEND this hoping someone would
> pick it up. And it seems it have worked... Sooo sorry for making you
> asking this.
> 
> On rechecking the change here, the entire debug_init logic seems
> wrong... I don't know if it's possible but what if in the system there
> are multiple version of tsens istance? Looks wrong to overwrite the
> version with the last one...

It sounds not logical to have different versions, a quick look at the DT 
seems to confirm this. However, it is an assumption and it may be safer 
to assume the opposite can happen

> I think the original idea of this was to create a directory for each
> istance and put in there version and sensors debugfs.
> 
> I will propose this in the next version if it's ok for you and you agree
> with this logic. Also I think I will split this in 2 different patch one
> for the version fixup and one for this new logic.

I don't have a strong opinion on that but it seems reasonable

> Waiting for your feedback and again sorry for the noise.

No worries ;)

>>>    	debugfs_create_file("sensors", 0444, priv->debug, pdev, &dbg_sensors_fops);
>>>    }
>>>    #else
>>
>>
>> -- 
>> <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs
>>
>> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
>> <http://twitter.com/#!/linaroorg> Twitter |
>> <http://www.linaro.org/linaro-blog/> Blog
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
