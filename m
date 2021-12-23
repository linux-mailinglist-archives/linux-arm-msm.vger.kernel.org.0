Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8227447E998
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Dec 2021 23:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240256AbhLWW5w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Dec 2021 17:57:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234511AbhLWW5w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Dec 2021 17:57:52 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DC2C061401;
        Thu, 23 Dec 2021 14:57:52 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id bm14so26739818edb.5;
        Thu, 23 Dec 2021 14:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=5G6N5MmO8P/7YzeJvaLeII1BWwEj3vKFRtBNPQAw/Sw=;
        b=jO+k7tI2SYe4kM78XDof1xpdskkVd3Wq1uL6OFkWrT7fMJQczi6hMb2Vnvf0WTKSo2
         rOhHh7ZgDiuhslZGvvbBxRNFzgio8fXbk/Ax7N7Yrfb6gooKUim5egVJlW/3e3zts59Z
         w+zGErw8XiLawd2LzGoZ7ET9KLSNQi3WPANveJDKSmGeriCM1Ay8A5ygLqJyZF06MSOy
         T/klowHG0xT6BoZPVaHPSn6gCWEz1c9EmduBg8i64uv5gaJjKmDJIkKeteURTK5C8iYg
         MGmy7hPQ3dqbwZn9qCi+8vzxXtuaLglbmGr/AUVzRB0HGx9PVkGLbgmoBzMiNesb84St
         G1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=5G6N5MmO8P/7YzeJvaLeII1BWwEj3vKFRtBNPQAw/Sw=;
        b=g5ffOtd3+kf/oLgt44pcl1zH0S7QiBaVxkVRWB29Zsgz08VvAcJj52dcXgw2D8/hYH
         jE6qsXod2QWeYw8KMKUBu4h4XVEsLnMoRiM+V+Uwyl8mq/nA9Si1BtNtgrOQ7y54AMZU
         SQ9DC62QxqZ2syH6RhImbsjpO/PyuiW39fjRP2AHhqa2Ey5BwsEBE/kC8uEuYq83uYnZ
         zqmSLps9CTng6v0cUszWVWQOuDm3JAisJ9O3rduZdZ/Dv/nw8KDR4YtJeplonDYtAtxL
         +3OA+jSsDhtP+wsD65S8rfBrdMlLEl2fNDq1tBc4PiJVBWL4A7/yOKx7H3X0rqv1HZ7y
         IjoQ==
X-Gm-Message-State: AOAM531+t3qaoaKIMgfULXymrPyQxJDHPO0irsAZtwwG1eKdd9S0dC9G
        9B394my8Z/PsGI38MFBEwuQ=
X-Google-Smtp-Source: ABdhPJwmwb7Ez7u+nU+Um2tqVoQ54ewknskyhGW6wJDxcFuRKp7l/iWHm8IwRNdX+X9Eg8I95I5vRA==
X-Received: by 2002:a17:907:33c4:: with SMTP id zk4mr3494896ejb.569.1640300270598;
        Thu, 23 Dec 2021 14:57:50 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id y5sm2101424ejk.203.2021.12.23.14.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 14:57:49 -0800 (PST)
Date:   Thu, 23 Dec 2021 23:57:42 +0100
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mmc: sdhci-msm: Add compatible string
 for msm8994
Message-ID: <YcT+5h15T0/gFCZO@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20211223083153.22435-1-petr.vorel@gmail.com>
 <CAPDyKFosa+V8E3pRBcwzOp48KfXZvLVmwCAro66gsWKZdAMmag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFosa+V8E3pRBcwzOp48KfXZvLVmwCAro66gsWKZdAMmag@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> On Thu, 23 Dec 2021 at 09:32, Petr Vorel <petr.vorel@gmail.com> wrote:

> > Add msm8994 SoC specific compatible strings for qcom-sdhci controller.

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

> Hi Petr,

Hi Uffe,

> Can you please re-submit this to linux-mmc too, so I can pick it from
> the patchtracker.

Done (I had to send it from my work mail, because majordomo haven't
authenticated my private gmail address).

Kind regards,
Petr

> Kind regards
> Uffe

> > ---
> >  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 1 +
> >  1 file changed, 1 insertion(+)

> > diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> > index 50841e2843fc..6a8cc261bf61 100644
> > --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> > +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> > @@ -17,6 +17,7 @@ Required properties:
> >                 "qcom,msm8974-sdhci", "qcom,sdhci-msm-v4"
> >                 "qcom,msm8916-sdhci", "qcom,sdhci-msm-v4"
> >                 "qcom,msm8992-sdhci", "qcom,sdhci-msm-v4"
> > +               "qcom,msm8994-sdhci", "qcom,sdhci-msm-v4"
> >                 "qcom,msm8996-sdhci", "qcom,sdhci-msm-v4"
> >                 "qcom,qcs404-sdhci", "qcom,sdhci-msm-v5"
> >                 "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
> > --
> > 2.34.1

