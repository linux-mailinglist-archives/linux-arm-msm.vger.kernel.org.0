Return-Path: <linux-arm-msm+bounces-87386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8ADCF273B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 09:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1282A30010E2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 08:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F2632ED24;
	Mon,  5 Jan 2026 08:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wo5LBwnd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aUb6WKnF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6BC32E744
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 08:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767601471; cv=none; b=HMaS94lPIF1dIdxpKPS8aUg/6s1o/QuRG+dgFIVZzLLyNUw0+UB4e9IXKy5n/pTZsM+0wEQKc5mWhslmZ17VJa/ycl7yiqRqZW4Uc+ZjS8y4yZKKjIkP80SUIzucELwhBE+nf5pX1DApBI+Blzw5ngfX9uZTdpU1XRem2tUFmfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767601471; c=relaxed/simple;
	bh=34OIG/r5tJDxLSKFC9am93KFoxKyf7Of7Y1qEPS853w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YoLVuyvq/7Tb5wojsleu9hoBrsZ1o3LX9t9LUze1Fd/AP5JJwMUpRT85HV5xSBDg5mWLpZO7iW1sVniNYElQ+qBafS2N0+acibuRtytuP49YeAsVLYS18Phbm5BCDiaj/FsbPq8PogIuZdlL6vCwO+Jr57urm2+IxEuEIusNtCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wo5LBwnd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aUb6WKnF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058N58M3875883
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 08:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HuYTco1pdesWof3qBaC16jT7hsIpZgPWEbATFiSF4es=; b=Wo5LBwndaCg6o3WJ
	0z6yjntH4ImibCo9C8BLre15W66pgkBHneIUDMsqM98c7SYfG8tkYyyLoVy2VVed
	vej/TeM/utRRlc0bzoYU1MQea5A9m8tDTPf2CSsTdhalSKQHb+CEK3FfOEhfAmM/
	+aJafivBXz4Gxxx/G+DyRL6VfGKshWNEFIINPjBBX+Z11MNsM3eb2jh5o6VbNRh7
	4eXjge/4WJbhqdtKXd9d8nBz0KEBZiNN59cCD2wCUXEk+LgT9fdcdmLOh8ytaac3
	jbPWwgkCp95BVOk87CfdtmJiH0MzMXrYTuo6ELhrgt+D6P79opyM1ZbhS0GgoRD2
	iKoyog==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bfyx0h91p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 08:24:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34abc9af332so4461318a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 00:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767601468; x=1768206268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HuYTco1pdesWof3qBaC16jT7hsIpZgPWEbATFiSF4es=;
        b=aUb6WKnFYrpMcBZo5iwlQm+G1+tAAViMcfM9IGELCIZlDOUqradRpQ583hVBTQRGl8
         Oev4Ju+5mSleQDt8p9wab0h8qMiiDPfYUcMrtzbscMPHuQnSDO5xdNR3PzRzMbYLi2Rw
         VK6ce9C0Q4LzVCcKvnCNBzjNsmNpqTShRHQDa4djZaG7J3RqPbfRyr6KgO2KDUzCFPmK
         weCQwZ5tUJ0TA44X98phxQGSgHVbvhVNe3NyrLAb/X77/VOq9aywqyv/gCw1l+uMT0FC
         CwK4FHzo0NH69YLB23q2FpKNF20k/FZcoLEBm4gvVC3arivPpa6uaZVmRGq6ZiWvt4zy
         /ljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601468; x=1768206268;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HuYTco1pdesWof3qBaC16jT7hsIpZgPWEbATFiSF4es=;
        b=m+jMEjjuyFyC4dHMzIhYCoTrttTlhUGTFp09nMWXaM2j2CEFgYG00srRRAVl90h7lN
         XmIANNLwOK7O/PUUaIG5whaDvT7i18VuTTIv2NJtp0ew5O+H9HHcoa4PXPyGXsZz+3x8
         5PfAgpDkg6IVKRKSp0sxoX23JQgr6hAzhHbkTvO4Fjyz4kqyNMzKI9PnY7E8EUeDAD8P
         ZLd0iLfSJiBVTqATeyxBhOOnhC4Ll8cLiFqjm/s8OM6U88bxfWINBhz2o6ONv6WjzIbe
         EQFfNFc3+LYDfN20CBPHmQPIHvT86sBoMoaGsgA2I+qguvRV8u1dSGHs0eYXpi6G/ij0
         xSVw==
X-Forwarded-Encrypted: i=1; AJvYcCUuM9nlHnG2CTD1oolC8dQ+axf2m99jS9w3sWevsbVDou9ulYCChJnZfA8x0RqDTbzmI/QClAXyy049p7vZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyC6ENhD/uLNTLzfc3Xa6n1jfSlzCw2P9xBnUFRAKW2dSsjWzAg
	3Bs29SKbc+6wIfFAy6fGdKDhMp4V2YM6ccZwMInqejbVoZdrDBgJ7LDogzZd0C9h57ofyCR6vpF
	ZWLFD5oH+68YI4Ta6TI3ugVVB30U/XukkzsLGu6yiipwOCm6lXbo83ypF+cd7n/HfbTDr
X-Gm-Gg: AY/fxX6ULbIVegDhdXtK/sx4ekXKOt+yJyDom/K0WJdABe5fq9kx97D1SstyqKnJXWV
	A+jdPMSHiweO+hEjZ3DRnnSMJt33ANfJkfsmUDHhyklotJNCOi2t8fHaiG131mTDMB+K+ZyYgOO
	qG6aPtaxl0sYGnZ2C2tYBG5hGptTesNWgBQDSHpZ3d23giCjvlA28kLCeJBgaliEO/4MO+QdlMb
	dVrqmnRGzzhHxr2HVzxyxQqLxwmfV/V4o1PHzvpjm279dV7VSw9243BgipDWURq6tSoi8VSLk2Y
	t17SGlAtTG4j1Saqv9VdFI77/J376sLekJKm4frxvFi1RdqCJHa263nXq+dRVnCsAPgxEtDSTVt
	8VE/dBydaw+hNBG4LAwu35/u5NrLy2UQhPlQ5bZzuos2Be64RJnXswfPuZSjUR1VIA5LOwVdKHD
	Q=
X-Received: by 2002:a05:6a20:6a28:b0:36b:35d5:7c64 with SMTP id adf61e73a8af0-376aa8f3841mr31695332637.7.1767601467696;
        Mon, 05 Jan 2026 00:24:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbQSLUL0PCP7zJ0ka883IsPNt6V4C6UPp0RYxlzuaXVqZX4V7uvAsIwJ0eF2JQR673L8gV+g==
X-Received: by 2002:a05:6a20:6a28:b0:36b:35d5:7c64 with SMTP id adf61e73a8af0-376aa8f3841mr31695309637.7.1767601467095;
        Mon, 05 Jan 2026 00:24:27 -0800 (PST)
Received: from [10.133.33.40] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bd61b40sm42053521a12.23.2026.01.05.00.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 00:24:26 -0800 (PST)
Message-ID: <175e9c72-bde2-4351-a429-7d88d255100c@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 16:24:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: Add TSENS and QUPv3
 serial engines
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
References: <20251225-knp-dts-misc-v2-0-a8a8a31fd528@oss.qualcomm.com>
 <20251225-knp-dts-misc-v2-2-a8a8a31fd528@oss.qualcomm.com>
 <fc67634b-d47e-452b-bbad-35884b75d0b7@oss.qualcomm.com>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fc67634b-d47e-452b-bbad-35884b75d0b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CZYFJbrl c=1 sm=1 tr=0 ts=695b753c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-i4fF0UnBjl4ULLsyK0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA3NCBTYWx0ZWRfX5eMKyuiqYpe3
 wr6y68/z2pHZREQUqeiO2bhCThqHrHnnnHYWcZbYh0BvvgWbniiuwHqgcpyphDe9TX74KIZ1146
 sbUZ2OtKJSlrpp5/wDJPYihL0x8NhrIo2zt5vDeRvUcxu8KuFrazhOJs242fakZWrabOn7ZJoAi
 P8KEZV0p6McM07ViWJgbaX8XoQs6xuHUTNfMoqHd+wEheuV7y1Io9MwKEZ9UAN1qBorKpkAH/sl
 IEWJ6+SmQS8uWc2GiUjigRKIQ4Uz0DEVK6/MzjRukTLu1cwmoEwt18XGrVKUNxtRZsVaJqOMwa6
 gkY3lJV4f28oZcCY259CZ0O63vIvq3aX/qf6AVY67ep5DlkRBH0tHFQrva9p4fLPwnwvUwYqtyK
 mmuTshTeMu3vOHwJH10bZ2ICZRw9RoCVIuMqzBDm2Zm6yg9fjWYv9u1a0Vy+MPvsK9EQbprEahC
 2AWNtB7VZuGTADUr3Ow==
X-Proofpoint-GUID: tp6K2idZ_b-xuoU-yDLSKpuUKDOm2tac
X-Proofpoint-ORIG-GUID: tp6K2idZ_b-xuoU-yDLSKpuUKDOm2tac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050074

On 12/29/2025 9:12 PM, Konrad Dybcio wrote:
> On 12/26/25 4:06 AM, Jingyi Wang wrote:
>> Add new features on the Kaanapali Platform including:
>>
>> - Temperature Sensor (TSENS) and thermal zones
>> - QUPv3 serial engine protocols with 5 I2C hubs and 24 QUP serial engines
>>   across 4 QUP wrappers, each with support of GPI DMA engines.
>>
>> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
> 
> Since the base DT is now merged, all subsequent patches are
> supposed to be patch-sized, i.e. usually scoped for one feature that
> makes sense. This one happens to be an arbitrary concatenation of two
> separate ones. Were they separate, the original authors would benefit
> from the full attribution and they would be easier for us to review

Hi Konrad,

Are you suggesting to split this patch into 3 function independent
patches here?

The current dt series is to ease the maintainers' effort to have an
organized patch in one series in below manner:
1. And the series of the dt change will only have all dependency cleared
functionality in this series.
2. dt maintainer won't have any conflict when apply.
3. we will suggest developers can do it's own upload when basic
dependencies like mm-clock and pmic dependencies are all applied.

Are you suggesting splitting this patch into three independent
functional patches here?
The current DT series is designed to simplify maintainers’ efforts by
keeping the patches organized within a single series, structured as follows:

1. This DT series will include only functionality where all dependencies
have been reviewed-by at least.
2. DT maintainers will not encounter conflicts when applying these patches.
3. We will recommend that developers upload their own patches once the
basic dependencies—such as MM-clock and PMIC—have been applied.

This reflects our discussion with Bjorn and serves as a lesson learned:
even with a Reviewed-by tag, patch application can be significantly
delayed when the DT series involves a highly complex dependency chain.

> 
> Konrad

-- 
Thx and BRs,
Aiqun(Maria) Yu

