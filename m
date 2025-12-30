Return-Path: <linux-arm-msm+bounces-86997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AA1CEA0F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 16:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9B1B3010CDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 15:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D9C3176E1;
	Tue, 30 Dec 2025 15:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="EuEvNxH7";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="1d4Ter8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894C021D3C5;
	Tue, 30 Dec 2025 15:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767108528; cv=none; b=BqfI2WHEAPpgISGUt0NCjBIW0u8FAsN3mR7SiuDWfxVA+gUrudpnmxyEydflTFbiCCZzI+aTILKlxXdepysR4tzD8PB+ZhMrbgQ/yZleL3u6iJxOuFJfPs70cSru44lTZu2syu6O+7kSb8NCAsyRwUzAh5MAq38HEER/SmZB4kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767108528; c=relaxed/simple;
	bh=O1TARx0l0DxJfzmbm0Y61hmj7+eA2DrNVx2RH7v88k0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=R/Y2VVdKhE1pqEYcmQTr9oS9QFqHaqS0Yz1zHtlix/zqYxUN28W7J90YF7vjDMqnTAdX6K+Eaog/wEcPt3V2l9EpD9TpIDERj+ueXWLp77U2Qj7A+l9G3nCFxIjSQR/ofYTXncYG82MC/RK/f6Mf+iQthZRmMc1EgXqtqUYavoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=EuEvNxH7; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=1d4Ter8W; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767108523; bh=m57AjeGKkNROZRTWgAP5d3C
	ycYvnjiI8Vg/zbkC6oMc=; b=EuEvNxH7+ZvYozHZ3yoyqJo/SzRQTI/9aB8COsuKt5EnCqJtcR
	DzBVWXKjOplE1RkC/EEiWkleVQxykiMFhNAYVZHBKoqcSQFzPIkLXyMx1FHrajLA2X/XxK2xsx7
	62xlp5jn/h+PLSv4b0tciv7Mb8VC0IttdEUc4FkkhbPHPw86w6ol0rdW/rhOW+ZvvySrYFdwiYV
	+nmbwLXsS2rAlWMr06rQ7BdCXYh1SW+9+DcCIUm4HGEQqRfpdD1twvitg0vPbByp2UuXkUPUZ+3
	4lgWtarNEnFZJHbPzQX6BP7nhtmCwm0DKCEXFDUzTRqfhNM1jPcG1uSkVmNZeyu2FAw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767108523; bh=m57AjeGKkNROZRTWgAP5d3C
	ycYvnjiI8Vg/zbkC6oMc=; b=1d4Ter8WwsNyLlXfgToEBTILFeXciKbUKjSORjkmIS2DrIQrGp
	mGPdofmTt1pR1aWVuuTFfmrr1C0fRTLMJABg==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 30 Dec 2025 16:28:42 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] remoteproc: qcom_q6v5_mss: Add MSM8917
In-Reply-To: <563ce29d-0a96-42a6-9c05-51cf16244cc9@oss.qualcomm.com>
References: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
 <20251228-mss-v1-4-aeb36b1f7a3f@mainlining.org>
 <aVJhH17XH1srlroL@linaro.org>
 <d531f1346b59af06c323f393883b1d13@mainlining.org>
 <2898fde7-2b3b-471b-8f8f-a02cb6953aaf@oss.qualcomm.com>
 <eeda5a8b6f5a9dc5cf5440afc07c40fd@mainlining.org>
 <d3ee6ba3e66706c304ecfe6afc4b75f2@mainlining.org>
 <10bc67e8-e9e9-491d-9e38-4b55735d42fe@oss.qualcomm.com>
 <a142c6c16ff298fe782b3fc80efc4a30@mainlining.org>
 <563ce29d-0a96-42a6-9c05-51cf16244cc9@oss.qualcomm.com>
Message-ID: <397fc3d6419d1047b5f99dc4b2d02593@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-30 14:11, Konrad Dybcio wrote:
> On 12/30/25 4:25 AM, barnabas.czeman@mainlining.org wrote:
>> On 2025-12-29 14:07, Konrad Dybcio wrote:
>>> On 12/29/25 1:59 PM, barnabas.czeman@mainlining.org wrote:
>>>> On 2025-12-29 13:51, barnabas.czeman@mainlining.org wrote:
>>>>> On 2025-12-29 13:40, Konrad Dybcio wrote:
>>>>>> On 12/29/25 1:33 PM, barnabas.czeman@mainlining.org wrote:
>>>>>>> On 2025-12-29 12:08, Stephan Gerhold wrote:
>>>>>>>> On Sun, Dec 28, 2025 at 03:21:54PM +0100, Barnabás Czémán wrote:
>>>>>>>>> Add support for MSM8917 MSS it is similar for MDM9607 MSS
>>>>>>>>> only difference is the mss power domain.
>>>>>>>>> 
>>>>>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>>>>>> ---
>>>>>>>>>  drivers/remoteproc/qcom_q6v5_mss.c | 46 
>>>>>>>>> ++++++++++++++++++++++++++++++++++++--
>>>>>>>>>  1 file changed, 44 insertions(+), 2 deletions(-)
>>>>>>>>> 
>>>>>>>>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c 
>>>>>>>>> b/drivers/remoteproc/qcom_q6v5_mss.c
>>>>>>>>> index ffafbe501a05..2579558fb567 100644
>>>>>>>>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>>>>>>>>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>>>>>>>>> @@ -259,6 +259,7 @@ enum {
>>>>>>>>>      MSS_MSM8226,
>>>>>>>>>      MSS_MSM8909,
>>>>>>>>>      MSS_MSM8916,
>>>>>>>>> +    MSS_MSM8917,
>>>>>>>>>      MSS_MSM8926,
>>>>>>>>>      MSS_MSM8953,
>>>>>>>>>      MSS_MSM8974,
>>>>>>>>> @@ -749,13 +750,15 @@ static int q6v5proc_reset(struct q6v5 
>>>>>>>>> *qproc)
>>>>>>>>>          goto pbl_wait;
>>>>>>>>>      } else if (qproc->version == MSS_MDM9607 ||
>>>>>>>>>             qproc->version == MSS_MSM8909 ||
>>>>>>>>> +           qproc->version == MSS_MSM8917 ||
>>>>>>>>>             qproc->version == MSS_MSM8953 ||
>>>>>>>>>             qproc->version == MSS_MSM8996 ||
>>>>>>>>>             qproc->version == MSS_MSM8998 ||
>>>>>>>>>             qproc->version == MSS_SDM660) {
>>>>>>>>> 
>>>>>>>>>          /* Override the ACC value if required */
>>>>>>>>> -        if (qproc->version == MSS_MDM9607)
>>>>>>>>> +        if (qproc->version == MSS_MDM9607 ||
>>>>>>>>> +            qproc->version == MSS_MSM8917)
>>>>>>>>>              writel(QDSP6SS_ACC_OVERRIDE_VAL_9607,
>>>>>>>>>                     qproc->reg_base + QDSP6SS_STRAP_ACC);
>>>>>>>>>          else if (qproc->version != MSS_MSM8909 &&
>>>>>>>>> @@ -817,6 +820,7 @@ static int q6v5proc_reset(struct q6v5 
>>>>>>>>> *qproc)
>>>>>>>>> 
>>>>>>>>>              /* Turn on L1, L2, ETB and JU memories 1 at a time 
>>>>>>>>> */
>>>>>>>>>              if (qproc->version == MSS_MDM9607 ||
>>>>>>>>> +                qproc->version == MSS_MSM8917 ||
>>>>>>>>>                  qproc->version == MSS_MSM8953 ||
>>>>>>>>>                  qproc->version == MSS_MSM8996) {
>>>>>>>>>                  mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
>>>>>>>>> @@ -826,7 +830,8 @@ static int q6v5proc_reset(struct q6v5 
>>>>>>>>> *qproc)
>>>>>>>>>                   * Set first 5 bits in reverse to avoid
>>>>>>>>>                   * "inrush current" issues.
>>>>>>>>>                   */
>>>>>>>>> -                if (qproc->version == MSS_MDM9607)
>>>>>>>>> +                if (qproc->version == MSS_MDM9607 ||
>>>>>>>>> +                    qproc->version == MSS_MSM8917)
>>>>>>>>>                      reverse = 6;
>>>>>>>>>              } else {
>>>>>>>>>                  /* MSS_MSM8998, MSS_SDM660 */
>>>>>>>>> @@ -2538,6 +2543,42 @@ static const struct rproc_hexagon_res 
>>>>>>>>> msm8916_mss = {
>>>>>>>>>      .version = MSS_MSM8916,
>>>>>>>>>  };
>>>>>>>>> 
>>>>>>>>> +static const struct rproc_hexagon_res msm8917_mss = {
>>>>>>>>> +    .hexagon_mba_image = "mba.mbn",
>>>>>>>>> +    .proxy_supply = (struct qcom_mss_reg_res[]) {
>>>>>>>>> +        {
>>>>>>>>> +            .supply = "pll",
>>>>>>>>> +            .uA = 100000,
>>>>>>>>> +        },
>>>>>>>>> +        {}
>>>>>>>>> +    },
>>>>>>>>> +    .proxy_clk_names = (char*[]){
>>>>>>>>> +        "xo",
>>>>>>>>> +        NULL
>>>>>>>>> +    },
>>>>>>>>> +    .active_clk_names = (char*[]){
>>>>>>>>> +        "iface",
>>>>>>>>> +        "bus",
>>>>>>>>> +        "mem",
>>>>>>>>> +        NULL
>>>>>>>>> +    },
>>>>>>>>> +    .proxy_pd_names = (char*[]) {
>>>>>>>>> +        "cx",
>>>>>>>>> +        "mx",
>>>>>>>>> +        "mss",
>>>>>>>> 
>>>>>>>> Are you sure mss/pm8937_s1 also works as a power domain? It 
>>>>>>>> seems to be
>>>>>>>> a plain regulator downstream (similar to msm8226/msm8974).
>>>>>>>> 
>>>>>>>> Same thing applies to MSM8953 as well though and there we seem 
>>>>>>>> to have
>>>>>>>> decided to model it as a power domain ...
>>>>>>> They have this at downstream, i guess this is why handled as a 
>>>>>>> power domain.
>>>>>>> vdd_mss-uV = <RPM_SMD_REGULATOR_LEVEL_TURBO>;
>>>>>> 
>>>>>> It seems to be just a normal regulator on both 8917 and 8953
>>>>>> 
>>>>>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8953-regulator.dtsi
>>>>>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8953.dtsi
>>>>>> 
>>>>>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8917-regulator.dtsi
>>>>>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8917.dtsi
>>>>>> 
>>>>>> Konrad
>>>>> It is different between 3.18 and 4.9, 3.18 seems simpler and easier 
>>>>> to use it as regulator i will change it
>>>>> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/arch/arm64/boot/dts/qcom/msm8917.dtsi#L1375
>>>>> https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.6.6.c32-05500-89xx.0/arch/arm/boot/dts/qcom/msm8917.dtsi#L1655
>>>> Only question is left what about SDM439 and SDM632? They were 
>>>> introduced at 4.9 maybe that is why it was modified both are 
>>>> inheriting
>>>> MSS bindings from 8953 and 8937.
>>> 
>>> Seems both are the same too
>> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/arch/arm64/boot/dts/qcom/sdm439-regulator.dtsi#L18
>> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/arch/arm64/boot/dts/qcom/msm8953-regulator.dtsi#L17
>> SDM439 and SDM632 do not use simple regulator, s1 seems power domain 
>> to me. I have checked it in use at Fairphone 3, Redmi 7 and 7A
>> all have S1 as a power domain.
> 
> Hm, it seems you're right. It does indeed use level-based voting which
> would qualify it as a power domain in our upstream understanding
What would be the better solution?
1. Keep mss as power domain?
2. Set mss to a regulator for MSM8917 and keep as power domain for 
MSM8937 and SDM439.
3. Split SDM632 and SDM439 MSS from MSM8937 and MSM8953 MSS and use 
mss-supply
as regulator for MSM8917, MSM8937, MSM8940 and MSM8953 and use mss as 
power domain for SDM439 and SDM632.
> 
> Konrad

