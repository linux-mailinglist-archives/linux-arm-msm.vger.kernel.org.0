Return-Path: <linux-arm-msm+bounces-86850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5101CE6CEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 14:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 071AB3014A22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77103148C7;
	Mon, 29 Dec 2025 12:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="SG/z5icF";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="CX8H9vhM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0105314A6B;
	Mon, 29 Dec 2025 12:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013156; cv=none; b=r5L471aOKtmvQ/BFTixjH15JyMy7zbGr0BbzLI+duIYhw1VJdqI0z3JHupKq4EGk8jqFOWfHSH12RrFy8liv1F2Mx9uNAp6xWbFakPcFZHnxLLrt0RGEJW3WyUTwPlTBEUqOTVbs3CUZUedTTdtzvRdVPYgZIzyL0zlLJlgdvq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013156; c=relaxed/simple;
	bh=ffT3EOrYIRXcj/joRJSDO8HnLiu15Cz/MegJQbnFjps=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=WjcNle2HfkEnF/TneVYXb6EgRyOYmgLlm3XccwyHFdRWqesZZY/ZCdwO/d+PGxsry53wXVi1mKOa62r6WPrSj8Z6KUqmunHH7WCHzOQavHDIVpfew820r3AhfUAAdSlVgjifnCJmR/npLKU4ue8xJ0NztsDQSLqC33s5BbXSQI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=SG/z5icF; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=CX8H9vhM; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767013144; bh=F80F8gTi+w+QQp8ThX8uzsK
	l//dTuYrPZoP2HYcIs2k=; b=SG/z5icFY2TqeXM4mRq0CoEsOXUvreZMBZ8pCSQPGqspLo5hbW
	/p/faXue3zk+ebBShIr/tLHvgK+0zxqp+emQjRvIHUjrhX6CM8tCCDqZtppGiWsqRfMzk3XmMld
	9UnaglSkmKWQyeI8JhmMgBQE22KCBCzZafD3GNI2oSVsSJl47zBlXUitoa1IMkJIC7GRHH89VX/
	U7GDGVT3SL10hx7qtbrzyYwk/Aw80cBbcqkTPeIaXnXROPSe38BI7xc3EGnGPD1H2xOM/SxlxJA
	+DHL7B2bLGZX/6Hxm5bLthIMZy03gnV6f54mdQXUltGH2feKvk47Mrma68qWSN3zxWA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767013144; bh=F80F8gTi+w+QQp8ThX8uzsK
	l//dTuYrPZoP2HYcIs2k=; b=CX8H9vhMDTjD001vDIrTDFRsXtwTNlabRmYXvKclAnm3HTMEp2
	HmS0OzRPKOiB+GT8YthaS00U9EUwvJRYGbBw==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 29 Dec 2025 13:59:04 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] remoteproc: qcom_q6v5_mss: Add MSM8917
In-Reply-To: <eeda5a8b6f5a9dc5cf5440afc07c40fd@mainlining.org>
References: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
 <20251228-mss-v1-4-aeb36b1f7a3f@mainlining.org>
 <aVJhH17XH1srlroL@linaro.org>
 <d531f1346b59af06c323f393883b1d13@mainlining.org>
 <2898fde7-2b3b-471b-8f8f-a02cb6953aaf@oss.qualcomm.com>
 <eeda5a8b6f5a9dc5cf5440afc07c40fd@mainlining.org>
Message-ID: <d3ee6ba3e66706c304ecfe6afc4b75f2@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-29 13:51, barnabas.czeman@mainlining.org wrote:
> On 2025-12-29 13:40, Konrad Dybcio wrote:
>> On 12/29/25 1:33 PM, barnabas.czeman@mainlining.org wrote:
>>> On 2025-12-29 12:08, Stephan Gerhold wrote:
>>>> On Sun, Dec 28, 2025 at 03:21:54PM +0100, Barnabás Czémán wrote:
>>>>> Add support for MSM8917 MSS it is similar for MDM9607 MSS
>>>>> only difference is the mss power domain.
>>>>> 
>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>> ---
>>>>>  drivers/remoteproc/qcom_q6v5_mss.c | 46 
>>>>> ++++++++++++++++++++++++++++++++++++--
>>>>>  1 file changed, 44 insertions(+), 2 deletions(-)
>>>>> 
>>>>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c 
>>>>> b/drivers/remoteproc/qcom_q6v5_mss.c
>>>>> index ffafbe501a05..2579558fb567 100644
>>>>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>>>>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>>>>> @@ -259,6 +259,7 @@ enum {
>>>>>      MSS_MSM8226,
>>>>>      MSS_MSM8909,
>>>>>      MSS_MSM8916,
>>>>> +    MSS_MSM8917,
>>>>>      MSS_MSM8926,
>>>>>      MSS_MSM8953,
>>>>>      MSS_MSM8974,
>>>>> @@ -749,13 +750,15 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>>>>          goto pbl_wait;
>>>>>      } else if (qproc->version == MSS_MDM9607 ||
>>>>>             qproc->version == MSS_MSM8909 ||
>>>>> +           qproc->version == MSS_MSM8917 ||
>>>>>             qproc->version == MSS_MSM8953 ||
>>>>>             qproc->version == MSS_MSM8996 ||
>>>>>             qproc->version == MSS_MSM8998 ||
>>>>>             qproc->version == MSS_SDM660) {
>>>>> 
>>>>>          /* Override the ACC value if required */
>>>>> -        if (qproc->version == MSS_MDM9607)
>>>>> +        if (qproc->version == MSS_MDM9607 ||
>>>>> +            qproc->version == MSS_MSM8917)
>>>>>              writel(QDSP6SS_ACC_OVERRIDE_VAL_9607,
>>>>>                     qproc->reg_base + QDSP6SS_STRAP_ACC);
>>>>>          else if (qproc->version != MSS_MSM8909 &&
>>>>> @@ -817,6 +820,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>>>> 
>>>>>              /* Turn on L1, L2, ETB and JU memories 1 at a time */
>>>>>              if (qproc->version == MSS_MDM9607 ||
>>>>> +                qproc->version == MSS_MSM8917 ||
>>>>>                  qproc->version == MSS_MSM8953 ||
>>>>>                  qproc->version == MSS_MSM8996) {
>>>>>                  mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
>>>>> @@ -826,7 +830,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>>>>                   * Set first 5 bits in reverse to avoid
>>>>>                   * "inrush current" issues.
>>>>>                   */
>>>>> -                if (qproc->version == MSS_MDM9607)
>>>>> +                if (qproc->version == MSS_MDM9607 ||
>>>>> +                    qproc->version == MSS_MSM8917)
>>>>>                      reverse = 6;
>>>>>              } else {
>>>>>                  /* MSS_MSM8998, MSS_SDM660 */
>>>>> @@ -2538,6 +2543,42 @@ static const struct rproc_hexagon_res 
>>>>> msm8916_mss = {
>>>>>      .version = MSS_MSM8916,
>>>>>  };
>>>>> 
>>>>> +static const struct rproc_hexagon_res msm8917_mss = {
>>>>> +    .hexagon_mba_image = "mba.mbn",
>>>>> +    .proxy_supply = (struct qcom_mss_reg_res[]) {
>>>>> +        {
>>>>> +            .supply = "pll",
>>>>> +            .uA = 100000,
>>>>> +        },
>>>>> +        {}
>>>>> +    },
>>>>> +    .proxy_clk_names = (char*[]){
>>>>> +        "xo",
>>>>> +        NULL
>>>>> +    },
>>>>> +    .active_clk_names = (char*[]){
>>>>> +        "iface",
>>>>> +        "bus",
>>>>> +        "mem",
>>>>> +        NULL
>>>>> +    },
>>>>> +    .proxy_pd_names = (char*[]) {
>>>>> +        "cx",
>>>>> +        "mx",
>>>>> +        "mss",
>>>> 
>>>> Are you sure mss/pm8937_s1 also works as a power domain? It seems to 
>>>> be
>>>> a plain regulator downstream (similar to msm8226/msm8974).
>>>> 
>>>> Same thing applies to MSM8953 as well though and there we seem to 
>>>> have
>>>> decided to model it as a power domain ...
>>> They have this at downstream, i guess this is why handled as a power 
>>> domain.
>>> vdd_mss-uV = <RPM_SMD_REGULATOR_LEVEL_TURBO>;
>> 
>> It seems to be just a normal regulator on both 8917 and 8953
>> 
>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8953-regulator.dtsi
>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8953.dtsi
>> 
>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8917-regulator.dtsi
>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8917.dtsi
>> 
>> Konrad
> It is different between 3.18 and 4.9, 3.18 seems simpler and easier to 
> use it as regulator i will change it
> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/arch/arm64/boot/dts/qcom/msm8917.dtsi#L1375
> https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.6.6.c32-05500-89xx.0/arch/arm/boot/dts/qcom/msm8917.dtsi#L1655
Only question is left what about SDM439 and SDM632? They were introduced 
at 4.9 maybe that is why it was modified both are inheriting
MSS bindings from 8953 and 8937.

