Return-Path: <linux-arm-msm+bounces-54845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E93A94E89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 11:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78FE11891ACD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 09:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43509213230;
	Mon, 21 Apr 2025 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="QEt53vUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F2921019C;
	Mon, 21 Apr 2025 09:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745227330; cv=none; b=qFlIPl3fExW8NWuCQ66ui5p1OSSwr/IuieMstnFS887FWnoeBHvRysL1tSKlbxPTtiRZgz8pb6+hyBOfYXeOvldxnneHm4H9FihnQ4zeY+euK3VO50MLhBOas82TbMHIMNum5jMhnUf6XT1MMLKJFMOXcsACO1bA2/2J93pOR8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745227330; c=relaxed/simple;
	bh=9+q9+ZYkm2253YwEXnz5fx8Lxlx6oh/OBIHDeozyHxc=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=hTqHpbXnRg9LvaUsj7sogD2xKk7lQI9GoGK1zBWABgSZxVTzq+kz8yZl1GFwgMPkTUG+otWy6jraKa1zZT8gK4bDv5DV0faDTZGVW8N1XQG5zwU4gvy2zCjCACQINyUed2nliP7LiSQFm7JAtII0vFqAmo+qA7tPw0K2/dsboA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=QEt53vUz; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (web.docker-mailserver_default [172.18.0.2])
	by mail.mainlining.org (Postfix) with ESMTPSA id B9614BBAD2;
	Mon, 21 Apr 2025 09:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1745227325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9TVwWh/ybLUmoattVNjgJ0THd62L8OQPjQmgm+QFudI=;
	b=QEt53vUzTY9Xsd5obVxIe7P/xmtPrT3Sl70u60F7eip1QFae7ReZEyjAV2t01yWNWTKsK/
	CE/d2fiQRjLmoIjHcGl1HbWLZM+a7IwEowf+bDxbtVIECYNo6fhP9V1pSNS/qeahf0M4Yl
	9L04/aW69s7GJw/F0LJFX255uhjlE3a92r7mEOZvX88A/r+yxcfG1+76f/OmprLJToqdvE
	yQhDqWe7ZlBeUkfU787fQawkh2x8xUkEZ+NJvw/BZiOvp7pxHDlNP/0JNMdzOWOaC57qQR
	pehYh+Lpg0icIs8+NOWHQMJsh9i+HUXE0CQDuQppS7qblZFSmrf3twwVLNzlsQ==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 21 Apr 2025 11:22:05 +0200
From: barnabas.czeman@mainlining.org
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad
 Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8953: sort adreno clocks
In-Reply-To: <nxv2k2ofiao47w7gmqcgfgn57heucs6yp2og3lkzlavjarado7@p5u4663yw3oz>
References: <20250421-a5xx-schema-v1-0-7d96b889322a@mainlining.org>
 <20250421-a5xx-schema-v1-2-7d96b889322a@mainlining.org>
 <nxv2k2ofiao47w7gmqcgfgn57heucs6yp2og3lkzlavjarado7@p5u4663yw3oz>
Message-ID: <4688d4d4ecee7078e535bb940b6055b9@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-04-21 10:16, Dmitry Baryshkov wrote:
> On Mon, Apr 21, 2025 at 05:09:22AM +0200, Barnabás Czémán wrote:
>> Sort adreno clocks in alphabetical order.
> 
> Why? The order of the clocks here matches the order in which they 
> should
> be brought up.
Simple misunderstanding from previous attempts of documenting the 
alwayson clock.
By the way i have find out a508/a509/a512 clock bring up order is 
different from downstream.
Upstream: iface, rbmmtimer, mem, mem_iface, rbcpr, core
Downstream: core, iface, rbmmtimer, mem, alt_mem_iface, rbcpr
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/arch/arm/boot/dts/qcom/sdm630-gpu.dtsi#L85
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/arch/arm/boot/dts/qcom/sdm660-gpu.dtsi#L87
Should I fix it?
> 
>> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi 
>> b/arch/arm64/boot/dts/qcom/msm8953.dtsi
>> index 
>> 4793a60fa946195d3220b6c44dec170d443f56db..8a7e80c959fad09f950fe202eba76d3aae01d1ea 
>> 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
>> @@ -1052,18 +1052,18 @@ gpu: gpu@1c00000 {
>>  			reg-names = "kgsl_3d0_reg_memory";
>>  			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
>> 
>> -			clocks = <&gcc GCC_OXILI_GFX3D_CLK>,
>> +			clocks = <&gcc GCC_BIMC_GPU_CLK>,
>> +				 <&gcc GCC_OXILI_AON_CLK>,
>> +				 <&gcc GCC_OXILI_GFX3D_CLK>,
>>  				 <&gcc GCC_OXILI_AHB_CLK>,
>>  				 <&gcc GCC_BIMC_GFX_CLK>,
>> -				 <&gcc GCC_BIMC_GPU_CLK>,
>> -				 <&gcc GCC_OXILI_TIMER_CLK>,
>> -				 <&gcc GCC_OXILI_AON_CLK>;
>> -			clock-names = "core",
>> +				 <&gcc GCC_OXILI_TIMER_CLK>;
>> +			clock-names = "alt_mem_iface",
>> +				      "alwayson",
>> +				      "core",
>>  				      "iface",
>>  				      "mem_iface",
>> -				      "alt_mem_iface",
>> -				      "rbbmtimer",
>> -				      "alwayson";
>> +				      "rbbmtimer";
>>  			power-domains = <&gcc OXILI_GX_GDSC>;
>> 
>>  			iommus = <&gpu_iommu 0>;
>> 
>> --
>> 2.49.0
>> 

