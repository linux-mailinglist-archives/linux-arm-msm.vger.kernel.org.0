Return-Path: <linux-arm-msm+bounces-105987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO/CFgYJ+mlsIgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 17:13:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E4B4D00B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 17:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA44430ADC20
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 15:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41712480DD2;
	Tue,  5 May 2026 15:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DldJROvJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D450480DCD;
	Tue,  5 May 2026 15:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777993548; cv=none; b=aL+G8LyouKPuXuyBrFrBeNOccdDLkrrLU8cDowu4THsi0ocZcIGca57gfROqBb55qdQ8yFKF7guLEsKKcv1z/1izp0/agSdozouGRlnd+wv+YJMWbBalpjzhfBI34l5/qiHmoemO7rqXvvpMto6BBDVunET5pDEjNLyRVK8eawY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777993548; c=relaxed/simple;
	bh=fjhctLjrzP8ABWybAS9/Xz+fkBSmi6e/VKPohchYNGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khclFOPjhhMNyyBC/aW65FFbGyTCxdKzzw+NnWdYKN2K+7kZHPc1Q9BKC1hPnbiHoglFihxgtJKF3zM1nq6zmRc6/rnjgc+aJ2x+OZJpb7AqW28lsqcIzUp1cxNeNtkuR9O3whO7KAcOmdhpGFLu/cusudIIzktRPV9IF+UcHdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DldJROvJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FAE2C2BCC7;
	Tue,  5 May 2026 15:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777993547;
	bh=fjhctLjrzP8ABWybAS9/Xz+fkBSmi6e/VKPohchYNGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DldJROvJl+GnItu11wN0UY1H6kpVglyyugjbuNb0x52JurAYJp3+RIldpVzIMIpDH
	 3UjyLAJ9kK1WNvj3gSQRs3BnPKMtVMdw/w90NVfsApy1YWCtUFAPVxGwQ3YDYGdpt5
	 UIrav3YWYVCyZv7zW8B2l2uT0XPCZmoqAiHxn9gQMH3Kf+gH++H+nyUfbG+58tXsFK
	 NcQBpoqwfWIw1c7gT36EjY2QkTAwdEHgq1T/Y5KbgzazK7Q7b8NQPPIlrahhBkUOAu
	 nkD4JblRwUB+x3kManmAZCtgsYqpt4mYTuvxQ3I0ML9cSjyeSRp3zr9A9W0gOhNf5W
	 a0cfPTqAE3G+w==
Date: Tue, 5 May 2026 16:05:38 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	John Stultz <john.stultz@linaro.org>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD
 cells
Message-ID: <20260505150538.GE2661693@google.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
 <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
 <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com>
 <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
 <d6112b9c-01ea-483c-98fe-b480e78872e5@oss.qualcomm.com>
 <ce92a493-5016-41a2-8337-d2227cdf760a@oss.qualcomm.com>
 <CAMRc=Md_OON4cAGcJ=jDu=VY_mw0qa8HPz4VCDxYLpr7JMxLRw@mail.gmail.com>
 <37ab0178-1c9d-409e-bbaa-832f8075afa4@oss.qualcomm.com>
 <CAMRc=Mcqa5RMarC+6pVYYvYsuJ03GQMtM=69bQMxyotN1u2B0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcqa5RMarC+6pVYYvYsuJ03GQMtM=69bQMxyotN1u2B0w@mail.gmail.com>
X-Rspamd-Queue-Id: B6E4B4D00B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105987-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

On Thu, 30 Apr 2026, Bartosz Golaszewski wrote:

> On Wed, Apr 29, 2026 at 6:10 PM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
> >
> >
> >
> > On 29-04-2026 15:20, Bartosz Golaszewski wrote:
> > > On Wed, Apr 29, 2026 at 11:46 AM Shivendra Pratap
> > > <shivendra.pratap@oss.qualcomm.com> wrote:
> > >>
> > >>>>
> > >>>> If set, it would be called from MFD core and would do the name lookup
> > >>>> and return the fwnode which would then be assigned to the cell device?
> > >>>
> > >>
> > >> Or should we just drop this patch for fwnode in mfd-core?
> > >>
> > >> Export a new call in reboot-mode framework as:
> > >> reboot_mode_register_node(struct reboot_mode_driver *reboot,
> > >>                     struct device_node *np / fwnode)
> > >>
> > >> Use the parent node in psci-reboot-mode and find reboot-mode and call
> > >> reboot_mode_register_node?
> > >>
> > >
> > > No, I think the reboot-mode device (as pointed to by the dev field of
> > > struct reboot_mode_driver) should be associated with the right fwnode
> > > from the start so it should be handled in MFD core.
> >
> > Ack. something like should be fine?
> >
> > drivers/mfd/mfd-core.c :
> > +       if (!pdev->dev.fwnode && cell->get_fwnode) {
> > +               fwnode = cell->get_fwnode(parent);
> > +               if (fwnode)
> > +                       device_set_node(&pdev->dev, fwnode);
> > +       }
> >
> 
> Possibly we could find a better name, but yeah the general idea is sound.
> 
> Of course, let's maybe here from Lee if he's ok before sending a new version.

Send away - I'll review in the context of the whole submission.

-- 
Lee Jones

