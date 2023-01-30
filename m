Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 179226818AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 19:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236176AbjA3SVD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 13:21:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235920AbjA3SUu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 13:20:50 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4462F45BF8
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 10:20:26 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 68FEE20161;
        Mon, 30 Jan 2023 18:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1675102825;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1e1TVG7phUpBTXtSxNXfVzTCTgdGHNpyzxdWsQ8BV8k=;
        b=fdwn8efL87nCsaVv6qofqkV2rFWKH5TxoJYUcYTCjx35qYFwUe1ytASiTTNaBb/FUHmt3q
        j2DgL4hyGmJuAYZMvb4FDoPgJT8bpBgcIfmhFtL/2nDliN+BmJANf8MOc4qND5WK4o/Ary
        Y9Wlmf/G98nVY/YJdj5jEvxve/CpMbM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1675102825;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1e1TVG7phUpBTXtSxNXfVzTCTgdGHNpyzxdWsQ8BV8k=;
        b=ygumkL2/o5v9xcI1HVw87WwZB9z7853M5T2W3Knubhykt6ExthUwJ3TppzpIQ7yTC+HrRU
        OwsD1UW+hqUh6TCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EB62613A06;
        Mon, 30 Jan 2023 18:20:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 2la7NmgK2GOoYgAAMHmgww
        (envelope-from <pvorel@suse.cz>); Mon, 30 Jan 2023 18:20:24 +0000
Date:   Mon, 30 Jan 2023 19:20:23 +0100
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
Message-ID: <Y9gKZyRaXYJjYE9X@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20230130111014.27980-1-pvorel@suse.cz>
 <20230130152758.f5hh7zydyca22ipu@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130152758.f5hh7zydyca22ipu@builder.lan>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

> On Mon, Jan 30, 2023 at 12:10:14PM +0100, Petr Vorel wrote:
> > Enabling the clk drivers on msm8994 allows to boot and test most device
> > drivers on this SoC.

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>

> Now that we can handle probe defer on the power-domains, can this be
> made =m instead?
Thanks for your tip. Sure, if it's safe to change the rest of CONFIG_MSM_MMCC_.*
to module as well (in separate patch). I'll send v2.

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

