Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A91B06C25F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 00:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjCTXp7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 19:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjCTXp6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 19:45:58 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 726852BF2D
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 16:45:12 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id a32so13871853ljr.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 16:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679355840;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pUisDYyem0moEyMsi7OmN9BV8ksdlhWL4im6qzykGqo=;
        b=ec3Vi+kBbqwkcsa5gMLWQ/YjN0/ALebMXzTen3r363FKQwExlHebnAU2RlgU6uf21e
         mMgaxGVhGvgN4dCk+e+Xm6CDk+rPc+fbld2bi3UOqfElEDGtojGm9j4EwoT0sO22kcgQ
         b57KUS/wLOw/WY4URwJAoRAhuBwWmOJgjm4JhcarEN+/tT5Rfbt9C5UpV8gcVAfuN/x7
         f36aJeSOVu53DivXyzLEp9bMoHEugaCHZHOqN6nnmX8D/SlFgE1xX76SLP6WGAcDw0c5
         aQ8S5bRLaonWSOziT9dEUCfy37+KBXFreJA673jtQ46jrGZJcSGXn47m8BRC3Ab9vqp5
         L/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679355840;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pUisDYyem0moEyMsi7OmN9BV8ksdlhWL4im6qzykGqo=;
        b=7N8wKlmc6kazjliMBUrdRVUnQ10jW77JMQi4GIscTB5Sa/24HcsTeYjvNh+kuxG8HC
         mpMEVMQiWuYd5cQ5VBK93p+sTn8gCIUas6qYPuJuvSi7irrLbW9xFzbL+epzvrPK3jdH
         xx9liQP2GVDWE6WpMTH8c2Pr3KybX+A7vV+yHfw/ORayGFrYbzCDJg29T5jom0zBLseU
         raUXcxfIjKCe09LGS35MAkVLhqdkt8FwX3KcD8pJACyuitpM1V7ZCQT0ee4U9bSqgjV6
         xCF+9NLxEtTGoo3LNzZlsIIUuwOF5H5cdtnUlP906A/i3WYayiPiD5oNaU/0iH6LdE0q
         TZuw==
X-Gm-Message-State: AO0yUKW/uxuxfSm4l+G7FxggYZguhlLEuVrT2WHTzWDBM3jNha98aiYz
        wLJqe6NJQEu2/Axo5Vd4BN5Ffp9IgI3QFirf32pjf26k
X-Google-Smtp-Source: AK7set/CUVG511vxdNGrjJFg92az0rxsvujqZY1Ww6UtM1d+6WsjMZwZsO0DznoMn77bTyFRzRqQqw==
X-Received: by 2002:a2e:3217:0:b0:299:8859:2433 with SMTP id y23-20020a2e3217000000b0029988592433mr234016ljy.38.1679355840183;
        Mon, 20 Mar 2023 16:44:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g5-20020a2e9385000000b002959d2cc975sm1970614ljh.37.2023.03.20.16.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 16:43:59 -0700 (PDT)
Message-ID: <f8562f64-b988-6f3a-b501-5d874912175e@linaro.org>
Date:   Tue, 21 Mar 2023 01:43:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/msm/dpu: Add support for AR30 format
Content-Language: en-GB
To:     Leonard Lausen <leonard@lausen.nl>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <ae78354e98b719c1fc9466d5965aea5a45ac29f6@lausen.nl>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ae78354e98b719c1fc9466d5965aea5a45ac29f6@lausen.nl>
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

On 18/03/2023 21:45, Leonard Lausen wrote:
> Commit da7716a249b699978fb5 ("drm/msm/dpu: Add support for XR30 format") enabled
> support for the 10-bit XR30 color format but missed AR30 color format.
> 
> This can trigger bugs in userspace. KDE KWin compositor for example always
> prefers 10-bit color formats, rendering a 1cm^2 black box around the cursor due
> to missing per-pixel alpha-blending if only XR30 but not AR30 support is
> declared.
> 
> Signed-off-by: Leonard Lausen <leonard@lausen.nl>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

