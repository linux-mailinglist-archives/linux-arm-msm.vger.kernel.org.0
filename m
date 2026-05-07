Return-Path: <linux-arm-msm+bounces-106558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBonAm0l/WlEYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 01:51:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6854F05B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 01:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FB97302BDFB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 23:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E726372691;
	Thu,  7 May 2026 23:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvtxiuAs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEEC37104A
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 23:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778197190; cv=none; b=me8Dk7RY7MVj6fOovt22ERLTPt2GlE2vqC1WY4sUgN/ii+gUPKSjoRoaJf81fEb78r+dqpx2eT4a7K4Zxc1DTCg+m8FuWmFH9JbAOiV1lM5hjpF5ZSvtegX7ep2N9aIVbK+GmkTsf68HfntsEKhxEdMvluAMnFYWGk90LLCZoFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778197190; c=relaxed/simple;
	bh=vFH+WCKmJFo+oFxj5WEkyqvJ7Aj4l64pwYaHYcrT4og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V4cLHbkJxgnJcUsZzh3IHebhHyj1PesKkFiJ2mLxjVY3sA2rUnVWA6vz1Wk4mpRB3jukUEW4/ar8GNSxHAzi9xG+hpv7jquKOz2l/VRwi1Uhx9sWZUTAIjjzmI8KhJkh/NDOrgiXiyZD1IQ5TLi8rtp87jv5fRBZ2HKYTUmlBV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvtxiuAs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25C4C2BCC9
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 23:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778197190;
	bh=vFH+WCKmJFo+oFxj5WEkyqvJ7Aj4l64pwYaHYcrT4og=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QvtxiuAs5eVQPns7jJlqtGTfdl0EJbsvK9NI8npq8OMLSMiSWuCojWaz5XpXCmsan
	 Wrki/Tmn5sP1n1hrh9a2tAMgBvgvMEetyZYlRhkxOrQVeYBuNqQAl5EXhaTsb/gSNR
	 N3tDJQnEgUpi+Ise+Rk6oQ7UnD9f6R7jz6KRO3R1A/xImq8iYtkSFjrHRyKlIJgIL5
	 ASW+UJLGkyWDkDPCeYIjie9iYtMbF/4k/99cseI+aVLIVKfYiQesyhpsoJ+guYxgOD
	 it0716QbosCqZPJKCq+d0pprmnZzhD3cOjygZs+ebux/Q4N4ntZL4+fwJKlOkXvmkE
	 QFWR3BZF83oDA==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-67da63ae541so2359837a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 16:39:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/vkpjYX6jOdmj0mPM2FypRtAcO9uNofRD5yYJnNDWfwF45Uq0uF9gqUOi9WDVagKL9GZKW14BNm/moFsdZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzKPlD3/WJdk9JJkov2uBhmgiqXOLJFUsy0EPqXeimwIRvrafew
	va5Qp9gVFKzgrYS6hO142D4NtTA3qPyZNRnf51bPwXoF+bC8OR4MaUof/d6fx6tfxfejG4bul8B
	3e5wznQGgtfy4WooyjFDuwwtHkZAmfA==
X-Received: by 2002:a05:6402:2113:b0:67c:1ed6:2793 with SMTP id
 4fb4d7f45d1cf-67d648a74e5mr5797376a12.22.1778197188726; Thu, 07 May 2026
 16:39:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501155421.3329862-1-elder@riscstar.com> <20260501155421.3329862-9-elder@riscstar.com>
 <1f34cbce-e2dd-4e80-b136-55d0efa50002@lunn.ch> <967c1d96-9a48-48de-b7d9-58b63e782aee@riscstar.com>
In-Reply-To: <967c1d96-9a48-48de-b7d9-58b63e782aee@riscstar.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 7 May 2026 18:39:37 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKayEDa2-FDoxM_JU3Yvevd-Gs_eFKCQ8NY8A8oBsD13w@mail.gmail.com>
X-Gm-Features: AVHnY4K23N33ivg6cLD9mNxL7odw3uUNL3DiEAJ7jfws_C2Zwld0dAM-keay8pI
Message-ID: <CAL_JsqKayEDa2-FDoxM_JU3Yvevd-Gs_eFKCQ8NY8A8oBsD13w@mail.gmail.com>
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
To: Alex Elder <elder@riscstar.com>
Cc: Andrew Lunn <andrew@lunn.ch>, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	maxime.chevallier@bootlin.com, rmk+kernel@armlinux.org.uk, 
	andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, Daniel Thompson <daniel@riscstar.com>, 
	mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com, 
	alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com, 
	chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net, 
	hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com, 
	john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com, 
	matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com, 
	rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn, 
	weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6E6854F05B4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106558-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_SPAM(0.00)[0.695];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1c:email,0.0.0.0:email]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 5:17=E2=80=AFPM Alex Elder <elder@riscstar.com> wrot=
e:
>
> On 5/1/26 12:38 PM, Andrew Lunn wrote:
> > Why not add an subnodes for the ethernet interfaces?
>
> We will define "ethernet" devicetree subnodes of the PCIe functions
> in the next version of the series.  Something like what's below.

Are they PCIe functions? As in bus, dev, function addresses. How to do
functions is already defined by the PCI binding.

>                                         -Alex
>
> pci@0,1 {

The 0 here is devnum and the 1 is function.

>          compatible =3D "pci1179,0220";
>          reg =3D <0x50100 0x0 0x0 0x0 0x0>;
>          #address-cells =3D <3>;
>          #size-cells =3D <2>;
>          device_type =3D "pci";
>          ranges;
>
>          ethernet {
>                  phy-mode =3D "sgmii";
>                  phy-handle =3D <&tc956x_emac1_phy>;
>
>                  mdio {
>                          compatible =3D "snps,dwmac-mdio";
>                          #address-cells =3D <1>;
>                          #size-cells =3D <0>;
>
>                          tc956x_emac1_phy: ethernet-phy@1c {
>                                  compatible =3D "ethernet-phy-id004d.d101=
";
>                                 ...
>                         };
>                 };
>         };
> };

