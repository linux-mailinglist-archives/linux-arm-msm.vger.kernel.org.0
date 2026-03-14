Return-Path: <linux-arm-msm+bounces-97700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XvfaAak7tWnvxwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 11:42:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B5A28CB99
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 11:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A52C301D32D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C847258EE0;
	Sat, 14 Mar 2026 10:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qSHZpt7c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54E82628D;
	Sat, 14 Mar 2026 10:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773484963; cv=none; b=TMIS6hyr9MPF+Lnpet4YZZg/Nsvg7gXYfcmUR3WodleJfnqKHeA4wVzkszOo6YKxD2xo7ZrqlR7NST0OJouNNrN36OF7YhUh+cyMaCy4V6ZsnwzTNIpLxav9Unyl22K2/T05hx01eBhOlJfOdBQX2eDg+ixOIp1J9ishpPzZWVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773484963; c=relaxed/simple;
	bh=bzuiB+YpzdM5PLwtUn3qTESRry8b8gD9nMuGeiBqYDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYRtwpPCqgQF7AIvZp8hh56WlvrzBddEMPZx262R+CiVvJHR/Jz05KYuRql/674jtGJboLMtT7wtDaLpqijtv6c+eRhhXTm65cWmem5wgWkd8FCUQpZX6Yujntz9oN1Sqx7J1lgI9aCGzIZ/8jdeFM/8EWWEdewSo0hcPY/QXKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qSHZpt7c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF86C116C6;
	Sat, 14 Mar 2026 10:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773484963;
	bh=bzuiB+YpzdM5PLwtUn3qTESRry8b8gD9nMuGeiBqYDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qSHZpt7c+DZ/EGbFbGLgjou6l+GwolbGp11VQxYHowKWy4ZiQ7IMacLISD7xzYYan
	 qgXBuJ66vj3XyHJLdctOmok6OfGF2Imi++oUS8cVZbf2JpV+nIxaccJfcP0QAs6ztl
	 DDQinNm7TFmPfl5OYJtOaid8SnKSstYCV3jcfhxqj1ObFhzRtr7hZnlDuEFSux0iZ0
	 GhXh8Qu+Tv0eetA0mqAiMGXjeo0RxsvkWz0Q/Qm+UoAJZ9mJCHF31xkymdODT4jPAR
	 csGfBBOMAli+SVY7tcs1h9GwpmevTGj45cF2WgRKEdiPqwP14GausAmfZr3MUqzPfH
	 uRHXhBprr9ztA==
Date: Sat, 14 Mar 2026 11:42:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: add SOC IDs for IPQ5210
 family
Message-ID: <20260314-intrepid-lime-sturgeon-77febe@quoll>
References: <20260313-b4-ipq5210_soc_ids-v1-0-97faae3fef95@oss.qualcomm.com>
 <20260313-b4-ipq5210_soc_ids-v1-1-97faae3fef95@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313-b4-ipq5210_soc_ids-v1-1-97faae3fef95@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97700-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 69B5A28CB99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 09:32:56PM +0530, Kathiravan Thirumoorthy wrote:
> SoCs based on IPQ5210 is shipped under two different naming schemes namely
> IPQ52xx and QCF2xxx/QCF3xxx. In the later variants Passive Optical Network
> (PON) interface acts as the backhaul where as in the former it is
> ethernet backhaul. Document the same.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


