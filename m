Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE5FD70CB97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 22:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231966AbjEVUwq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 16:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjEVUwq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 16:52:46 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953CE92
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 13:52:44 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f3baf04f0cso2509910e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 13:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684788763; x=1687380763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qzzot298H9S1xfQy884A/n0F+LWiqtlI5Y6iFzIpxTc=;
        b=oMmr8mt0z/vOfSJrCq3pVtuEPbsCeAhYSqZ1Rwwrlg4IlUvBrjx2h6IR6rcId/aR8z
         hQE74P0bv510AuIg0+IBRXLkFXdOfjlBxs/iQZzGYGtXhhvN8zzCIZSahgoMQHK4ao7T
         nqD6gXwgHX4+A2yM5PNd9j5N1StTv9YAimTnEzogoqYXArx1/COtpDYOJaCq20XLqsX8
         t77QiJuQ/NqXSs7FaC8IZOU/vza4UM2ldNmZMX8xiRUa+vjmtL05UxcT3YBInbSWwAVA
         34T9SQHgPrAb5NLBk1KXxvdFHzuzmBqMPJACBGq/6BzT2Fs2tjF+v62DdXXPFdM1dQdL
         dFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684788763; x=1687380763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzzot298H9S1xfQy884A/n0F+LWiqtlI5Y6iFzIpxTc=;
        b=GAnniz13zISPgg+p3e7HT7/52+4qq+mOB2a3dAMXnGnmYp5TbKlngInIK5FRXqJAoX
         bE/u/8JF1E7axeD4D0cDSrXD57SQJ0hMVTdVUorf+20wGkbJhLMLBwpkwg4gtzFrzVT8
         FvAL7emDco1y+NeZ5wxP17cQkDrpdHhPznXkJoFImlSXfxRXHuI65GfLUGyWszsmLsrj
         RxYRB7LDg7bmuDy28agWRlf1gM0MgzfFR2at1cxnKoUYajItkG9aBAy6RzN5x5u9SHc8
         ZYqE1gsFlIeCPb2Fu8dlVpGmjj4f6Jiha0fUYkKCk9rlUD08aNJi21pKWRZR6SRt3m42
         d9bw==
X-Gm-Message-State: AC+VfDwks/LyT/uqApKm6sUNZDLn8aCVR/j63LEmob5pLE6vJblV15km
        4foitb3o6BsmMLuaX5p7gpsVKA==
X-Google-Smtp-Source: ACHHUZ70BGA9Uob2tmq9vnnuOZF9GmElYbTbJOCcZ2XvSUohGie9tt0+BdXH0QSRUm7yrtoWpgHmbQ==
X-Received: by 2002:ac2:55a1:0:b0:4f2:4fd7:a11f with SMTP id y1-20020ac255a1000000b004f24fd7a11fmr3325386lfg.54.1684788762858;
        Mon, 22 May 2023 13:52:42 -0700 (PDT)
Received: from [192.168.1.101] (abyk97.neoplus.adsl.tpnet.pl. [83.9.30.97])
        by smtp.gmail.com with ESMTPSA id b25-20020ac247f9000000b004f3b319ed4bsm1103692lfp.120.2023.05.22.13.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 13:52:42 -0700 (PDT)
Message-ID: <ecf22436-44f3-8809-1232-e9ae30f3864b@linaro.org>
Date:   Mon, 22 May 2023 22:52:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/5] msm/drm/dsi: Round up DSC hdisplay calculation
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com>
 <20230405-add-dsc-support-v4-1-15daf84f8dcb@quicinc.com>
 <eo7chb7m4cowvb53hnebi3bjtotm7x5ea5iv6ulmmfkr2hdt32@2nkoa5rco3qb>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <eo7chb7m4cowvb53hnebi3bjtotm7x5ea5iv6ulmmfkr2hdt32@2nkoa5rco3qb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22.05.2023 22:44, Marijn Suijten wrote:
> On 2023-05-22 13:30:20, Jessica Zhang wrote:
>> Currently, when compression is enabled, hdisplay is reduced via integer
>> division. This causes issues for modes where the original hdisplay is
>> not a multiple of 3.
>>
>> To fix this, use DIV_ROUND_UP to divide hdisplay.
>>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> Nit: probably these should go in the opposite order.  And if they're
> all supposed to be chronological, I think it is:
> 
>     Suggested-by:
>     Fixes:
>     Signed-off-by:
>     Reviewed-by:
> 
> But unsure if that's a hard requirement, or even correct at all.
> 
> - Marijn
Or you can rely on b4 to pick that up if it comes from others

Konrad
> 
>> Fixes: 08802f515c3cf ("drm/msm/dsi: Add support for DSC configuration")
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 9223d7ec5a73..18d38b90eb28 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -952,7 +952,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>  		 * pulse width same
>>  		 */
>>  		h_total -= hdisplay;
>> -		hdisplay = msm_dsc_get_bytes_per_line(msm_host->dsc) / 3;
>> +		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
>>  		h_total += hdisplay;
>>  		ha_end = ha_start + hdisplay;
>>  	}
>>
>> -- 
>> 2.40.1
>>
