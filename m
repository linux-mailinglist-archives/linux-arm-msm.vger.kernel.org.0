Return-Path: <linux-arm-msm+bounces-107363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPQzIRyPBGoVLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:47:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF03F535650
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EDD8303D0B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A8243C04B;
	Wed, 13 May 2026 14:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfcLahxg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C6C44E03B
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683475; cv=none; b=EvN9Ovnol65EsO5CaPXOzjZquM/pFLNAbBCCfuS/e9GxethD3fZoNe9DxvoSpg68K8QBy/GuHnreLvCLU6eokBSj9h/IsbjuwZ42X9ATxmr+uP05kK/yhQYJerRKcZCquQ77Dm/6hgI8qnRO+yjVMnLHtoNgBE6EoGC1EePzmN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683475; c=relaxed/simple;
	bh=au+mOMR8czIiSMhZyNPY5z9ArSGWfnPUhHacyjBoQtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mvrq/mw5zM12ybQuTBfeluTpwBnUwSgtAEbJL1IeQXagyCpwOdSoFmm5ttAJ5YJTAwQB6q67LmJUk6CR2UJaBbTRgr5lStTATWSMbul4xhQ5q0z4aMRAjuWGIkuxQ430XpR+1vRx8aIp9S90YtsmBhxL7oSc0A0T/RzfEOwpIlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfcLahxg; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-13317450f83so3076381c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778683467; x=1779288267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2XlaJwSBpPWg5uTVaQnN9+A5FFLDYX24zRCV5h5kec=;
        b=SfcLahxgAznAUhz7kdUP7MYW9RSRciQFE8cKCFiKjcWEQFvAE9BlYZJeuO2nKqFEJB
         sXH82dr0KQMsYWCshmII61+g3XPVm7d6f0aCBw5UedQf9zIQ786GZtpWNOcFLfU3q55I
         8KtOi8G1RdqMRvb2x7CeawYxLIGnx5GT01erZeoTWM8nsa/ic8TndjMcy2WMsmA19v+9
         ZJzSEk3ZtWgthOR1PJY8w8f6xLT7KTFeYY+RGX/S2ysIA3nUHLn7KB8Tv/Zbw68oTxNm
         IfkSXQw/f8sdpAXiJsD9Dt5Dxx0/i5XZXkiBtl2YJ5y69hgTNiwuRLTuSipZvBFgbIWV
         c6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683467; x=1779288267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f2XlaJwSBpPWg5uTVaQnN9+A5FFLDYX24zRCV5h5kec=;
        b=c98XGQj2FsezyY1gutXuOFP8Kq1eo0DA1qdv+/L6W29uBr0JszC2as/A8VD04J0BA0
         JyGrlyIIZWfX4E8W0s+GiJPWissPh2L7T67/GpYcldhIxQbIL4mW+XRPJ9QZ+r5qbSBl
         Ys1tAPei8msGqOVTfBYtcYEw9v4aNU9wv27gkAloL9wK/bpUc9hXmnnoRVue2y2OK8wb
         zAcLpSPCVhJhTN2LikOvZMT48q0sXZFlf5UWa4xTO1sTMuo/FPnfTQvHLfh8TBmz3kKm
         jh4AxWAI9Qzi2Xq7Cmd6LYMg9VIq4Ip/g8WQHncOx0LlIXT2QHDtGWvOvy+Iwz0dGSsq
         NANA==
X-Forwarded-Encrypted: i=1; AFNElJ8PuUC1moAA7jZ/VX9/f3yIdeCGKg6Z2TucbStZzPP/OnLvyAPZVhcoatnOK0azHL4iEdF3egX7BNrkvnDP@vger.kernel.org
X-Gm-Message-State: AOJu0YxLj1bgqpplpdkem3hjbAS+Z248GS3E/vbMuz6V3qvkrFbNb+4z
	hYSbp8u3w1uN0yjrKtPLkRSg1H6VnGN76gFPGQG78ddtWL5UXlf07/8L
X-Gm-Gg: Acq92OEllrmBL5sqBMEXBD+ZTZnZI8/z+a81p02FklRyK+D1tNIRAEyJ+yqTcqWRAgz
	gstAkqtdZk5MRxTfBiJYaujKpBEJH/dJ14JFL7PZEkYb6hD6/qC4upICAqVrcBfibyvZV1VLjD7
	b2saJXDSKzwOT278Jpd89v9PwCxZAz1J2BRO8AdsU5dw11EFMDLFsqUVzsnJG649Da8YtV/AYCh
	Xvdd4LDHPkkKtJ6OY4RB2WXHOHqV6ZklFkEyokWrvbfqMQzQ71c2NAioASoGqDTbOePSEQ2mNgN
	YcVMswANMvN//9J64c8KYcANK0Bvmc5XyjojPjHPPqlK2LEvFcJLb2vZMmJIOjEK2+FAFNWLYtV
	8kPRVCl1Slq1DCtnMJ9SsZFweJg2ID82mEvojdDOhglefRT3RHZWmy1t1KDHyw4dYX0VnkUn9LM
	0Nacll+LMlAjwRWY1Cs/2gOVYLvdH/4XhrhOXH
X-Received: by 2002:a05:7022:128c:b0:132:83e6:41 with SMTP id a92af1059eb24-1342f2230ddmr2313170c88.13.1778683467152;
        Wed, 13 May 2026 07:44:27 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327865955fsm29768228c88.11.2026.05.13.07.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:44:26 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org
Cc: alexandre.torgue@st.com,
	andersson@kernel.org,
	andre.przywara@arm.com,
	andrew@lunn.ch,
	baruch@tkos.co.il,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gregory.clement@bootlin.com,
	jerrysteve1101@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	paul.barker@sancloud.com,
	pavel@kernel.org,
	pavel@ucw.cz,
	peda@axentia.se,
	robert.marko@sartura.hr,
	robh@kernel.org,
	romain.perier@gmail.com,
	sebastian.hesselbarth@gmail.com,
	vincent.knecht@mailoo.org,
	von81@163.com,
	xuwei5@hisilicon.com
Subject: Re: [PATCH 2/5] leds: is31fl319x: Fix shutdown GPIO initial state and remove redundant startup pulse
Date: Wed, 13 May 2026 22:44:10 +0800
Message-ID: <20260513144414.244968-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAD++jLk0BrV+MAh4n6+wAqNX+O8BcHcoehbX574F2_Vcm4qvGQ@mail.gmail.com>
References: <CAD++jLk0BrV+MAh4n6+wAqNX+O8BcHcoehbX574F2_Vcm4qvGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EF03F535650
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[st.com,kernel.org,arm.com,lunn.ch,tkos.co.il,vger.kernel.org,bootlin.com,gmail.com,lists.infradead.org,sancloud.com,ucw.cz,axentia.se,sartura.hr,mailoo.org,163.com,hisilicon.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107363-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

> On Fri, May 8, 2026 at 5:26=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> w=
> rote:
> 
> > 1. Per IS31FL319x datasheet [1], the hardware shutdown pin (SDB) is
> > active-low.
> 
> So that means that driving the line low will shut down the hardware.

Yes, that is right.

> 
> > -       is31->shutdown_gpio =3D devm_gpiod_get_optional(dev, "shutdown", =
> GPIOD_OUT_HIGH);
> > +       is31->shutdown_gpio =3D devm_gpiod_get_optional(dev, "shutdown", =
> GPIOD_OUT_LOW);
> 
> Add a comment here that this will in fact drive the line high,
> because the GPIO line will be flagged as GPIO_ACTIVE_LOW
> in the provider (such as the device tree).
> 
> At least write this in the commit message, it's a missing piece
> that helps readers understand what is going on.

Okay, I will add the necessary comment in the V2 version.

> 
> Have you checked any existing device trees so you don't
> break something here?

I have modified the problematic device trees and CC'd 
the relevant platform mailing lists as well as the device‑tree mailing list [1].

[1] https://lore.kernel.org/linux-devicetree/20260508152435.21389-1-jerrysteve1101@gmail.com/

> 
> If you're breaking platforms you may need a fixup in
> drivers/gpio/gpiolib-of.c to force the consumer active
> low for legacy device trees.

Thanks for the reminder. I will add the necessary fixup in the V2 version.

> 
> Yours,
> Linus Walleij
> 
> Yours,
> Linus Walleij


