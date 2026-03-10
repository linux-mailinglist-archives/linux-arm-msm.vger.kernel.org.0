Return-Path: <linux-arm-msm+bounces-96717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLpPJaZFsGnFhgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:24:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9617C254A93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AA46E3052CFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4952E9749;
	Tue, 10 Mar 2026 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NCpg2jUL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4EB2D9797
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155817; cv=none; b=GWeIl5cV0A6L5MqaTaPl9m8Te7PZiZ5mrvnBz5Pic051i0bzj93QyTEzbz6qZs9TAkY+7590lSCTpnrWYsXMyQOdklIc3nS7BfDLScErLuQiPc/0j6Nl/nX0iU55OoA0B8QkUPAlYF3FOhmtHeF1KzLJFD64aYk7TVhsQugdQ5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155817; c=relaxed/simple;
	bh=l66roiogcZuRuWdg/BN7GAGFpuk8qIZkWg5A5bU5kEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0OfHya33Kqmi/7GXQHeHwkY2z5MRH2Qs7ZOscDDHSiNHoNmGS6nYL37J0gSMEKJvXnbpwCbvTUjLYV52C5/giN9dBUmBRe1eRTMBCQmqp+vT1YapRXQls/H+ickr4r2aU/QERLh9Rc2GMe/ot/Ma+iIdL1jWvlnjluAc3T1AR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NCpg2jUL; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b886fc047d5so2120453266b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773155814; x=1773760614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrhwHJgKfQunIbqKLgGEw/Kos9vy+e6R49GEIQjjeck=;
        b=NCpg2jULnERGQL+ng7uPjAWSQ9o/UDVwoHoXb+SEKthoUi5xojyCpEXSlbcyMoIBwh
         lgvdhx6/1O/SrEVXGk46sZk+RPHMLFcI1HnP3YlAtKqYFIr/UEoJAI3qzDR594D9FGw+
         39p3HJ/EDqP5zUCFEni3sAs3IdB0shi5SlQzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155814; x=1773760614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZrhwHJgKfQunIbqKLgGEw/Kos9vy+e6R49GEIQjjeck=;
        b=wHEaONLO6Fur4IAGKYbI6/44PLD95JnVWsg5KkSXx9bdsY0sX5iEOiOHovshEhAdlj
         VNUW4J2yoVpgLIeVaYGGymRQfZrwlrFNZM3OlcLzMKKUqhpmdpJffJnZE6DbTeWXz10r
         QTMJhco2AxQfw3Z3DsJ7BsjeKp8Cxcy1FwkSGpS4KUjoVFSAYhvZqmeXgL/V8CBMiJ5N
         MwnVoKIjJwJtP/KcrtjmME4A8Pf4nHSEbECzfiYrPQHfjgaeFJY4u24z+hAROW3SMr0X
         h8GUJmXgfydUMmL2F/6w/tpj1MY4AqLwISK6nLcW5oAlC9E3EtZ9Zox0cKZ8gwAC4Ura
         R7/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXk948vTWtTsm/XhEENahKhQmUvesUJL3a7VNp8beT7QczBFxuLLHX3TZYh9hqcXE07MlM0lgyO2Wye7z2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/pDZsZjPKadG9JAu0ajPrcqni5C0CP3UW/buPME3eLoMBy/vS
	Y/tEN3noZLVXcVXiqEaOBb/RM56c6uOqNtnjr5ZCWP+DrC6hn6DmWR1/lL/4euoSVw6+pEqEbuG
	8PkOq+yXd
X-Gm-Gg: ATEYQzxYuVCd04cwgm78zouXE2VOzAMB5G7/rnixBld3PvtBNmsePyDl2Wm0OtRexYF
	3TZcIoECOBR7cVXTZ9KsfsqOF9ZUW9nTaZY76pdszj3B3JXnix/9yBjya7IFT43qUZn61LvW1HA
	MLhOGbDlpYZUZmnPEC6UxzKF05sfnvCXLarmrLscVEJNXG5Ao4Szu9lcqYXz69I4hRPoajcc2rC
	rdMOV7GfVjUisX03R5gl/LqtX8mPPwujtBaDlHMCSwFT7uupCKRM2qwisHe+T0EOmENAwznUf2o
	nHrwIDdASmjFFOhcYB4tSS6IlXxoKqdkuZUIfH4d2vBS1wnNMR2tD/m/AaBD/Q9cr3pvtLhhpJC
	0iNzJzVtvolhsXk3f2IhE2xBwWKS1ym6bCW1FM+uShsn+ttcWjhLD0J7/gKIxHAhSkZ+lrl3jqd
	ee0TJFw88cuav0V5VpB14+U4tTkH9CjunlLMUdXmaZsCnmOgQxc3rANfy7sECCtQ==
X-Received: by 2002:a17:906:fd85:b0:b87:6953:9d5e with SMTP id a640c23a62f3a-b942dfb6e10mr988698066b.33.1773155814490;
        Tue, 10 Mar 2026 08:16:54 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66fc5sm4336271a12.4.2026.03.10.08.16.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 08:16:54 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8f97c626aaso2185498666b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:16:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2QlsZctofDj/E+vRH35Q/Ca0bBqHrSWMzAmXuag88C8Jr/nDE0Sx+Uc7Kau7R8HIFS7wyhpE2xFeMmAeV@vger.kernel.org
X-Received: by 2002:a05:600c:1d04:b0:47e:e7e5:ff32 with SMTP id
 5b1f17b1804b1-48526983292mr236479455e9.34.1773155329681; Tue, 10 Mar 2026
 08:08:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org>
 <20260216100943.v3.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid> <CABb+yY2RKJgyNQ6789ua6s8C4tuOvhWqdcS16_4yU3AHjAiv_A@mail.gmail.com>
In-Reply-To: <CABb+yY2RKJgyNQ6789ua6s8C4tuOvhWqdcS16_4yU3AHjAiv_A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Mar 2026 08:08:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4te2V7MaOrQ8kSibLazqUy_Kv3ZcJyAAaCAiGWOY1Gw@mail.gmail.com>
X-Gm-Features: AaiRm51YHmAMmjPRIWQTSvpfsMBkAMaTT684zHe2XNjk21TEkEMaZPx6RHcKG9o
Message-ID: <CAD=FV=U4te2V7MaOrQ8kSibLazqUy_Kv3ZcJyAAaCAiGWOY1Gw@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Frank.Li@nxp.com, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, festevam@gmail.com, imx@lists.linux.dev, 
	jay.buddhabhatti@amd.com, jonathanh@nvidia.com, kernel@pengutronix.de, 
	konradybcio@kernel.org, krzk@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	lucaswei@google.com, mathieu.poirier@linaro.org, michal.simek@amd.com, 
	nm@ti.com, rafael@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	shawn.guo@linaro.org, ssantosh@kernel.org, sudeep.holla@kernel.org, 
	tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9617C254A93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96717-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,vger.kernel.org,arm.com,gmail.com,lists.linux.dev,amd.com,nvidia.com,pengutronix.de,lists.infradead.org,google.com,linaro.org,ti.com];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,chromium.org:dkim,chromium.org:email]
X-Rspamd-Action: no action

Hi,

On Mon, Mar 9, 2026 at 8:24=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.com=
> wrote:
>
> Hi Doug,
>
> On Mon, Feb 16, 2026 at 12:11=E2=80=AFPM Douglas Anderson <dianders@chrom=
ium.org> wrote:
> > @@ -249,6 +255,28 @@ int mbox_send_message(struct mbox_chan *chan, void=
 *mssg)
> >         if (!chan || !chan->cl)
> >                 return -EINVAL;
> >
> > +       /*
> > +        * The mailbox core gets confused when mbox_send_message() is c=
alled
> > +        * with NULL messages since the code directly stores messages i=
n
> > +        * `active_req` and assumes that a NULL `active_req` means no r=
equest
> > +        * is active. This causes the core to call the mailbox controll=
er a
> > +        * second time even if the previous message hasn't finished and=
 also
> > +        * means the client's tx_done() callback will never be called. =
However,
> > +        * clients historically passed NULL anyway. Deprecate passing N=
ULL
> > +        * here by adding a warning.
> > +        *
> > +        * Clients who don't have a message should switch to using
> > +        * mbox_ring_doorbell(), which explicitly documents the immedia=
te
> > +        * sending of doorbells, the lack of txdone, and what happens i=
f you
> > +        * mix doorbells and normal messages.
> > +        *
> > +        * TODO: when it's certain that all clients have transitioned, =
consider
> > +        * changing this to return -EINVAL.
> > +        */
> > +       if (!mssg)
> > +               dev_warn_once(chan->mbox->dev,
> > +                             "NULL mbox messages are deprecated; use m=
box_ring_doorbell\n");
> > +
> Does this patchset leave some such clients out?  If not, should we
> drop this block and return -EINVAL already?

This patchset series got all the clients that were in mainline at the
time I last checked. However, it was unclear to me if all the patches
would all go through your tree or not, since they don't touch mailbox
drivers but the somewhat widespread places that were clients of
mailbox.

If all the patches aren't going through your tree, we'll need to keep
it like this until we can confirm all of the clients have been
updated. If all the patcheds are going through your tree, then we
could make it return -EINVAL right away, but it we'd have to do that
as a last patch in the series. I think it would still make sense for
the first patch (which adds the mbox_ring_doorbell() call) to have a
warning like this and then a final patch to switch to -EINVAL. That
keeps things bisectable.

What do you think?

I'm happy to post a patch atop my series that switches it to -EINVAL
and you can land it whenever you see fit. Would that work?

-Doug

