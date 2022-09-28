Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C426B5EE0C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 17:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231650AbiI1Pov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 11:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233632AbiI1Pot (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 11:44:49 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E30C93343F
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:44:41 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id s9so8102693qkg.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=5VOCWcgoIsE/Ai5qpSZYr71NDjI2Cp8fJOu50Q8l/5U=;
        b=XutHlQR+0NPVe/vdY3DgPVuRIpUanyWgtQAVORqNe0Xz5VDNquT360t8jD613El0J8
         hPe102ZNvG5YG3fLSJVMl21VbEOIgeisxG6eBImQqO/C+pVVUoGUxSrEX8/f9vGo0hxx
         5w18vt4hGlpQ9wCtvDds5/2tGL8MiOt23CL40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=5VOCWcgoIsE/Ai5qpSZYr71NDjI2Cp8fJOu50Q8l/5U=;
        b=n9bslwv/oSkKVBWO9aDLtmqu8/+SIMNGFo96pfU3TXQBHth5M0CmbKQk5k+uWtAXD5
         Z2au+91O2RVmPPThLsSyXQ6FFKFk0+SzXmMBTYAe/H1HkgQ5xYlotKoalzoz5BudA1Ky
         OQEvCccoz6f96w9Dihj13S74AeWpdhUM6GRyLM12VdQeq5I/8+lXNEuniTdfKZnIPLdJ
         r5NLEdVX2kOZj54Dc2VmX8MflgkqMpqgUBaVbFv97z3TbzoOwxhI/9qYMGD3rCnVO3Ys
         HcAN/fxZ+fuPmD7C0X+IVqnsauS2cZcVnizjGIm11UFT75K1IOuqoG4G1OvB7Je9E8s3
         qUHw==
X-Gm-Message-State: ACrzQf3TtWuOJI4tW2K3/Xej0r7e9fvZaZD38h9xlSuJ/Rj9Nf0Mbhin
        ko4NgjeE8ZQq2dDC5pvGbG9d3A==
X-Google-Smtp-Source: AMsMyM75sbeQKpLJRmaKGZvXkO+iZIio9WRSyymNmbzDHvF0X5OLH+JKbKG/mtRK99YHvJzKgZF8BQ==
X-Received: by 2002:a05:620a:957:b0:6cd:ed32:ed2e with SMTP id w23-20020a05620a095700b006cded32ed2emr22041149qkw.48.1664379880623;
        Wed, 28 Sep 2022 08:44:40 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id h2-20020a05620a244200b006ccc96c78easm3249668qkn.134.2022.09.28.08.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 08:44:39 -0700 (PDT)
Date:   Wed, 28 Sep 2022 11:44:37 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: mfd: qcom-spmi-pmic: Add pm6125
 compatible
Message-ID: <20220928154437.if3x2zf5yozhy5kt@meerkat.local>
References: <20220926190148.283805-1-marijn.suijten@somainline.org>
 <20220926190148.283805-2-marijn.suijten@somainline.org>
 <052630d0-299e-e468-b2dd-266d371e2b0f@linaro.org>
 <20220928081055.p66huqct2wnrsrdx@SoMainline.org>
 <3f2e62f5-a6e4-7011-3f5b-29a6657eae79@linaro.org>
 <20220928082340.mkn23ersrtzb5oth@SoMainline.org>
 <2bd60261-a977-3225-8d41-4987252e6abb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2bd60261-a977-3225-8d41-4987252e6abb@linaro.org>
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 28, 2022 at 10:30:00AM +0200, Krzysztof Kozlowski wrote:
> > (Side-note: I should get accustomed to `b4 shazam` to automatically pick
> >  this up from the list, instead of rebasing / re-applying local patches)
> 
> Would be nice if b4 could update patches in current branch adding the
> tags... but git reset --hard && b4 shazam should work as well.

FYI, it can do just that using "b4 trailers -uF [msgid]". See:
https://b4.docs.kernel.org/en/stable-0.10.y/contributor/trailers.html

-K
