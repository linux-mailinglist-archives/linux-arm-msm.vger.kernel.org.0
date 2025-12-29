Return-Path: <linux-arm-msm+bounces-86853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4517CE6D4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 14:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7899300A1D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEAC427AC3A;
	Mon, 29 Dec 2025 13:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pno9aEyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPbextb8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297DA1E9915
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013645; cv=none; b=F9R9j7+USUVgh5H/Szu/NixfvNw6RmpO/CCEg1Ho9EZXA5da9TiCkO2pveRfyePRoJ8n1rk0qrCDNdql5GBVHMNhw6s5LmbF1yUF4gtD9UDl4kvyeqSRbBYp3jFBDmhulDbwoXsc5xKq9DnkYarmAfA75DV18EBtQv4LzyfeMmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013645; c=relaxed/simple;
	bh=zdvJxQzO/rWhAhkyvIdr30asrrQown0e1m4wJJqQ+/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e9WbEI2j5MtRmdemi6lxQ4Ou3J3aXt9+qvRQDvmWe9TAJYciyJB72yQOjAqyT6OLbtQtCPpPGBAluwrERGn9uqo8O7kCNm8HubtkcX8r2+P99RYIlPg2W3bZcknD50phICcXc/KviWHw164QXRKQlav72jXHjvXggH1SRShHr84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pno9aEyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPbextb8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAHLoR4101488
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zdvJxQzO/rWhAhkyvIdr30asrrQown0e1m4wJJqQ+/I=; b=pno9aEyI46qnJwmw
	ktz1Tx1vSLxMdxBhG1OCxH3DPXwNt1swO/qgQqS6wS4VgTMWMNKOAFGiKRMcGhC+
	lFZEKTaUDTpEL4ycRz1/3TyMsf9d4KnO6WC9CJQAVzBZn3bhiqChHBSUNmFzM5fR
	J+6rjteT8TDcwtJL8ts4fb3Q0BdunQXFOl/sNeS++jCOoeRQCAp9SSj5sCPtlgC4
	bfPLemsbAwd3ECeYYIfYxXsxJBRadb6AHHPj3QivQyIyA/WMNFWJK8SAclwLlq1X
	MfU03bz+9rt8Vose9u+0AvMDRKlk9Xy0tEZXR4mU4k79PUZK5QrdNrp+v6psq85r
	DpotRA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87bvd3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:07:21 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6467dac38deso1658993d50.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 05:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767013640; x=1767618440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zdvJxQzO/rWhAhkyvIdr30asrrQown0e1m4wJJqQ+/I=;
        b=BPbextb8XIAxGilmv4w0KJke7dESO3XsjY5gtWkNgvhLeQIKDiysLsuxxM0nA3EYPl
         o+fqwZVqAictMH6H9r10y/B5371B3OrzuBpf7QwP7Ea3pL/7KEirxufsi/f96ijJeH+d
         Pw3mmoh0rKkpYiv4LMvGVubQ/LnM9PgLBfRT0r0kwLwVlDv5VMbbQGcNYeHLkfv+WmhO
         voWi8w8r3A18yei+m9RcvokouW8yRctVgNgIJ4qubnoio/Ru209Rk3B18o8LxeZiqVPN
         i1dPK0Ff9DCqeEYdX43OQXWUfz34BiQW324EN8YU5I2gMsyvhwCXld4E0fGDzsIkvIoz
         izOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767013640; x=1767618440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdvJxQzO/rWhAhkyvIdr30asrrQown0e1m4wJJqQ+/I=;
        b=qe5dlFUqqfvfXEmip9iLIMtPVEzxrJilb+Rd1JQJLThLavwQKb2Q0qpOFBU1e5rF0J
         l6B8UIoK11Dj6zamc1b7LJrciMowcCJTm//nx9LOZiB8JxkMKaS0NICBpNwOAIx/shLr
         Ux/QcUf2VFsApy9pbnYRJfvAlpnSUXyCHREPKOWOUbCWqldmN3ZxWXvcbOnt9UdVVXKn
         ARkxENYBGrWyyRHbfv3zCpJsBIOei3/FtP0C8m6L9LgD0TjELxE+aY8NMuLD0oq0bnCw
         DGUSF2M60uBnc+KfWJW9FabtayjWFCC93KrTxs/hwE7G+RR7ZpQxe3hL3xv77GunumNr
         9qVw==
X-Forwarded-Encrypted: i=1; AJvYcCXsy1T7kHLGG6vOpgrD3+HQcMCK150WrsidOcYRppXPW2rprDJhkwshuSnqWK8m3+l1RN+u5874utnVD87o@vger.kernel.org
X-Gm-Message-State: AOJu0YyKkxOumkKE8ppioARhq6U4CTWsKuhzhUVZrRB7ySBIo9L9Y+Wy
	91vuqdd6FfQvvFjUONz4fHXiCfFPYUrGw6wfL/SzrCI5u3XMjRX4E/tgRH0Po7N1/SjIp2YCNGp
	9y9g8xtHCONveJdHztgm+iwv0mHjegxLK64uagWIgMV70vlpVF56rJkISC3cf/itx5TnGURwwB1
	qv
X-Gm-Gg: AY/fxX6cGVqbBMyABss0WoGW4Noa1FUKkzN01Qum5RZ2nv/ZQN909HY3fuZ0QbgMBM1
	H5gTBHe0rIdkQqHHTFQGmqTESJjCwzXCwYeH/3FUTlH9ix1qkRclSFfenE33alMzjSk4vh7ckhw
	Bj2buiPnNx3hWMD2yv2uDhDGUS2rw+FbFmQPmFJUGDAbKpuxT3edENjE496Y1e9X6kNqk+7MDxy
	gqGVA24mh41t8NSsHydS+MXD/MTrVcEFSHTGQ4MilR/VQMEvsDzdy5B35mpwcUJzbKQGimMPiIL
	CFn/ZcyICs6iYyHNTl4WTippbJy+xPTeWkivhA+tDo4bMrBMK8q5WuDAnSogmJzMfKeP1Sq8mSN
	go937fKPtw1cEslhEmmZxRf63F1mZYuGrdAPgjIHrAGXoHZh2CAG/51IWYbiLTXzj5w==
X-Received: by 2002:a05:690c:e3ec:b0:78f:ca4f:8371 with SMTP id 00721157ae682-78fca4f8bb1mr199181477b3.6.1767013640434;
        Mon, 29 Dec 2025 05:07:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEy3p84RwWWItb1yLlZENCGES09seo7LctTTnqHspSXASL7VcpB3FajKFabINYyB3Yt8fV8og==
X-Received: by 2002:a05:690c:e3ec:b0:78f:ca4f:8371 with SMTP id 00721157ae682-78fca4f8bb1mr199181197b3.6.1767013639787;
        Mon, 29 Dec 2025 05:07:19 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de142csm3264454166b.38.2025.12.29.05.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 05:07:19 -0800 (PST)
Message-ID: <10bc67e8-e9e9-491d-9e38-4b55735d42fe@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 14:07:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] remoteproc: qcom_q6v5_mss: Add MSM8917
To: barnabas.czeman@mainlining.org
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
 <20251228-mss-v1-4-aeb36b1f7a3f@mainlining.org> <aVJhH17XH1srlroL@linaro.org>
 <d531f1346b59af06c323f393883b1d13@mainlining.org>
 <2898fde7-2b3b-471b-8f8f-a02cb6953aaf@oss.qualcomm.com>
 <eeda5a8b6f5a9dc5cf5440afc07c40fd@mainlining.org>
 <d3ee6ba3e66706c304ecfe6afc4b75f2@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d3ee6ba3e66706c304ecfe6afc4b75f2@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0RyyREPYGxFR2t5JLKJ-5ux6XrUjKQ74
X-Proofpoint-GUID: 0RyyREPYGxFR2t5JLKJ-5ux6XrUjKQ74
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEyMiBTYWx0ZWRfX922BNLE3zNF6
 nZVQ2etH4TdBVxMZsQXfzFNpFCv9ADxqsXyFz7onPevDmxWMMYYx1+TNA/fd/dMku6+V9wLCK4P
 5GBGSOb4MjyyMc9sJqUaCTBnfH1qc5B3kUFbstaK0CEc/LqWPwgMs+PX8f4+Zi3vynoh3ibD2gX
 NgpvqVYgZ/eHfPuPmSD++KEXiaVTh8sS8ITBvk4oL5R08bhB4FuoCIb5RT7MRPXm5shQXKZbtCE
 wHOME/NKcH5/jEeCeFgearSmtESCHFP51fk9qfdSvGSHW0uDXzcl6DsaIM+m59CjYjmTj6WcZqS
 5tjKThTGYrve6W4cMk/KHvcP0F5g5tFYKo81r2F5x0vLOIydMwGkzLfIe11gYXUNAt6nVF/fYrG
 g8E97rOBJ1qA0Cl0vtGI/mMUWn7FzbLyKQi3lS5rIXjA9kL/6h8FNzUJopygr3894xZU/K1I1Qc
 gR/qT/6S4EM6eChz0Tg==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=69527d09 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=qC_FGOx9AAAA:8 a=OuZLqq7tAAAA:8
 a=2IBVnRfEnaAdcxqTa4wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22 a=7KeoIwV6GZqOttXkcoxL:22 a=fsdK_YakeE02zTmptMdW:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290122

On 12/29/25 1:59 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-12-29 13:51, barnabas.czeman@mainlining.org wrote:
>> On 2025-12-29 13:40, Konrad Dybcio wrote:
>>> On 12/29/25 1:33 PM, barnabas.czeman@mainlining.org wrote:
>>>> On 2025-12-29 12:08, Stephan Gerhold wrote:
>>>>> On Sun, Dec 28, 2025 at 03:21:54PM +0100, Barnabás Czémán wrote:
>>>>>> Add support for MSM8917 MSS it is similar for MDM9607 MSS
>>>>>> only difference is the mss power domain.
>>>>>>
>>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>>> ---
>>>>>>  drivers/remoteproc/qcom_q6v5_mss.c | 46 ++++++++++++++++++++++++++++++++++++--
>>>>>>  1 file changed, 44 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
>>>>>> index ffafbe501a05..2579558fb567 100644
>>>>>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>>>>>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>>>>>> @@ -259,6 +259,7 @@ enum {
>>>>>>      MSS_MSM8226,
>>>>>>      MSS_MSM8909,
>>>>>>      MSS_MSM8916,
>>>>>> +    MSS_MSM8917,
>>>>>>      MSS_MSM8926,
>>>>>>      MSS_MSM8953,
>>>>>>      MSS_MSM8974,
>>>>>> @@ -749,13 +750,15 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>>>>>          goto pbl_wait;
>>>>>>      } else if (qproc->version == MSS_MDM9607 ||
>>>>>>             qproc->version == MSS_MSM8909 ||
>>>>>> +           qproc->version == MSS_MSM8917 ||
>>>>>>             qproc->version == MSS_MSM8953 ||
>>>>>>             qproc->version == MSS_MSM8996 ||
>>>>>>             qproc->version == MSS_MSM8998 ||
>>>>>>             qproc->version == MSS_SDM660) {
>>>>>>
>>>>>>          /* Override the ACC value if required */
>>>>>> -        if (qproc->version == MSS_MDM9607)
>>>>>> +        if (qproc->version == MSS_MDM9607 ||
>>>>>> +            qproc->version == MSS_MSM8917)
>>>>>>              writel(QDSP6SS_ACC_OVERRIDE_VAL_9607,
>>>>>>                     qproc->reg_base + QDSP6SS_STRAP_ACC);
>>>>>>          else if (qproc->version != MSS_MSM8909 &&
>>>>>> @@ -817,6 +820,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>>>>>
>>>>>>              /* Turn on L1, L2, ETB and JU memories 1 at a time */
>>>>>>              if (qproc->version == MSS_MDM9607 ||
>>>>>> +                qproc->version == MSS_MSM8917 ||
>>>>>>                  qproc->version == MSS_MSM8953 ||
>>>>>>                  qproc->version == MSS_MSM8996) {
>>>>>>                  mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
>>>>>> @@ -826,7 +830,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>>>>>                   * Set first 5 bits in reverse to avoid
>>>>>>                   * "inrush current" issues.
>>>>>>                   */
>>>>>> -                if (qproc->version == MSS_MDM9607)
>>>>>> +                if (qproc->version == MSS_MDM9607 ||
>>>>>> +                    qproc->version == MSS_MSM8917)
>>>>>>                      reverse = 6;
>>>>>>              } else {
>>>>>>                  /* MSS_MSM8998, MSS_SDM660 */
>>>>>> @@ -2538,6 +2543,42 @@ static const struct rproc_hexagon_res msm8916_mss = {
>>>>>>      .version = MSS_MSM8916,
>>>>>>  };
>>>>>>
>>>>>> +static const struct rproc_hexagon_res msm8917_mss = {
>>>>>> +    .hexagon_mba_image = "mba.mbn",
>>>>>> +    .proxy_supply = (struct qcom_mss_reg_res[]) {
>>>>>> +        {
>>>>>> +            .supply = "pll",
>>>>>> +            .uA = 100000,
>>>>>> +        },
>>>>>> +        {}
>>>>>> +    },
>>>>>> +    .proxy_clk_names = (char*[]){
>>>>>> +        "xo",
>>>>>> +        NULL
>>>>>> +    },
>>>>>> +    .active_clk_names = (char*[]){
>>>>>> +        "iface",
>>>>>> +        "bus",
>>>>>> +        "mem",
>>>>>> +        NULL
>>>>>> +    },
>>>>>> +    .proxy_pd_names = (char*[]) {
>>>>>> +        "cx",
>>>>>> +        "mx",
>>>>>> +        "mss",
>>>>>
>>>>> Are you sure mss/pm8937_s1 also works as a power domain? It seems to be
>>>>> a plain regulator downstream (similar to msm8226/msm8974).
>>>>>
>>>>> Same thing applies to MSM8953 as well though and there we seem to have
>>>>> decided to model it as a power domain ...
>>>> They have this at downstream, i guess this is why handled as a power domain.
>>>> vdd_mss-uV = <RPM_SMD_REGULATOR_LEVEL_TURBO>;
>>>
>>> It seems to be just a normal regulator on both 8917 and 8953
>>>
>>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8953-regulator.dtsi
>>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8953.dtsi
>>>
>>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8917-regulator.dtsi
>>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8917.dtsi
>>>
>>> Konrad
>> It is different between 3.18 and 4.9, 3.18 seems simpler and easier to use it as regulator i will change it
>> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/arch/arm64/boot/dts/qcom/msm8917.dtsi#L1375
>> https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.6.6.c32-05500-89xx.0/arch/arm/boot/dts/qcom/msm8917.dtsi#L1655
> Only question is left what about SDM439 and SDM632? They were introduced at 4.9 maybe that is why it was modified both are inheriting
> MSS bindings from 8953 and 8937.

Seems both are the same too

Konrad


