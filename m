Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6C76D4BDD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 17:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232787AbjDCP27 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 11:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232769AbjDCP26 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 11:28:58 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47AFD1BE1
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 08:28:56 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id h11so31612677lfu.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 08:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680535734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kPrYDdekg0I0RRl5/w+irR1rQMqphVIrp6PinKuObBw=;
        b=hmqvElmrXWJQcUaSjMqNlMYt7VMO5e+YWgeZceMhEr3KKNjrq5vpft3N1tQrJwj8i4
         spJfLHjKk/NeKfJ1DNkS3z4DysUz8zSMacTKa8dxfJuYReoOfj4964HdGF3YD3TypsvH
         kuc6ozrwD7DsG9hMFup6LsPS7DYSGjBjh0KPaXb/MBflDirA7jBV+6La+sxympQFOhJB
         +i7T9WKkMTujomHn2C/+firfbVi0mx9ZRMiTVWRsg9L+6Dkin3IpkVWfpCKix6Xk6p2j
         94B9k2XKDYhrXH0W3gth/aac1tOFI6rwL6UfsPAphUxScAuonKUd1k51P1YEco5Oa34p
         nPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680535734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kPrYDdekg0I0RRl5/w+irR1rQMqphVIrp6PinKuObBw=;
        b=gMxwAvkz5cJ8WHNtU7CemEwPt47g9YsVkVQczjOi5nOZ01OWpJvtP3qMjKYSHmdMrN
         3WhIqiKxvx5lZbLWZ82/5F3VUwamx6J0PKDzju3uznq+5LC07t1Fyca9FmnPWalJz074
         4U1ncJna1lT2djV+LFBz6w3LBJqd44BAZVgqAvyFQyaGlLghTd0Dvd7wtzveBzMRBfnW
         AKlv2P8q+U7mp7HUHgzijNgIWiTRMdTT96NuV09PuTuwDoxO8XLdQ+MHqtQaZtEs1isV
         GQ2eX2+8jodhM2uKfBaiA5IICODYR2gFCpcmftPs7PBRK+HQtcGA7kCSPMJB6K6cy2lo
         ShJQ==
X-Gm-Message-State: AAQBX9f30YqXy8IfFFP5jBf4AN1NzAQeEUCGWFbFflEksMeX62iui2zJ
        dTlIYseaOTjfnH8NbqX1CZu/Pw==
X-Google-Smtp-Source: AKy350b95P/uSTgREdLEfWsH6IoiTIqaKI1+nr+mYyy4HAI6QLDWwdnTFFIlZWhlWMb7ONSwCX7yew==
X-Received: by 2002:a05:6512:3c2:b0:4dd:98c6:ee2 with SMTP id w2-20020a05651203c200b004dd98c60ee2mr9940947lfp.15.1680535734467;
        Mon, 03 Apr 2023 08:28:54 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w6-20020ac24426000000b004cb14fa604csm1815299lfl.262.2023.04.03.08.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 08:28:54 -0700 (PDT)
Message-ID: <0e75e04d-fc07-2f60-bfb9-ee092075fae6@linaro.org>
Date:   Mon, 3 Apr 2023 18:28:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 3/3] msm: skip the atomic commit of self refresh while
 PSR running
Content-Language: en-GB
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com, quic_khsieh@quicinc.com,
        quic_vproddut@quicinc.com, quic_bjorande@quicinc.com,
        quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
 <1680271114-1534-4-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1680271114-1534-4-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/03/2023 16:58, Vinod Polimera wrote:
> In certain CPU stress conditions, there can be a delay in scheduling commit
> work and it was observed that PSR commit from a different work queue was
> scheduled. Avoid these commits as display is already in PSR mode.
> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>   drivers/gpu/drm/msm/msm_atomic.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 645fe53..f8141bb 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -192,6 +192,9 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)

The corresponding patch is not yet applied. I wonder how this was tested.

>   			new_crtc_state->mode_changed = true;
>   			state->allow_modeset = true;
>   		}
> +
> +		if (old_crtc_state->self_refresh_active && new_crtc_state->self_refresh_active)
> +			return -EINVAL;
>   	}
>   
>   	return drm_atomic_helper_check(dev, state);

-- 
With best wishes
Dmitry

