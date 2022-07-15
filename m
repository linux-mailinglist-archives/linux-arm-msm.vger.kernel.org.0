Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD4E576377
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jul 2022 16:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235294AbiGOOOD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jul 2022 10:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235277AbiGOOOB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jul 2022 10:14:01 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E871409D
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jul 2022 07:14:00 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id t3so6518135edd.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jul 2022 07:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gW/a2mOXib1anWeNlYWktVJh3lMiqjsROInCujAz3Rg=;
        b=YNl+MMCxEe3MHxh8BvAkFfag4BqIUEEw/2+ie9AGPk91mgDe9VI8p0TmMWiXp9z/Qh
         1ODz85KrguLaJgJKqIQaCQ/kS/+C0Gu29k9Qr6nyCjdl3TPwtA2K1lX5H6G/xsnMABj9
         nURRSweYZ1b0bNfPesonxURXYfi3BeBMJkpFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gW/a2mOXib1anWeNlYWktVJh3lMiqjsROInCujAz3Rg=;
        b=WTpVFx+WuUFeQe5z9vSmaMJWKTCPwbMBtZZ4PylzgVTtppGLWqKm2bB03TL3LrhCWw
         izi4CNHQ4plzN5Y5fHfDL3eWtydklNklD1L7tuzDeS1yW0ZHVRuQEScR/CWyvRski3qJ
         M1Q/AHy1gg1w4yhY6KTwlnidESSdcsYWQYk/qxGExW000o9VRuLTBPmcy5Sv34ZJkEem
         T3QeSmL7xcWm5E4VH16w5elK2tNCQ/cqf9MczCQje77NcRqXE4XEz6KxXHBDs4lkrK24
         DTiB9PmnATJf0B2/IYS5NASdMebm0niIzXiT+w3dw5ukGFVF46656nja/yAdHsROM+ig
         kYvw==
X-Gm-Message-State: AJIora8gFNThNNU19wc2yMojhFRBOmj1Sv99VmH7DibG7VykMFMlfArL
        HTjgAlks5mycEg3iwU+/6o/yUQgK9q3MBjd0
X-Google-Smtp-Source: AGRyM1tEqLSAS5ukyUXARW7uw/L/TJ+s7j3CQUFTx68AZrzwJkOYxKwBvs2ktsTiF0NYBHZXIPGYew==
X-Received: by 2002:a05:6402:1659:b0:43a:1735:e1ce with SMTP id s25-20020a056402165900b0043a1735e1cemr19439459edx.196.1657894439089;
        Fri, 15 Jul 2022 07:13:59 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id a10-20020a170906190a00b0072aa1313f5csm2047899eje.201.2022.07.15.07.13.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 07:13:57 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id h17so6971732wrx.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jul 2022 07:13:57 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr12818655wrr.583.1657894437105; Fri, 15
 Jul 2022 07:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220715084442.115021-1-jinghung.chen3@hotmail.com> <SG2PR03MB5006D3E109835FCAD1B01A47CC8B9@SG2PR03MB5006.apcprd03.prod.outlook.com>
In-Reply-To: <SG2PR03MB5006D3E109835FCAD1B01A47CC8B9@SG2PR03MB5006.apcprd03.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 15 Jul 2022 07:13:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WB4ZjdimA+p0wWfqGKiLo64Vt+hg7C1_bM3hrF2DwAQg@mail.gmail.com>
Message-ID: <CAD=FV=WB4ZjdimA+p0wWfqGKiLo64Vt+hg7C1_bM3hrF2DwAQg@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: sc7280: Add herobrine-villager-r1
To:     Jimmy Chen <jinghung.chen3@hotmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Alan Huang <alan-huang@quanta.corp-partner.google.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jul 15, 2022 at 1:45 AM Jimmy Chen <jinghung.chen3@hotmail.com> wrote:
>
> This adds sc7280-herobrine-villager-r1.dts for villager device tree files.
> Herobrine-r1 is exactly the same as -r0 except that it uses a
> different audio solution (it uses the same one as the CRD).
>
> Signed-off-by: Jimmy Chen <jinghung.chen3@hotmail.com>
> ---
>
> Changes in v5:
> -Revise rev0+ to rev0
> -Add -r1 line to the Makefile
>
> Changes in v4:
> -Add this patch
>
>  arch/arm64/boot/dts/qcom/Makefile                  |  1 +
>  .../boot/dts/qcom/sc7280-herobrine-villager-r0.dts |  4 ++--
>  .../boot/dts/qcom/sc7280-herobrine-villager-r1.dts | 14 ++++++++++++++
>  3 files changed, 17 insertions(+), 2 deletions(-)

Other than the unclear race between your series and Judy's patches
[1], this looks good to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/20220714061151.2126288-4-judyhsiao@chromium.org
