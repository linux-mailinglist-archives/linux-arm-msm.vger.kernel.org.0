Return-Path: <linux-arm-msm+bounces-97067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHkPBJe6sWmxEwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:55:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DB1268ED5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A8D83028834
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F653EBF2E;
	Wed, 11 Mar 2026 18:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bECnSL7+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E153D3EB81A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 18:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773255311; cv=pass; b=qfPubVXML8SC90IdZaJSVGcZw1A7PILAs8OVfTUairrnUHIfFtpoB+cUX1niWk9dxb9cERphhlJVX7yb5ORD3Ak8OCFUtL08+YViALJObndNNw82LX2kXQ8R6qnkBIKJD+jzWrl4xnYGAewvaOjd1h4i8HNjS++Y8U+g4dTUffo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773255311; c=relaxed/simple;
	bh=irxwBx6UP69oFnPVwuxdcfosSKIVNRJAx/pAMZWSGhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZUj1sMXCqayfSje0vXkNTEWa1e8bhAE3X+5i+vyRRx5i9a6OTXtU3zovJfW/LNXFUYWwhdbNQ2QpXsjHtwLVMyPm4q5BslVG1a+uITLF+LvzqT8CBQ1+8Bu2PlBsv+Nz33rk2Fs0cjq4xzlxG77pLJXdL+B/qIgJYDR09XYtTpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bECnSL7+; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b942424d231so20056766b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 11:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773255307; cv=none;
        d=google.com; s=arc-20240605;
        b=cOI8xtwlhCPFn1w+wf/OK0h+qac9/CHUh3zsk5FEGyhWZ0gtmAJvZYOv4AY+SSlY8+
         /ZZ4IZtptuFtsdIhoN/hxAiKo89XdJxi+3kOijyd5YKYgwbwuK26tlz83AqoLx0lFlhM
         yvPX2MtHcgVAOg1j4tIUSLDDGgr2c79XzdsiB3Icj9cXXSeI/DNNShEeEJGqPttBfqOl
         j+w9kcL6n/n2AWg0W7SpGwYnBpE9jW97U+TBROmrbmRInWZsQX5waNlnN2MgebdiKtHN
         I9BYHIviDIuiMbDW+ee7YmpwOO7lpo5PRDcHvzcOy79an1CoxF+JdaqT/0e7fF6u3UOO
         37MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hHaBAq1X6Cs9R/WovG2TDPIdkyxlD9U7dFf+lUqKaZ0=;
        fh=ZjF1Q/Z8gcxr9dW4S3xCKcLncD0R5oFnepEQnP1YNJU=;
        b=Bf7t9QJB5gslLKJ43V974wEmrqmQas3RBaGypWVO5smpRv8/UBOLqKNAtTyqbmYcvd
         0/EUZ6mh9fnzv4VDygv+ggNSmHt+zut5/yUpAtjtWCcOPVjEAlMo+MM0h4W0WXKrKZ5E
         hWm7vB8iDVFs+kkyW+LWuZFW/1RATS0WgAoMdBkM5xm66SHSSYLz6yFFRIg+Jp5HsK9j
         B3/pqMcJ0ezMhbEH7fHKlhW/a9xzuHkEhd6ZihNicRr6Pos4SIJSeuVuN8tdwwR6dcV4
         4AbCIApGMOnU1wTAsNjXLUrfaiWSwJvqkHju+9s2vkReilqKsjNYFpxbXhHlwf79PH2V
         JIQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773255307; x=1773860107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHaBAq1X6Cs9R/WovG2TDPIdkyxlD9U7dFf+lUqKaZ0=;
        b=bECnSL7+eP9KFKgOMAqfs2V0+7MyCvE+Fa0vmsxxUjc20FzB8I8Hj6vrfTJjGaKPAX
         Djg9nbqWr2nsP3+yZwzMbSUbU8wBVxrpPfDTDdExD5qHDBVBCh+FcvxOaTquYtVEuqfg
         QmL2iVUdTmAcM66JCsxyzcADK8Lxun93awA1IoeJEz0sqONjOvslr/Tj6qeYN3d7CJoV
         y+/XyEzW4YuAqqjRPoV8PRfuDSyIaFwMECmC7QUYOpwotHF0D0miq2t/gYSOlf1HTtkv
         KPSZ39isQLTl7beC1Iqfxwaxj1j+Nu686iypeeBblPCeLQG/og+fy8OFKVha7cCpKKVG
         9UGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773255307; x=1773860107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hHaBAq1X6Cs9R/WovG2TDPIdkyxlD9U7dFf+lUqKaZ0=;
        b=DCPeGiZbD4iHYZ4X3b67L6R80YS16p6ov+F1HxEHpmhKjPzvm6BKHBWeoPawAsnkY6
         uqWowp4pk5NxggkaVIw3SC1Idz9DgYfC0Vzat9Lc0JO9r0EJhDs5yFCgFOYEdHtc8q/o
         tHhQvYRvBkqnWe+Xgh6o+YcBVb94m1OlMpf9UiXdi6riLD9dq4IS04KUG0xBrkFyzk8C
         F7k8kRjVNSag2Ywe0QeMDb06JifSVy7MjFlBUP7DBTre89xSaVN//s1cGgABn1hsQQSC
         3lRzChhd2r+3rHI/XH6wXDg5Iaf8IJWIt9ls0zUh1WClOIaRU4mWe7oY0Xz6tu94NsrD
         caKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO4BaBJaVqBXHkmqs+RKewY2p2eNPUA+BlyPuAJs1dp1VnXa/EdCI9zVhXd7FgTo3YFKnZRA8fX/zdA55F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2836UPSUckLVHrFGJ9J3H4r4q1D2lmGd+iOMi8YfkfCKI5WGE
	1o5F51p6sXPfYSBJbGcYzjHcBDle7flF+Ozg6CFPpQ3Dbc80hsnrsC0daPhEoHY51mxLQHz8Adg
	n583ka8+kvYQMamro8orAKCnBTsoyjVU=
X-Gm-Gg: ATEYQzw7SOP7PuUn343kidpg6rHS7yLL59gWKnCczlSHjfQjacB1NHgCJfo8XQX4cPS
	aGzKzgQxM29LYPkTWAKMsXNSCUCCMljbh3OC959UIaDhDkINCDzCz2KeDsu0unrhSXCQuWoZEsa
	hm17Hl31VoxUV1SLuak/dCGU2Jeh5pbQuc1xfsSKa1Kd5m3lSwmG2wdwsQ+d9SLDRLns4tNBEsF
	l/tb9BDWFFRceR9nmnllh/dgdKNMSqQ12h+wfXL9vTwJ/68tJsRTPGqm4nqGzTXxK1PCqjE6bcB
	59z90wwf41YOccabBwjNQEB2yLABhAWTq9OcsMXwzSeyW7bG6Ry2qvhFWgL1o1LTO+FJhwKrL25
	8l04i+rVrBWlU6uB6
X-Received: by 2002:a17:907:980f:b0:b73:544d:b963 with SMTP id
 a640c23a62f3a-b972e1fb818mr215294466b.13.1773255306700; Wed, 11 Mar 2026
 11:55:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306222148.8200-1-rosenp@gmail.com> <2026031127-siding-caress-7ed9@gregkh>
In-Reply-To: <2026031127-siding-caress-7ed9@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 11 Mar 2026 11:54:55 -0700
X-Gm-Features: AaiRm53qW5bk3kKh7rdlWXHeQ5YAkvINL-7BQnfjicz7nmTpcD6zasMPluist-A
Message-ID: <CAKxU2N_dJY60Tp4UgLMZ97ZJywNEktmA1At3z6VOPhhSCRx-1w@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: simplify allocation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:QUALCOMM TYPEC PORT MANAGER DRIVER" <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-97067-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 64DB1268ED5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 7:47=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Mar 06, 2026 at 02:21:48PM -0800, Rosen Penev wrote:
> > Change kzalloc + kcalloc to just kzalloc with a flexible array member.
> >
> > Add __counted_by for extra runtime analysis when requested.
> >
> > Shuffle some code in probe to provide a clearer picture.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  .../typec/tcpm/qcom/qcom_pmic_typec_pdphy.c   | 27 ++++++++-----------
> >  .../typec/tcpm/qcom/qcom_pmic_typec_port.c    | 26 ++++++++----------
> >  2 files changed, 22 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/driv=
ers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> > index c8b1463e6e8b..4b3915c6894a 100644
> > --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> > +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> > @@ -95,13 +95,13 @@ struct pmic_typec_pdphy {
> >       struct regmap                   *regmap;
> >       u32                             base;
> >
> > -     unsigned int                    nr_irqs;
> > -     struct pmic_typec_pdphy_irq_data        *irq_data;
> > -
> >       struct work_struct              reset_work;
> >       struct work_struct              receive_work;
> >       struct regulator                *vdd_pdphy;
> >       spinlock_t                      lock;           /* Register atomi=
city */
> > +
> > +     unsigned int                    nr_irqs;
> > +     struct pmic_typec_pdphy_irq_data        irq_data[] __counted_by(n=
r_irqs);
> >  };
> >
> >  static void qcom_pmic_typec_pdphy_reset_on(struct pmic_typec_pdphy *pm=
ic_typec_pdphy)
> > @@ -560,31 +560,26 @@ int qcom_pmic_typec_pdphy_probe(struct platform_d=
evice *pdev,
> >       struct pmic_typec_pdphy_irq_data *irq_data;
> >       int i, ret, irq;
> >
> > -     pmic_typec_pdphy =3D devm_kzalloc(dev, sizeof(*pmic_typec_pdphy),=
 GFP_KERNEL);
> > -     if (!pmic_typec_pdphy)
> > -             return -ENOMEM;
> > -
> >       if (!res->nr_irqs || res->nr_irqs > PMIC_PDPHY_MAX_IRQS)
> >               return -EINVAL;
> >
> > -     irq_data =3D devm_kcalloc(dev, res->nr_irqs, sizeof(*irq_data),
> > -                             GFP_KERNEL);
> > -     if (!irq_data)
> > +     pmic_typec_pdphy =3D devm_kzalloc(dev, struct_size(pmic_typec_pdp=
hy, irq_data, res->nr_irqs), GFP_KERNEL);
>
> extra long line, checkpatch.pl didn't complain about this?
>
> > +     if (!pmic_typec_pdphy)
> >               return -ENOMEM;
> >
> > +     pmic_typec_pdphy->nr_irqs =3D res->nr_irqs;
> > +     pmic_typec_pdphy->dev =3D dev;
> > +     pmic_typec_pdphy->base =3D base;
> > +     pmic_typec_pdphy->regmap =3D regmap;
> >       pmic_typec_pdphy->vdd_pdphy =3D devm_regulator_get(dev, "vdd-pdph=
y");
> >       if (IS_ERR(pmic_typec_pdphy->vdd_pdphy))
> >               return PTR_ERR(pmic_typec_pdphy->vdd_pdphy);
> >
> > -     pmic_typec_pdphy->dev =3D dev;
> > -     pmic_typec_pdphy->base =3D base;
> > -     pmic_typec_pdphy->regmap =3D regmap;
> > -     pmic_typec_pdphy->nr_irqs =3D res->nr_irqs;
> > -     pmic_typec_pdphy->irq_data =3D irq_data;
> >       spin_lock_init(&pmic_typec_pdphy->lock);
> >       INIT_WORK(&pmic_typec_pdphy->reset_work, qcom_pmic_typec_pdphy_si=
g_reset_work);
> >
> > -     for (i =3D 0; i < res->nr_irqs; i++, irq_data++) {
> > +     for (i =3D 0; i < res->nr_irqs; i++) {
> > +             irq_data =3D &pmic_typec_pdphy->irq_data[i];
> >               irq =3D platform_get_irq_byname(pdev, res->irq_params[i].=
irq_name);
> >               if (irq < 0)
> >                       return irq;
> > diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drive=
rs/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > index 8051eaa46991..7c5cf8061f04 100644
> > --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
>
> Can you just convert one driver at a time please?  This should be a
> patch series.
This is not the same driver?
>
> thanks,
>
> greg k-h

