Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5A861423E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Nov 2022 01:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbiKAAYf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 20:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiKAAYc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 20:24:32 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F01E3E02C
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 17:24:31 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id f37so21617509lfv.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 17:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+exwCng/IdD1MhFa/UI62X8vLjy6a/cFPmc8Y4Cwpo4=;
        b=ZX7Wbo7qBX7YrGpC53w7yJrjIeHSz5R/Q0JB3s0DrLXFyyMcsZWhvz9kxFc1fTRGVX
         1UNr/sAcfCjkOTxQqFPG/oDt1/Pl70qKWKlHCTtVW0MZidYgelZ/Oc1L57iM1xmpUJlD
         Wt1smVGbaTFzvNMbZDEzWTKzMpx0fGzb5MHujwCEi1k5ZLafxxEj11bmqfMwKjvGluMq
         YGeeVufSU21qY5TptNFTLgAwTW8kw5VJuuR6Qe3uh1tqpzRxxUtqL4HatzNxeZEEsP9N
         LVzPIaCqLPro4g7RHObvDLerXGEnAMbi3OBBu1Q2l1ltFMkyDwtFDo/MSwAoaOWqiUOT
         yi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+exwCng/IdD1MhFa/UI62X8vLjy6a/cFPmc8Y4Cwpo4=;
        b=5LJ7QdSKf/SA08o82xd1k4SjsnfGqvWpLe3F9qTFpyauIFit/5tv8HEWmvBKL+L638
         sfOEOs/8dbRgRNzt/emjl6EfIQK+CHptkeYQzW3PXV0ghAu+AkA/ZyRfLGA4/xsQcNR3
         djZ8l/qVCEqjEsNultD8URj8iS4oaPqr6LhPaG0NB1rJTUunzXnqfCtQC0aCsgiAItwo
         0uhTMLbYxXE5aEjEHVa1SaK0ba08qeWj6gQ8+mdhYDSxv7UD44kf1Xy1lD/e+TeuKXVZ
         S2tIB/RclMeYhacM5rc+omwCFZfQMG6QCW18lvJrBlpiaSGiKAfsoax0c5Kh+xVFhw0J
         nt5A==
X-Gm-Message-State: ACrzQf1AcNkFGetcqqKVN9dk3uFolHRzgfPhrWL7gXDgyJmktH6ED/FQ
        f+pMcpmQczRHuLHRHxEcNa7mAA==
X-Google-Smtp-Source: AMsMyM49VFM7BsrC16yPhi+5RzKjTIKFsvAPXuTCBAVOtXH6jc6RySVnNUgcAbutYcvcQpME4YGKnA==
X-Received: by 2002:a05:6512:2314:b0:4a2:6c4a:4fb9 with SMTP id o20-20020a056512231400b004a26c4a4fb9mr6853631lfu.482.1667262270310;
        Mon, 31 Oct 2022 17:24:30 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d2-20020ac244c2000000b004a27d2ea029sm1472345lfm.172.2022.10.31.17.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 17:24:29 -0700 (PDT)
Message-ID: <1c735bcc-d4f7-333f-58a5-e3f463bab10d@linaro.org>
Date:   Tue, 1 Nov 2022 03:24:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm/msm: Fix return type of
 mdp4_lvds_connector_mode_valid
Content-Language: en-GB
To:     Nathan Chancellor <nathan@kernel.org>,
        Nathan Huckleberry <nhuck@google.com>
Cc:     Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20220913205551.155128-1-nhuck@google.com>
 <Y2BH7sx09nqwKNmt@dev-arch.thelio-3990X>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Y2BH7sx09nqwKNmt@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/11/2022 01:10, Nathan Chancellor wrote:
> On Tue, Sep 13, 2022 at 01:55:48PM -0700, Nathan Huckleberry wrote:
>> The mode_valid field in drm_connector_helper_funcs is expected to be of
>> type:
>> enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
>>                                       struct drm_display_mode *mode);
>>
>> The mismatched return type breaks forward edge kCFI since the underlying
>> function definition does not match the function hook definition.
>>
>> The return type of mdp4_lvds_connector_mode_valid should be changed from
>> int to enum drm_mode_status.
>>
>> Reported-by: Dan Carpenter <error27@gmail.com>
>> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
>> Cc: llvm@lists.linux.dev
>> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
>> ---
>>   drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
>> index 7288041dd86a..7444b75c4215 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
>> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
>> @@ -56,8 +56,9 @@ static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
>>   	return ret;
>>   }
>>   
>> -static int mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
>> -				 struct drm_display_mode *mode)
>> +static enum drm_mode_status
>> +mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
>> +			       struct drm_display_mode *mode)
>>   {
>>   	struct mdp4_lvds_connector *mdp4_lvds_connector =
>>   			to_mdp4_lvds_connector(connector);
>> -- 
>> 2.37.2.789.g6183377224-goog
>>
>>
> 
> Did this patch get lost somewhere? I do not see it picked up. It is
> needed to avoid a new WIP warning from clang for catching these CFI
> failures:
> 
> drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c:89:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_connector *, struct drm_display_mode *)' with an expression of type 'int (struct drm_connector *, struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
>          .mode_valid = mdp4_lvds_connector_mode_valid,
>                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 1 error generated.

It will be picked into 6.1-rc and then propagate through the stable 
kernel updates.

Anyway:

Fixes: 3e87599b68e7 ("drm/msm/mdp4: add LVDS panel support")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

