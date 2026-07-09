Return-Path: <linux-arm-msm+bounces-117889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lJH7F/pST2rteQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:51:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B4C72DF50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:51:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ghPm9N++;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117889-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117889-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22EF5302734A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD66E3DCD9A;
	Thu,  9 Jul 2026 07:49:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671133D333D;
	Thu,  9 Jul 2026 07:49:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783583388; cv=none; b=tJ/UhF4VgEG57xjs8y6fYQxRYId4kCKFNcNPTX3jqaT4207KQCMj8MKd/uW82NhvBrMTZpt8tRLrrDsMdIsOJrmjY4fTMADCh0WwIA0qE1P1H6cloWrkrtG4KLnn13/R3M15E/VIRN3D5r/mqTDNX/ngAaZvuLUoNY+pyfDrghI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783583388; c=relaxed/simple;
	bh=mvB9LNuLPaPxjLsbMcWYn7EtNS6+EpQvgbnYcJ0j2pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXV4jJbHyt+YCrXHdQ+n/bo0ItOn7muAtd1rq2eiCZ/D/X03Or4v/8aSw0YrmfSkS0hapIXQ+CbyD0fGWKmoQLjr5F3MbP41aiBzL7z3HMri+7/wCSBbEfYY1BHZUoo+fpkLl215mMnTz2w7tAsJ8lHSXFtb2xg7Tvd68r2PMf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghPm9N++; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FB91F000E9;
	Thu,  9 Jul 2026 07:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783583381;
	bh=AstnkUpI3Say1+/yz1dGRg/IbF07HJE/MHdugktIS7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ghPm9N++ZPjCXBL6kS/c/eK1NeC11xCAytqOok4pbsPwv75ZEkCzNuBN5PKR/8oX/
	 SyI1NGoObKZxyJtYcfcNtDNqZzJJ10OTnpf+JnO42EE+Je+6fR22b8AWKAHh5lFOc7
	 T2HT4kcmFCi/KvX5qY4lRoHrcz4U5hdoDLJVMUCc7I2V+hnMqyeiLToYZddW/r6/6Q
	 vos2vu/fBGSr5skviyYc79wy/E8HpQ1W8G7O3egmqj4npaKac733oC+8UPhz1v1mW8
	 TacS1sinTS0cyvsPwkjobpq+8iS9rC81y7OLo6J5SItMXLgXABlgk+JZNOf6Qt1N7b
	 z+Fr12vGY/9Gg==
Date: Thu, 9 Jul 2026 09:49:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v8 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Message-ID: <20260709-striped-ladybug-of-climate-955da6@quoll>
References: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
 <20260708-tcsr_qref_0708-v8-2-62c42b5fa269@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708-tcsr_qref_0708-v8-2-62c42b5fa269@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117889-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7B4C72DF50

On Wed, Jul 08, 2026 at 03:02:39AM -0700, Qiang Yu wrote:
> Mahua shares the same QREF TX/RPT/RX component naming as Glymur, but has a
> different topology: a single QREF block fed by REFGEN4 only, rather than
> the two independent blocks fed by REFGEN3 and REFGEN4 on Glymur.
> 
> Add qcom,mahua-tcsr compatible and document its required supply
> properties. Note that REFGEN4 is supplied by regulators vdda-refgen3-1p2
> and vdda-refgen3-0p9 on Mahua.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,glymur-tcsr.yaml  | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


