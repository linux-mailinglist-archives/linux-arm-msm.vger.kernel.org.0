Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E85C9661B1C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 00:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbjAHXaf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 18:30:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbjAHXad (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 18:30:33 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA2C710068
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 15:30:32 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id bn6so7234514ljb.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 15:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7NRJDQS9hYJhfGlOkY4aoqvH4nJB/PpvKVQ5IUWg7+4=;
        b=p5b4WpNoKev9E16UV+GiWdaSYbO8tbyJ/8N7Cy43hQrrexwh6U7XS71RgBD7GE8HPh
         fZSyWPDgDdkQUUdux6Rh6Mgc/uN70VHAIIEMIzC/jmhrt3uC5HSygINRt+2mRs4fLPAE
         eqETZ8XJxGVfJO9p4NrVSoJdE0ZjewPuB/Px89j4/63KatwVhCTuqGIOYSk7G3fYRNle
         QJ86vKaLci6W1HVGRCJdJVTJVIFfCl4fAw5fiPfl+iwDqqPaYcZYBu50vb3HMsUwQv21
         F+k9Z2SnQTR2tSBO2boW1ynHHU85qjejoiyvQdM19xXD/M1pNL4VoahT47dYp9esm2de
         ih2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7NRJDQS9hYJhfGlOkY4aoqvH4nJB/PpvKVQ5IUWg7+4=;
        b=sJek+GxGuYC9IxPjqBSrrPSecXWkoLw4kZzO0Xt59cSm3dM4KQ0h6/pGER4uySzypq
         5LGvs4XNQELVuVPpw8ViSg0QKjQvrAt6c0XjWfijkIjTqYF7gY/s1wts+wG4d6ipYbSw
         /nkGqUlXuNeQLMEyN01YNB2W44P91SSyaeyKTbePQe5+B8vPRVxCqMMM9VmjEBp3nyYP
         UY+qpKZYetrEMgVrMEm5lzkj+1LGAG0nQ7ft5TcAAqy5u4vhDcLWrfWpimYAaVohpYH1
         RZCKT5NlIIvOKWxbbse+HHF30cEWSSExdttLE+BBuRfifD+f1mJbR5bHM/T7qqVCGAt3
         /Snw==
X-Gm-Message-State: AFqh2kpqANwo/sKNiuyuoCbyRyyM1+0KmsOttt35Yb4KOFp8ge77G0wl
        clk7SAu4Aw6dlY53EYv81OetfJjI1GuHOHGH
X-Google-Smtp-Source: AMrXdXv40yEXT5y2fHAlB9JzaB0RVspyfJk0Lc8NDB1vIygMkYVc3lsz6gpYurd+y98MNDZBWd44cQ==
X-Received: by 2002:a2e:3002:0:b0:27f:bd24:2be7 with SMTP id w2-20020a2e3002000000b0027fbd242be7mr12652593ljw.32.1673220631105;
        Sun, 08 Jan 2023 15:30:31 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y24-20020a05651c021800b0027fe3bc3c24sm701941ljn.39.2023.01.08.15.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 15:30:30 -0800 (PST)
Message-ID: <1b872a47-6ffc-1fe9-f283-897dbc37d709@linaro.org>
Date:   Mon, 9 Jan 2023 01:30:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 4/8] drm/msm/dpu: Disallow unallocated resources to be
 returned
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jani Nikula <jani.nikula@intel.com>,
        sunliming <sunliming@kylinos.cn>,
        Sam Ravnborg <sam@ravnborg.org>,
        Haowen Bai <baihaowen@meizu.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Drew Davenport <ddavenport@chromium.org>
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-5-marijn.suijten@somainline.org>
 <b415a91d-f804-1fec-52dd-4124d3f1e583@linaro.org>
In-Reply-To: <b415a91d-f804-1fec-52dd-4124d3f1e583@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/01/2023 01:28, Dmitry Baryshkov wrote:
> On 22/12/2022 01:19, Marijn Suijten wrote:
>> In the event that the topology requests resources that have not been
>> created by the system (because they are typically not represented in
>> dpu_mdss_cfg ^1), the resource(s) in global_state (in this case DSC
>> blocks) remain NULL but will still be returned out of
>> dpu_rm_get_assigned_resources, where the caller expects to get an array
>> containing num_blks valid pointers (but instead gets these NULLs).
>>
>> To prevent this from happening, where null-pointer dereferences
>> typically result in a hard-to-debug platform lockup, num_blks shouldn't
>> increase past NULL blocks and will print an error and break instead.
>> After all, max_blks represents the static size of the maximum number of
>> blocks whereas the actual amount varies per platform.
>>
>> ^1: which can happen after a git rebase ended up moving additions to
>> _dpu_cfg to a different struct which has the same patch context.
>>
>> Fixes: bb00a452d6f7 ("drm/msm/dpu: Refactor resource manager")
>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++++
>>   1 file changed, 5 insertions(+)
> 
> I think the patch is not fully correct. Please check resource 
> availability during allocation. I wouldn't expect an error from 
> get_assigned_resources because of resource exhaustion.
> 

Another option, since allocation functions (except DSC) already have 
these safety checks: check error message to mention internal 
inconstency: allocated resource doesn't exist.

-- 
With best wishes
Dmitry

