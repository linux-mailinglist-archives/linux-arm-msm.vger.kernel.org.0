Return-Path: <linux-arm-msm+bounces-56579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91469AA7AE5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1211D981AC1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 20:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C844B1FFC59;
	Fri,  2 May 2025 20:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmZ+vHtB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9668F1FDE31;
	Fri,  2 May 2025 20:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746218005; cv=none; b=pRNxGegCbur2Hl2zpnhpVaBWSVNO96krU08t0BjG6/4k1v3Zvv41vBxD35CZ8TOp0U+sMoWYlzvRcpJTD14Jj4xNKZ0yzQcnUNMPmtP9EvjpRK3ys/HrLUsdqa9R3E/uh6qEtOZRb7uK+YkjxEdRJA5wDyOTVKF7dscC6CkpQGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746218005; c=relaxed/simple;
	bh=8cRp8SM0LX/HE5Z3KnJSbT0t2IN1vaMmNamccM78RCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PfNu7k1+xR3ls8hgMQfTJenTs5t0g4lVg0cTRlUIPbJjc9PnM65TQIAPoJKOVdrHxqJt2cRlydVCEgd+SY7qD2ltZ8ea/0rAgXRrrLTozuraWwl7ZaNZUDDKaT9QBYewSH7CIjWNwk/lBuCcIRMyH+QpUFo0uZSua4QvFruxkco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmZ+vHtB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1456DC4CEF4;
	Fri,  2 May 2025 20:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746218005;
	bh=8cRp8SM0LX/HE5Z3KnJSbT0t2IN1vaMmNamccM78RCU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VmZ+vHtBaP8SSohqqvMbuo/9dCNweJUIT1eTA8IbZzfbagwotj1lRz3ma4h4LYlc/
	 q5Z65x7TjCE5xFP00y4yDAEFn2clHK+U7B0mCpeXgauBWtaKsZNh54N3Muk290/ffY
	 q8LRgtoYCCBdXhGPcTQ4ewx8tCECuchfEETsDJoDqWM4Nk9xIYBAlp1D5IwxtP9tdL
	 9YxCmJhxfm2gQ5ASaCUihgOry/tQI4win9t5vyfsK5WqpPzw2Cl8i/qZq1IiUmdCBv
	 DWFp6bFBEYsM1EESOO41nOBOwlYINsr9OWIfH4theOH2OXkX41RMIR0l9ecPM/feGB
	 dy0cyd6c9JMQg==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso1419852a12.1;
        Fri, 02 May 2025 13:33:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2DV/pZwkRoswNU6ToS2yz//AVrUpM90D176WfH72Wxl2Ah1Gu/PiIyYdm/5x4xouAa2LmVe7V+ARf6jfz@vger.kernel.org, AJvYcCVj0YyURC591o7N+dYpDK4VZmD7qm6OU5XwdIqS+YckiNW7wRkinHGnij6j9wONn8/BfWXIaG1KfWVHmU0MR4dN7w==@vger.kernel.org, AJvYcCWMagO67K4EB/7VL45s65FAkNBOCAOMiae3xMtjTyIXID0hfsdkr/W/fM/RAL2n0QAV6jmUE5fYlHAKaQslGg==@vger.kernel.org, AJvYcCXEMkOxfPu8otAk4gKTj0ocME1zcHZ7fxWyYQX0xw/aRgxQs5D41acTt0mJHv9M5KWMcoQiKSBNFbhU@vger.kernel.org
X-Gm-Message-State: AOJu0YyqvABPKw7lp7P7+p8riYuEpyao6/QThFql/4Z62/L+Hj6iPhNJ
	VzatmsSslGu3plVjpVAjvr0tIMaRYcSrw9tOpMFrAgrdrGlcCe99sVm2KH8Z1jNUUWQy5Ur+ysT
	9SUJr5+w/AF9VakuO7pUTnL629A==
X-Google-Smtp-Source: AGHT+IFJAjhO8qP9BM2k4YXGFjxF2DDTVd060jMohyR4Ip3XSKyXWvnjjpfR8v4ueb8Q+ILn2MtJ1K5BoJWlIuzn/k0=
X-Received: by 2002:a05:6402:354a:b0:5e5:ba77:6f42 with SMTP id
 4fb4d7f45d1cf-5f919836e4cmr7202023a12.4.1746218003663; Fri, 02 May 2025
 13:33:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
 <20250423-dt-memory-region-v2-v2-4-2fbd6ebd3c88@kernel.org> <938c4876-d284-4f11-a4ac-9f3831d3c14d@amd.com>
In-Reply-To: <938c4876-d284-4f11-a4ac-9f3831d3c14d@amd.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 2 May 2025 15:33:12 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKhjE-67k2jN3x5qjRYbT4100fDCfkpt7TjESgOi_f8sA@mail.gmail.com>
X-Gm-Features: ATxdqUGr4Vb6qq9G8I43FJO0ja1hmdvZAb79PHSBzn0-jffEIRPNg2KLlUCVYFA
Message-ID: <CAL_JsqKhjE-67k2jN3x5qjRYbT4100fDCfkpt7TjESgOi_f8sA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
To: tanmay.shah@amd.com
Cc: Saravana Kannan <saravanak@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 10:40=E2=80=AFAM Tanmay Shah <tanmay.shah@amd.com> w=
rote:
>
>
> Hello Rob,
>
> Thanks for the patch. Please find my comments below.
>
>
> On 4/23/25 2:42 PM, Rob Herring (Arm) wrote:
> > Use the newly added of_reserved_mem_region_to_resource() and
> > of_reserved_mem_region_count() functions to handle "memory-region"
> > properties.
> >
> > The error handling is a bit different in some cases. Often
> > "memory-region" is optional, so failed lookup is not an error. But then
> > an error in of_reserved_mem_lookup() is treated as an error. However,
> > that distinction is not really important. Either the region is availabl=
e
> > and usable or it is not. So now, it is just
> > of_reserved_mem_region_to_resource() which is checked for an error.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > v2:
> >   - Use strstarts instead of strcmp for resource names as they include
> >     the unit-address.
> >   - Drop the unit-address from resource name for imx and st drivers
> > ---
> >   drivers/remoteproc/imx_dsp_rproc.c        | 45 ++++++++------------
> >   drivers/remoteproc/imx_rproc.c            | 68 ++++++++++++----------=
--------
> >   drivers/remoteproc/qcom_q6v5_adsp.c       | 24 ++++-------
> >   drivers/remoteproc/qcom_q6v5_mss.c        | 60 +++++++++-------------=
-----
> >   drivers/remoteproc/qcom_q6v5_pas.c        | 69 +++++++++++-----------=
---------
> >   drivers/remoteproc/qcom_q6v5_wcss.c       | 25 +++++------
> >   drivers/remoteproc/qcom_wcnss.c           | 23 ++++-------
> >   drivers/remoteproc/rcar_rproc.c           | 36 +++++++---------
> >   drivers/remoteproc/st_remoteproc.c        | 41 +++++++++---------
> >   drivers/remoteproc/stm32_rproc.c          | 44 +++++++++-----------
> >   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 +++++--------
> >   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 +++++--------
> >   drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 +++++--------
> >   drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 +++++++++-------------=
-
> >   14 files changed, 221 insertions(+), 349 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/im=
x_dsp_rproc.c
> > index 90cb1fc13e71..fffae6ff4a5c 100644
>
> [ ... ]
>
> > diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remotepr=
oc/xlnx_r5_remoteproc.c
> > index 5aeedeaf3c41..b73e97074c01 100644
> > --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> > +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> > @@ -460,49 +460,44 @@ static int add_mem_regions_carveout(struct rproc =
*rproc)
> >   {
> >       struct rproc_mem_entry *rproc_mem;
> >       struct zynqmp_r5_core *r5_core;
> > -     struct of_phandle_iterator it;
> > -     struct reserved_mem *rmem;
> >       int i =3D 0;
> >
> >       r5_core =3D rproc->priv;
> >
> >       /* Register associated reserved memory regions */
> > -     of_phandle_iterator_init(&it, r5_core->np, "memory-region", NULL,=
 0);
> > +     while (1) {
> > +             int err;
> > +             struct resource res;
> >
> > -     while (of_phandle_iterator_next(&it) =3D=3D 0) {
> > -             rmem =3D of_reserved_mem_lookup(it.node);
> > -             if (!rmem) {
> > -                     of_node_put(it.node);
> > -                     dev_err(&rproc->dev, "unable to acquire memory-re=
gion\n");
> > -                     return -EINVAL;
> > -             }
> > +             err =3D of_reserved_mem_region_to_resource(r5_core->np, i=
++, &res);
>
> Here i++ is not needed as it's done at the end of the loop.
> This bug breaks RPMsg communication on zynqmp platform.

Thanks for debugging it. I'll fix that up.

Rob

