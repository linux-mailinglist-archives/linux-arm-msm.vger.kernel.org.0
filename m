Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02F364B02B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 03:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233606AbiBJB7E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 20:59:04 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:33156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233780AbiBJB55 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 20:57:57 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8577F2BB21
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 17:52:21 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id o128-20020a4a4486000000b003181707ed40so4619680ooa.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 17:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=dlJhRUB01qZhsIVXIk2dwYqihYxKbJJNnkUeg5WkvEQ=;
        b=jqEM46I7RIpOv6Dkxw9TpDQEzfSMQUsHfWjfCF5R1hPNJotrhb4Hfvk9+dGhmfKApj
         +tj8cpWNtVh8qXkYopCvZcUdjJsZe3FyUvDPDzzCXvx+Oqb6TBj6gc/T9MGLB2oTBy5K
         rXt8rxgL2hjvC7PB90SynvANEC3ghpyWEBImk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=dlJhRUB01qZhsIVXIk2dwYqihYxKbJJNnkUeg5WkvEQ=;
        b=BDlI9/seE0iSucKWLpCVeWq+4j5vp9FUDnqZa8GKecQb2qe6oNZGJe/gn3cQGIysyO
         X/IOalsuENkSulTbF1bjzPUlbd/yY7rzuXwS2YfQiwLi1rXurCA47W2q+K0NjqQndlCo
         yefJztmV6YBKZN/e4WDfMlLx1SLbrY/6+QCuUpownPxoxZsGXchJpAhz928WvOIDeTQQ
         PWYBbImhkB4gmXA0sumkyGrvstGO+zRzGb0M6PZEQ2a1kNZgLWi1n3r9I7X0aBN8Zc/M
         bD73+V6FupGdwADH/EtG3zBwUD7ooIRmbzZ7PUisiVDI6exxzuNcc9CdOC6ekTMzoQoB
         /5uA==
X-Gm-Message-State: AOAM532AYYGpWp3mUtpp47YXFap5sbM76c2NW2jsq52skEcedy8f7bW+
        /1Ln15PhRAmC1FZ4XJcKTIbBzOM3SxtKGenf3w7fBKh0vw0=
X-Google-Smtp-Source: ABdhPJzKZSUzft7pAYTMnnD+ET8CryZqIpC5vdW5rpze6mP8SDxIf5u1xXG74DImb5hLX73mc2qCjE47u65UInz2yIk=
X-Received: by 2002:aca:df82:: with SMTP id w124mr2220442oig.112.1644451553163;
 Wed, 09 Feb 2022 16:05:53 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Feb 2022 16:05:52 -0800
MIME-Version: 1.0
In-Reply-To: <c17e95f7-9c42-657a-8525-3937d4b27fb8@quicinc.com>
References: <1644334454-16719-1-git-send-email-quic_srivasam@quicinc.com>
 <1644334454-16719-3-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n52LGY2amCKo+40D4BoSsANs7JeQ0t_4QfeXNC5q64Ccwg@mail.gmail.com> <c17e95f7-9c42-657a-8525-3937d4b27fb8@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 9 Feb 2022 16:05:52 -0800
Message-ID: <CAE-0n51o3ohrVO-HCeVOTz=JwePA63yMrNpFsY4sFOiv6rQwEA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sc7280: add lpass lpi pin
 controller node
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-02-09 06:01:21)
>
> On 2/9/2022 2:41 AM, Stephen Boyd wrote:
> > Quoting Srinivasa Rao Mandadapu (2022-02-08 07:34:13)
> >> +                       data {
> >> +                               pins = "gpio7";
> >> +                               function = "dmic1_data";
> >> +                               drive-strength = <8>;
> >> +                               input-enable;
> >> +                       };
> >> +               };
> >> +
> >> +               dmic01_sleep: dmic01-sleep-pins {
> >> +                       clk {
> >> +                               pins = "gpio6";
> >> +                               function = "dmic1_clk";
> >> +                               drive-strength = <2>;
> >> +                               bias-disable;
> >> +                               output-low;
> >> +                       };
> >> +
> >> +                       data {
> >> +                               pins = "gpio7";
> >> +                               function = "dmic1_data";
> >> +                               drive-strength = <2>;
> >> +                               pull-down;
> >> +                               input-enable;
> > Why does input-enable matter? It's not a gpio.
> Actually the same is fallowed in sm8250.dtsi. Verified without it and
> working fine. Need take call on it.

Is that because the pin is already an input by default? What does gpio
debugfs say for this pin? Does it also work if you make it
output-low/output-high here? I thought that the gpio itself isn't muxed
out to the pad unless the function is "gpio" so I hope the input/output
settings have no effect here.
