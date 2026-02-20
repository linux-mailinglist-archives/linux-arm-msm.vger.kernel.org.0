Return-Path: <linux-arm-msm+bounces-93460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF33ERwOmGlF/gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 08:32:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB471654F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 08:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 291BB30054DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 07:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1892B331A77;
	Fri, 20 Feb 2026 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VlmHSu32"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97FE2BD030;
	Fri, 20 Feb 2026 07:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771572760; cv=none; b=lOMvhwG/tHr+2FjQ4d71yv/46lP3IQuXvjg6g3RsRePj+v2JRw/RmIVdaoy/FNKGVggkJGWAWyxhzVHM9UqwF6jYtcXPwrb9xmJSTE42EZ6iCdFzY6Ec8stjS5g6HGvddKpx64gFEWCnc4aN6KmCTJz3lAklVj9WAYAoIKgzPE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771572760; c=relaxed/simple;
	bh=ja/Au8yYydwcnPjfZRcjcxY2BHygaA1MhU/bDE1G/Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkYVAzqwqBhaD93kJUr70MgmsxRgUkGHffd6slTpW2LzwnUW3qgHY/ep0c0OMUcHdmFf30UNqjRGBEKdYQ7Nl7WmlUycCq7TvKPqn93vKDmNZStRYUFS/f/PQp8IPyRf3mnM/kN8TBjuunjO4DjWRqUuq+Y/zDYkoQNs+MtCTZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VlmHSu32; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C52C116C6;
	Fri, 20 Feb 2026 07:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771572759;
	bh=ja/Au8yYydwcnPjfZRcjcxY2BHygaA1MhU/bDE1G/Rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VlmHSu32hu6dOgrBQ2+YNFe2pUrpAG7xd9zMK0aQcw+yUSeOEtFzA5eCpMbLY6FZp
	 NJnEWpyRyJBGa8XwR/g+DCC4U/y4eSQS1tNAKeGjX1jHJNh6cBg9I/d25BxBfH7zkE
	 OCE8KZf0NSeIv0ZBwpkAOoMrSjZi8WfG/MfH2hVowR2vG++GBvHqdhv6z02rlK5htR
	 B7uYxhy4e/xE/+LMtY4uyGikJnz6vxiUe/ClmsQARZVy5sBNSh2Hh9CKO4Beh05Zxw
	 psQTGqPTO5WEcIbq4wGjbMhXy09VmKUQppHn4Q2mhAXrOO0/7jxLD0TYdSxkKrrz8J
	 4s6UIuaWZuJqQ==
Date: Fri, 20 Feb 2026 08:32:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom: Add SM8750 GPU clocks
Message-ID: <20260220-defiant-qualified-agama-bbe7ee@quoll>
References: <20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com>
 <20260220-gpucc_sm8750_v2-v3-1-6c5408564c3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260220-gpucc_sm8750_v2-v3-1-6c5408564c3c@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93460-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DEB471654F6
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 11:24:20AM +0530, Taniya Das wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The SM8750 features a "traditional" GPU_CC block, much of which is
> controlled through the GMU microcontroller. Additionally, there's
> an separate GX_CC block, where the GX GDSC is moved.
> 
> Update the bindings to accommodate for SM8750 SoC.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |  1 +
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
>  include/dt-bindings/clock/qcom,sm8750-gpucc.h      | 50 ++++++++++++++++++++++
>  3 files changed, 53 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


