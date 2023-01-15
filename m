Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB7A66B42C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jan 2023 22:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbjAOVdS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Jan 2023 16:33:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbjAOVdQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Jan 2023 16:33:16 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D9916316
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jan 2023 13:33:15 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id d30so35378458lfv.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jan 2023 13:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uc2KB+6JnGN5CN8ZL6/iTxWjXrR49/KupSA1DnyxAcw=;
        b=dFJ4DuC4tiRUc97fmPGTiiz2pqctG2BFyrK4qKR8YhVmdPGybh1oT2dng+mxsgz8sI
         /DpslqS9lOwbizluHoDusyDfX9EcqLRICJiBsXvuUuZsyOL5n9yPKR6+gyuMHG96o4lT
         XqOb988Rr8gUHOJ3BHeFsNYSyXCnkhYnSCjevqSYWal0vBL830UqL4tvW+c/i2IaVDEU
         pH8FqLPg+ZR9KKefK1yJGK7WFfmFCfpnuHghQwtOtNASBHzB5iHKKqyF5BZwQyq+Fqzr
         VvpSAjTr3cTEK65ofH2zpHdRGYrR3Vbpz3RoN2Ma4AXZdZIONIGUTjRJCLZiD0TmwBC8
         wdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uc2KB+6JnGN5CN8ZL6/iTxWjXrR49/KupSA1DnyxAcw=;
        b=LjuUPdcHn2IXVMtbNFDYXqngzTRZrIasZxWTAKFKBcCYEM3vrHsBZLKMsuRaIQl1hp
         DaaH7QmtyvxacDFqB4CIEB1HPJwoUbPeAHYH88ZLdy8svlsv7yfrO81E7xcJaJ+Pj4oV
         78uAum9XQkQGOFRLZ+w6ZKga5O4ZxVQpAGvAJ1JfhZ0V2G1x6UtI/xi3CRxnf7kpty6P
         n9/23C0iEtfGH5yNIF/L7oEhMVORmCRLU5vnbLnu3MpHaMiFCyIKQkTPGdIvHo0kzvFy
         8+YCnPKEqRHCazk8Y8wPGPu8BXCkTOA61vP6qw0mzMEV/qKHdobtGQJ3zGghnuzOb4nE
         +O+A==
X-Gm-Message-State: AFqh2kpMoAPb0Nu6ApJLCDI/mbwmBDfZeTaamGNFdg3G+cdQ/1uXWUaj
        1xyHTEx7rayoKozLgBN8OZAlydRv/5rIp7XzK7+EMA==
X-Google-Smtp-Source: AMrXdXvEYNNPSdXfMPIBcHLU2o+DgI9dKFo66ir/dhuo0bqe4WYAvtuL7IqrevDujkz1Fw4cPJgl2Smg3X0zbGA5Rr8=
X-Received: by 2002:a05:6512:128a:b0:4d3:4e4b:c8ce with SMTP id
 u10-20020a056512128a00b004d34e4bc8cemr679788lfs.376.1673818393850; Sun, 15
 Jan 2023 13:33:13 -0800 (PST)
MIME-Version: 1.0
References: <20230113201038.267449-1-bhupesh.sharma@linaro.org> <aef753a5-e8b1-5b7b-1b9e-e92a84de15bd@linaro.org>
In-Reply-To: <aef753a5-e8b1-5b7b-1b9e-e92a84de15bd@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 16 Jan 2023 03:03:02 +0530
Message-ID: <CAH=2Ntx5rLWu4jzXV8DwKj+yweHPRqb4+Rv8uZpDn_brWDxyJg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: qcom: geni-se: Fix '#address-cells' &
 '#size-cells' related dt-binding error
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 15 Jan 2023 at 20:57, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 13/01/2023 21:10, Bhupesh Sharma wrote:
> > Fix the following '#address-cells' & '#size-cells' related
> > dt-binding error:
> >
> >    $ make dtbs_check
> >
> >    From schema: Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> >         arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: geniqup@4ac0000:
> >               #address-cells:0:0: 2 was expected
> >       From schema: Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>
> Don't we want rather to unify the soc address range?

Well, the assumption in the original dt-bindings was that every reg
variable is 4 * u32 wide (as most new qcom SoCs set #address- and
#size-cells to <2>). However, that is not the case for all of the
SoCs.

So, ideally we shouldn't set the  "#address-cells" and  "#size-cells":
as const: 2 in the bindings.

See as an example:
https://www.kernel.org/doc/Documentation/devicetree/bindings/usb/usb-device.yaml

Thanks.
