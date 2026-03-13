Return-Path: <linux-arm-msm+bounces-97367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHX/K3rNs2n2awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:40:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0B527FDA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABF8C301C94D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2061346AE3;
	Fri, 13 Mar 2026 08:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBiwhkVW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB4F328243;
	Fri, 13 Mar 2026 08:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773391162; cv=none; b=JEuv+JDfBfJfz/tf41zIW1vZZquHR3uRn2meF1wD03jlivsu51CLA57zj1II6/+Uk0p8kxyqiUldubZ10ZjFORORqqUdUPDiRsGBWtkXZtr+FxZbt2q95RKyGD46eNwg89+kjA/FpF7+PZHJOUdNDetnPAAXW9bY/8JbKl8MyH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773391162; c=relaxed/simple;
	bh=RR3S/UBwKBbYJhO3hAsDcAvP8WmYrGXdtSBSo+DgZhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D73UacU0iSsqTE2JhJWWkqmVO2ZBB1AwODsG9ZuDxcaYYCcFu1QvfBsjkxQzvX7ln8ir/fUJ2tJOiXMejweCqwwkFFSRefJFWo5Un3BVFitbo97guqHA+goDn5Gf6DWoBGl1o1AkSNI5l4DZcIUQB+nyNQJ3IwPS/rGe2yR5aBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBiwhkVW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF17BC19421;
	Fri, 13 Mar 2026 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773391162;
	bh=RR3S/UBwKBbYJhO3hAsDcAvP8WmYrGXdtSBSo+DgZhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aBiwhkVW77BqasmmrKb5bUq7kTwTYciyp0JiNKpMujl5ZTVAmArow+sB8DChllkC5
	 NxeXStNNBWiO84Xz/UunOzbkvq/sB4Hm1H0UdiJzfYyCyHp+llL5clbDbEiagPJ2aW
	 9FKXRNou6IakBS2jmK4lZpjSZLv2VwSMilL1ynp1pfwzPOZzuMVsA+9jhQZXG+p3EN
	 bXTII6Q6MdLogvFgQZ/8a7H8J4HCECzqyFwgnErwWlp4cQXCrVYrF7B2jD66zcasE7
	 dl/I7X+8fTr9aeWRGbjqCqwf4KfQoP0lwrZyypvsz4IXbLoxlNizDnUE+6UeK+Sk+H
	 SlDt7WK7rG+nA==
Date: Fri, 13 Mar 2026 09:39:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: Add AYN Odin 2 Mini
Message-ID: <20260313-romantic-spry-badger-7d7acc@quoll>
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-3-e66986e0f0cb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311-ayn-qcs8550-v2-3-e66986e0f0cb@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97367-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0E0B527FDA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 12:44:39PM -0500, Aaron Kling wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> The AYN Odin 2 Mini is a high-performance Android-based handheld gaming
> console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
> 5-inch mini-led touchscreen.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   2 +
>  .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dtso    | 147 +++++++++++++++++++++

NAK

overlays are not for boards. I think I was clear in the past.

Please carry:

Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


Best regards,
Krzysztof


