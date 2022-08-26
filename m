Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6235A23F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 11:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245186AbiHZJQ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 05:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245171AbiHZJQo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 05:16:44 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F1ED598F
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:16:43 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id n15so1227949lfe.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=suMGHlcb9CDltfwUuhoLcsGy+PCUjqFE0jM5VZF9z9U=;
        b=pnA3lVKlSjuoPG8I6Bp2PcbDeGJCNBhDh08RgVZWYtoVfyBf/aqnH4naFpbZCAbZKk
         cSk8mnA2eIpPonj1SZGg0ddXL0zxBfhrj46WoVqMZP+Ge3KiZyl7l4bO5QLEgu8OBGAn
         AVMh++asadyq8f5kz/LjLkqdVL8ETFUTA01avkC5klqvh1f7oe2gW+WSKMelCMQtchsF
         G1TeATTkg9l+thvYiuhXXCS6FDnRmdcKTfTmemkC2xzKjyT3TF0Ym5igOqqFkZwVnNXc
         iPdf6lQlZFjQ5n32gnSTlrA3Kbw0+H3Ytt3GBZslurTvz/MlRlrfokqreExq+89sX+ve
         ebzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=suMGHlcb9CDltfwUuhoLcsGy+PCUjqFE0jM5VZF9z9U=;
        b=NNrnQebcWdIaVLchUFmT9V6Ct9bz+8gyvAdbMIhwks4H0I4WaCvZ/UAdEAw33SYHgj
         jk1IiUEtwBe7JOAvA/yaCOy8fn+9KainuJD4OSh6vckLhR2TO6Jn/6XtniaCCyMsGtx+
         M4oTCChhZFPNxA6ioZXOwFZh/7Y1BQaHePEe0Frh6Gd9qT/wNvWlo4Q3BTP02v3jMxwn
         l76NOCjPDIms+7g/VIzwzmOqkFYvX3DxVQvb1iBONzN+XAzvgZyLpVKkhGxxgCrrHvGU
         XDqM7cYwcKZEHJYY7gMM18YIO+gEq1Esi8V3qvqu1O9BD79EUAXthM1yR7yowenWYc54
         Xubg==
X-Gm-Message-State: ACgBeo33sst7Ouq5tqaRXGbBA6V0mHK673OfSsUg/TttNAT3NW4KV1+3
        lH4smX/oc8gi/IT/VtxFQC1g6g==
X-Google-Smtp-Source: AA6agR4ScBO2G7DgjeNtg/ASP28MJCEV3REP70Q0sYm5VuGveqGx8COPQNa3Bwc7r/Vfd26k6EWFGw==
X-Received: by 2002:a05:6512:68b:b0:492:d05c:4d2e with SMTP id t11-20020a056512068b00b00492d05c4d2emr2159341lfe.413.1661505401691;
        Fri, 26 Aug 2022 02:16:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g9-20020ac24d89000000b00492cd4bd376sm309620lfe.239.2022.08.26.02.16.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 02:16:41 -0700 (PDT)
Message-ID: <9e040bdb-4fc5-3c95-fcea-b6ac7fd8224b@linaro.org>
Date:   Fri, 26 Aug 2022 12:16:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [RFC PATCH] drm/msm: lookup the ICC paths in both mdp5/dpu and
 mdss devices
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Yassine Oudjana <y.oudjana@protonmail.com>
References: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
 <20220805122406.x7xxywofeaquhfxg@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220805122406.x7xxywofeaquhfxg@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/08/2022 15:24, Marijn Suijten wrote:
> On 2022-08-05 14:56:30, Dmitry Baryshkov wrote:
>> The commit 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master
>> components") changed the MDP5 driver to look for the interconnect paths
>> in the MDSS device rather than in the MDP5 device itself. This was left
>> unnoticed since on my testing devices the interconnects probably didn't
>> reach the sync state.
>>
>> Rather than just using the MDP5 device for ICC path lookups for the MDP5
>> devices, introduce an additional helper to check both MDP5/DPU and MDSS
>> nodes. This will be helpful for the MDP5->DPU conversion, since the
>> driver will have to check both nodes.
>>
>> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
>> Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Reported-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org> # On sdm630
> 
> But I'm not sure about giving my Reviewed-by to this, as I'd rather
> *correct* the DT bindings for sdm630 and msm8996 to provide
> interconnects in the MDSS node unless there are strong reasons not to
> (and I don't consider "backwards compatibility" to be one, this binding
> "never even existed" if mdp5.txt is to be believed).

As a kind of a joke, I'd prefer to have interconnects in the mdp/dpu 
device node. In the end, the interconnects describe the path between the 
display controller and the DDR, not the path between the whole MDSS and DDR.

So, for next chipsets I'd vote to move icc to dpu/mdp node (and maybe 
even move existing inerconnects to the dpu node).

-- 
With best wishes
Dmitry

