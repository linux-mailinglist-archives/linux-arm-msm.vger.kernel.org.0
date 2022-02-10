Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9504B0288
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 02:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbiBJBz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 20:55:59 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:60174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233169AbiBJBzn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 20:55:43 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D222BB18
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 17:50:54 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id s24so4481648oic.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 17:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=8+Nru2NcToVw10SMtgwpUUD5V5gNRuUchLBb5mwzcTo=;
        b=TXHV4iS/LnExFOG16+ujTQmMvV1cNm5vPFzItoWZDg8A8T/YPbRQnR5VB+jSEMaxFU
         Pt/WKTUgnSrBXxgCyeIzvTEs7ZzqHTpju3FkNOxVi1T4xx3SI1l6pK+TLwjynJqb/OSP
         R19+UJ4qOCkEjvQcpQOFlPTR99isRfg19NWdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=8+Nru2NcToVw10SMtgwpUUD5V5gNRuUchLBb5mwzcTo=;
        b=uIV0NlA76rsCN26vJZEDQ90fBr2vFUaiGP+ffcGoOe1LiLq8WQlIU7qipMXgRT5W6O
         PZrhAf98bUWWdFk6Jwc4kGvs6qbBe9pw9XYZBoZKae88zBx+tP36ICWTZPoreDo/Aj6k
         yTDbabq7COwpN7pc4jkydIzA+VfkE8qZI1OAn6dCzFCxe2ac1ng41/yTNg/4rk2wXOdk
         L2ReuiTnMq6/HzVHUbNUlTMX0m8R5yqjGGAfqDJPlSWSi2cRvS6g8Msx0h7MsAqSfemN
         b0jxEs5hJqpz0OBiZ+Lht8SHO+1poDJmkuHK9MHNod1BXASOIL9xZ3sjSYEWQ3zemfk1
         Fdqw==
X-Gm-Message-State: AOAM530bQfKQFrArbmVKoAAjliG1EtiAxHHnvkru1fQE1BmO6EltaA0P
        Qko+W8YcrVto5NWpHoy8U5xqToze3edwxGUUPT3FZUIzO8s=
X-Google-Smtp-Source: ABdhPJziJIFTknz84SWo9mVGHh0qE57URGU8n7DntwMHca8it42Jy2AZliHDBlgXQCx9Gscxm97mfnNa5Z0YJT9CftY=
X-Received: by 2002:a05:6870:d413:: with SMTP id i19mr1648649oag.54.1644451410730;
 Wed, 09 Feb 2022 16:03:30 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Feb 2022 16:03:30 -0800
MIME-Version: 1.0
In-Reply-To: <a1c2a7e6-8d76-6ee6-4bc4-e7ea8013af02@quicinc.com>
References: <1644334454-16719-1-git-send-email-quic_srivasam@quicinc.com>
 <1644334454-16719-4-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n50jBeOnkpogPFm+zqTf8bqQs-Bo0Gma658uFE6aA=Edxg@mail.gmail.com> <a1c2a7e6-8d76-6ee6-4bc4-e7ea8013af02@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 9 Feb 2022 16:03:30 -0800
Message-ID: <CAE-0n52LqrdLXk4=WMQY3WXVYLjpwXH+FP2z71gKMAkjiPR4Xg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc7280: Add wcd9380 pinmux
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-02-09 06:26:58)
>
> On 2/9/2022 2:42 AM, Stephen Boyd wrote:
> > Quoting Srinivasa Rao Mandadapu (2022-02-08 07:34:14)
> >
> >> +                       pins = "gpio83";
> >> +                       function = "gpio";
> >> +                       drive-strength = <16>;
> >> +                       output-high;
> >> +       };
> >> +
> >> +       wcd938x_reset_sleep: wcd938x_reset_sleep {
> >> +                       pins = "gpio83";
> >> +                       function = "gpio";
> >> +                       drive-strength = <16>;
> >> +                       bias-disable;
> >> +                       output-low;
> > Why doesn't the device drive the reset gpio by requesting the gpio and
> > asserting and deasserting it? We shouldn't need to use pinctrl settings
> > to toggle reset gpios.
> Okay. Verified without these nodes and didn't see any impact. But
> similar way it's mentioned in sm8250-mtp.dts. Could You please suggest
> on it how to go ahead on this?.

I'd expect the wcd938x codec device node to have a 'reset-gpios'
property like

	reset-gpios = <&tlmm 83 GPIO_ACTIVE_LOW>

and then the driver to request that gpio via

	reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);

so it gets the gpio during driver probe. Then the gpio can be deasserted
during suspend and reasserted on resume, if that's even important?
