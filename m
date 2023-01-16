Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5FCB66C42D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 16:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbjAPPn2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 10:43:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbjAPPn0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 10:43:26 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 530CDB44A
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 07:43:25 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id f34so43249785lfv.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 07:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+uj8MIU5p9znOD4c85e3scehO09nDj4L+wgjxKo8Ds8=;
        b=vvqMKvcVSKtLJUjVBd/hLY9NxGcqUL+Mo4m/5HKdDHZVThkh0y1m0iqtY5lRrHop4R
         dtyW+PFEF2ItNtoUCkmwY2b++QPUkSXoRROonMluxPsY/Cj8q0Dh61Z3HDmlNqERdtMX
         RfIZUeRIJgBY/1CxbBCGwjJWJHSmIxfsiVTiwnE5a6xxJrYG+0pVSGqhbE7AzhrnVJuL
         M5c6c3opOIMEojt6wCJ4uQzeFT4jDuUsyBR/IWvgafIDCMeGe6k/omtT7YeXZ1qjZi0j
         opL8OHLKFRUHtEEDWLVVvo2L3RRWw6R4c05OgIq1Cn9wfFwG2k3LEEwsNegewh7bF/Vy
         Dl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uj8MIU5p9znOD4c85e3scehO09nDj4L+wgjxKo8Ds8=;
        b=EPQV5484uIbTdfa/kHGB8rFJF0RohWVH7F96uuKEShadvQGCYGC5aJCHf5hqdruAAE
         U8tehg5qpsqm6/VX/2k3JAxkX5VoTqJQ1xcNZChURBQqu9W7HRzLDRjOuLitDztjvltM
         KrW8sVU1mpqZ/031lEwYS9XUseAXb6pbeqg+vOZzng4XH6m5BlTyeMu5YkSys+xY8Fwu
         AKFgVlIIQwb8bfY+AgdRgCx0S+kiKLci+ijHcNAjCkRP776DzJnNXdqapWtfyRXc/FRJ
         Ajrn17j3VjvAw9T7nr86gqGMo+MZ1UmQKXwcQXwwSYAH/FaLDhGqTNIThXZsiWFxJgB5
         wwkw==
X-Gm-Message-State: AFqh2kq61F+ej48MTBkLJzgN+d+dl60TixziVsGjuwyGpQ6jGMa6Pozg
        vwGVgSpEfzdKyvx7FnUa3+7KDAbw3DlQjdQm12Wkvw==
X-Google-Smtp-Source: AMrXdXuWr6NmavT0mEqBIXGMr9sAWpiYQUDupZu9kL9Mvl0CEjLkBdnzpuZ7eF1bqrXFbNCuTg5c3G/Lrl3OSx9waGk=
X-Received: by 2002:a05:6512:39c7:b0:4cc:7876:9f35 with SMTP id
 k7-20020a05651239c700b004cc78769f35mr1753758lfu.125.1673883803649; Mon, 16
 Jan 2023 07:43:23 -0800 (PST)
MIME-Version: 1.0
References: <20230113201038.267449-1-bhupesh.sharma@linaro.org>
 <aef753a5-e8b1-5b7b-1b9e-e92a84de15bd@linaro.org> <CAH=2Ntx5rLWu4jzXV8DwKj+yweHPRqb4+Rv8uZpDn_brWDxyJg@mail.gmail.com>
 <b9aa6d30-5fe8-57a9-e478-c99bca70d185@linaro.org>
In-Reply-To: <b9aa6d30-5fe8-57a9-e478-c99bca70d185@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 16 Jan 2023 21:13:12 +0530
Message-ID: <CAH=2Nty2gUL3DufowzHavhUNdeht2dcX4EU7ooM+xzax2vP7uQ@mail.gmail.com>
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

On Mon, 16 Jan 2023 at 13:23, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/01/2023 22:33, Bhupesh Sharma wrote:
> > On Sun, 15 Jan 2023 at 20:57, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 13/01/2023 21:10, Bhupesh Sharma wrote:
> >>> Fix the following '#address-cells' & '#size-cells' related
> >>> dt-binding error:
> >>>
> >>>    $ make dtbs_check
> >>>
> >>>    From schema: Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> >>>         arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: geniqup@4ac0000:
> >>>               #address-cells:0:0: 2 was expected
> >>>       From schema: Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> >>
> >> Don't we want rather to unify the soc address range?
> >
> > Well, the assumption in the original dt-bindings was that every reg
> > variable is 4 * u32 wide (as most new qcom SoCs set #address- and
> > #size-cells to <2>). However, that is not the case for all of the
> > SoCs.
>
> Hm, which device of that SoC cannot be used with address/size cells 2?

As noted in the git log already the geniqup on sm6115 / sm4250 cannot
be used with address/size cells 2 (See:
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/qcom/sm6115.dtsi#L795)

> > So, ideally we shouldn't set the  "#address-cells" and  "#size-cells":
> > as const: 2 in the bindings.
> >
> > See as an example:
> > https://www.kernel.org/doc/Documentation/devicetree/bindings/usb/usb-device.yaml
>
>
> How USB device - so entirely different device, not MMIO! - is related here?
>
> Best regards,
> Krzysztof
>
