Return-Path: <linux-arm-msm+bounces-56946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF6BAAC443
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 14:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23E953BE670
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 12:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3FD264A94;
	Tue,  6 May 2025 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oLpwPYIQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33484239E7D
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534657; cv=none; b=DQwr9/LXPTRoKutlq86oQYRP2nE4t988F452oOiBKc0DMcTFuLD9iBcdJbbdvsbD/z96F/DxPRCSCeKxgCZ+GS8TCie9nVbg05YIMkXKwG+wG5QLyz69ekUZx8owr24uqdEEA7sgfaXRTiaDHPoTk3w0hy9+R840ZfeQquvx5rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534657; c=relaxed/simple;
	bh=pUiFaLwVBImBD5Z5Q5wY5+uOD7WzAbnbXpy7ntjFsRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IliFLmBqGgoRlsUitoO7saEdxW+mjtjUZl/U6tsuwaAqlRkyB3QjIgJYVaGn6TEyjZPOoZQg2IkIFQ8LVvylpg99eS+/YeHClhAqYWC4chAPz6v5jS6u5fCcqL/S4KokRjVr+pk7E6kLT4jGnaRssBvd+d5WE5kodwun7LL+QVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oLpwPYIQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546AdVSs015747
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 May 2025 12:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zf9K3mOYbxQlmis33OmEEWlzQK5/i/u1heT0zkBRk+M=; b=oLpwPYIQnTIuIuFY
	/LYD1XHNfDv/RpWZOECRHHUPXPASq4XeYas8d92Cv84vrVXj2O7tRFvhWCJd+qe6
	rGK+8tgFG2VyPhDzyJCMqcPabJGndzfCvvCuZGt1Kc0wuOKS/MxIyGDuwiDF9vgT
	+ADZ5zdRMDbm/ey01tKSMit1jZn40zyT8YNI3GOyHStslgHdXHhsfEtDa4/YQPHr
	JZyFAdMvhUVfotrCl6moJBo2+T6FH2gsMZt/SL6KwmGbS5lm4qugNStKCqx6EOtQ
	f/yQ/rlFoLe9FzgeZu9b/OhkXen/XWd64b8XOS+zacgOlfwkXCJqktOkuYCXXOpJ
	AtNDAw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fguuga7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 12:30:55 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-875af9a84d8so481569241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 05:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746534654; x=1747139454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zf9K3mOYbxQlmis33OmEEWlzQK5/i/u1heT0zkBRk+M=;
        b=ca6zt5LqSgzj5Xt1DBAuBuLOZfw8DWHwTXAuU0fUVsIRyZ7KRgdpKzpx7HH+ZNcNV5
         50+Za3MysPGxuoOh/Dvb6Kdj11/UEoqldWrRqG3VDwIRTlUoYrM3jZkspM/p9szy8slG
         t76nFCo4tewVnnHsMDX1Ev8uYmMIhut2CywTfi0XOQYnbzAJvP9dUYWv9EPukopn4ref
         u2ErC9yFNNXRnhhsTL0qPA1XfjPMcmtR9YXF1+5ARBmaw5zEgYATEhhYktAlI9bQgWA2
         +gxJ/FoByEOj54Kho3/JbYBKeYnGOt16ZUPIiZwFHMJUMBTdRqgAYZj3q+/URLtC8Gqc
         3nWA==
X-Forwarded-Encrypted: i=1; AJvYcCVtGpbM52ISLA+ybAwKHj61gs/uk/+K6wvJ5FIZk6O3dTl8Mk9lUEVxbRezbKl+y65fHVp9NvYu1ZoyUnVf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh+LkMWw174J9de5KtSjyHc/jOVGm0PptdC8puLBysy9M65E5K
	W0Iuw5HS435IMDC4WhZlPaq0Ginp1IB0d6n5ukEqua1WRGk5MH8OS0c2YbnX4vOeaotxPudNj7G
	5BZ+y6/cGgxDxtuekkPxFkKfIDX6mJK9eszSujoPIjmpS3mRx8oOUu2nkC5Ik5SoL
X-Gm-Gg: ASbGnctkB6L0jFSToUx5NSyekBIQKqHG8nZFKeWbj2N4gDuuXi9kKxFpT+ioSW7GKmD
	5wOUogzNUqN/R2bReXRSfEiWunnCmOhvN798mR5Z+LLJIqKf9z4YIzTCIwOZ2llRyceSRXIMgGJ
	OodL6AEQJhor3esU7JPTZcoQPfHknDSEZNitAxp0Lan6s6GNavNgqVn9b1FEmpDzc1uqBvqLSEb
	D4pMs0Sse3soFbZK0eH7/6ZqprCzpFnr0az9ip1hIox9B+xPCQ51xsqNPv1qbrORqgpgDo4Sazx
	I06GaDqYSBYWk1VXvNOO8n6z+0t910NoL97JUQZEei/ZSkXz6ZEcaaD8WO2O6iDCrSn9WlZ5zW4
	pMB0X9VAnWjB6CdgbAeSuERJ0Gi4jxsPTvz3auTm2DWpia5ooPjosz6yCsKUw0BQi
X-Received: by 2002:a05:6102:15ac:b0:4c1:935a:2446 with SMTP id ada2fe7eead31-4db14917a78mr5787045137.19.1746534646455;
        Tue, 06 May 2025 05:30:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFl0Q2w7zijINWE2ixlFEP1S5My+wFHpW9gXB3O8n/p/EyB4MtNk4FENIPHd0FclYiNsRvgrA==
X-Received: by 2002:a05:6102:15ac:b0:4c1:935a:2446 with SMTP id ada2fe7eead31-4db14917a78mr5786920137.19.1746534645868;
        Tue, 06 May 2025 05:30:45 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a5:4d95:a005:8dc1:eb95:a448? (2001-14bb-a5-4d95-a005-8dc1-eb95-a448.rev.dnainternet.fi. [2001:14bb:a5:4d95:a005:8dc1:eb95:a448])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202a89f258sm20012021fa.75.2025.05.06.05.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 05:30:45 -0700 (PDT)
Message-ID: <a100a875-4951-40e7-a516-59040649f218@oss.qualcomm.com>
Date: Tue, 6 May 2025 15:30:43 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: Add support for QCS9075 RB8
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-5-quic_wasimn@quicinc.com>
 <vr3q2c47ht5iebf7nvy3qywoxlquwma3p2tffswrefpmxqy24h@wrfecu6mcqcn>
 <aBoAjaI6nDvSyM/v@hu-wasimn-hyd.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <aBoAjaI6nDvSyM/v@hu-wasimn-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UJPdHDfy c=1 sm=1 tr=0 ts=681a00ff cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1Ca4EbaLgH0oIYhIK4MA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BoeYm5CzmvIj5wNDEHQ52erIUAOIVhP5
X-Proofpoint-GUID: BoeYm5CzmvIj5wNDEHQ52erIUAOIVhP5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEyMCBTYWx0ZWRfX55UrGkb+4YR3
 7vxcbHJCKjt8HRGjrtkD4d03z4c4b5GYdxeVZduAE1qFITnYyq/ES8eRwEMXArqxjRxrd2/t0Bs
 pZZBn+8AcT4xQ5XZz19ioor9RxQNMJPLlil/Xv1Dd/CQTTYo06OR3S/p8YiOF6sCkTgnyrJGEf4
 hRCU9dE8KPMjtZmlDYAs65Ef6MdRjcdmtiyr1aqUjXRHJ3f+/68Sr3HZ/GdnpTRBC/olWDY2D3E
 xqYGmqq3uQWje8oluU+7BPxxoF9Pr8Gbe6wJV4x6cGBY0K3ZPEooeQ713lJQqd3lEu1Wup7AV1J
 x9uXJTBFA9UnFToRhkJjjRf/SaMz99Ym+RVAB5lRe22XwyGsbhdG/vRmAATbrKEyQnM/kXyUHS9
 jomrWe6DCd24KdZeR/HN8SCKkCSGQ/wTw9rwJmx+kQE4przHejVgQfptVcmB4yC0pY9Vyr6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 impostorscore=0 mlxlogscore=900 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060120

On 06/05/2025 15:29, Wasim Nazir wrote:
> On Tue, May 06, 2025 at 03:08:17PM +0300, Dmitry Baryshkov wrote:
>> On Sun, Dec 29, 2024 at 08:53:30PM +0530, Wasim Nazir wrote:
>>> Add initial device tree support for the RB8 board
>>> based on Qualcomm's QCS9075 SoC.
>>>
>>> Basic changes are supported for boot to shell.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/Makefile        |   1 +
>>>   arch/arm64/boot/dts/qcom/qcs9075-rb8.dts | 281 +++++++++++++++++++++++
>>>   2 files changed, 282 insertions(+)
>>>   create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
>>>
>>
>> For the next submission please include at least the UFS support. The
>> board is pretty useless without the actual storage support.
> 
> We will be adding UFS change once the basic boot-to-shell changes are in
> place.
> I have already pushed the next submission (v6) here [1].
> 
> [1] https://lore.kernel.org/all/20250429054906.113317-1-quic_wasimn@quicinc.com/

Sorry, I missed it because of the rename.

If v6 gets resent for whatever reason, please include UFS into v7.

> 
>>
>> -- 
>> With best wishes
>> Dmitry
> 
> Regards,
> Wasim


-- 
With best wishes
Dmitry

