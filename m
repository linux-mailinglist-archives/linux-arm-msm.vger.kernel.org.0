Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0813BFD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2019 01:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390599AbfFJXVt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jun 2019 19:21:49 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40973 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390594AbfFJXVs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jun 2019 19:21:48 -0400
Received: by mail-pg1-f195.google.com with SMTP id 83so5817694pgg.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2019 16:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:cc:subject:to:user-agent:date;
        bh=plP4lWzyc7KaP3+pJsQZD0STOQAjwlX5Lih5GcMmDJ4=;
        b=Ia88klZiLqqn+j77ynmisXpWoRAoBA5Tnwyh4ijmhp1xxV5oj/ZHXH5U4RrplyPA6+
         Z+mqWkKamnG/AIiu28TZklif0bd8WbDTYKsy8jZzAna1LBBoyo+m03ej5AWiXoXSyVSa
         NFATkigEqY6q686cS9NUJNWt83mNDeVPPI5x8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:cc:subject:to
         :user-agent:date;
        bh=plP4lWzyc7KaP3+pJsQZD0STOQAjwlX5Lih5GcMmDJ4=;
        b=CndYai1+si88Hv0UqWvivhrzsZDzMFoYPpVavHN+D60CPYI1N8M7c+3SJomd/RJJR+
         k4sjnX/8MCdEWegdgprqWoI2dOB7/lO/lyhx83puQ8fWCIlIh8K3jx/bDeIaw4cTIzL/
         WGE7L4HIFxipHA16W5OL16xwJpMq461P2CsRLVwZ6u3OraA1zRWpPicVtAxPLrDXtddE
         fXTlNEeunfj4XjPkqdDFBk1sFlDasvSP8STyeVTz531LmCVfPA+LB7IMi4UK3Ka9KqU2
         BRaPH6X5tIg8Sz46MDv4dlYENqnlMN9BAKz1QPvP2PxxLQKUqDlDcYoUvu0uI4JAANhc
         jo/w==
X-Gm-Message-State: APjAAAWzMhYuuRa5k5ih9rinBKRLpDuIzGULhz7MVlq5mxHamr4O0GxA
        80UF5Tk6HGOfk685/JrDRQn6/Q==
X-Google-Smtp-Source: APXvYqzSvKTSLb5deeAUwGfek6GUKMKTsYrNks5Xjyq7zYVzKqmuGUE+s2P4LvkW270Mqa8KPtKdcQ==
X-Received: by 2002:a62:2ec4:: with SMTP id u187mr75848316pfu.84.1560208907972;
        Mon, 10 Jun 2019 16:21:47 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c6sm18136367pfm.163.2019.06.10.16.21.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 10 Jun 2019 16:21:46 -0700 (PDT)
Message-ID: <5cfee60a.1c69fb81.584d9.cf12@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAFp+6iE8FUXxexKbYy=ak+se-pj1XXUZxTu5o=hJvg66V6+Rzw@mail.gmail.com>
References: <20190604222939.195471-1-swboyd@chromium.org> <20190604223700.GE4814@minitux> <5cf6f4bb.1c69fb81.c39da.5496@mx.google.com> <CAFp+6iHZeawnz7Vfk3=Oox-GN_y6c-E9wMwc-qdp1bTOXgqjFQ@mail.gmail.com> <5cf82c6f.1c69fb81.9e342.dbda@mx.google.com> <CAFp+6iE8FUXxexKbYy=ak+se-pj1XXUZxTu5o=hJvg66V6+Rzw@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add iommus property to qup1
To:     Vivek Gautam <vivek.gautam@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 10 Jun 2019 16:21:45 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vivek Gautam (2019-06-06 04:17:16)
> Hi Stephen,
>=20
> On Thu, Jun 6, 2019 at 2:27 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Vivek Gautam (2019-06-04 21:55:26)
> >
> > >
> > > Cheza will throw faults for anything that is programmed with TZ on mtp
> > > as all of that should be handled in HLOS. The firmwares of all these
> > > peripherals assume that the SID reservation is done (whether in TZ or=
 HLOS).
> > >
> > > I am inclined to moving the iommus property for all 'TZ' to board dts=
 files.
> > > MTP wouldn't need those SIDs. So, the SOC level dtsi will have just t=
he
> > > HLOS SIDs.
> >
> > So you're saying you'd like to have the SID be <&apps_smmu 0x6c3 0x0> in
> > the sdm845.dtsi file and then override this on Cheza because our SID is
> > different (possibly because we don't use GSI)? Why can't we program the
> > SID in Cheza firmware to match the "HLOS" SID of 0x6c3?
>=20
> Sorry my bad, I missed the overriding part.
> May be we add the lists of SIDs in board dts only. So, cheza dts will
> have all these SIDs -
> <&apps_smmu 0x6c0 0x3>   // for both 0x6c0 (TZ) and 0x6c3 (HLOS)
> <&apps_smmu 0x6d6 0x0>   // if we want to use the GSI dma.
> and
> MTP will have
> <&apps_smmu 0x6c3 0x0>
> <&apps_smmu 0x6d6 0x0>
> WDUT?

I'd prefer to fix the firmware so that the HLOS SID is used even on this
board. Making Cheza use something different from MTP doesn't sound so
good. Do you know how that works? Is there some configuration register
or something that I should be looking for to see why the SID is not the
HLOS one? It's definitely generating SIDs for the TZ SID (0x6c0), but
I'd like to make sure that we can't change it because it's tied to some
hardware signal like the NS bit and/or the Execution Level. Hopefully
it's a config and then our difference from MTP can be minimized.

As far as I can tell, HLOS on SDM845 has always used GPI (yet another
DMA engine) to do the DMA transfers. And the GPI is the hardware block
that uses the SID of 0x6d6 above, so putting that into iommus for the
geniqup doesn't make any sense given that GPI is another node. Can you
confirm this is the case? Furthermore, the SID of 0x6c3 sounds untested?
Has it ever been generated on SDM845 MTP?

If we ever support GPI, I'd expect to see something like this in DT:

	gpi_dma: gpi@a00000 {
		reg =3D <0x00a00000 0x60000>;
		iommus =3D <&apps_smmu 0x6d6 0x0>;
		...
	};

	geniqup@ac0000 {
		reg =3D <0x00ac0000 0x6000>;
		iommus =3D <&apps_smmu 0x6c3 0x0>;

		i2c@....{

			dmas =3D <&gpi_dma ....>;
		};

But now I'm worried that the geniqup needs the proper geniqup wrapper
clks to talk to it. Most likely the GPI is embedded inside the geniqup
wrapper and sits right next to the bus to do bus DMA mastering. From the
DT side, it means we should either put it inside the geniqup node, or we
should add the wrapper clks to the GPI node and hope things work out
with regards to clks and shared resources being used at the right time.

If we're left with trying to figure out how to express the different
SIDs depending on the CPU execution state then it may be easier to push
for GPI upstreaming and use that dma engine to "fold" the SID
numberspace into one SID for the GPI. This would avoid having to deal
with the HLOS vs. TZ SID problem by adding a whole other driver. Or we
could just rip out the non-GPI DMA support in this driver because the
SID is all confused.

