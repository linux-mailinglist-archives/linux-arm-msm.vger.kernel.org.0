Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE8167307C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 21:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234329AbjFNTIw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 15:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbjFNTIv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 15:08:51 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 883C61FC8
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 12:08:50 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6b2d9ea4901so3994992a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 12:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686769730; x=1689361730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ErPDVCSBpPJlYZGqC1SD/e+jlrE1qnWfALaiFCF/cEk=;
        b=jmbi/A02sAgtAEjnexDwofutI7SYsNKZb9DJ0918C84hfbYX6Kv2CnynHp7r9XGnlN
         Cp8ZWWLwUdRTJFukEXwkeDOBMoNk3CTaEhN7ljsU9elXqeq1Z3RUSKYBM6GZo/WiI8KT
         oPOMyym6zWHkxmTB3MQ07oxWD7PeJrvq0kvWw8aGJL8XSPf+dk5f+gFT67il+bzXfAN2
         6dyi2TlnIq0Le4Z+DiAPf+P/T4s3RoflN+csQzJAHSNigY1Vh+g2sdvQ9cTB2g73o86y
         dEVSMHa3qXDAuMKstEcmSUZb/SA6tSztZN0LSg42YapskHGdFXw2quO5rHkKRaWjd8nV
         v5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686769730; x=1689361730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ErPDVCSBpPJlYZGqC1SD/e+jlrE1qnWfALaiFCF/cEk=;
        b=DIehuz1c0gz5ZQaHEsOuhUVW04GEl1DFIBeHkkdzt8QHzKBfZct9evWuRGbRdL1jIe
         xOrVmpmr2w52VkeTIOTg8gSS5wna0CFIRbQYZkR7JDm53AD7TYUL03x6Y8idF+xsMusd
         wBEldJQiAUuMT7LxsBb8mtTFFc0tRJ/WEAFJdEwhom+n7sTERqNbdazh3DSBNuihMC63
         PlSWzKbc+SZFPCz0DRyvjCyX3eHtDI+eZ+2BowAC7fQ91RREPPA9uF0qVEGKNNOLc8Nw
         pX6koJRpez50a5YLhVqpYSgGQPjwJcWNN4LV0luh4LOjJAxAaADVrgmAOiEsbL6rvf5Y
         CO4g==
X-Gm-Message-State: AC+VfDwH8qizgWp5usOTTH8wtoVT19m8lwrSzZj+xEfHKRkrag+ccg5h
        STtWG4Ou+rp8ETzgJqt16kRedlZvyHrUm/uefGwXLg==
X-Google-Smtp-Source: ACHHUZ7Jlx1MnAmIR2pE8OVZOOzZ43InmF1UHvxki4FXW/lgM0L0ew4VCWjHbEtlNlYpJ3qLkwuOtXyLLHY4KD09mf4=
X-Received: by 2002:a05:6870:8447:b0:19a:ce25:6d06 with SMTP id
 n7-20020a056870844700b0019ace256d06mr10445359oak.56.1686769729782; Wed, 14
 Jun 2023 12:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230602161246.1855448-1-amit.pundir@linaro.org>
 <358c69ad-fa8a-7386-fe75-92369883ee48@leemhuis.info> <0f6c9dcb-b7f6-fff9-6bed-f4585ea8e487@linaro.org>
In-Reply-To: <0f6c9dcb-b7f6-fff9-6bed-f4585ea8e487@linaro.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Thu, 15 Jun 2023 00:38:13 +0530
Message-ID: <CAMi1Hd3Cv1i06NhpY6Jqu7OvMpOdzTj6nTEMJNWLrMwMLsugZA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Move LVS regulator nodes up
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux regressions mailing list <regressions@lists.linux.dev>,
        Mark Brown <broonie@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 15 Jun 2023 at 00:17, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 14/06/2023 20:18, Linux regression tracking (Thorsten Leemhuis) wrote:
> > On 02.06.23 18:12, Amit Pundir wrote:
> >> Move lvs1 and lvs2 regulator nodes up in the rpmh-regulators
> >> list to workaround a boot regression uncovered by the upstream
> >> commit ad44ac082fdf ("regulator: qcom-rpmh: Revert "regulator:
> >> qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"").
> >>
> >> Without this fix DB845c fail to boot at times because one of the
> >> lvs1 or lvs2 regulators fail to turn ON in time.
> >
> > /me waves friendly
> >
> > FWIW, as it's not obvious: this...
> >
> >> Link: https://lore.kernel.org/all/CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZsw5edb-NtRJRw@mail.gmail.com/
> >
> > ...is a report about a regression. One that we could still solve before
> > 6.4 is out. One I'll likely will point Linus to, unless a fix comes into
> > sight.
> >
> > When I noticed the reluctant replies to this patch I earlier today asked
> > in the thread with the report what the plan forward was:
> > https://lore.kernel.org/all/CAD%3DFV%3DV-h4EUKHCM9UivsFHRsJPY5sAiwXV3a1hUX9DUMkkxdg@mail.gmail.com/
> >
> > Dough there replied:
> >
> > ```
> > Of the two proposals made (the revert vs. the reordering of the dts),
> > the reordering of the dts seems better. It only affects the one buggy
> > board (rather than preventing us to move to async probe for everyone)
> > and it also has a chance of actually fixing something (changing the
> > order that regulators probe in rpmh-regulator might legitimately work
> > around the problem). That being said, just like the revert the dts
> > reordering is still just papering over the problem and is fragile /
> > not guaranteed to work forever.
> > ```
> >
> > Papering over obviously is not good, but has anyone a better idea to fix
> > this? Or is "not fixing" for some reason an viable option here?
> >
>
> I understand there is a regression, although kernel is not mainline
> (hash df7443a96851 is unknown) and the only solutions were papering the
> problem. Reverting commit is a temporary workaround. Moving nodes in DTS
> is not acceptable because it hides actual problem and only solves this
> one particular observed problem, while actual issue is still there. It
> would be nice to be able to reproduce it on real mainline with normal
> operating system (not AOSP) - with ramdiks/without/whatever. So far no
> one did it, right?

No, I did not try non-AOSP system yet. I'll try it tomorrow, if that
helps. With mainline hash.

Regards,
Amit Pundir
