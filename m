Return-Path: <linux-arm-msm+bounces-116168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /rNLBZRRR2phWAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 08:07:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E36FEF28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 08:07:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iHHxv03K;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116168-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116168-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 32A68302EB9F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 05:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970A5374A08;
	Fri,  3 Jul 2026 05:58:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F75370D45;
	Fri,  3 Jul 2026 05:58:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058286; cv=none; b=V6cZp+2ux64bcTDOJJvdihX7dckpPA6W3y2A0pZPgS1Oj4QVfhrpVslEydGNjKNH86cdutSZl1efWmOMDd/68FsiBiTfbJFTGW80A0HNhlaNYb1lgtS0hJ6CSxsz2nrL/nMBZ4T+SU0bNsYNWGdZjhKmEzeNFo1hB9x/q5ki8c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058286; c=relaxed/simple;
	bh=fgfrs1ukw5fe74nQL1kSwPwVMJhzw6pUMp8sYvdYZ8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+DybYM32CuyUFOrpH44q+orcso0ONR2Jq6WPg8+q/j6/fa1vziK1F2ld30DaaHbtU91AjknbHdwNIoksHCBxBSXItU4Ue44UtEe6JSYk14zrkunpLG3FadiA+oIRdjhBTRE6BmHS+2lE+Ztvfl53E54w0DNu0pUUSXUvB3vo3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHHxv03K; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF461F00A3A;
	Fri,  3 Jul 2026 05:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783058285;
	bh=S3Eiw67Q4osxjMEIi5BEl6kvDStPJcbgMl/a/U6a09k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iHHxv03KrBTNS71e6wPiB/S/MKiEH41vqGQmlseLZCDUYVSLEbVJrOSXwcS9OBBnf
	 cZLBSUGomvinz1mImTM2wDlQ4TQNRgiEYxLvUf+QevLea51PIAMA8wWg1MlgDPJMol
	 8RavVJZVR52fVCL1MuDafk6TqvNC0QM+SNV1nBP3rxGR4wBwMWoTo8QoiC21WkR7eH
	 wCT+j8f/3o0PsPUfcXmfLMPI6tYI9i7FOQMcvwZ3eY4vyBWoOlrsMGcY0k8C03ISTz
	 adoUEGuTQgYv+8jodIQis4IK2m9DjcNvCf6G0rj7R7tOjKQ08wHCZ6BkehyYg+eorq
	 e+e8dPV76GzEw==
Date: Fri, 3 Jul 2026 07:58:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v7 1/7] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding
Message-ID: <20260703-godlike-artificial-coyote-3e9ba9@quoll>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-1-776f2811b7af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702-tcsr_qref_0702-v7-1-776f2811b7af@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116168-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C5E36FEF28

On Thu, Jul 02, 2026 at 12:36:11AM -0700, Qiang Yu wrote:
> The QREF block supplies reference clocks to PCIe PHYs and requires
> dedicated LDO supplies to operate. The digital control interface for QREF
> (clkref_en registers) resides in TCSR on glymur. Since QREF has no
> dedicated DT node of its own, these supply properties are placed in the
> TCSR node which acts as the control interface for QREF.
> 
> Add a dedicated binding file for qcom,glymur-tcsr and document the supply
> properties. As this binding will grow to cover more SoCs, mark the
> required supplies per compatible using an allOf/if/then conditional.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

So you dropped the tag because? Where is the explanation?

Best regards,
Krzysztof


