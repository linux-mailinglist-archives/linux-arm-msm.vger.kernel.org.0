Return-Path: <linux-arm-msm+bounces-105364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM0zGC9P82lnzQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 14:46:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EA04A2E0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 14:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B7BD3018586
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 12:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF7040B6C9;
	Thu, 30 Apr 2026 12:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EB61SP83"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A7E40759C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 12:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553194; cv=none; b=YlnPR8IjIjWoGm0M/RA7vaFAdoec02PWbYTLG+ib3AK872CVA1ev3Ow5/YF/4bJhrsIrVKcdcpZcwkjWDD5BAmycA0lShn0eU/LOKZ9WlCZS7tLFBMIMMzhOZG53/9usUtazCln5/ul5lVtOiNfbhDrFmn6jSqNAjDHsAXEJL1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553194; c=relaxed/simple;
	bh=D1ewCxGAb2m3foREBIoGUCfKhLRzglsJCqliRhlc5uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xzh9PQr1VrbRLePElk+7rNrwyklCaF6E527I5aIM1j8eHz1OGmjmRl+UbTKbKRpdcDMwZbe/Y4R523bMaSOgmCZmgaW7XdVPnTG6YDgsgt0h7WFPqHJu9lBCCUVr/e2/Nwt7ob2sdSBcsFBUgMpPIoUXgPKOsAF6Aqxb53met2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EB61SP83; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EE1C2BCB3
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 12:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777553194;
	bh=D1ewCxGAb2m3foREBIoGUCfKhLRzglsJCqliRhlc5uM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EB61SP83XT8Wxl4rL9jsKqwm3TfIBflkG3FXxPOa8N1RtHeOibrAo1kLff64bzobM
	 8g6nXPIGbfk1pDoEgZ/d6B3tJcVqreztpFAIfg1ibwE+UiVp972JnF6xrQJfEiE5Wd
	 Jawi554qbrcl8lbFJNgw6a/2z/OSw+O4jDJ80zpApastWquSpXkdOAnGTft86bw5Iy
	 2SQEfVn50kMRAkGXxcJqyjAXxHPgvMc6p+PcIb1NffgE7gMRugiMYa04LVTksC1EX6
	 wQYot1UvGm4PkAHBVA0O88nE/omrLuPCPG/luE3YN3L7zWDWqVieh5VIIGFy9JHgP/
	 1ENXa5lzCpP+A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38e7d984096so10268101fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:46:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ93A88Tq8VA0lIj1TE/wcd7uuJAsNjxRFJ1lQPgB4DXHYbtXf1VzTtibOh+lxtRTnoPKpNv/aUpIUls7xz7@vger.kernel.org
X-Gm-Message-State: AOJu0YwPuFE4XvlgRpKnrd/CxslDNVK52f9K01pX3zlMRjQo6PWyn/lM
	WpqsPpAwpy+I+kk7HjnwunyL+PI99++WCaiS7PPiMbAoVIWQzKb/zDBZA+7oomDNu2rg1Kc9eWF
	Zi+0qitvwusvJda/vLQQ2mIOcxx7yGFfO6wtm3ndnwg==
X-Received: by 2002:a2e:a108:0:b0:392:5c61:c583 with SMTP id
 38308e7fff4ca-3934e1f951dmr8911411fa.23.1777553192507; Thu, 30 Apr 2026
 05:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
 <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
 <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com> <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
 <d6112b9c-01ea-483c-98fe-b480e78872e5@oss.qualcomm.com> <ce92a493-5016-41a2-8337-d2227cdf760a@oss.qualcomm.com>
 <CAMRc=Md_OON4cAGcJ=jDu=VY_mw0qa8HPz4VCDxYLpr7JMxLRw@mail.gmail.com> <37ab0178-1c9d-409e-bbaa-832f8075afa4@oss.qualcomm.com>
In-Reply-To: <37ab0178-1c9d-409e-bbaa-832f8075afa4@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 30 Apr 2026 14:46:19 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mcqa5RMarC+6pVYYvYsuJ03GQMtM=69bQMxyotN1u2B0w@mail.gmail.com>
X-Gm-Features: AVHnY4IEmLYwEMMCdiN8KiXAHy3-1wn0tdvvY2-O1xx2kdj2ex6VTQTyzM2bmGc
Message-ID: <CAMRc=Mcqa5RMarC+6pVYYvYsuJ03GQMtM=69bQMxyotN1u2B0w@mail.gmail.com>
Subject: Re: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD cells
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E7EA04A2E0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105364-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]

On Wed, Apr 29, 2026 at 6:10=E2=80=AFPM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
>
>
> On 29-04-2026 15:20, Bartosz Golaszewski wrote:
> > On Wed, Apr 29, 2026 at 11:46=E2=80=AFAM Shivendra Pratap
> > <shivendra.pratap@oss.qualcomm.com> wrote:
> >>
> >>>>
> >>>> If set, it would be called from MFD core and would do the name looku=
p
> >>>> and return the fwnode which would then be assigned to the cell devic=
e?
> >>>
> >>
> >> Or should we just drop this patch for fwnode in mfd-core?
> >>
> >> Export a new call in reboot-mode framework as:
> >> reboot_mode_register_node(struct reboot_mode_driver *reboot,
> >>                     struct device_node *np / fwnode)
> >>
> >> Use the parent node in psci-reboot-mode and find reboot-mode and call
> >> reboot_mode_register_node?
> >>
> >
> > No, I think the reboot-mode device (as pointed to by the dev field of
> > struct reboot_mode_driver) should be associated with the right fwnode
> > from the start so it should be handled in MFD core.
>
> Ack. something like should be fine?
>
> drivers/mfd/mfd-core.c :
> +       if (!pdev->dev.fwnode && cell->get_fwnode) {
> +               fwnode =3D cell->get_fwnode(parent);
> +               if (fwnode)
> +                       device_set_node(&pdev->dev, fwnode);
> +       }
>

Possibly we could find a better name, but yeah the general idea is sound.

Of course, let's maybe here from Lee if he's ok before sending a new versio=
n.

> drivers/mfd/psci-mfd.c (goes next patch):
> +static struct fwnode_handle *psci_reboot_mode_get_fwnode(struct device
> *parent)
> +{
> +       return fwnode_get_named_child_node(dev_fwnode(parent),
> "reboot-mode");
> +}
>

Yes, something like this.

Bart

