Return-Path: <linux-arm-msm+bounces-100340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNzQAAiPxmlLLwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:07:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EB7345C1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D5F130F8326
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085C83EE1DA;
	Fri, 27 Mar 2026 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZKNTyI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DC83EB7F8
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774619960; cv=none; b=pGItKCP8y1OCdzwTpSR8qCOmnoYW8x82DLU9h9BrjOjXkgAdiE7QvaxL2Pwg8uZ2ab9U4OPmwwai2Deg2lyVPSBVbK384hNatLCeBtOOrWX6IdxCZjdAYOh40KzB0VHiP5ROAPChSq2bpxwfTtE05RKsZBJQutg1iMJq8uYV6P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774619960; c=relaxed/simple;
	bh=8xzdYoi3gi518bjSufdEEG4WtJrX0WYlJOv7k2yVMAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rV/pTMW9VqDq7RRkTEl8cxqIPAkvNV0YSmHgppDeb+9Kva9hJ4xFRiepksnuVrLPk/BgW27oLeoOCJuGVXMKUUcdweMpkN/6U9/JHZpvr3CiStMVuctYtnUjIMDB6p/OUlvdS/o/6x5MTNAkfsedfXoJ7r3G1G30IgJG3JlKYII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZKNTyI/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7647C2BCF7
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774619960;
	bh=8xzdYoi3gi518bjSufdEEG4WtJrX0WYlJOv7k2yVMAI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NZKNTyI/kBAnIR0HZvkBqOTDvrCbjhLEUS/OH0E+5lR+Fw4M4UKzhS87SAxD944QF
	 Zls3jH8x6EPxptfI+8vWACCOiBccBJbkMTp7utd0irXgITCxyauMELtC+u1H2XVFzx
	 wB1SdRI0gvIsrprLra9WIPbabuHAuDsAGz0VmyOtipr7WtCysuTeWO/O13xKx77Lf7
	 W5FFA6bjO5D3X2oC9Kzmd8pnb1lYs8uGFOjfOYD3lsSAF92ep+YKUVfBNF77w544Te
	 cPtUZfoUuH3xkUKxCp5/RJQE43CzZXibvnaISxkT6ZxSe8HU6EOAfAiaRe3mOGMLjl
	 42Tu60owotsGQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a2ad56dbb2so464568e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 06:59:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVkYMENHhiR4CiXhNy5Z8ljA8Mr0hay9rHZN1HUs0XAs6MAr7NprQ0cksD6mwKzPTBRXnzyS+EaPTNsmGJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi6qxbgsI+mAef45yXEPDjm94pnAH20Mav8wdgQcrzgC4e/vxB
	FjgF9PJZ88TvJ/W1wHeBAC6bb2xSSbCoYq+4hobehjEDGI6OXqDOEaJuVcgv1khaV6CugaVlRZW
	LlnYlSrdSR5GAe/MpJkjkKWJh4+lb+AWQoQi7lQDyhA==
X-Received: by 2002:a05:6512:318f:b0:5a2:8450:edad with SMTP id
 2adb3069b0e04-5a2ab93f8b8mr904034e87.45.1774619958969; Fri, 27 Mar 2026
 06:59:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <acaMPgRALnoUIHMC@lpieralisi>
In-Reply-To: <acaMPgRALnoUIHMC@lpieralisi>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 27 Mar 2026 14:59:06 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfRWDava8jyT90ah1LBK3udAgcTCc7q-S_Kb4U3CR5smg@mail.gmail.com>
X-Gm-Features: AQROBzAnj1Wvu_HThCZA2lw78sbVKD9HXLQMgd3NlSn5WjYR9EmBsH-p5sQhJxg
Message-ID: <CAMRc=MfRWDava8jyT90ah1LBK3udAgcTCc7q-S_Kb4U3CR5smg@mail.gmail.com>
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, John Stultz <john.stultz@linaro.org>, 
	Moritz Fischer <moritz.fischer@ettus.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100340-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,arndb.de,kernel.org,arm.com,rock-chips.com,gmail.com,linaro.org,ettus.com,broadcom.com,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B6EB7345C1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 2:55=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@kerne=
l.org> wrote:
>
> > +
> > +static int __init psci_reboot_mode_init(void)
> > +{
> > +     struct device_node *psci_np;
> > +     struct faux_device *fdev;
> > +     struct device_node *np;
> > +     int ret;
> > +
> > +     psci_np =3D of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
> > +     if (!psci_np)
> > +             return -ENODEV;
> > +     /*
> > +      * Look for reboot-mode in the psci node. Even if the reboot-mode
> > +      * node is not defined in psci, continue to register with the
> > +      * reboot-mode driver and let the dev.ofnode be set as NULL.
> > +      */
> > +     np =3D of_find_node_by_name(psci_np, "reboot-mode");
> > +
> > +     fdev =3D faux_device_create("psci-reboot-mode", NULL, NULL);
>
> Same comment as Bartosz (have you picked up his work and working towards
> a solution) ?
>

Hi Lorenzo!

Yes, I suggested creating an MFD driver binding to the "arm,psci-1.0"
compatible node which will have two cells: one for the existing
cpuidle-domain functionality and a second for the new reboot-mode
driver. This way we'll simply add a platform device as Greg suggested.

Bart

