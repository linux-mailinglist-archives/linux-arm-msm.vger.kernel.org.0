Return-Path: <linux-arm-msm+bounces-115483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mRj4MrzbQ2qAkQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:07:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DD26E5BB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:07:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=imd-tec.com header.s=google header.b=EMN3kbzp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115483-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115483-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=imd-tec.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC46930151E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31D4367B78;
	Tue, 30 Jun 2026 15:04:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227E8331213
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 15:04:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831884; cv=none; b=aNczFgphPVllKOi8RUtxAOvd+YjikKkon2R1SeO8jcOnadl8anOGkXHQ2TZsAQH/5PxUEEyjTV8V8SUqw/W5gNO3/tdC0u6w2JHU1KvyrNA2myzd3lDNK6B8uB7UZ4+hZuYgfuCjj/ZrQDyXokWcCEp+Da+XXpUEYur7HCUuYOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831884; c=relaxed/simple;
	bh=G53oip/VRJX1jkABWM0rA5x74Zly1bzZ/Ts7FsQ5UO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fr1u+Mm9iinraoVvh6WC2ZQbE1wKUzLyrqu31Rn+gRyvDt4Y8A+x2nHaG0uwy3YvwUaRrE5YQb8q3lbNjxcTCtCsZyN6TAeY9+VZnGOL4zSlkt0ytqRnv5Qm6rwE3qOizbScwRPvJEmbs5eLdT+GxuNswmo8uteubwxBUYvoAGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=EMN3kbzp; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493a54b80a5so38617815e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 08:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1782831881; x=1783436681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WMj3CTl/i66z/a52o+JrMpg3PaRS1thixire4ZFkGn8=;
        b=EMN3kbzp9gVAxGv5iRPJB+bvYs5lq5hNy64v4bz7L1Vuf1WJokx6aAnTUAm6gDccGQ
         HSiguNdS5CAXzMZunVjE1QZovlRGeuwJcWw8isamQKpWLCOYkIMLP329911mn2ECjwJC
         dgAEAQ6N/5td5G3gt3iJ9Qb8GsRaablcHcCL5EIhLZlxrfw4qRTSW5C3fOKT7SPesCG2
         Yz/74vgYbesKOLQqKNACfZOnHZnFTAFtOKKMyzYgImRizWQO9h5MxqmpWSCdtoewhGCw
         bJmwiVU2Pmc+9Y1hUC9/3XGY8n9wrplnFjnMR/SMKWsqqDFnubFnbWbot3rAn641frH1
         Fn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831881; x=1783436681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMj3CTl/i66z/a52o+JrMpg3PaRS1thixire4ZFkGn8=;
        b=r0b6HRwORiwXm6c2iv4WU1LvLA4Vk5ZmbKc8Sc+ln5wlLeUuI14GX9pq2Ou0WcdI0v
         YrH/xBSsw852gM+75w/172RXfWwy7ytu/8SDDwxF1cA7ssC8fRBhMBPS3thT9TR+2pnW
         ulZMFAWDT2Ac2tWZ6o+HkF+sa2WQB2ZRkorHnzcRma+F8uxgiMnqX4584UqI3UzNn7st
         iQ4xKGo35cpksTxaIIr+33nrWXlPwC9RxApItDDdUU0hsvPFiDQ3CoC+4a58lyi76LM8
         q24csi0AVLpYVIKoEhoQMRh/aZoZSLk4qqFkVtHRh8pzz1gHGxs1jXHT28+uHM9+Bm/y
         1eUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gE1iwz61wDXPMleZIIC/6PVbh38bFUrIclxZCnn4gmuPj/Yq0O8wGpGNUo2v8DQYrXNk6O7F3yyax+tov@vger.kernel.org
X-Gm-Message-State: AOJu0YyxvRgV+CjiwypdG2FsHej1k6G9ySn7MW0L0LsiAjsMWLcjsrrc
	wWSXE/kk8fTh2PFfFDlOw9Kzxaxqd34jnGrGjyMGsF4VcYvRxnx0G2LlJbQ5+pqpzwY8D6fXa0a
	JDDCQZdA=
X-Gm-Gg: AfdE7cmR5sYGZ1AfE9c0DS2PujiWEhoq5+A5wC+NaEaV0sv5UpxUe/9wSb3w+bLFGJx
	YOoRVpBU98W+L2k/PaJFLD+RnNyYOY0Ha7dlTEOjK1YTa5iqRt1OXDERNGq2yTkaEW3LjKA4U7w
	zW4z6W28KyT7svvzk+t6s5nVpbopHsoxFaqCZf1ctcnTKIHwFCkxBL3wlRjzX8wuvkr43+tkTXt
	9ce99pnvgOxVtiNye7QQsXiPVND0xI+iT5TisI6sTJF/KD6pM/01m6mhudoaTmqv3E7cHcK7iOE
	MRavQR7MJAGTsrztegD8kmPZhyAifb3Ghmsuiju4fuMmci4GaOZVs5sKF3Dqd/aNQ9EfnsoP/9S
	1BlR7FTqpxf1EZX4yiCCDbHPGCjeAWfpXu0FrQ+mG7+KdJFvznVdHj3fJ2BAOY5h3Ux8T6t2W4c
	aKaSpeMoO4dq5G2vVgJkRZ8zEdv/zHZixgXzaLFxwtf3O6te4ocUSxdFWSqPnnsjRfebtIa4ZQQ
	W3KhJnKzmp0s4xTDT1Se69Vw29C4h60fqSm4x0rnQ==
X-Received: by 2002:a05:600c:3f1a:b0:493:b89b:9a27 with SMTP id 5b1f17b1804b1-493b89b9a97mr57185355e9.9.1782831881162;
        Tue, 30 Jun 2026 08:04:41 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([2a00:23c6:272d:c801:719d:f9cb:186:93c0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf1asm9083577f8f.18.2026.06.30.08.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:04:40 -0700 (PDT)
Date: Tue, 30 Jun 2026 16:04:38 +0100
From: William Bright <william.bright@imd-tec.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Message-ID: <akPbBuWU11mrCsfD@will-Legion-Slim-5-16APH8>
References: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
 <20260610-imdt-qcs8550-sbc-rfc-v4-4-358e71d606bc@imd-tec.com>
 <8afbc9f9-15ff-4b60-9a0f-845f903d3c9a@oss.qualcomm.com>
 <akJIGk8BEgHQrt34@will-Legion-Slim-5-16APH8>
 <c56732c2-2aff-4c3f-801b-b798c95918fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c56732c2-2aff-4c3f-801b-b798c95918fc@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115483-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:manivannan.sadhasivam@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,will-Legion-Slim-5-16APH8:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4DD26E5BB4

On Mon, Jun 29, 2026 at 04:03:18PM +0200, Konrad Dybcio wrote:
> On 6/29/26 12:25 PM, William Bright wrote:
> > On Fri, Jun 26, 2026 at 05:18:20PM +0200, Konrad Dybcio wrote:
> 
> [...]
> 
> > The PCIe switch we are using is a NXP CBTU02044HEJ, this is a simple
> > 1->2 switch that is not PCIe enumerable. Given that there isn't support
> > for this IC already in the kernel and that it will take quite a few
> > weeks/months for me to cobble something together, I am thinking that it
> > might make sense to drop PCIe support from this patch-series in V5 and
> > then submit a seperate patch-series with a driver and bindings for this
> > IC whenever I get something working. Are you OK with this?
> 
> Sure
> 
> I'm a bit curious why do you have a switch there in the first
> place - is there anything else connected to the other port?
> 
Yeah both PCIe ports are used.
Here's a diagram of both pcie0 and pcie1:
      pcie0                           pcie1
	|                               |
	|                               |
	|                               |
	|                               |
	|                               v
	|                     +-------------------+
	|                     |    PCIe Switch    |
	|                     |   CBTU02044HEJ    |
	|                     +-------------------+
	|                       /               \
	|                      /                 \
	|                     / GPIO16 = Low      \ GPIO16 = High
	v                    v                     v
+-------------------+   +-----------+   +-------------+
|    M.2 Key E      |   |  LAN7430  |   |  M.2 Key B  |
|      Slot         |   | (Gigabit  |   |    Slot     |
|                   |   | Ethernet) |   |             |
+-------------------+   +-----------+   +-------------+ 
We used the CBTU02044HEJ PCIe switch on pcie1 so that we could use pcie1
for ethernet or M.2 Key B with static boot-time selection of either.
My limited understanding is that enumerable PCIe switches are expensive
and hard to get although that might be changing. With pcie0 it looks
like I can just add the Key E connector DT node like you suggested and I
will drop pcie1 support for now.
> Would you like for that to be switchable at runtime?
> 
> +Mani will probably be interested
> 
> Konrad
I didn't intend for this to be possible but its not a negative if this
can be done. My original plan was to use the below .dtso when using Key
B: 
	// SPDX-License-Identifier: BSD-3-Clause
	/*
	* Copyright (c) 2026 IMD Technologies Ltd
	*
	* There are two options for PCIe routing on the IMDT QCS8550 SBC.
	* By default, the PCIe switch is configured to route to the GBE PHY, but
	* this can be changed to route to the M.2 slot Key B by setting 
	* pcie_switch_sel_gpio high
	 */
	/dts-v1/;
	/plugin/;

	#include <dt-bindings/gpio/gpio.h>

	&pcie_switch_sel_gpio {
			/* Change the PCIe switch so that key B routing is selected by
			* inverting the GPIO polarity.
			*/
			gpios = <16 GPIO_ACTIVE_LOW>;
	};

Regards

Will


