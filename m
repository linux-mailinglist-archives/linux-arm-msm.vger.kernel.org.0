Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8688C543E02
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 22:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234330AbiFHU5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 16:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234323AbiFHU5e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 16:57:34 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9487721489D
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 13:57:33 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-e93bbb54f9so28728454fac.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 13:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=/K2iqivXQf9yE5saL0neALjx6ioa+JU7B+6RLTjt2Lk=;
        b=HbZeFoAypR4kLl5P2IhNK1+vyg3fWue+ScLLVz4SVhWGHTw4eA6eDB/JVLWJdtN0F6
         Y0pT5gaclN3YpQrJRN3tXejWnJrVnOKzfu74LcRrILBxAjnwamiLZPMQoGMG6DpVfZoc
         /gWXuMoK82UpAB//e1hMII0FZqkU9yd+u37tU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=/K2iqivXQf9yE5saL0neALjx6ioa+JU7B+6RLTjt2Lk=;
        b=psoS7raTztK/QvfRQ8fx7L/Jx+nD5Gz5NfrNvi4wVCDVEMw9Z93qKDwyHHMKdMJYZ0
         Twua+CHGlTB7jW8KYJNAcv576jezzX66bfQqFdfa39SQfn9gakgBYPKcBTFygxjYAdjR
         uJgamMF1hO8MDpDWzerLHBsb0SmxvhPF6BWhvjHjCLEvrsMDojrzOlaap7ROGjknY5AK
         D8n6kccBxAxAxKtKPCG4wRVVDUYoJiPsMwkIx9IqOBDPm1xE6aaAjk2BlkUFmTAcp/XV
         T7u/IFyPhosKGlApYwXti5wngtw4PiT863PUfMh5n69am8drubY0ETgw0z++R3DD9fyn
         g82Q==
X-Gm-Message-State: AOAM5302ZgBMFtsvAQOTvj4YNqhGEXQxDzGhqSpId3ZZSRKXPNxS5ce0
        GAQmpNZbHmMRuwPFDXYIVW6A//3X0m/E+P29wIxlSw==
X-Google-Smtp-Source: ABdhPJy8aPYqwWHnnjU3tUjw8mNOYISWxggIFluFTX6jVgidDeBAC45mzAKJs28IMnTzw9zMAzZyCdfg02u9rO1qNlM=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1752412oap.63.1654721852894; Wed, 08 Jun
 2022 13:57:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 13:57:32 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-6-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org> <20220608120723.2987843-6-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 8 Jun 2022 13:57:32 -0700
Message-ID: <CAE-0n52XgKVdzokmNBOM_ONAwyVQpu-UQxDgwzXXVMuK+5CJRQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] drm/msm/hdmi: drop the hdmi-mux support
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-08 05:07:16)
> With the last (and only) in-kernel user of hdmi-mux regulator, drop it
> from the HDMI driver.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
