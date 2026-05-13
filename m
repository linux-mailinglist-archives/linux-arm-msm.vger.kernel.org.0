Return-Path: <linux-arm-msm+bounces-107306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN/KIwd3BGpOKAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:05:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1D7533926
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8860432553F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E3C4C8FE3;
	Wed, 13 May 2026 12:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="anv6YcyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1C84C6F18
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676594; cv=none; b=HjgVRJ4Dsb2lY1RLE0+2X6/O6aa8TzGneIA81O+LI/xyefNV7VO7EJLSy5hfIkSRZ6F3h5eqoZPFznSpiigCAvtNSUGXLVI0EsqsoCLueNwJgQyJTSuWWdKvibKTFVAi2rY16O0/nxujjun2xc1mRtcbxxk6N7aKrSOInvcYyBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676594; c=relaxed/simple;
	bh=nI7YOzNufegrzrQMgLxNrwAqGVHXqCpVokhfGj2uJHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXoH5iS15KxoxOS5cT4TJ8pTvAlMvLarcdDHyk7YeE2WqVQlbijD1CQamIE0SUX2rYaKK7tRY0MkuEfkX0wc+OWH5DN/JzpidaTVACIyIJRnppMi9mHmw8A9iu9EiwPn28IGy9qv8wHjnaebWK5xQ+fZOwH1Yqr5lzwf2K5q7pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=anv6YcyT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so61563105e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778676590; x=1779281390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u3zF8kES347TPoEbvDwkqQbzfa05yrB1P5lQaxsmy/k=;
        b=anv6YcyT1kkN39tGg5nc5kZAg7zQpsefqN7H9k6nFlR+iDHfySQCgjAqbF1Vit5gd6
         HGvL00FO0ndFtwsAGqbZi7Lq+ftGXgmMie1BQilW144IsLtBbTz8EenRf2GoJtXZXHct
         8L45vMDjh070y3wWVV3Db08kBBIq0CLPhLkZKaHQuey9Hyn9kLtUPM6d/ueYS1lLmDYi
         DWzO+AFK5ewpdDMcSm2BQfdphnr1Dy5xQINNfDbQhJegZhXsUoscwrcjBPJAQ5hersSM
         Dk6KDwz/c9bXB9CgGMtY4vaFx65TH67HQJC9zt82spg6F/gWQGD3VkvQOfMJy9D4lOVf
         BfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676590; x=1779281390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3zF8kES347TPoEbvDwkqQbzfa05yrB1P5lQaxsmy/k=;
        b=fFcs+p7G8AC4xtPY6zgATh893txqtwTLRfJPhNbNgy8nOZnrI6ijWdcQZcK3GdCnDb
         DK0AUTjZ01hnQGEh1vNQmx9GM1m1JmTCyyyyx+XkCyx7Qn5a8divU8Dx0vAaT/fZJUoA
         YIXAQxbAD+nLZnZLzbG4mFlj8fFodVoSmTkH9sgNPknhbkgnuK9VxdbFMhKy36ojNuTt
         lmRJQSd5i9j1PySAHx8d4y17AVbEiizVMKbnG+ADtTdFHBF6pYWaEsC24AuYUmDnCjCK
         cWM459rXPjPHXBHoeKaSWVWSi1Tk6pM4d9rFElgKjoEqsQdBA4GcxX1IBz3brEjrnT9h
         7KMA==
X-Forwarded-Encrypted: i=1; AFNElJ+3DOACasjzaMzJQ0El9ImGhNzEJ9Gri5FVYvV7rTIakJjKYh0k4MIWHqYOd0x/n1XdaNmJo7afzXJOWJyd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/+5jxZHL63TzE6ijk3SIYvFCzDTRORHU0JWPSpxveEpVfifc6
	5dBwmxr055st9srDWh/1LVr+NaiBjyG18Nhr1xKDvq0W13yzp5HqGvltEGWPzrfom40=
X-Gm-Gg: Acq92OHyzs3pqBWvOorFxJe/ZmdMnv1Z2anncsDebN0AlQA/BP9rgNQ6Uku8DTNvu1X
	w41dcWAEDame/Niknrnmco5HZvDuh3f+am5bHy3FiaodrCpy389gzHXgl7vqQPBBTLjaxk2Q0pU
	IU2suEbVAvrhX64VFaFYyCuj2jFqlou8F05JFG9H2q91rs+uQS+SpeJDIGBhHzUXxNHC3iFR+sW
	4HvfSMVFtJMzZAYMXEEbTHBjuFibFntLw0NIVZJhIvCM6qI3HwcHa0GLqBf6OVIggtNyiFNrsqP
	JV7xK9OxOlXUXSFCA7ytXLsLwDAOI1itePFzEVLZtRAxOFY7dnLDblqkS9UCt7kolM+iBvVI4cT
	XvqMTLqnInHfUdgYCUIDDX4JfPiMjh8i7Onk17YYSe6HctswyRTT7QxW4DSmjKde3Gd3BSQbw5Z
	cH+P6dYReqpPO3y11Xxmuv1wTp730t3sA60+brnifY6a17MWjI7IlAFu+eFxtyNalLoWePwzMRv
	TAMAd7a0dQZaHlm0t8QrwPiIP+s3scAUlkfBvzmyk7iutKr8o7nWYHGVI6sEudLkK/oXTVI9iwK
	yGPMT+sT
X-Received: by 2002:a05:600c:6305:b0:48a:5301:bb5c with SMTP id 5b1f17b1804b1-48fc9a32aeamr49565525e9.16.1778676590239;
        Wed, 13 May 2026 05:49:50 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8cd49fesm78578015e9.0.2026.05.13.05.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:49 -0700 (PDT)
Date: Wed, 13 May 2026 13:49:46 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Subject: Re: [PATCH net-next 12/12] arm64: dts: qcom: qcs6490-rb3gen2: enable
 TC9564 with a single QCS8081 phy
Message-ID: <agRzai1UoHEIotZe@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
 <01d6ea18-e022-41c7-a642-ac0321957923@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01d6ea18-e022-41c7-a642-ac0321957923@oss.qualcomm.com>
X-Rspamd-Queue-Id: 3C1D7533926
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-107306-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspen.lan:mid,riscstar-com.20251104.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar.com:email]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 04:03:36PM +0200, Konrad Dybcio wrote:
> On 5/1/26 5:54 PM, Alex Elder wrote:
> > From: Daniel Thompson <daniel@riscstar.com>
> >
> > The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
> > TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.
> >
> > There are multiple builds of RB3Gen2 with components included/excluded.
> > That means whether or not there is a phy attached to eMAC0 depends on
> > the exact board. However all versions include a TC9564 combined with a
> > single QCS8081 attached to eMAC1.
> >
> > Add properties to the existing PCI nodes to describe how the TC9564 and
> > QCS8081 are connected to each other (and to the host SoC).
> >
> > (Note: "pci1179,0220" is documented in the "net/toshiba,tc956x-dwmac.yaml"
> > binding, but checkpatch.pl doesn't recognize that.)
>
> This should probably go under the --- line

I'll leave that with Alex...


> > +	qep_1p8: regulator-qep-1p8 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "qep_1p8";
> > +		gpio = <&pm7325_gpios 8 GPIO_ACTIVE_HIGH>;
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +		enable-active-high;
> > +		regulator-always-on;
> > +	};
>
> If I'm reading the schematics right, this is only required for the PHY
> - is it collapsible, or does it really need to be a-on?

It could be turned off if the socket isn't in use but it would prevent
hotplug detection from working. In practice that means it can only
collapse during suspend/resume.

However the real reason we jammed this on is because I couldn't find a
way to get the phy/mdio code to turn one on. However it is possible to
add regulator support to MDIO devices by extending their existing logic
to manage resets so it can also manage a regulator. It comes out fairly
clean so we can add that to the patch set and remove the
regulator-always-on.


> > +	qep_irq_pin: qep-irq-state {
> > +		pins = "gpio101";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
>
> There's no pull-up onboard, should we use the on-chip one?

It is configured the same as lt9611_irq_pin (which I couldn't see a
pull-up for).

I switched the interrupt trigger to active-low based on other feedback
on the patchset and the counts in /proc/interrupts remain unchanged
(with a single figure value). It certainly doesn't look like the irq
line floats when the PHY interrupt is deasserted.


Daniel.

