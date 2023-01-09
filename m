Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 843FE66324B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 22:10:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235414AbjAIVJa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 16:09:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238120AbjAIVI4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 16:08:56 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE32A6FD6
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 13:00:38 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id fy8so23294600ejc.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 13:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZYMaHaqbGfit3zZPJvO9SjzoXsApTdGwsgUHl4lAQA=;
        b=XjKVpVF2jUh+nbcr8BfkjUGgrOZhkdDNVv6pcebFKkz6aHrE8UALZhgTfETJjk2w4U
         0xPk/UrgR4c79afxV4hEdVqMvBzZq8jDcPx+PvY2l6jiOQsTLmYqz9oG3wzAuhs1nLUk
         gH8Vw7+PtaZ36q0GRpsUjbFb21QMbLyWB/BM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZYMaHaqbGfit3zZPJvO9SjzoXsApTdGwsgUHl4lAQA=;
        b=D5c7rmX4MNWCF5FEn1wb6fIFCfviXYJswjc71vxOrUwIbS5s4bGhoKOiDCT3wNU21D
         7TzTJo2szXKItPO5C9Dd8xTbHEVtHSIezzSI5JU2mLpcUkpQYohvHU/ZM5iNxH8naD2r
         P0EQzM0C3aOqQ7fL6Jsy+T2nb1h/mv7vHhIgaa6qL3g4PSYr+drH6eDWWIGq9LbfPqf/
         fBKTpodWGF/9cfYJ6253PsuenncUpWOUfSv12RLVkolTFC0ZyR+0huMt31BV4oDZpNji
         cmy4IYg3gfA2nU6MH/9SYaYCW2NejukWnF2gt9mFoEf5xLmOVuw9ZEJGJOadhVxwdrxR
         4rKQ==
X-Gm-Message-State: AFqh2kq3AouwDteYmGCYRj8rrQLoVqZIfjk8wUB1AOEHgpgFOvptdQcl
        x6P8sG6/0B03gyqehazzjC/vZxmUXu+NKFAp
X-Google-Smtp-Source: AMrXdXvVURSYh9CVCLHMe/HscPctd4xh7Du1sX+j+QPcGIUWc8R5uff8jaPpzYxGifyGHO+/ToNZ0Q==
X-Received: by 2002:a17:907:8b95:b0:84c:95c7:304b with SMTP id tb21-20020a1709078b9500b0084c95c7304bmr41170235ejc.14.1673298036834;
        Mon, 09 Jan 2023 13:00:36 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id g17-20020a17090670d100b007bb86679a32sm4161412ejk.217.2023.01.09.13.00.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 13:00:36 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id m26-20020a05600c3b1a00b003d9811fcaafso8106486wms.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 13:00:36 -0800 (PST)
X-Received: by 2002:a05:600c:4aa8:b0:3d0:69f4:d3d0 with SMTP id
 b40-20020a05600c4aa800b003d069f4d3d0mr2698813wmp.93.1673298035812; Mon, 09
 Jan 2023 13:00:35 -0800 (PST)
MIME-Version: 1.0
References: <20221216112918.1243-1-quic_rjendra@quicinc.com>
 <Y5x+WEwTtpoV0gaR@google.com> <fd23e295-fea0-1b0a-752c-3cce26b57346@quicinc.com>
 <Y6HHCrl0q5BhrHOY@google.com> <e269300d-539e-9eb8-8b3c-d309f3abca1b@quicinc.com>
 <bbc3c257-0a49-4c80-4586-c179c8997b50@linaro.org>
In-Reply-To: <bbc3c257-0a49-4c80-4586-c179c8997b50@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 9 Jan 2023 13:00:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X3DyMrEWESV2cWvqg_TQYnj+VGFBQodAp+gfbhBz6X3Q@mail.gmail.com>
Message-ID: <CAD=FV=X3DyMrEWESV2cWvqg_TQYnj+VGFBQodAp+gfbhBz6X3Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: qcom: Document the sc7280 CRD
 Pro boards
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        andersson@kernel.org
Cc:     Rajendra Nayak <quic_rjendra@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, agross@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Dec 20, 2022 at 9:12 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 20/12/2022 18:20, Rajendra Nayak wrote:
> >
> >
> > On 12/20/2022 8:00 PM, Matthias Kaehlcke wrote:
> >> On Tue, Dec 20, 2022 at 10:30:32AM +0530, Rajendra Nayak wrote:
> >>>
> >>> On 12/16/2022 7:49 PM, Matthias Kaehlcke wrote:
> >>>> On Fri, Dec 16, 2022 at 04:59:17PM +0530, Rajendra Nayak wrote:
> >>>>> Add compatibles for the Pro SKU of the sc7280 CRD boards
> >>>>> which come with a Pro variant of the qcard.
> >>>>> The Pro qcard variant has smps9 from pm8350c ganged up with
> >>>>> smps7 and smps8.
> >>>>>
> >>>>> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> >>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> >>>>> ---
> >>>>> v4 changes:
> >>>>> Added the zoglin-sku1536 compatible along with hoglin-sku1536.
> >>>>> Zoglin is same as the Hoglin variant, with the SPI Flash reduced
> >>>>> from 64MB to 8MB
> >>>>>
> >>>>>    Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
> >>>>>    1 file changed, 6 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>>> b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>>> index 1b5ac6b02bc5..07771d4c91bd 100644
> >>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>>> @@ -558,6 +558,12 @@ properties:
> >>>>>              - const: google,hoglin
> >>>>>              - const: qcom,sc7280
> >>>>> +      - description: Qualcomm Technologies, Inc. sc7280 CRD Pro
> >>>>> platform (newest rev)
> >>>>> +        items:
> >>>>> +          - const: google,zoglin-sku1536
> >>>>> +          - const: google,hoglin-sku1536
> >>>>
> >>>> Is there actually such a thing as a 'hoglin-sku1536', i.e. the Pro
> >>>> qcard
> >>>> with 64MB of SPI flash, or do they all have 8MB of flash?
> >>>
> >>> The SPI flash is on the CRD mother-board and not on the qcards, so if
> >>> you replace
> >>> the qcards on the CRDs with 64MB flash you would need the
> >>> hoglin-sku1536 to
> >>> boot on those.
> >>
> >> With such a configuration how does the bootloader know it should pass
> >> the kernel
> >> the device tree for 'hoglin-sku1536' (pro) and not the non-pro
> >> variant? IIUC the
> >> device tree is selected based on pin strappings on the mother-board,
> >> not the
> >> qcard.
> >
> > The device tree is selected based on the pin strappings _and_ additional
> > logic
> > to dynamically identify modem/non-modem(wifi) as well as pro/non-pro
> > SKUs which
> > was added in the bootloaders.
>
> Just to clarify things, when you mention pro SKU, is it a separate SoC
> revision (like sc7280-pro vs bare sc7280), or is it a CRD revision (CRD
> Pro vs bare CRD)?

I guess Rajendra never responded, but since I know the answer: it's a
different SoC revision. ...but the SoC in this case is on a daughter
card, so you could remove the daughter card containing the SoC and put
a new daughtercard on. That would have the effect of making an old CRD
revision have the new Pro SKU SoC.

Bjorn: I'd also note that I think this series (this patch and the next
one) are ready to land.

-Doug
