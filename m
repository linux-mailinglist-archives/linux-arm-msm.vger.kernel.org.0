Return-Path: <linux-arm-msm+bounces-79869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B52C24C85
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D90F189EEE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 11:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1501D345CAF;
	Fri, 31 Oct 2025 11:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="FnLxw10M";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="n2QcmDv0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C16332EDC;
	Fri, 31 Oct 2025 11:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761910258; cv=none; b=ubnhPc/UCLhiPI/zPPShqINtZ/KFdoieINO9fWc2mZv9o9N1iz14GFCBWWuYvMam/DwrFonw9UWdoVjY9Nve2SM9W3ZB8cIAR7zgi9zWQ7btKdGwOgzLEvl8ia0sqsS/1rMMcySl+bjAPGnfEL4cxdzNzoQS6AeaWzAtQOKAYZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761910258; c=relaxed/simple;
	bh=HcpOOYkGpWQwMpSrJthQI3UkUlHo088WhNa2tIBVrqE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=paA/yRTNgpRZmYsuk3DbsoEjDLOmL8FvnBXqiHOxM43FNXS6dWnONkU2PlnF/KyAzS2+ucrrQmD3Fhggd2pYtwkjYxpJUIglLgt4qUo8aF9tPF8W27VZ2iCLmUfn5Q4sNiyGWENuKDwSVRGP8bnmDo7DSQD54rqp4s5IfkemFWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=FnLxw10M; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=n2QcmDv0; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:From:Subject:Date:Message-ID; t=1761910235; bh=U2qSHYLdvuBSg97SIvNd5cF
	/bbA8KgNNtNgU+K6wqPg=; b=FnLxw10M660qSOuIolQCuxHU3eEodgElGWvhzLnJ8bsk+a4Fx6
	6vCcPNKaAMmGZLl4y9eHdXiR5ci8gCwhqMpFhk0vaeSf1AOHpL7L25MIcykfNj9pK/pzuCe89Td
	IxAF3CEdo2DV2iRCEMjkgoDexBvExysKZG+GNQOrkY0wHfics1iTjLiEqume9HvFK90NCsoONcJ
	Rna/tHs713rdmZopOJyvVlgYk7b5k7zPtrjb4UgWEbU4uum8zrKBBJvL+J3w5efirZKl6P/FwrG
	KI6nLWzsqQhPI7Kr5+ceO6USvEu1mDm4TLXXZcB2Lq+YUWNFpa+Rme7uQu3Q0bbaYow==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:From:Subject:Date:Message-ID; t=1761910235; bh=U2qSHYLdvuBSg97SIvNd5cF
	/bbA8KgNNtNgU+K6wqPg=; b=n2QcmDv0U6EfUVNhvSV62MhssN7vfChtLYHUICG6AkTQREr5US
	FHIHHpMLHpZrSybhTjkIIuGyX2LFAMvL0SCw==;
Message-ID: <a3cb6633-1595-41e7-8e87-ca48a98f822c@mainlining.org>
Date: Fri, 31 Oct 2025 14:30:34 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
From: Nickolay Goppen <setotau@mainlining.org>
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
 <47b40a91-8365-4431-9fd9-1e48fad2a4e1@mainlining.org>
Content-Language: ru-RU, en-US
In-Reply-To: <47b40a91-8365-4431-9fd9-1e48fad2a4e1@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


24.10.2025 16:58, Nickolay Goppen пишет:
>
> 24.10.2025 11:28, Konrad Dybcio пишет:
>> On 10/23/25 9:51 PM, Nickolay Goppen wrote:
>>> In order to enable CDSP support for SDM660 SoC:
>>>   * add shared memory p2p nodes for CDSP
>>>   * add CDSP-specific smmu node
>>>   * add CDSP peripheral image loader node
>>>
>>> Memory region for CDSP in SDM660 occupies the same spot as
>>> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
>>> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
>>> cdsp_region, which is also larger in size.
>>>
>>> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
>>> related nodes and add buffer_mem back.
>>>
>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>> ---
>> [...]
>>
>>> +            label = "turing";
>> "cdsp"
> Ok, I'll change this in the next revision.
>>> +            mboxes = <&apcs_glb 29>;
>>> +            qcom,remote-pid = <5>;
>>> +
>>> +            fastrpc {
>>> +                compatible = "qcom,fastrpc";
>>> +                qcom,glink-channels = "fastrpcglink-apps-dsp";
>>> +                label = "cdsp";
>>> +                qcom,non-secure-domain;
>> This shouldn't matter, both a secure and a non-secure device is
>> created for CDSP
> I've added this property, because it is used in other SoC's, such as 
> SDM845 and SM6115 for both ADSP and CDSP
Is this property not neccessary anymore?
>> Konrad
>
-- 
Best regards,
Nickolay


