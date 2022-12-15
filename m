Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D53D64E2E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 22:16:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiLOVQQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 16:16:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiLOVP6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 16:15:58 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 806F57664
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 13:15:56 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id q6so394126lfm.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 13:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/VBZEpcKP4A7HRf3+eiikNb+ikQq8cYagAbglF7pGtE=;
        b=P38H68dMCVUdc3ewAEWsr8zjWbhPEYIxR7yFrbGbDZQm6004LSjxcFQdeN/dZX3DIS
         kMnSfOnFl4XvGBg4E3tfy17ToPCDMitPAEn1ADsEC+qHb2p/LBz/wPguQoWh89uLz6B9
         HEFmqlG8cSwXcMy0iDVHbDOoGwtTGdqX+x6w1/EDtqShWFvANKkGVZzkuTWehkm6DaU/
         IMVNZGrjQ67s3C1aRRO+LDnqt3X5zsiRB3oc+JgkUyWn7WUVGsHSe4+z74Xx3X5DPR5E
         x6+tiOBBlei4knI+F/sqkfYN4jmxWVH12F/NQw4W/zO2BCGlafcNY0qqqBAn5x0Xr+hU
         +Fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/VBZEpcKP4A7HRf3+eiikNb+ikQq8cYagAbglF7pGtE=;
        b=RWzk/WHRVdMZhgZl2SPiH2RltH2mROCmtE8cQTox+HKAc+5jhnk8gVb2zY99BeP9lr
         s3Ap+ejkp7FqTWfnxxqGlJeqNHcFCdIMMGwO7WJiX4F/H66qwL5mhYTguPX+DIR8Eby8
         9uFTVyi5u+p0NYVWjPLiOHjDidYLgixm2v+OgE5K4k/Y1kLG2mPu8z+XyBT1IrJQChCH
         SJt2G/x5YqeGNl/jAcP13qTcl0JSuSeSLEo8RejwQfhskSfTM8dpzLOiNCc3wXHpgwD2
         bVnkofqIk3F0J7Tj8rIoL4l2flL3asZvGWZvNjgngOGRM0eAQa5K6mMgHuubhheVbGyl
         XdCQ==
X-Gm-Message-State: ANoB5pnbj+c9gfOIpUsKBKFEofqsjhRVAAxwYJzJWa5oNu6PV/aZOX0S
        g1kS68uOZaVvmNKE1beY5G2skQ==
X-Google-Smtp-Source: AA0mqf6VRxIT+v0eIraHsZSXbpJ6PjfSHyVxnlA1KA3u+AWi3svMrNLtJCy9iEDo41e8MomJlcdpHA==
X-Received: by 2002:a05:6512:b10:b0:4a4:68b8:c2ad with SMTP id w16-20020a0565120b1000b004a468b8c2admr10335227lfu.4.1671138954856;
        Thu, 15 Dec 2022 13:15:54 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 12-20020ac25f4c000000b00485caa0f5dfsm16880lfz.44.2022.12.15.13.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 13:15:54 -0800 (PST)
Message-ID: <d41e29a9-5da6-3843-5018-9674e7d56505@linaro.org>
Date:   Thu, 15 Dec 2022 23:15:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] drm/msm/dp: do not complete dp_aux_cmd_fifo_tx() if
 irq is not for aux transfer
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@gmail.com, andersson@kernel.org, daniel@ffwll.ch,
        dianders@chromium.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1671129159-31105-1-git-send-email-quic_khsieh@quicinc.com>
 <ca15a54b-8040-5e4f-a78e-12b7f8a554e1@linaro.org>
 <CAE-0n53bREwEMV4aP=ySPuPP8mMbDr=Unbjw_bW0MNN7hTsWRw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n53bREwEMV4aP=ySPuPP8mMbDr=Unbjw_bW0MNN7hTsWRw@mail.gmail.com>
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

On 15/12/2022 22:10, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-12-15 10:46:42)
>> On 15/12/2022 20:32, Kuogee Hsieh wrote:
>>>        if (!aux->cmd_busy)
>>>                return;
>>>
>>>        if (aux->native)
>>> -             dp_aux_native_handler(aux, isr);
>>> +             ret = dp_aux_native_handler(aux, isr);
>>>        else
>>> -             dp_aux_i2c_handler(aux, isr);
>>> +             ret = dp_aux_i2c_handler(aux, isr);
>>>
>>> -     complete(&aux->comp);
>>> +     if (ret == IRQ_HANDLED)
>>> +             complete(&aux->comp);
>>
>> Can you just move the complete() into the individual handling functions?
>> Then you won't have to return the error code from dp_aux_*_handler() at
>> all. You can check `isr' in that function and call complete if there was
>> any error.
> 
> I'd prefer we apply my patch and pass the irqreturn_t variable to the
> caller of this function so spurious irqs are shutdown. Should I send it
> as a proper patch?

I'm for handling the spurious IRQs in a proper way. However I believe 
that it's not related to the issue Kuogee is trying to fix.

Thus I think we should have two separate patches: one fixing the EDID 
corruption issue (for which the proper fix is !isr check, IIUC) and the 
irqreturn_t. And for the irqreturn_t it might be beneficial to move 
complete() call to the dp_aux_foo_handler(). Or might be not. That would 
depend on the patch itself.


-- 
With best wishes
Dmitry

