Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38D6F926B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 16:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbfHSO1q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 10:27:46 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43638 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbfHSO1p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 10:27:45 -0400
Received: by mail-pg1-f196.google.com with SMTP id k3so1318500pgb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2019 07:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=g7SGcsmWT+FULooaq5UQl7DExj4a8uS1tyyXvhheNb8=;
        b=F7B++fDfMJYrpdYGvbFTT3qQ489MSEHBL6T0G9stCqDBOS8VcRefaYC4S/enADXJNp
         2F7T1EO3zH5+xq2vk+ia2joTDoly6PVLwI68tZno7FJxEBgHJER3kEIIiR5lkPiykppq
         seC2Gy5QwSdoWPsA3rGIVtNnVLONWrUaIwFJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=g7SGcsmWT+FULooaq5UQl7DExj4a8uS1tyyXvhheNb8=;
        b=YYCeWXLyChClgqjh/d6CMb1jRRh62IQpdqju6yzFmVQ9hsTMoS+FTQgHSzIoe1ove5
         cD2RC/qRJgn9VHDDdKU7mVOUlfJGR/lbedofhB7lfPliAz7KRYyR2+GEPGsIqVS1qqOw
         +rX6Mneo/xxJtjH4HAd9WU4+GHwhHBvEenULIh3wRCdZqGQyWTLkdwl8FkmVuQ389AVY
         zz7tMfL+am8lyZKnLix8vpnzdjRzRW//xtigYlfARQ79RVgNNj6eC8LWs9IuUsRlUFMl
         egUkDGMvsuqbx3D2dBNGRGdykNhhK138UCa4u1aVtnrE7Duaivd3Xu7txSGXp3QNDGro
         r0zg==
X-Gm-Message-State: APjAAAU+7q8SgdvNq5GvzCNIrRLL4BtLaJk+HHrMjy/38ycdV9FxfzEF
        6YDjAYPZZtTowZRqRtk8qLdutw==
X-Google-Smtp-Source: APXvYqw+w369yIhKY3a4m/3WUecsHdqBhBu/b547AgohkSVK8taH7VQIUqPLOrrbPcsiO761Bn7rJw==
X-Received: by 2002:a17:90a:650c:: with SMTP id i12mr20834840pjj.11.1566224865078;
        Mon, 19 Aug 2019 07:27:45 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id ay7sm13400421pjb.4.2019.08.19.07.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 07:27:44 -0700 (PDT)
Message-ID: <5d5ab1e0.1c69fb81.d71db.1ca3@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAHLCerMpWTVquyM3fYQxz-ZhDvnY276hfnZvZOmjV--cgm53UQ@mail.gmail.com>
References: <cover.1564091601.git.amit.kucheria@linaro.org> <534b5017c2210ba8d541c206dace204d6617b4c9.1564091601.git.amit.kucheria@linaro.org> <5d577d77.1c69fb81.b6b07.83e6@mx.google.com> <CAHLCerMpWTVquyM3fYQxz-ZhDvnY276hfnZvZOmjV--cgm53UQ@mail.gmail.com>
Subject: Re: [PATCH 04/15] drivers: thermal: tsens: Add debugfs support
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Andy Gross <andy.gross@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
User-Agent: alot/0.8.1
Date:   Mon, 19 Aug 2019 07:27:43 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2019-08-19 00:58:23)
> On Sat, Aug 17, 2019 at 9:37 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > > +
> > > +static void tsens_debug_init(struct platform_device *pdev)
> > > +{
> > > +       struct tsens_priv *priv =3D platform_get_drvdata(pdev);
> > > +       struct dentry *root, *file;
> > > +
> > > +       root =3D debugfs_lookup("tsens", NULL);
> >
> > Does this get created many times? Why doesn't tsens have a pointer to
> > the root saved away somewhere globally?
> >
>=20
> I guess we could call the statement below to create the root dir and
> save away the pointer. I was trying to avoid #ifdef CONFIG_DEBUG_FS in
> init_common() and instead have all of it in a single function that
> gets called once per instance of the tsens controller.

Or call this code many times and try to create the tsens node if
!tsens_root exists where the variable is some global.

>=20
> > > +       if (!root)
> > > +               priv->debug_root =3D debugfs_create_dir("tsens", NULL=
);
> > > +       else
> > > +               priv->debug_root =3D root;
> > > +
