Return-Path: <linux-arm-msm+bounces-86846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C67ACE6C90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01AC03019D2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D9D31A815;
	Mon, 29 Dec 2025 12:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="hZqseWDw";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="IL5Y8FG+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D959B31A805;
	Mon, 29 Dec 2025 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767012674; cv=none; b=iFPYNq4mhtLkllpigwCTQYTy4B6113IVp1uSkrF7aYLd4Xs4HGfitM3pHClgdZNIukK3jbkfz9bYYD2K6uZA6IytfuKN8EF7j4tUoQb376/PI4ZNjDABZenbh+zHNZBkCgY+xOwVhr/BbNNHvcT99yVKR+9puVFE4BelTWnF4vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767012674; c=relaxed/simple;
	bh=EsaLtcsfHRttJYYByhImE6EkoEp48m2J0KIsmSror3E=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=dHh9xeUZPX37OdY/en5xydAnK33A5xk07K+nB5epFfea25LRN7GhtVffvMZc07OMs0grVFnCU0Vtg8+SRJZze/8RvoCUukfBBU+R5pcQILK5+nbrU0CYUEuf2uFFTn+tOPyCcY9AuseeW05AFyvuukGvG2CggLer69ZZs3qpmCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=hZqseWDw; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=IL5Y8FG+; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767012660; bh=QgOOuQFENkFCySZmTRRm84r
	mJu1ERirBsPJ+akWPAlk=; b=hZqseWDw3oPE26+kxmMiaMX3mIDCMtCNxb6n+KPPmjbpYRlmrE
	sehsPclpGi8QCpkQdR7vINGRoo0ivnGHCvJt72nKh2kCBArKznUHw7lNr+DjwNKfC9alBnWZVg8
	xqAOItYXmgYK5xufWcaEvhFVev1kpSXWzatgNVm2zkekatj0VkbNc6LO/fjYQYUDyRAC65pVzZs
	eSZTafOEbAhvbSkElcufFIAsjmUXRMviehF/ihdtxhcRnzZileB9fWdNHpPDK+AEzlrJI4Z5e9N
	TVBLN+WRNIna4Eggv/4C4apdaM+0BAGGG5slytkZ3bTTyhI3fsK39HtjJ0JBjXAU3gQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767012660; bh=QgOOuQFENkFCySZmTRRm84r
	mJu1ERirBsPJ+akWPAlk=; b=IL5Y8FG+Vo42YDXjBmD0GrB+5y0qASS0tEvYLXuCPbG8CZqpf+
	JJRblsYvD9mItwJx5uB4O0RTe0mvKYIv4HBw==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 29 Dec 2025 13:51:00 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] remoteproc: qcom_q6v5_mss: Add MSM8917
In-Reply-To: <2898fde7-2b3b-471b-8f8f-a02cb6953aaf@oss.qualcomm.com>
References: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
 <20251228-mss-v1-4-aeb36b1f7a3f@mainlining.org>
 <aVJhH17XH1srlroL@linaro.org>
 <d531f1346b59af06c323f393883b1d13@mainlining.org>
 <2898fde7-2b3b-471b-8f8f-a02cb6953aaf@oss.qualcomm.com>
Message-ID: <eeda5a8b6f5a9dc5cf5440afc07c40fd@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-29 13:40, Konrad Dybcio wrote:
> On 12/29/25 1:33 PM, barnabas.czeman@mainlining.org wrote:
>> On 2025-12-29 12:08, Stephan Gerhold wrote:
>>> On Sun, Dec 28, 2025 at 03:21:54PM +0100, Barnabás Czémán wrote:
>>>> Add support for MSM8917 MSS it is similar for MDM9607 MSS
>>>> only difference is the mss power domain.
>>>> 
>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>> ---
>>>>  drivers/remoteproc/qcom_q6v5_mss.c | 46 
>>>> ++++++++++++++++++++++++++++++++++++--
>>>>  1 file changed, 44 insertions(+), 2 deletions(-)
>>>> 
>>>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c 
>>>> b/drivers/remoteproc/qcom_q6v5_mss.c
>>>> index ffafbe501a05..2579558fb567 100644
>>>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>>>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>>>> @@ -259,6 +259,7 @@ enum {
>>>>      MSS_MSM8226,
>>>>      MSS_MSM8909,
>>>>      MSS_MSM8916,
>>>> +    MSS_MSM8917,
>>>>      MSS_MSM8926,
>>>>      MSS_MSM8953,
>>>>      MSS_MSM8974,
>>>> @@ -749,13 +750,15 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>>>          goto pbl_wait;
>>>>      } else if (qproc->version == MSS_MDM9607 ||
>>>>             qproc->version == MSS_MSM8909 ||
>>>> +           qproc->version == MSS_MSM8917 ||
>>>>             qproc->version == MSS_MSM8953 ||
>>>>             qproc->version == MSS_MSM8996 ||
>>>>             qproc->version == MSS_MSM8998 ||
>>>>             qproc->version == MSS_SDM660) {
>>>> 
>>>>          /* Override the ACC value if required */
>>>> -        if (qproc->version == MSS_MDM9607)
>>>> +        if (qproc->version == MSS_MDM9607 ||
>>>> +            qproc->version == MSS_MSM8917)
>>>>              writel(QDSP6SS_ACC_OVERRIDE_VAL_9607,
>>>>                     qproc->reg_base + QDSP6SS_STRAP_ACC);
>>>>          else if (qproc->version != MSS_MSM8909 &&
>>>> @@ -817,6 +820,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>>> 
>>>>              /* Turn on L1, L2, ETB and JU memories 1 at a time */
>>>>              if (qproc->version == MSS_MDM9607 ||
>>>> +                qproc->version == MSS_MSM8917 ||
>>>>                  qproc->version == MSS_MSM8953 ||
>>>>                  qproc->version == MSS_MSM8996) {
>>>>                  mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
>>>> @@ -826,7 +830,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>>>                   * Set first 5 bits in reverse to avoid
>>>>                   * "inrush current" issues.
>>>>                   */
>>>> -                if (qproc->version == MSS_MDM9607)
>>>> +                if (qproc->version == MSS_MDM9607 ||
>>>> +                    qproc->version == MSS_MSM8917)
>>>>                      reverse = 6;
>>>>              } else {
>>>>                  /* MSS_MSM8998, MSS_SDM660 */
>>>> @@ -2538,6 +2543,42 @@ static const struct rproc_hexagon_res 
>>>> msm8916_mss = {
>>>>      .version = MSS_MSM8916,
>>>>  };
>>>> 
>>>> +static const struct rproc_hexagon_res msm8917_mss = {
>>>> +    .hexagon_mba_image = "mba.mbn",
>>>> +    .proxy_supply = (struct qcom_mss_reg_res[]) {
>>>> +        {
>>>> +            .supply = "pll",
>>>> +            .uA = 100000,
>>>> +        },
>>>> +        {}
>>>> +    },
>>>> +    .proxy_clk_names = (char*[]){
>>>> +        "xo",
>>>> +        NULL
>>>> +    },
>>>> +    .active_clk_names = (char*[]){
>>>> +        "iface",
>>>> +        "bus",
>>>> +        "mem",
>>>> +        NULL
>>>> +    },
>>>> +    .proxy_pd_names = (char*[]) {
>>>> +        "cx",
>>>> +        "mx",
>>>> +        "mss",
>>> 
>>> Are you sure mss/pm8937_s1 also works as a power domain? It seems to 
>>> be
>>> a plain regulator downstream (similar to msm8226/msm8974).
>>> 
>>> Same thing applies to MSM8953 as well though and there we seem to 
>>> have
>>> decided to model it as a power domain ...
>> They have this at downstream, i guess this is why handled as a power 
>> domain.
>> vdd_mss-uV = <RPM_SMD_REGULATOR_LEVEL_TURBO>;
> 
> It seems to be just a normal regulator on both 8917 and 8953
> 
> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8953-regulator.dtsi
> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8953.dtsi
> 
> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8917-regulator.dtsi
> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8917.dtsi
> 
> Konrad
It is different between 3.18 and 4.9, 3.18 seems simpler and easier to 
use it as regulator i will change it
https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/arch/arm64/boot/dts/qcom/msm8917.dtsi#L1375
https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.6.6.c32-05500-89xx.0/arch/arm/boot/dts/qcom/msm8917.dtsi#L1655

