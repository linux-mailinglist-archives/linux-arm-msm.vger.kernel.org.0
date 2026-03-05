Return-Path: <linux-arm-msm+bounces-95520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEAhJIo1qWlk3AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:49:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CD620CEA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69F24302F687
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 07:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07170328B7B;
	Thu,  5 Mar 2026 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+9h5rox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81EB27E05E;
	Thu,  5 Mar 2026 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772696950; cv=none; b=C5BDhZKoMbSe7/i76u5UC+74bqj8Fwdj7t3hRFm1RZKmL00+RuceuvqxsanKb/T2OhIRa5R9s/XwlOA31d0SYpsWaJw/mUnuoo6KPA53tbxkKutletiSunsGcTPjAiPlBd8JsvX2qwI/O9xpXmjnt4Lo6eqtiMyWJ4kI9tlMR6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772696950; c=relaxed/simple;
	bh=TFdAbilw8W8sjWd9J8Wt7r39BydUSFkn/rQZC9TwBRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLl7s/5YLjSs0CAmGTD0b8EY+WPVa78qsA/bpBgjvHAnOJ9FR35qc1I382IWCAqQOL6z9j6VPKVbZnZgZeXEiPc2uAU+8XTKaZ5ekxO7udLgr3XrgMzqHQ02eVEUOwFxc2y+b+SDI2LwDy+4zov47fa97Gf49eWCg+bjyO7XEqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+9h5rox; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9459C116C6;
	Thu,  5 Mar 2026 07:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772696950;
	bh=TFdAbilw8W8sjWd9J8Wt7r39BydUSFkn/rQZC9TwBRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o+9h5roxVzDXrGaHll77MdtFkZUAg5e5fK5yEz/y4+SA1cUuQLGpBcKfP26Wg6pBc
	 WvUVljrgQuUiFmna5ubk44KFLeoILql1244YJ3PJly0OVWqC4SDZWxPm+UsFtmxZaN
	 4wuNbg1FBNBrc5TyExBGaUu7Wq8VECIu6fQ+69H+tjluloT29LwOMaeB9UCuZeTUf4
	 eKRNWoOZgE8AspGYggfzZrfsfCJ66LySxj5c/5FkUWTXTZNXdyh333LZh6yh6O731u
	 PwiizzG7gwmKjolGBOfufl/HNfDjbWSVXFrUWUioCu0vlURzcaMaA9VzVw9aWoE2ar
	 sGN+Pjf5jKcqg==
Date: Thu, 5 Mar 2026 08:49:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: qcom: Add X1P42100 camera
 clock controller
Message-ID: <20260305-rugged-agama-of-merriment-6cadf1@quoll>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-2-dbbd2d258bd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260304-purwa-videocc-camcc-v2-2-dbbd2d258bd6@oss.qualcomm.com>
X-Rspamd-Queue-Id: 08CD620CEA3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95520-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
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
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 11:10:52PM +0530, Jagadeesh Kona wrote:
> Add X1P42100 camera clock controller support and clock bindings
> for camera QDSS debug clocks which are applicable for both
> X1E80100 and X1P42100 platforms.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml | 1 +
>  include/dt-bindings/clock/qcom,x1e80100-camcc.h                  | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
> index 938a2f1ff3fca899b5708101df7f8aa07e943336..b28614186cc098268ab0d8c32b21d9dd9508c9f9 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
> @@ -23,6 +23,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,x1e80100-camcc
> +      - qcom,x1p42100-camcc
>  
>    reg:
>      maxItems: 1
> diff --git a/include/dt-bindings/clock/qcom,x1e80100-camcc.h b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
> index d72fdfb06a7c716ed2ec376e061e4f0ca35f42c5..06c316022fb0d26ec6243b28477564d97f228c8e 100644
> --- a/include/dt-bindings/clock/qcom,x1e80100-camcc.h
> +++ b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
> @@ -115,6 +115,9 @@
>  #define CAM_CC_SLEEP_CLK_SRC					105
>  #define CAM_CC_SLOW_AHB_CLK_SRC					106
>  #define CAM_CC_XO_CLK_SRC					107
> +#define CAM_CC_QDSS_DEBUG_CLK					108
> +#define CAM_CC_QDSS_DEBUG_CLK_SRC				109
> +#define CAM_CC_QDSS_DEBUG_XO_CLK				110

Why X1E now gets all these clocks? I don't understand why you are having
separate drivers and decided to change the ABI used in the first driver?

Best regards,
Krzysztof


