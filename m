Return-Path: <linux-arm-msm+bounces-28405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9C195087B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 17:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5DDC1F21EAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 15:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A77B19FA6B;
	Tue, 13 Aug 2024 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FP0R1qBL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E6419EEA4;
	Tue, 13 Aug 2024 15:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723561610; cv=none; b=Wgp3QvbV8E1JiNwr2m2DIsFqz+zIivusnKSxTHf2fNAHMTF5GYkKcqke8m/Z++0a8d4Q7Ntpj8ys6SI+V0JBGzpfSsiCZo7vfQSGtf8udX64moSBufm94FLZZtqvw58HZukVoDulfcxtpEq1kIJ9tjOv1U4bjXJTWjt6Wlfk9dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723561610; c=relaxed/simple;
	bh=+vLSb4vo2V0c0Lzw7tlVy5JD1tY1krQUth7w4Ry3pDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnA1X/WMvekz97CnSEQDq+QiwMvpj/BhW/mJmnt4I8FKUpOQnMl9i4oB287tOmz+B4yshGGk4vooWZ3il84UqvpFsNr25deS04r+6mjpdW7jAdKM1RxSPCUcQlmvgYzrr7Y6yjyW90bAzLobBzqrUptExx6YoiX4pMiPVpFlEgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FP0R1qBL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B64C4AF18;
	Tue, 13 Aug 2024 15:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723561609;
	bh=+vLSb4vo2V0c0Lzw7tlVy5JD1tY1krQUth7w4Ry3pDg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FP0R1qBLY+7AbDGdgbM6CHnPFmiBCg+tdpNuwc5Osp4UaWJdav8Zylawtr5e1s1TW
	 OVR0LeV8oQ01V4h6tLNT1NP/dKIbUGBbw4XD1GxUhQ5imISy5zjmXlsY+97wuW8ZOu
	 +k/+kMgdmFYI1X5NCS3VvXEQiOfbnLXJDAh4HZuh2y3usPgDzaHIsoCorLk6OKG63w
	 aGKUpSrDJg+RmfqhD147ZJ97UgfvK+ULmN9/gW9Yx1Qh9bR9GWrwhYVCRIj9F5O4tc
	 5Fe+YfmfgwpK4t8Tc6Db/q1fhrmIaJkcCjhEXx04PMnfych8LxR1KrkV4RrMvxJXmo
	 uRzlqS08xWKRw==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-260209df55dso3154647fac.2;
        Tue, 13 Aug 2024 08:06:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQWBpM5cUG7uT9P/hXtgVjUuVSED84bPduEvdrI8EBRlyGzgOTdB+uJLrzoyKY3D2YXd+GGAabdqzmxkeDrX+uZ2LvZwCIlAgYAn9ORY4bdvLH3tGdsPSg0QNL8YgWvBcVvlW6oih1ZgjRDaz0LZJLiuoupecvIAlq4Xft0u0UGV8awKCmf4dmGWlG4P5e4XIntgOZJNn3L6kIA6Bewwn+/hA=
X-Gm-Message-State: AOJu0Yx2T5x3oLBRqDSmCdKh9J3uZ1nFBOqwSaqLvvzObgNOZNbMB7ej
	+ySrk8XQYsDP4Ev/MXmPNHTpD2qUAx2dWPEkgMCQ3x+Pp/v6BLsUvmJoLcbetv+lHGM7q0nFVyT
	Aq/P7ixpN5WR/VHboy83x+MQNOQ==
X-Google-Smtp-Source: AGHT+IEmk8kNwHylWPsiOYC4q9yEy5CQJvwlkDxTjzsTqDScmaHSn14FPzd9peN8eyu0HcCqbCmaNjlicz+F+Ed/3A8=
X-Received: by 2002:a05:6870:5baa:b0:260:eb3a:1be with SMTP id
 586e51a60fabf-26fcb7aa87fmr4525020fac.34.1723561608998; Tue, 13 Aug 2024
 08:06:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <20240811-dwc3-refactor-v2-6-91f370d61ad2@quicinc.com> <20240812212139.GA1797954-robh@kernel.org>
 <ZrqJyh4UPJ5xBhq2@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <ZrqJyh4UPJ5xBhq2@hu-bjorande-lv.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Aug 2024 09:06:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLThor3MXF1nzfegBWC1fJDKAJ9-GP-riTyqbhmWscMjw@mail.gmail.com>
Message-ID: <CAL_JsqLThor3MXF1nzfegBWC1fJDKAJ9-GP-riTyqbhmWscMjw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] usb: dwc3: qcom: Transition to flattened model
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Felipe Balbi <balbi@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Saravana Kannan <saravanak@google.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 4:16=E2=80=AFPM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> On Mon, Aug 12, 2024 at 03:21:39PM -0600, Rob Herring wrote:
> > On Sun, Aug 11, 2024 at 08:12:03PM -0700, Bjorn Andersson wrote:
> > > From: Bjorn Andersson <quic_bjorande@quicinc.com>
> > >
> > > The USB IP-block found in most Qualcomm platforms is modelled in the
> > > Linux kernel as 3 different independent device drivers, but as shown =
by
> > > the already existing layering violations in the Qualcomm glue driver
> > > they can not be operated independently.
> > >
> > > With the current implementation, the glue driver registers the core a=
nd
> > > has no way to know when this is done. As a result, e.g. the suspend
> > > callbacks needs to guard against NULL pointer dereferences when tryin=
g
> > > to peek into the struct dwc3 found in the drvdata of the child.
> > > Even with these checks, there are no way to fully protect ourselves f=
rom
> > > the race conditions that occur if the DWC3 is unbound.
> > >
> > > Missing from the upstream Qualcomm USB support is handling of role
> > > switching, in which the glue needs to be notified upon DRD mode chang=
es.
> > > Several attempts has been made through the years to register callback=
s
> > > etc, but they always fall short when it comes to handling of the core=
's
> > > probe deferral on resources etc.
> > >
> > > Moving to a model where the DWC3 core is instantiated in a synchronou=
s
> > > fashion avoids above described race conditions.
> > >
> > > It is however not feasible to do so without also flattening the
> > > DeviceTree binding, as assumptions are made in the DWC3 core and
> > > frameworks used that the device's associated of_node will the that of
> > > the core. Furthermore, the DeviceTree binding is a direct
> > > representation of the Linux driver model, and doesn't necessarily
> > > describe "the USB IP-block".
> > >
> > > The Qualcomm DWC3 glue driver is therefor transitioned to initialize =
and
> > > operate the DWC3 within the one device context, in synchronous fashio=
n.
> > >
> > > To handle backwards compatibility, and to remove the two-device model=
,
> > > of_nodes of the old compatible are converted to the new one, early
> > > during probe.
> > >
> > > This happens in the event that a DWC3 core child node is present, the
> > > content of the reg and interrupt properties of this node are merged i=
nto
> > > the shared properties, all remaining properties are copied and the co=
re
> > > node is dropped. Effectively transitioning the node from qcom,dwc3 to
> > > qcom,snps-dwc3.
> >
> > In the past we've done this old binding to new binding with an overlay
> > embedded in the kernel. The overlay would just be the .dts change you'v=
e
> > made (we should have a tool that takes 2 DTs and generates an overlay a=
s
> > the diff). I suppose it's a few platforms here, but then it is just dat=
a
> > and easily deleted when no longer needed (I think the cases I'm
> > remembering did just that because they are gone now. It was TI display
> > and Renesas media stuff IIRC).
> >
>
> Where and how do you apply this overlay?

With "git log -S of_overlay_ drivers/", I found the prior cases. See
841281fe52a7 ("drm: rcar-du: Drop LVDS device tree backward
compatibility") and 739acd85ffdb ("drm/tilcdc: Remove obsolete
"ti,tilcdc,slave" dts binding support")

I would consider putting them in drivers/of/ as well. Then we could
better control the order of applying the overlay and creating devices.
It avoids a lot of the complexity if the overlay is applied first.

> If I can avoid doing the dynamic translation, I'd be happy to do so.
>
> >
> > > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > > ---
> > >  drivers/usb/dwc3/dwc3-qcom.c | 310 +++++++++++++++++++++++++++++++++=
++--------
> > >  1 file changed, 251 insertions(+), 59 deletions(-)
> > >
> > > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qco=
m.c
> [..]
> > > -static int dwc3_qcom_of_register_core(struct dwc3_qcom *qcom, struct=
 platform_device *pdev)
> > > +static struct property *dwc3_qcom_legacy_prop_concat(const char *nam=
e,
> > > +                                                const void *a, size_=
t a_len,
> > > +                                                const void *b, size_=
t b_len)
> > >  {
> > > -   struct device_node      *np =3D pdev->dev.of_node, *dwc3_np;
> > > -   struct device           *dev =3D &pdev->dev;
> > > -   int                     ret;
> > > +   size_t len =3D a_len + b_len;
> > >
> > > -   dwc3_np =3D of_get_compatible_child(np, "snps,dwc3");
> > > -   if (!dwc3_np) {
> > > -           dev_err(dev, "failed to find dwc3 core child\n");
> > > -           return -ENODEV;
> > > -   }
> > > +   struct property *prop __free(kfree) =3D kzalloc(sizeof(*prop), GF=
P_KERNEL);
> > > +   char *prop_name __free(kfree) =3D kstrdup(name, GFP_KERNEL);
> > > +   void *value __free(kfree) =3D kzalloc(len, GFP_KERNEL);
> > > +   if (!prop || !prop_name || !value)
> > > +           return NULL;
> > >
> > > -   ret =3D of_platform_populate(np, NULL, NULL, dev);
> > > -   if (ret) {
> > > -           dev_err(dev, "failed to register dwc3 core - %d\n", ret);
> > > -           goto node_put;
> > > +   prop->name =3D no_free_ptr(prop_name);
> > > +   prop->value =3D no_free_ptr(value);
> > > +   prop->length =3D len;
> >
> > We're trying to make struct property opaque or even internal to DT core=
.
> > Exposing it leaks pointers and then we can't ever free things. This is
> > not helping. The changeset API avoids mucking with struct property.
> >
>
> I will review the changeset API!
>
> > > +
> > > +   memcpy(prop->value, a, a_len);
> > > +   memcpy(prop->value + a_len, b, b_len);
> > > +
> > > +   return_ptr(prop);
> > > +}
> > > +
> > > +/* Replace reg property with base address from dwc3 node and fixed l=
ength */
> > > +static int dwc3_qcom_legacy_update_reg(struct device_node *qcom,
> > > +                                  struct device_node *dwc3)
> > > +{
> > > +   int addr_cells;
> > > +   int size_cells;
> > > +   u64 dwc3_addr;
> > > +   int ret;
> > > +
> > > +   ret =3D of_property_read_reg(dwc3, 0, &dwc3_addr, NULL);
> > > +   if (ret < 0)
> > > +           return ret;
> > > +
> > > +   addr_cells =3D of_n_addr_cells(qcom);
> > > +   size_cells =3D of_n_addr_cells(qcom);
> > > +
> > > +   __be32 *reg __free(kfree) =3D kcalloc(addr_cells + size_cells, si=
zeof(__be32), GFP_KERNEL);
> > > +   if (!reg)
> > > +           return -ENOMEM;
> > > +
> > > +   reg[addr_cells - 1] =3D cpu_to_be32(dwc3_addr);
> >
> > Assuming dwc3_addr fits in 32-bit or that the upper 32-bits matches?
> >
>
> The core resides in the lower 32 bits on all existing targets, and I
> expect any new targets that possibly changes that assumption would not
> take the path through this translation (or would need to correct my
> assumption).
>
> > > +   reg[addr_cells + size_cells - 1] =3D cpu_to_be32(SDM845_QSCRATCH_=
BASE_OFFSET + SDM845_QSCRATCH_SIZE);
> > > +
> [..]
> > > @@ -773,10 +937,14 @@ static int dwc3_qcom_probe(struct platform_devi=
ce *pdev)
> > >             goto reset_assert;
> > >     }
> > >
> > > -   res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +   ret =3D of_address_to_resource(np, 0, &res);
> >
> > So we just leave the platform device resources stale? The right solutio=
n
> > is probably to make platform_get_resource() work on demand.
>
> I did consider updating the resource, only in the case that we rewrite
> the information, as it would be slightly cleaner not to leave that
> dangling. But this was cleaner code wise.
>
> > That's what
> > we did for IRQ resources years ago (since those had irqchip driver
> > dependencies).
> >
>
> Right, for platform_get_irq(), but I presume for platform_get_resource()
> we would end up with the union of the different resource-specific lookup
> mechanisms?

You'd just make platform_get_resource() call of_address_to_resource()
internally if there's a node pointer. There could be drivers that
break and it would be slower if we defer probe since it would parse
the DT every probe. But really, an overlay applied earlier is a better
approach IMO.

Rob

