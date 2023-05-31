Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54EF371805F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 14:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235769AbjEaMxm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 08:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235610AbjEaMxl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 08:53:41 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2586137
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 05:53:16 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-75b00e5f8e4so374718285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 05:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685537580; x=1688129580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0TxZzMFhUW6EK3EfijtxNMkn19A+hW/wHqn+hpRZCY=;
        b=MtLNmt3no49LCTSM1LjBfXXPMvTqUfLggcb6S6zkt5c9bh8bNgEouxDIAwzkMTYBus
         E8IGuQOwdYyMcV883jHgItdVnV9Qc3TFGPuA6x4xAphe27i8zm2IetqMxHP/cO2+Armt
         +Md2RJI/z6IqxVemQrnXVhbb9/W/jWeL2a5PFE45FiThK0b68BlCEGi74MYs+0kCPpQ4
         BOMxdon9j6c6OtpKfYGr+/gd+UhLWF/S98BXJqaQ4gwToGZbUlxAgN1BnfcpmoCzXXXd
         gsOnJtY6NuesokhuY6ADovg99hhG2zLngIyALKsPsh7juyEqoUT5luN4ldItMlvrQ9Xf
         gEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685537580; x=1688129580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0TxZzMFhUW6EK3EfijtxNMkn19A+hW/wHqn+hpRZCY=;
        b=j8MmpnIgmkGJ1CHbCLHUX4/g3fhslqkK7OwdRzO/NDR8eiKFLbDxlQnVN1W22t2PVJ
         A8gtsOKGBVEC9fNwLiLg7rRyyPbRcaLyZnhIPBOkjGZlWombfQ0GWVd8G7fYVfsEAof5
         rPupCjrTzYslgR7qAO3j8wk/bIph6G3WuwffwHRDDm5h7UXvBY387G3oexYa3nWzYxF2
         HYRoVREiv96E80XqX5t8yKSxR81M9Uh+eXIy711RBk7OdBA7kFgKSiuven2csLXsSEn2
         6e9xLQDYqF78iHg+d/++72dV7zysF7ZKE2RQErOqVUB21NnM/qX+pDfh5dHp5TfwCvau
         x/4g==
X-Gm-Message-State: AC+VfDwpObyvu3LDkrqUuZ/kaVKB+5saMRKmP5mJGe4NQ9dl+8K2IEm1
        /Vs+mIg0k5XGwXdr5ASA2gEDId3Ap2n5ojGWOA/MQQ==
X-Google-Smtp-Source: ACHHUZ7TdnGwln0PAM7flRk2Huqkg2MsIyo8dvBcVrZ9XC/m/aoYvlL6K+/0NaYwgC7HjKmJmgIiZJvp+iGqqZ61j60=
X-Received: by 2002:a05:6214:21ac:b0:625:aa1a:9382 with SMTP id
 t12-20020a05621421ac00b00625aa1a9382mr5116731qvc.62.1685537579889; Wed, 31
 May 2023 05:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230324063357.1.Ifdf3625a3c5c9467bd87bfcdf726c884ad220a35@changeid>
 <CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZsw5edb-NtRJRw@mail.gmail.com>
 <552345c5-b1e9-41f6-f275-b6eeeb51df25@linaro.org> <CAMi1Hd05z8uBotO4vs7Ropmt7W2gSA__tTu_=X1t0mze7bXrhg@mail.gmail.com>
 <CAD=FV=VSFDe445WEVTHXxU1WS_HGUV5jR5E8_Vgd4eyhn3rHyA@mail.gmail.com>
 <CAMi1Hd28FJUjB8A-9YF7xpKOzSyNWXX3qung4aDjpLBhOvw_eA@mail.gmail.com>
 <CAD=FV=W13L0H88G1gt8qRnXfpV-_7E9QfHufN_a23_B1bb=aww@mail.gmail.com> <04f5501a-03ff-4ac9-9355-ad17281350b1@sirena.org.uk>
In-Reply-To: <04f5501a-03ff-4ac9-9355-ad17281350b1@sirena.org.uk>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Wed, 31 May 2023 18:22:23 +0530
Message-ID: <CAMi1Hd241j1_3d5eUjrnKFeV_h-KUWEJOj4byPnjaJufB2T1yQ@mail.gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Revert "regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"
To:     Mark Brown <broonie@kernel.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 31 May 2023 at 18:00, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, May 16, 2023 at 02:24:06PM -0700, Doug Anderson wrote:
> > On Tue, May 16, 2023 at 11:12=E2=80=AFAM Amit Pundir <amit.pundir@linar=
o.org> wrote:
>
> > > Tried out a few changes today but none of them worked or were
> > > effective enough to debug this crash further, other than setting
> > > fw_devlink=3Dpermissive.
>
> > It still feels to me like _something_ is happening at the same time as
> > the RPMH regulator driver is loading, though, I'm just not sure how to
> > suggest debugging it. I guess other thoughts:
>
> This discussion seems to have ground to a halt with no resolution so it
> looks like the best option here is to apply the revert unless there's
> some progress happened off list?

Sorry about that. I got stuck at other things. I'll get back to it
this week. I'll try to change the module loading order and test run it
to check if that helps.

Regards,
Amit Pundir
