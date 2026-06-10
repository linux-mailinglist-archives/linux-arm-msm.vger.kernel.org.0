Return-Path: <linux-arm-msm+bounces-112525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SpgGD76XKWogaQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:58:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F9166BBFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:58:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QwFBHfec;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112525-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112525-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B34063068E99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 16:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58623340405;
	Wed, 10 Jun 2026 16:42:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406CD29D266;
	Wed, 10 Jun 2026 16:42:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109733; cv=none; b=EVqZFE3+qwreOylRQalZun5Tbz56++KZezr6NTtpFQ6M2de6SLU3mnKirX5fXDv7W9rIHPAK1CIagCCZzq+t3O9jnlQ42LKqt2enDd4Aq2eWqrRkbmWhkNyPw1P9Mkf6PrCvela5XXAHuCOQ1FmPui2+U//0r6MmCb+Y3P54r7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109733; c=relaxed/simple;
	bh=eA0BTjC7roZkBQyuYLYbCK8oC+CuUwcnIBiS2S3V2lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEzzGgqZ0H1xt77Q+GlzJQjIkRWTtnuVUSED5hpaeVtIbiOl6g0qG/OA1ABaaMvRt+fVYQs4XCIhchtjXfGtRPDy8EGPEmEvVzOY7RGScShEpGcq813Tgyk5V6trk6KkQPrhYQCa41lNbU12ChIesCSuCuQDFB8ruVanq2QI0eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwFBHfec; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74631F00899;
	Wed, 10 Jun 2026 16:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781109732;
	bh=Xef98mP1MGAw6RwWxPpvhMdt6Ao9d0YrsHgC34pKfZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QwFBHfecxJCvxHGywktWKI2TXD1aDOupuAm+hxm8dlnrJFMFAojvODhlyXVEfu9yv
	 oyrAOzHT8QXkR20RoaPRF/wNX+wYooZ+a9EmSVhjrRiECBwzWJSrbxTK84m74b55XT
	 xGb2fXAQbrkfEKkvwB+lORojM/HKbz+8ftTkPjc0PiReMBglObXLexO/pg46e5INDO
	 g3ELVWkgc4qFw5lt5nFsuaKSAAZcMR78/rGsvqdT0VwKMKlktskaVL46GrrbHGiGaY
	 PR32G/HpRQZiFS1xDy3b2jKZ6sm7uRcSOmdFaibXlX9KJ5RbI2VqHO6K8odxMTx/6a
	 DN6UjNxd0WyxA==
Date: Wed, 10 Jun 2026 18:42:02 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add QCA2066
 M.2 WiFi/BT support
Message-ID: <ibfbihcivzxmy4go6w6a6jvohha72inadqg7jgy4qnvzhc34wx@qsfbybbqcpxi>
References: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
 <20260520-monza-wireless-v1-3-9f6942310653@oss.qualcomm.com>
 <jetl37zsfcs5kl4b7iarbngrdu4ebp7ag2cvpqvkku6tbl6r5n@qozh6n5fq7f3>
 <CAFEp6-0A=LrU44pu2rfUqXW9k9peSu=b2qq_FVs4WZUj-g4pDA@mail.gmail.com>
 <n6kl7y47hztf7tgtdxhakpekwkxlleggv4sbzpsd2ncpill6ii@bdk5esjubv4t>
 <CAFEp6-3Gbd1gzfeu5xdfBJixL6JXaoSFkRUsBjOji0ZEOHHyvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-3Gbd1gzfeu5xdfBJixL6JXaoSFkRUsBjOji0ZEOHHyvw@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112525-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qsfbybbqcpxi:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36F9166BBFE

On Wed, May 20, 2026 at 04:41:18PM +0200, Loic Poulain wrote:
> On Wed, May 20, 2026 at 4:36 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Wed, May 20, 2026 at 04:29:40PM +0200, Loic Poulain wrote:
> > > On Wed, May 20, 2026 at 2:34 PM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Wed, May 20, 2026 at 01:01:44PM +0200, Loic Poulain wrote:
> > > > > Add support for the QCA2066 (QCNFA765) WiFi/Bluetooth module on the
> > > > > Arduino VENTUNO Q board. The module is interfaced via LGA and is
> > > > > compatible with the M.2 Key E.
> > > > >
> > > > > Add wireless-lga-connector node using pcie-m2-e-connector binding,
> > > > > connecting PCIe port 0 to the WiFi interface and UART10 port 3 to
> > > > > the Bluetooth interface.
> > > > >
> > > > > Add pcie@1,0 downstream port node with pciclass,0604 compatible so
> > > > > the pci-pwrctrl driver can acquire the power sequencer and enable
> > > > > the M.2 slot before PCIe enumeration.
> > > > >
> > > > > Add nfa725b_default_state pinctrl for the W_DISABLE1/2 GPIOs
> > > > > (gpio56/gpio55) used by the power sequencer.
> > > > >
> > > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 65 +++++++++++++++++++++++
> > > > >  1 file changed, 65 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > > > > index 93ed575817af1c5e903662c209ead629fe202ee2..6fcad77f320cb82eccb6f07244d185abfb1976d9 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > > > > @@ -154,6 +154,39 @@ vreg_nvme: regulator-3p3-m2 {
> > > > >               enable-active-high;
> > > > >               startup-delay-us = <20000>;
> > > > >       };
> > > > > +
> > > > > +     wireless-lga-connector {
> > > > > +             compatible = "pcie-m2-e-connector";
> > > >
> > > > I think it was discussed that LGA can't be an actual M.2 E-key
> > > > connector.
> > >
> > > I am not sure I followed this discussion. Do you mean that I should
> > > introduce a dedicated LGA/vendor-compatible string in the compatible
> > > list of the pcie-m2-e-connector binding, or that LGA-based designs
> > > should not be described using the pcie-m2-e-connector binding (graph
> > > representation)?
> >
> > I think, it should be a separate, vendor-specific compat (maybe using
> > m2-e as a fallback).
> 

You can use "qcom,pcie-m2-<size>-lga-connector", where size depends on the
module size, like 1620.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

