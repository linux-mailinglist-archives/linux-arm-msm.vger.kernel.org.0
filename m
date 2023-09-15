Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 965047A26C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 21:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236891AbjIOTAt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 15:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236990AbjIOTA2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 15:00:28 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE0DF2130
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 12:00:19 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d7ecdb99b7aso2398238276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 12:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694804419; x=1695409219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MA+IH6vFDWnj8CWBjAETZZSe18NWdBhZ5Y5deFFzGMI=;
        b=L99HJwtiSHN98t1F8KNkQkA0O49wol0PE46W00Ae0kkcMhkacRR4q3flBqZpl1b4Cd
         /3Z9dkuoCBg9OPrAo98chVHT2OnU4EoznuCn8HSpNJGHxNRII3ztyG6rQfpfD5GBSh3a
         l7mXkkyEhYeJY2ss/ms6SvU1P94I2ZJ8hXqv9g3FI3aRPryg7DhlSB5Kq/n2YJ6C/CW/
         1m6YFd9N/JloDi5nE2wb++PTZ+jS69OKoXc+e1ItOBgGpmySOkro0SfSsc1AOzYLJ/va
         Vb9qlXiUGdoklbc6P566J2hqd5RdA7nshQiUlh45BKB4KL6VE6XlActlbkFYv4a2IoSm
         vO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694804419; x=1695409219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MA+IH6vFDWnj8CWBjAETZZSe18NWdBhZ5Y5deFFzGMI=;
        b=SEozCWZPo6URAsDojq33jBxNDXeWfYJj87MnMjknVUKEYpQekLyLNIzBpXUiMJTppl
         Xjnh0rtPdVGka45zUIVhrqv0HYlmF8vbfmIF/TeWKkSemolSa0hTC8BZBNk1mpLaxZ+X
         mqW53z4WE/EUrVQKBOfS7gIuaZO5aL1OKLNNZNzX4imxtOSaoSwydLRlFqL2TSGBEKgO
         WxjQw53SkvXd7b4DejS3uqmzz4UlaPLCXpRyeQJEOm6CYwmUIK0TVxSMPsAXuUKDFDoJ
         5mlPlcyAUsQPyJTtquG3RTTSvskV+N57iLJ+PNYJtpbdUbjQO8GDTHEUgSsQmtbVb8G1
         fP7A==
X-Gm-Message-State: AOJu0YyadXh/NguQRHU6Foyuub4+QVWviLZWMPG+zabgE9M2JboQ8+BU
        rlGVp3S+L3m4LbjFu6M0hcFjV+V4es3vbQLMxEWNkV4mfd4RPAi0+opDzJAQ
X-Google-Smtp-Source: AGHT+IHloveln5I1HrqkenFE7vzYh2eTD6d1bJyya94I6qr4dXlqjiJXzTSkEB8jv6T0Pz0Y9YYlZe8PfZm3J0clBh0=
X-Received: by 2002:a25:2547:0:b0:d78:878d:e1e1 with SMTP id
 l68-20020a252547000000b00d78878de1e1mr2274459ybl.50.1694804418847; Fri, 15
 Sep 2023 12:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230914065422.5452-1-otto.pflueger@abscue.de>
 <20230914065422.5452-3-otto.pflueger@abscue.de> <72e24711-f485-46ce-bbda-db3043d84bcc@linaro.org>
In-Reply-To: <72e24711-f485-46ce-bbda-db3043d84bcc@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 15 Sep 2023 22:00:07 +0300
Message-ID: <CAA8EJpq77L9aviGQ0hJRB9OxC2oswM0HjL6WwCUx7caYoepigw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] pmdomain: qcom: rpmpd: Add MSM8917 power domains
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 Sept 2023 at 16:41, Konrad Dybcio <konrad.dybcio@linaro.org> wro=
te:
>
> On 14.09.2023 08:54, Otto Pfl=C3=BCger wrote:
> > MSM8917 uses the SMPA2 and LDOA3 regulators provided by the PM8937 PMIC
> > for the VDDCX and VDDMX power domains in voltage level mode,
> > respectively. These definitions should also work on MSM8937.
> >
> > Signed-off-by: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> > ---
> Would you mind picking up the RPMPD part of [1] and integrating
> QM215 and MSM8917 to use the new bindings?

Please, no. That patch was dropped in favour of [2], which doesn't
include RPMPD indices.
And it's good, since we can introduce logical 'default' ones instead
of the ones proposed in the [1].
I started working at making generic RPMPD indices, but I haven't sent
the patches yet.
So, I think, this patch is fine.

>
> Konrad
>
> [1] https://lore.kernel.org/linux-arm-msm/1688647793-20950-2-git-send-ema=
il-quic_rohiagar@quicinc.com/

[2] https://lore.kernel.org/linux-arm-msm/1689744162-9421-2-git-send-email-=
quic_rohiagar@quicinc.com/


--=20
With best wishes
Dmitry
