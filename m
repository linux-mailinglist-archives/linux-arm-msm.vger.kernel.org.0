Return-Path: <linux-arm-msm+bounces-69182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C52B26110
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C103B61BD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7EB2F60C3;
	Thu, 14 Aug 2025 09:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hyuQvO3/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A9E2EA739
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163695; cv=none; b=QB9JwcaQW3e5N70Bm7674kxxoE0WJg3D3mv4eUiK6es2nFBG2T539sjHki+zvpu/Y5M8HQSbCGADV4Rwz2ZXCBX7a/8JCriX4rKEqEMOrjSJRKUV86AKOZHmDL+R9K+LV04AS3ABUX9Ha/edgokmzv5vYF4bRGULO6Sxr1Z93S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163695; c=relaxed/simple;
	bh=GQnnN+U+YBqs22Y6t2iDU16dNAcd3h/OaJ2bFAd41Ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jL+eAANpkiOhxV1WDOvMdSpywPw0N2opnBG7PMReGIisVv9OBDq3em3CF4wI/1+R00ZW6xczEbTICWFaTTuJFSmsVFN6ErGyNxA4C+cuJPtAMqwZax5GUEPWSSPli4s4mpvkBCfVnKiqxASPQaZat7Rem4lZwHMa/Q4fkqywLFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hyuQvO3/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMP2l2012279
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJeA/Cl12XV6Ym9omxbXH9tqXzA5NmYdzCdwpnAywkk=; b=hyuQvO3/6YJHMS1w
	BSDYVETEbjPhVdXW1xZvqK/ZrjpB/5NDjx5r8bhAL93/H5uXsA57CjbIrZCUd+Wi
	oc+w4oCZxNHzEPUAgPnq9g5Br/0e/nkjBcJ311Ia0AEldiq+Tkq5fZVS3LcZ4u1F
	VeuQg1CxwIkxJRuftCpNjuMcCz8grvDbJPKWB75+mm3gF4PHzBroQdup6laI6qWy
	Uy1AGi0N8f5xiZQyzNmU9KLYenboJZL9qb+m27+Y+06jIkv6oJ/7HiDv6rOUzvkU
	OxMmpxqpvv1LWbIOJbYTJvvdLemjO/sKCTN3dCEPL7/RxEU8OyPyzpOsVN22hh5h
	2/Ef5Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxda4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:28:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2e5c4734so761536b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 02:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163691; x=1755768491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FJeA/Cl12XV6Ym9omxbXH9tqXzA5NmYdzCdwpnAywkk=;
        b=u3YApr+PUZZ6dq5XFOglYxoCxgpJLn/E/tMSH/L/eVDvtG8ZzL44WDf8wEF3Okmw/X
         qFdHEW4nHFsT7vda/ZMKxTU/D5BwaLTBkJRfr5VLc0ayMKWMVj+hQ7t08pAAFSqCxlIB
         Jd4FkN67qE4OD6grIHfGjQwiTUXa7KAqUry6n+GqZGxuhaSYcmtX2mILLWAefxIjPvRP
         A/1CxpmHMVi3lZvxXyfnN3WNpQXcCNc3rgA0bG6jl7VKbXk32UXsyH/P0f34RTo+qRgU
         7L3oOQD+GqbUxHq6JYs6O61mo8mGhjlao5jA16hPXuAY4+q9WOqyIMYro/YRl1kqK724
         6/Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVB6iQ9LAt/bY6v7/4DmLJ4AANQs9n31MkyHv7TltzIQpJBQ3m5Kxj/bBpqxOUBtD09gxMeGR8aZaRLgJin@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9wUzZOpqgY24+WKvwEUr3t0aUQmUT7EsHC6Wu8SRn+ONuggIh
	DBx9bOW8qFRJzuiDjehH75NKkhn49pRpT8k2qu0N2kiHvgMgiarm5Cfy7dzr2dw9GGs8NhRDXX9
	+PsjMwsSehbPAQFIoGwKtNj8eyyZWkAPVxiBKaYJhVw6lDF7XxqGFyNQGFI9wsl8awJSB
X-Gm-Gg: ASbGncvUDwSFiRAHX4+e2XZX7rTa61fdWUQkb4QDdQPM1DJ7wDat6sNNt8FWUGqU/Gj
	C1dPiAlhcqmHA5svzXAawbSbLSw0utc3Vp1oVoQmicNtmSfHsUGKfAPOSKvU6BN5J4L4HW711x0
	45wneXr+Kc3Qd/Jg1c5al/pPPCe/6MYfaJk3jV7R7hU3+Oe2jAAfy3ojs0TuWnREeMzARPgB2LU
	VAEYHfl9/z05ZkAESDClGNTk4baeq4t9rrt9+04cMmEqWuZ8hW0Mfa//KkblApcwsI07OuAsVVC
	o3jmNRU4u6FQqfeuqDrhyROrKnodvQRFZjgIj72cTOq9VWSUHmTFA0ZVsgW0w7eo0HlHx8pE5zD
	HaAO5Rt6suN/zypIck1BWkH3UyOE=
X-Received: by 2002:a05:6a00:21d0:b0:76b:fcac:f2ad with SMTP id d2e1a72fcca58-76e2fb4b0bcmr3697348b3a.20.1755163691026;
        Thu, 14 Aug 2025 02:28:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWODswqxTFxtQosWONcrdgPZwI1hqKe274yvF25G0oOzBFEqfwxa4rVANYarCJm6pTGDFU+A==
X-Received: by 2002:a05:6a00:21d0:b0:76b:fcac:f2ad with SMTP id d2e1a72fcca58-76e2fb4b0bcmr3697319b3a.20.1755163690571;
        Thu, 14 Aug 2025 02:28:10 -0700 (PDT)
Received: from [10.133.33.40] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcceab691sm33859747b3a.55.2025.08.14.02.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 02:28:10 -0700 (PDT)
Message-ID: <a56b3e85-0d42-4945-8b6b-dcff20c7b104@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 17:28:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Initial support for Qualcomm Hamoa IOT EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Yingying Tang <quic_yintang@quicinc.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250814-hamoa_initial-v5-0-817a9c6e8d47@oss.qualcomm.com>
 <5reeryefhw7burzf2lymhg5wivaq2n4gq5hszvfp57dergvpyx@qehaf334gdrn>
 <7e5d39e0-115e-40be-b44f-0195a4827a0c@oss.qualcomm.com>
 <63ecde5c-8234-4630-97e8-5806b9ff3eea@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <63ecde5c-8234-4630-97e8-5806b9ff3eea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX+HLsQpjHGtbp
 BGzWxKBgRbo0ECG4dyC3NHlWAwX0AHcGjHkGnbP95fCOhd5owA1TTwsRQ9dtGeToPySfZ49U+bW
 W//9zOKf0nUVHwsGjLNJX6/ZCbovGpf2lKrfQi1CHovPsxcyHCTGLGqBV1kgIusx68uPNd901GE
 AsmPHfqgNpQmxh70uofp86GoX0StAMTLBwATzkhgM0rtJoAPJA1Zf0vslMp7ru7L+8CSRk0MBvB
 DpTwe5RZNYU1Pnt+96NlVYV0wkW7jQ2mUAjIAQNTNkRCk8Yos+MFFQXKZfiYY2RCmWgHfGmLy1r
 yEalM3K3ZdF9CXP3j5BruxI/tniEBgNtnOsSB7QTLzNL0tOQmGsziIt4eJSsFkeW1pMd4EPfsMP
 /yvgsQW/
X-Proofpoint-GUID: lgPB8px1LXe1MvimZvNVgWoJDjw1v2-b
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689dac2c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=r9z8OYCOk6cqr7l9vhsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: lgPB8px1LXe1MvimZvNVgWoJDjw1v2-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057



On 2025-08-14 17:05, Krzysztof Kozlowski wrote:
> On 14/08/2025 10:54, Yijie Yang wrote:
>>
>>
>> On 2025-08-14 16:24, Dmitry Baryshkov wrote:
>>> On Thu, Aug 14, 2025 at 03:27:27PM +0800, Yijie Yang wrote:
>>>> Introduce the device tree, DT bindings, and driver modifications required
>>>> to bring up the HAMOA-IOT-EVK evaluation board—based on the X1E80100 SoC—to
>>>> a UART shell.
>>>> This patch set focuses on two key hardware components: the HAMOA-IOT-SOM
>>>> and the HAMOA-IOT-EVK carrier board.
>>>> The HAMOA-IOT-SOM is a compact System on Module that integrates the SoC,
>>>> GPIOs, and PMICs. It is designed to be modular and can be paired with
>>>> various carrier boards to support different use cases.
>>>> The HAMOA-IOT-EVK is one such carrier board, designed for IoT scenarios.
>>>> It provides essential peripherals such as UART, on-board PMICs, and
>>>> USB-related components.
>>>> Together, these components form a flexible and scalable platform, and this
>>>> patch set enables their initial bring-up through proper device tree
>>>> configuration and driver support.
>>>>
>>>> Qualcomm SoCs often have multiple product variants, each identified by a
>>>> different SoC ID. For instance, the x1e80100 SoC has closely related
>>>> variants such as x1e78100 and x1e001de. This diversity in SoC identifiers
>>>> can lead to confusion and unnecessary maintenance complexity in the device
>>>> tree and related subsystems.
>>>> To address this, code names offer a more consistent and project-agnostic
>>>> way to represent SoC families. They tend to remain stable across
>>>> development efforts.
>>>> This patch series introduces "hamoa" as the codename for the x1e80100 SoC.
>>>> Going forward, all x1e80100-related variants—including x1e81000 and others
>>>> in the same family—will be represented under the "hamoa" designation in the
>>>> device tree.
>>>> This improves readability, streamlines future maintenance, and aligns with
>>>> common naming practices across Qualcomm-based platforms.
>>>>
>>>> Features added and enabled:
>>>> - UART
>>>> - On-board regulators
>>>> - Regulators on the SOM
>>>> - PMIC GLINK
>>>> - USB0 through USB6 and their PHYs
>>>> - Embedded USB (eUSB) repeaters
>>>> - USB Type-C mux
>>>> - PCIe6a and its PHY
>>>> - PCIe4 and its PHY
>>>> - Reserved memory regions
>>>> - Pinctrl
>>>> - NVMe
>>>> - ADSP, CDSP
>>>> - WLAN, Bluetooth (M.2 interface)
>>>> - USB DisplayPort
>>>>
>>>> DTS Dependency:
>>>> https://lore.kernel.org/all/20250724-move-edp-endpoints-v1-3-6ca569812838@oss.qualcomm.com/
>>>>
>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>> ---
>>>> To: Bjorn Andersson <andersson@kernel.org>
>>>> To: Konrad Dybcio <konradybcio@kernel.org>
>>>> To: Rob Herring <robh@kernel.org>
>>>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>> To: Conor Dooley <conor+dt@kernel.org>
>>>> Cc: linux-arm-msm@vger.kernel.org
>>>> Cc: devicetree@vger.kernel.org
>>>> Cc: linux-kernel@vger.kernel.org
>>>>
>>>> ---
>>>> Changes in v5:
>>>> - Update base commit.
>>>> - Drop an already merged patch:
>>>> https://lore.kernel.org/all/20250804-hamoa_initial-v4-2-19edbb28677b@oss.qualcomm.com/
>>>> - Link to v4: https://lore.kernel.org/r/20250804-hamoa_initial-v4-0-19edbb28677b@oss.qualcomm.com
>>>
>>> Please keep full changelog rather than trimming previous iterations.
>>
>> Sure, I will restore them.
>>
>>>
>>> Also, is there a reason why you didn't pick up audio and display chunks
>>> as it was requested on the corresponding reviews?
>>
>> Display-related changes have been merged into '[PATCH v5 3/3] arm64:
>> dts: qcom: Add base HAMOA-IOT-EVK board' and are already present there.
>>
>> Audio support is still under debugging due to unresolved issues, and
>> it's unclear when it will be ready. Would it be acceptable to proceed
>> without it for now?
> Audio was sent to the lists, so this is confusing. What was the point of
> that posting? It clearly said:
> 
> "Basic test is good in Hamoa-IOT-EVK board."

Additional issues with audio were discovered during further testing, and
the current audio series on the list is not suitable to be merged into
this series at this time.

> 
> So was that true or not?
> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


