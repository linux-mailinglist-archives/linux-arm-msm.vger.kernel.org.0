Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 377324C99D2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 01:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237510AbiCBAZf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 19:25:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232559AbiCBAZf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 19:25:35 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A5F8CD8B
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 16:24:53 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id g24so53135qkl.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 16:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zf2ULn0elai1DQP6DK4nPbrJ4hgulzfjwpA+B07Mye4=;
        b=Vaxfzhe5jRSu7pBxU/9C864q1lnnA2SgZ58NAG4fQYy7kuZfQIsa339XAguSx8eRza
         DrNpLkLts46hPPsCfr/Ag9tcOvBLRdLVA1+aCUDNZVAk+3GxowkInx2wERDpBw+8MNeD
         Uk711xHciJjdZrnOlFSve9+CRRkv2ybLhofRXbqfgajOvSpCtSyi1p6D8+cdBkzdGYaZ
         K6e4KnLqF5bdOC0OloeF2kgtS9AEoM1t2rQSQnfdmcmlWyJRb9qtcuDhTGqVsz2ZW1KL
         9t+rFhEDWsbE56oGhG59Ys6J8ZhiVrXAgCH/DR/5vXEU67SU6aJojTWJZozIlm6QlMI9
         PjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zf2ULn0elai1DQP6DK4nPbrJ4hgulzfjwpA+B07Mye4=;
        b=k+SDMhAZdRJN0TENYNswJDzn8+GYZlLjKFdvJIbisr5kveQTpXB3vuCI5SjC0UnCa9
         ZKMLOoW//NHO8WM+sM5hKXBnEWfZoNy2Ldnbaa72ppVdayvLyFm7e8eZA/wHGpGZYr//
         xrRw+fQfKs3aiZY8+386vpzYlv+ICg5yAoo0KpNQR04o7Hpm5+VAmORuDeIjiRx/R7mW
         8eJLpxvRZz5fiqmTBvZBbobBfVlFkC/Mec0+ehVmRAtTFGkz555jizdpQiN6LN0WV3Uh
         6xfdOv+zqj2UvFRNmbJoSIxwfmJDgbA50KMUUvKLeYK9578p/UCfbK6QLRbQl5i6FCsy
         +SBw==
X-Gm-Message-State: AOAM533as3hQCUK9HK4TUS9y3ZB1heLiiD3c8E4lwqNFKirNMa7eDykU
        Jxwf7JoIOIaDtTL6VrVOb2D6gM7mT/n1UNkBtTqu/w==
X-Google-Smtp-Source: ABdhPJy7pua4Isz2AeTn/110l78HrRyd3wHGQp0SFekEFMbjXORFyFMGDeo8frJ3QUcf28v/6BObspZkZXX39859Y4M=
X-Received: by 2002:a05:620a:4307:b0:507:d5b1:f65e with SMTP id
 u7-20020a05620a430700b00507d5b1f65emr15137243qko.363.1646180692367; Tue, 01
 Mar 2022 16:24:52 -0800 (PST)
MIME-Version: 1.0
References: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 2 Mar 2022 03:24:41 +0300
Message-ID: <CAA8EJpr9e2-wz0Hmm7joqOMmAL9asiv4_od+WhS=3Pzs2C9fGQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] dt-bindings: display/msm: add missing brace in dpu-qcm2290.yaml
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Herring <robh@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 2 Mar 2022 at 03:14, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add missing brace in dpu-qcm2290.yaml. While we are at it, also fix
> indentation for another brace, so it matches the corresponding line.
>
> Reported-by: Rob Herring <robh@kernel.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Also
Fixes: 164f69d9d45a ("dt-bindings: msm: disp: add yaml schemas for
QCM2290 DPU bindings")

> ---
> Didn't include freedreno@ in the first email, so resending.
> ---


-- 
With best wishes
Dmitry
