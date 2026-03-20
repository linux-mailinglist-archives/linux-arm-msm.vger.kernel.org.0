Return-Path: <linux-arm-msm+bounces-98961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N60NVV+vWnH+QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 18:05:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D272DE39E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 18:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90065326C997
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC8D3CF034;
	Fri, 20 Mar 2026 16:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="rG5Nk+gH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AD43CE48B;
	Fri, 20 Mar 2026 16:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774025813; cv=none; b=bxfotuU6kfrvgxBNP21L48ZwG/XAwUu3EuGRnLuNknBqwSolGWbviK3Er4ZSSmt7RdGK4sMCuY9pbkuL28MkJtZQdymFR6lJEHdmEqmsJQYSnjcXcpWM4Sz1e43cD/BBOhMRg1rk+Yv+vlKnkfO/cV1GjGSblJIu+qAnrydiSGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774025813; c=relaxed/simple;
	bh=TgRsU3EeG41egoh/DnnAYXLwdSdRrnSL7ykX8hN7pvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lT6w3QR99f0WSWOLfPAOcd7HPX9IxCXDN8IsH2emc7IOKNfGarpDl+J2k9iujE+LaZA5pTqe7MET8gaBSDkfEpqejhpJgpFdc7QFzxCJKH3nAqv/WpNyCTqJwAoA7i/LsizT+Yz9sqj/LqEvaI4btehaZg/ahzaUdJUAkgGFMqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=rG5Nk+gH; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Message-ID: <8abf3f78-c994-4d05-81ea-ef54dd380109@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774025799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ynnEc+hm4gdxANcP0Y8J16RiNP4eFgHWE6RBfPScq9s=;
	b=rG5Nk+gHWi2SOAX1V0yK90pwRtv4kn2Y4Q4YfVyeJUyJYPBB0M7dUJgM+I7IPKdctY3GcO
	t15m9CPP68Y/KmMqxWHsBF3FJWTbGV53HdN6R9IrHv1gUkWEmLK9BK0mr6+kYuCCPux28u
	GmpaIEGNE2XypBl20DTRWlKm/S3qXxggLq35D5LgXwH1UeMWJGttWTy+kTbYfDahNvOLt+
	N7NA50EogO6Y3XvRpheiV0/qCt6UQW5JnX7p0TquNKo5rGR6MwF9JNJ6zUeXBYQRG4/tz0
	gFHBTcm6SDZEWb7uFiEJuE8e3bRSHwXai9mc2SjbRuR/qJTIyFVxnhzhdfhe8A==
Date: Fri, 20 Mar 2026 17:56:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable sdcard
Content-Language: en-US
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-1-89c9b5ecb26e@ixit.cz>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Casey Connolly <kcxt@postmarketos.org>
In-Reply-To: <20260320-axolotl-misc-p1-v1-1-89c9b5ecb26e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98961-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.962];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kcxt@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ixit.cz:email,postmarketos.org:dkim,postmarketos.org:mid,linaro.org:email]
X-Rspamd-Queue-Id: 60D272DE39E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David,

On 20/03/2026 17:29, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> The SHIFT6mq features an sdcard slot, add it.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 43 +++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 51b041f91d3e2..1f21da310b762 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -600,6 +600,23 @@ &qupv3_id_1 {
>  	status = "okay";
>  };
>  
> +&sdhc_2 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
> +
> +	vmmc-supply = <&vreg_l21a_2p95>;
> +	vqmmc-supply = <&vreg_l13a_2p95>;
> +
> +	bus-width = <4>;
> +	/* card detection is broken, but because the battery must be removed
> +	 * to insert the card, we use this rather than the broken-cd property
> +	 * which would just waste CPU cycles polling.
> +	 */
> +	non-removable;
> +};
> +
>  &slpi_pas {
>  	firmware-name = "qcom/sdm845/SHIFT/axolotl/slpi.mbn";
>  
> @@ -609,6 +626,32 @@ &slpi_pas {
>  &tlmm {
>  	gpio-reserved-ranges = <0 4>, <81 4>;
>  
> +	sdc2_default_state: sdc2-default-state {
> +		clk-pins {
> +			pins = "sdc2_clk";
> +			bias-disable;
> +			drive-strength = <16>;
> +		};
> +
> +		cmd-pins {
> +			pins = "sdc2_cmd";
> +			bias-pull-up;
> +			drive-strength = <10>;
> +		};
> +
> +		data-pins {
> +			pins = "sdc2_data";
> +			bias-pull-up;
> +			drive-strength = <10>;
> +		};
> +	};
> +
> +	sdc2_card_det_n: sd-card-det-n-state {
> +		pins = "gpio126";
> +		function = "gpio";
> +		bias-pull-up;

This can probably be bias-disable I guess, not that it likely matters in
practise.

> +	};
> +
>  	sde_dsi_active: sde-dsi-active-state {
>  		pins = "gpio6", "gpio11";
>  		function = "gpio";
> 

-- 
// Casey (she/her)


