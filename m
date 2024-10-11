Return-Path: <linux-arm-msm+bounces-34083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC4999A275
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 13:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A11F1F28163
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 11:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A621F216A2D;
	Fri, 11 Oct 2024 11:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rPgcR1fk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685FE216A1F;
	Fri, 11 Oct 2024 11:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644904; cv=none; b=eV3Pf6Izr3Sq9lASY+MkkqfYlBlrkBXlEUF8q5zKDNnvSupFboM/+ZU6U4gGlBfE+EasuIWmkFABPiD2klcQ/iFgXBRiyzro51Ze4w94UZAqNaapizqg760rR6MQWHY3g7QnHBjvECW+4HuGdgU97Gk7Wegm4omeCdhsxIgsv5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644904; c=relaxed/simple;
	bh=tItc0jJqioiJKJBYJHlOGatN0iSrXx49oxnZO+FaE5w=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=NDgj4eyYkleZ1vLcjsW2irozgikuB5dIGTS81JCa+9hpKidbjn3ZqeSqfSTvrdGKIOxWP+EnfiAEaocGryII1bRiNVO+f6nqlQ4+WKfzCcTekyF7ybWUqQu5IKiK9H1H4BEDjzgzMO32MeccZlRcijFTo5+TJ65+GESach56BcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rPgcR1fk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C52C4CEC3;
	Fri, 11 Oct 2024 11:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644903;
	bh=tItc0jJqioiJKJBYJHlOGatN0iSrXx49oxnZO+FaE5w=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=rPgcR1fkqJXIbp90DIP1kI86Ic7xUtxihl4nQwXx4jkzcxbPfDhx05dkOfu8y9aZY
	 GvLpqa7ybnU9lCnoOFnMeQakOHbno8MPRafGPxjYbNcc/xXaXMi7tSfphp6uCSsDjY
	 Sz70ReKMrmipk+yhLvgVqkcB+iIQanNg1Qx1Dr6PrEq4PuiZjF/C4S5+z5Ok4ilzu7
	 o6nHyFafswmHP1BcTRugvXMbmuFV4bCTS2aVhmkRseOPSB1sAHS7/61jGzN6quKDnS
	 d0K5TjQYelyCUSvnIDOilK6eHDpkqE67RUucX6egiLk6YW4xsFymKVwz6P0oSDPthu
	 AzMVr8qW2w4vw==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jianhua Lu <lujianhua000@gmail.com>,  Bjorn Andersson
 <andersson@kernel.org>,  Konrad Dybcio <konradybcio@kernel.org>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jeff Johnson <jjohnson@kernel.org>,
  linux-arm-msm@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  ath11k@lists.infradead.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi
 node
References: <20241010072243.10227-1-lujianhua000@gmail.com>
	<20241010072243.10227-2-lujianhua000@gmail.com>
	<pbsooimr6l65hgyxezyp6ha3zqibgdlphmeb7vtghgy2wti66b@fsmptbss2zvi>
Date: Fri, 11 Oct 2024 14:08:19 +0300
In-Reply-To: <pbsooimr6l65hgyxezyp6ha3zqibgdlphmeb7vtghgy2wti66b@fsmptbss2zvi>
	(Dmitry Baryshkov's message of "Thu, 10 Oct 2024 18:23:13 +0300")
Message-ID: <87h69i7v8c.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

>> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
>> @@ -680,6 +680,25 @@ &pcie0_phy {
>>  	status = "okay";
>>  };
>>  
>> +&pcieport0 {
>> +	wifi@0 {
>> +		compatible = "pci17cb,1101";
>> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
>> +
>> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
>> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
>> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
>> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
>> +
>> +		qcom,ath11k-calibration-variant = "Xiaomi_Pad_5Pro";
>
> Let's wait for Kalle's response.

Sorry, I don't know what you refer to here. I have been extremly busy
with MLO patches so drowning with mail right now :/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

