Return-Path: <linux-arm-msm+bounces-104511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KRTBiiY7GkOaQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 12:32:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 828A2465EBD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 12:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E8BD30158BB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 10:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7DA37E302;
	Sat, 25 Apr 2026 10:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kShwqNNP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF97282F1A;
	Sat, 25 Apr 2026 10:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777113123; cv=none; b=OFHPu+WLK7i1PiSkqbw8CGDH7LcC25M9+DegpFnxxQGK56czodgiLPVd46YFQrVq1YHE99d5cpC9ZrQtFw4eE0nf4tx4CcukgiDh4jY7qM9bXuN/a0gO8wb6nZ5b3kQs586dYCiOXd1JaPkY4x3w6BvY9jXDhn9BhDUQDPsnP+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777113123; c=relaxed/simple;
	bh=4DVuXvTYmVYipPsUJoa6EH06pMLRwKzKbnAs09ruEM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9k5/Ox2ssf8YpJ5jlX4VthiEzcjBVaxkJvdZzWWEeIxoEkJq8e9B10cG2TJ93HVaHP2yRMme9quqN3WD6lfOP7sErwScV/Z2WbJBUhivqj8JehEzacNzVNqtWC0NU87omG0lSUN9xUPEGpfx9Ye3dONHogBbRVYX1Ncl1LWbk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kShwqNNP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E27C2BCB0;
	Sat, 25 Apr 2026 10:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777113122;
	bh=4DVuXvTYmVYipPsUJoa6EH06pMLRwKzKbnAs09ruEM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kShwqNNPEaY3f9gQcEXJNT+fnykzvRPkvxXUlQjre+fPf6VXYoNeg8r/3Ns0wLitk
	 rYwxYiJu4MVjMbC96ERRN1EwiDcKwdilrF4jj2Y4r469m+sEIutIkg65SQy2cmY3Rb
	 Wmtvf+4ODBuRsGSq1pyyWHB6fk1+oxLegVov3iJaJw2HrYIODDlYcVO21gpnUjaFP4
	 th8Rukcl7OA3Ty88n7txnbu1tkZngit1IPEBSjiiNYHn8Kkvx6WtGgtHc5qpfVg23y
	 PIo94ICGMztWG1+RWZWygyHuer2vLlRZvpvolkCa2G3DULrOzSAwMcEEDBqm3m3h6B
	 3zspxMz/1DzYA==
Date: Sat, 25 Apr 2026 12:32:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Cc: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	robh@kernel.org, neil.armstrong@linaro.org, gregkh@linuxfoundation.org, 
	dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, abel.vesa@oss.qualcomm.com, 
	wesley.cheng@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Message-ID: <20260425-organic-basilisk-of-exercise-f14c6d@quoll>
References: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
 <20260425070002.348733-4-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260425070002.348733-4-ronak.raheja@oss.qualcomm.com>
X-Rspamd-Queue-Id: 828A2465EBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104511-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]

On Sat, Apr 25, 2026 at 12:00:01AM -0700, Ronak Raheja wrote:
> Document the Synopsys DWC3 USB controller found on the Hawi platform.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


