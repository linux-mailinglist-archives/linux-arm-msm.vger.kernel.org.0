Return-Path: <linux-arm-msm+bounces-109056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOmfAOT6DmoSDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:30:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 998035A4D7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E28D03013BAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CB63D171A;
	Thu, 21 May 2026 12:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1jqSUmc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB643C5857
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366603; cv=none; b=US76SYUc1nCxDqMuktL53hT1yvtAS/cPpnU3lrFLRmT/tzFcpH+FYnsIaZxIM/qjeAQf58w8532hWDh2LogoSnjqpUxSQ6YaXjDT+WgM992Ic7oyXlA/aGNbsgtnwRSBrOa8yLka0cDRS7MffgSuOE0Kut/5RMHEC+L681U6v0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366603; c=relaxed/simple;
	bh=AthNzADx4Hx45Myqp4Ob4bnRZf2sGLXimuEir7TlLzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pz3mNuLcc3B1KQmKmxYGc9YiPns90ZzOU1JjyJoqliNp4YkJoIyIhDq6dGkM9WYZUb5W6wII5K0+tIldhwEFA6vHGKhfXaim04a1mrsC5JdMfnNB+Rs1/1HZGKnhExO7xtytk6NKkK85cPsXZJSYZEWMQnkw8nthHJU7PfnktpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1jqSUmc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B70F1F01561
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779366601;
	bh=tVEy4bk+Ysy/PxvkO6UbyKlL7eR12NG2pfwpsWxFCJE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F1jqSUmcYnthfkQnFfnCvLn/A6tGh5oXaX3nFTtFrt2Z4oOU5WmD13BXbQFN/sv/1
	 ROqO4wWGJFN6DiTr/WCkLMUjyeu2eyGTDlM89GgAGk+ldhgiDwNGN7gW23WdLDJjRE
	 SKvTDAlEUYtvDMR1C+/a030lRN+2XddF4S8zvO06v8JXmPcLqvL6IIsSEvdXmbU29l
	 j15tVXgEPz+J0sEba6ND5Urk7JdXiZDb6qOIWZ7Mh9Uu83ddKtEux2fDDEyQAHeOi6
	 t0q5KVDNe8BtnCaVs1Qem5hnlu8+NPLLEhsQ6YppYecIMFfSlXy3sN3d7CuvwIYQ83
	 H7U0FFPo7nkJw==
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-132830d8281so5219217c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:30:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8MF5nOL8VoNT8VSqut435hLZaDjayilOfyM70ylj0UqZMVNpHZLgx9Lkm3E9/jf+U/Ukt7h2wj3jxu1xbB@vger.kernel.org
X-Gm-Message-State: AOJu0YwqqMMHGGNv7Q/CKRx5CmWJ3oyI5+tnhQgDcUlkd+KBN8wxz80A
	Fd31uV/Kc06leZ3GjmkOH8rmceNPDTeownuxk75xH287rlkiuzipM7RLkcYuu0IsH6v5Cu24RnG
	lY08wCXDrwfz2MBxiXaeRQXy0VhRolKewSiwzaxPfiQ==
X-Received: by 2002:a05:7022:128b:b0:136:36d4:3161 with SMTP id
 a92af1059eb24-13636d431c9mr1046604c88.11.1779366600232; Thu, 21 May 2026
 05:30:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
 <20260521112638.GD2921053@google.com>
In-Reply-To: <20260521112638.GD2921053@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 21 May 2026 14:29:45 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfqaCjiALZyVBHQs=Taft1M9xmNTFvQHWPrd5PgcTfJDQ@mail.gmail.com>
X-Gm-Features: AVHnY4KFfkEZ1qB3plV-6mRlSK5xYq1TZ9heaLB2W6BxX5fSR4R4BqSRFGsDqgU
Message-ID: <CAMRc=MfqaCjiALZyVBHQs=Taft1M9xmNTFvQHWPrd5PgcTfJDQ@mail.gmail.com>
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD cells
To: Lee Jones <lee@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, Sebastian Reichel <sre@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109056-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com,vger.kernel.org,lists.infradead.org,broadcom.com,linuxfoundation.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 998035A4D7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 1:26=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Thu, 14 May 2026, Shivendra Pratap wrote:
>
> > MFD core has no way to register a child device using an explicit firmwa=
re
> > node. This prevents drivers from registering child nodes when those nod=
es
> > do not define a compatible string. One such example is the PSCI
> > "reboot-mode" node, which omits a compatible string as it describes
> > boot-states provided by the underlying firmware.
> >
> > Extend struct mfd_cell with a callback that allows drivers to provide a=
n
> > explicit firmware node. The node is added to the MFD child device durin=
g
> > registration when none is assigned by device tree, ACPI, or software
> > matching.
> >
> > Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com=
>
> > Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> > ---
> >  drivers/mfd/mfd-core.c   | 30 ++++++++++++++++++++++++++++++
> >  include/linux/mfd/core.h | 14 ++++++++++++++
> >  2 files changed, 44 insertions(+)
> >
> > diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
> > index 7aa32b90cf1eb7fa0a05bf3dc506e60a262c9850..cc2a2a924d6d3044e29a9f8=
64b536ee325ed797b 100644
> > --- a/drivers/mfd/mfd-core.c
> > +++ b/drivers/mfd/mfd-core.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/acpi.h>
> > +#include <linux/fwnode.h>
> >  #include <linux/list.h>
> >  #include <linux/property.h>
> >  #include <linux/mfd/core.h>
> > @@ -148,6 +149,11 @@ static int mfd_match_of_node_to_dev(struct platfor=
m_device *pdev,
> >       return 0;
> >  }
> >
> > +static void mfd_child_fwnode_put(void *data)
> > +{
> > +     fwnode_handle_put(data);
> > +}
> > +
> >  static int mfd_add_device(struct device *parent, int id,
> >                         const struct mfd_cell *cell,
> >                         struct resource *mem_base,
> > @@ -156,6 +162,7 @@ static int mfd_add_device(struct device *parent, in=
t id,
> >       struct resource *res;
> >       struct platform_device *pdev;
> >       struct mfd_of_node_entry *of_entry, *tmp;
> > +     struct fwnode_handle *fwnode;
> >       bool disabled =3D false;
> >       int ret =3D -ENOMEM;
> >       int platform_id;
> > @@ -224,6 +231,29 @@ static int mfd_add_device(struct device *parent, i=
nt id,
> >
> >       mfd_acpi_add_device(cell, pdev);
> >
> > +     if (!pdev->dev.fwnode && cell->get_child_fwnode) {
> > +             fwnode =3D cell->get_child_fwnode(parent);
> > +             if (fwnode) {
> > +                     device_set_node(&pdev->dev, fwnode);
> > +
> > +                     /*
> > +                      * platform_device_release() drops only of_node r=
efs.
> > +                      * Track non-OF fwnodes explicitly so they are pu=
t on
> > +                      * all teardown paths.
> > +                      */
> > +                     if (!to_of_node(fwnode)) {
> > +                             ret =3D devm_add_action(&pdev->dev,
> > +                                                   mfd_child_fwnode_pu=
t,
> > +                                                   fwnode);
> > +                             if (ret) {
> > +                                     device_set_node(&pdev->dev, NULL)=
;
> > +                                     fwnode_handle_put(fwnode);
> > +                                     goto fail_of_entry;
> > +                             }
> > +                     }
> > +             }
> > +     }
>
> mfd_add_device() is getting very busy now with support for all of these
> different registration APIs.  Suggest that we start breaking them out.
>
> > +
> >       if (cell->pdata_size) {
> >               ret =3D platform_device_add_data(pdev,
> >                                       cell->platform_data, cell->pdata_=
size);
> > diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
> > index faeea7abd688f223fb0b31cde0a9b69dfe2a61ff..abfc26c057d6ee46947ba2b=
6f2e99f420e74b127 100644
> > --- a/include/linux/mfd/core.h
> > +++ b/include/linux/mfd/core.h
> > @@ -50,6 +50,7 @@
> >  #define MFD_DEP_LEVEL_HIGH 1
> >
> >  struct irq_domain;
> > +struct fwnode_handle;
> >  struct software_node;
> >
> >  /* Matches ACPI PNP id, either _HID or _CID, or ACPI _ADR */
> > @@ -80,6 +81,19 @@ struct mfd_cell {
> >
> >       /* Software node for the device. */
> >       const struct software_node *swnode;
> > +     /*
> > +      * Callback to return an explicit firmware node.
> > +      * @parent: MFD parent device passed to mfd_add_devices().
> > +      *
> > +      * Called only if OF/ACPI matching did not assign a fwnode.
> > +      * Ownership of the returned reference is transferred to MFD core=
.
> > +      *
> > +      * Return a referenced fwnode or NULL if none is available.
> > +      *
> > +      * mfd_cell must be zero-initialized or get_child_fwnode must be =
NULL
> > +      * when unused.
> > +      */
> > +     struct fwnode_handle *(*get_child_fwnode)(struct device *parent);
>
> I'm very much against pointers to functions if they can be avoided.  Why
> does fwnode need this and none of the other APIs do?
>

I suggested it because of its flexibility. The alternative I had in
mind is something like a new field in mfd_cell:

    const char *cell_node_name;

Which - if set - would tell MFD to look up an fwnode that's a child of
the parent device's node by name - as it may not have a compatible.

Bart

