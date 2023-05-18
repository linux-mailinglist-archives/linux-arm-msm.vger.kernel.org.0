Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0809D708AAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 23:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjERVkI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 17:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjERVkH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 17:40:07 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC89F0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 14:40:06 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ac785015d6so27545301fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 14:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684446004; x=1687038004;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=40Gyat26WkNmThn0Z4RZrSZ9NCA36CB8DB/834bSSl0=;
        b=KQl+dpi4yYFPPJ2Dklv3J6mZgwBwxHqQu8bTfWom/qlifttbvf9I/QMY5FDPFbUmgw
         PlShh3povoE+USTTHvOCFyTgZoUm+Gi01uQ4PbBEzSeMyBxNpOASgm7d2aClmqdBGzYe
         3fKDjxlPsMyNrg/9qVN9c8KbpvARfyxuHqSh0hBgkdnrjdFJP8oPJVLdMvR/T4M7Eyxb
         V8IsAAKp9L7lML+BXFEGabutSnq3jz7gbVl2QvQnKxhF0orRzAfcVMoyE2gIkzOsRz0A
         Romuc6d4kFoiwdzgs1kq07xWPsZ5v7ybSjnTCAHsoq72zg++1yGV6r41rhy/vHz+L/Xk
         G8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684446004; x=1687038004;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=40Gyat26WkNmThn0Z4RZrSZ9NCA36CB8DB/834bSSl0=;
        b=IvkyOmq87fB0XnWyzlWhejneV3UT+ILJl594YCoM5B0jyWwNC0ClojY8mBGhRSUqYS
         UALIx87H8P7VjNLH/mr73l99NTnKHj3E1jGKDNvtjGWfhSBbp9ft2a7X3Tazjeq28CeB
         R53QuaoEY1ZQMpWUCNy7OL7bXh/kfUQgoqNJvDeUUqNKaabmyvizj6fr8I3FBwCayxaF
         6zSQ9zsUc8aGsKL9jTM7MbdCiPeXYainzqoXsCD2y34+VSCbesJk+YjcJw6BveQamkI/
         wXFAjcTYscOG47XbJ580VJd3sY3+cugpsXAk+QYEb863g3K8RMzTGGLKaNiDcaNTmHRa
         CJhg==
X-Gm-Message-State: AC+VfDwE5q4Z0XtNvaz88I/GeckzXZquTNBU9GA7mIq1IB/IIMhqzg5V
        ItKzx46eVNvAXp6EH4ugbVagWw==
X-Google-Smtp-Source: ACHHUZ5hhPS7K0DwnDGSmlF1ykN8yav6TjZWFfP3drK4OfdV/QumBkZzlv1FLbSdbEgv25/REZApYQ==
X-Received: by 2002:a2e:804e:0:b0:2a7:b1de:3ff7 with SMTP id p14-20020a2e804e000000b002a7b1de3ff7mr11114773ljg.16.1684446004525;
        Thu, 18 May 2023 14:40:04 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d22-20020a2e96d6000000b002acad2f2994sm484810ljj.127.2023.05.18.14.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 14:40:04 -0700 (PDT)
Message-ID: <ae1cd755-ead4-79e0-8d12-074f08e592f1@linaro.org>
Date:   Fri, 19 May 2023 00:40:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/3] drm/msm/dpu: drop SSPP's SRC subblock
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230429012353.2569481-1-dmitry.baryshkov@linaro.org>
 <20230429012353.2569481-2-dmitry.baryshkov@linaro.org>
 <375aoihzzqquma4e53zfl7t6xdamlwyb2t36effy44wooylywp@5oz5jl5t54qo>
 <cace6559-dbd4-0fa0-5b59-88c75cf35091@linaro.org>
 <seamj37nkkwn5n2b6jdhpul5kgouwrph22nsyunhibw2tjutxv@euo7k55aatx4>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <seamj37nkkwn5n2b6jdhpul5kgouwrph22nsyunhibw2tjutxv@euo7k55aatx4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/05/2023 00:39, Marijn Suijten wrote:
> On 2023-05-19 00:06:15, Dmitry Baryshkov wrote:
>> On 18/05/2023 22:14, Marijn Suijten wrote:
>>> On 2023-04-29 04:23:51, Dmitry Baryshkov wrote:
>>>> The src_blk declares a lame copy of main SSPP register space. It's
>>>> offset is always 0. It's length has been fixed to 0x150, while SSPP's
>>>
>>> It's -> its, twice.
>>
>> Ack
>>
>>>
>>>
>>>
>>>> length is now correct. Drop the src_blk and access SSPP registers
>>>> without additional subblock lookup.
>>>
>>> Note that the block code still calls `dpu_debugfs_create_regset32()` on
>>> "src_blk", do we want to rename that?
>>>
>>
>> I could not come up with a better debugfs file name, so I decided to
>> leave it as is.
> 
> Just "blk" or "reg(s)"?  This already sits in a dspp/%d subfolder so no
> need to repeat "dspp" at least.  But also fine to leave it untouched for
> now.

s/dspp/sspp/ ?


-- 
With best wishes
Dmitry

