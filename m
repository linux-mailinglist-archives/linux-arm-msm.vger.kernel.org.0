Return-Path: <linux-arm-msm+bounces-34121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E5399A67A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 16:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BC37281671
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 14:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26EBC81AD7;
	Fri, 11 Oct 2024 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVqKtJyi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF63B80603;
	Fri, 11 Oct 2024 14:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728657531; cv=none; b=p3BXkE869de3FcYApBAkK2BVzxOIqZmu8rn0SiEJAdcP7mSzO/3qxzNJxXQyvpuG9ALZ5p0kTMvheREP24ltTa3cbY/afVAfKmMcsAcs0hGXMjY2o/Salh8PKphdCUSX7XI2Yr+2tlqeCYnyZBfZJgDKcVE3O1TIt08zsP8Fo4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728657531; c=relaxed/simple;
	bh=LzEU21kvQ/WYUwcS587liGJ+TJpJqMynD+RPNGMcEyQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=kB3vS7dFtlq2gDyjxEBTQMmhYJhN9M+6HZ9WQoAThMyI1+bKSbPDHeG0MgRTQsEBS1qkk1ZknhLoX/pO5gT37UcPpR6aiqUma6gOQKm2Etac2iPTfVXwCISO+lXmc0l59KG1HUpKtDTmrdt2x8SoHBVgJdr+0CngX8NdnZDmA0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVqKtJyi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323BFC4CECE;
	Fri, 11 Oct 2024 14:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728657530;
	bh=LzEU21kvQ/WYUwcS587liGJ+TJpJqMynD+RPNGMcEyQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=TVqKtJyimpsTwPQWNy0t/CPaza1/QLu78d8KOIzDaeSkWrw1bjEx3023I5JFFVRN7
	 7Q/5yCwLLvi+9sXOKQPl7sEHsweToIi8I8rZLXsNIUwvS2VcassIOsaR3FfdMUaa+w
	 XPbfdnaGG7Jdt20eSR/vgVZMlbWU2eOooUQNnnlznRUFeRlClzVrz0iAidkdO/ZEAB
	 rgm84ADLE5RuoRaZJ1/58BG885nLiNCH4kmNOsE9szmlfRe5biY/UBi9SQb1oV07rf
	 8NGY4be/C4kx5El1+EhIrzVEbo0M4AcNU5RH59eKi3CkIYeUuXISOXeUXXwR59/GNg
	 QVfB8GVhEmArw==
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
	<87h69i7v8c.fsf@kernel.org>
	<p4j7i6fbr7htsh44vumlsziuhbl4phqok4zxnubdvyrjo2cllt@cez4iynfjayt>
Date: Fri, 11 Oct 2024 17:38:46 +0300
In-Reply-To: <p4j7i6fbr7htsh44vumlsziuhbl4phqok4zxnubdvyrjo2cllt@cez4iynfjayt>
	(Dmitry Baryshkov's message of "Fri, 11 Oct 2024 16:46:14 +0300")
Message-ID: <87ttdi66x5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Fri, Oct 11, 2024 at 02:08:19PM +0300, Kalle Valo wrote:
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>> 
>> >> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
>> >> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
>> >> @@ -680,6 +680,25 @@ &pcie0_phy {
>> >>  	status = "okay";
>> >>  };
>> >>  
>> >> +&pcieport0 {
>> >> +	wifi@0 {
>> >> +		compatible = "pci17cb,1101";
>> >> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
>> >> +
>> >> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> >> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
>> >> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> >> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> >> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> >> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> >> +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
>> >> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
>> >> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
>> >> +
>> >> +		qcom,ath11k-calibration-variant = "Xiaomi_Pad_5Pro";
>> >
>> > Let's wait for Kalle's response.
>> 
>> Sorry, I don't know what you refer to here. I have been extremly busy
>> with MLO patches so drowning with mail right now :/
>
> Just an ack for the calibration variant name.

Ah, then ack from me for the name. Thanks for following these.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

