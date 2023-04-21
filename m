Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 226756EB133
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 19:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233546AbjDURu7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 13:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233455AbjDURuq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 13:50:46 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9C4210B
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 10:50:40 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2a8b766322bso18607501fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 10:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682099439; x=1684691439;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KhFQgubx3BwRpneR+uPik55kKaBM11rBostrxvE6DUg=;
        b=ZpfuMSjahsn2zfIK1YJS7GIdwB6UzWp+2za1evy8drzjnxvPZie5KKG0nDOoM6LnVj
         GqFraHvvzX9vPHUV5WF70e5oM7Hc9QhzR8LJtNZ5NWsaBhm8ZKOxW2ufSMQQVif1vpb5
         ujUsGDnwLHMi0SAZZzM0utYvrcaSwJiCkyb0ejIjOJDySLJHl9ap+qT+g+SGYjqRpnIZ
         U9dOEwdeYy6fsQGWKXYW0qB3ghe4So06E3DbbhTQ/lm14BkMdNtz5zGbOkE34OzpQqa7
         YZ9tx36Gy11cBPzdlV02uEEqtfAfOEarEYkZjF0bt2aKJcvq69/Ma1mtOeug+KsyvOp4
         FsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682099439; x=1684691439;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KhFQgubx3BwRpneR+uPik55kKaBM11rBostrxvE6DUg=;
        b=kV1LfzBE0vizA7+sjU8gbdffHzzPv/47BmoQp0ClZTvze87hlppTafI44luHfRUKb2
         ozCjHMKybNObnPH4kIq1TGRggWHMX0+BAnffhCoABDUHX/fFSjFWIhZQjKLyjw1bShvT
         DuPytsNtInkW5els8iqnOpk6WjsXm133HxJERPUSpIo7+bJgVBsNZCqIvVsGsAyI2dbC
         yO5NV4iKexJEH/6nE2C4l30BSBikbN4StW5h/ZFs+UDC5gKvdCFo91UVZv3knLR9ry7d
         QkqgbRS55UdQqiAcInY7gSVjKDqllYUXlqW4uakTVFqZNXyAjye0JGDmmtBJRvizrRTW
         aMVw==
X-Gm-Message-State: AAQBX9eVYJY/uUMNauv1Iz2Ih+t6+FvzaFrtr/voaxeGRWh+uG01pza/
        PGQgnLBqTarnLkCqlCLzfvF5ew==
X-Google-Smtp-Source: AKy350YLl37LWk+3RtVor9s7w8AS7YAJyV+v7/RwqjI5kuzAKNNFDYjrD1jErrVutbXwsdxB1F4ZLQ==
X-Received: by 2002:a2e:8350:0:b0:2a8:e4d3:11e2 with SMTP id l16-20020a2e8350000000b002a8e4d311e2mr832615ljh.39.1682099439063;
        Fri, 21 Apr 2023 10:50:39 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id n3-20020a2e8783000000b002a8e4678da4sm679206lji.139.2023.04.21.10.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 10:50:38 -0700 (PDT)
Message-ID: <73e49bab-78a7-1fc2-e521-ede5429ed62e@linaro.org>
Date:   Fri, 21 Apr 2023 20:50:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: drop the regdma configuration
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230420222558.1208887-1-dmitry.baryshkov@linaro.org>
 <911e0a6e-eae4-8f98-8247-f6b2e8a0aeb9@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <911e0a6e-eae4-8f98-8247-f6b2e8a0aeb9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/04/2023 20:46, Abhinav Kumar wrote:
> 
> 
> On 4/20/2023 3:25 PM, Dmitry Baryshkov wrote:
>> The regdma is currently not used by the current driver. We have no way
>> to practically verify that the regdma is described correctly. Drop it
>> now.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> As Marijn noted, perhaps we can drop even DPU_CLK_CTRL_REG_DMA. But you 
> can add that separately, hence

I'd say it's not worth the trouble.

> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry

