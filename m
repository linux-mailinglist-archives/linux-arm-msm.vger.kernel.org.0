Return-Path: <linux-arm-msm+bounces-66408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 527E2B0FE42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 02:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7912B176956
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EC217996;
	Thu, 24 Jul 2025 00:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cU3dguX1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D52259C
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 00:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753318116; cv=none; b=J9gS48rCHKPHsxDgTOqC0tFWsAu/3uj9EE1IS67jp1neO+PIqg7N+c+UwIyt+u+1Hp/uiYhL+lhrtGrpvP0QRP4Jbao3N5rwmvMkiqk4qTWSAZB8vFlZsyozXgRJKrrgL6tDVyIvw5nbBi6VxjlCJlmzkFmYun/Ww7sJXxweqII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753318116; c=relaxed/simple;
	bh=5Y4+1OYJZAeHUPLBYQx8kSVooxsv7DlVmjvdbv3x1uU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uoQYvrMK1KjK8RyL5zNPB9J/TVoTZaMJ5YspFON/jdBjnYkQTDboLDWzmA1JHlnfT55RUweekxUX+tPUFNWfh+ZYX9FD0xklf3LOHRc1OyarVKIZs6W03T4QN7GAU2Z9bBdWFSiXoO06gLyboQuCqbcQ+kz4xqx4ZqvH17o5FwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cU3dguX1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXYmG031400
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 00:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iv9yjSoPymrEhpWFY2OCTVKnjOfTrTpo4a9m/IVzyY0=; b=cU3dguX11UZN5kLs
	bWHz3I1Ole9ar5grt/PZITtZqkyNZMKLSKB8/Ktf01mfoonsq8ctGXLwt+xiI8aR
	ZRX+hdJxrbgU/sRfw7BWwEGwAe3vsqIUOhVLLP5OXjzx5D6xN/b2gpfx+iWP9r7F
	15rTgqEYBQnyfgbef1BjBB28px+z3pMxut1rC9X8fybYVhZ5v8DRHfVrMoMxrDEX
	Bm0k8yrz6W6P524TT/Oe4OxVtJ1z0ocn0O+17+au23QRNr03SIETwAjvKtaq+Bm8
	T5kSM8/mvIvnsizDcSZLeJHoTfqezxf2mQ27xPkYV1CSv2UbSwybLhL90oVcNBmn
	i0fD8g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vd9wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 00:48:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2369dd58602so3989045ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 17:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753318113; x=1753922913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iv9yjSoPymrEhpWFY2OCTVKnjOfTrTpo4a9m/IVzyY0=;
        b=uWb3aoc3yRzEH706avyp0AZXUpZ679dvf2kiKY4JE9cqABPzUzp6ZIkxujoTMybH6K
         8XVtIlSxeZiNxtE26syOLgvLIpEbNaXfxEycTcP+X9BxefIMatq/LloG330KYOYLmCz5
         vkYNZ2ju3A8zkhgC72JQAouWiYpnwYiOmWjfJOgp83gpFmHMQrDwbgJfmpvlZp5Zv7XD
         baHvb3puNVaka0x0wYIxouA8MxlVC8JSXw2rylF3q6SRbklJtZnvqmjeg2/hP5nYRghr
         XDtLHCFWc6Q6BS6CC9W6GGHOwOmilxTXJinSIlYZCxmSZDcX7wOpBgsu4viagpa7Woop
         62Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWUDUJZ9w90ZabgwM50qJJg4FzL+/N6xQmUh9AKjUq+lnyZgCVplhTgrhaVDX2ECN5ILzV6o9ZujzL92Ryw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb2mlq/ps6XB/T5RXwlgFUZ3g9KsPdJ/cqtpADmaTkwVmtJqGk
	KSGVGX80X6gL6KYtqacohTcg8eeTrnIudO1InxrGwVrjWwsa93sUX89dIJ2OPNy0PsEXG68UwpG
	CSdX0eKxhNdW/PigPSCDKU1FEOQH1fD19MtsEimPE5y11RajrPtYVK9Cvq+H9Dzh0oy0b
X-Gm-Gg: ASbGncsiV6PuU0OFOvHRkaFp4jEQYEuwFQw1pduCjS520FPgL2ATvopFaHojCNtpUYQ
	bbP85S1NWD6XIpZqSsGu+SIc33HORcIAhsofzeN7p0KV6LL7QEwPOnqmVrp6vTs+6mcm+v7/PwZ
	pk6wFvCIdJavLW/SdnXhNCOayfu9j7tRBx9BGSXO0yChTdV7yMISI/ZXmLNL/kkxsQwx3yBVw3E
	7iVj9x46N91cB63HDt40QqtMfSuLu6GvuiyGRA8K3B4uEP1FJYTHm6OKZX506KO7GpDg+b3OdgA
	IEA451kjuC332E+z9Yy82eHfBVomhZUnvtMMFupXzNeRp4wY392L0Z3SqSSJcKGl0G4hs6TvOgp
	oYO8B9WWcsD2z/n/7yyJjZ768xCM=
X-Received: by 2002:a17:902:e80f:b0:236:748f:541a with SMTP id d9443c01a7336-23f9808e0a0mr65325975ad.0.1753318112931;
        Wed, 23 Jul 2025 17:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtgVjVnQZl9R1khr6bvXoxGlsAxZOVo2vw1YbZ3PlcB22TMJrQHHVvMIcFioMt5XbHmkOknw==
X-Received: by 2002:a17:902:e80f:b0:236:748f:541a with SMTP id d9443c01a7336-23f9808e0a0mr65325605ad.0.1753318112460;
        Wed, 23 Jul 2025 17:48:32 -0700 (PDT)
Received: from [10.133.33.58] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e66270ee5sm17485a91.11.2025.07.23.17.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 17:48:32 -0700 (PDT)
Message-ID: <83173ae4-4e5a-4bc9-b02b-6cef26489148@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 08:48:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
 <20250716-hamoa_initial-v1-3-f6f5d0f9a163@oss.qualcomm.com>
 <0f9eebfe-21f8-48b8-9b49-a35126aa6dd1@kernel.org>
 <67ca3b6f-3cd3-430e-886a-0443f6d630dc@oss.qualcomm.com>
 <miiod6ft7iavg64q4f3uwcnztamgvt46gcguean5atsqi5d5us@xrwlzznsgx2z>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <miiod6ft7iavg64q4f3uwcnztamgvt46gcguean5atsqi5d5us@xrwlzznsgx2z>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -DGNtgey4zrmmYMvWHsuhVN83x-unk7H
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=688182e1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=6jahUQGBau2IMRXzWEoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDAwNCBTYWx0ZWRfX6DmwKCdC1t3p
 865P42mVt2C7mQ7VFlSierEf6ZeUnZus6/XUwfACP9neSjOb/+Cvhet4S3v02+JzQfgHGrw1pEH
 rnZa2VJEXCkmoS2qRZ9XMIaHzhaD5+ifo4sDqedndqmp+s4nEB8aYH6xcHPYyb1GjVyRQZnW+9d
 ZbKl7bqugCWzT4TJrpGQV2cic7u9RRjC8sb9i3yQbdbA1tonaWn3qDY4NN0w3yo7Cx8buymNVj6
 rEf7hB+DpXfMWbhc7jvP7RQb/HEKuaT7rKzzkwXHL2QGx9riwHrZv8yWPp0t28tBLIJml6WdX84
 E+jcxKF4wnQWkaSR/+kB8fvSG0mtxrcGA1rr2Btb8HB4WWI4pQQepAdY7uQ0loL2G2ll8wu8y82
 h2TQCAI8TEKMQnbM1a5Ju027d8+Meffr0hsf863k6ooi6CAwv+FYMgwrTHX7rtjHDqTSRxVO
X-Proofpoint-ORIG-GUID: -DGNtgey4zrmmYMvWHsuhVN83x-unk7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240004



On 2025-07-23 19:26, Dmitry Baryshkov wrote:
> On Wed, Jul 23, 2025 at 02:44:14PM +0800, Yijie Yang wrote:
>>
>>
>> On 2025-07-23 14:28, Krzysztof Kozlowski wrote:
>>> On 16/07/2025 11:08, Yijie Yang wrote:
>>>> The HAMOA-IOT-SOM is a compact computing module that integrates a System
>>>> on Chip (SoC) — specifically the x1e80100 — along with essential
>>>> components optimized for IoT applications. It is designed to be mounted on
>>>> carrier boards, enabling the development of complete embedded systems.
>>>>
>>>> This change enables and overlays the following components:
>>>> - Regulators on the SOM
>>>> - Reserved memory regions
>>>> - PCIe6a and its PHY
>>>> - PCIe4 and its PHY
>>>> - USB0 through USB6 and their PHYs
>>>> - ADSP, CDSP
>>>> - WLAN, Bluetooth (M.2 interface)
>>>>
>>>> Written with contributions from Yingying Tang (added PCIe4 and its PHY to
>>>> enable WLAN).
>>>>
>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>> ---
>>>
>>> As pointed out by "arm64: dts: qcom: hamoa-iot-evk: Enable display
>>> support" this is incomplete. Adding new SoM or board is one commit. Not
>>> two. Don't split board DTS, which is already prepared/ready, into
>>> multiple fake commits. This is not a release early approach. This is
>>> opposite!
>>
>> The inclusion of display support was not intended in the initial patch, and
>> it was not ready at the time this series was submitted. Since the display
>> patch set was not submitted by me, its timing could not be controlled. If
>> preferred, the display-related changes can be merged into this patch in the
>> next revision to maintain consistency.
> 
> This is neither merged nor accepted. Please squash display (and any
> other possible forthcoming changes) into this patchset before reposting

Sure, I will.

> 

-- 
Best Regards,
Yijie


