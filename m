Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40D586D37AE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 13:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbjDBLfE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Apr 2023 07:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjDBLfD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Apr 2023 07:35:03 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C29E19A
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Apr 2023 04:35:01 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id q16so34519792lfe.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Apr 2023 04:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680435300;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2nCMWdel6dHdzVC0ymLbPnP9dfCzAbiSb5UP+e8Vgh0=;
        b=KNVWFW6FF9gShYXpQA8BwvaGJFhl9brMLEQWZy89nhSM+tbWb6OCDwv/cjKa64hp5l
         3U6mdnP8JE79mOonTJzYs4xPDBye98eOUhJbuNTnIvqv407g/8K59RCEoiVol4LWUSz1
         zUd1wlsMXv3LQxR/brKyS4VTZDd6iJ363/VnE2+koi75GSpBg64KlXNBhDsPLeyB+MVt
         Q9XSGl7IxU4FTFR4W2fx+HydQT2roMP603HFGHBtQT9B5w3rXOTZxrARGS/UjDBL0Ul7
         EXqReK/UN/3ichymIqua4ZgJBpDUCR8uwsMpJVkRwOUO1Mqllzn4De7yM2hYPnTeuW9s
         Evxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680435300;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2nCMWdel6dHdzVC0ymLbPnP9dfCzAbiSb5UP+e8Vgh0=;
        b=doVW8/f8TwEly18biH2R4Wi5DfCVotAegn+e1evACUN6y5zchb6pjb1vCgraMyRu2s
         TTXn1N+BoLbkrDwI1tDZ04xTTvbwJRPoQ2wt57ry1Rw1Kz2hAX+EV+aLOl8Sgjm+G0m+
         BRDFtToVQXnwXbflm43m4sBQKU8nqGneQfoRLHQKvGDH7fXgo0tuws97p6bvY9/yU406
         3J9teVwEOiu7gv8DoYqhxJSN/mJTkBVfSWWP6+yb824JOopSt87CV9u3T31u7JH1Q6zP
         sqHkirytnYwyhwu9WKA3uyn9CBbWTTGs5LuuVMWZ+m0QdiPW1rYmob4dQLIajR/U7gsW
         x1pw==
X-Gm-Message-State: AAQBX9fzxzcM3gn7cQhSgY3OdV3FkBMLXTrH9j2XACH1lRmtbTVxlpiL
        3xdI+H79ljAr9/LHmWbTyXAr/A==
X-Google-Smtp-Source: AKy350Y8+NwNkDDb/SsEp913su/cFIU8CI5VBxWmQZnY+aY6IEIZtE6uDT6bZRXeJ5bH7Mow34xiFw==
X-Received: by 2002:ac2:519c:0:b0:4ea:f6d7:2293 with SMTP id u28-20020ac2519c000000b004eaf6d72293mr10318888lfi.55.1680435300225;
        Sun, 02 Apr 2023 04:35:00 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o11-20020ac2494b000000b004b6efcb7bb5sm1244356lfi.169.2023.04.02.04.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 04:34:59 -0700 (PDT)
Message-ID: <5bb1afde-c6f8-d635-8b24-b0b574901698@linaro.org>
Date:   Sun, 2 Apr 2023 14:34:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC v2 6/6] drm/msm/dsi: Fix calculations for eol_byte_num
 and pkt_per_line
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v2-6-3c13ced536b2@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v2-6-3c13ced536b2@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/03/2023 21:49, Jessica Zhang wrote:
> Use the correct calculations for eol_byte_num and pkt_per_line.

Nit: this line duplicates commit subject and thus is mostly useless.

> 
> Currently, pkt_per_line is calculated by dividing slice_per_intf by
> slice_count. This is incorrect, as slice_per_intf should be divided by
> slice_per_pkt, which is not always equivalent to slice_count as it is
> possible for there to be multiple soft slices per interface even though
> a panel only specifies one slice per packet.
> 
> For eol_byte_num, the current calculation describes the size of the
> trailing bytes in the line. Change the calculation so that it describes
> the number of padding bytes instead.
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

