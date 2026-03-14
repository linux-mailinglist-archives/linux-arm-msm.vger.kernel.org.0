Return-Path: <linux-arm-msm+bounces-97701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF2OEsA7tWnvxwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 11:43:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A25F128CBB3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 11:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 207F0303A5D7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1755C279334;
	Sat, 14 Mar 2026 10:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbTG6Lka"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E616C2628D;
	Sat, 14 Mar 2026 10:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773484988; cv=none; b=tcermOEv1CkACQEtkCG48qfePQT2qSkAIT+dZGpe2HHEVD747D/xMoI80rGA9A+mF1ESdqQprpEzyXOzJSLgV87tTxCT76c+2b88clyDSqwbmyTn5tSBi4CANhVdrVOddYVY+VlLfrPjqcj19trT9SEktYQvk4Ymr7tnBYekyQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773484988; c=relaxed/simple;
	bh=1m7isLVrRL619n7zT4NGYLbEL2NHmKuUEHTHIKwrFYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=peFrFU9WTo4hq6a5QBph3HsIco0Yv76UTGYkHnLG8rCumUdPenvgyjrrmai7E7mYPDVAvwMD0QT40ttqh+nfJTqyGNtgHJz0vMgFVXkLU3PtsR9hAlWfQwTr2ocUKftK5ETxCraqdV/9eQpVXdJo55Cxn6ZmWQTb6rTKug5lDfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbTG6Lka; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E69C116C6;
	Sat, 14 Mar 2026 10:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773484987;
	bh=1m7isLVrRL619n7zT4NGYLbEL2NHmKuUEHTHIKwrFYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbTG6LkaXzc/AGEe9NuK4glshfowgKdhPcbN5EMdjFQAIDfBlSi+14yEg8VVy4mkY
	 y2u3I6X3trvcg0CzfYKSEZP+7NFqGBBvuBTw5d0zn0rOaM+P9Vv39WJngHBnmUyfAC
	 N41dVT5S28BGRPHlFWwyOjdnaX4i+dky66Y7Nc4n4mlHZIUWwMgFXNNb40z116TSQZ
	 T/lHtCSOhGs58bJOMLMD1Rrbz8tfgStBNIYwuv4yllGSZ0VQspYMFVJdZ3eq8+NXj9
	 qr0f2JQq1dW90svc4RPBPPn7cskjwAu1ePOetwV3VLnPm/fqXiQvqPEI3zrZ3Rm6Mz
	 m4IfaE37gzLxw==
Date: Sat, 14 Mar 2026 11:43:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: add SoC ID for IPQ5210 family
Message-ID: <20260314-neat-venomous-basilisk-fc922c@quoll>
References: <20260313-b4-ipq5210_soc_ids-v1-0-97faae3fef95@oss.qualcomm.com>
 <20260313-b4-ipq5210_soc_ids-v1-2-97faae3fef95@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313-b4-ipq5210_soc_ids-v1-2-97faae3fef95@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97701-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A25F128CBB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 09:32:57PM +0530, Kathiravan Thirumoorthy wrote:
> SoCs based on IPQ5210 is shipped under two different naming schemes namely
> IPQ52xx and QCF2xxx/QCF3xxx. In the later variants Passive Optical Network
> (PON) interface acts as the backhaul where as in the former it is
> ethernet backhaul. Add the SoC IDs for the same.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/socinfo.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


