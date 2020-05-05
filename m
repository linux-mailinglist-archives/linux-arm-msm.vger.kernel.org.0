Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC991C4E64
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 08:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgEEGgt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 02:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725830AbgEEGgt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 02:36:49 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D6A3C061A0F
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2020 23:36:49 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id v63so405284pfb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2020 23:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=RR/vhBqlhu+RGuetMeS8N4Mh6CkNHNI8psQed/aUbaM=;
        b=MXlahRmFSg5EHVs4lwduOyL4oUG6gPIPonkzFJsNoVfK1F+xRSZ5mSGHBeVNC0uLWQ
         wag4V8VwHrHAjpECEtEiunANMvZyML8PzW+v2RNHlvoukhOcnm78Nbw8sO60hN2tu0Rc
         J5nFX7IlQKaRIxNspZPMHzX5UUrZqRhlNjWu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=RR/vhBqlhu+RGuetMeS8N4Mh6CkNHNI8psQed/aUbaM=;
        b=dpECw2s72ZN05q6Y+rH5Rf58+f0GpmKKOKvgmb4gMD+W3tWO+64ma+ysNtOGIvhJjw
         L8Oea0XsGxwq3PnF6iII9Ec9okao5Mjiw0ceh3sH2X2bAWGHJpcov4yxHifyZhXb/SOC
         pmYY84+xieQDaFw7AxEh5+F+gEH0OwJ77iEt16ZqTxkl/o/E9uSGzVsbVJ/2SZZdj2eq
         8wmQaNOfQr+fgugZpzSIVlyR9pkkRnQaeT2zyMcU3QJAMj8X60fD4OHm19ER+JCSxU4Q
         3zD5B+kY1BTCD5ggPN+Xu8WmfY5QxTYsEZY7KzJiMawcnKvjPNwBl6nBKHeNERS2mjEB
         tj1g==
X-Gm-Message-State: AGi0PuZ1RarD+kbooBeTRUdonWplmH+L9UbvjCGlSxPQwAG9EWOFTlz9
        +TgZ6NPCuLqR9zb+RY/4Fhkajw==
X-Google-Smtp-Source: APiQypL3760bnwtsxGcOaXtj9eoDRY8e90fhW068Ru6dqxQcx7UT5XF5CddEuXt2gWg/bzxtbwYN+w==
X-Received: by 2002:a62:1dd8:: with SMTP id d207mr1755297pfd.3.1588660608820;
        Mon, 04 May 2020 23:36:48 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id p10sm984560pff.210.2020.05.04.23.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 23:36:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=WDmk9+e+ZXaUdhegwLCszCZXCQaiMQa_vkKsE+s6XZ0Q@mail.gmail.com>
References: <20200425175312.124892-1-swboyd@chromium.org> <20200425175312.124892-2-swboyd@chromium.org> <CAD=FV=WDmk9+e+ZXaUdhegwLCszCZXCQaiMQa_vkKsE+s6XZ0Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] soc: qcom: rpmh-rsc: Remove tcs_is_free() and find_free_tcs() APIs
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Date:   Mon, 04 May 2020 23:36:47 -0700
Message-ID: <158866060708.24786.3695568539661593702@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-04-27 17:13:04)
> On Sat, Apr 25, 2020 at 10:53 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> > index 571aa1012f23..3f4951840365 100644
> > --- a/drivers/soc/qcom/rpmh-rsc.c
> > +++ b/drivers/soc/qcom/rpmh-rsc.c
> > @@ -492,33 +476,37 @@ static void __tcs_buffer_write(struct rsc_drv *dr=
v, int tcs_id, int cmd_id,
> >   *
> >   * This will walk through the TCSes in the group and check if any of t=
hem
> >   * appear to be sending to addresses referenced in the message. If it =
finds
> > - * one it'll return -EBUSY.
> > + * one it'll return -EBUSY because the hardware can't handle more than
> > + * one of the same address being changed at the same time.
> >   *
> > - * Only for use for active-only transfers.
> > + * Only for use with active-only transfers.
> >   *
> >   * Must be called with the drv->lock held since that protects tcs_in_u=
se.
> >   *
> > - * Return: 0 if nothing in flight or -EBUSY if we should try again lat=
er.
> > + * Return: offset` of free slot if nothing in flight and a free slot i=
s found
>=20
> Why the back tick after "offset"?

Must be some copy/paste bug!

>=20
>=20
> > + *         or -EBUSY if we should try again later.
> >   *         The caller must re-enable interrupts between tries since th=
at's
> > - *         the only way tcs_is_free() will ever return true and the on=
ly way
> > + *         the only way tcs_in_use will ever be updated and the only w=
ay
> >   *         RSC_DRV_CMD_ENABLE will ever be cleared.
> >   */
> > -static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_grou=
p *tcs,
> > -                                 const struct tcs_request *msg)
> > +static int check_for_req_inflight_and_find_free(struct rsc_drv *drv,
> > +       const struct tcs_group *tcs, const struct tcs_request *msg)
> >  {
> >         unsigned long curr_enabled;
> >         u32 addr;
> > -       int i, j, k;
> > -       int tcs_id =3D tcs->offset;
> > -
> > -       for (i =3D 0; i < tcs->num_tcs; i++, tcs_id++) {
> > -               if (tcs_is_free(drv, tcs_id))
> > -                       continue;
> > +       int j, k;
> > +       int i =3D tcs->offset;
> > +       unsigned long max =3D tcs->offset + tcs->num_tcs;
> > +       int first_free =3D i;
>=20
> The way "first_free" is calculated definitely adds complexity to this
> function.  Are we sure it's justified compared to just calling
> find_next_zero_bit() if the function doesn't return -EBUSY?  If you
> really like it this way I won't object too strongly, but I'm not
> convinced that it makes the code size smaller (vs. jumping to a common
> implementation in the kernel) and it seems unlikely to have any
> real-world speed impact.

I was trying to coalesce the double loop over the free bits here by
adding a couple more lines to keep track of the first free bit and to
set the bit when it's found. It almost feels like it would be better to
inline this whole function into the one call site too.

>=20
>=20
> > -               curr_enabled =3D read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, =
tcs_id);
> > +       for_each_set_bit_from(i, drv->tcs_in_use, max) {
> > +               /* Find a free tcs to use in this group */
> > +               if (first_free =3D=3D i)
> > +                       first_free =3D i + 1; /* Maybe the next one is =
free? */
> >
> > +               curr_enabled =3D read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, =
i);
> >                 for_each_set_bit(j, &curr_enabled, MAX_CMDS_PER_TCS) {
> > -                       addr =3D read_tcs_cmd(drv, RSC_DRV_CMD_ADDR, tc=
s_id, j);
> > +                       addr =3D read_tcs_cmd(drv, RSC_DRV_CMD_ADDR, i,=
 j);
> >                         for (k =3D 0; k < msg->num_cmds; k++) {
> >                                 if (addr =3D=3D msg->cmds[k].addr)
> >                                         return -EBUSY;
> > @@ -526,28 +514,11 @@ static int check_for_req_inflight(struct rsc_drv =
*drv, struct tcs_group *tcs,
> >                 }
> >         }
> >
> > -       return 0;
> > -}
> > +       if (first_free >=3D max)
> > +               return -EBUSY;
> >
> > -/**
> > - * find_free_tcs() - Find free tcs in the given tcs_group; only for ac=
tive.
> > - * @tcs: A pointer to the active-only tcs_group (or the wake tcs_group=
 if
> > - *       we borrowed it because there are zero active-only ones).
> > - *
> > - * Must be called with the drv->lock held since that protects tcs_in_u=
se.
> > - *
> > - * Return: The first tcs that's free.
> > - */
> > -static int find_free_tcs(struct tcs_group *tcs)
> > -{
> > -       int i;
> > -
> > -       for (i =3D 0; i < tcs->num_tcs; i++) {
> > -               if (tcs_is_free(tcs->drv, tcs->offset + i))
> > -                       return tcs->offset + i;
> > -       }
> > -
> > -       return -EBUSY;
> > +       set_bit(first_free, drv->tcs_in_use);
>=20
> Function is not documented to also set the bit.  Do we really gain
> anything by setting it in this function, or can it just stay with the
> caller?  I'd hate to call this function
> check_for_req_inflight_and_find_free_and_claim_it().

Maybe the function can be named claim_tcs_for_req() or something like
that. Anything to make it shorter would be good!

>=20
>=20
> > +       return first_free;
> >  }
> >
> >  /**
> > @@ -580,17 +551,14 @@ static int tcs_write(struct rsc_drv *drv, const s=
truct tcs_request *msg)
> >          * The h/w does not like if we send a request to the same addre=
ss,
> >          * when one is already in-flight or being processed.
> >          */
> > -       ret =3D check_for_req_inflight(drv, tcs, msg);
> > -       if (ret)
> > -               goto unlock;
> > -
> > -       ret =3D find_free_tcs(tcs);
> > -       if (ret < 0)
> > +       tcs_id =3D check_for_req_inflight_and_find_free(drv, tcs, msg);
> > +       if (tcs_id < 0) {
> > +               ret =3D tcs_id;
> >                 goto unlock;
> > -       tcs_id =3D ret;
> > +       }
> >
> > +       ret =3D 0;
>=20
> nit: Cleaner to just init to 0 when the function is declared now?
>=20

Ok.
