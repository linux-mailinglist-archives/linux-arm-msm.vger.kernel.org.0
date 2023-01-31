Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0D8682B1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 12:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbjAaLGZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 06:06:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbjAaLGZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 06:06:25 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3251959CD
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 03:06:24 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id c124so17539802ybb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 03:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jcYOXBku2VHxJy8UetnYAZWJYNBo3JqIqgAbN/pCoHc=;
        b=qZ0ffD3cHSPyEP2aHjBMxqQ9w1yXBwI8ZUdEctiaVMRd+RrjqMgradk0cQSee9MuZd
         bZUo15j11DJpNUnCvW6k4aqaew+8pu3hMc3ioeLpOSgJKIQ0abGyqdl5ap6mRr8N5idl
         YIlo/BFeLh9VQRKgfOquNhDIOTeMScABbVKGH8gYv6LXCRvDjxC/T7wzxJvpAUaZPrDZ
         ziE8YoEfi0yYlYsA0khKEjvVCRSD69RNycT/oTU/pc5iUubsPD+XftegTe56XOFo5uWa
         GxhN7hgWYTVsZAtVnvJvTIfUNvrMz9gKiZjb5oOyWw0jxaMK6rcyA5ftVkfXkYWhwwxa
         70Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcYOXBku2VHxJy8UetnYAZWJYNBo3JqIqgAbN/pCoHc=;
        b=6AA/VRsN3zmuQuzkCjtZve/G1zrAp2peON2cZkteX5BICx6I3NUuqCvmF/o4T43AJI
         s1o4rMckw9wFT4+ql0N95hZ1P4gsTJFnyTd8tqBc3Br4c0iEMI+kPA8a0R3+2trWxQBu
         Ricp6Z26oJpoXDNRu5bclAKueMMHZ+YjsbRJ4NOg8VCa7fDYqsFexuN00qA7IRuXsIhr
         CwN9deTXEiG4mASiRBQYdYyyBcKJQwmzkG0ufWCCadOCvGZjON+68/QFa4+4t1weU39X
         8VhBqxOZEdIYj7cNaFl6NDJFJk7gkrb4XCNy9cxAd5jvqXISv4E6gLFRLiosJwu2TbZp
         LPog==
X-Gm-Message-State: AFqh2koP7EcG2aY/4F1/OKDiXZUoMGvU0OEkVX8U4ub1ToAZk3PSZEd5
        Mrw+Gh2YvYBFElmZU7QWp/jVUTjtWVL6mA3+sdt/ig==
X-Google-Smtp-Source: AMrXdXsG2IG3ZAX86Ej5Fkh0a5wU7kGAbJfTqlXxD57SAjEXIgbHDjXh/JQUBJk0zHxwaDTalkJPBBZu24Ao5HdY8Yw=
X-Received: by 2002:a5b:305:0:b0:709:9335:236e with SMTP id
 j5-20020a5b0305000000b007099335236emr4925339ybp.288.1675163183394; Tue, 31
 Jan 2023 03:06:23 -0800 (PST)
MIME-Version: 1.0
References: <20230124182857.1524912-1-amit.pundir@linaro.org> <39751511-3f06-7c39-9c21-208d4c272113@linaro.org>
In-Reply-To: <39751511-3f06-7c39-9c21-208d4c272113@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 31 Jan 2023 13:06:12 +0200
Message-ID: <CAA8EJppLBuA08hkqTrZx_wwbtCxK9sAjv48c9_DxgPENgo7a8Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Mark cont splash memory
 region as reserved
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     Amit Pundir <amit.pundir@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 31 Jan 2023 at 12:54, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 24/01/2023 18:28, Amit Pundir wrote:
> > Put cont splash memory region under the reserved-memory
> > as confirmed by the downstream code as well.
> >
> > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > index f41c6d600ea8..2ae59432cbda 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > @@ -100,6 +100,14 @@ hdmi_con: endpoint {
> >               };
> >       };
> >
> > +     reserved-memory {
> > +             /* Cont splash region set up by the bootloader */
> > +             cont_splash_mem: framebuffer@9d400000 {
> > +                     reg = <0x0 0x9d400000 0x0 0x2400000>;
> > +                     no-map;
> > +             };
> > +     };
> > +
> >       lt9611_1v8: lt9611-vdd18-regulator {
> >               compatible = "regulator-fixed";
> >               regulator-name = "LT9611_1V8";
>
> Doesn't this mean we loose 0x2400000 of DRAM for all rb3 platforms
> though ? About what 37 megabytes.. ?

I think this memory is further used for display memory allocation. So
we are not loosing it, but dedicating it to the framebuffer memory.


-- 
With best wishes
Dmitry
