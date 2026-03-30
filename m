Return-Path: <linux-arm-msm+bounces-100819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CC/GGwmQymlV+AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 17:00:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CB435D579
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 17:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C407230AD494
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 14:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E612FFDE3;
	Mon, 30 Mar 2026 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mce1AT0Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEC62EACF2;
	Mon, 30 Mar 2026 14:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881211; cv=none; b=Y/yTS2PQqTLiPvAeSWW2bUmQ0JILdwPsh9mE/ucrCfo8Dt6NiQj8jtEiPUNb56kS9NcOI1kAG/zbmrT0b+mHx0hZJIc3PuEle0BXr+Uy3fgzcOufOmU0FMJ6XcuqHdcoxWfcmUqhKLoqeeoTolGWMA3ayL7p73GGndSgOQ5onV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881211; c=relaxed/simple;
	bh=VNuSexgnG7KPB4i5OsVfyHCENyzgXgGesZiYynDQSRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cc+kSeeDDdi2ETLDpn7loOws+KRSbCMi9sxWyslCgkSV8e3djdSe8Dv9kQwV+lurTbD068keVK4r3PsMcbORemZcKMcOCqBOKMWdyWFJNqOd1T3PCEXOrhCuOdRTgiqs63wajTJeeE9SyxZ30yrfXzoDDrSD+AYCjN4VuwUxLrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mce1AT0Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945BAC4CEF7;
	Mon, 30 Mar 2026 14:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774881210;
	bh=VNuSexgnG7KPB4i5OsVfyHCENyzgXgGesZiYynDQSRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mce1AT0QJcoE9xOJNSchvLpMEt5fgK4gGFkQLQ3ZyKV63rq3lcwzi6qsMB3vSfEK6
	 ZETXSLaGlav3g6CkbeEnkCI/fK/PO30gfnwP4uYqnOoZ27Q6G2S0Nh9ZLxkDnHkNCR
	 9APODYOU3n6raG11EvFGrhik0Auwtt1sOULQDG9H2gtA1pvu+P+5FZqdpF2ygp9PHv
	 3OXSkcn/e2eYYF85xhXUmtHpMjEsEOwXyKrKLPeWD+UK35gesFQ77YJTlGndAHoPvZ
	 VnSKSrk3zdVahSc9xtFBD9mSQqZ3/RjQcN9QkPK0bInbHKIaWIIJ5VUXo9Ja/vUGbU
	 jgbSuZkFtpUGw==
Date: Mon, 30 Mar 2026 09:33:26 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: webgeek1234@gmail.com
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Georgi Djakov <djakov@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8550: add cpu OPP table with
 DDR, LLCC & L3 bandwidths
Message-ID: <acqJWzQHi7ajuzml@baldur>
References: <20260219-sm8550-ddr-bw-scaling-v3-0-75c19152e921@gmail.com>
 <20260219-sm8550-ddr-bw-scaling-v3-2-75c19152e921@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219-sm8550-ddr-bw-scaling-v3-2-75c19152e921@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100819-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B5CB435D579
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Feb 19, 2026 at 10:07:40PM -0600, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Add the OPP tables for each CPU clusters (cpu0-1-2, cpu3-4-5-6 & cpu7)
> to permit scaling the Last Level Cache Controller (LLCC), DDR and L3 cache
> frequency by aggregating bandwidth requests of all CPU core with referenc
> to the current OPP they are configured in by the LMH/EPSS hardware.
> 
> The effect is a proper caches & DDR frequency scaling when CPU cores
> changes frequency.
> 
> The OPP tables were built using the downstream memlat ddr, llcc & l3
> tables for each cluster types with the actual EPSS cpufreq LUT tables
> from running a QCS8550 device.
> 
> Also add the OSC L3 Cache controller node.
> 
> Also add the interconnect entry for each cpu, with 3 different paths:
> - CPU to Last Level Cache Controller (LLCC)
> - Last Level Cache Controller (LLCC) to DDR
> - L3 Cache from CPU to DDR interface
> 

"8 out of 11 hunks FAILED", it seems things moved since you wrote this.
Can you please help me by rebasing this onto linux-next and resubmitting
it?

Regards,
Bjorn

> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 367 +++++++++++++++++++++++++++++++++++
>  1 file changed, 367 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..de4d43f7b8d2416997db70c98b0fc36d25f3c2a6 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -17,6 +17,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
> +#include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
> @@ -78,6 +79,13 @@ cpu0: cpu@0 {
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			capacity-dmips-mhz = <1024>;
>  			dynamic-power-coefficient = <100>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&epss_l3 MASTER_EPSS_L3_APPS
> +					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
>  			#cooling-cells = <2>;
>  			l2_0: l2-cache {
>  				compatible = "cache";
> @@ -104,6 +112,13 @@ cpu1: cpu@100 {
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			capacity-dmips-mhz = <1024>;
>  			dynamic-power-coefficient = <100>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&epss_l3 MASTER_EPSS_L3_APPS
> +					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
>  			#cooling-cells = <2>;
>  			l2_100: l2-cache {
>  				compatible = "cache";
> @@ -125,6 +140,13 @@ cpu2: cpu@200 {
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			capacity-dmips-mhz = <1024>;
>  			dynamic-power-coefficient = <100>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&epss_l3 MASTER_EPSS_L3_APPS
> +					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
>  			#cooling-cells = <2>;
>  			l2_200: l2-cache {
>  				compatible = "cache";
> @@ -146,6 +168,13 @@ cpu3: cpu@300 {
>  			qcom,freq-domain = <&cpufreq_hw 1>;
>  			capacity-dmips-mhz = <1792>;
>  			dynamic-power-coefficient = <270>;
> +			operating-points-v2 = <&cpu3_opp_table>;
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&epss_l3 MASTER_EPSS_L3_APPS
> +					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
>  			#cooling-cells = <2>;
>  			l2_300: l2-cache {
>  				compatible = "cache";
> @@ -167,6 +196,13 @@ cpu4: cpu@400 {
>  			qcom,freq-domain = <&cpufreq_hw 1>;
>  			capacity-dmips-mhz = <1792>;
>  			dynamic-power-coefficient = <270>;
> +			operating-points-v2 = <&cpu3_opp_table>;
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&epss_l3 MASTER_EPSS_L3_APPS
> +					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
>  			#cooling-cells = <2>;
>  			l2_400: l2-cache {
>  				compatible = "cache";
> @@ -188,6 +224,13 @@ cpu5: cpu@500 {
>  			qcom,freq-domain = <&cpufreq_hw 1>;
>  			capacity-dmips-mhz = <1792>;
>  			dynamic-power-coefficient = <270>;
> +			operating-points-v2 = <&cpu3_opp_table>;
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&epss_l3 MASTER_EPSS_L3_APPS
> +					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
>  			#cooling-cells = <2>;
>  			l2_500: l2-cache {
>  				compatible = "cache";
> @@ -209,6 +252,13 @@ cpu6: cpu@600 {
>  			qcom,freq-domain = <&cpufreq_hw 1>;
>  			capacity-dmips-mhz = <1792>;
>  			dynamic-power-coefficient = <270>;
> +			operating-points-v2 = <&cpu3_opp_table>;
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&epss_l3 MASTER_EPSS_L3_APPS
> +					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
>  			#cooling-cells = <2>;
>  			l2_600: l2-cache {
>  				compatible = "cache";
> @@ -230,6 +280,13 @@ cpu7: cpu@700 {
>  			qcom,freq-domain = <&cpufreq_hw 2>;
>  			capacity-dmips-mhz = <1894>;
>  			dynamic-power-coefficient = <588>;
> +			operating-points-v2 = <&cpu7_opp_table>;
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&epss_l3 MASTER_EPSS_L3_APPS
> +					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
>  			#cooling-cells = <2>;
>  			l2_700: l2-cache {
>  				compatible = "cache";
> @@ -397,6 +454,306 @@ memory@a0000000 {
>  		reg = <0 0xa0000000 0 0>;
>  	};
>  
> +	cpu0_opp_table: opp-table-cpu0 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-307200000 {
> +			opp-hz = /bits/ 64 <307200000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
> +		};
> +
> +		opp-441600000 {
> +			opp-hz = /bits/ 64 <441600000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (384000 * 32)>;
> +		};
> +
> +		opp-556800000 {
> +			opp-hz = /bits/ 64 <556800000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (499200 * 32)>;
> +		};
> +
> +		opp-672000000 {
> +			opp-hz = /bits/ 64 <672000000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (499200 * 32)>;
> +		};
> +
> +		opp-787200000 {
> +			opp-hz = /bits/ 64 <787200000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (729600 * 32)>;
> +		};
> +
> +		opp-902400000 {
> +			opp-hz = /bits/ 64 <902400000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (844800 * 32)>;
> +		};
> +
> +		opp-1017600000 {
> +			opp-hz = /bits/ 64 <1017600000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (940800 * 32)>;
> +		};
> +
> +		opp-1113600000 {
> +			opp-hz = /bits/ 64 <1113600000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (1056000 * 32)>;
> +		};
> +
> +		opp-1228800000 {
> +			opp-hz = /bits/ 64 <1228800000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (1152000 * 32)>;
> +		};
> +
> +		opp-1344000000 {
> +			opp-hz = /bits/ 64 <1344000000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (1267200 * 32)>;
> +		};
> +
> +		opp-1459200000 {
> +			opp-hz = /bits/ 64 <1459200000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (1267200 * 32)>;
> +		};
> +
> +		opp-1555200000 {
> +			opp-hz = /bits/ 64 <1555200000>;
> +			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1478400 * 32)>;
> +		};
> +
> +		opp-1670400000 {
> +			opp-hz = /bits/ 64 <1670400000>;
> +			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1478400 * 32)>;
> +		};
> +
> +		opp-1785600000 {
> +			opp-hz = /bits/ 64 <1785600000>;
> +			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1478400 * 32)>;
> +		};
> +
> +		opp-1900800000 {
> +			opp-hz = /bits/ 64 <1900800000>;
> +			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1689600 * 32)>;
> +		};
> +
> +		opp-2016000000 {
> +			opp-hz = /bits/ 64 <2016000000>;
> +			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1804800 * 32)>;
> +		};
> +	};
> +
> +	cpu3_opp_table: opp-table-cpu3 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-499200000 {
> +			opp-hz = /bits/ 64 <499200000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
> +		};
> +
> +		opp-614400000 {
> +			opp-hz = /bits/ 64 <614400000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (499200 * 32)>;
> +		};
> +
> +		opp-729600000 {
> +			opp-hz = /bits/ 64 <729600000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (499200 * 32)>;
> +		};
> +
> +		opp-844800000 {
> +			opp-hz = /bits/ 64 <844800000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (499200 * 32)>;
> +		};
> +
> +		opp-940800000 {
> +			opp-hz = /bits/ 64 <940800000>;
> +			opp-peak-kBps = <(300000 * 16) (768000 * 4) (729600 * 32)>;
> +		};
> +
> +		opp-1056000000 {
> +			opp-hz = /bits/ 64 <1056000000>;
> +			opp-peak-kBps = <(300000 * 16) (768000 * 4) (729600 * 32)>;
> +		};
> +
> +		opp-1171200000 {
> +			opp-hz = /bits/ 64 <1171200000>;
> +			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (940800 * 32)>;
> +		};
> +
> +		opp-1286400000 {
> +			opp-hz = /bits/ 64 <1286400000>;
> +			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (940800 * 32)>;
> +		};
> +
> +		opp-1401600000 {
> +			opp-hz = /bits/ 64 <1401600000>;
> +			opp-peak-kBps = <(600000 * 16) (1708000 * 4) (1056000 * 32)>;
> +		};
> +
> +		opp-1536000000 {
> +			opp-hz = /bits/ 64 <1536000000>;
> +			opp-peak-kBps = <(600000 * 16) (1708000 * 4) (1056000 * 32)>;
> +		};
> +
> +		opp-1651200000 {
> +			opp-hz = /bits/ 64 <1651200000>;
> +			opp-peak-kBps = <(600000 * 16) (1708000 * 4) (1267200 * 32)>;
> +		};
> +
> +		opp-1785600000 {
> +			opp-hz = /bits/ 64 <1785600000>;
> +			opp-peak-kBps = <(600000 * 16) (1708000 * 4) (1267200 * 32)>;
> +		};
> +
> +		opp-1920000000 {
> +			opp-hz = /bits/ 64 <1920000000>;
> +			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1267200 * 32)>;
> +		};
> +
> +		opp-2054400000 {
> +			opp-hz = /bits/ 64 <2054400000>;
> +			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1478400 * 32)>;
> +		};
> +
> +		opp-2188800000 {
> +			opp-hz = /bits/ 64 <2188800000>;
> +			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1478400 * 32)>;
> +		};
> +
> +		opp-2323200000 {
> +			opp-hz = /bits/ 64 <2323200000>;
> +			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1478400 * 32)>;
> +		};
> +
> +		opp-2457600000 {
> +			opp-hz = /bits/ 64 <2457600000>;
> +			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1478400 * 32)>;
> +		};
> +
> +		opp-2592000000 {
> +			opp-hz = /bits/ 64 <2592000000>;
> +			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1478400 * 32)>;
> +		};
> +
> +		opp-2707200000 {
> +			opp-hz = /bits/ 64 <2707200000>;
> +			opp-peak-kBps = <(933000 * 16) (2736000 * 4) (1478400 * 32)>;
> +		};
> +
> +		opp-2803200000 {
> +			opp-hz = /bits/ 64 <2803200000>;
> +			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1689600 * 32)>;
> +		};
> +	};
> +
> +	cpu7_opp_table: opp-table-cpu7 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-595200000 {
> +			opp-hz = /bits/ 64 <595200000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
> +		};
> +
> +		opp-729600000 {
> +			opp-hz = /bits/ 64 <729600000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (499200 * 32)>;
> +		};
> +
> +		opp-864000000 {
> +			opp-hz = /bits/ 64 <864000000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (499200 * 32)>;
> +		};
> +
> +		opp-998400000 {
> +			opp-hz = /bits/ 64 <998400000>;
> +			opp-peak-kBps = <(300000 * 16) (768000 * 4) (729600 * 32)>;
> +		};
> +
> +		opp-1132800000 {
> +			opp-hz = /bits/ 64 <1132800000>;
> +			opp-peak-kBps = <(300000 * 16) (768000 * 4) (729600 * 32)>;
> +		};
> +
> +		opp-1248000000 {
> +			opp-hz = /bits/ 64 <1248000000>;
> +			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (940800 * 32)>;
> +		};
> +
> +		opp-1363200000 {
> +			opp-hz = /bits/ 64 <1363200000>;
> +			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (940800 * 32)>;
> +		};
> +
> +		opp-1478400000 {
> +			opp-hz = /bits/ 64 <1478400000>;
> +			opp-peak-kBps = <(600000 * 16) (1708000 * 4) (1056000 * 32)>;
> +		};
> +
> +		opp-1593600000 {
> +			opp-hz = /bits/ 64 <1593600000>;
> +			opp-peak-kBps = <(600000 * 16) (1708000 * 4) (1056000 * 32)>;
> +		};
> +
> +		opp-1708800000 {
> +			opp-hz = /bits/ 64 <1708800000>;
> +			opp-peak-kBps = <(600000 * 16) (1708000 * 4) (1267200 * 32)>;
> +		};
> +
> +		opp-1843200000 {
> +			opp-hz = /bits/ 64 <1843200000>;
> +			opp-peak-kBps = <(600000 * 16) (1708000 * 4) (1267200 * 32)>;
> +		};
> +
> +		opp-1977600000 {
> +			opp-hz = /bits/ 64 <1977600000>;
> +			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1267200 * 32)>;
> +		};
> +
> +		opp-2092800000 {
> +			opp-hz = /bits/ 64 <2092800000>;
> +			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1478400 * 32)>;
> +		};
> +
> +		opp-2227200000 {
> +			opp-hz = /bits/ 64 <2227200000>;
> +			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1478400 * 32)>;
> +		};
> +
> +		opp-2342400000 {
> +			opp-hz = /bits/ 64 <2342400000>;
> +			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1478400 * 32)>;
> +		};
> +
> +		opp-2476800000 {
> +			opp-hz = /bits/ 64 <2476800000>;
> +			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1478400 * 32)>;
> +		};
> +
> +		opp-2592000000 {
> +			opp-hz = /bits/ 64 <2592000000>;
> +			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1478400 * 32)>;
> +		};
> +
> +		opp-2726400000 {
> +			opp-hz = /bits/ 64 <2726400000>;
> +			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1478400 * 32)>;
> +		};
> +
> +		opp-2841600000 {
> +			opp-hz = /bits/ 64 <2841600000>;
> +			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1689600 * 32)>;
> +		};
> +
> +		opp-2956800000 {
> +			opp-hz = /bits/ 64 <2956800000>;
> +			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1689600 * 32)>;
> +		};
> +
> +		opp-3187200000 {
> +			opp-hz = /bits/ 64 <3187200000>;
> +			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1689600 * 32)>;
> +		};
> +	};
> +
>  	pmu-a510 {
>  		compatible = "arm,cortex-a510-pmu";
>  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster0>;
> @@ -5437,6 +5794,16 @@ rpmhpd_opp_turbo_l1: opp-416 {
>  			};
>  		};
>  
> +		epss_l3: interconnect@17d90000 {
> +			compatible = "qcom,sm8550-epss-l3", "qcom,epss-l3";
> +			reg = <0 0x17d90000 0 0x1000>;
> +
> +			clocks = <&bi_tcxo_div2>, <&gcc GCC_GPLL0>;
> +			clock-names = "xo", "alternate";
> +
> +			#interconnect-cells = <1>;
> +		};
> +
>  		cpufreq_hw: cpufreq@17d91000 {
>  			compatible = "qcom,sm8550-cpufreq-epss", "qcom,cpufreq-epss";
>  			reg = <0 0x17d91000 0 0x1000>,
> 
> -- 
> 2.52.0
> 
> 

