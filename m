Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 385B05820F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jul 2022 09:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiG0HV6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jul 2022 03:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiG0HV5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jul 2022 03:21:57 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0FB9402D8
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 00:21:56 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id i4so12356593qvv.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 00:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g8vEcinysAZAPa9OFx8vPwdOMKAFvJuoa47D1j/eu8A=;
        b=zDtvlLezlvnJBzzhvH7cYxzXql3DyJKSmQvdrFVUj/jIMTwvIxKUC6kazyYuMHU9Nf
         U4amF6oqStzsihsj/Eo7aruHNJb2KlcAG345Hf7zgdcLGPi2hgiY/j413jq8m/M3b6ec
         MVD3dIdRbCZN39w3k+qaiYwqQr381uFWFABVoNvPMi5NQ6v8Y3M7rzRI3cSomLk7zcdR
         0JtMabM2SLXZwZAkhLjDl8w0IlEjbGPsu+iwUNXtWVR8AEcNm5et1457obW7UltZak6K
         qn9lvwaw6JYE/ucSuOgevWSYsIf3aQ2waqd+cJfCI9Wjp5gio+wXUNMI2+9BFiDh6Wkb
         UGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g8vEcinysAZAPa9OFx8vPwdOMKAFvJuoa47D1j/eu8A=;
        b=7IirLdPYii0gOWW4uWpybUlVtmwmLQDvNuupV7lKEHSNuZpO4RcNfbDKmdUe3NsCwL
         ujfqwTkrc6SItFbC5Ct6hpYFRQD9Co2/p6o2WOXzUWIzHFPf75GReWt0ntufzbmzJkaM
         tz/YswFb7N+AD/7y/rf8rNBUysKvdgm88nuUSS8xtfZmb1rQ9YCrXUrgVzEOGArXoWvC
         G9JNyA0NPyfMbIBqRBK7PeVmct0RmGzSQRCmWtJLTd731MGCfgyfElbHqHAnlvc6+4AL
         CkpEktj+adn7Eb571/y+Hju52ZmQjC3r3vem1w0wZbEnvkpkZr7yero/Q5ImxXVG1Kov
         bW4A==
X-Gm-Message-State: AJIora/qnmYLwaf63R3mZexUWsvNltc6IgFxBhnt+sELwxxW6rsMXn3e
        TUzGBIKUY2mgCPY4DHPYVfMZH5gm9i/tdTLUqveaRWtqCEMtMg==
X-Google-Smtp-Source: AGRyM1u+p5T1PL1Pc87uhZO+I9O13rtfcJPZ5X2sY8EmM5xnM4Mv+fvfDBCl3BehqoMy9cBRH6+SqHFV9fHM2Nb7SMk=
X-Received: by 2002:a05:6214:2a84:b0:473:2958:2b02 with SMTP id
 jr4-20020a0562142a8400b0047329582b02mr18327863qvb.122.1658906516131; Wed, 27
 Jul 2022 00:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220727065830.10681-1-krzysztof.kozlowski@linaro.org> <20220727065830.10681-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220727065830.10681-2-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 27 Jul 2022 10:21:45 +0300
Message-ID: <CAA8EJpr_aW6_+4SXun3FsWtA+sy6zRnbzK7A6FRH5jM0VzFCcA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] ARM: qcom_defconfig: enable more Qualcomm drivers
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 27 Jul 2022 at 09:58, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Enable Qualcomm drivers:
> 1. socinfo driver to provide some basic information about the
>    SoC being used.
> 2. Remote filesystem memory driver (used in MSM8974).
> 3. RPM Power domain (used in MSM8226).
> 4. Sleep stats driver (used in MSM8916, MSM8974 and APQ8084).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
