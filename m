Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2ECC9F76A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2019 02:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbfH1AfX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 20:35:23 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37713 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbfH1AfX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 20:35:23 -0400
Received: by mail-pl1-f194.google.com with SMTP id bj8so350307plb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2019 17:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=p/xKMf91NHzy0WlAWs4lcoTEVmOFdZZtOJqmJt+BEVM=;
        b=Y9kZMsLAt6r2839OEjhuxLXzBmxLN6LJT+/TCeQYDAmWYJlIpefK9p5SsrXSbQLDLz
         Fj4ec63JhGiLE4Z2UcQVaQWDe2/HTMLvtaNr/rf/b8v9Nx7k6Fs7jarGwg3uVdjGgQJB
         grytQU3H7FCne85uR/9PHWd7v5/FZKEaOhpN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=p/xKMf91NHzy0WlAWs4lcoTEVmOFdZZtOJqmJt+BEVM=;
        b=RmsgLbyy06ZR9P0nxBH5jDbcxg4MTz6HNaIBRH7kpiOwCUtQwNu+Q7eL2iUdkKqOmo
         evAIBpZx4RQZAW9gLbbPhCoTKxtI5UfutsZVNIJcwkd3J4r2PyIq/VNrQQV3WZLThfFN
         qMyRCU27NTNPitJPOHCCLLwkvABwASyvGwGv+MNf8RXV6DnejI/PKR6MX4xwt8qsbP2n
         V5fYjFujdY25/o82a5iIO2gj9KE8NMhI7STt8qIdGkGlw0ha/weshr/QW9bPB6ut/1iA
         5rGy3agbQcxCb0hApupDKp2ExzTzQc18rp7EmPtWv6c2N5AWohv3V81fBS0lH/5dM2Jo
         uYxw==
X-Gm-Message-State: APjAAAXQFved0Mcx1Kla0sD76Zkqvm5tutr8wruzBrgV2BIwxulZcJXY
        d1dE4dk/NrGLe9u1rP6zdBdMXQ==
X-Google-Smtp-Source: APXvYqzF3wUk+u0gCKoeJlLnPRZ9wzng+YxN5ZdpbBQ1/sRdvIj8II0FPhwsbXO9ltpir6S3A3JyQQ==
X-Received: by 2002:a17:902:426:: with SMTP id 35mr1692923ple.192.1566952522894;
        Tue, 27 Aug 2019 17:35:22 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id s7sm515296pfb.138.2019.08.27.17.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 17:35:22 -0700 (PDT)
Message-ID: <5d65cc4a.1c69fb81.376b6.2486@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1cb5ab682bce53d32f3a73b5b29cc6c3e800bfcc.1566907161.git.amit.kucheria@linaro.org>
References: <cover.1566907161.git.amit.kucheria@linaro.org> <1cb5ab682bce53d32f3a73b5b29cc6c3e800bfcc.1566907161.git.amit.kucheria@linaro.org>
Cc:     devicetree@vger.kernel.org
Subject: Re: [PATCH v2 09/15] arm64: dts: msm8996: thermal: Add interrupt support
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        marc.w.gonzalez@free.fr, masneyb@onstation.org
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Tue, 27 Aug 2019 17:35:21 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2019-08-27 05:14:05)
> Register upper-lower interrupts for each of the two tsens controllers.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 60 ++++++++++++++-------------
>  1 file changed, 32 insertions(+), 28 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/=
qcom/msm8996.dtsi
> index 96c0a481f454e..bb763b362c162 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -175,8 +175,8 @@
> =20
>         thermal-zones {
>                 cpu0-thermal {
> -                       polling-delay-passive =3D <250>;
> -                       polling-delay =3D <1000>;
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;

Is it really necessary to change the configuration here to be 0 instead
of some number? Why can't we detect that there's an interrupt and then
ignore these properties?

