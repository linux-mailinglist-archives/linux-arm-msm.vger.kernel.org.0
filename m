Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08CF1624291
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 13:48:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbiKJMsw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 07:48:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiKJMsv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 07:48:51 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0250A6C701
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 04:48:51 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bp15so2960508lfb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 04:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VgSS+FKD9qOkR6VmuIi8ueaQEoUmTC0BHcBE7yNJo8=;
        b=IwdHWLq6Ru9etUSIT9kqFn5ZmiEUgY20UE8wpBKxwbFoUMF7YPK7e3/S/NqkymRxjV
         +/pFRkDQtgLiQUVMvg8YbSX7lmbJ+t179rxtyXStARVXLW/VLB7QgcmHSYikxc6odOB6
         0rYQUFioZmEF73hQWuI/tJT1izOjaiArUJMwVQHuCfumC1Md4XfcrCYVx1t5m+oOLiap
         A+7UHiOW6dse98QCms/QzRSAcZcGM7aF/aXRDAvEkY/heyy97/AI+x+EYtBWSQ7WzFDL
         GOpgsXZjY0wdsSXddBTjk7yAfNzPvbzIN7b7Ow14VhrCw9vMcUCXhrHf9eIA00AiHZqd
         T+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+VgSS+FKD9qOkR6VmuIi8ueaQEoUmTC0BHcBE7yNJo8=;
        b=HbE3OUm14FotufVyMVTzd5J20e/H26yD0EJVqAd2inwb8EajWu+7Sk7ZYZpmwSBWre
         oDjNQeS2/qTbvrpk3oYYVU4XJmfgDrYpfcZjEyNs+i5/smIK0Rw0kH8h/JCD2Tl844/G
         diRAwlSBRdqlCYEjK26Ep64szClBzsm+MkuCgOiowBxcureQsFdHuKWPFfwS/lNr2Vmy
         A+pG0/Ml1esInxjMGsgjqLvXk9AeeHxX3LgZFgrLVprCfIJEJwXiJqXhUFfBZM6nlpbn
         kHShz0bJaAgszvnc3JBLtw0nj2iHJEDOokltovcg8f8X9cBpb/dVKujMdJb1o3UkwZAw
         5k8A==
X-Gm-Message-State: ACrzQf0PaO/uHDZieNQUWpaDq75I3CgiHRZRqn2kTegIgr2f75HVZ4A6
        zD4ieqqpgNP+uhbVTuPJE2V4tQmGZff7zCpR
X-Google-Smtp-Source: AMsMyM7IxkEtq+xNX6St29phQMhoOFrUuo4jbeG7wbsN7d7k3qmzOeUgCu4sgj0cTk3Jb6uw8vvSew==
X-Received: by 2002:a05:6512:6d4:b0:4a2:f89:db7d with SMTP id u20-20020a05651206d400b004a20f89db7dmr21173642lff.125.1668084529418;
        Thu, 10 Nov 2022 04:48:49 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id m5-20020a056512358500b004a27d2ea029sm2729460lfr.172.2022.11.10.04.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 04:48:49 -0800 (PST)
Message-ID: <d18be4c5-0bb0-970d-2cf4-d788a4a64876@linaro.org>
Date:   Thu, 10 Nov 2022 13:48:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] regulator: qcom_smd: Fix PMR735a S3 regulator spec
To:     Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, patches@linaro.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org
References: <20221110121225.9216-1-konrad.dybcio@linaro.org>
 <Y2zvGxmUyl/kpieu@sirena.org.uk>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <Y2zvGxmUyl/kpieu@sirena.org.uk>
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



On 10/11/2022 13:31, Mark Brown wrote:
> On Thu, Nov 10, 2022 at 01:12:25PM +0100, Konrad Dybcio wrote:
>> PMR735a has a wider range than previously defined. Fix it.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>> No Fixes tag, as the patch is only in -next, so the hash will change.
> 
> No, it won't

Fixes: 0cda8c43aa24 ("regulator: qcom_smd: Add PMR735a regulators")

Konrad
