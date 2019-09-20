Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 274B9B9A92
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2019 01:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437274AbfITXVd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Sep 2019 19:21:33 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46069 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407093AbfITXTy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Sep 2019 19:19:54 -0400
Received: by mail-pl1-f193.google.com with SMTP id u12so3870948pls.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2019 16:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=x3KkooxIJHeflg3Q/MEdAWrgYVbuQ7dU5z8XbMOS1lc=;
        b=QzLHfKdIn3q1t4ZF2RMzkmMjfTHq/FprJnnZJs3zYFU7y2qEoRaLlRN0Y7Jq0AdNAC
         PDfaWzDyVmNcPgDP160yRKk+6DjeC8GYQEpY8ACjMkLlsfsLOmx+dwv1tNluk5ekf3ru
         UgXwy6ysHSMAxJ7o+Uw8r0YgF2N9y5ueHmVKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=x3KkooxIJHeflg3Q/MEdAWrgYVbuQ7dU5z8XbMOS1lc=;
        b=rpsDU23vr8Jb4i0rhOYNqQh9eSInwp4QtzQG273/iduItXUmCDfDrBebu2UsDlM4wF
         ongkQBPczXlktSVZqa5IW+hPV7rjXie9g2OGHnP1A0WOON5pcH5xx/UwIwQDP3DhgAMn
         geO5MMSuAHyVGZ3UHOApELS7xjN/Iop03HhJ/Bb5FR12EcPQm+7TjRMh39+p5J+dH8Cq
         FQGJvJEkomrsKRT0OKHc4WjGV6wNPTpPZh6+aEZ9MXMTtyXVKQFGp9HUIbDuo9EMo1Xd
         m2Z4qdGksLXpZfBI6JKBFNaNBTY0xzqMEe9K1qnUWasr3+J7BurU6v9pQzOF42RikvvO
         L4Ew==
X-Gm-Message-State: APjAAAVRl+v4kd/Gabw3Njaiv+gaEf9Wp+tQyf7iCLPU8Nv1ocrhehoQ
        0InpzD4QSIr0Mv/QyFv/EtTXhA==
X-Google-Smtp-Source: APXvYqw+23bVFXVYDopNzEoteLtijFTF7+FHjQV5JUkx0GnkKnOeZTAyxgjw8he9IKiO6G9R5MvM2g==
X-Received: by 2002:a17:902:5a89:: with SMTP id r9mr18599724pli.206.1569021594105;
        Fri, 20 Sep 2019 16:19:54 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a4sm2720148pgq.6.2019.09.20.16.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 16:19:53 -0700 (PDT)
Message-ID: <5d855e99.1c69fb81.1d457.733b@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAHLCerNqsf1j4vsOPjdav8+UtXtGP55k6_==jjg1QeZ1qCX1RA@mail.gmail.com>
References: <cover.1569015835.git.amit.kucheria@linaro.org> <f627e66c455f52b5662bef6526d7c72869808401.1569015835.git.amit.kucheria@linaro.org> <5d854c82.1c69fb81.66e1f.96ab@mx.google.com> <CAHLCerPqEK2sSGGtDj85DH+qCzgtWi4ainuQv8BgQ3-Dgi93BQ@mail.gmail.com> <5d854e1d.1c69fb81.4f771.9391@mx.google.com> <CAHLCerNqsf1j4vsOPjdav8+UtXtGP55k6_==jjg1QeZ1qCX1RA@mail.gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Brian Masney <masneyb@onstation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v4 09/15] arm64: dts: msm8996: thermal: Add interrupt support
User-Agent: alot/0.8.1
Date:   Fri, 20 Sep 2019 16:19:52 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2019-09-20 15:14:58)
> On Fri, Sep 20, 2019 at 3:09 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Ok so the plan is to change DT and then change it back? That sounds
> > quite bad so please fix the thermal core to not care about this before
> > applying these changes so that we don't churn DT.
>=20
> Hi Stephen,
>=20
> Our emails crossed paths. I think we could just make the property
> optional so that we can remove the property completely for drivers
> that support interrupts. Comments?

OK. This means that the delay properties become irrelevant once an
interrupt is there? I guess that's OK. My concern is that we need to
choose one or the other when it would be simpler to have both and
fallback to the delays so that DT migration strategies are purely
additive. It's not like the delays aren't calculated to be those numbers
anymore. They're just not going to be used.

>=20
> That is a bigger change to the bindings and I don't want to hold the
> tsens interrupt support hostage to agreement on this.

Alright. I admit I haven't looked into the details but is it hard for
some reason to make it use interrupts before delays?

