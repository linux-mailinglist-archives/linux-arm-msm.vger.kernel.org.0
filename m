Return-Path: <linux-arm-msm+bounces-106450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H92AA2o/Gn5SQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:56:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E804EAA92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED5B83016CD4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869A1410D1E;
	Thu,  7 May 2026 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="y6sHvENc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3E43FB7FF
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 14:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165235; cv=none; b=ER4DL33svr+UQbwfVaTB1LJZM1n3Oh3WhzLVRXU/d78tyQpE7+QGbwZHYDuudv9/suyGqYLHIzhCNfcG3UJR/5yOs0HgLxHFWsS8MurWoxxftfaJilAbk+Wh0Z5yvwLMJdRHqpaHZYcPw4+K/6c7gsJ718b9UDrwdH4oM0CFF2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165235; c=relaxed/simple;
	bh=/OysdnbnOtECLkkSa00qUIDUT8c+z8rBTm0QaKE643Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=arnnLe/ywX7e7pkbjOEuCErmPQFdeENwOwhkigW+EayjaBDi/cWHc+91SeQq6yn1FY7I9RVPrJ2/Ht05M9WUZRYULfGp3Oh6thtbbx9OEphcVPajKtXPKktm8M7LbrOEJmlI5qgyotadljcdutonpW4N0R1fY8Cu6e6Mw44dx7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=y6sHvENc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so8377525e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778165230; x=1778770030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QZB38wJGIZd42iBI3srRP0pjjAxDTyyGTqCWJp8RgtQ=;
        b=y6sHvENcFjVQHrSBavIoyq7oFwxMGglGYH82YKxB3rYUBU2WXPRYsxMkRmjaL8UJtJ
         8qCHl9DPDYrsxc98WoBL2OVnRxquMXDR7DJkEJ9EsIq4AZGGHrWcAHRBS18gya1ZxKtR
         EnlmuxisPmWVI/FCv2UT17Z2tvp0mlc86/WG39g8c3YrEIGrOiRRn5f3rGEvIAe9NK4M
         G3PU4X1W2bs7CtqpYJU4OLJ9+/f8MTwSAHunB19JS2FigfTQbWc1FjXIgGDLFSsZnLYJ
         srSccQtsHw2YSHp5ap4GUnDf1aUWOpktSnhkWm07DoTgrs60aRygAE7qvb6LOWLgEOL6
         oFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778165230; x=1778770030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZB38wJGIZd42iBI3srRP0pjjAxDTyyGTqCWJp8RgtQ=;
        b=FDEZJxo/6aOvyPgIM9vzipSwzjJvH9+7jDi/ohehsXw5CiTK5MudRiGNBFFTfV1uIs
         jkFZl7boXZ0vE2MMegWvjCOzqCuvT5FwypPZbTOXnY4wVHc4b0MDpVta34HuSPzuyS/3
         pQ5jnhG1FzivuvWGGbiL/m7rGBTWDHKaDQBe6aMmbH4SbSh3s0QZg4BxmnpH6T2u/KFz
         rKeuPMIqvswXbEvczIY1O0MI0K1Zyo7fxyJUAFbO9vTvI2rqLTRprIryf/UoXsrdHI+V
         zDp67i5pJGxdMeplXfFlhwG4FyX5cN5+DOBnb2nK1qhkkHPVhOakbpaZ+Yhrwy7M/4gF
         CDHA==
X-Forwarded-Encrypted: i=1; AFNElJ/y/B0jhX1+HnPk+s8y1EyvXUgMx5etjZLiijFiuPMLPtXiY3DEsXfgouOLi9ZFN06X9A7y3O1X9ss68fgG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9ARTRPc/Yb8w8Yf/FpvlQy1t0/a83aYas5XQTzTkyxA1YKYDC
	px12HptM/51eCxSUeS04DGCT8bpLL+IVdmnJodK5RTf3BDuCa8ePI2AIxKRMaM//Dkg=
X-Gm-Gg: AeBDieu6phaSFcMq536+wVbdVVRHuDlMK3dKPG5sPgZ8bD5+VdXZ/g5Uu5Dcfk/bAzR
	6lJw/vuYwPxb2B0e/9u6jKHXL6tOJXoyl10PqJ7Ypqh9U/VrMs8P5NP7EBGnHXdm8mPOpkJuFJo
	2VTkTRNh9maXQ+MQ7D/WGsohv8zk8MFp1iY52kGCRr2S0QR9ZM7DO/zMuVe/TfvYyU6N3H/WWRq
	58Tmd/SfbhMT6cU9nbHNzgErhu6dbclet7+v2tKRizntZagkKcAe7qSnrur+RDwz03YqfY64eR/
	gAJ1HFysxPSivk1TGhs//BpVKRJSEkqrrAheizYdIDxZlvNalDt3mYbhH8WRzM5Kq3WQCUcyFQw
	orCk6+4Z82b0bOi2+qnPuBVVVwFOv9obdRuIKGaUppsg2zV9RT4FxgPTlLsXNMjju1uATTAW4Y+
	B2MRBjwXlkJpEEzEGkEeFBsJ4uBtnxkgiqaVRS7E2WdZbpQiUJjJ2xTuq+t7c78aObYBSWG2BGL
	uuDRO4uNiQpLYCbYmpOivgxPPFaUdMr9coR6WdyTz8iIgxStWgYdPyvBVSj1dI6GQQH8eWhWaQa
	d6M8/A0oai4mPnOg1sY=
X-Received: by 2002:a05:600c:a317:b0:488:a977:8d6 with SMTP id 5b1f17b1804b1-48e52bd4f32mr100824405e9.19.1778165230150;
        Thu, 07 May 2026 07:47:10 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538a5486sm134813275e9.6.2026.05.07.07.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:47:09 -0700 (PDT)
Date: Thu, 7 May 2026 15:47:06 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	arnd@arndb.de, gregkh@linuxfoundation.org,
	mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
	alexandre.torgue@foss.st.com, ast@kernel.org,
	boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
	julianbraha@gmail.com, livelycarpet87@gmail.com,
	matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
	rohan.g.thomas@altera.com, sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
	wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
Message-ID: <afyl6gpHLlAnxir7@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
 <20260504-fascinating-teal-tarsier-b116c8@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-fascinating-teal-tarsier-b116c8@quoll>
X-Rspamd-Queue-Id: 87E804EAA92
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.94 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106450-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	R_DKIM_ALLOW(0.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-arm-msm@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.671];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c09:e001:a7::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,riscstar.com:email,riscstar-com.20251104.gappssmtp.com:dkim,aspen.lan:mid,1c:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 04, 2026 at 01:00:07PM +0200, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 10:54:16AM -0500, Alex Elder wrote:
> > From: Daniel Thompson <daniel@riscstar.com>
> >
> > Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
> > bridges.
> >
> > Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> > Signed-off-by: Alex Elder <elder@riscstar.com>

Alex already replied to most of your comments but on this one
specifically...


> > ---
> >  .../bindings/net/toshiba,tc956x-dwmac.yaml    | 111 ++++++++++++++++++
> >  1 file changed, 111 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> > new file mode 100644
> > index 0000000000000..d95d22a3761da
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> > @@ -0,0 +1,111 @@
> > <snip>
> > +examples:
> > +  - |
> > +    pcie {
> > +      #address-cells = <3>;
> > +      #size-cells = <2>;
> > +
> > +      tc956x_emac0: pci@0,0 {
> > +        compatible = "pci1179,0220";
> > +        reg = <0x50000 0x0 0x0 0x0 0x0>;
> > +        #address-cells = <3>;
> > +        #size-cells = <2>;
> > +        device_type = "pci";
> > +        ranges;
> > +
> > +        gpio-controller;
> > +        #gpio-cells = <2>;
> > +
> > +        phy-mode = "10gbase-r";
> > +        phy-handle = <&tc956x_emac0_phy>;
> > +
> > +        mdio {
> > +          compatible = "snps,dwmac-mdio";
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +
> > +          tc956x_emac0_phy: ethernet-phy@1c {
> > +            compatible = "ethernet-phy-id311c.1c12";
> > +            reg = <0x1c>;
> > +          };
> > +        };
> > +      };
>
> Keep only one example, unless you have different properties (not their
> values, but their presence),

At some point I simplified the example by stripping out excess
properties from each ethernet-phy. In the process it looks like I
removed too much and eliminated reason I thought it important to
include both PCI functions in the example!

Each ethernet-phy will typically describe a reset gpio but we expect
only eMAC0 to act as a gpio-controller. For that reason I wanted to
show that. You can see part of that that in the current example because
tc956x_emac1 is not a gpio-controller.

In other words tc956x_emac**1**_phy will, in the real world, include a
reset-gpios property that references tc956x_emac**0**. For example:

    reset-gpios = <&tc956x_emac0 1 GPIO_ACTIVE_LOW>


So... is it better to strip it back the example to describe only a
single PCI function or should I add back the reset-gpios that I
accidentally removed?


Daniel.

