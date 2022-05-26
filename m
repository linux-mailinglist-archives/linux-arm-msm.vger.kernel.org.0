Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 549CD534F56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 14:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244874AbiEZMiQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 May 2022 08:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233899AbiEZMiP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 May 2022 08:38:15 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09888186D0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 May 2022 05:38:14 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id h186so1238520pgc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 May 2022 05:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0UO89BqEGFXH2LQ2Zw4hmWgdpH9c0MCNadr6R4vq1C4=;
        b=o6kLJCNqk1yw/y4JqgTCBWcbvbsHNgq0OZROaAplsSfzoioiueWmRQW7jpHM8ZbRM+
         FZIMJA3u8QwtyxQtg1QaSw+1BJBWFIvOW1X13oqk3Ju2z30ulx57CEFx0Gfn/SVr/n7V
         iUOb8dLDc8XTgmlgxlXlvm3P5gXmp1mXtpb6BgQ13L/q250Bi382CUXI1NeMn4cvDnd5
         zoWww+LHrVUBw/wrDuYTvWd2uQkP/oddPHcUMyMbz/4f0HhqwlrKBx+tawW5m7I1o0pN
         bZN9G1kdc1b5kOBZIXz7aw5G30091vUbgkaKrD4gLc6EAC2JEQkIXGWM57chIIwA2M1I
         L5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0UO89BqEGFXH2LQ2Zw4hmWgdpH9c0MCNadr6R4vq1C4=;
        b=P+8Q5uZStQEtScCKBFocZf9d8t0p/oViEcZDYFmV6w4YHognAwJAIgb8VCdveb0i+U
         WcRKSm/j8TfXKIBcYDEnDypNuXoKJOtQNmIvozxBsr3xjWktW25nUWp7lI9XhuGjwVrS
         TIzozKyVMESIvzNT5aIIRpleZYKLSYdLmXx6+zPaadIJbZgO7rz5Y2c/5Bi2qIFmt2z3
         aMk6+BThy5wZLXfd2iBTjjso8xE2W3+2AD3NbvYko3NM6jH6BwCyKPsEjI8SNxR0DH1P
         T7ELwFIMvO72202q0RyYOFkUQj62kwPIznvMrj0ZzqfliGw/Qe9KfyGurXE1tSvJ/iTF
         K94A==
X-Gm-Message-State: AOAM532SSEOFoA3yS6TTMQU5RrRgmR7C3q7wILB5WFsHWp7nZZ0dBUG/
        Guy2DoupH0ct7gPQk38Cy0kacWbeoJzep3sxkqKU6w==
X-Google-Smtp-Source: ABdhPJyRZyntzJYEiUQuZ+m4clggGTWcaM9U84syVl1f1eLiLlu/p2ojlpqtwl/1zCgj0l7RLw5zbvuPR5r+l0bzOzQ=
X-Received: by 2002:a63:6901:0:b0:3f9:caa5:cffc with SMTP id
 e1-20020a636901000000b003f9caa5cffcmr25375640pgc.324.1653568693544; Thu, 26
 May 2022 05:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220522162802.208275-1-luca@z3ntu.xyz> <20220522162802.208275-6-luca@z3ntu.xyz>
In-Reply-To: <20220522162802.208275-6-luca@z3ntu.xyz>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 26 May 2022 14:38:02 +0200
Message-ID: <CAG3jFyvp593q641LTEd3sASQAQJSQZOfVmen1aHzKPXY9+4w0A@mail.gmail.com>
Subject: Re: [RFC PATCH 05/14] media: camss: csid: Add support for 8x74
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 22 May 2022 at 18:28, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> From: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
>
> CSID hardware module on 8x74 is similar to 8x16.
>
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index f993f349b66b..6b5cd9a66ff6 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -570,7 +570,8 @@ int msm_csid_subdev_init(struct camss *camss, struct =
csid_device *csid,
>         csid->camss =3D camss;
>         csid->id =3D id;
>
> -       if (camss->version =3D=3D CAMSS_8x16) {
> +       if (camss->version =3D=3D CAMSS_8x16 ||
> +               camss->version =3D=3D CAMSS_8x74) {

CHECK: Alignment should match open parenthesis
#27: FILE: drivers/media/platform/qcom/camss/camss-csid.c:574:
+    if (camss->version =3D=3D CAMSS_8x16 ||
+        camss->version =3D=3D CAMSS_8x74) {


>                 csid->ops =3D &csid_ops_4_1;
>         } else if (camss->version =3D=3D CAMSS_8x96 ||
>                    camss->version =3D=3D CAMSS_660) {
> --
> 2.36.0
>

With that fixed:

Reviewed-by: Robert Foss <robert.foss@linaro.org>
