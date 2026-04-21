Return-Path: <linux-arm-msm+bounces-103924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHwEOI5T52mn6gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:38:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 825E0439A13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F3933028377
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D073B4EA8;
	Tue, 21 Apr 2026 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9OfPvfm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248FF3A1E7F;
	Tue, 21 Apr 2026 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776767854; cv=none; b=P1ogiQeiOp3CcmB+JlR3qT/Hflu3mvg73m+T3LLJ4n+h8GO088ApQnbJPwY1HnoUPRv1HnKx6X6XjQS8FM5iskouDbRj6tQSforxkW3XyDaTCnQuQI2OLl4vAEaXgVsPHicZLFllsM9/vUbRt4ru3/kO1cCODZ++7I7+10So2gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776767854; c=relaxed/simple;
	bh=6ZjoCv72143vsfvC/JePc4KpnLy7+o96aAmw/tqD180=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dW8r8sJk+slIaQTZFtORTKJyNsTfRDC5fJLogPMm1jr+UUm8BJXD2DDtWeL4WUiMLzPKzNJRbvQvIKtz7+esVjqNFro62FJ4/RyaZI5mtUPhFDblC0u4pMsGYtrn0RZTT1u6E2Kqdrt8v7zVjgsfmyozvmB92rH+WNmvN6mfLKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9OfPvfm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6572CC2BCB0;
	Tue, 21 Apr 2026 10:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776767853;
	bh=6ZjoCv72143vsfvC/JePc4KpnLy7+o96aAmw/tqD180=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9OfPvfms9roYL+GsVydxP/cqoSjPgXxE0gS86wUq6wCTBQdT4BHVyEtZD6I1lNI+
	 JieUXuTCT/WHpk6oSrKLe+eMyodQ7XlUhPt8MZI0DhzBtved0E0CZqp1FDIF8eA4Ce
	 LoBghzeh4xKJOz7sWjcqDJP9YkQe37HvEMA2EA/9yviGT3NPWRvFG5YDy2qa+gwF/h
	 6M8OJ3mdXleemUP5rDVGXte8zYPHx28yWbdCeMdXKKBR5qB1GZV/KUuUqy+JZ3Ryai
	 8qJNXuc4sdIpTztbsDidYSYfVt3To9eZb7jtBLkHKyZoRUm/IQWDx2Zfu2tj4iw02s
	 kjWnDd5O966dQ==
Date: Tue, 21 Apr 2026 12:37:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] scsi: ufs: dt-bindings: Add compatible for SA8797P
 UFS Host Controller
Message-ID: <20260421-tiger-of-pastoral-potency-d4502e@quoll>
References: <20260420100416.1252983-1-shengchao.guo@oss.qualcomm.com>
 <20260420100416.1252983-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420100416.1252983-3-shengchao.guo@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103924-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 825E0439A13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 06:04:16PM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> SA8797P is the automotive variant of the Nord SoC.  Like SA8255P, its
> platform firmware implements an SCMI server that manages UFS resources
> such as the PHY, clocks, regulators and resets via the SCMI power
> protocol. As a result, the OS-visible DT only describes the controller's
> MMIO, interrupt, IOMMU and power-domain interfaces, making SA8255P the
> appropriate fallback compatible.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml        | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> index 75fae9f1eba7..f2f3bfc73216 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> @@ -11,8 +11,11 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: qcom,sa8255p-ufshc
> -

Do not remove the blank line separating from the next property.

Best regards,
Krzysztof


