Return-Path: <linux-arm-msm+bounces-78036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D62BF21CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 17:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CED7818C21BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 15:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB5F21B9C5;
	Mon, 20 Oct 2025 15:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Vgq3IS7l";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="MEgsiaTc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4E01D7999;
	Mon, 20 Oct 2025 15:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760974100; cv=none; b=ZvF+vQraQ5vqBPOj4pCwQ5uP8yeF17N+/KF1PqQ+GtSw2z0s+nKhRKdAC4eVQqeBlPWG6HzMbjkq8d/JX5cpXCnubjbMAtAzczIJSZ3UTWJ7mZkdAXMMQEUhA25ZNWMyr0J5uGiA+JQFzh10XN7LY+syEep4p/vbv0gtWYx3LBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760974100; c=relaxed/simple;
	bh=QIdVTWAu9JmWstd8hxDuQZHQnkvu2LLuopzHoOz/FmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m93NAcYObCaH7DBBuzR7O2tz9egi19K25mEfcsENO9SrtodLwd9Mc+qksvLgtx1v99JHgs6oj+dqlgq8JMBtEtCpg1+ReADhYykuMsShXODN4yrEQvb4DbYlY+s3cLexv10NNO27V00YCgPvVDJe+5zZtalxmthVyxeeG6C1Mts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Vgq3IS7l; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=MEgsiaTc; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1760974046; bh=dOChvKw2cLCTAXVmwdbp+1Q
	RCAZ5fLtON0OwmWn5rbY=; b=Vgq3IS7lzVH1Tj1KXs1Ucl3wiUOi3mKICcHUaN9EX0vF2+MiUU
	MJfcITgCCCfbucbI+D5UwF7hy/EBDqEbXWl1dosvrAU3Z2mCUdsAQ2WA/W60VhKXu64hseA+2UZ
	W8LagC/RkwId6FWJjR4Ki170uv89cYJ5EsFTH82TdPUI/3JZuFKmss52+vaBwMpgpG7NMJKfI1Q
	9EoZ/HocACzyZUEsGl2cmPL0k9ecet74S3q85SSjVUr6k99HCSwxqPFwRta3C7qyzmm5JEd1jFR
	7S1qvNlaef4FvHNdTjMugun6Z1h/9jALreo7Um/ugqhjHMPSk1qoCOEQ2EuwJO7U+kQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1760974046; bh=dOChvKw2cLCTAXVmwdbp+1Q
	RCAZ5fLtON0OwmWn5rbY=; b=MEgsiaTcGi8XWowPdhweJ79trCkydgubQvTdIhxopJXGtWUC40
	KmiLKzBx4W8hahmE12NItrE3/m02ZZ27jbDg==;
Message-ID: <f8daddfd-e0ec-4acd-afc5-cf0969aebb9f@mainlining.org>
Date: Mon, 20 Oct 2025 18:27:25 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm630/660: Add CDSP-related nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
References: <20251019-qcom-sdm660-cdsp-adsp-dts-v1-0-9ab5f2865a6e@mainlining.org>
 <20251019-qcom-sdm660-cdsp-adsp-dts-v1-1-9ab5f2865a6e@mainlining.org>
 <5hbc24lihvau7s2opzcxxgxkzugmbqmdtqwy23m45j4po23lnh@jyjlbgfjaddw>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <5hbc24lihvau7s2opzcxxgxkzugmbqmdtqwy23m45j4po23lnh@jyjlbgfjaddw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


20.10.2025 16:14, Dmitry Baryshkov пишет:
> On Sun, Oct 19, 2025 at 07:27:06PM +0300, Nickolay Goppen wrote:
>> In order to enable CDSP support for SDM660 SoC:
>>   * add shared memory p2p nodes for CDSP
>>   * add CDSP-specific smmu node
>>   * add CDSP peripheral image loader node
>>
>> Memory region for CDSP in SDM660 occupies the same spot as
>> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
>> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
>> cdsp_region, which is also larger in size.
>>
>> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
>> related nodes and add buffer_mem back.
>>
>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sdm630.dtsi |   2 +-
>>   arch/arm64/boot/dts/qcom/sdm636.dtsi |  14 ++++
>>   arch/arm64/boot/dts/qcom/sdm660.dtsi | 152 +++++++++++++++++++++++++++++++++++
>>   3 files changed, 167 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> index 8b1a45a4e56e..a6a1933229b9 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> @@ -563,7 +563,7 @@ modem_smp2p_in: slave-kernel {
>>   		};
>>   	};
>>   
>> -	soc@0 {
>> +	soc: soc@0 {
>>   		#address-cells = <1>;
>>   		#size-cells = <1>;
>>   		ranges = <0 0 0 0xffffffff>;
>> diff --git a/arch/arm64/boot/dts/qcom/sdm636.dtsi b/arch/arm64/boot/dts/qcom/sdm636.dtsi
>> index ae15d81fa3f9..41e4e97f7747 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm636.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm636.dtsi
>> @@ -16,6 +16,20 @@
>>    * be addressed when the aforementioned
>>    * peripherals will be enabled upstream.
>>    */
>> +/delete-node/ &cdsp_pil;
>> +/delete-node/ &cdsp_smmu;
>> +/delete-node/ &cdsp_region;
>> +
>> +/ {
>> +	/delete-node/ smp2p-cdsp;
>> +
>> +	reserved-memory {
>> +		buffer_mem: tzbuffer@94a00000 {
>> +			reg = <0x00 0x94a00000 0x00 0x100000>;
>> +			no-map;
>> +		};
>> +	};
>> +};
> This probably means that we need to invert things and make SDM636
> inherit SDM630 and SDM660 inherit SDM636. Would you mind doing that as a
> part of this patchset?
I'd mind
>>   
>>   &adreno_gpu {
>>   	compatible = "qcom,adreno-509.0", "qcom,adreno";

-- 
Best regards,
Nickolay


