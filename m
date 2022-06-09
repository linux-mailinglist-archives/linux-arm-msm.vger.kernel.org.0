Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE7F544E07
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 15:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239711AbiFINtU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jun 2022 09:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239598AbiFINtR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jun 2022 09:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4C6D1193E8
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jun 2022 06:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654782555;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lOewZ2eDzpAjQpR88n3nji2pXFHQbP97PrCw1r3vUWo=;
        b=DEvMsWx3Db+kvXFI5ZyjSN2+Etv4380RZMiwHKUoPHlKlVUNu24a9+J1M4NKWaFben5Yqi
        Za1Q4ZBuvbQ3vgUPwYy08KVyp1K5fzb+QqJIdEqMQn+yzQf87JtFzIL+gOxqKCO1RCIDfU
        oePZz055+7461Mvak5wRZcO+FYlzxqw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-MWX2VqppPiyYdGNy0mno2w-1; Thu, 09 Jun 2022 09:49:14 -0400
X-MC-Unique: MWX2VqppPiyYdGNy0mno2w-1
Received: by mail-qv1-f69.google.com with SMTP id q36-20020a0c9127000000b00461e3828064so15038902qvq.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jun 2022 06:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lOewZ2eDzpAjQpR88n3nji2pXFHQbP97PrCw1r3vUWo=;
        b=VCi8jc0M15QLam4tsOdhPZS1yYsj9JKLAmJmw2ut3xMB6GqkIX59Qd8ZD7dSlGGkEJ
         6gZ0BciG7bgoyS1qvNjyHfFaIpV5Owycvywfvm1g3sxK4Ee/OB9B8zLLVWKz8SRqCQqE
         n0nkCiyiKdjN3L4x3/ImmdXgVYnn6B9IQmBoJUNJCEEt2tuvxpp9dIRjSNtE2yjGppA3
         9RrxxrxOwA8Khaq5ctDTfx3Jc9Vpd7kqCZSJoSpaMQ8O0rjx3HPf0JMYR6BTWINIuyZP
         9Amxyn1+zwQ46disoPt64seqTZibtUfH97AC+pj4zqlJdwG7ltsdn/1MvKdD1QsAi++V
         1Kvw==
X-Gm-Message-State: AOAM531WRFCKpb7k5kutmcyNVG4LvW2Sr/scmUFVBSWVzGH1Cr4r5lfT
        JaW4lzceUtaNS+Xzr0A61Q2u05yWY9EHaYf+TWC7SlX/9cQIemeXKssGXV64+rgGRM8MPcdq0oQ
        bvOjlVCugCx/E4JvSL2QEfdSTtw==
X-Received: by 2002:a05:6214:2406:b0:464:41bb:3582 with SMTP id fv6-20020a056214240600b0046441bb3582mr29016766qvb.3.1654782553853;
        Thu, 09 Jun 2022 06:49:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIQ+lnH1PJb1CfB0MllWVq08fBjPi4efChc8Ezpwo0RGCx3QWvy+fWH4qsU3Z5DqlUHJ5BAw==
X-Received: by 2002:a05:6214:2406:b0:464:41bb:3582 with SMTP id fv6-20020a056214240600b0046441bb3582mr29016744qvb.3.1654782553590;
        Thu, 09 Jun 2022 06:49:13 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::48])
        by smtp.gmail.com with ESMTPSA id s3-20020a05620a0bc300b006a66f3d3708sm20920889qki.129.2022.06.09.06.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 06:49:13 -0700 (PDT)
Date:   Thu, 9 Jun 2022 08:49:11 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gdsc: Bump parent usage count when GDSC is
 found enabled
Message-ID: <20220609134911.xmk5x6qbfu5r7nmd@halaneylaptop>
References: <20220606212112.3617731-1-bjorn.andersson@linaro.org>
 <20220607121548.fhzpjcmoahlkue4t@halaneylaptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607121548.fhzpjcmoahlkue4t@halaneylaptop>
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 07, 2022 at 07:15:48AM -0500, Andrew Halaney wrote:
> On Mon, Jun 06, 2022 at 02:21:12PM -0700, Bjorn Andersson wrote:
> > When a GDSC is found to be enabled at boot the pm_runtime state will
> > be unbalanced as the GDSC is later turned off. Fix this by increasing
> > the usage counter on the power-domain, in line with how we handled the
> > regulator state.
> > 
> > Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/clk/qcom/gdsc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> > index 44520efc6c72..a1fa7c4cff60 100644
> > --- a/drivers/clk/qcom/gdsc.c
> > +++ b/drivers/clk/qcom/gdsc.c
> > @@ -420,6 +420,9 @@ static int gdsc_init(struct gdsc *sc)
> >  				return ret;
> >  		}
> >  
> > +		/* ...and the power-domain */
> > +		gdsc_pm_runtime_get(sc);
> > +
> >  		/*
> >  		 * Votable GDSCs can be ON due to Vote from other masters.
> >  		 * If a Votable GDSC is ON, make sure we have a Vote.
> > -- 
> > 2.35.1
> > 
> 
> Makes sense to me!
> 
> Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

Gah, too trigger happy -- I missed checking the return of
gdsc_pm_runtime_get() as Stephen pointed out in his reply.
I think with that in place feel free to add my R-B.

Thanks,
Andrew

