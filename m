Return-Path: <linux-arm-msm+bounces-92350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODfoBwUnimlKHwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 19:27:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65043113872
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 19:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C45933011580
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 18:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A6A346A19;
	Mon,  9 Feb 2026 18:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ysk9N2ch"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34F62F6907
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 18:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770661633; cv=none; b=Lohm5zjh6ItN5gqh2a7OBUkQHg5WVxCOA2VY3fYsz8EkjG1tMOmGJkQ2L5MySn8/vR9gvrw/+844UlWYmwotSzjQ+t8XJ/ZltH0rRhh2+zjZqyeEBhcz9tsg434ZYXmXRCRuSlnFsm/inKzgsqbVMbSfLivLBsWATVpU6E82CBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770661633; c=relaxed/simple;
	bh=eOXOAe9ngpOVhoSs4SanKXrR9o9gzH+dT8URS8aJ/P4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEbe2eBGTfj9OxTFa62QtgxBOwWpaXThZPNxuyo20t/XOOxogcFWWnHhizG2w6FtobDCvud/FHZ/wr65u+IpClOnQCZOE2EFNXC+P2TlJFZDcvNDMuTThv17Zbf5TiSeMg7w9esKKL9g2y9gFqgcaM/RDnJsj3mSrPu3Wnnez/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ysk9N2ch; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2D3C4AF09
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 18:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770661632;
	bh=eOXOAe9ngpOVhoSs4SanKXrR9o9gzH+dT8URS8aJ/P4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ysk9N2ch6ivY1YjEV5/8/+45MkbrCML54PJdyNcniBvBJMJBpOgj73osA9dggXvu/
	 zJsczdwlnaNo85YUFQx27sFFY66Djvdec2x36BRKGVQZjo+fL57z1kA+1XIXx6Qo1P
	 FiuSaaltmFduuy2Hcay3GCOVZd2fdGJxJVMK0uu+zRd+B3h5qUHUwmJeKqfr3YFowH
	 r9CeTStLWxkp02mz2tKGz3DeT4kQRtkXH3y/xHHo0THEbnALOl52HKAUmUdNhFS+2h
	 FFsgoVhIttiqQI2CfZeCKab2UH8npGbYXfyOIMtzpFMxRm/UPdR8o/ViROuZk6gK+e
	 H+B4JejXYKp5w==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65815ec51d3so5088739a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 10:27:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVcuLlY7B25Jz693bBNzpnrtWmJ6JW7CI3oOpaKSTGucFRYWcZqXGvsO6FXPELVff+jAJpUUZR6I2kI+5gc@vger.kernel.org
X-Gm-Message-State: AOJu0YwSLO8N8xX3VnbR4takTk9qt71eTYLyQKPqNa5M21amzqL0MWle
	QJSkUOXAxTuhPvptc9mW6hJC4PkBDQTTxDuZt7VJt9hrJEvGgRAtx7wSsAsKBE4I7l+Q9jobZp8
	3KYAvOkKVZh2/j+xX1siuRFsLlXXwYg==
X-Received: by 2002:a17:907:d15:b0:b8a:fd04:c789 with SMTP id
 a640c23a62f3a-b8edf19de11mr672783666b.22.1770661631173; Mon, 09 Feb 2026
 10:27:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205070640.10653-1-manivannan.sadhasivam@oss.qualcomm.com>
 <bfba9d62-2741-47b8-8325-2d932c20c9e7@oss.qualcomm.com> <lnzmgsdjckbf6u5hxfqm4kzlmcg2cqvszcg7otmkqxaj3yzdfq@vu232xx5kts3>
In-Reply-To: <lnzmgsdjckbf6u5hxfqm4kzlmcg2cqvszcg7otmkqxaj3yzdfq@vu232xx5kts3>
From: Rob Herring <robh@kernel.org>
Date: Mon, 9 Feb 2026 12:26:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLgTriMgQaL_Nbi72nOD=AFdHggKXs3RkKA0UzzChhTUQ@mail.gmail.com>
X-Gm-Features: AZwV_QiouFq8bjEKlZatGSqr2rYaJl9y245UvE6g1661Y42aCiANp3WtZlqOBBo
Message-ID: <CAL_JsqLgTriMgQaL_Nbi72nOD=AFdHggKXs3RkKA0UzzChhTUQ@mail.gmail.com>
Subject: Re: [PATCH] of: property: Create devlink between PCI Host bridge and
 Root Port suppliers
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, saravanak@kernel.org, 
	andersson@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	qiang.yu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92350-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 65043113872
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 3:01=E2=80=AFAM Manivannan Sadhasivam
<manivannan.sadhasivam@oss.qualcomm.com> wrote:
>
> On Thu, Feb 05, 2026 at 09:50:20AM +0100, Konrad Dybcio wrote:
> > On 2/5/26 8:06 AM, Manivannan Sadhasivam wrote:
> > > In the recent times, devicetree started to represent the PCI Host bri=
dge
> > > supplies like PHY in the Root Port nodes as seen in commit 38fcbfbd42=
07
> > > ("dt-bindings: PCI: qcom: Move PHY & reset GPIO to Root Port node"). =
But
> > > the Host bridge drivers still need to control these supplies as a par=
t of
> > > their controller initialization/deinitialization sequence.
> > >
> > > So the Host bridge drivers end up parsing the Root Port supplies in t=
heir
> > > probe() and controlled them. A downside to this approach is that the
> > > devlink dependency between the suppliers and Host bridge is completel=
y
> > > broken. Due to this, the driver core probes the Host bridge drivers e=
ven if
> > > the suppliers are not ready, causing probe deferrals and setup teardo=
wns in
> > > probe().
> > >
> > > These probe deferrals sometime happen over 1000 times (as reported in=
 Qcom
> > > Glymur platform) leading to a waste of CPU resources and increase in =
boot
> > > time. So to fix these unnecessary deferrals, create devlink between t=
he
> > > Host bridge and Root Port suppliers in of_fwnode_add_links(). This wi=
ll
> > > allow the driver core to probe the Host bridge drivers only when all =
Root
> > > Port suppliers are available.
> > >
> > > Reported-by: Bjorn Andersson <andersson@kernel.org>
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualc=
omm.com>
> > > ---
> >
> > [...]
> >
> > This is not 'required' in bindings and device_type=3D"pci" doesn't uniq=
uely
> > identify root complexes (as can be seen below).. but I suppose this is =
the
> > best delimiter we've got
> >
>
> Yeah. There is no way to uniquely identify the Host bridges in DT. So I h=
ad to
> settle for this.
>
> Maybe I can check for 'device_type', but that will create devlink between=
 switch
> port supplies and Root Ports.

You can also check the parent is not PCI to exclude that case.

Rob

