Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC39A08FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2019 19:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfH1Rwq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Aug 2019 13:52:46 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43967 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbfH1Rwq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Aug 2019 13:52:46 -0400
Received: by mail-pf1-f195.google.com with SMTP id v12so257543pfn.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2019 10:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=Px8LkhnvRWF4dwuD/m3pQWcRskg4hOcGMoEJQEofQZ8=;
        b=b8Su07oogeUnBWJ/0tg5akVGMO8eE2d43UCFFCgBPKGffQgjBkuv7y3A9eC/T4EjRA
         i7cHOOuL3iwYyhXeVmkunHv4h61+Sh5KbLMZW3NkZo6fBsNGuzL8yykC9A1ECMrI54y1
         ORagwvll1OSa52p8t4TebQyKcuNvQJi3NpzNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=Px8LkhnvRWF4dwuD/m3pQWcRskg4hOcGMoEJQEofQZ8=;
        b=ZTg3metEz4nBHUGRfZt1Vxeb8NdVTyZTjl1YN2s/OAnEk7TQt1+yjixN0IEBR8u3Dm
         HhXF9TcreXhFRxh/dw+OrwLjqfAluWRp6zakxIndFqbDcE1kjQml+bXArqLTfTIKiGjH
         U1UCMHWq7O4m/PNUa7lX2MVIEORUVxvbafEPl2p1SW0lkzG5ckxDNREqla5NgtQy8vNk
         5qAeW2/dJQ+yQmep1iiLfh2yeN5n4BcyDD3ujNKFcicL03sF78J3cM1JZUyrn6uimrxC
         0u5G6EhNXcnP6p3I8lmBMsLiGyozB81WeXmW8kSj3iXaUak9ewm4wQXhHbLXiHMUrG2t
         UcZA==
X-Gm-Message-State: APjAAAVZCLbSm8jinDbJl1VXpv++zjdjjPFA16cm2KE4aYFMnsKKCoWF
        T0xEyNbokjIDDhDS4rIUlYgMfw==
X-Google-Smtp-Source: APXvYqxCTQjvm1BM9NXD/WyFjJvnpm9d045wXvVon/BZtschRXgyy8tL19nyMEwFqWDkx1/sIvisKw==
X-Received: by 2002:a65:6815:: with SMTP id l21mr4618991pgt.146.1567014766012;
        Wed, 28 Aug 2019 10:52:46 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e21sm3512214pfi.13.2019.08.28.10.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 10:52:45 -0700 (PDT)
Message-ID: <5d66bf6d.1c69fb81.c7b73.8fdb@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190822102723.GB8494@centauri>
References: <20190725104144.22924-7-niklas.cassel@linaro.org> <20190819100957.17095-1-niklas.cassel@linaro.org> <5d5ae389.1c69fb81.cb730.3225@mx.google.com> <20190822102723.GB8494@centauri>
Cc:     Andy Gross <agross@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
        Nishanth Menon <nm@ti.com>, Viresh Kumar <vireshk@kernel.org>,
        linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org,
        bjorn.andersson@linaro.org, ulf.hansson@linaro.org,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/14] dt-bindings: cpufreq: qcom-nvmem: Support pstates provided by a power domain
To:     Niklas Cassel <niklas.cassel@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Wed, 28 Aug 2019 10:52:44 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Niklas Cassel (2019-08-22 03:27:23)
> On Mon, Aug 19, 2019 at 10:59:36AM -0700, Stephen Boyd wrote:
> > Quoting Niklas Cassel (2019-08-19 03:09:57)
> > > +
> > > +soc {
> > > +....
> > > +       cprpd: cpr@b018000 {
> >=20
> > Maybe node name should be 'avs' for the industry standard adaptive
> > voltage scaling acronym?
>=20
> I see where this is coming from, but "git grep avs" gives a single result.
>=20
> Also, since the label is cprpd, it doesn't make sense to simply rename the
> node name, and I don't think that avspd would be a good name, since it is
> less correct.
>=20
> So if you don't insist, I would prefer to leave it as it is.
>=20

How about 'power-controller'?=20

