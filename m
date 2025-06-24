Return-Path: <linux-arm-msm+bounces-62235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D309AE6EDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 20:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB17E3B8A3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 18:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFE3238C3B;
	Tue, 24 Jun 2025 18:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="fdAFfRwM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4C423315A;
	Tue, 24 Jun 2025 18:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750790800; cv=none; b=qY3YqpxVGDajnz7XHyIMptEZNvk6/Oi4t4cwbabbr99bcsN3+LduSO8p79MIhBxJ9f6eIAX/6oJ7A225yz15K1PfHiwv5PR/EQhp5r/NeNjQTXh56dqeyc4AwL7kiipSRfLhZzvRRFdPecCWjMYhXTzMbCroDcSW4uLu3kTiSVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750790800; c=relaxed/simple;
	bh=7Kof3VsVQEwAhnIBqaWj3+BD5FpcbbRwilql5guZhTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W+vQnTxzbxpMNvp3dVAP81KD0sbGx2MZCCqyn5HWRcGQn5hLrWtPBM3gi/23yvOJN4MV2wMyF68tO9JwZYqnHHg0mkktYOYxQh4LEBXVTVliJhZzkRtUAqdgWOgc+0xNVxn0t+uHaX4rEgTKoXIHQPIdvj+gh07PMuVEAniXAi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=fdAFfRwM; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1750790789; bh=7Kof3VsVQEwAhnIBqaWj3+BD5FpcbbRwilql5guZhTk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fdAFfRwM3z2AzSgyy9JisYCxm3OHDo3mBjcJ/1bWgLFPnkJ70qjvO3tEAUpyATx49
	 4+f0FkeJ2XuE3V5iE3ydpuO47Uf1A6nOSxWOWPul8bbUUEk7X74HXrnClvE6zATtvK
	 ifMNaQV5uDai3TZayC2pjf5Kz05OBJbZwnz/aXLE=
Message-ID: <841c41cc-e44d-40c7-9431-a77feaa49b05@lucaweiss.eu>
Date: Tue, 24 Jun 2025 20:46:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] Start using rpmpd for power domains on MSM8974
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <amfgwjgstu4hoxz4lo7fqrqz5fqtf3r7o6wqvrrjkcfubwrjyz@5i75peprq3wn>
Content-Language: en-US
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <amfgwjgstu4hoxz4lo7fqrqz5fqtf3r7o6wqvrrjkcfubwrjyz@5i75peprq3wn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 24-06-2025 2:59 a.m., Dmitry Baryshkov wrote:
> On Sat, Jun 21, 2025 at 03:19:55PM +0200, Luca Weiss wrote:
>> Switch over the ADSP PIL to use power-domains instead of a regulator,
>> and have one commit switching over the MSM8974 SoC plus all the devices
>> to use power-domains.
>>
>> Note, that I'm aware that these changes are not backwards compatible and
>> not really bisectable, but since it only affects the ADSP on these
> 
> Why? The cx-supply is handled unconditionally. A single-domain usecase
> is also handled via a special code path. I think this might be
> backwards-compatible, by the pure luck.

Honestly I have not tried and not looked much. I mostly added this 
paragraph to avoid the response that this change might break and is not 
really backwards compatible. If it does (by accident) work with the 
updated dts without the driver and the other way around, then even better.

Regards
Luca

> 
>> pretty old boards, I say it's fine to have this. Get all the patches
>> into the same release (6.17?) and then we're good again.
>>
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> ---
>> Luca Weiss (4):
>>        dt-bindings: remoteproc: qcom,adsp: Make msm8974 use CX as power domain
>>        remoteproc: qcom_q6v5_pas: Use resource with CX PD for MSM8974
>>        ARM: dts: qcom: msm8974: Sort header includes alphabetically
>>        ARM: dts: qcom: msm8974: Start using rpmpd for power domains
>>
>>   .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 18 ++------
>>   .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 13 ------
>>   .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    | 12 ------
>>   .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 12 ------
>>   .../dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi   | 12 ------
>>   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           | 50 ++++++++++++++++++++--
>>   .../dts/qcom/qcom-msm8974pro-fairphone-fp2.dts     |  8 ----
>>   arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts  | 11 -----
>>   .../dts/qcom/qcom-msm8974pro-oneplus-bacon.dts     |  9 ----
>>   .../qcom/qcom-msm8974pro-samsung-klte-common.dtsi  | 11 ++---
>>   ...qcom-msm8974pro-sony-xperia-shinano-common.dtsi | 12 ------
>>   drivers/remoteproc/qcom_q6v5_pas.c                 |  2 +-
>>   12 files changed, 56 insertions(+), 114 deletions(-)
>> ---
>> base-commit: 7fa2fb97cd28e1d9670da538095565b6fba83977
>> change-id: 20250621-msm8974-rpmpd-switch-b19b166c02be
>>
>> Best regards,
>> -- 
>> Luca Weiss <luca@lucaweiss.eu>
>>
> 


