Return-Path: <linux-arm-msm+bounces-78437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A27BFF10F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 06:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A87E19A3BEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8042726F2BB;
	Thu, 23 Oct 2025 04:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKRjy+F+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A3C2773FC
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761192436; cv=none; b=gx7Q5KSdOMA61CVmPpRNIuymlV+cKrxuU2SP2uYAgi6Li+BUE30oi4fGXxT7AQ6xdoMxZXX3A9q93xHcPfpAEKaWRsii38nAlAeiEMEJiHiBcLebXAkz7c9stpYWmULvQQSKdjsbVSeLR2N7aCdLQb5t0MSVySYh0ZOKSfylhbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761192436; c=relaxed/simple;
	bh=1Nck7j3+aab8fsmv17FGOG9aPhFb9ZRUy/2LYccp1mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EBergMTZSjGjTqTLM05R4asbnFM7hbrrdj3g6ChvrXpv8GA3PWkAVNveRNbHMmYNRDDfOO+otW0pHpOr+gwFsdPL3zHK1zhebJoWgbaKxab7XrPbbXXt+s7ApS6C9nC3ah375LVq/EYHbv1zV6zDvypf0UTHD+nc5BX81mrcJok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKRjy+F+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIenFL005702
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PcgkgDXlyRkmY4EE/OGwg8TcZ9P8qqS+vWBVxf6Za2Q=; b=MKRjy+F+KxXu/pLQ
	OXPZFVo1dHVV3/0IZsrBcSAKl0wbE82JfWMlc6GyVg/hdYXEsCN+lEVmJ40jmB6y
	9Mt7ou2FDJ/7kyP04lK8zXLc4INbWSGCC1NikCsJ4WXxtCA7elDqyvWSqf1aXa46
	VSGiFKRu5YiS8tztpjB2PaGnI+MJqVz3oVoBVStTrXAmeJvxOwnrboPeIsYEi7IR
	ujT9yz6QXc8Bd+uadlU+0Nis+GGKFJQvbYSPsUcX0tpqRjyj+n+4oVhJA+Ihiwpg
	sP41FKePnzo6ui5Sp4UPlkx/KZft7IRELfTD5yBdQYVGXXJNdz4OwBbR+bj26lf8
	C3u90A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j6v12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:07:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33bbbb41a84so906387a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 21:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761192432; x=1761797232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PcgkgDXlyRkmY4EE/OGwg8TcZ9P8qqS+vWBVxf6Za2Q=;
        b=Hhq6hueMN8wiMwJWBi5SKp5UXN2kA1sTQa9mYS/g5QrlGhLWmTVzIV0XFmNo8IEed2
         fGthNSsG+6itY8i7SajdGqmYz/IF+L9J1NSvevdxKjxyp9BdkVru3ARSxHRocd5CsBmL
         XC8FNaki6SiFKCS0AmkoHmEB9lNWiTxmzDUXpAYI+lo38t47nLRENcuztx0nVStYq6EH
         LnXjYeTs8Im5mZv1JusNlibX8+CQXUplE8AZVbV1xsJ0SpHD8mdCjcXDFAn8mFQIumlZ
         VuWw5hSIQcNDNV5C9yXGmpNc5QeEtYGoBx68r7UtJABmrMHhXXfIZlPDo0BkoZwFCLbn
         29Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ2xdyUDyiv6ssXXr1bG58NtuVot9OabHX9eQH/NFliwmo7M4IhvaPnduDXEcYtBuIb8R2R29aOVglMwRM@vger.kernel.org
X-Gm-Message-State: AOJu0YyUikR5DVf4ZhPXXkJXqAONGbUj/3/CjIWPup74lmezbtOdLt+I
	VT66nMA3cK+Uy6nKUaIDyJDYIg06VDiZpQi6JaZVKtXtrhIDOCvdUoOcjKrKTOxr+NS2i2HF6rR
	C/7hFSw5/Z9UddoIt2lo2kdGmRio/u+xfrpPVWISD9hJvaE4LJdolrqQm/Gvu8IIdjD9Z
X-Gm-Gg: ASbGncv9QLF8tZDe/gVFRQsWq22FnDMZxufzjvZ/x3VksLbAyDi1CFdrnUoVSvs8/6j
	lmNpfgT1OkgfzmFv2W4r3jmqLQJ03Nt83BamWneY/gVVXxhAZqqjztyQbv1JVr6urq8SeJ7DUvz
	0tD07/cvY2zligR+sfW4orJ2280nrYKE5RSPy8jM9WJODmNwy3OdJYxnE68ccPDj28r4wrQGiZ/
	VSz86DEsC8lm2zo/nsn3VtI0s2bl4nW03a0CWTwIfFAbOH0OeUt99j2XyfooyBowtv+5jL43iho
	AfsgQZt+Ttp8Xg7AwXg1Aq1VcdrkVGaGNp/W7KI5ZPtjkU37606io85G+gyJsOORvZmgS1qtXrq
	rxer9jACCB5R2WfTCEunTUzYgHjhnq6IHlGgqZvEqqpNMHZjIPpzeFMVHFokaKOLqskFIZg==
X-Received: by 2002:a17:90b:2ec7:b0:33b:6650:57c3 with SMTP id 98e67ed59e1d1-33bcf8ec60dmr30315344a91.21.1761192432167;
        Wed, 22 Oct 2025 21:07:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFPMyfbfKQ6gBFWgcEHzbQ+WlKqxr4cKLnz5nrXjMEa0Y17iULEXCPmyWg4Rg7nanHfqwGkg==
X-Received: by 2002:a17:90b:2ec7:b0:33b:6650:57c3 with SMTP id 98e67ed59e1d1-33bcf8ec60dmr30315307a91.21.1761192431653;
        Wed, 22 Oct 2025 21:07:11 -0700 (PDT)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e224a2662sm4200672a91.17.2025.10.22.21.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 21:07:11 -0700 (PDT)
Message-ID: <7952ed3d-f019-4593-af43-b2df7f738d04@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 12:07:03 +0800
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
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <cdc01b6d-370d-45dd-a3fd-9866d2a5f36d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX7FujMyqAtjgr
 z0at5q5prEz7gvxvmKk3Ok0b8EmfI+xdCcbm0roDU8pXmrFEUrFqLToKCqUhKRPYp5x7b8PHajk
 LPTC6UuvZaKg/njdl1j7TxbectQapUeRaqS/SDuOIMpQv8lcXA7IDZK4f6Aq+c9GwUtMuu/R5J1
 ovA0l5Qbr8Pk/7C/fNS7wdVYrwzywa46lS2NIrcxi3IauUaMgdpw+l8ZPtXxpoq3N8hgPw5b8eI
 6rZBc26WbS6WTP3EuqV2xRUGO5Tewg5v1L0rYev05pyvcdXa5wmY1bRiTZct2Ie7WT8YDGD13c0
 T4gEsPm6mvi9O5ujoxIs/KDUj2cS7haPpNGBujsVzEj9Lxw6kEVLKGEYvMyqyvNtg4VDYqQpO/E
 tyT3Mn00NPUpRzBodhfJE6CV4HPZeQ==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f9a9f1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VbD8AgmwhZIDVUnwpcMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cRWfC6n2uHxCgXZvMiDb04nZsYId1NEV
X-Proofpoint-ORIG-GUID: cRWfC6n2uHxCgXZvMiDb04nZsYId1NEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018



On 10/9/2025 6:29 PM, Krzysztof Kozlowski wrote:
> On 29/09/2025 19:03, Dmitry Baryshkov wrote:
>> On Mon, Sep 29, 2025 at 05:41:10PM +0800, Jingyi Wang wrote:
>>>
>>>
>>> On 9/29/2025 5:34 PM, Dmitry Baryshkov wrote:
>>>> On Mon, Sep 29, 2025 at 02:20:54PM +0800, Jingyi Wang wrote:
>>>>>
>>>>>
>>>>> On 9/25/2025 9:48 AM, Krzysztof Kozłowski wrote:
>>>>>> On Thu, 25 Sept 2025 at 08:37, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>>>>>>>
>>>>>>> Add remote processor PAS loader for Kaanapali CDSP processor, compatible
>>>>>>> with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
>>>>>>> interrupt.
>>>>>>>
>>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  .../bindings/remoteproc/qcom,sm8550-pas.yaml          | 19 +++++++++++++++++++
>>>>>>>  1 file changed, 19 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>>>>> index be9e2a0bc060..031fdf36a66c 100644
>>>>>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>>>>> @@ -35,6 +35,9 @@ properties:
>>>>>>>        - items:
>>>>>>>            - const: qcom,sm8750-cdsp-pas
>>>>>>>            - const: qcom,sm8650-cdsp-pas
>>>>>>> +      - items:
>>>>>>> +          - const: qcom,kaanapali-cdsp-pas
>>>>>>> +          - const: qcom,sm8550-cdsp-pas
>>>>>>
>>>>>>
>>>>>> This time maybe without HTML:
>>>>>>
>>>>>> This looks wrong. This is not compatible with SM8550.
>>>>>
>>>>> Could you point out what is the difference from your perspecetive?
>>>>> it is the same as SM8550 except for there is one more interrupt,
>>>>> which is also described in this patch.
>>>>
>>>> I'd second Krzysztof here. Your description points out that it is _not_
>>>> compatible to SM8550.
>>>>
>>>
>>> Here is the binding for sm8750 cdsp. Fallback to sm8650 but describe the
>>> difference in interrupt:
>>> https://lore.kernel.org/all/20250221160036.159557-1-krzysztof.kozlowski@linaro.org/
>>
>> Interesting. Let's wait for Krzysztof's response then.
>>
> 
> 
> Because it is evolution of sm8750, so it did not go back to old design.
> from three generations ago. This is compatible with sm8750 or with sm8650.
> 
> 
> Best regards,
> Krzysztof

Hi Krzysztof，

I tested with falling back to sm8650 cdsp but it will fail with:
[    4.739615] qcom_q6v5_pas 26300000.remoteproc: unable to resolve shareable memory-region index 0

sm8550 and kaanapali define 2 memory regions: 
"memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>;"

sm8650 and sm8750 define 3 memory regions:
"memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;"
with the driver:

static const struct qcom_pas_data sm8650_cdsp_resource = {
        .crash_reason_smem = 601,
        .firmware_name = "cdsp.mdt",
        .dtb_firmware_name = "cdsp_dtb.mdt",
         <...>
        .region_assign_idx = 2,
        .region_assign_count = 1,
        .region_assign_shared = true,
        .region_assign_vmid = QCOM_SCM_VMID_CDSP,
};

When kaanapali fallback to sm8650 it cannot parse this region_assign_idx.

So shall we still fallback to sm8550 or define a new node "kaanapali_cdsp_resource"
in the driver?

Thanks,
Jingyi













