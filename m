Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0D816C63E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 10:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbjCWJoj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 05:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjCWJoT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 05:44:19 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F16E187
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 02:44:17 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id i6so24049883ybu.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 02:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679564656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i0CJdvpb8yQ5/UPQq3eqdF8V0b2VDfu62Lq2XgBdJoE=;
        b=iOfz1k2QXlxMVkChIRX/Q6LEjm61VoKTWMzjmB+VNlmb4QFiAuXUushWMB9sAJWcOC
         Gue4QqvkSWmYH1wu5XDtnEL9rFrBLPuitxJIc/Lcnnd3D4aLcmvx4472gVPdRzvnKuO7
         WRC1MNDBl65bW0JBUqzPgtG4uewkfrQa6Whp2xYRKSPk/lSSC6jgV2mplSVKskrPH4QV
         k/k/vZ3GC1IomjZORnsKWn3+0/hOQx75/5LrS8DwymX9FZtIaGpu5pQB+bEtyh4gpo7j
         pDcKOvBYlapJPq3C10lT49Qv1wjzfzZGcBDWvjy4nBvpTmKdjZ9hurRg5j9v1wBYJ3q9
         lXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679564656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0CJdvpb8yQ5/UPQq3eqdF8V0b2VDfu62Lq2XgBdJoE=;
        b=eq7F8Md3S3Ek4EZ45kgYqgTlVqvcT+UqCUAAQMD1vywKkaYcU/1UGHaGZemvDa+w5T
         AGBeZJLWuarL9yATcJceCdC21+eIXWkElrfgcDwmdZcI2q78w/iD1odmcCNCFnWY8pK6
         KjGznImu83JUlLhaLtOthZAK9SyeYQwZ/7DBhA/6kh5lx6xWawobFciwBs3mKDzu9OiM
         iTqG1l2IT1aZsoOJvsLcj29tGMQFd9uBJMU7r/ZXC4k2ifL8VZqYy+t23QYEwg+LXgXk
         sAS6e7vRa1na6j51As2EQb7ItKXBZqsZ2iSW3eaY1x3SL8oCoLv9ocwR2ML9czl0yHqN
         uCRQ==
X-Gm-Message-State: AAQBX9fuBONPy+DXX4YYEO7Jz3L0O+a3nzSJ3uwJ1i01YIf9PfJw6jF9
        WSPSJdJTF8ph1LK/iVCBl8CIyEuXnBZy26TelOuOaQXibqJVCPwY
X-Google-Smtp-Source: AKy350b1NP6ZPxn4L6Wed0Ucwykk/ZsjRotiCdbdm938Sbe7iZvFXw+Kq68tz05lDs41Hx++zYytMWzfNgx5XB8hiXY=
X-Received: by 2002:a05:6902:1502:b0:b75:8ac3:d5cf with SMTP id
 q2-20020a056902150200b00b758ac3d5cfmr619723ybu.9.1679564656218; Thu, 23 Mar
 2023 02:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230314080917.68246-1-krzysztof.kozlowski@linaro.org>
 <c35fd641-12ff-beba-341c-4d0305bcaa40@linaro.org> <290b9b19-a320-38a1-4426-51f5725dd54f@linaro.org>
 <59a6ef88-758f-4ec4-f663-47e4caa552c5@linaro.org> <CAA8EJprqXVrXdBD6eBHoDGhvST2hViZUbMgdaeKEBohpv5_V3w@mail.gmail.com>
 <554dd2ca-0514-dc1e-9add-d49a711bc1f2@linaro.org>
In-Reply-To: <554dd2ca-0514-dc1e-9add-d49a711bc1f2@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 23 Mar 2023 11:44:04 +0200
Message-ID: <CAA8EJpoj1OUtQv38CY6YWUjSLEXjRWNtuza7gWM5X=eEnd5XtQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] mailbox/arm64/ qcom: rework compatibles for fallback
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Mar 2023 at 08:33, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 22/03/2023 23:28, Dmitry Baryshkov wrote:
> > On Wed, 22 Mar 2023 at 19:37, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 16/03/2023 07:52, Krzysztof Kozlowski wrote:
> >>> On 14/03/2023 13:16, Dmitry Baryshkov wrote:
> >>>> On 14/03/2023 10:09, Krzysztof Kozlowski wrote:
> >>>>> Hi,
> >>>>>
> >>>>> Changes since v1
> >>>>> ================
> >>>>> 1. Rebase
> >>>>> 2. Make msm8994 fallback for several variants, not msm8953, because the latter
> >>>>>     actually might take some clocks.
> >>>>
> >>>> Although the approach looks correct, I think that in some cases it tries
> >>>> to mark devices compatible judging from the current driver, not from the
> >>>> hardware itself.
> >>>
> >>> Which is what compatibility is about...
> >
> > Well, I was trying to say that once we update the driver, the devices
> > will not be compatible. But probably our definitions of being
> > compatible differ.
>
> What do you want to update in the driver? What's going to happen with
> it? What is missing?

Some of these platforms do not have CPUfreq support, which will most
likely require programming of cluster and L2/L3 clocks being part of
this region.

For the reference, I think that sc7180/sm8150/other new platforms are
proper examples of 'compatible' devices, so the patchset itself has a
correct/good idea beneath. It's just that additional research might be
required for the older platforms.


--
With best wishes
Dmitry
