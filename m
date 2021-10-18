Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787E943251D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 19:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234148AbhJRRfx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 13:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234113AbhJRRfw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 13:35:52 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADB1C06161C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 10:33:41 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id e12so42801605wra.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 10:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rC/hLNrxKboWrLVaDMklS7HEEU6bUXhMqtNh39WY+UE=;
        b=ah07nRlqopbTXRyZyr14fX2esaI6ry80CfTbZPLGsNidfYq3PUrTRosgXKm/11VEqL
         Sd2wYy+zZpVerDvvz3ns2S7Y318B/E2p5paJ8rKguqMMq4ABPimTJs50hePALFHQ/zDH
         kuGsxV2aX2ayWX1J3mz1XYsEWLOIakXk0j69IsfhV9PDLr9JNFM3Kcbt7qHJBHOhCMCg
         rgH5A8hBqi0Tzz41jxRjIYc+CcEdnG9DQHFgwQDY6n12Bk7mJSLZoJV/TzEifl/nnc+w
         wqyfLz93DBjiq/88MkRYrsISeFQEWh7t1ZLu6KuuU0tQDXERBeBKuEeROeDvuCb3ZTGu
         Eo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rC/hLNrxKboWrLVaDMklS7HEEU6bUXhMqtNh39WY+UE=;
        b=acMJt7YggxWBTwguiMxHRNQwiJATzpljvTyDawwCT0BejitmTzv6JusxSjETeBOgqa
         0YtJ/WxRDEl2vEiJiOFgs3fZ7UzvvrTiung/w0yXWW8TlXdaQvFzCOkPGxY1cTyO1ygn
         Kz4Kw5Fzd4wvbTij++P8LbiNUxyoo5netoK+Ui0K2HMMEEpZOKVHUrEqcCGBdJWwhP3l
         UojFSRSbfzNrauJ3h3HJ3yVeD2F0+JX/+B/qiH+6zm2MAbZHLtxhEnYQU4Rfn3kZyH8n
         7HPWn/wdvH13FMp0e0ZwDPXdVkPgB4+3w8GgVNKRIA67U1pZUa8LxmLy+V+V/AgxeuaM
         q30A==
X-Gm-Message-State: AOAM532NObPEsgWfqULZiefFhTNTBNzlJ8JGwe1VXwZsDkfd1qG8Rglq
        eRr/LutwwZELPBJUxff2kR1LhA==
X-Google-Smtp-Source: ABdhPJzTofO8JworMFPCFBKd0dnbRO1NBjt4FTsjxc0YxtMZ2929zmD3/Ot6adQDm2boDaCVAp/n8g==
X-Received: by 2002:a5d:4002:: with SMTP id n2mr144182wrp.420.1634578419759;
        Mon, 18 Oct 2021 10:33:39 -0700 (PDT)
Received: from [192.168.0.30] (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id g25sm12989366wrc.88.2021.10.18.10.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 10:33:39 -0700 (PDT)
Message-ID: <5c460ee3-9079-02a7-e674-a4dde5815f0d@linaro.org>
Date:   Mon, 18 Oct 2021 18:33:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm/msm/devfreq: Restrict idle clamping to a618 for now
Content-Language: en-US
To:     John Stultz <john.stultz@linaro.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>
References: <20211018153627.2787882-1-robdclark@gmail.com>
 <CALAqxLU=O2yaJ=ZOtg0S-zX4KyirbXNx+0iF3EJ9d4=rVL6Z=Q@mail.gmail.com>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <CALAqxLU=O2yaJ=ZOtg0S-zX4KyirbXNx+0iF3EJ9d4=rVL6Z=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all,

On 18/10/2021 17:42, John Stultz wrote:
> On Mon, Oct 18, 2021 at 8:31 AM Rob Clark <robdclark@gmail.com> wrote:
>>
>> From: Rob Clark <robdclark@chromium.org>
>>
>> Until we better understand the stability issues caused by frequent
>> frequency changes, lets limit them to a618.
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>> Caleb/John, I think this should help as a workaround for the power
>> instability issues on a630.. could you give it a try?
> 
> While I hit it fairly often, I can't reliably reproduce the crash, but
> in limited testing this seems ok to me.
> I've not hit the crash so far, nor seen any other negative side
> effects over 5.14.
> 
> So for what that's worth:
> Tested-by: John Stultz <john.stultz@linaro.org>
> 
> Caleb has better luck tripping this issue right away, so they can
> hopefully provide a more assured response.
This prevents the crash on the OnePlus 6 as the frequency can no longer go to zero.

I would like to find a better solution that still allows proper idling on a630, but that can wait for 5.16.

Tested-by: Caleb Connolly <caleb.connolly@linaro.org>
> 
> thanks
> -john
> 

-- 
Kind Regards,
Caleb (they/them)
