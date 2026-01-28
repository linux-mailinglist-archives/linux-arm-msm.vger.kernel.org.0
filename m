Return-Path: <linux-arm-msm+bounces-90991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCGCEXD2eWkE1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:43:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA280A0B6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50D3A30125D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6566934D91E;
	Wed, 28 Jan 2026 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPYmi7Pe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4197F2DFF19;
	Wed, 28 Jan 2026 11:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600620; cv=none; b=HFjb7QLSZ3vWbzQWMZFwu0Vb0pPAJQWmD5AmR2UA7bJE4tGwQHXcSMABCVkEotvZXQkowMGvVe0vbpX3Q5mdMRumRCCWiT3VgsxfVi1l1ddAiq3bwsj2pd8WBQFi7aps4h6D3lwklfWNgqfUNN0s1CVwOP+QiyJjg0NPlrwXr6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600620; c=relaxed/simple;
	bh=okYGx6BHN+uY/ra6J+4FP4vZLKwwL9WMWsB32tWHb3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUgSr0W7hslU4y7cMBEkaDD08KRDvMF/fciI8iPsCWmvMtACj+o5dbrZdlUMTbWdjEnObJc8pOmx/ruXcTPS33fX1FkI9tUqldSI8zwon9uj6Aa1tH8+jiHj+5K+qQxTMNHR4BXnpEoNzjG7GLu1YjawqQIImZns3sxwZvX0Sog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPYmi7Pe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B87C4CEF1;
	Wed, 28 Jan 2026 11:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769600619;
	bh=okYGx6BHN+uY/ra6J+4FP4vZLKwwL9WMWsB32tWHb3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XPYmi7Peoox6R4m3dgqojrMYl6g5MsbnmcQ3Jv7lytQtDcOSVQVlOQNae86HpXZ8y
	 Bd/o5A0v3lme+LrWdNYCyKVjpZj/P+fBOzMD1fo+DriUZodGxTTG3CxR81eVFdv8Z0
	 5tcc3YhEeMO9KWBnQPL4uMPAK0r2CsLWSp6mVYFi+GEfMlblq7e1oqKPoAIu4T2/vb
	 ZgRi6yeJDFfl7nOSjdZXdBk/4kqer5kVa0EVz21ffq8z6++D3+ZQSK0FrisVs6dnTG
	 3JbcbWvHf4qZP26k5ZIUjRnIgTlcCIoET4LWunMmXeFCrFhYcOZ45F0I23LQOW9XLr
	 sUaDUJcftrzoA==
Date: Wed, 28 Jan 2026 12:43:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
Message-ID: <20260128-resilient-industrious-flamingo-bac209@quoll>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-1-b23de57df5ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128-purwa-videocc-camcc-v1-1-b23de57df5ba@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90991-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AA280A0B6E
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:56:32AM +0530, Jagadeesh Kona wrote:
> diff --git a/include/dt-bindings/clock/qcom,x1p42100-videocc.h b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..eb6c9b7264f8cbced7cfa0001903238ffa168431
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
> +#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
> +
> +#include "qcom,sm8650-videocc.h"

Don't do this. It's already a mess and was allowed as an exception. Now
you grow exception into pattern of chained bindings.


> +
> +/* X1P42100 introduces below new clocks and resets compared to SM8650 */

Best regards,
Krzysztof


