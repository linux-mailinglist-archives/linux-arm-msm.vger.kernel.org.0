Return-Path: <linux-arm-msm+bounces-80398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA0CC343A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 08:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E89E24602CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 07:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90493265CDD;
	Wed,  5 Nov 2025 07:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGL4kMix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kro90Op/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCFC34D3BA
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 07:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762327831; cv=none; b=bx/fWGbMv1ColfsU4H2A8MFqLS84997JrEYabG7txFGg0WaW5HQY/0cM+EiclvwhefA4XFC9rgqvGZW1oib+y9Z6+EPkAf94VQwGkqPR6m7yCDLYNIzjhtEa1DYJfFUFoFIhxy95SwuSxV1ZbH3pjx5VOp/u5180Nt/zVn4oeo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762327831; c=relaxed/simple;
	bh=YREQWGc/2Q767XLJHCmFYF4Zsta90az+yMFwmM0kJGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dh7iEjc+WGHDTnUi79cyJ5F83IbyKHkhD+xAB8SVzu5uPM9XcbN7Lhhvs9wz/ldYkzB1QSKkjmoM2dA5dzxKG8UEVteHvujcg2pS3DLzaEhRtQJaGuzrTE1v4SnG/GGO71IJqoYEy9aMH7dVpq2wtlA1bDeizKgIgbpP8NfLb1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGL4kMix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kro90Op/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4L9FTH3089266
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 07:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QT+WeRl22khRMpzgXolFoG5vQrtoq+N22GF4lGmy4FU=; b=fGL4kMix9e+yJyMz
	udj6vjMtpMqJU24Uwj71003LuaYyBXZsrR8eunApkjJC8Yr7ZjjfxjP4behokjdb
	G1S8oXC3Nsl4tTBiBpGTOEZbm/MS4aoamWwqkG+3BhKqxHD6tYoQA5s2Xb43Xvq4
	86hbZguRYF1e0/Ou21fi/h2uz6goODr2IPjlel2m6RlUcgX4zMjObuFWPiMPNX99
	XM/SHo4Mem/JiqDn+f5BDsDGOBHu/5D3xi9nV5ukR32bzoOFq/tPx4i8FRmEZvGF
	BHmUV1E5cO5II0OoSUPbaeuH2HeAuhz5Y4Mwof6ugNzDSG2NZgbRPmrkovCBwQYF
	JKcwQA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7s5e9gta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 07:30:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32ee62ed6beso10949625a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 23:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762327828; x=1762932628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QT+WeRl22khRMpzgXolFoG5vQrtoq+N22GF4lGmy4FU=;
        b=Kro90Op/rwoIScLoMM5iPujmExL7syb3VmeM9plCesAuJF3jX9mclKwFHhCvASCIW8
         KBmO0JRNXWbPPfGCpcLQVR26Cyd848T6FYWe4qRYuNlRW1b4UNF1JiSc9ZRAdvM7V6Kp
         gQbxquiyGDlFPdqBDkyWX9TUru4Dz2TCfg2BlVJEiKRX4Rh2KF+9YKZHF1Uvv6RoHsOT
         0NE2gyPZO/VMCyvFDanssVZ+mWdu2eX2NbBVpD8kvWKkNl4E/K0FSuYhSTtKpIu93tf9
         pKfihyMeWXpmeoFk9tWctihkaXPPKXPTTttjRNgwf+ohb9W/PdWqL0LtXNIUeGRoPJs5
         Wr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762327828; x=1762932628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QT+WeRl22khRMpzgXolFoG5vQrtoq+N22GF4lGmy4FU=;
        b=ZcxzWqCIATjJGNi5t7foBjDmmaB5D6PmHxxTrAoTv/Fp8pWPn8rhuF4A2HtjUMbx1z
         I0rf+pSWSLJGK7Zw5ji9hgsFaU8ZRd1h8QRAMYISJD/w/NS4sUS8+FbPgOMkmNXOtntk
         g/oTfYRFCj5g3GImlWWOoJkkRfwUwB8M1dMbSTAngq/Ujr8N8+xj0Y0hjlISGWm855lR
         4TjgbFdcUJgn4icAKVtG4SA8XMLzR0zZehP4LlOiU80A5wXV+oQNf+lyO5lpsYF9sUO3
         oszUFpgidcxXZwwGjH/vLWoB6REhA4UpFZyXI4L4Jhiy7U8KJ4f/dl0PRsVqiS0bzoUy
         84nQ==
X-Gm-Message-State: AOJu0YxAWBnMbbPTcJTFJ0nDz2zxin28pZQh3ehuO6q1wa2d93x/6A6l
	D9DAwopR9aA1tsXcwjfQEnpGLsNwup3buGbCI9OkF78K5ah5tgvszAQtoh51VU9IGTlwAarHZPW
	WoHN3ubDOpfrS5nnF7ZBuWPBrtUXdVvXBeH4jygaQbtLH0tr3sX0AnARnsJ8U+1P/jWRR
X-Gm-Gg: ASbGnctDcCWdYyly7i6cEdHXoXpRBL0jYzTpCRHsNnQh9NKxAEPMxcFf8h1Ekd9PlIU
	sYWLVnPO0D3nGsKLA/gNDaz1Oe5mSGmLecVhl5zGS4Rcg8IpXCaIcKDD/Ih7q2DELaRjRQsx7LR
	bdzsgV2b1L09yZVj+R1EFtypGyC0u2czT93PoRPQ8Z8FQ92meAgmmXOELpuBa9Hxi5S40qQtlwa
	3Jvj3q7JqjUYhTN7QpU5UaAkCyAPmg1foZSsdIXVn+xKDYJSMdMulHTeUnPPUnzbW/uWEG9crsV
	UC0yk82EW0LITz2IPkNuPyl5tWL73I0yyC0cg0hlXPJYoTy4q6VtmB82zK8JNQyiewd56nc2gL4
	2bg7wtikUbuR/h910dHZvRj161nEBOi7tAFZwcbS6rxEqudCiIwVAWvgNLm8iy9KC0lwL
X-Received: by 2002:a17:903:2348:b0:295:9db1:ff32 with SMTP id d9443c01a7336-2962adb2191mr34731155ad.48.1762327827926;
        Tue, 04 Nov 2025 23:30:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUfAxppeC2gM9zMiAF/5d/xEfVFFICiIOTAgszVGo7fSvW3WzHOyM/ZK3homH56+oZ20mO3g==
X-Received: by 2002:a17:903:2348:b0:295:9db1:ff32 with SMTP id d9443c01a7336-2962adb2191mr34730705ad.48.1762327827308;
        Tue, 04 Nov 2025 23:30:27 -0800 (PST)
Received: from [10.133.33.93] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998ff7sm50804145ad.44.2025.11.04.23.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 23:30:26 -0800 (PST)
Message-ID: <a8586851-7f71-43f8-a1e6-6f8510c2985a@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 15:30:20 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] arm64: dts: qcom: Introduce Kaanapali SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-2-3fdbc4b9e1b1@oss.qualcomm.com>
 <36fcea98-06a6-4ca7-a378-77b44b196a9d@oss.qualcomm.com>
 <7fc6ab09-44c9-434c-ab19-764c74b1176b@oss.qualcomm.com>
 <7f8aa7b5-40b6-456d-8b33-0cd505a6bc3c@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <7f8aa7b5-40b6-456d-8b33-0cd505a6bc3c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tq2jP-dfC1Uu1-iMbccU805MMIvJdrU8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA1MyBTYWx0ZWRfX8PEoq6XgGMwi
 lAaOPEzLzzZb9sO/3DqNS2Zc5NpootB9KXS9u+9K0uOWgjpKdX5HX+BB/rrsOncW9gXJFhko/3w
 JbipIPqtr16YExbpT6tze9COBcbDvhpl/tcv8nMn9c+uJ0bvMTSaQ+t18rM2Jt6kKUQZ2GC8Ik9
 h3Dyb6ZT3dQFuKZDdUoXjFfvYufts+10z+4VygDBgynzr4pcWYcXQ74VcXZesUroG0CoxSpRizS
 soLlT4326BElSaiIkPnAzIYw8tGNiw4OGBiIEvS17BwiMZq+++Gv7IGr0igPLqf8krCIsh/aZVo
 iZyqGCMRb6k3l+cLtjTWXoGxnt70kWL0jvbmADMEU0+HDHlT9y/+USCSozU2+jwdx0kiDdNV9xv
 Uk40Nw82ONZF9MRYdEkZlQ6u6i7tMg==
X-Authority-Analysis: v=2.4 cv=OayVzxTY c=1 sm=1 tr=0 ts=690afd14 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=kzD8ydeIdvGHlAoY_TIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tq2jP-dfC1Uu1-iMbccU805MMIvJdrU8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050053



On 11/4/2025 8:54 PM, Konrad Dybcio wrote:
> On 11/4/25 10:04 AM, Jingyi Wang wrote:
>>
>>
>> On 10/14/2025 7:46 PM, Akhil P Oommen wrote:
>>>
>>>
>>> On 9/25/2025 5:47 AM, Jingyi Wang wrote:
>>>> Kaanapali is Snapdragon SoC from Qualcomm.
>>>>
>> <...>
>>>> +
>>>> +    reserved-memory {
>>>> +        #address-cells = <2>;
>>>> +        #size-cells = <2>;
>>>> +        ranges;
>>>> +
>>>
>>> This is missing a bunch of reserved regions which causes device crash when you stress memory allocation.
>>>
>>> -Akhil.
>>>
>>
>> Hi Akhil,
>>
>> We will not add all the reserved-memory in dts, other regions are designed to
>> be added in bootloader.
> 
> If what Akhil says is true and Linux is crashing, something must be
> wrong..
> 
> Konrad

Hi Konrad,

There was discussion about the reserved memory in QCS8550 change.
And the conclusion is that reserved memory regions which aren't relevant to
the kernel(like the hypervisor region) don't need to be described in DT to avoid
memory map change and update frequently. These regions will be runtime added
through bootloader.

ref:https://lore.kernel.org/all/20240618072202.2516025-3-quic_tengfan@quicinc.com/

The bootloader we currently use for Kaanapali has not supported this, and we have
solutions like add temp change to add these in DTS until the final bootloader is
provided.

Thanks,
Jingyi





