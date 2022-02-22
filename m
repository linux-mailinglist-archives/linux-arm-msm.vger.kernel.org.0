Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE9984C03B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 22:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235756AbiBVVXd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 16:23:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235754AbiBVVXc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 16:23:32 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23279C683D
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 13:23:06 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id u20so27391267lff.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 13:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jtBVx2Q/oC2O51WQvIZoigpKLKNp7EeBw9E1UoJ7r14=;
        b=mAa8bFMjWfWT9TC79LezRPpW/O5teRZRBGOhGeyZlyPSn1RHq2IC87Lql6EkKB7Q9m
         mWTGKLknMy42DlWk53dfq8vebjptcTZh6UxaO0cddBDBmquX3n9al0Dqy9jX0rj7IZ02
         1VZKBc9lz4Sk37aQVP8iDCiQOm/V2CeoounJUpha1YMvihrLHinMviFRB7MLSZyWzBoj
         VIpbYCKPeZGB9rygAk59ibEocVP51rrPpEeTfuMsqlHME1qioGGOfoITrhi9YsPi/Ylt
         KFL/EJ8TWFhqkvM2YB8Qszca7EvBlru9P36GBNQ3E39PGwe9YvcU2QIurKKcVl1MHHNW
         l4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jtBVx2Q/oC2O51WQvIZoigpKLKNp7EeBw9E1UoJ7r14=;
        b=NVKtIPl4+sUBiJukEauhw5XQpEnm3meTN6x/xTv787pvj9i5ncINm7WO6mAZJt5iri
         YqhuQIpWTTbrRYgler69gx+zjDgCri4zIyqFgfrTKW9CWpM5zWDpvt2NyNu6Bg7hrsU+
         AvRL1ZCTh+MS9ZjrmXbW8YZHy1xMLGPEL4RiAyXuv8StE2npq8euKMxYaJTumhEEzVNx
         BKl0O9UhaTebe7E+uj3Rovw0ek88zQLEurPMlWmfhK2tRyq4mhuR5wKau4fkeYY4yIjp
         pGb034puORPhz49yoDaWdS/m0qTM2fUh9UDcmaDoUbO+zMuE3xCebCCn15aibzAyZKYo
         5kdg==
X-Gm-Message-State: AOAM533O6q9mjDF7Q0o4dbpag9OCdKmoR0OXAxiZjFD7lIrjO6LvP51o
        rVoQYk7Mf5bEimvalTnwVMlrAg==
X-Google-Smtp-Source: ABdhPJzpuqxZyPb0Aal7oIwfG1XVN3zZsfnOTv+F0lFTZPwG9KQdFdeL5m54z3cXCPgTPAfvJx5dzw==
X-Received: by 2002:ac2:51d0:0:b0:43a:df78:18c with SMTP id u16-20020ac251d0000000b0043adf78018cmr18410052lfm.168.1645564984361;
        Tue, 22 Feb 2022 13:23:04 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k14sm1847626ljh.82.2022.02.22.13.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 13:23:03 -0800 (PST)
Message-ID: <c388d91c-ea00-8fa8-3fcf-4ce754edb1b4@linaro.org>
Date:   Wed, 23 Feb 2022 00:23:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 1/4] drm/msm/dp: Add basic PSR support for eDP
Content-Language: en-GB
To:     Doug Anderson <dianders@chromium.org>
Cc:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, quic_kalyant@quicinc.com,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        quic_vproddut@quicinc.com
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645455086-9359-2-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJppRUZ5OHSMS1NdFXDDvRXJFNsdoJDWgU7ZPUoAW9OD+eQ@mail.gmail.com>
 <CAD=FV=W2wi47egKmWDS+BZGSy85K+A8jX0gvi6CYhmFgoBBRmw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAD=FV=W2wi47egKmWDS+BZGSy85K+A8jX0gvi6CYhmFgoBBRmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/02/2022 22:25, Doug Anderson wrote:
> Hi,
> 
> On Mon, Feb 21, 2022 at 7:12 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>>> +static int dp_link_psr_status(struct dp_link_private *link)
>>> +{
>>> +       u8 status[2];
>>> +
>>> +       drm_dp_dpcd_read(link->aux, DP_PSR_ERROR_STATUS, status, 2);
>>> +
>>> +       if (status[0] & DP_PSR_LINK_CRC_ERROR)
>>> +               DRM_ERROR("PSR LINK CRC ERROR\n");
>>> +       else if (status[0] & DP_PSR_RFB_STORAGE_ERROR)
>>> +               DRM_ERROR("PSR RFB STORAGE ERROR\n");
>>> +       else if (status[0] & DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR)
>>> +               DRM_ERROR("PSR VSC SDP UNCORRECTABLE ERROR\n");
>>> +       else if (status[1] & DP_PSR_CAPS_CHANGE)
>>> +               DRM_INFO("PSR Capability Change\n");
>>
>> DRM_DEBUG_DP
> 
> Not sure I'll have time to go back and review the series, but one
> thing that caught my eye as this flashed through my inbox is that I
> think all of these "shouting" are deprecated. It's even officially
> documented now as of commit d2f0a8afc1be ("UPSTREAM: drm/print: Add
> deprecation notes to DRM_...() functions").

Agreed. But not the DRM_INFO too.


-- 
With best wishes
Dmitry
