Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 168916E9EB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 00:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbjDTWXu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 18:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233034AbjDTWXr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 18:23:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E377130FB
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 15:23:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7F46B64C4D
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 22:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20D6C433A0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 22:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682029420;
        bh=TK78CSVwe2MVKl/Akspq+ZTZzHADfto5V/d7VPTH/qQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=P7lTXaA2BCb4gT3s/9AOGpOYXpvQe0w275Ge3A2uZ5QnmgfpLAoQmJ8L7DZAuJ2Ux
         KyIofP1+sRAueqK5VRacBXqZFOMWto+QmDC3NfVf95jZrUGfbTr6omP1j3MenDnQ2B
         wI/RsAcIqWKvnGSLc5qKDaBktidbgDtCfkGN4pZtR+ikpFhiNQkC42HQaYlUyMQfpM
         xWq1dffis2dfel4bTxe9UC5chQi4W4BqJJNBDX4QWIGQ0WAMWy+s4oLpS8iABqwEhG
         1BA6ukTjel/O7+tL/AH0KBDlKql5oXqOKY/MQke8PTbQQ1+JWkad65YyK0brPDoOPL
         BiDYYbMe6V26g==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-506b8c6bbdbso1394807a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 15:23:40 -0700 (PDT)
X-Gm-Message-State: AAQBX9fa1KQRse2BNG0gut8p9QW/y0MoKyC7D6J6cjKzZx+bSFZpnipb
        AWfc+R83TL27HhK3pd9uMbMpdBQWvPB+BncXdUIfRA==
X-Google-Smtp-Source: AKy350YRvc1c5/x9Ju6w2w31NCvB0mLlC9kkPyAzm+txB1+HHBy7WJqF48Tkb4o2CdB63r+Jw/WxLenE4GJSH2atRUA=
X-Received: by 2002:a17:906:a18c:b0:928:796d:71e8 with SMTP id
 s12-20020a170906a18c00b00928796d71e8mr438986ejy.3.1682029419018; Thu, 20 Apr
 2023 15:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230420072429.36255-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230420072429.36255-1-krzysztof.kozlowski@linaro.org>
From:   Amit Kucheria <amitk@kernel.org>
Date:   Fri, 21 Apr 2023 03:53:28 +0530
X-Gmail-Original-Message-ID: <CAHLCerPBnvp_XD-ZR79nZBzdbBEiYZFuLfUpAQtuopgZ8GC=ZQ@mail.gmail.com>
Message-ID: <CAHLCerPBnvp_XD-ZR79nZBzdbBEiYZFuLfUpAQtuopgZ8GC=ZQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: correct unit address
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 20, 2023 at 12:54=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Match unit-address to first reg entry.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Amit Kucheria <amitk@kernel.org>

> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/=
Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index b6452ed78802..d9aa54c11663 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -328,7 +328,7 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      // Example 1 (new calbiration data: for pre v1 IP):
> -    thermal-sensor@900000 {
> +    thermal-sensor@4a9000 {
>          compatible =3D "qcom,msm8916-tsens", "qcom,tsens-v0_1";
>          reg =3D <0x4a9000 0x1000>, /* TM */
>                <0x4a8000 0x1000>; /* SROT */
> @@ -358,7 +358,7 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      // Example 1 (legacy: for pre v1 IP):
> -    tsens1: thermal-sensor@900000 {
> +    tsens1: thermal-sensor@4a9000 {
>             compatible =3D "qcom,msm8916-tsens", "qcom,tsens-v0_1";
>             reg =3D <0x4a9000 0x1000>, /* TM */
>                   <0x4a8000 0x1000>; /* SROT */
> --
> 2.34.1
>
