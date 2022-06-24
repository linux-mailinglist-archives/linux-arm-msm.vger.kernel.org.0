Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 670EC559EB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 18:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiFXQkd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 12:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbiFXQkc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 12:40:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EB6314E38E
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 09:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656088830;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=n8dnSmLnMjgwT5vMe64j54S8t18apFExaSS8ijTHrlc=;
        b=XCkHwt++pTsZlCrdSz01rMol1vqceci5sdgs8+B7MyKsyh+lkyVZ20M7Nq3Ng1F2Zv0yDA
        fv+0EozS4Us3OkYGNo9o2nerwxISWuLPZxW+db0dSZ16X/bnXDGYliTNHJys5sqk6viTIo
        R3JeSP+RLFfPWQRLJuk26W9F3ltaU5c=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-RRebSAA2PT-0w_pDsj0XTg-1; Fri, 24 Jun 2022 12:40:29 -0400
X-MC-Unique: RRebSAA2PT-0w_pDsj0XTg-1
Received: by mail-qk1-f199.google.com with SMTP id o70-20020a37a549000000b006af05e7eca3so2046876qke.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 09:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n8dnSmLnMjgwT5vMe64j54S8t18apFExaSS8ijTHrlc=;
        b=GLKoNv671DNIDHSOzYGB1GfQMqNCVdnpgS6zbb2+XaFdr2kCpy+RzOR5KKyEVFjFjr
         /Kuk4ohzQRDddc1605x1+liuRSV9Fm1mqNviPRenutpWezv5uLqCC11xdTG0kdfgyztT
         DnoHYwpGRXvBkbS1o2j5Dbkn/Y2cO5m3q5W3zqJGlB9jeG9+gQqIZBtPahikq9aEJg2U
         n8U1X4ihtUuWWnrwp6Xz9scxGzldVJKMNwwJLwJRjH4ynpxPR5TWTO5siWPRwCejNQd7
         6Ak/vFlnicoIycv/m1WFa6BUflEbBk6lWyc9L8xsCi6yC8FxFz6Os/9w2Xo0EZjty/9O
         PVNg==
X-Gm-Message-State: AJIora9TPayESWI2GCr0N5Jkt4EatTWC9XMHHpV0kj+dA1ChkJ8+t7Qk
        0ES0FOYyWMZKV5kCOWYR90OJpeWyiPREeWzDb8Jst/1bnHJ7xpiMFWiQfNaTVG8yOOxzdyRyVod
        voqItp5yA/LAa6fk+5WoBxtxyWA==
X-Received: by 2002:a05:620a:570:b0:6ab:91fc:59c6 with SMTP id p16-20020a05620a057000b006ab91fc59c6mr11437613qkp.707.1656088828951;
        Fri, 24 Jun 2022 09:40:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vqIV6HjcrEOXeE3hIpiQoSxjY9PaPqQRY3anfHa/xGyouZ9QZhIZc62/U1nlcbovrv0ARCZQ==
X-Received: by 2002:a05:620a:570:b0:6ab:91fc:59c6 with SMTP id p16-20020a05620a057000b006ab91fc59c6mr11437579qkp.707.1656088828311;
        Fri, 24 Jun 2022 09:40:28 -0700 (PDT)
Received: from xps13 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id o1-20020a05620a2a0100b006a79479657fsm2408131qkp.108.2022.06.24.09.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 09:40:27 -0700 (PDT)
Date:   Fri, 24 Jun 2022 12:40:26 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahalaney@redhat.com, echanude@redhat.com
Subject: Re: [PATCH] clk: qcom: sc8280xp: add parent to gcc_ufs_phy_axi_clk
 for sa8540p
Message-ID: <YrXo+i3wwl2ERKIj@xps13>
References: <20220623142837.3140680-1-bmasney@redhat.com>
 <20220624002055.58BCFC341C0@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624002055.58BCFC341C0@smtp.kernel.org>
User-Agent: Mutt/2.2.5 (2022-05-16)
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 23, 2022 at 05:20:53PM -0700, Stephen Boyd wrote:
> Quoting Brian Masney (2022-06-23 07:28:37)
> > diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
> > index 4b894442fdf5..4639b50da418 100644
> > --- a/drivers/clk/qcom/gcc-sc8280xp.c
> > +++ b/drivers/clk/qcom/gcc-sc8280xp.c
> > @@ -5696,6 +5709,7 @@ static struct clk_branch gcc_ufs_phy_axi_clk = {
> >                 .hw.init = &(const struct clk_init_data) {
> >                         .name = "gcc_ufs_phy_axi_clk",
> >                         .parent_hws = (const struct clk_hw*[]){
> > +                               &gcc_ufs_ref_clkref_clk.clkr.hw,
> >                                 &gcc_ufs_phy_axi_clk_src.clkr.hw,
> >                         },
> >                         .num_parents = 1,
> 
> num_parents needs an update. 

Oops!

> But this is a branch, not a mux, so it can't have more than one
> parent.

Would a mux be represented with 'struct clk_rcg2'?

Brian

