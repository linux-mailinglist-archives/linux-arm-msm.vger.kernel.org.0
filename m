Return-Path: <linux-arm-msm+bounces-97687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id skArAeYjtWnFwwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:01:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B69528C3D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C4759300E2BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 09:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76D91C862E;
	Sat, 14 Mar 2026 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BfBAuSv6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AC070818;
	Sat, 14 Mar 2026 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773478881; cv=none; b=hIfpzsNn0EphWIleQMRu+wvHvvHA3ON0uBWfWI/nHLJNRwnO7C1FcAWS/RamofaB40Jbe7ilD7egqR2Eg2+x4dMAeZweeiRWPU+9IYilScamBObb1b8p6HPryBKNO9WzBmDRWG0yWZ6qpfRqkAfA7uJvCr0cPnGxMJG3gaGm3C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773478881; c=relaxed/simple;
	bh=pBaaXeu9/QXt2rXgK/g7ZRMeYiCZNValiF26uuS2oas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nn/0dcnWUrrvtysBmWNIt0HfBSVfl466bpqFeGanLzdXPB5ePUoEWBL/iubSeP6xc//udMlqRHBHvElCFZw5KBWwdYm1Pt3jT0cJePxXtvjH6qFxWphGQ8WTx6y7OQErfl1Vy5mMn/4jmxO09qujrMMy4WRapp605cPNz+ZNyNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BfBAuSv6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD96EC116C6;
	Sat, 14 Mar 2026 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773478881;
	bh=pBaaXeu9/QXt2rXgK/g7ZRMeYiCZNValiF26uuS2oas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BfBAuSv6vxRq44BmB3CzXkjxAsS3geeYNSuPbBisMIy0ye5AkK5Vv+fPMoc5yF66m
	 JeanQNrLtCMYrt00OHEhIIv+Oqn7HEjVR51d8WWplydz1jPOftm+SRYSPcjR9mIFm9
	 Bt85TNZNGlwL1jGpDvl+NconhfzKtvEOh1ViG/prVstsr16bH+C764pUwI+/NrXPq3
	 VfppXW9dKaUriD8ryLSyexlta6sB4yX5t7PQruK9GJCa+T4+EbyZ+6bqC/zEeWOuOP
	 E1UYgmQwU7Hvn4DaWrdYrJFvTvqoEz1k0jJ6FMrKS3/PAlMPFb9yjctKC++qyGwia4
	 +Hp4bTiFYxI9g==
Date: Sat, 14 Mar 2026 10:01:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, mani@kernel.org
Subject: Re: [PATCH V5 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Glymur ADSP
Message-ID: <20260314-dynamic-terrestrial-pegasus-81c507@quoll>
References: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
 <20260313120814.1312410-2-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313120814.1312410-2-sibi.sankar@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97687-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8B69528C3D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 05:38:10PM +0530, Sibi Sankar wrote:
> Document compatible for Qualcomm Glymur ADSP PAS which is compatible
> with SM8750, which can fallback to SM8550 except for the one additional
> interrupt ("shutdown-ack").
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


