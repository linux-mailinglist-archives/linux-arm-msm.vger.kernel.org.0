Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA69673B9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 15:23:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbjASOX4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 09:23:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjASOXy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 09:23:54 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7990815544
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 06:23:51 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id b3so3495079lfv.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 06:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E4Mx0B+gnlHiPQ5MYMwlb/qGt49i354n6i8Wn0CvMng=;
        b=KK2NJffVpStog8GPaX5F22cqj3ZDzUpxyUabBu+ITeYbWCbB+bE86F/HAyB2R7nGpZ
         Uu8qabCrJGzTZMslT30QCxHXfNS4R6gjzvNXbNZuzqBozlkgA4N3Os6AzQIJHJp51U8T
         XC4cR46aFCys+gJpV42eO3mYXXfsNhlwhOAEaxAKaDMtpFsmnhC6iYpb0S+yVViqvJam
         NxndD7pfvMg86RKultFX9+JZHU4haKmEzfjdqUj9OzONfgrhzEgmsRMcOTKHRsO3qz24
         +kUFB1CHO6QlsjK8iVClhBjI3yU4OUTzrhrg62IxQlX6tLlgHGpcOw/GUxiAJ8OxoGsR
         AfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4Mx0B+gnlHiPQ5MYMwlb/qGt49i354n6i8Wn0CvMng=;
        b=D6zqk9Uil1XEu5JEQiBGvk9uriQ0bfxpCPrd08jKyJo+LEWcYQO7ErSZRd9t5jcywR
         mM4K6E9ETTbs5e/SmuGduSQEKnFusAr45h20EoGmAR0ZyqBU3tBqKkzDLK3+zToR72dm
         xHBi5kUYZOaFzMQPE+QCuPjlS/L7QFteVC7CH4jngD5G3s3P5n+NsUushWIbb/eSq2sh
         Jxr+Q2+14ekd4yTLeTC1nlai6VvtDxNetqKGgkm0b9scwGeMM5DOM+nhH0gVQvUO9MWA
         9NZASKSxGzJKXq2CN8JpUK/SNZNb+k6bKN+h4/PDhcL52aUgNhy5M2UAmuJmqIAZEoeJ
         pvgA==
X-Gm-Message-State: AFqh2koHztmpIY4bvERByv7oA3UU2QQxiNqPX5t7b0bdreJfpez9a3Yq
        2XgoukKpl9ymvpww6fuGhQUlOc4FLxWW1wNHS6zQcQ==
X-Google-Smtp-Source: AMrXdXtT8WoqclKfeOr0MbtGeO5RNimJdVF/oqBFapNeIPersIczR+3FXamEJb+7dN4l/vstPYAvssuK0GXgaOcOQ/8=
X-Received: by 2002:a05:6512:409:b0:4cc:7876:9f35 with SMTP id
 u9-20020a056512040900b004cc78769f35mr612626lfk.125.1674138229728; Thu, 19 Jan
 2023 06:23:49 -0800 (PST)
MIME-Version: 1.0
References: <20221130104519.2266918-1-bhupesh.sharma@linaro.org> <0497ba61-7646-91bb-291c-0b437c18434f@linaro.org>
In-Reply-To: <0497ba61-7646-91bb-291c-0b437c18434f@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Thu, 19 Jan 2023 19:53:37 +0530
Message-ID: <CAH=2Ntx-_s+5T7bfkmAw6uUyAxexRbrQvwfa_0E25JEGfw3Lbw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm6115: Add interconnect nodes
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, konrad.dybcio@linaro.org,
        a39.skl@gmail.com, andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Thu, 19 Jan 2023 at 18:36, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 30/11/2022 12:45, Bhupesh Sharma wrote:
> > Add the interconnect nodes inside SM6115 dtsi.
> >
> > Cc: Bjorn Andersson <andersson@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> > - Based on linux-next/master
> > - Depends on the SM6115 dt-binding and driver patchset, which can be
> >    seen here: https://lore.kernel.org/linux-arm-msm/20221130103841.2266464-1-bhupesh.sharma@linaro.org/
> >
> >   arch/arm64/boot/dts/qcom/sm6115.dtsi | 51 ++++++++++++++++++++++++++++
> >   1 file changed, 51 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> > index e4a2440ce544..dad5ab3edf0e 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> > @@ -485,6 +485,57 @@ usb_1_hsphy: phy@1613000 {
> >                       status = "disabled";
> >               };
> >
> > +             snoc: interconnect@1880000 {
> > +                     compatible = "qcom,sm6115-snoc";
> > +                     reg = <0x01880000 0x60200>;
> > +                     #interconnect-cells = <1>;
>
> Should we use 2 here as we do now for most of interconnect drivers?

Right now, we are using the value present in upstream qcs404.dtsi
which is the nearest in terms of similarity of the interconnect blocks
present on this SoC. But let me try and make this change in v2.

BTW the 'path tag' is optional, so I don't think that would be a
mandatory change.

Thanks,
Bhupesh
