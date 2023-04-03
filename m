Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A38A76D44F6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 14:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbjDCMzA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 08:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbjDCMzA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 08:55:00 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62EA01702
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 05:54:58 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id p15so34560344ybl.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 05:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680526497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V9m/sUPReBRVUTZn9B6dP2tPNUqQXZVWHqpNk1XjAmM=;
        b=DCTWXstAsJF9drUfucdicjCtceJE12ZpiVkcQoOxbhPun5kiW4Mw25qh0KoPCnzwnf
         3g2+3/FNxsHjRfZYycfdJ8Nzl0erlbxVw7jtOYCmTNY3/+FtapC5R4cVnmTzwMOysyTa
         7ApcT1Bc7fpQfFKzMwLNeiwmE7OPRHfvCOvE4L+QA/eBdnVPz/1nRS6ZUvze2xANNUKf
         y/yxnxy51eN8FvvWeiPudkN5qY03ZTBQNDeWWhpX7ZUmXc3sJ65SOT6HTfkMAvFG24/a
         R4D9PmE96ItEHLDwbhKbTkdlUnKPWeQDEjhAzJm7hJ4LZ7LwhL0rye2Lru6jlN/hMYS4
         /t4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680526497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9m/sUPReBRVUTZn9B6dP2tPNUqQXZVWHqpNk1XjAmM=;
        b=Y2oUuS9h+ScrA2VZdpXFUgU1IXD1FsjjCLwrV+1TKGz3LxJ8xf63u19bR9xBy2arNd
         fAJsdYz4Mg4XRxb/Tqv0saQ5Q+TMuBWqJDRvpZzxKLnT4aXZRhjE9AUnXgjmHjuIMsAX
         JKzb5zPefhvFt7jTgpxw15quH5x60CZIms8M+P2Ijm//BVJJrPikdJb014qLsvANshg+
         y+XBs4kGFJt1hL/ka6u4J2C5c8QcgHGimTjxVQ/V8xFQN6ChJrMrXpwGVkH39BbF9Zav
         ou1D66ElD2302WtYhyAYcnFftfOkYUtF3sgiYYXOzCwyJBq1jQekzj1rtyhr2Xfb4/qA
         WZPw==
X-Gm-Message-State: AAQBX9ddpo53rJ6Olx+8GikLEPICdpyKfGREinB8n/cOu1h+tKvpnIAe
        Ct2RAUbpqcsV5BuNWXUg09ksl8FU4x98Zt4Y02YMQw==
X-Google-Smtp-Source: AKy350agaOWrDkEB7GhGzwT2bJspFd1n9g4T/aiBveguKOmpT39VaFfXxC01sTr6yL9/6KPZgVuUrjlz8cfJQn8FbxA=
X-Received: by 2002:a05:6902:102b:b0:b46:4a5e:3651 with SMTP id
 x11-20020a056902102b00b00b464a5e3651mr23230818ybt.9.1680526497588; Mon, 03
 Apr 2023 05:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230327122948.4323-1-johan+linaro@kernel.org>
 <48f71f9a-0d00-16df-fff8-5aa455918378@linaro.org> <ZCqwWwdhhJdOK+5Y@hovoldconsulting.com>
 <5dfb81df-8ae2-eb62-01a2-b26c6b8d2597@linaro.org> <a04ca2bd-72f9-c89a-3fcb-36dd710b107f@linaro.org>
In-Reply-To: <a04ca2bd-72f9-c89a-3fcb-36dd710b107f@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 3 Apr 2023 15:54:46 +0300
Message-ID: <CAA8EJpqfFhRXTrC8osdXbwJ8k1PUMYN1PtJp3ZZJhm4VuyO2tw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-pmics: fix pon compatible and registers
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 3 Apr 2023 at 15:46, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/04/2023 14:33, Krzysztof Kozlowski wrote:
> > On 03/04/2023 12:54, Johan Hovold wrote:
> >> On Mon, Apr 03, 2023 at 11:18:07AM +0200, Krzysztof Kozlowski wrote:
> >>> On 27/03/2023 14:29, Johan Hovold wrote:
> >>>> The pmk8280 PMIC PON peripheral is gen3 and uses two sets of registers;
> >>>> hlos and pbs.
> >>>>
> >>>> This specifically fixes the following error message during boot when the
> >>>> pbs registers are not defined:
> >>>>
> >>>>    PON_PBS address missing, can't read HW debounce time
> >>>>
> >>>> Note that this also enables the spurious interrupt workaround introduced
> >>>> by commit 0b65118e6ba3 ("Input: pm8941-pwrkey - add software key press
> >>>> debouncing support") (which may or may not be needed).
> >>>>
> >>>> Fixes: ccd3517faf18 ("arm64: dts: qcom: sc8280xp: Add reference device")
> >>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 5 +++--
> >>>>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
> >>>> index c35e7f6bd657..a0ba535bb6c9 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
> >>>> @@ -59,8 +59,9 @@ pmk8280: pmic@0 {
> >>>>            #size-cells = <0>;
> >>>>
> >>>>            pmk8280_pon: pon@1300 {
> >>>> -                  compatible = "qcom,pm8998-pon";
> >>>> -                  reg = <0x1300>;
> >>>> +                  compatible = "qcom,pmk8350-pon";
> >>>
> >>> Same comment as Dmitry's. There is no compatible "qcom,pmk8350-pon"
> >>> ccd3517faf18, therefore indicated backport (through AUTOSEL) will lead
> >>> to invalid stable kernel.
> >>>
> >>> You must drop the Fixes tag, because this cannot be backported.
> >>
> >> That's bullshit. Do you see a stable tag? Is 5.19-stable still active?
> >
> > Why do you refer to activeness of v5.19? This will go also to v6.0 and v6.1.
> >
> >>
> >> The problem is that the driver was updated before the binding was so the
> >> above mentioned probe error has been there since this file was merged.
> >
> > I grepped and that commit did not have such compatible. Are you saying
> > that the kernel which was released with this commit already had that
> > compatible in driver (through different merge/tree)?
>
> So I double checked, the commit ccd3517faf18 (which is being "fixed")
> was introduced in v6.0-rc1. v6.0-rc1 did not have "qcom,pmk8350-pon"
> compatible, thus it could not be fixed that way. Therefore this cannot
> be logically fix for that commit from that release.
>
> "Fixes" means that commit has a bug and this is how it should be fixed.
> So v6.0 kernel should be fixed to use "qcom,pmk8350-pon" compatible,
> which is obviously wrong. v6.0 does not support it and the "fix" would
> actually break it (which might be worse or better than original problem,
> but that's independent thing).

This patch fixes the issue in the commit ccd3517faf18. In the end, the
schema is describing the hardware, not just what the driver needs.
However, backporting this fix would also require one to cherry-pick
two other patches (one for the schema, one or two for the driver).

I think we should mention 0b65118e6ba3 ("Input: pm8941-pwrkey - add
software key press debouncing support") in the commit message (and
optionally 03fccdc76dce ("dt-bindings: power: reset: qcom-pon: Add new
compatible "qcom,pmk8350-pon"")). Using Cc:stable should probably be
left to patch authors (and I myself would not use them here).

-- 
With best wishes
Dmitry
