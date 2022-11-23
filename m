Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E32B63511B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 08:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235819AbiKWHch (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 02:32:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235759AbiKWHcg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 02:32:36 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB57C20
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 23:32:28 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id e27so667310ejc.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 23:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4qo3fGXZQy+8oZhU7cu78EOId5JBj3qLdZ14a/QvWs=;
        b=A+BOWQfr+GHxiyky3FGgeGI42YGjsE2iWDptOAvatoeyB9b+yQTLOul0n5laPGqlbe
         A8piGSB5NYg/4Mx8w+5UKEgUuUDPNeVCoiivRVSTZ+v7IQJABI+rxTTv9og6rk9YteNK
         46KvaNjHzhJc+JNV46ND6MLRLfneU7Bq3if2AEqmq4uvB1qBgpwg4/LiW9UpX2cF/WJG
         zRrKF8HL05kapczSgtl+WiYryLavK86jPzLVFl7Pt6cIk5zN7kyYrvTXie5dEcjDEerw
         B0xxdzXGaCXRdKnoJ2HGdD4lI8QQ02xOFPnp/IoUPQ0/13E6ecEHNzIP8y8jALv0Fp76
         p3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d4qo3fGXZQy+8oZhU7cu78EOId5JBj3qLdZ14a/QvWs=;
        b=kn2kPu4mFORXz3SU+Q0KMHiQUufD2W9nRoXx2L0CDc39bJWWd2nGOeTQuX3RO17UtH
         1xwqsENRtsIZ2m8Sf0Crh+j3bfpvx4xAJTsZ49UObjbv8F0HVOZjGgG+5yu9rBzym9Yk
         OnN6DTcjRLkAS5cqn/3udBRq93i3GXVJAht7yWiII7yYufA9ddyTz15Ud61vQr9wMekk
         fZ/l250oSO1oCDXWQgrtBc6LZ4d4VgL5dW7YzPE2tnt86GVF+YqxKH+NhPT2j5YdPd5t
         VcbLaUfXuSFhs1/kENMa9YieUh7oKXOD2cdMk5bcrDpfqwg4ceYx6bJj4ZwFapF0fgra
         iavA==
X-Gm-Message-State: ANoB5pkOZhhglYIrKRy3UhpPa0ovE/jNAfFT/F8aRUQntFstDS/K7WIx
        WKp6BFgqmUA5UL8PNQMA9Bf8hw==
X-Google-Smtp-Source: AA0mqf7YzWyH2VU2YnkG3jnX1ifCWu9zwuLgz/9nZTRc2x7pdPbOoX1z9PpmE2lNj2LlqmhLHx0DGA==
X-Received: by 2002:a17:906:2302:b0:7b9:de77:f0ef with SMTP id l2-20020a170906230200b007b9de77f0efmr1476436eja.5.1669188747005;
        Tue, 22 Nov 2022 23:32:27 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id g16-20020a170906539000b007b935641971sm938539ejo.5.2022.11.22.23.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 23:32:26 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 23 Nov 2022 08:32:26 +0100
Message-Id: <COJI0ZYCXF71.26IIP7J1SRHDZ@otso>
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Georgi Djakov" <djakov@kernel.org>
Cc:     <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>
Subject: Re: [PATCH] interconnect: qcom: icc-rpmh: Fix an error handling
 path in qcom_icc_rpmh_probe()
X-Mailer: aerc 0.13.0
References: <ec929c37c655ede7bb42e426354093c8a1377a0b.1668947686.git.christophe.jaillet@wanadoo.fr> <COHSZZ9A5570.1P4NTXRE9IRZR@otso> <253d4aac-62af-15af-90e7-a3cd4bacba92@wanadoo.fr>
In-Reply-To: <253d4aac-62af-15af-90e7-a3cd4bacba92@wanadoo.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Christophe,

On Tue Nov 22, 2022 at 10:45 PM CET, Christophe JAILLET wrote:
> > I believe the same needs to be applied to icc-rpm.c.
>
> Their are other issues in the error handling path of this file.
>
> 1)	if (desc->has_bus_pd) {
> 		ret =3D dev_pm_domain_attach(dev, true);
> is unbalanced, both in the error handling path and in the remove function=
.
>
>
> 2)	clk_bulk_prepare_enable()
> is not balanced in all error handling paths.
>
>
> 3) the same issue about error handling if of_platform_populate() fails.
>
>
> These issues have been introduced in different commits.
>
>
> Would you prefer several patches, each related to a given Fixes: tag, or=
=20
> one bigger "fix all error handling paths"?

I don't really have an opinion on this, I guess if the issues were
introduced in different commits, make separate fixes?
If it's the wrong way somebody will tell you anyways ;)

Regards
Luca

>
>
> Anyway, fixing the points above would require moving some code around.=20
> Usually I try to avoid it, because it is not always easy to see=20
> associated side effects.
>
> CJ
