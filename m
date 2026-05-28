Return-Path: <linux-arm-msm+bounces-110059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMb9LP72F2q5WAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:04:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0091F5EE329
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A3D223098D49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 07:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2A83546FD;
	Thu, 28 May 2026 07:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IxvO0Jqz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0355F22652D;
	Thu, 28 May 2026 07:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779955035; cv=none; b=KiuWRSkiRU96PJ8iiLtlERxjele4DtgEXDsqFIf5pwRzp+HAqPe0zLHEtewDh+0MxOq0W3giUPLo+3VKQFpX9lzitHeWTFcWkhOuYhawqJqGI7zYo3opngLqcYlMtBejm6Oe0FKOJNoavCnQ/XHcqLQrfRZ54iM6RJEACEz6bG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779955035; c=relaxed/simple;
	bh=U1RHqMRDjzUS5zZwipAFDX+TFRrqrpe1xt1cVFzG1qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kca8CX1JUY+whs9evjWE3jSo7+xV/2tFbhY5fgsBgQGsYpTb2TPai7SpX59wcnUCZrcA1Yz4rFnocdHpMl7cGFAAmH5CZAEgJwPiukBk5MkqDhgx9tMMv5EpzlXgtRNlm+QKi5iwoPgHFwcBnetEW14i4GHysI1qRWZH9NDgmgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IxvO0Jqz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D631F00A3A;
	Thu, 28 May 2026 07:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779955033;
	bh=2NenSz+8qqiVua08LkRcCJE8ZQw1iJEuszNxr7x4gMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IxvO0JqzVezhHNaGLaRK2nsAhyWp4T2IPOwRSWcrLuut8FYkCrGLCdkwQ4YU9CwCy
	 3fKHuoxUNbGOK20FY61jOfOITXXlmOPXMxugTICEGCQWX1cHJ5eUBRxPqLrM7RBUPM
	 f+53iygGND+MLJoqPOqCsjYl86gm1ERLrg3cgB5D2+fKtnKQTIAypJzpO9iVOwm1XU
	 HoRqbDFBQfMVUX/ROzhV7+48Hixf+amBUz5oqyfzODZIvyZFj85lkeGrcW0+L2nfgl
	 CWYStdkE+RA+6pAtIEtQ0RGEXL48H268W2yvVQhOIGTq3OuLFVTpU+HkCmdxsceTVB
	 56UQxHwCbQx4w==
Date: Thu, 28 May 2026 09:57:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: qcom,sm8550-tcsr: Add
 QREF/REFGEN supply properties for glymur and mahua
Message-ID: <20260528-adamant-termite-of-drizzle-0c39de@quoll>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-1-ded83866c9d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260527-tcsr_qref_0527-v4-1-ded83866c9d9@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110059-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0091F5EE329
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 07:29:12PM -0700, Qiang Yu wrote:
> The QREF block supplies reference clocks to PCIe PHYs and requires
> dedicated LDO supplies to operate. The digital control interface for
> QREF (clkref_en registers) resides in TCSR on glymur and mahua. Since
> QREF has no dedicated DT node of its own, these supply properties are
> placed in the TCSR node which acts as the control interface for QREF.
> 
> Document the supply properties for qcom,glymur-tcsr and qcom,mahua-tcsr.
> Both SoCs share the same QREF TX/RPT/RX component naming, but differ in
> topology:
> 
> Glymur has two independent QREF blocks fed by REFGEN3 and REFGEN4. Mahua
> has a single QREF block fed by REFGEN3 only.
> 
> Mark the relevant supplies as required per compatible using allOf/if/then
> conditionals.

I don't think you implemented my last comments. You need own binding
file.

Best regards,
Krzysztof


