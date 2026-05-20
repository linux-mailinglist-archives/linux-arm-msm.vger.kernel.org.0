Return-Path: <linux-arm-msm+bounces-108683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAtFOMeIDWpdygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:11:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C16158B704
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27DC23045AA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516A93D5646;
	Wed, 20 May 2026 10:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wh4BBkVq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCBE3D5647;
	Wed, 20 May 2026 10:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271853; cv=none; b=Mckp/PPVfR7y4/qrNqgDenfvehuShax8Ebk9wr2dafD2H4F53q6azwpoTZykIp2NobbnddCO6mqDiQRfywgMHTSX89LPsKYDsyCx4UdgIE5MByGPTwCF8syO26kWE+rQHxMg/2qs0xZZij+RhjgoFfJuJddy8szq3fI6cn0xq5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271853; c=relaxed/simple;
	bh=A/J6LuQOCipshQbzSQ2Z78neUa69ptzf7U/s5KY2jEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZcXsw/DVJvhfpUPHvwwIzBOI4XQ7LQqxH6z63eHm11a6aXJBm+KR3gsIaDQNWvNOQkYEVtTRzmXG7V2aWdohpNJfo7PsWtGRCnhSPFpYajpphb6NTa5kYu9f6XEi4W+99nDZL2D1A5CPIOhBtDk3OLFSaR/bE6oUcCccGnxpcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wh4BBkVq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3880B1F000E9;
	Wed, 20 May 2026 10:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271851;
	bh=PivbowipV9Jbg+LCX/X6AF7+nET7mHvJSKbJDIeRSX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wh4BBkVqKEH1+DR+r4Xmb9vgKlV3E0QXlX9Yy5Nz35DXcWOGq4/DKKXwV58ipkpCD
	 DpZxBIm3sd2dGrdE1GgWJS1zj7V73NThaynQnnoGv17Uimu+PqOUvaZonX2ZpF7t3y
	 jIZDYiqvIpp681R5iRYq/nUx06Davk5iMJOzmtViK+H62eHEGZyFwo2BxnHGKDDoZM
	 oyEC8pOKUBlFNO80ILg7iDOVYQtGo06qqABOvYVmIp9fVIT/Vo9B/KQL3oh7ApMP74
	 0yMcA5bw9uChl211Fv9HDiw12OFFSn1KYd5+1ZfzsFKRurrfVOrzmG8Jq+aL8mbHGU
	 FPEOsdXLVYAgw==
Date: Wed, 20 May 2026 12:10:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Document Eliza CQS SoM
 and its EVK board
Message-ID: <ag2IopOAMyyNd6-X@quoll>
References: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
 <20260519-eliza-dts-qcs-evk-v2-1-ad7303659d24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519-eliza-dts-qcs-evk-v2-1-ad7303659d24@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108683-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9C16158B704
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 07:09:52PM +0300, Abel Vesa wrote:
> Document the compatible strings for the Qualcomm Eliza CQS
> System-on-Module (SoM) and its EVK board.
> 
> The SoM is populated with a CQ7790S Eliza variant, PMICs, LPDDR and
> eMMC. The SoM is then connected to the EVK base board, which provides
> a multitude of connectors for peripherals.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


