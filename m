Return-Path: <linux-arm-msm+bounces-78691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDB4C04C8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 09:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4344035A56C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 07:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC34F2EACF0;
	Fri, 24 Oct 2025 07:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/IFoA6h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FD92EA17B
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761291738; cv=none; b=BQVHRkYXnEJwvoutQnh2NBCsZqv+SHC/h5RD8YygaOPgcaWNfzHMhPmW1nS/PoOn2Z5smom4IYg7XLutcDw33IA0fW2Pj1kACI3UB+V17M8X+995uYBPcC6vAWNBrv2LHO7cvCDL4UQ+rIkZmXXFaP5H0+1lNUZ1j+EDGkdL6wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761291738; c=relaxed/simple;
	bh=qP2/hLBVxN3FJm/O4nmUItT5aATfx/1KfPXyw+Y9EeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dE2u4o4bS7MeOhKTLLPGZ0C3RDmpWvu6NHFz3U9tINKV1xfLfWUvT4W4UlzBl4QTE9jRiB8dngAugFs/BvnvrDEUTRjDjxVIovslcvdlb/A2o+cdh0ZGOx0vfdbewSrX12k5tV3iER1G6qB8gfex3P8918xzeKLSDuNSG3x/SYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/IFoA6h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FVAa021578
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ujDdSK7F0vmTpCGIcAVVQEeirzSPmezFnb3ovMYte/w=; b=N/IFoA6hqMVmGE0/
	/SiF94CHg7Oof/ep2mbOtHozxKBqkhLTch7HcWoThMPHMk+7xttlnWh/kUgBfssu
	8x0ZqQhSl1wdbp+6N5LDWic6iHft1nIeUL1T7xJQYvM3NMNfQOVy6lrx6J4BwYRI
	eShJdhtv763f+HaiqkoO8dDo7e/tQbxXHWB3PTkm0uO4jEZ1oUZpRJqXd7gOFb6N
	bBEqh3cB59gLfOcNNaIzen64W9fc2TsE6FFZBlUa4oX5vrmH6W7wAo6TJwklKE6t
	uuZpHsSNeuMSUnD96p7IOspg2z6eI2rPXzcdwv1ZE4T+jFQDU2XGt00n4Z7MmU8f
	5SVGLg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8b6hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:42:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-792722e4ebeso1561748b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 00:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761291732; x=1761896532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ujDdSK7F0vmTpCGIcAVVQEeirzSPmezFnb3ovMYte/w=;
        b=kqM0KA0G9LZJ9Ix3To7o61yHJI18iaaTrKLAN8BxCm1UZwHTaWsrTn7P1AoeHym7Pm
         3srSlXo610BY/Uq4AZoi+bMQVsxP8S1tiJx03FFr86uzByD302Sr0NblAroyNl3GB0BW
         fLUtBjyeBwmuTJsZeBaGguMWtQojYappYXokFyHA5NwHdzHqygdNlBUYjZ2Ap+6Rb6Rj
         I70xSRiJ2xhwTmQxmq/v4H/gB7QbTF4QMm6fq6Zdt65Kf7OfvUesO3xDI+y3rHvEaLQx
         cVM5Fx/6aqwSp2APfss44oarmIS1Wcf7972SBhywra/swsg4WBpNZCh8D8zZRV55+wyB
         4cXg==
X-Forwarded-Encrypted: i=1; AJvYcCWoQNk2Swws7NX6U95zu6R17lbKIFiXcOTKXRR+swyVOqN7d26t/cS3oLerXL+61qs7AJXdOSzeAiKf0fI2@vger.kernel.org
X-Gm-Message-State: AOJu0YzfixEScOAqbHhRNOieN1PlCR7pv0Yf1Oq1ghGcWYsA3k9UL9E0
	1uD2cteofMaQeDMcq0xGDZ3ODktWCNW0tULYY08qXErjgNoHz8+47IyfDGbxHqclZ+TCj5pNI4C
	UxG2Lfxs7Bj/HJL9Otk0CBKQOipLRfwRhn+rXudN63SKVxW+iZjrbZSfGSBomty8a2SMf
X-Gm-Gg: ASbGncvs1eTPm6S1sA8hhB+8gYwCWS/cVllCpmRU9qcjPvBcJJg40Km0rilTqEoL8qc
	bWqHHgvKK97RUaorrlTDkG+cgKKh7MnbUmCyrazmi71NdlB//KlHpJcldBG0Hqi4Oc9FN5Wp+BX
	JSjfjIPm++7a9NhBsSWBLd7Nx25LOGmvbR4NCWmC2arGVPe6XQOwaJdxzTO+29S1GmYFpNC52MJ
	QU85qfgje3dr5CHy5+lMblgQxr/hg91i23Jm0wn0oVHIDu5cFq7iuvGcEkgWZGZn+eDhIWIUT1K
	M47Elew2qlMBUM/SiCOYClnWJaDy1MH4HA/jO11YfTjSs0EVlDEKGEkUGYan5LmbteI2XsQUVzc
	wn5OwsW4EE84fN3xo5yuj5sN2xoYZ4+SDhJX9hNcxRJZ7wM2odnZ1mgkrJ7+qh8fAzQEUow==
X-Received: by 2002:a05:6a00:4f89:b0:7a2:7d09:cf40 with SMTP id d2e1a72fcca58-7a27d09d3abmr3935325b3a.9.1761291731638;
        Fri, 24 Oct 2025 00:42:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB/pYor8fIltrEjQLCEvB8tf/UTov5v9SzsRwyA8eyQVdoIU2c/LQbw5Wo1KaPqhYAKhDT1g==
X-Received: by 2002:a05:6a00:4f89:b0:7a2:7d09:cf40 with SMTP id d2e1a72fcca58-7a27d09d3abmr3935291b3a.9.1761291731164;
        Fri, 24 Oct 2025 00:42:11 -0700 (PDT)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274bb3636sm4943582b3a.61.2025.10.24.00.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 00:42:10 -0700 (PDT)
Message-ID: <e5befb65-3d9f-4cc7-afd0-c418e8c2310a@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 15:42:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-2-611bf7be8329@oss.qualcomm.com>
 <CAJKOXPc57_0pJ2ZWf2cKSKAcQMc3S_mHKQxJDzWH7t=mgim3CA@mail.gmail.com>
 <5820a9a9-4474-4c4d-905c-0efd9442e5e1@oss.qualcomm.com>
 <o6dzhmlicwiezmxlb5uqitx7e3pjpyuhbjqfumivbdkru42hvn@r4ksfa6m5nd2>
 <540b1de6-c959-4911-925f-8163f5fa5147@oss.qualcomm.com>
 <fdfzoemfxdz2p622hvixpaznh2n22hweit2e43plfu2kdd6kad@reulvi4vs5v4>
 <cdc01b6d-370d-45dd-a3fd-9866d2a5f36d@gmail.com>
 <7952ed3d-f019-4593-af43-b2df7f738d04@oss.qualcomm.com>
 <c0e6b667-2e87-4419-81ad-3366ed56830e@gmail.com>
 <1f98f83f-328f-47c8-84e7-2c77abb37a6a@oss.qualcomm.com>
 <91288aa0-0088-4b50-8b33-661d8c0c25ae@gmail.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <91288aa0-0088-4b50-8b33-661d8c0c25ae@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfXzvzj6eoGcsjl
 EgPI0kQ1fvtC5JiMGHObcdJ/uu5GNZ1nPzFL0WSmVjqPmrQRYKt+NpaJF2AS4pzb9gXqVwRnOzO
 /48LLSRNFOaEPqrVKa01aH9XR+zgUQQoanvdhV9K38GkYhfgmw+LJrGnpE6aVSpRjEajX0Z2XY5
 SVg6OhS7BXNByBCGOSKPXatNkyuekcJYq73nLqJ7lpCCA35v/susImwdAOjSr56nYPFzsSr0WJQ
 CoB8WajVNbgZXBTZJh3gASA/m+n/Zbwa52GCEjYlYxcFYId64JIkpVAu3g9ucEyStPpedXM+OmV
 IFOq/JRJ2RjlK0brXeE9cPXAgUToaccmpG6rKAFCQdkKyvFOsCA83w/f/57N4tW1bIajBY6AtsW
 ebfG//Rf1OD7L7towAtC1082UQvNGA==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fb2dd4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=s-QpUPJv85p2Yj6lvi4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: rK13ShN8mvDeiL3hEsbmS7uYcT802YRL
X-Proofpoint-ORIG-GUID: rK13ShN8mvDeiL3hEsbmS7uYcT802YRL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015



On 10/24/2025 3:28 PM, Krzysztof Kozlowski wrote:
> On 24/10/2025 04:10, Jingyi Wang wrote:
>>>>
>>>> Hi Krzysztof，
>>>>
>>>> I tested with falling back to sm8650 cdsp but it will fail with:
>>>> [    4.739615] qcom_q6v5_pas 26300000.remoteproc: unable to resolve shareable memory-region index 0
>>>>
>>>> sm8550 and kaanapali define 2 memory regions: 
>>>> "memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>;"
>>>>
>>>> sm8650 and sm8750 define 3 memory regions:
>>>> "memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;"
>>>> with the driver:
>>>>
>>>> static const struct qcom_pas_data sm8650_cdsp_resource = {
>>>>         .crash_reason_smem = 601,
>>>>         .firmware_name = "cdsp.mdt",
>>>>         .dtb_firmware_name = "cdsp_dtb.mdt",
>>>>          <...>
>>>>         .region_assign_idx = 2,
>>>>         .region_assign_count = 1,
>>>>         .region_assign_shared = true,
>>>>         .region_assign_vmid = QCOM_SCM_VMID_CDSP,
>>>> };
>>>>
>>>> When kaanapali fallback to sm8650 it cannot parse this region_assign_idx.
>>>>
>>>> So shall we still fallback to sm8550 or define a new node "kaanapali_cdsp_resource"
>>>> in the driver?
>>>
>>> And partially the point here is that you might need the third region, no?
>>> Best regards,
>>> Krzysztof
>>
>> On kaanapali, the global_sync_mem region is not managed by kernel, so it should
>> be removed.
> 
> 
> OK, then please mention this in the commit msg, so it is clear why this
> is not compatible with previous generation.
> 
> Best regards,
> Krzysztof

Sorry for being a bit verbose, but I would like to make it clear that we can still
use this fallback if we clarify it in the commit message, right?

Thanks,
Jingyi




