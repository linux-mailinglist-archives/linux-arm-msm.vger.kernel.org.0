Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B79201339A7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 04:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgAHD12 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 22:27:28 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41694 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbgAHD12 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 22:27:28 -0500
Received: by mail-ot1-f67.google.com with SMTP id r27so2203867otc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 19:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xceLEnO3BCgE8gw6ehmf7oIvMEjYUFeqhS/nKgWDqFI=;
        b=csH6h22WfZnD1xkdgwOCne3Jv32LmlbUzVEaLBevEMe50H5rAy4ECEVfBiovZy8xDu
         b6pHK8e06WX+imuJ6fHw26HY714lCwLnbniIGh5DWXQQ+ipOUvm0uHPExjCoeL58F4te
         MCDUDMy2u+PUNUzChxap4ixBAdfsjM/rm0ovA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xceLEnO3BCgE8gw6ehmf7oIvMEjYUFeqhS/nKgWDqFI=;
        b=NNOUlyeYvZ4LqWS6rdlJMWNF1vA0qPMxKa9fUBgBoF+tGH3HnDe5T8sjzSDJ0Fj88g
         L/LDQqAcKV3BnuVEJfQ+ytPS5I6RtWwZnZ+iHdvA0ORljP/nd4/yVdjWlqHbEIQf5tq4
         m7VIBBCVgvRSbHWlcTAWS+4Ti1KmP2I5Vq70zFhhntGTzwltT/Y/ikOj56G9CI81xFdp
         7tqpjhDZDNpQO8jB9Dc89UplvHEf9bVw52/WoGGcsBkAc0XhBR3Wil+I/p+tGxsl4moA
         KOMDfRUP+QrNL0jivX1un5Ax8FgOQGdhS1a2NdH+XwkB21Ky9dTcxHj4d0htzvp0qKft
         mWeA==
X-Gm-Message-State: APjAAAWCpRTbFM58JPpBjZWxlhKg034SiWl758waxKfDav1/i6AQ1HPo
        LcYRfiYx4oEKFMp0xwMbfQT8jblZFEn0aA==
X-Google-Smtp-Source: APXvYqwioBEARHiFMFHA4o1m2n6X5JrlvA14CZI4TOs5WZH1uiO8F58uwoD1/OQ/UCY27cHg+4Sx0Q==
X-Received: by 2002:a9d:4d86:: with SMTP id u6mr2522316otk.42.1578454047641;
        Tue, 07 Jan 2020 19:27:27 -0800 (PST)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id h1sm636636otm.34.2020.01.07.19.27.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 19:27:27 -0800 (PST)
Received: by mail-oi1-f177.google.com with SMTP id p67so1415201oib.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 19:27:26 -0800 (PST)
X-Received: by 2002:aca:d0b:: with SMTP id 11mr1457408oin.71.1578454046328;
 Tue, 07 Jan 2020 19:27:26 -0800 (PST)
MIME-Version: 1.0
References: <20200107143402.122455-1-acourbot@chromium.org> <3aef91ea-30c1-530f-0c18-ea52b92347f9@linaro.org>
In-Reply-To: <3aef91ea-30c1-530f-0c18-ea52b92347f9@linaro.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 8 Jan 2020 12:27:15 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWY6OEc2EbPW=k8vFU32POamNs0FHJus8fg1u5A2uxrzg@mail.gmail.com>
Message-ID: <CAPBb6MWY6OEc2EbPW=k8vFU32POamNs0FHJus8fg1u5A2uxrzg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: add Venus firmware node on Cheza
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 7, 2020 at 11:50 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hi Alex,
>
> On 1/7/20 4:34 PM, Alexandre Courbot wrote:
> > Cheza boards require this node to probe, so add it.
> >
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 6 ++++++
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi       | 2 +-
> >  2 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > index 9a4ff57fc877..35ba65cd9822 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > @@ -1279,3 +1279,9 @@ config {
> >               };
> >       };
> >  };
> > +
> > +&venus_codec {
>
> We have similar patch for sc7180 and call it just "venus". Do you think
> we should shorten it here too?

Sure - sent a v2 with that change.
