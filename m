Return-Path: <linux-arm-msm+bounces-78735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E3DC0699D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 16:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CAE17502C8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 13:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2335031D742;
	Fri, 24 Oct 2025 13:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="IMtV/DMW";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="wkYzs5wg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600A12DE70C;
	Fri, 24 Oct 2025 13:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761314396; cv=none; b=V1HGXpHBpEFfkpylgTKCM86sz6XxqzBARHRSAQXlfj/KLdVqSa1IpKDd9ZK6PoXdI8DEZ0nsBy5pcc+F6F1/ECtlARVkxAoxTpJNTODeQLizE3NO9M5pM1Da5d+uYm+TnZGQD7qPXtgICfSo0QETsSFPYSJKyn2GKRflE0Hv0eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761314396; c=relaxed/simple;
	bh=balVstkGgw4FuJr7gYYdlTm3djRzXOPdaF7mDaQAZ7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rdRW60MB79pZNFfBub2/yVV677XD8QuiZ4wqs7Qgg6x5Y7bWlnjNpIzZ6SbwCiXap0qs/Bt0Gi9aU7hfEVgWckZTHMIZeeMTm74wQoqzcIOGO0MHyy7lff2TvPoXNzj1dNbYxJYNGMhMgEbifjCVrETZwTKmooAAdxDol32/a04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=IMtV/DMW; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=wkYzs5wg; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1761314338; bh=/Pr6PpVMVyEbWjqU/OrlJDx
	z/c2pylURHEnGiiqtuhs=; b=IMtV/DMWImM3ytbIBMvKd9IeHWkakGpdd93OgrtrQDgiUX25j4
	M0vMUcDWCH4gYQJjQmS+a9pbE8sM8Rw4j8MgMgkHtGe9ERTIvZYpi4YH+NA4DvUDtDJbP/JQoob
	+yC9CvHMOBIa9OydfHP4r9eGa2B4rCG8k73IFfwavPkj7Hd86wBdWMb6efpHbaICmS+5F0RMVXK
	kzneUFWRUG3aZZ+9XZmUCkJHzjRAZwSchemnVXFsn+jXpMoVBB8JxKlRHqPUZRNGrLpUNJHDEfb
	Z8pGPyn8g57eFDQ3+pDTDamcof2/Yg1N8IRqf0yzGYGBhm7VEbBPJSbDlbwJZhlL0JA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1761314338; bh=/Pr6PpVMVyEbWjqU/OrlJDx
	z/c2pylURHEnGiiqtuhs=; b=wkYzs5wgRe1geWGgouhOuPQI/t0AEKH+EgSF3Xb4rYtUhnqYp7
	AUSgSaVcLBChKBr7qf7LbZqXzlyw/WEQ2GAw==;
Message-ID: <47b40a91-8365-4431-9fd9-1e48fad2a4e1@mainlining.org>
Date: Fri, 24 Oct 2025 16:58:57 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
 <20251023-qcom-sdm660-cdsp-adsp-dts-v2-1-895ffe50ab5f@mainlining.org>
 <07066c46-4121-48da-846a-3a180d245589@oss.qualcomm.com>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <07066c46-4121-48da-846a-3a180d245589@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


24.10.2025 11:28, Konrad Dybcio пишет:
> On 10/23/25 9:51 PM, Nickolay Goppen wrote:
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
> [...]
>
>> +			label = "turing";
> "cdsp"
Ok, I'll change this in the next revision.
>> +			mboxes = <&apcs_glb 29>;
>> +			qcom,remote-pid = <5>;
>> +
>> +			fastrpc {
>> +				compatible = "qcom,fastrpc";
>> +				qcom,glink-channels = "fastrpcglink-apps-dsp";
>> +				label = "cdsp";
>> +				qcom,non-secure-domain;
> This shouldn't matter, both a secure and a non-secure device is
> created for CDSP
I've added this property, because it is used in other SoC's, such as 
SDM845 and SM6115 for both ADSP and CDSP
> Konrad

-- 
Best regards,
Nickolay


