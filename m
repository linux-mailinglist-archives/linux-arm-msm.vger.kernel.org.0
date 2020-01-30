Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0CAB14D669
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 07:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgA3GbA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 01:31:00 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44585 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbgA3GbA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 01:31:00 -0500
Received: by mail-pf1-f196.google.com with SMTP id y5so946023pfb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2020 22:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:from:cc:user-agent:date;
        bh=0tFsYcjfOOa4j0wNofi5s1JbHK10UxRY/7iGvUSf+kk=;
        b=KbnW8hcVBL+cjoPJI4C8c4WYYBRdr3lVrJlK+VN35PtAz96+RJuL/ELLxdLSp0mLQr
         U9iIpV6CcuvgD2XX6SiYM16zJwlenQUU/44+VCqojADOc8i5f1SrK9zHJA1yIoDzcTsb
         JyPMx/3lnzwjm2LBn+HJSPUK6x2NxxcpNjT24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:from:cc
         :user-agent:date;
        bh=0tFsYcjfOOa4j0wNofi5s1JbHK10UxRY/7iGvUSf+kk=;
        b=Yr/eoWs3oQMEcfpW/q5b7z2K+K/Z6udNuHe5LPSqArMsVE629dq0SW+gGRQLRnrpag
         WXrOV1k6O4EORJJQbRnIQtLHQUS8qGzaPmg31e1r47wacjMtL4oo56RuUv9nGzZ8x43w
         ni/po22UjamXyHEiYPkbCeDtYmtJZ44lPdyJRo8p8fSX+SE4I11hi1p4S1H2bpBqV9Cv
         OE1Ih0J9D1o7t+/fDIbaWuJv2SvW1Ui9eMl5s2WvJMinQPxrxarsY0EGcOOnIPk94Lg4
         ZzXXNcoX+mRaUhr4ZVXi2AM2h2vx5pkNPKap4DlKw2P+oMNWd4Xnyvqmq18yQtTo36EF
         /gSA==
X-Gm-Message-State: APjAAAUCUd53P/rS/VvASqXOAzdANE57crHOiaueRNCi4tgMC5MeV3Tp
        kPVUGRPGkn3B/ByYOwpgxjJGOQ==
X-Google-Smtp-Source: APXvYqxkoOSz3EElUiJyrS7XLxT4E2RrTKPRQZsLo3gTD8kEkuzwObe1rg6ylHw8yiou5ZegP9TqoA==
X-Received: by 2002:a63:e911:: with SMTP id i17mr3199910pgh.42.1580365859422;
        Wed, 29 Jan 2020 22:30:59 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id q12sm4862272pfh.158.2020.01.29.22.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2020 22:30:58 -0800 (PST)
Message-ID: <5e327822.1c69fb81.80136.dfc1@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202001271525.E6EB4FDD6@keescook>
References: <20200123160031.9853-1-saiprakash.ranjan@codeaurora.org> <202001271525.E6EB4FDD6@keescook>
Subject: Re: [PATCH] pstore: Fix printing of duplicate boot messages to console
To:     Kees Cook <keescook@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
User-Agent: alot/0.8.1
Date:   Wed, 29 Jan 2020 22:30:57 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kees Cook (2020-01-27 15:27:33)
> On Thu, Jan 23, 2020 at 09:30:31PM +0530, Sai Prakash Ranjan wrote:
> > Since commit f92b070f2dc8 ("printk: Do not miss new messages
> > when replaying the log"), CON_PRINTBUFFER flag causes the
> > duplicate boot messages to be printed on the console when
> > PSTORE_CONSOLE and earlycon (boot console) is enabled.
> > Pstore console registers to boot console when earlycon is
> > enabled during pstore_register_console as a part of ramoops
> > initialization in postcore_initcall and the printk core
> > checks for CON_PRINTBUFFER flag and replays the log buffer
> > to registered console (in this case pstore console which
> > just registered to boot console) causing duplicate messages
> > to be printed. Remove the CON_PRINTBUFFER flag from pstore
> > console since pstore is not concerned with the printing of
> > buffer to console but with writing of the buffer to the
> > backend.
>=20
> I agree this patch isn't the solution, but I'm trying to understand
> where better logic could be added. Is the issue that printk sees both
> earlycon and CON_PRINTBUFFER active? Can we add a new CON_* flag that
> means "not actually printing anything"? (Or maybe a new flag for
> non-printing to replace CON_PRINTBUFFER that lets pstore still work?)
>=20

This seems to be fixed by commit def97da13651 ("printk: fix
exclusive_console replaying"). I think there's nothing to do.

