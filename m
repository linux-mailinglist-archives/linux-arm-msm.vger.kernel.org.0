Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5C54671007
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 02:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjARBa1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 20:30:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjARBaZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 20:30:25 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E283E092
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 17:30:23 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id hw16so67840591ejc.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 17:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZsCFqOrG564I8qOCCNQEkJcGVuvtlZxy5WMlNbN2xTQ=;
        b=J/iw0UUSt0Hxy+ZF7az331KZS8tNT51v8K0+HIEnf/j3/rgclEK3DeD5k631Ylnnh6
         IImUR2u+k689o7Vk1hKFLO6XUSmkaUJN917cvkwHXG+2h37tPUY9rZImOwfW6KFELLse
         pWQzIYSB5rCpLuwKIib3hGv6AtMXQfF8I97TlpgiHuZF9VNrCX5PVFH38j3LR5lHnSqT
         zVSEBikljdLZE0m7JTpJKuUkqohd4TzbaRPPBrRbFsXb2SFrfI9LzBNLG5Qyi14YnElU
         6iSkaVLDlviYqgys3zpTruqYl+snh9F3Ak/aBCCvS9qaFMyJHAb3dSq+NJx+kZAeR6G5
         hxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsCFqOrG564I8qOCCNQEkJcGVuvtlZxy5WMlNbN2xTQ=;
        b=zyfCUlMn3akj4VtCG/S4sTCEgyy2s8bsRUt9Xrp/5rW2ZaTlZYt3CoVWDmqet5arH/
         DcLJdNJmFCNNj2c3RFktjJYZ1TihMwT0Y2xh2hfImwrgeeOfFaqk7hy5q5BCU6CiXL2y
         LClSjsEgdajVp3Gupclna3HvguQucXtEfhl1/5on+dSz1D2BEcnzv4J0E/l958LkARXq
         l0CVJc2jichzWHKVU7sscHkhWUJVRMeK4UYPGHQf+Sv2VXPae/dPiHgEH1AbWQHozBLD
         ORuYFaCeCavtk7oVrcmcz0aJcfwQEHb5NZkgy7BIrsGD+az2bGaqzuuR1fWEbH6SxeV/
         3wNg==
X-Gm-Message-State: AFqh2kq8jCSd+BKUIV725X40Q3nI+NgmGs77KcEobi/098igS6pQCB7a
        Ca2JXMvbIldMdEeuMgH9k/vgeQ==
X-Google-Smtp-Source: AMrXdXuNF0GjFG6ixd7G1diTN5Er9+WUrN8dZPYP7bvFYKP5CRCYSqQLOMmPTPLMSoGQT2lpuFXusg==
X-Received: by 2002:a17:906:fb16:b0:7c1:6d65:4718 with SMTP id lz22-20020a170906fb1600b007c16d654718mr5177733ejb.33.1674005422383;
        Tue, 17 Jan 2023 17:30:22 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id ky25-20020a170907779900b00877596d4eadsm110552ejc.101.2023.01.17.17.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 17:30:22 -0800 (PST)
Message-ID: <82ef3c2a-ef54-8c39-2266-7e3b203f92d1@linaro.org>
Date:   Wed, 18 Jan 2023 03:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3] drm/msm/dpu: Disallow unallocated resources to be
 returned
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Drew Davenport <ddavenport@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230109231556.344977-1-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230109231556.344977-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/01/2023 01:15, Marijn Suijten wrote:
> In the event that the topology requests resources that have not been
> created by the system (because they are typically not represented in
> dpu_mdss_cfg ^1), the resource(s) in global_state (in this case DSC
> blocks, until their allocation/assignment is being sanity-checked in
> "drm/msm/dpu: Reject topologies for which no DSC blocks are available")
> remain NULL but will still be returned out of
> dpu_rm_get_assigned_resources, where the caller expects to get an array
> containing num_blks valid pointers (but instead gets these NULLs).
> 
> To prevent this from happening, where null-pointer dereferences
> typically result in a hard-to-debug platform lockup, num_blks shouldn't
> increase past NULL blocks and will print an error and break instead.
> After all, max_blks represents the static size of the maximum number of
> blocks whereas the actual amount varies per platform.
> 
> ^1: which can happen after a git rebase ended up moving additions to
> _dpu_cfg to a different struct which has the same patch context.
> 
> Fixes: bb00a452d6f7 ("drm/msm/dpu: Refactor resource manager")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
> 
> Changes since v2:
> - Dropped all 7 other patches that were queued for -next;
> - Reworded error message to clarify that the requested resource should
>    have already been allocated, rather than sounding like
>    dpu_rm_get_assigned_resources is (re)allocating/(re)assigning
>    resources here;
> - This patch is now (implicitly!) based after "drm/msm/dpu: Reject
>    topologies for which no DSC blocks are available", which should make
>    it impossible to reach this condition, making it more of a safeguard
>    in case of future code changes and/or hidden issues: and is more
>    clearly conveyed in the patch message as well.
> 
> v2: https://lore.kernel.org/linux-arm-msm/20221221231943.1961117-5-marijn.suijten@somainline.org/
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

