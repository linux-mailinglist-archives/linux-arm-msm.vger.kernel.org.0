Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4DC66AFF9E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 08:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjCHHY4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 02:24:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbjCHHYx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 02:24:53 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C2FA92F09
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 23:24:51 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id cp12so9640359pfb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 23:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678260290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQc7CAsTKOJjZMBNjLgh8fMUOuZomOoWr2XcnNoS/7Q=;
        b=P2UsjBYvxzIn/XkZe/qA+ewHk/RYUradsV5wapw2t4/MXUlY996SHWntxOLfD3Xu5Q
         WxprnHIkswK9pPrWYePrgqZx+MGxTUE5RKmYsEWzoqk2m9Ow7+fgkZGXc2J1juyDYDvB
         +WVnZMcw8dRNxSiCI2I37AEbHnbxu1IGXFXdsEboHiQHc+0/ZbN9MkBr7pKpQuw+pj5F
         yd7m7zXPnzN6rBquyIBjffNffVgftK+JdFA2sP2IqeqPn6VBJaTDSsPxzWH0qRN4Fr0Y
         aTezEyZxeSKAt8WvAmeTAGmyBwtcPwv1eoHaa66xx3yxg8kYSGIea+dX9PeTrqEMl+cn
         lKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678260290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQc7CAsTKOJjZMBNjLgh8fMUOuZomOoWr2XcnNoS/7Q=;
        b=SJT5ivVT2FbzgvSyOt+jnVMJDLFWdmg+Cl9xJdfPCJPlcseqH7mankmMrmgKrlxMui
         2vIvl7UJGJLkM+SnXfwD07h/2QbOZ+0PlDwpkLAnxrnyUEfDTQgATyVvleUHbw3A5pMj
         PRgaLyESFEx6u5hjBzQwhGn1G3nzp+W4iPjpa6TACM6xrMBP+S9qGDi2pPmQwbxrP1cg
         C0xY05qITUw9zcSLTk7XRKuz270uQVrWJm8sheHythwbsa9SPN8gUVbc3w6w6NL6Y8H5
         bQ0hJk91u0ViAMBEZUPf8O48EiDpIDzQ0As6ShGy0RuQr4rlPlXT898oWhH0e+9FsubZ
         NxTQ==
X-Gm-Message-State: AO0yUKXLbj9a7TeF5GnhG4cuuXDxrDunfOXbmU+XZelwgjg/xb56Rsdv
        MIEWdjeA62qBWnF7vGGMfDmNezrFUXYzZVOpRcCy1Bqi7+zrlbdg
X-Google-Smtp-Source: AK7set8PT4b7GPLMPJQ/gWYMowNcMok2Y2rgbNkVB5uyal+ySQwZLgR67XsEEmEY3nJtoGw1U2d9T76TL8SScICx5O0=
X-Received: by 2002:a63:931e:0:b0:503:2561:6fed with SMTP id
 b30-20020a63931e000000b0050325616fedmr6084269pge.1.1678260290507; Tue, 07 Mar
 2023 23:24:50 -0800 (PST)
MIME-Version: 1.0
References: <20230308011705.291337-1-konrad.dybcio@linaro.org>
In-Reply-To: <20230308011705.291337-1-konrad.dybcio@linaro.org>
From:   Shawn Guo <shawn.guo@linaro.org>
Date:   Wed, 8 Mar 2023 15:24:38 +0800
Message-ID: <CAAQ0ZWSXP59cgyHNkR8UfXRHqRrJGLxuNwMBh2N6=W_x18-BTg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Allow #power-domain-cells
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, marijn.suijten@somainline.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 8, 2023 at 9:17=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:
>
> MPM provides a single genpd. Allow #power-domain-cells =3D <0>.

Indeed! It was missing from the initial submission.  Thanks for fixing it u=
p!

>
> Fixes: 54fc9851c0e0 ("dt-bindings: interrupt-controller: Add Qualcomm MPM=
 support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,mpm.yaml     | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,=
mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.=
yaml
> index 509d20c091af..4c470dc143e5 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yam=
l
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yam=
l
> @@ -62,6 +62,9 @@ properties:
>          - description: MPM pin number
>          - description: GIC SPI number for the MPM pin
>
> +  '#power-domain-cells':

Should we add it to the "required" list and examples?

Shawn

> +    const: 0
> +
>  required:
>    - compatible
>    - reg
> --
> 2.39.2
>
