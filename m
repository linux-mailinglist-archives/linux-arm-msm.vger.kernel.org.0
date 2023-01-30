Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40B11681A0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 20:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238247AbjA3TNV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 14:13:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238315AbjA3TNN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 14:13:13 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 589F04EE3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 11:12:53 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id C133C21DD4;
        Mon, 30 Jan 2023 19:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1675105971;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8J6ebmUA5YXVjt6HywGhwpcj6rbyrkqPu5btf6a7uck=;
        b=asI3S0Injl2iem8EQwDkoNKDI8Ga+K46nICWyCcT+AI/JsrAC2stHS34t8iwsk/29ZLvXn
        IdLJE2vF7oxOWiyalYuwkMr0/+OEM1Exa9UIZt5IAIjWCUktQRG1W2QuyM+3ZGW8P5eRQB
        8rdmo+1nX/Us9lZa/y46Cd9Q4lZ1L1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1675105971;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8J6ebmUA5YXVjt6HywGhwpcj6rbyrkqPu5btf6a7uck=;
        b=hjqxH1ARKQ5szosD7FziL058jYO56cr27YX96DnDu0PXNb42l/ab6ynfKFkq82pDc+IScK
        QvUUQAN+go9qLNDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4A93313444;
        Mon, 30 Jan 2023 19:12:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id uTM9DrMW2GOBdgAAMHmgww
        (envelope-from <pvorel@suse.cz>); Mon, 30 Jan 2023 19:12:51 +0000
Date:   Mon, 30 Jan 2023 20:12:49 +0100
From:   Petr Vorel <pvorel@suse.cz>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Jamie Douglass <jamiemdouglass@gmail.com>
Subject: Re: [PATCH 1/1] arm64: defconfig: Enable qcom msm8994 clk drivers
Message-ID: <Y9gWsWuDt10fUL5i@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20230130111014.27980-1-pvorel@suse.cz>
 <20230130152758.f5hh7zydyca22ipu@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130152758.f5hh7zydyca22ipu@builder.lan>
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> On Mon, Jan 30, 2023 at 12:10:14PM +0100, Petr Vorel wrote:
> > Enabling the clk drivers on msm8994 allows to boot and test most device
> > drivers on this SoC.

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>

> Now that we can handle probe defer on the power-domains, can this be
> made =m instead?

Out of curiosity may I know what commit implemented handling probe defer on
power-domains?

Kind regards,
Petr

> Regards,
> Bjorn

> > ---
> > NOTE: Working as part of SUSE hackweek, that's why I use my work mail
> > instead of usual private gmail.

> > Kind regards,
> > Petr

> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)

> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index bfafb4313436..c6b08a9d8944 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1105,6 +1105,7 @@ CONFIG_IPQ_GCC_6018=y
> >  CONFIG_IPQ_GCC_8074=y
> >  CONFIG_MSM_GCC_8916=y
> >  CONFIG_MSM_GCC_8994=y
> > +CONFIG_MSM_MMCC_8994=y
> >  CONFIG_MSM_MMCC_8996=y
> >  CONFIG_MSM_GCC_8998=y
> >  CONFIG_QCS_GCC_404=y
> > -- 
> > 2.39.1

