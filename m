Return-Path: <linux-arm-msm+bounces-103704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PSLMqjq5WnxpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:58:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 087AA42892C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E3833029269
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762A0389DEC;
	Mon, 20 Apr 2026 08:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLrHv/Xn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AAA388E70
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776675228; cv=none; b=kabSiZKhXdncEkhP644T3mg4vqLe3/lsXghXyB2IL+FQu9CjhF9Q5r0F+tEfjrPA1Ns61GCBo3ahgKvmqVLZ/C/ct3dcLQoTeJomEDos0SyRbHG1svcKoF/kPH9wkun4rD8KKAEi2Rm3BUBmlNoQ3OR2l7Ev6KU0RCgWMhm2JqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776675228; c=relaxed/simple;
	bh=eW002aUV/pDc7QNMwK4vUV0AbIjBkQcbKvXG8+FqB3k=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Okqj3GpSqpZM/d5Qg5Srdej2ALoO3SYJVgRJ7523lIaJ+zesNKqD4UoY52dIDeF2+Y+Q4c9YRBUpKkEwTTaxpkq32pTpst/Oi0bGamoAdj+ag/SlXFolzkU4lojZvtSWxen14ATrP0PEtDYLiLoQLUZM9qJhM+3Vucydp/IJoHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLrHv/Xn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B8DC2BCF5
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776675228;
	bh=eW002aUV/pDc7QNMwK4vUV0AbIjBkQcbKvXG8+FqB3k=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=QLrHv/Xn6HC23/w6nn94mXgnR14YURNJd/57C9ACmoSi28uoI4wvopNGiWNSTISqk
	 78cnOnCvjzts7uUxlJ2wLNIOuB/P+iqHNtQCc/OkO/HjTM3WjS1b3el4Un5TryA4bk
	 ak0A/KZuetcg7qYwKr60Uf14N2FzQhz0J42w90uPR/AO5FF+vCbMVMm2UtyEqBvuwi
	 o9dXFj+bhiZL/cLqBTkswi7Pxo8Kr744fjXAbk/1+1WQMAgmZcoNobJ5/m5b2LInQn
	 AN+JlgjnbEzosd2ysvOHS5nAWhVq5gmfuCcGskbt65LABl0KazoycZT2Z07/NKgK+7
	 Clru1DUVQ2tmA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a402dea4a5so3168619e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 01:53:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+WltOVXWY9fc0U2B+P6UvvkWNgsptJ33JG12BRinrGui88gIxW7jLU+zsNHRgcZXHmWTIltQNzvPh7fmP2@vger.kernel.org
X-Gm-Message-State: AOJu0YxelQln6Qnk1VUcqiaZPmAMu0Pin8QsjvXq0yke4z/YrWXBnTy8
	JeiZvKxwDKDR9dn1EFGc0d5c6+oF0ilnoHunqc1lqjPiQOMoQ7aNcZJOHiqf/JJNepJgeYMjMwz
	t98CEilAcnLEIzbqHqMxj3k58zEwmwN5PCslsFlhpjw==
X-Received: by 2002:a05:6512:4142:b0:5a4:e6:8fce with SMTP id
 2adb3069b0e04-5a4172f609dmr2938573e87.38.1776675226584; Mon, 20 Apr 2026
 01:53:46 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Apr 2026 10:53:44 +0200
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Apr 2026 10:53:44 +0200
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-4-5ccf5d7e2846@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
 <20260416-qcom_ice_power_and_clk_vote-v5-4-5ccf5d7e2846@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 10:53:44 +0200
X-Gmail-Original-Message-ID: <CAMRc=McE8YHGWuyRmJAt+x2mzMexgfz1zsnck6yYcupt-jcZtA@mail.gmail.com>
X-Gm-Features: AQROBzACJ6Vdt_y2a3lRfsPW_8wLBcxtRDZ4npozYG3KDFhLtTX7xP1EwaHhPoM
Message-ID: <CAMRc=McE8YHGWuyRmJAt+x2mzMexgfz1zsnck6yYcupt-jcZtA@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] arm64: dts: qcom: lemans: Add power-domain and
 iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Brian Masney <bmasney@redhat.com>, Neeraj Soni <neeraj.soni@oss.qualcomm.com>, 
	Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	cros-qcom-dts-watchers@chromium.org, Eric Biggers <ebiggers@google.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Tengfei Fan <tengfei.fan@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, David Wronek <davidwronek@gmail.com>, 
	Luca Weiss <luca.weiss@fairphone.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Melody Olvera <quic_molvera@quicinc.com>, Alexander Koskovich <akoskovich@pm.me>, 
	Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103704-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,oss.qualcomm.com,vger.kernel.org,kernel.org,gondor.apana.org.au,davemloft.net,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1d88000:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 087AA42892C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 16 Apr 2026 13:59:21 +0200, Harshal Dev
<harshal.dev@oss.qualcomm.com> said:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the UFS_PHY_GDSC power domain is enabled. Specify both the
> UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for lemans.
>
> Fixes: 96272ba7103d4 ("arm64: dts: qcom: sa8775p: enable the inline crypto engine")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index fe6e76351823..d83cad26a20f 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -2758,7 +2758,11 @@ ice: crypto@1d88000 {
>  			compatible = "qcom,sa8775p-inline-crypto-engine",
>  				     "qcom,inline-crypto-engine";
>  			reg = <0x0 0x01d88000 0x0 0x18000>;
> -			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
> +				 <&gcc GCC_UFS_PHY_AHB_CLK>;
> +			clock-names = "core",
> +				      "iface";
> +			power-domains = <&gcc UFS_PHY_GDSC>;
>  		};
>
>  		cryptobam: dma-controller@1dc4000 {
>
> --
> 2.34.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

