Return-Path: <linux-arm-msm+bounces-111982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ikmVFKk8J2pTtwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 00:05:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF2F65ADEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 00:05:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dLwywX4r;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111982-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111982-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 273323051D7C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 22:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A841E3B14B5;
	Mon,  8 Jun 2026 22:00:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3576B3B0AC8
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 22:00:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780956033; cv=none; b=jQm9bgshGtjfdQXh2rDR5XIFXo4Y3RAVnKu3uma0uGSBMgwOwaU8U7Yvwu1wJHsvMpSiT3ALGtrp195M/EPC+Mrya5be8Liq7BUqc4rJrEEWaFTZK3/8n1SzmA5oGEqqsBN17SaAliQKkqlaNdIVUyCIulFGjswzaFxIFTeV8QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780956033; c=relaxed/simple;
	bh=IzESvFnhCYn97aXY6nqphhFiilo3F8St0OslnhgQSoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RbI19WjiH6E9vISiuHW1KU3JhrxFGs7zSS6KuIoF5tV2DJG4YOs5/eyMN2qVtq52ZHXanHTOIo/4HWROMCKW0tNphnNTI28osawz1+T23Fj8IfkY2wB7Z3UDc8TsboSXXn8SlmbaXxAnq2hMdS7WdluC34yA8exrXr0FMyFk1HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLwywX4r; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9D71F008A1
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 22:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780956031;
	bh=jb7RV/qk2bTsC6/KakieWWnU8OYtdu6KJXXSiPsfc+k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dLwywX4rpCBTvp/kTBUlFWQpI3TNqkkZGe1n61/yD5xKgJKZqxukIVI4kP3dnCM2g
	 tTwWu55SLH7owV942hstnkIKUTBM63iKWsqYJg1xWeu5QXZI3HiefpP4TcgRH+HinE
	 8qiW724eM4o74Dk0lPmeTV/tiZE9yNIuzn069zb6G4vJqgpCPJebugOhlOWi73GtLC
	 h26QluQG3T5iFfyi3FfLVu6JvXHpr9BAR1q5cFm373jBmWzf0cx0bcVk2tvm8e+0tW
	 cxJB4LsqSYrbdFiiuDKQ86fb2e7hjZA6OK+/zPUtHfN+V2iHoZZL3zbEBf/8oaP31P
	 9t4r0DEoaPQ4g==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bec3f69d343so713736566b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 15:00:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9udoZ/5fBhzXHtIfmcTf0B5S3EMKDxlbmFZ3BXeOnmsa73WYQBuXmAESe+i/5FnNSeSpoJGDu7YoiZEddE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwxb79/d7saYH8jeXfLrZHT1evktpnZyCIeWZFQDPnIZK0zh49
	B4QhBTuTX5kPa1fViZG/BEqtkjV3jmZNbDynn1m4/1k3SYhU4ldKIoK/aMnGFUyGLWwCgw66He0
	1rZpz7tID0bSElR6zAHKK4XXvGbG1ZA==
X-Received: by 2002:a17:906:8a48:b0:bed:6e53:bb25 with SMTP id
 a640c23a62f3a-bf37301d00amr623870466b.40.1780956029611; Mon, 08 Jun 2026
 15:00:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601231236.20402-1-oliverjwhite07@gmail.com>
 <20260601231236.20402-2-oliverjwhite07@gmail.com> <20260605190638.GA4188454-robh@kernel.org>
 <45e5pepjwfixymk26uodz3pqhe44n2duo5dp5aflajbh3xv2kl@3nhzdev6dxq6>
In-Reply-To: <45e5pepjwfixymk26uodz3pqhe44n2duo5dp5aflajbh3xv2kl@3nhzdev6dxq6>
From: Rob Herring <robh@kernel.org>
Date: Mon, 8 Jun 2026 17:00:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJi62TqakY6f+BzmaWx0Cr5m5KZT-GnMeLvNYRDTH-r3g@mail.gmail.com>
X-Gm-Features: AVVi8Cf5LYdQ8Kl5n6k9ZX1XB4T4brKT1oyPdYS4ZmEjCDlhTBk9v9YwV1HuM0Q
Message-ID: <CAL_JsqJi62TqakY6f+BzmaWx0Cr5m5KZT-GnMeLvNYRDTH-r3g@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc3: document snps,reinit-phy-on-resume
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oliver White <oliverjwhite07@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111982-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:oliverjwhite07@gmail.com,m:gregkh@linuxfoundation.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Thinh.Nguyen@synopsys.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:balbi@kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org,synopsys.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBF2F65ADEB

On Sat, Jun 6, 2026 at 6:21=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Jun 05, 2026 at 02:06:38PM -0500, Rob Herring wrote:
> > On Tue, Jun 02, 2026 at 11:12:34AM +1200, Oliver White wrote:
> > > Add the documentation for the 'snps,reinit-phy-on-resume' boolean
> > > property. When set, the DWC3 core will perform a full phy_exit() +
> > > phy_init() cycle on each USB2 PHY during the host-mode fast resume
> > > path. This is needed on platforms where the USB2 PHY power domain
> > > is gated during deep sleep even when device_may_wakeup is true.
> > >
> > > Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
> > > ---
> > >  .../devicetree/bindings/usb/snps,dwc3-common.yaml      | 10 ++++++++=
++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.y=
aml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> > > index 6c0b8b653824..d12f6ae81ab8 100644
> > > --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> > > @@ -212,6 +212,16 @@ properties:
> > >        When set, run the SOF/ITP counter based on ref_clk.
> > >      type: boolean
> > >
> > > +  snps,reinit-phy-on-resume:
> > > +    description:
> > > +      When set, the DWC3 will re-initialize the USB2 PHYs during the
> > > +      host-mode fast resume path (device_may_wakeup). Some platforms
> > > +      cut PHY power during deep sleep even when USB wake is enabled,
> > > +      and the standard PHY runtime PM resume is insufficient to rest=
ore
> > > +      the PHY register state. This quirk forces a full phy_exit() +
> > > +      phy_init() cycle on each USB2 PHY.
> > > +    type: boolean
> >
> > This should be implied from a platform specific compatible string.
>
> Platform as in the "root node compatible"?

No, the SoC specific one in the node you are trying to add this property to=
.

Rob

