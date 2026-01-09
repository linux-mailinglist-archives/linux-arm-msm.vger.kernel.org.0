Return-Path: <linux-arm-msm+bounces-88310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9214AD0B021
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 16:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 973AB307EA21
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 15:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E504E313276;
	Fri,  9 Jan 2026 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=machinesoul.in header.i=@machinesoul.in header.b="KrnZ2hI8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AmxIbu9A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C00500946;
	Fri,  9 Jan 2026 15:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973133; cv=none; b=n5+9pXgEiDzEm0PbeHM8B5YEo+mZYfdAQpCtHopEAtde9f7uCyWJEbihCDXHDUPV1LutrcLPVKmL0iSN3ERBnzlAT3iYsGGynJJ+gBoslNpbsJ9BFCX7DhZXaozpzRrc3aBHfsCtkFy9hxTjVAqKvytgCEeaqqBuGBPqbx6Sx0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973133; c=relaxed/simple;
	bh=NDfI+DP8QC3yvGvOA16ouiD6nbbpZsmcTNbrQ/3LFpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qmrYC2x7LJnQhhaEVOh5OvCPftfTHKNKbwy8uDCkCftlwPx2CJeYbeQEwZWHEVKAalu0DpFaITpUzDsHjn111YSZ4IbPHO7ndldUntO0On2xmLby/K0CE/abIdt8SnQle0RiEaNztfBosrQ7XuJhdeNugfY3AYxakB72jFHF8Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=machinesoul.in; spf=pass smtp.mailfrom=machinesoul.in; dkim=pass (2048-bit key) header.d=machinesoul.in header.i=@machinesoul.in header.b=KrnZ2hI8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AmxIbu9A; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=machinesoul.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=machinesoul.in
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AFF9F7A00FC;
	Fri,  9 Jan 2026 10:38:50 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 09 Jan 2026 10:38:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=machinesoul.in;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1767973130; x=1768059530; bh=a9J6tkdi70hl3QBw/yljmFYOIsH7IUQ/
	hhd0MRNePak=; b=KrnZ2hI8+FewEWYlLBfRUocdi4/sthYc1dIjmODcPJ/txo67
	tYnzmE0e8+M6mXnLYT0U0eSb4emQZ9BCWSSy/5HMIYWts4zdfP8oLsfNlyv3p3Un
	vLZl2YPDgcGoSW5r2IX3g05rWemA9xqIgYkuqoTVWvHw45RkK9SJXBkGKV4lVgBY
	9YzchzrxWFLTNyZ+5cGPk5TelThzm4LmjUBC1W3zgh/gga8jcmko+2/yU5tjPZBN
	5kDcQZlnbJIfMt3hAZPCjM4AKBByefkkKvbWzard8NttIl/C2IlkpDWjpilFxvXO
	p3pC9eP32fGM76YmxEQPde3LU0XNufxqGSMDtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767973130; x=
	1768059530; bh=a9J6tkdi70hl3QBw/yljmFYOIsH7IUQ/hhd0MRNePak=; b=A
	mxIbu9As5fIrGSVhPK4Rz5DcmHLZ84Xmp8huqdFsijCqsMSDTTACnaVhvjmwwEn1
	BlCOE9lxRCr9BoLpvPs4V1EFwJ/tyXdMt55BWx/LkcOIEaREh9JJxd8OPpZcnJZ1
	IybKjRbyEzLA06T4hVWsxIVyLljNnRQxqs+tJIzjOWbRihyYgduGXbqD+Srd4JhQ
	onLuhvm7mvLVVi3d1ZscNdrsZ5Ugh+omKBszc+zcMM9Ap1ZkvEH0yICO9Z1w0zwH
	3n/l8AYl3Bj/4oIXs/F0KSRXVgLsJWfxHB4EcNFb03XLSVId0AP/MvyFB8E0iQBc
	e2RfvNgF0ZOce/bjG2EZQ==
X-ME-Sender: <xms:CSFhaZqCQ85ZMmx4PJZcpZgRWb1-_UQokg1UrcPyYSTw6uwFkGqjqA>
    <xme:CSFhaXeX0xiBKJISj5rS2A8Qyy1z1ovuFLqB3ntgUotYO7OcSNQBR3Ws9IHPLo_NK
    wqFWs7d1NPmppTYZUoJNEuNLbQXekpd8rmhj35UTydC0VsXhDz7Qik>
X-ME-Received: <xmr:CSFhacqLR5uCzkDzJef5cbCfozL_RYodnXfO8E-dfW_k66pcMRLftweSvXuxLx1rbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeludelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkjghfggfgtgesthfuredttddtjeenucfhrhhomhepuehhuhhshhgr
    nhcuufhhrghhuceosghhuhhshhgrnhdrshhhrghhsehmrggthhhinhgvshhouhhlrdhinh
    eqnecuggftrfgrthhtvghrnhepgeeftdeuheetjeevveehkeegledttdeikeejledvgfdu
    tddvteevkeehudduledvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepsghhuhhshhgrnhdrshhhrghhsehmrggthhhinhgvshhouhhlrdhinhdp
    nhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnh
    guvghrshhsohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkohhnrhgrugihsggt
    ihhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    tghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtrhhoshdqqhgtoh
    hmqdguthhsqdifrghttghhvghrshestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtohep
    sghhrghrrggufigrjhdrrhgrjhhusehmrggthhhinhgvshhouhhlrdhinhdprhgtphhtth
    hopegrlhgvgigrnhgurhgvrdhfvghrrhhivghugiesohhrrghnghgvrdgtohhmpdhrtghp
    thhtoheplhhutggrrdifvghishhssehfrghirhhphhhonhgvrdgtohhm
X-ME-Proxy: <xmx:CSFhaRkGcQPNT10Gvv_gapnTF1vHeZzN66RAXjLp4LxI8cOIYU5xCA>
    <xmx:CSFhadSBUIMiRlwZXQXq5MaMROVTyGhmqwxEQXf-h38shBJiti0rhw>
    <xmx:CSFhaXYvPya8MdYo12hvb2Iy7jmNFWO_n5BDx2Sn0hBEe3B5vBF9HQ>
    <xmx:CSFhad8I5XhDTK7FN-P0AGNbd6wcy4E0Sbe4QrQAgMz62ZYNPy5tTg>
    <xmx:CiFhac8-ef0Vse0a1Gw5g09zWbBKdmTNe5pEebzLWcu4uFry12m1DVj6>
Feedback-ID: i6b0e4831:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jan 2026 10:38:46 -0500 (EST)
From: Bhushan Shah <bhushan.shah@machinesoul.in>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 cros-qcom-dts-watchers@chromium.org,
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] arm64: dts: qcom: kodiak: Add missing clock votes for lpass_tlmm
Date: Fri, 09 Jan 2026 21:08:32 +0530
Message-ID: <6749502.DvuYhMxLoT@antlia>
In-Reply-To:
 <20260109-kodiak-lpass-tlmm-clocks-v1-1-746112687772@fairphone.com>
References:
 <20260109-kodiak-lpass-tlmm-clocks-v1-1-746112687772@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, 9 January 2026 20:44:34 IST Luca Weiss wrote:
> Without the correct clock votes set, we may be hitting a synchronous
> external abort error when touching the lpi registers.
> 
>   Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
>   <...>
>   Call trace:
>    lpi_gpio_read.isra.0+0x2c/0x58 (P)
>    pinmux_enable_setting+0x218/0x300
>    pinctrl_commit_state+0xb0/0x280
>    pinctrl_select_state+0x28/0x48
>    pinctrl_bind_pins+0x1f4/0x2a0
>    really_probe+0x64/0x3a8
> 
> Add the clocks to fix that.
> 
> Platforms with this SoC using AudioReach won't be impacted due to
> qcs6490-audioreach.dtsi already setting clocks & clock-names for
> q6prmcc. The sc7280-chrome-common.dtsi has also been adjusted to keep
> the behavior the same as they also do not use Elite with q6afecc.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Tested-by: Bhushan Shah <bhushan.shah@machinesoul.in> # On fairphone-fp5

> ---
> This issue is somewhat of a race condition, with some kernel configs it
> cannot (easily) be triggered, with others relatively reliably but it
> seems also to be somewhat related to cold boot.
> 
> Also I can't pinpoint a good Fixes tag, lpass_tlmm was introduced before
> q6afecc got added for this SoC, and that worked fine for those boards it
> seems. It's just needed on boards with Elite audio architecture.
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi               | 5 +++++
>  arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> b/arch/arm64/boot/dts/qcom/kodiak.dtsi index 076069f14495..f478c5e1d2d5
> 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -2994,6 +2994,11 @@ lpass_tlmm: pinctrl@33c0000 {
>  			compatible = "qcom,sc7280-lpass-lpi-
pinctrl";
>  			reg = <0 0x033c0000 0x0 0x20000>,
>  				<0 0x03550000 0x0 0x10000>;
> +
> +			clocks = <&q6afecc LPASS_HW_MACRO_VOTE 
LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6afecc LPASS_HW_DCODEC_VOTE 
LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +			clock-names = "core", "audio";
> +
>  			gpio-controller;
>  			#gpio-cells = <2>;
>  			gpio-ranges = <&lpass_tlmm 0 0 15>;
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi index
> 84c6d662b54f..617a39d32488 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> @@ -67,6 +67,11 @@ &lpass_hm {
>  	status = "okay";
>  };
> 
> +&lpass_tlmm {
> +	/delete-property/ clocks;
> +	/delete-property/ clock-names;
> +};
> +
>  &lpasscc {
>  	status = "okay";
>  };
> 
> ---
> base-commit: ef1c7b875741bef0ff37ae8ab8a9aaf407dc141c
> change-id: 20260109-kodiak-lpass-tlmm-clocks-7da465d40eaf
> 
> Best regards,





