Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F4923C615
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Aug 2020 08:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbgHEGjF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 02:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbgHEGjF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 02:39:05 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5461C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2020 23:39:04 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id p1so24700470pls.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2020 23:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=bmuyaLQZBi2uEmha54ZgdgKhFHmlcWLfKJualcCqXYk=;
        b=aGvivbAbfB865LKL11Qmg8wlGFIIGu/j6BKLv4iR0FZn+SBKIT3qSlTrgTNjccD0PK
         vP1JboQG4hXEjb0D8FIkbCQOnULHp9AIrDmYSlXRVI18ueUFEgeEjAUAr99oMSIMP3qj
         Un97pDZl1B4/Hcm2AAlaRVDQbovd+j+rkQFXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=bmuyaLQZBi2uEmha54ZgdgKhFHmlcWLfKJualcCqXYk=;
        b=H0Gzaw7d9ZjNzbq4yAG9NqmEAb0W2ROdxNrAcz2Jxh19xaCRIgXSaXDcjFe9kO7P/c
         +shNJORCQMno4OF1YoRjlcJPZTyVvJSWH0Ez6kwwp0hLwqgWaXIAR7pt6CBez6KedD1v
         Q5xGRfHUacTdEJXCUwxRYTV2GEF9QFwzl3oRe7DMSCXFKN4AGZK4y5zK0/JGjSTk+EvU
         DBuZ0T8mZ34zLUL5QOWRklzS2ETkgcMUTpL1VQmEixkWyX5G2th/QUNHJXaeMhm0EQ0D
         O4QRyn/GBa83G5szjOuJWMrjmmR0VZh7/bh7j4xITi/k24rf1x3/2E43Zst233OJ7W+4
         yNTg==
X-Gm-Message-State: AOAM531JLOZ6sFU3ETeXNpgO14nxCABN4fu9tvSShsX4aYaTxHKhx4sw
        mJsnkpx+w/FdtlkyCuUcB+mkcQ==
X-Google-Smtp-Source: ABdhPJwkVI9PXqaFBGmNw3AgAnGz0s6XO9J95Zk48HYQBJe4hs2a1T5PzPV6AC+KhZL1Bp8VZ8vLaQ==
X-Received: by 2002:a17:90b:208:: with SMTP id fy8mr1705011pjb.131.1596609544417;
        Tue, 04 Aug 2020 23:39:04 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id gi22sm1478909pjb.41.2020.08.04.23.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 23:39:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1596541616-27688-2-git-send-email-rnayak@codeaurora.org>
References: <1596541616-27688-1-git-send-email-rnayak@codeaurora.org> <1596541616-27688-2-git-send-email-rnayak@codeaurora.org>
Subject: Re: [PATCH 1/3] dt-bindings: power: Introduce 'assigned-performance-states' property
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org
Date:   Tue, 04 Aug 2020 23:39:02 -0700
Message-ID: <159660954201.1360974.5176671532597020049@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2020-08-04 04:46:54)
> While most devices within power-domains which support performance states,
> scale the performance state dynamically, some devices might want to
> set a static/default performance state while the device is active.
> These devices typically would also run of a fixed clock and not support

s/of/off/

> dyamically scaling the device's performance, also known as DVFS technique=
s.

s/dyamically/dynamically/

> Add a property 'assigned-performance-states' which client devices can
> use to set this default performance state on their power-domains.
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  .../devicetree/bindings/power/power-domain.yaml    | 47 ++++++++++++++++=
++++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/=
Documentation/devicetree/bindings/power/power-domain.yaml
> index ff5936e..48e9319 100644
> --- a/Documentation/devicetree/bindings/power/power-domain.yaml
> +++ b/Documentation/devicetree/bindings/power/power-domain.yaml
> @@ -66,6 +66,16 @@ properties:
>         by the given provider should be subdomains of the domain specified
>         by this binding.
> =20
> +  assigned-performance-states:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +       Some devices might need to configure their power domains in a def=
ault
> +       performance state while the device is active. These devices typci=
ally
> +       would also run of a fixed clock and not support dyamically scalin=
g the

Same of and dynamically comment.

> +       device's performance, also known as DVFS techniques. The list of =
performance
> +       state values should correspond to the list of power domains speci=
fied as part
> +       of the power-domains property.

This is different than assigned-clock-rates. I guess that's OK because
we don't need to assign parents with more specifiers. Maybe it should be
worded more strongly to clearly state that each cell corresponds to one
power domain? And that it should match the opp-level inside any OPP
table for the power domain?

> +
>  required:
>    - "#power-domain-cells"
> =20
> @@ -129,3 +139,40 @@ examples:
>              min-residency-us =3D <7000>;
>          };
>      };
> +
> +  - |
> +    parent4: power-controller@12340000 {
> +        compatible =3D "foo,power-controller";
> +        reg =3D <0x12340000 0x1000>;
> +        #power-domain-cells =3D <0>;
> +    };
> +
> +    parent5: power-controller@43210000 {
> +        compatible =3D "foo,power-controller";
> +        reg =3D <0x43210000 0x1000>;
> +        #power-domain-cells =3D <0>;
> +        operating-points-v2 =3D <&power_opp_table>;
> +
> +        power_opp_table: opp-table {
> +            compatible =3D "operating-points-v2";
> +
> +            power_opp_low: opp1 {
> +                opp-level =3D <16>;
> +            };
> +
> +            rpmpd_opp_ret: opp2 {
> +                opp-level =3D <64>;
> +            };
> +
> +            rpmpd_opp_svs: opp3 {
> +                opp-level =3D <256>;
> +            };
> +        };
> +    };
> +
> +    child4: consumer@12341000 {
> +        compatible =3D "foo,consumer";
> +        reg =3D <0x12341000 0x1000>;
> +        power-domains =3D <&parent4>, <&parent5>;
> +        assigned-performance-states =3D <0>, <256>;

I guess <0> means don't set anything?
