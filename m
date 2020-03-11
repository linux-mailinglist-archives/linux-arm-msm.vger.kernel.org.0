Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7391825CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 00:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgCKXZs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 19:25:48 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41772 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731417AbgCKXZp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 19:25:45 -0400
Received: by mail-pf1-f196.google.com with SMTP id z65so2219845pfz.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 16:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=chyavRIYqqg/mT1hVMLjimyfJ88wTwSB8SQE5bJSCcg=;
        b=FDuOKRQ4jYAowPTrfkqbWPNwLC7ne85VH2TIBW4KS2PmvN2f6LhHAIPRx3ZI8cJWyc
         l4865PDFEMva7cIi8Zt5qHizgX8lFeYT5H30cNNZ8/WeEXOONjMQI4utYiRmU1VIZixr
         QA+8hVzyQYT9CfKVouR7a6z9Bf+kwLRUrAq2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=chyavRIYqqg/mT1hVMLjimyfJ88wTwSB8SQE5bJSCcg=;
        b=Bg8PurP2aSOSYP3EyrfGrvtkQetwkq/dWymA1k8S2DPPa0Iq/FbA9/bdTA1HJs1l33
         PY4xa04fTYJAPgRz2kYpIWRF91L9Om5n+46s2eqxByjzubO0bj0wMcs5Hw1g9BlrQyuk
         MZxH6QKvbIEDUEkRXbiAONUOHeSuKDZzCKwLFpo9ZU4v/jtnbDqWyjX7psy0cv0nAjgu
         TREs6CUC8aoKVB4G6UV5uVTq9CcfP9df0ZZUkEgRUyk4D6NmqY8KiRXPJVheJ9Mhhq8P
         vTtPVo2zvIQoXQF66IXSDMRqsLmpwrI5BySEgo1uxTjodONB5sqXyz+Y9DDWhzwMdngL
         VSCQ==
X-Gm-Message-State: ANhLgQ2XuRWQafFjHKpXoX0CeFAaA23rj8+buUBxhgv/YDNewEL9ahT6
        31/drKe+OWPz7MPfr40iA0iKXA==
X-Google-Smtp-Source: ADFU+vv2rgEtd5LEvteUH15nHk8MoZckTyu4sc5oAWNh51o+qVCUk8hdHGfWn2+RI0sNiXgdi5lb8g==
X-Received: by 2002:aa7:92da:: with SMTP id k26mr5126575pfa.139.1583969144060;
        Wed, 11 Mar 2020 16:25:44 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w128sm50656459pgb.55.2020.03.11.16.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 16:25:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310212728.GQ264362@yoga>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org> <20200310063338.3344582-3-bjorn.andersson@linaro.org> <158387214232.149997.3935472981193001512@swboyd.mtv.corp.google.com> <20200310212728.GQ264362@yoga>
Subject: Re: [PATCH v4 2/5] remoteproc: qcom: Introduce driver to store pil info in IMEM
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Date:   Wed, 11 Mar 2020 16:25:42 -0700
Message-ID: <158396914211.149997.8114928596665644267@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-03-10 14:27:28)
> On Tue 10 Mar 13:29 PDT 2020, Stephen Boyd wrote:
>=20
> > Why can't we search in DT for the
> > imem node and then find the pil reloc info compatible string on the
> > first call to this library? Then we don't need an API to see if the
> > device has probed yet (qcom_pil_info_available)
>=20
> I think this sounds reasonable.

Great!

>=20
> > and we can just ioremap
> > some region of memory that's carved out for this reason. Forcing
> > everything through the regmap is mostly adding pain.
> >=20
>=20
> My concern here was simply that we'll end up ioremapping various small
> chunks of the imem region 10 (or so) times. But I agree that things
> would be cleaner here.

Alright. I'd like the ioremap() approach. ioremap() will "do the right
thing" and reuse mappings if they're already there and overlap in the
page. So it's OK that the syscon/simple-mfd exists and makes a device,
etc. etc., but we don't need to care about it. We can just ioremap() the
area and not worry that the regmap users may have a mapping to the same
place. This is a dedicated carveout inside IMEM so we're safe from other
meddling users.
