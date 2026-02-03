Return-Path: <linux-arm-msm+bounces-91580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBCKEhaNgWl/HAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 06:52:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99488D4D1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 06:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18CE3302AD1D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 05:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA91226CEB;
	Tue,  3 Feb 2026 05:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mh4RC17n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56585202F65;
	Tue,  3 Feb 2026 05:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770097875; cv=none; b=RKUDHcgWiS2u6CSjkgoVhU4Zxo0sq/R6SIGbdSr74+U36GJwMMO7NFtejfg8Vlb33V3lwsLIgJctDr6C56IEF+mr+dxpoSyW1SlIxqNIRPay8FsxQEEglOoV4gJNIY/nWL5kPBBtzHr6UZLBXTlko03SICxPOQtg3CvORAHZ4ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770097875; c=relaxed/simple;
	bh=c1Zq2pM2oC8tiduFgNTRj0BXJOWXMDGZo3XZkDg+/Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJHL1xVLP9icKpY/jqJjrIA4xCM2H471EmgKjRY8AxYjws6h1fE3SrNqzXri83vM/6xdKJ2rDEvd7ZObD19u/0q28ogWwvoCHvfuevmVhMD7o11WUeMQjRAhtxGPAcCWS79SMoPQ8mcZaJwAoihn11cB0rg1Oeh+tTRtFRLyagw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mh4RC17n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA42C116D0;
	Tue,  3 Feb 2026 05:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770097875;
	bh=c1Zq2pM2oC8tiduFgNTRj0BXJOWXMDGZo3XZkDg+/Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mh4RC17ntYZRk1UdDW94WLyHCP5JexZAhpaKNWG7kkc7V0OlVZOm/MpHFjPXlu9o2
	 4plUMkkHXfrBUwoyQzEZ16A83bkcb6epOlYqBjWFS41Nas9eg1ag0G5n2QDpd4jOW8
	 8MHplXz0fEcRBKjymyxG64J+TR5cyAQA6xet5Aqxl/6BwriuHXwuPxmUhaEoPyUUw1
	 YctIbGxgss/GPLkUT+JIrFkn7tCcKrGw6hwnpeZwEPg00zVLHTLxj39kp2tLtVzdgB
	 hXyNfCU/8WqQPcihJjqxK4QHbNo/s70sipVrBsAg9ASqGPiOxLQjOFMM2/CIFKNyOn
	 fkHV07t5yE5PA==
Date: Tue, 3 Feb 2026 11:21:08 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [[PATCH]] arm64: dts: qcom: hamoa: Enable cpufreq cooling devices
Message-ID: <iq2cirb4axawir4a7yjm5okf32ptzwdrvovji7tp2hdzmui7qg@pidosokrykgi>
References: <20260128053208.3240189-1-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128053208.3240189-1-gaurav.kohli@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91580-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.100:email,0.0.78.132:email,0.0.39.116:email,0.0.39.216:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,0.0.0.0:email,0.0.78.232:email,0.0.0.200:email,0.0.39.16:email,0.0.79.76:email,0.0.40.60:email,0.0.1.44:email,0.0.78.32:email]
X-Rspamd-Queue-Id: 99488D4D1C
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 11:02:08AM +0530, Gaurav Kohli wrote:
> Add cooling-cells property to the CPU nodes to support cpufreq
> cooling devices.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

FYI: I submitted the similar version back in October:
https://lore.kernel.org/linux-arm-msm/20251015065703.9422-1-mani@kernel.org/

- Mani

> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index db65c392e618..799e405a9f87 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -75,6 +75,7 @@ cpu0: cpu@0 {
>  			next-level-cache = <&l2_0>;
>  			power-domains = <&cpu_pd0>, <&scmi_dvfs 0>;
>  			power-domain-names = "psci", "perf";
> +			#cooling-cells = <2>;
>  
>  			l2_0: l2-cache {
>  				compatible = "cache";
> @@ -91,6 +92,7 @@ cpu1: cpu@100 {
>  			next-level-cache = <&l2_0>;
>  			power-domains = <&cpu_pd1>, <&scmi_dvfs 0>;
>  			power-domain-names = "psci", "perf";
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu2: cpu@200 {
> @@ -101,6 +103,7 @@ cpu2: cpu@200 {
>  			next-level-cache = <&l2_0>;
>  			power-domains = <&cpu_pd2>, <&scmi_dvfs 0>;
>  			power-domain-names = "psci", "perf";
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu3: cpu@300 {
> @@ -111,6 +114,7 @@ cpu3: cpu@300 {
>  			next-level-cache = <&l2_0>;
>  			power-domains = <&cpu_pd3>, <&scmi_dvfs 0>;
>  			power-domain-names = "psci", "perf";
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu4: cpu@10000 {
> @@ -121,6 +125,7 @@ cpu4: cpu@10000 {
>  			next-level-cache = <&l2_1>;
>  			power-domains = <&cpu_pd4>, <&scmi_dvfs 1>;
>  			power-domain-names = "psci", "perf";
> +			#cooling-cells = <2>;
>  
>  			l2_1: l2-cache {
>  				compatible = "cache";
> @@ -137,6 +142,7 @@ cpu5: cpu@10100 {
>  			next-level-cache = <&l2_1>;
>  			power-domains = <&cpu_pd5>, <&scmi_dvfs 1>;
>  			power-domain-names = "psci", "perf";
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu6: cpu@10200 {
> @@ -147,6 +153,7 @@ cpu6: cpu@10200 {
>  			next-level-cache = <&l2_1>;
>  			power-domains = <&cpu_pd6>, <&scmi_dvfs 1>;
>  			power-domain-names = "psci", "perf";
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu7: cpu@10300 {
> @@ -157,6 +164,7 @@ cpu7: cpu@10300 {
>  			next-level-cache = <&l2_1>;
>  			power-domains = <&cpu_pd7>, <&scmi_dvfs 1>;
>  			power-domain-names = "psci", "perf";
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu8: cpu@20000 {
> @@ -167,6 +175,7 @@ cpu8: cpu@20000 {
>  			next-level-cache = <&l2_2>;
>  			power-domains = <&cpu_pd8>, <&scmi_dvfs 2>;
>  			power-domain-names = "psci", "perf";
> +			#cooling-cells = <2>;
>  
>  			l2_2: l2-cache {
>  				compatible = "cache";
> @@ -183,6 +192,7 @@ cpu9: cpu@20100 {
>  			next-level-cache = <&l2_2>;
>  			power-domains = <&cpu_pd9>, <&scmi_dvfs 2>;
>  			power-domain-names = "psci", "perf";
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu10: cpu@20200 {
> @@ -193,6 +203,7 @@ cpu10: cpu@20200 {
>  			next-level-cache = <&l2_2>;
>  			power-domains = <&cpu_pd10>, <&scmi_dvfs 2>;
>  			power-domain-names = "psci", "perf";
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu11: cpu@20300 {
> @@ -203,6 +214,7 @@ cpu11: cpu@20300 {
>  			next-level-cache = <&l2_2>;
>  			power-domains = <&cpu_pd11>, <&scmi_dvfs 2>;
>  			power-domain-names = "psci", "perf";
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu-map {
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

