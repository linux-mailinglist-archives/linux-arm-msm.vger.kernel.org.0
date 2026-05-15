Return-Path: <linux-arm-msm+bounces-107732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHoIENHWBmpjoQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:18:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A5054B2B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8891C300D934
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 08:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B866B3F0AA9;
	Fri, 15 May 2026 08:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="AdqcwyXc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from poodle.tulip.relay.mailchannels.net (poodle.tulip.relay.mailchannels.net [23.83.218.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8969A33B974;
	Fri, 15 May 2026 08:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.249
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833012; cv=pass; b=Rupq0pmwemgwttQ2Zhs7/v2yP8eJEsjmHr3r8CBdJ9EXD670iPBKSYexQcV8XVo19R9ZNc5q6j1SJHOX0AgIPoklitvL+U4SfcgF6we5P7h5W5AR2n8MZhcgn3H+VpBL/n+OFPZ/3bv8FgcoxvJTXBQBLm/GbQ5wy1PtBCEGN4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833012; c=relaxed/simple;
	bh=s3Oa6l/kg5PwTBfxeHEjS6p/XHZ6lB7O3YVXb8TrZ8I=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=sKRsGWkaaPSXrHoJBsv4iFiTv7vgeeVH1e04jpAx2VWokRkTzcVQcOAXUd1VTJU19DO6w35vDLMFMyzSEmW2h6Bw2pbiq33XxvtaAyXvZWr7Zgpt6kRMboaLGGhh/IJUGlEYnmuAcZbJiW8yQnzyOUITaMGu1k4WqY4Zr3DSjpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=AdqcwyXc; arc=pass smtp.client-ip=23.83.218.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1B04F7E275E;
	Fri, 15 May 2026 08:16:44 +0000 (UTC)
Received: from de-fra-smtpout2.hostinger.io (trex-green-3.trex.outbound.svc.cluster.local [100.98.35.125])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id D6D877E296C;
	Fri, 15 May 2026 08:16:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1778833003;
	b=oU2WK+niLu7SwhJHuOTol0LIKKm5mP6lrh/jBCM5OUVuOoZ5D71KnNPCvwJ0FjTlqtrPGd
	zJDWwGzEFNz0y1uvrVnQl7gPwkx7N9oawRoVM75STGkXKDAFtPWUtodQ26qTp1EZvfDZyH
	PjQDgmEmuguFBgyZQjx0GcHjmqbqyH1ZzYKjpPhidqsRkWj6VTla3CkYnqgv9UN1HIrsAT
	LXKqBsXI+wOlLPwjN4rCQBa6lnsGRh/BqBSjisiksAKfbKY2As0efdzmJfihjeY0sdXWAy
	/yGXEFhrQBtRDRxw3+So2HQmx0D0gdsU64BJJ2OYEhDoOn+zG8uqhS7mcyioFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1778833003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=7dvcpn18DPusjPkAUQswhKnt+4l2abZaC5CJ6zw1jgA=;
	b=bosmnF3H5ZaN+xj9Jv1AfWloYBI1HSjCMecLF/aPLyF2KN6ZNdvPmsVk8igRRyIB86iJE0
	/zyTRsSVwBqtyyjz7hMh9QQVu+w+dkQCw7KStJbczo6SwfGM3gByy4+CMFlBht6VZ4tlJZ
	zlIPE1TKbrMgkLoVWDaYd1KBJxF0+9i/m1pgFEtAmRPv+S2O31mv+2iAImdQBq+20ECAlX
	3hFcj/jwuGXl66BS0GxuiCwlv3m/6m1T+9lPAUN+Suq0Rq4oLoyJMVHLjINVmkeNkA7Vzp
	GdhSSTIqtNawDk4Yfv6palnEY37j/u+giptZ4MgfLs2X4S4pc53yh37Bklf7xQ==
ARC-Authentication-Results: i=1;
	rspamd-5c5444c55f-csk57;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Abortive-Abiding: 0565c9ea20b621cc_1778833003955_1423954591
X-MC-Loop-Signature: 1778833003954:852900398
X-MC-Ingress-Time: 1778833003954
Received: from de-fra-smtpout2.hostinger.io (de-fra-smtpout2.hostinger.io
 [148.222.55.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.35.125 (trex/7.1.5);
	Fri, 15 May 2026 08:16:43 +0000
Received: from [IPV6:2001:448a:c020:6af:44f8:2dfa:b1ba:e2f2] (unknown [IPv6:2001:448a:c020:6af:44f8:2dfa:b1ba:e2f2])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4gH0Qs6Vqsz3wdn;
	Fri, 15 May 2026 08:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1778833000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7dvcpn18DPusjPkAUQswhKnt+4l2abZaC5CJ6zw1jgA=;
	b=AdqcwyXchv7y7A/uY+ckOuVuCCCz41qgWEvhs0zDvRoU+/Gha7cYWIWISInhw9nvEakxGC
	5jyK54rYg5LT1iFNLTLUYyB3BNJRNIeTy1DMhpdAJHlSpPfGiPKiDJxc/yZ53vucA9ujxz
	iIWL01CXp0opsBTBZjWu7Fw5wsjP7g782CxEjXK2TpXbzPzqkYtKIKS2F9gloXV7z1lhkP
	JBOtecXykQDIrS8Eax1JN6PtwMHjuampZCkLLexhRhJ0nHHDqrQpRMJMaHwPRaDkblv83n
	esfqqGvRkb7DgpyTzrvPh6F15MebJQdB2i8OyxbUgSXsw2ObL7xpVm9R9T0IzQ==
Message-ID: <07422376-528e-4824-98e0-35d79dbd4017@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ARM: dts: qcom: msm8960: Add CPU frequency scaling
 support
To: Rudraksha Gupta <guptarud@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260514-expressatt_cpufreq-v1-0-487fd2d78859@gmail.com>
 <20260514-expressatt_cpufreq-v1-3-487fd2d78859@gmail.com>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <20260514-expressatt_cpufreq-v1-3-487fd2d78859@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Fri, 15 May 2026 08:16:37 +0000 (UTC)
X-CM-Envelope: MS4xfPiA3AbYYNoKR4lOx2fMWaWH/cJhqDlaPDew6MFqkWDZmI4qE22W4AkpWGAtXGRHPUi4t6n6AyGY+c4IbOhGvSVYt6Jup22KQV/3f13Fpbi0Tslpcopv 5oP6cUe9WcoCknLizrkkqFja8CeovDTXuB76lJbACD1JhOf/O/q9WCg5kbhm3Z0dWeUWP7tg/MvtzJ8rTZIKPGZU8RRvnYXCzl3iKEW8NXYpYblOcaUX8IdC c6sJeHUUXZWe03PdIhBXakkvxHxXrDETOpCTU/GqYQvrlrYJrYOlmvpGTDWaNUXrAvOwMMdBqZfdnE9Zlkv9hwqV0FsMOfunvYt5n90vw+wKygtzsoyMDs63 ICEsoQqHUSw2kINFxSJ9pQ/oZUUM/lgag17BEYj3KGUToA9XfZL6Z7iKj53Cax3s9oqNQNPPhefJga79pUXNgHh+E0d3UZH1wFVP+MCueFX8a8IBESbDXWB/ dH/YrcknIIGcu+mnJ1j2Nlu4hpNF6HleSDKYnLzkZTNU6PLCx80lA277nc+3hz7EXlYA98wB/BO9tEi12mHJx3uLEG9iKdWYCXczZybnjTQ15GnW18DgtCO9 0UM=
X-CM-Analysis: v=2.4 cv=ALriHGRn c=1 sm=1 tr=0 ts=6a06d668 a=gaaSNMXc1qFnL05oSjs71Q==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=oA5LrNwOAAAA:20 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=2tpBmOoPBWwOf3z1pQYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=QJY96suAAestDpCc5Gi9:22 a=6d_NeF2Wq4kEx_vldW19:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-AuthUser: linux@smankusors.com
X-Rspamd-Queue-Id: E7A5054B2B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[smankusors.com:+];
	TAGGED_FROM(0.00)[bounces-107732-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/14/2026 2:04 PM, Rudraksha Gupta wrote:
> Enable Krait DVFS on MSM8960 by adding the required device tree nodes:
>
> - OPP table with 12 operating points from 384 MHz to 1.512 GHz, with
>    per-PVS voltages for slow, nominal, and fast silicon bins.
> - Krait clock controller (krait-cc-v1) driving the CPU muxes from
>    PLL9/PLL10, ACC aux outputs, and PXO.
> - PVS efuse nvmem cell in qfprom for the cpufreq-nvmem driver to
>    read the speed-bin and process voltage class.
> - CPU idle state for Standalone Power Collapse (SPC).
> - operating-points-v2, clocks, cpu-supply, and cpu-idle-states wired
>    into both CPU nodes.
>
> Link: https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/acpuclock-8960.c#L120-L235
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>   arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 133 ++++++++++++++++++++++++++++++-
>   1 file changed, 131 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> index a427f0f41cd1..b5b9239c7aa0 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> @@ -54,6 +54,10 @@ cpu@0 {
>   			reg = <0>;
>   			enable-method = "qcom,kpss-acc-v1";
>   			device_type = "cpu";
> +			operating-points-v2 = <&cpu_opp_table>;
> +			clocks = <&kraitcc 0>;
> +			cpu-supply = <&saw0_vreg>;
> +			cpu-idle-states = <&cpu_spc>;
>   			next-level-cache = <&l2>;
>   			qcom,acc = <&acc0>;
>   			qcom,saw = <&saw0>;
> @@ -64,6 +68,10 @@ cpu@1 {
>   			reg = <1>;
>   			enable-method = "qcom,kpss-acc-v1";
>   			device_type = "cpu";
> +			operating-points-v2 = <&cpu_opp_table>;
> +			clocks = <&kraitcc 1>;
> +			cpu-supply = <&saw1_vreg>;
> +			cpu-idle-states = <&cpu_spc>;
>   			next-level-cache = <&l2>;
>   			qcom,acc = <&acc1>;
>   			qcom,saw = <&saw1>;
> @@ -74,6 +82,116 @@ l2: l2-cache {
>   			cache-level = <2>;
>   			cache-unified;
>   		};
> +
> +		idle-states {
> +			cpu_spc: cpu-spc {
> +				compatible = "qcom,idle-state-spc", "arm,idle-state";
> +				entry-latency-us = <400>;
> +				exit-latency-us = <900>;
> +				min-residency-us = <3000>;
> +			};
> +		};
> +	};
> +
> +	cpu_opp_table: opp-table-cpu {
> +		compatible = "operating-points-v2-krait-cpu";
> +		nvmem-cells = <&pvs_efuse>;
> +
> +		opp-384000000 {
> +			opp-hz = /bits/ 64 <384000000>;
> +			opp-microvolt-speed0-pvs0-v0 = <950000>;
> +			opp-microvolt-speed0-pvs1-v0 = <900000>;
> +			opp-microvolt-speed0-pvs3-v0 = <850000>;

The Sashiko bot comment about the binding schema is valid, I encountered 
the following warnings:

/mnt/linux/.output/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dtb: 
/ (sony,huashan): opp-table-cpu:opp-384000000: 
'opp-microvolt-speed0-pvs0-v0', 'opp-microvolt-speed0-pvs1-v0', 
'opp-microvolt-speed0-pvs3-v0' do not match any of the regexes: 
'^opp-microvolt-speed[0-9]+-pvs[0-9]+$', '^pinctrl-[0-9]+$'
         from schema $id: 
http://devicetree.org/schemas/cpufreq/qcom-cpufreq-nvmem.yaml

> +			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
> +		};
> +
> +		opp-486000000 {
> +			opp-hz = /bits/ 64 <486000000>;
> +			opp-microvolt-speed0-pvs0-v0 = <975000>;
> +			opp-microvolt-speed0-pvs1-v0 = <925000>;
> +			opp-microvolt-speed0-pvs3-v0 = <875000>;
> +			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
> +		};
> +
> +		opp-594000000 {
> +			opp-hz = /bits/ 64 <594000000>;
> +			opp-microvolt-speed0-pvs0-v0 = <1000000>;
> +			opp-microvolt-speed0-pvs1-v0 = <950000>;
> +			opp-microvolt-speed0-pvs3-v0 = <900000>;
> +			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
> +		};
> +
> +		opp-702000000 {
> +			opp-hz = /bits/ 64 <702000000>;
> +			opp-microvolt-speed0-pvs0-v0 = <1025000>;
> +			opp-microvolt-speed0-pvs1-v0 = <975000>;
> +			opp-microvolt-speed0-pvs3-v0 = <925000>;
> +			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
> +		};
> +
> +		opp-810000000 {
> +			opp-hz = /bits/ 64 <810000000>;
> +			opp-microvolt-speed0-pvs0-v0 = <1075000>;
> +			opp-microvolt-speed0-pvs1-v0 = <1025000>;
> +			opp-microvolt-speed0-pvs3-v0 = <975000>;
> +			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
> +		};
> +
> +		opp-918000000 {
> +			opp-hz = /bits/ 64 <918000000>;
> +			opp-microvolt-speed0-pvs0-v0 = <1100000>;
> +			opp-microvolt-speed0-pvs1-v0 = <1050000>;
> +			opp-microvolt-speed0-pvs3-v0 = <1000000>;
> +			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
> +		};
> +
> +		opp-1026000000 {
> +			opp-hz = /bits/ 64 <1026000000>;
> +			opp-microvolt-speed0-pvs0-v0 = <1125000>;
> +			opp-microvolt-speed0-pvs1-v0 = <1075000>;
> +			opp-microvolt-speed0-pvs3-v0 = <1025000>;
> +			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
> +		};
> +
> +		opp-1134000000 {
> +			opp-hz = /bits/ 64 <1134000000>;
> +			opp-microvolt-speed0-pvs0-v0 = <1175000>;
> +			opp-microvolt-speed0-pvs1-v0 = <1125000>;
> +			opp-microvolt-speed0-pvs3-v0 = <1075000>;
> +			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
> +		};
> +
> +		opp-1242000000 {
> +			opp-hz = /bits/ 64 <1242000000>;
> +			opp-microvolt-speed0-pvs0-v0 = <1200000>;
> +			opp-microvolt-speed0-pvs1-v0 = <1150000>;
> +			opp-microvolt-speed0-pvs3-v0 = <1100000>;
> +			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
> +		};
> +
> +		opp-1350000000 {
> +			opp-hz = /bits/ 64 <1350000000>;
> +			opp-microvolt-speed0-pvs0-v0 = <1225000>;
> +			opp-microvolt-speed0-pvs1-v0 = <1175000>;
> +			opp-microvolt-speed0-pvs3-v0 = <1125000>;
> +			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
> +		};
> +
> +		opp-1458000000 {
> +			opp-hz = /bits/ 64 <1458000000>;
> +			opp-microvolt-speed0-pvs0-v0 = <1237500>;
> +			opp-microvolt-speed0-pvs1-v0 = <1187500>;
> +			opp-microvolt-speed0-pvs3-v0 = <1137500>;
> +			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
> +		};
> +
> +		opp-1512000000 {
> +			opp-hz = /bits/ 64 <1512000000>;
> +			opp-microvolt-speed0-pvs0-v0 = <1250000>;
> +			opp-microvolt-speed0-pvs1-v0 = <1200000>;
> +			opp-microvolt-speed0-pvs3-v0 = <1150000>;
> +			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
> +		};
>   	};
>   
>   	memory@80000000 {
> @@ -81,6 +199,13 @@ memory@80000000 {
>   		reg = <0x80000000 0>;
>   	};
>   
> +	kraitcc: clock-controller {
> +		compatible = "qcom,krait-cc-v1";
> +		clocks = <&gcc PLL9>, <&gcc PLL10>, <&acc0>, <&acc1>, <&pxo_board>;
> +		clock-names = "hfpll0", "hfpll1", "acpu0_aux", "acpu1_aux", "qsb";
> +		#clock-cells = <1>;
> +	};
> +

I think the kraitcc node should be placed before the memory node so that 
it's sorted alphabetically.

>   	soc: soc {
>   		compatible = "simple-bus";
>   		ranges;
> @@ -112,6 +237,10 @@ qfprom: efuse@700000 {
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   
> +			pvs_efuse: pvs@c0 {
> +				reg = <0xc0 0x04>;
> +			};
> +
>   			tsens_calib: calib@404 {
>   				reg = <0x404 0x10>;
>   			};
> @@ -348,7 +477,7 @@ acc0: clock-controller@2088000 {
>   		};
>   
>   		saw0: power-manager@2089000 {
> -			compatible = "qcom,msm8960-saw2-cpu", "qcom,saw2";
> +			compatible = "qcom,msm8960-saw2-v1.1-cpu", "qcom,saw2";
>   			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
>   
>   			saw0_vreg: regulator {
> @@ -367,7 +496,7 @@ acc1: clock-controller@2098000 {
>   		};
>   
>   		saw1: power-manager@2099000 {
> -			compatible = "qcom,msm8960-saw2-cpu", "qcom,saw2";
> +			compatible = "qcom,msm8960-saw2-v1.1-cpu", "qcom,saw2";
>   			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
>   
>   			saw1_vreg: regulator {
>

Tested on the Sony Xperia SP (msm8960t), and it works as expected.

# echo performance | tee 
/sys/devices/system/cpu/cpufreq/policy*/scaling_governor
# echo 1512000 | tee 
/sys/devices/system/cpu/cpufreq/policy*/scaling_max_freq
# 7z b
7-Zip (z) 26.00 (armt) : Copyright (c) 1999-2026 Igor Pavlov : 2026-02-12
  32-bit arm_v:7-A thumb:2 locale=C.UTF-8 Threads:2 OPEN_MAX:1024

Compiler:  ver:15.2.0 GCC 15.2.0 : FP SIMD32 UNALIGNED
Linux : 7.0.0 : #247 SMP Thu May 14 20:32:48 UTC 2026 : armv7l
PageSize:4KB hwcap:FB8D6:NEON hwcap2:0
armt

1T CPU Freq (MHz):   717   814   815   815   817   799   816
1T CPU Freq (MHz): 100% 815   100% 816
2T CPU Freq (MHz): 196% 800   191% 777

RAM size:     974 MB,  # CPU hardware threads:   2
RAM usage:    444 MB,  # Benchmark threads:      2

                        Compressing  | Decompressing
Dict     Speed Usage    R/U Rating  |      Speed Usage    R/U Rating
          KiB/s     %   MIPS   MIPS  |      KiB/s     %   MIPS  MIPS

22:        806   174    451    784  |      24894   193   1102  2126
23:        772   173    456    787  |      24344   194   1084  2107
24:        760   176    464    817  |      23257   194   1051  2042
25:        743   179    475    849  |      22233   193   1025  1979
----------------------------------  | ------------------------------
Avr:       770   175    462    809  |      23682   194   1066  2063
Tot:             184    764   1436

# echo 384000| tee /sys/devices/system/cpu/cpufreq/policy*/scaling_max_freq
# 7z b
7-Zip (z) 26.00 (armt) : Copyright (c) 1999-2026 Igor Pavlov : 2026-02-12
  32-bit arm_v:7-A thumb:2 locale=C.UTF-8 Threads:2 OPEN_MAX:1024

Compiler:  ver:15.2.0 GCC 15.2.0 : FP SIMD32 UNALIGNED
Linux : 7.0.0 : #247 SMP Thu May 14 20:32:48 UTC 2026 : armv7l
PageSize:4KB hwcap:FB8D6:NEON hwcap2:0
armt

1T CPU Freq (MHz):   210   209   210   210   209   210   210
1T CPU Freq (MHz):  99% 209   100% 210
2T CPU Freq (MHz): 191% 202   190% 200

RAM size:     974 MB,  # CPU hardware threads:   2
RAM usage:    444 MB,  # Benchmark threads:      2

                        Compressing  | Decompressing
Dict     Speed Usage    R/U Rating  |      Speed Usage    R/U Rating
          KiB/s     %   MIPS   MIPS  |      KiB/s     %   MIPS  MIPS

22:        295   146    196    287  |       7444   188    337 636
23:        286   148    197    292  |       7302   188    337 632
24:        285   150    205    307  |       7255   191    333 637
25:        282   151    214    322  |       7105   192    330 632
----------------------------------  | ------------------------------
Avr:       287   149    203    302  |       7276   190    334 634
Tot:             169    269    468

Tested-by: Antony Kurniawan Soemardi <linux@smankusors.com>

-- 
Thanks,
Antony K. S.



