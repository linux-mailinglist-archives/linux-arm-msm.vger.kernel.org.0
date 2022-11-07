Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6304961EABD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 06:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbiKGFzm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 00:55:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiKGFzl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 00:55:41 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC736BCB2
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Nov 2022 21:55:40 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id bs21so14603338wrb.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Nov 2022 21:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hHO9LGTR6tWq8NtHbmt7CuQkGK66YEpPE/913FcVM5M=;
        b=Hofmv0zDOLo0a4Zw0r6u3YN8H2rV16cZKG+zGX3Epy8VMHUxnW43c6iXukitDgwjE4
         lbqN6wnC2FO/kZ4KUpUxrBqB7y1sSiBkT3sQlGej8fimI5HEnv/qYWSRVVDe9qs5Sn0C
         N2P6tNLDPP55kDBtNVbZUBBBRIXGJOBySi6uffBk0McMq7qu3/qNHAVmLu7b5NiN8SWk
         rm1kxSQNRpvoQTph7oc0gA04eTQ22zFHZcEayVbosR2JkdgCKUKp/YKORiChAW9Ka3Ml
         fKeK4zTG1uIzUpgDKKUBFnK+RBcivc9eKTF9Mw6SUe3nw/pt1sx/N51ydd+WUxPptxR8
         52lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHO9LGTR6tWq8NtHbmt7CuQkGK66YEpPE/913FcVM5M=;
        b=5r94fZ1J/VVuK3oKyNSZvyFr6jHJz6H2O1C30WHWscZLKaFLynIR7qw7ZXxHPEFEHp
         GrQzaOt+p8EsH3P1TmGGgxrmLFVV5lfTfcn+C5pBPRVqopsvxjoHT08RIa5kp5z6VamN
         ry5G6eOi6jVfaJX/Ga16ayr/JKHNEFHjiAtg7qSX9A/LbWY+zulumn73nBewav/1cysM
         TTM7zqMBZDKoUoF41JfS/PcPonxqx/qRxhBuHF49LubMRbfMu0lp559DoXQJo6i9E01a
         /s7mNRojrjm5hlDDNtTWfAcg4iTmYMbLfXu+dOp+QL2VwjoWB/hKQ2AwPK6bXl8Pu2HD
         jZXQ==
X-Gm-Message-State: ACrzQf1exZS46aCpd2Bt6ug8pWvuvwn+exT9cYXMnKXMQ+3kRnh6Q6sO
        nobAXiQjI3/G3k2MgNX0eJti9cmQlr26CWZstfmpSA==
X-Google-Smtp-Source: AMsMyM7YU53wuOj3Al9itahb0c1Sn/w3ao8y3N4HKjrzoG3VhuXdl0qJDcDkvfHl6CcrXLplCzRQUL1Uwfxlezj4aUk=
X-Received: by 2002:adf:fa83:0:b0:236:a97d:693c with SMTP id
 h3-20020adffa83000000b00236a97d693cmr29467043wrr.108.1667800539251; Sun, 06
 Nov 2022 21:55:39 -0800 (PST)
MIME-Version: 1.0
References: <20221027115745.240516-1-ulf.hansson@linaro.org> <166779074268.500303.10369639779721394913.b4-ty@kernel.org>
In-Reply-To: <166779074268.500303.10369639779721394913.b4-ty@kernel.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Mon, 7 Nov 2022 11:25:02 +0530
Message-ID: <CAMi1Hd3rE+r4vMdBy_LxQEbAKaXRYntje==eiO8cxkgSU9jXdw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Disable the not yet supported
 cluster idle state
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, ulf.hansson@linaro.org,
        konrad.dybcio@somainline.org, dmitry.baryshkov@linaro.org,
        sudeep.holla@arm.com, quic_mkshah@quicinc.com,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rjendra@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 7 Nov 2022 at 08:43, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Thu, 27 Oct 2022 13:57:45 +0200, Ulf Hansson wrote:
> > To support the deeper cluster idle state for sm8250 platforms, some
> > additional synchronization is needed between the rpmh-rsc device and the
> > CPU cluster PM domain. Until that is supported, let's disable the cluster
> > idle state.
> >
> > This fixes a problem that has been reported for the Qcom RB5 platform (see
> > below), but most likely other sm8250 platforms suffers from similar issues,
> > so let's make the fix generic for sm8250.
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] arm64: dts: qcom: sm8250: Disable the not yet supported cluster idle state
>       commit: 5c7fa5de12a31c1425cc87ba2ef27e6ae0a1788c

Hi Bjorn,

There seem to be some error while applying the patch "arm64: dts:
qcom: sm8250: Disable the not yet supported cluster idle state".
This patch is already applied in your arm64-fixes-for-6.1 tree
(commit: cadaa773bcf161184fa428180516bae33a7bc667)

The new commit: 5c7fa5de12a31c1425cc87ba2ef27e6ae0a1788c,
however, disables the Big cpu idle state instead. I'm not sure if that
is intentional though.

Regards,
Amit Pundir


>
> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>
