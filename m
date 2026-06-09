Return-Path: <linux-arm-msm+bounces-112050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G5fmLDTNJ2r12QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:22:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B439A65DB5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:22:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=ufPzdOE5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112050-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112050-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9118230B2D71
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 08:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931F03EAC72;
	Tue,  9 Jun 2026 08:10:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0973A3E9F9D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 08:10:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992644; cv=none; b=juYzU08wPMBAkpAtJ8gz7zwjEPCkSG0B0/LeLUx5znC2/GwQSSk5yT+XSF2WvVStKlXsjS0fK3hZUIBbEgmrJjW4vbsrULGZ3FJG9Okdn1shGCUnamP3e9GU5pF//pOXlCmxTLnS5YXlXOt0yD99I0ZD0TdstGaOAZpBTZFeBgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992644; c=relaxed/simple;
	bh=jE2tru+MqeTMv+2G+OzJCkJ+OKi1leUHrmQ7jjjlrU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wbqgc9YixKRgK2mRLurjhIesSUJh9bVPwdTZaBYYBYnoqBanWX7K4TJNkueqHzfYxm+KUKEg5Wsvp+Cx1lN3Uhs+Qiu9/RaZtItl7ZR/czhD99zJepMYXWKzAoC2EqGk42ZQ257iaB9FwoklcTuBq+RtB++yfKMVMG8nI4vzyZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ufPzdOE5; arc=none smtp.client-ip=209.85.208.43
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68cc6c7df99so7476544a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 01:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780992641; x=1781597441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JAiuzFCgz48v7S4K+eriQebtflc2Mv697Ui08D+kSJk=;
        b=ufPzdOE5UKo7Ak+e8cAoNOd/9EgPTT3rKDFnIbJZamsEsIQLJdGLS5stEAyjIYno7O
         px1ryNQ77+JKqKZEBwEEZRDqJK9Lg6zQVhPCq44uE/y5xN2ZpRIjrJjvVWc/TKbcNsaJ
         Ym02J8bJgnatknANdBhCb14iGgZ491oUX48BgtWNQNiUHIUGyfZhliwvDex59Q0cZbz3
         lXWRRcCdMigNtMkzG53CxDdkfhyJXuMr8S6vKclSJbMTj+nRq49OnRiJdTa/lCM5EdAQ
         V7jEqeDE85/59gcgYPT1umFD14RvTR5l0S1LH/de0dIBh1EcDmRlfLXJE9apJVch9xuN
         Doyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992641; x=1781597441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAiuzFCgz48v7S4K+eriQebtflc2Mv697Ui08D+kSJk=;
        b=ssUVaEathbAZOlzvlxMLN8XENi44YdAnHKCbzbH3oOEav7IqvAvGwoIISB8TIBQoxz
         yS9ad1CwMJgaJ2P37QiLXYev2FR4C0p1bYkEUs+kq7gc30pEIgc+OK0xlM6SzX+iRGaz
         +FgZarKj0naA5kljIKRc7tlDqrDpuNd1vrXX44RgrPkeJXuQ0uHeVbMDJgLpDncvSVN4
         FYlAJC+QoSOirrqNvNqX6zrZFWpMCigUj/MZ6ToJ2ABmGk1BULiimrcBDaqwzhk30FMg
         xl8byFtdMIEBchmnnFNjr56AySnNbqecoRI6KO0YvIgOT4IbFwxXiiYZOA5/BL9EXeir
         fRrA==
X-Forwarded-Encrypted: i=1; AFNElJ+XcmSYt39KyPxphZeAdHOUwA+Mcd3mivt8LHfX0tyXaESLo9sPIfJBLEOleBZ9UcEkHydZDIU1V63RRvUU@vger.kernel.org
X-Gm-Message-State: AOJu0YwGQ8qFBpscU4qlHltDTInraZ82adUEuFh8NJRAgbc4ppMRy6Y0
	7Sby1bWLmPk3cvhb9pi41gvB23Y2DR++PcTBEkcpa/rykmvL+1961K74dK8jvsaveF6MXqHQSSY
	pxLaH+ys=
X-Gm-Gg: Acq92OG0fu2bkpfUteqv3mGh+goCm02MXKJRJbX+DqTSgYKyoTaVaduowIywdHUEztz
	ASJUtWKbBMZmokYpfICOrpK7Y4Br3ExBxvpl8NrxaY2zWjLCldp/dioULonj9EqYTACCtJEFabR
	IfJ6FtYgnNkEpcVYOKTPluxDfYDcwCFT7W2t8+1CopxI3W6W9Q1gDRUhqkIohQw9WQwxzFEYPAP
	BYj7O9LK/OmqfqwZErMkEuwsNVc6Q5oCw18Y91+42UAq7PI/lH9MKGLfcUEJMG8ATE7mmEbAvxE
	UT1hi1/yiN9LzcfOjBsctUTK/towfV4d1Se26KBKIayUQUSsIIAT00+chsJzwzSB76A5JKNmrLF
	pv6YKJ15V1OAmT2DmBXHl4hZ3FooRtTWW22kIsG3A8FFl6+blL3KsvIB+HiQYtIHWyUs7djDujX
	UFt+H2HdmYoI9tkTPH5ZvB2vXTY46NlQNTxDo1S53gLEimkA==
X-Received: by 2002:a05:6402:4595:b0:67f:99d8:868 with SMTP id 4fb4d7f45d1cf-68fa5147360mr8164600a12.16.1780992641088;
        Tue, 09 Jun 2026 01:10:41 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:919a:5e38:ea48:32e9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm8083640a12.15.2026.06.09.01.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:10:40 -0700 (PDT)
Date: Tue, 9 Jun 2026 10:10:34 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
Message-ID: <aifKejyF7n6QsI9h@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
 <20260609-quirky-rat-of-criticism-aea1fe@quoll>
 <87mrx4b164.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mrx4b164.fsf@bootlin.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112050-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:krzk@kernel.org,m:mani@kernel.org,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B439A65DB5C

On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
> >> On MDM9607, there is only a single controllable clock for the NAND
> >> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
> >> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
> >> around that by assigning a dummy clock (&nand_clk_dummy) to the second
> >> clock ("aon") that is required by the dt-bindings. This is not really
> >> useful, so avoid doing that for new platforms by excluding the second "aon"
> >> clock entry in the dt-bindings.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> What is the problem in giving twice the same clock? If this is what is
> done in the hardware routing, I do not see the reason for more
> complexity in the binding?
> 

I had that in my first draft for this series, but this would be wrong
IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock on
this platform at all. I'm not sure about MDM9607 in particular (maybe
someone from Qualcomm can confirm), but a similar platform I was looking
into at some point actually had *3* separate clocks for QPIC in the
hardware and none of them were called "aon" ...

I think it's better to omit it and describe what we know for sure
instead of describing some dummy hardware resources that do not actually
exist.

Thanks,
Stephan

