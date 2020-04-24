Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 331CF1B7C91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 19:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728563AbgDXRV6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 13:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726849AbgDXRV5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 13:21:57 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF0D7C09B047
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:21:55 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a5so4127324pjh.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=9/rHi+opABqnWC7ABI/VwKKz8YnCgSS+xTfGsZR3+hI=;
        b=A5I4cJO7vbWtjiQHG/voDoJquzAhktDCzv2uPQSWugiA7YZ3veVmJWTQyyFxVvkH+h
         FvhxCh2f6rnnVTSTWupVspEx2HKhd4KZsDSKOhxYZ6rEz/aBxOprzXZA2eY0mAmDdgCb
         57fUF7mxZHyR8Du18R04UyVJ6pNRyYB5vrXwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=9/rHi+opABqnWC7ABI/VwKKz8YnCgSS+xTfGsZR3+hI=;
        b=bRIRlRlJcFC+RVggAgsILCkyMDc8iA10/ktmwB4gIICq/svESMRJna77biurK1ln/E
         j5aDvyhBXtyN4YbXwancy3Urwno1z4RqTPiPKc9t+xdeJ33x9vpDuBA3emAe628jsTTx
         cpOmmQgfRw0+qsmR9KaeZrxYgHDQfYldDwDoVMzb/Nv1Hl77OFcRpQwJyQmLmy6sCJ4V
         rncIaEDBtf0FAReBfCBPaRSky/zAif4ut8nBVDsRDr0nHoSaa242fVqbEmuRqsm3Eiwo
         ziKWZF+RKEJykx9qs4y2s7aEvev8z20wZ3aWdg1y6Rb2ETO/iwEPJoz097JfRFb5bPGE
         mN+Q==
X-Gm-Message-State: AGi0Pua0t9I/Wv2wfrrplmU/jI9j6E5hVU1s1169RbR68S9vuue/vGfG
        LRX7ZZ+5kq4URoAuEae/Lk6jiQ==
X-Google-Smtp-Source: APiQypK3MbrgY702ieZ2DMynzA3M5bEztwrT5ExeMwcuBzWd4TslsMOW4R0wW+GRnOwlzOqB9iaskg==
X-Received: by 2002:a17:902:441:: with SMTP id 59mr9971066ple.339.1587748915325;
        Fri, 24 Apr 2020 10:21:55 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id p10sm6433767pff.210.2020.04.24.10.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 10:21:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200424053626.GV20625@builder.lan>
References: <20200424045414.133381-1-swboyd@chromium.org> <20200424045414.133381-2-swboyd@chromium.org> <20200424053626.GV20625@builder.lan>
Subject: Re: [PATCH 1/3] soc: qcom: rpmh-rsc: Remove tcs_is_free() API
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Date:   Fri, 24 Apr 2020 10:21:53 -0700
Message-ID: <158774891388.135303.17625994744372966487@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-04-23 22:36:26)
> On Thu 23 Apr 21:54 PDT 2020, Stephen Boyd wrote:
> > diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> [..]
> >  static int find_free_tcs(struct tcs_group *tcs)
> >  {
> > -     int i;
> > +     const struct rsc_drv *drv =3D tcs->drv;
> > +     unsigned long i;
> > =20
> > -     for (i =3D 0; i < tcs->num_tcs; i++) {
> > -             if (tcs_is_free(tcs->drv, tcs->offset + i))
> > -                     return tcs->offset + i;
> > -     }
> > +     i =3D find_next_zero_bit(drv->tcs_in_use, MAX_TCS_NR, tcs->offset=
);
> > +     if (i > tcs->offset + tcs->num_tcs)
>=20
> Afaict this should be >=3D
>=20

Thanks!
