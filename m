Return-Path: <linux-arm-msm+bounces-111362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /NncHIylImrSbQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:31:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D45A56475AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:31:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SJfyvDJA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111362-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111362-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8258230309FE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3210B3F926B;
	Fri,  5 Jun 2026 10:25:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5543F8ED1;
	Fri,  5 Jun 2026 10:25:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655132; cv=none; b=J6A8VnDvYPCKROXdj2s6vtK0KGdwq11gBr2rY6E7JYo7MovAYaH9ylev2BurIH4DCR8mT4MYaAr4k8YUQrTMCAcSmrVfTQ2jYmR1BFaQv1vWBFChjld1LMbDbWyTpIE4859FGJYWCRw4erCa/KMNJpzKfGU09zXVfi4ACOLk85k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655132; c=relaxed/simple;
	bh=1S6TuoEOC1nqVl2xgQNYK+k6d3PW6CinlBrHrkUbJkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVU3vM9PYkV3onhACWIPrzynTEL7QTSUiXpRKZTPbGobZinJ1gZewaRWMT2UnGO+Xcjd1Nn+C4AGCwlmbd1VdJ7FJg/xBl1kY1oPVyI7kC9yVymVSi+MI5KWl2iSQnns8VVrQkUTK2t4OUGTuZYARi2n7n2G92851NYaWGBZas8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJfyvDJA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557621F00893;
	Fri,  5 Jun 2026 10:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780655130;
	bh=3mrrkpP1fV38EgZz5bm544AWSnORcfSBtPyYSaMYDl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SJfyvDJAGrw2YiuLvnRibxmrtW4/YBGCjo84hkm76xuL6ELvrFQexzFfDSEGYvTFD
	 MCxvWIP6JXW3LkvRgpgOXVaSJo7ai+70kNf/IuVTWbGmC0midszIX0y752SCTjluEv
	 6gwcbvDE6FeLkZ8l6eMJU5hzo0iBT67Z+79gra6YweejJYU4OTsLHlvXGUrqpINmk9
	 RtuoX4RdhJ0sd9hahtThYdsLiznMSfHsD+yGU8bR/ON8iHhyLLuz8v/h7bGCx9srGQ
	 ziC1qs0t7TmSNo57fKCApHdTYuT+kENj2L81kmzDnevXPbk9jVYSB/3bes+ZlWQvMK
	 AedsFC9YFJYjQ==
Date: Fri, 5 Jun 2026 12:25:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Brian Masney <bmasney@redhat.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/13] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Message-ID: <20260605-bipedal-aquamarine-tuatara-e1fd62@quoll>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-3-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-3-8204f1029311@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111362-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D45A56475AB

On Thu, Jun 04, 2026 at 10:56:09AM +0530, Imran Shaik wrote:
> The Qualcomm Shikra Display clock controller is similar to QCM2290
> DISPCC hardware block. Hence, reuse the QCM2290 DISPCC bindings for

Similar or compatible? You are not reusing the bindings here, but
stating that Shikra is compatible with QCM2290. Just say that.

> Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Best regards,
Krzysztof


