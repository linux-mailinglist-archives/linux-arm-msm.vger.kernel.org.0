Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2E0516D9F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 11:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384381AbiEBJpr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 05:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384425AbiEBJpf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 05:45:35 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49614991B
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 02:41:40 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bu29so24396892lfb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 02:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pH7dgy/PEte/5shbJVNiqZ4lGZ8Ek1KPU5FhzTtm05M=;
        b=FgYWzV+f6lqMxBGLElhkUf6UDcC4zTrKW9Dbk9P3yR+l9+cxi8jHMQ1FPfR7k9e4/M
         6tK3IuiiaFczssalFhCl3WuCRl3Cm1aemU8SPEswst6mgN1+nhc9RiCiC3TMAUbSnqur
         2b8mMuQ9JZwnx+hWimuT/SoJgUtaHjSAKFS7cJpsBxNELk96nS+N6vv9kP0FpNC+Z3hO
         Lb4yZjTdvG8qpWT9uTbZDi4RNUvJ0xnoGYTTcrgnLWl2xRaaIpnoNNn3n7NlPxDpjZ81
         tB0jR59Uxs30Ro8HZsDxmftPe2CR1VCQdY4BFNuWROGpAudrounAFf9wFLh+lzkimvZG
         uacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pH7dgy/PEte/5shbJVNiqZ4lGZ8Ek1KPU5FhzTtm05M=;
        b=plmgv2Y6Xz5yL2+ylYHR5liZFITIsIGwhGfsiZaUrlaXfDt2xCP3Ngopz05gmDGPo2
         oiafU6cJ6LxSrI6AOd8WUR7ZIApMEsctUe4Rc8VXqQs7FgzfXqCImY6my9GA24ZagmQz
         CeC2Veh69WQNWkExRNf7nqwIoA5blNz1KtluDDtPBsda3tM7N7W49Qzi+OV3KWBEJ/rT
         c2kiwBeozAN9PAfGS4JOQQXj+Mhl10xqAqcIB8nT1/0i01TzKdAFE27AfgpyZJrV1dKk
         48DztXquahpOR7mzfwsqRBPwjEPUcFbHv2db+CG3g8gtPS4bXCd4TyIfikMWgu2rPk2+
         DYig==
X-Gm-Message-State: AOAM532Fk6n6U+xCtNDve9nPjAWipiHVeOOEvXmw0CASLE10GgMezsL5
        QBqh16nhgbp9c7p5G/Xapya5BQ==
X-Google-Smtp-Source: ABdhPJycVfJZ0kF39HMlkwwDay9O3WyG+V87+W5YC4UZGBI1yEZn7Qtdm6pfNPt3Wm3SUOuP5AP1yg==
X-Received: by 2002:a05:6512:2251:b0:472:645:2fa5 with SMTP id i17-20020a056512225100b0047206452fa5mr8370854lfu.605.1651484499022;
        Mon, 02 May 2022 02:41:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t25-20020ac243b9000000b0047255d210fasm658571lfl.41.2022.05.02.02.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 02:41:38 -0700 (PDT)
Message-ID: <95ed686e-e80d-6571-050a-afdb7d22ce2d@linaro.org>
Date:   Mon, 2 May 2022 12:41:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
 <02114b24-f954-f145-4918-01cc3def65ac@linaro.org>
 <20220501204102.3xijmadbcrxwyu3x@SoMainline.org>
 <4e308633-cb0d-7050-9ee0-421190683eac@linaro.org>
 <20220502084322.nvj7rnhnemewmil6@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220502084322.nvj7rnhnemewmil6@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/05/2022 11:43, Marijn Suijten wrote:
> On 2022-05-02 01:44:20, Dmitry Baryshkov wrote:
>> [sni[
>>> In any case, given that you've already sent this patch and another three
>>> patches [2] fixing/cleaning up the series tells me it's far from ready.
>>> Most of this should just be handled - or have been handled - in review
>>> and amended?
>>
>> During the review time we agreed that [2] would come as a separate
>> change It is an API change that would make using panel-bridge easier,
>> but isn't otherwise required.
>>
>> I have been working towards more logical drm_bridge/drm_bridge_connector
>> chains employing panel-bridge and display-connector where required, [2]
>> is a part of that effort (as well as few other patches that hit
>> dri-devel in the last few days).
> 
> I understand what is going on now.  Since the DSC patches have already
> been queued up in the 5.19 pull I won't hurry to review them; rather
> will go over them when time allows me to play with the many phones here
> that require DSC for the screen to work.  I've been told the series
> didn't result in positive screen output way back in its infancy, but
> I'll re-evaluate and send fixes or improvements if/when necessary.

Sure, thank you!

They work on Pixel3 (sdm845, non-active CTLs, no ping-pong binding to 
intf). I still didn't have time to test them on P4 (sm8150, active CTLs, 
PPs bound to the intf in runtime).

-- 
With best wishes
Dmitry
