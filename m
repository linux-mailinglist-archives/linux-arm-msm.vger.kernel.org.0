Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 970EA52F441
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 22:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349497AbiETUKe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 16:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243234AbiETUKc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 16:10:32 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F4019FB05
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:10:30 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id j137so238836oih.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=wiGaxzYkjsSexTF4OnqKljM8nknmSifQmJXxUrBf0MA=;
        b=MVgIBoV64tzvV8y9jiIJOSMBnsDd4wm2LVgnLBX7s1HvFwvu0XSCEvVWzQqhbVoX6D
         88DBGPkjq+0lWtRWBZwhEfZE7ggUnB7pT22Yf4GhVWCah2hLs6WlQeRPBFFBr4lZBNM7
         Dy1qPpV7EiHYKOy5TulR/5ISe/5fF6OCvWo60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=wiGaxzYkjsSexTF4OnqKljM8nknmSifQmJXxUrBf0MA=;
        b=OQkw87d7WNpikwo/mHIZ5Ye2k1nfbPSIeLRvtOEds09J4+T54mz6hfi5UZA+PbfDYz
         qTVaUsZbEPJ1sggrAmcTTKNJVqw+8aVofhAaT2An4U5wekHV/0Z8u61y9DUEhOPLJwTv
         9NouJYM+/zxo6ay7p3bUafo/wpxrAovMnuAJOT0PeD7zTF6KHdPmRaZD9zuXB0TPMDLg
         +AZSDKihTunLkm8GAjViLHrZJp7O4kjlHXbnLqARbtYCemsNSP88uZikK1qP3elmQUby
         BjIMkavUQ4lXRWG/GVcM3HkXBISOKrFjLp2Cj4mv+2BNmQ3tcHTjbWFfG8Fco+DJqn3N
         /Cyw==
X-Gm-Message-State: AOAM530ndgI4J5XZDUG18iylFlpK+Jjeh61EP5WY9ALPw3vvizRsMEPM
        We3tRlBY/iMg7YBbPpQae4ra3CYh2l2jBSRt+SU77IosyWw=
X-Google-Smtp-Source: ABdhPJw2ESNASeabzgRPotV7qcOex0oQnU0E59jPuICmZ5pWN67wlKt5uZv6bTFKt/7R/sPtqR9z0wgtCUcJf2Pfkcs=
X-Received: by 2002:a05:6808:14c2:b0:326:c129:d308 with SMTP id
 f2-20020a05680814c200b00326c129d308mr6135411oiw.193.1653077430078; Fri, 20
 May 2022 13:10:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 May 2022 13:10:29 -0700
MIME-Version: 1.0
In-Reply-To: <1289c2e4-5607-b515-88b1-f44585e62cd3@quicinc.com>
References: <1652978825-5304-1-git-send-email-quic_sibis@quicinc.com>
 <1652978825-5304-3-git-send-email-quic_sibis@quicinc.com> <CAE-0n50iYAUmj6GEdCuOJ1d_SgeeFWtoxqWf7qN=jZ_js4wBcQ@mail.gmail.com>
 <1289c2e4-5607-b515-88b1-f44585e62cd3@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 20 May 2022 13:10:29 -0700
Message-ID: <CAE-0n52tbS2zvOWb4+2cbL7uth0Z3AJ-O6e0WH_xtQsMyu4A7A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: remoteproc: qcom: Convert SC7280 MSS
 bindings to YAML
To:     Sibi Sankar <quic_sibis@quicinc.com>, bjorn.andersson@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2022-05-20 11:46:58)
> On 5/20/22 4:05 AM, Stephen Boyd wrote:
> > Quoting Sibi Sankar (2022-05-19 09:47:04)
> >> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
> >> new file mode 100644
> >> index 000000000000..a936d84eefa6
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
> >> +        resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
> >> +                 <&pdc_reset PDC_MODEM_SYNC_RESET>;
> >> +        reset-names = "mss_restart", "pdc_reset";
> >> +
> >> +        qcom,halt-regs = <&tcsr_mutex 0x23000 0x25000 0x28000 0x33000>;
> >> +        qcom,ext-regs = <&tcsr 0x10000 0x10004 &tcsr_mutex 0x26004 0x26008>;
> >
> > Because it's two items I'd expect:
> >
> >       <&tcsr 0x10000 0x10004>, <&tcsr_mutex 0x26004 0x26008>;
>
> I guess both the ways work since the driver uses
> of_parse_phandle_with_fixed_args.

See commit 39bd2b6a3783 ("dt-bindings: Improve phandle-array schemas")
for why the way you have it is not preferred.
