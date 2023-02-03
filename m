Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3BD688E21
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 04:45:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbjBCDpk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 22:45:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231760AbjBCDph (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 22:45:37 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B06367266A
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 19:45:35 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id v17so6041170lfd.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 19:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zrhD271lrTttGluQF+PCnQmCDKl2CENWlcyeC9oezU=;
        b=EnvtQcOYczYc3Hm8HN1M+u5/bCD8+AZQuZx40gf9LLFJRhaayJZiN7xh9oQ0HbVyv5
         WlaBYyooZpDvygERB3VBtzkrYmMoRceclFbdlBAjpw6s3BrzcsR9GMuvvHXM2bDqDLx5
         fiEDoomZEKpQ2lVHcskZkAyOV/HWXozdlOInzcSzGZpCsnZTNVqMgP1U7axh1r7D1ybs
         N84+JtK8ZIBIGRZSjODPD49Lj0tHIfDl6PCMPbnteNEbCC2uBDrVFrMNxX1u6RcOeMJt
         4WxLC+55i29BnBlZlD4M/NOLRiFx0LCmRdEqYBB6SB+jV2NwBiuXG3x496+i+NVQrFB5
         ukNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zrhD271lrTttGluQF+PCnQmCDKl2CENWlcyeC9oezU=;
        b=mYE/Uy862bTDTqZsI9UYl24aBQARsKzrG1+t5ln1ea4j1BhqrfHUAcrueMTFmzu0IW
         7ksqP0xBVT54xquWxlvTsf+hpZKDfbR4AcWnG2kcjTf6wWsrdBfmNUBw9U841M4uB/Cx
         q6TMvcAisbF439sx82wYM5iLM5rrqs9eGmzKGzpGLVJlIadmq60lz5TOAkG9p9QheNk5
         2dJl38D+ikseTq3TyCDl0Z4UqO1SKX6kL9LVIUITmdIQ6uJRt8poH2RZLuRKlz+C9Zx5
         USlqoLjgfEXkbqUgX58uWXiEdd9R+d2UEP9C1hKjwhlj1ITuizTqHnJ332upELaDp87u
         wI4w==
X-Gm-Message-State: AO0yUKVnc4HwqUY/NdDnu0U+tDMtlM1fur+2rR5rvv87/IDT7uoXMyaX
        MtFRgHEO5vaZAmWALwt9GuPcLprJIcgnyZHoCQuLbg==
X-Google-Smtp-Source: AK7set9mvhjgLBscCSmB7QGxYq4dFW8q88IFngk26C54TKNXnncufj9MdP1Re09yaxaXAyMUSRPNPzBfHdP7B3ZfrTs=
X-Received: by 2002:a05:6512:3d28:b0:4d8:8ad1:a05c with SMTP id
 d40-20020a0565123d2800b004d88ad1a05cmr1245389lfv.140.1675395933982; Thu, 02
 Feb 2023 19:45:33 -0800 (PST)
MIME-Version: 1.0
References: <20230201080227.473547-1-jun.nie@linaro.org> <9ab7383b-f3ed-3e48-d275-3c8933be5f2f@kernel.org>
 <CABymUCNKvm9+_ascdcWAgA1xGYKPhyO5C97-+rTTK739v+UEew@mail.gmail.com> <957f2bd0-d249-169b-04cc-242b9fcf8c6b@kernel.org>
In-Reply-To: <957f2bd0-d249-169b-04cc-242b9fcf8c6b@kernel.org>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Fri, 3 Feb 2023 11:45:31 +0800
Message-ID: <CABymUCMA9fxGjKAxLhpnSxr92t-oFDfe=mOSiLWb4Jjbzs=n8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: Add Qualcomm CCI dt-bindings
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com, bryan.odonoghue@linaro.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2023=E5=B9=B42=E6=9C=882=E6=
=97=A5=E5=91=A8=E5=9B=9B 17:42=E5=86=99=E9=81=93=EF=BC=9A
>
> On 02/02/2023 10:29, Jun Nie wrote:
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - qcom,msm8939-cci
> >>> +
> >>> +  clocks:
> >>> +    maxItems: 1
> >>> +
> >>> +  operating-points-v2: true
> >>> +  opp-table:
> >>> +    type: object
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - clocks
> >>> +  - operating-points-v2
> >>> +  - nvmem-cells
> >>
> >> ?? You cannot require properties which are not present.
> >>
> >>> +  - power-domains
> >>
> >> Same here.
> >>
> >
> > So the properties should be added later, after cpr and fuse nodes are
> > available in mainline, right?
>
> No, binding should be complete, so why would you skip some properties? I
> don't see here dependency on other bindings. Unless I missed here
> something and there is a dependency? But then what kind? Do you
> reference other schema?
>
> Best regards,
> Krzysztof
>
Sorry, it is a copy/modified error with overlooking some added properties.

+        cci_opp3: opp-cpr14-400000000 {
+            opp-hz =3D /bits/ 64 <400000000>;
+            opp-supported-hw =3D <0x1>;
+            required-opps =3D <&cpr_opp14>;
+        };
+
+        cci_opp4: opp-cpr15-400000000 {

Documentation/devicetree/bindings/interconnect/qcom,cci.example.dtb:
opp-table-cci: Unevaluated properties are not allowed
('opp-cpr14-400000000', 'opp-cpr15-400000000' were unexpected)

Do you know how to fix this dts check warning?
The cci_opp3 and cci_opp4 have the same frequency but with different
requirements to
power domain. So the name of the 2 opp should be identical or with a
different tag, but there
are warnings for both cases for the 2 lines. Thanks!


+            opp-hz =3D /bits/ 64 <400000000>;
+            opp-supported-hw =3D <0x3e>;
+            required-opps =3D <&cpr_opp15>;
+        };
