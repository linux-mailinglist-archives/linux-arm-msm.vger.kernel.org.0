Return-Path: <linux-arm-msm+bounces-84920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB47ECB3B2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 18:53:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 724A7306DC92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 17:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9312B26FA67;
	Wed, 10 Dec 2025 17:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVSXWHq5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fo3pX7Za"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682781A9F90
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 17:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765389059; cv=none; b=rDidFW0iCzHNZUppegSePRN3/O0swOXVdKBYKIabOx17YhayW//au5Jx9qbg20VGCowSuva8ejBtiyxxNdxq26XYKKWrdsY73nLlpg/tA/QchO7dXr+epetyuBZnLIFiFCVXM0uROVeVYB4NBYCeodScedlVzq78EJUpf2o1/kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765389059; c=relaxed/simple;
	bh=yxzev8EM5E0T7lxaL9VjsGhEPZMDoh38zloToSzWu4Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LS+Yb3d+wesXAUYP93TNDZIr0nXlJ1GjFIG2psBcpeidAlH1FIP1dqb0LamtsADR8UEZIAAuAObolnp52GOUA6iOqu8VxbQLSQH0LCblAZOzxrfVxKwhdZ7vLSi87z7KcwrtLPsKNndU8vk+5vvgXStKG9bCwaTJNaE2cd28Tok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MVSXWHq5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fo3pX7Za; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAFSQAG3360825
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 17:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O0xdAhyjVRQ3P4u6QZOwEX+3rAEIjfeC+exH9qNW2JE=; b=MVSXWHq5n5kfKrXZ
	vDZTsPsRM+RFKz7hALKBjIexiPF2vLkXa2e9XhQ70smN0vJ2x12S3QcBAVvXHPCS
	nXdsvZ8KMpm7m28vjIN77bg/FVxswBrE3ZoopdDrCy9h4d7LTvuMXZ/6RIzWrTkS
	cXy6Elmy17UnLI+11fFUr+qoxoaXeunoGsjHrIbIt5v3md1I8Ef91cCx8bRqLqKl
	w3t3tlpY7JUl8Ltdj/D9sMr+OeRgsPJSeJZfRMJ4nkhVNa4gPlRJOzZuzZIOEufW
	5J1NKdzunM70aGpoQw/t0l1sNbKYUM9pEb1RZt0NVFYPCAP4P5hl+djFKTRDzGJm
	04y4Aw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhp8jhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 17:50:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-bdced916ad0so164579a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 09:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765389055; x=1765993855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O0xdAhyjVRQ3P4u6QZOwEX+3rAEIjfeC+exH9qNW2JE=;
        b=Fo3pX7Zaf32dzelnVU9smipTRu4zhFDQu2RYOaQAWuqSuS27Ma+xzc7xPSgJ9pdlD5
         fZ+W7ccGNFKG4VioTOmWxgUUm/5JxnhylSckRABOLsSJkNehNflYzSb6ojIOIrhg/sYh
         foI5S+Sq2LtEAj2BKQjpyYLhTYt+UK9Y12Yeyx1LCSkD7q+F7cfDZNZYe3s4hLg5o1Bx
         McG9NDfGb+mEobBnO42/tHGzHwWbkLyIGhnGy+Jx7R+L8IPyQ9r0GVLePyBjxoJXrT3R
         uA/6iPgqgdiT8pgvUijNro1b8/FnZ3R4zgsUwbFb6dq5gQVviW8VYghNTtfJFRuYQARE
         mVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765389055; x=1765993855;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O0xdAhyjVRQ3P4u6QZOwEX+3rAEIjfeC+exH9qNW2JE=;
        b=Lh4PfQ/RmITh3fp65wVNUVuynHqY5AUTQKcXCS6sD7TkwZgegm6Hr3ASb8HrwtFOaQ
         48aY2717wM0T2Bl3x0OtyXP0R4xxM2FPBzCrMOhHki/CurIl3vizYQ0TmGcq06SmKePI
         Z84Na8O6SPSWAQ9YwlEEgi3mDQ9hkdcAca3VIBP/jh1p5Y+u7nUAJBUwta6+Mvv256wC
         vmgSjkWMW1mT8tgb7dfQSSTU7OqCzqPcuYa7gb02GxsXTL9LuAJO7w06Sin2ZhZvS4xn
         5IwSiGudXcNkqmdyxNrD4Z1kShtjxkLjovvkgVSR180wL18YPS8Sp+7gJ/7bbYc16a18
         yXXg==
X-Forwarded-Encrypted: i=1; AJvYcCV6udgwqeNp68T8a/GtJJEqHUh7L9EJ+QHmZD19llDTVSfA3WpqH2B8k000jO460IWeIaceeoiepTDGSxVB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8wtTBNUoiX+fLps7VXz1VvZERmB/gL1XkrW85vh3pzmZfq4nb
	EkksygOXlUqQjtkbEqceXT6VMrY28Aoe/1URhRPhpfUqF0YdVghCQoldJjQH8L69gR7GyVa7sGU
	9sur9gqBGICadG0rUqWKQC+JOateXrTDgr74oM5TMXE9023tKJ33wnHSD8T+ZD5Fuve62
X-Gm-Gg: AY/fxX5CpGUv3pA09WxokB39O35U36FERY9FY6wrLxWOAcSHD0zb0zFc1SEikS6b28W
	aojOufsRwrVwhUPPxGmEoBewnl+d+wrSCO2AG/7FVJVbIKUL0tczBeClWREsbNHiYdgNdAlI4/6
	MXsDbwmyn9yBVLEk8/KtyIfW+rJp8k4BsaVpjpT7603tGIHX8zAbM1BkBBLjEno/AeK97y/SQTz
	ZDRJupUyLrQD8EoD4x/3kivwb/IbH/vSIzlZtD8OsPhxSlkxFfwf+Z/Gia/9Icn0zVQjb245w6B
	8Fs91ZjUby72clVx2B3K77kdsvjkcyYj6nWRwnP2huxPLQMAaBd1QFJV0ySyyAqWRq4z9Znzh9g
	yXOKhEqY/8sWGSNqOioK/Zu0tNl831YQx6EzztjyL
X-Received: by 2002:a05:7300:de0a:b0:2a4:3593:6450 with SMTP id 5a478bee46e88-2ac052c7943mr2211548eec.0.1765389054939;
        Wed, 10 Dec 2025 09:50:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHM+srJkTEntkf5wFVDdJ5uIFXsbpgJvPlw74PFWmuI3Xu2nHDQTmVRvuO3BSPGSD3pCtsN8g==
X-Received: by 2002:a05:7300:de0a:b0:2a4:3593:6450 with SMTP id 5a478bee46e88-2ac052c7943mr2211516eec.0.1765389054294;
        Wed, 10 Dec 2025 09:50:54 -0800 (PST)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb45csm348793c88.1.2025.12.10.09.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 09:50:53 -0800 (PST)
Message-ID: <9ecf4783-e1a2-430b-a889-997689bafe45@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 09:50:51 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com>
 <20251208-add-support-for-camss-on-kaanapali-v9-1-3fcd31258415@oss.qualcomm.com>
 <scnexmcrpemu6vcms3dmq7qjvx54h5pyumjvgqduospao4x2kt@hoi7zfygjq4f>
 <458a7841-e422-4cad-83de-f5b5c1b683a6@oss.qualcomm.com>
 <puv24qramoiq4qq3i4bibatg5ihnrv6hdloul5ajbblvasvwk3@nbse2m6aftkh>
 <2e38b9f3-8a35-4a27-82d3-c1d4996a1684@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2e38b9f3-8a35-4a27-82d3-c1d4996a1684@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE0NiBTYWx0ZWRfX9dF8NZWDYWNL
 B02sD5i1TtFPEtSoXR5kdW9EGp2VaixoAM8dG8G8qCCz/3Js+lUDkEw7bw1v7ovr/pMVp/8R6tO
 rkQp54Iie1kHqCmmr181H2RK19DqT8E2cyJEExC15uMWpHUtFqm2ndszLKRT8CvQTWJqAHoZu3M
 YKWwEEk+4ehciuMXGCkHsvOzrQpsS0s8HTEXmwihyg/KIiVP5MVsYD1PX4ufZVMVlBx8Y71LWrs
 CCY4dcwWwCa84Ty03IirOkN02z/WLajpa+JRoqyGRZYvLloCZCuYxxbEHZLWRW437yHlSqdpwnm
 6cOaRQhk4ttFQvg1E0HhtuYTOcXAlVUwWA+RLhYF5iSP8vVpSsJImKIthj6NVJJhLspDMjGm+vD
 IucWU3P8YjPUWZ1LeCp6X/J+fO7MVQ==
X-Proofpoint-ORIG-GUID: fSUQhs_tTonMrc-l2iYDsuaOQ5k5Y-qv
X-Proofpoint-GUID: fSUQhs_tTonMrc-l2iYDsuaOQ5k5Y-qv
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=6939b300 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gcM7WY6xUhQuHh4SBcoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100146


On 12/8/2025 3:21 PM, Vijay Kumar Tumati wrote:
>
> On 12/8/2025 2:48 PM, Dmitry Baryshkov wrote:
>> On Mon, Dec 08, 2025 at 01:03:06PM -0800, Vijay Kumar Tumati wrote:
>>> On 12/8/2025 11:53 AM, Dmitry Baryshkov wrote:
>>>> On Mon, Dec 08, 2025 at 04:39:47AM -0800, Hangxiang Ma wrote:
>>>>> Add bindings for qcom,kaanapali-camss to support the Camera Subsystem
>>>>> (CAMSS) on the Qualcomm Kaanapali platform.
>>>>>
>>>>> The Kaanapali platform provides:
>>>>>
>>>>> - 3 x VFE, 5 RDI per VFE
>>>>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>>>> - 3 x CSID
>>>>> - 2 x CSID Lite
>>>>> - 6 x CSIPHY
>>>>> - 2 x ICP
>>>>> - 1 x IPE
>>>>> - 2 x JPEG DMA & Downscaler
>>>>> - 2 x JPEG Encoder
>>>>> - 1 x OFE
>>>>> - 5 x RT CDM
>>>>> - 3 x TPG
>>>> Please describe the acronyms.
>>> Ack.
>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>>>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>>> ---
>>>>>    .../bindings/media/qcom,kaanapali-camss.yaml       | 646 
>>>>> +++++++++++++++++++++
>>>>>    1 file changed, 646 insertions(+)
>>>>>
>>>>> diff --git 
>>>>> a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml 
>>>>> b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..3b54620e14c6
>>>>> --- /dev/null
>>>>> +++ 
>>>>> b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>>> @@ -0,0 +1,646 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>>>>> +
>>>>> +maintainers:
>>>>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>>> +
>>>>> +description:
>>>>> +  Kaanapali camera subsystem includes submodules such as CSIPHY 
>>>>> (CSI Physical layer)
>>>>> +  and CSID (CSI Decoder), which comply with the MIPI CSI2 protocol.
>>>>> +
>>>>> +  The subsystem also integrates a set of real-time image 
>>>>> processing engines and their
>>>>> +  associated configuration modules, as well as non-real-time 
>>>>> engines.
>>>>> +
>>>>> +  Additionally, it encompasses a test pattern generator (TPG) 
>>>>> submodule.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: qcom,kaanapali-camss
>>>>> +
>>>>> +  reg:
>>>>> +    items:
>>>>> +      - description: Registers for CSID 0
>>>>> +      - description: Registers for CSID 1
>>>>> +      - description: Registers for CSID 2
>>>>> +      - description: Registers for CSID Lite 0
>>>>> +      - description: Registers for CSID Lite 1
>>>>> +      - description: Registers for CSIPHY 0
>>>>> +      - description: Registers for CSIPHY 1
>>>>> +      - description: Registers for CSIPHY 2
>>>>> +      - description: Registers for CSIPHY 3
>>>>> +      - description: Registers for CSIPHY 4
>>>>> +      - description: Registers for CSIPHY 5
>>>>> +      - description: Registers for VFE (Video Front End) 0
>>>>> +      - description: Registers for VFE 1
>>>>> +      - description: Registers for VFE 2
>>>>> +      - description: Registers for VFE Lite 0
>>>>> +      - description: Registers for VFE Lite 1
>>>>> +      - description: Registers for ICP (Imaging Control Processor) 0
>>>>> +      - description: Registers for ICP 0 SYS
>>>>> +      - description: Registers for ICP 1
>>>>> +      - description: Registers for ICP 1 SYS
>>>>> +      - description: Registers for IPE (Image Processing Engine)
>>>>> +      - description: Registers for JPEG DMA & Downscaler
>>>>> +      - description: Registers for JPEG Encoder
>>>>> +      - description: Registers for OFE (Offline Front End)
>>>>> +      - description: Registers for RT CDM (Camera Data Mover) 0
>>>>> +      - description: Registers for RT CDM 1
>>>>> +      - description: Registers for RT CDM 2
>>>>> +      - description: Registers for RT CDM 3
>>>>> +      - description: Registers for RT CDM 4
>>>>> +      - description: Registers for TPG 0
>>>>> +      - description: Registers for TPG 1
>>>>> +      - description: Registers for TPG 2
>>>>> +
>>>>> +  reg-names:
>>>>> +    items:
>>>>> +      - const: csid0
>>>>> +      - const: csid1
>>>>> +      - const: csid2
>>>>> +      - const: csid_lite0
>>>>> +      - const: csid_lite1
>>>>> +      - const: csiphy0
>>>>> +      - const: csiphy1
>>>>> +      - const: csiphy2
>>>>> +      - const: csiphy3
>>>>> +      - const: csiphy4
>>>>> +      - const: csiphy5
>>>>> +      - const: vfe0
>>>>> +      - const: vfe1
>>>>> +      - const: vfe2
>>>>> +      - const: vfe_lite0
>>>>> +      - const: vfe_lite1
>>>>> +      - const: icp0
>>>>> +      - const: icp0_sys
>>>>> +      - const: icp1
>>>>> +      - const: icp1_sys
>>>>> +      - const: ipe
>>>>> +      - const: jpeg_dma
>>>>> +      - const: jpeg_enc
>>>>> +      - const: ofe
>>>>> +      - const: rt_cdm0
>>>>> +      - const: rt_cdm1
>>>>> +      - const: rt_cdm2
>>>>> +      - const: rt_cdm3
>>>>> +      - const: rt_cdm4
>>>>> +      - const: tpg0
>>>>> +      - const: tpg1
>>>>> +      - const: tpg2
>>>>> +
>>>>> +  clocks:
>>>>> +    maxItems: 60
>>>>> +
>>>>> +  clock-names:
>>>>> +    items:
>>>>> +      - const: camnoc_nrt_axi
>>>>> +      - const: camnoc_rt_axi
>>>>> +      - const: camnoc_rt_vfe0
>>>>> +      - const: camnoc_rt_vfe1
>>>>> +      - const: camnoc_rt_vfe2
>>>>> +      - const: camnoc_rt_vfe_lite
>>>>> +      - const: cpas_ahb
>>>>> +      - const: cpas_fast_ahb
>>>>> +      - const: csid
>>>>> +      - const: csid_csiphy_rx
>>>>> +      - const: csiphy0
>>>>> +      - const: csiphy0_timer
>>>>> +      - const: csiphy1
>>>>> +      - const: csiphy1_timer
>>>>> +      - const: csiphy2
>>>>> +      - const: csiphy2_timer
>>>>> +      - const: csiphy3
>>>>> +      - const: csiphy3_timer
>>>>> +      - const: csiphy4
>>>>> +      - const: csiphy4_timer
>>>>> +      - const: csiphy5
>>>>> +      - const: csiphy5_timer
>>>>> +      - const: gcc_axi_hf
>>>> This clock (and gcc_axi_sf below) still have the gcc_ prefix and 
>>>> GCC name. Why?
>>>> It was pointed out in the previous review: clock names should be
>>>> describing their purpose, not their source.
>>> Hi Dmitry, let me add a bit more detail on this clock. As confirmed 
>>> by the
>>> HW team, the logic that runs based on this clock is still inside the
>>> CAMNOC_PDX, just that it is on the CX / MMNOC domain side. Do you think
>>> "axi_hf_cx" and "axi_sf_cx" makes sense?
>> Why? You are again describing the source. What is the function of?
>> bus_hf / bus_sf?
>
> In what I proposed,
>
> axi - represents that we are talking about the axi bus from camera 
> (against ahb bus).
>
> hf - hf wrapper
>
> cx - logic on the CX side of the bus in CAMNOC.
>
> If you think that 'bus' (even looking from camera client side) by 
> default means AXI bus and 'hf' and 'sf' implicitly represent the CX 
> side (which, kind of, in the current design), then yes, "bus_hf" and 
> "bus_sf" makes sense. Do you advise us to go ahead with these?
>
Ok, we will go ahead with "bus_hf" and "bus_sf". Hi @Bryan and others, 
please let us know if you have any concerns with this.
>>>>> +      - const: vfe0
>>>>> +      - const: vfe0_fast_ahb
>>>>> +      - const: vfe1
>>>>> +      - const: vfe1_fast_ahb
>>>>> +      - const: vfe2
>>>>> +      - const: vfe2_fast_ahb
>>>>> +      - const: vfe_lite
>>>>> +      - const: vfe_lite_ahb
>>>>> +      - const: vfe_lite_cphy_rx
>>>>> +      - const: vfe_lite_csid
>>>>> +      - const: qdss_debug_xo
>>>>> +      - const: camnoc_ipe_nps
>>>>> +      - const: camnoc_ofe
>>>>> +      - const: gcc_axi_sf
>>>>> +      - const: icp0
>>>>> +      - const: icp0_ahb
>>>>> +      - const: icp1
>>>>> +      - const: icp1_ahb
>>>>> +      - const: ipe_nps
>>>>> +      - const: ipe_nps_ahb
>>>>> +      - const: ipe_nps_fast_ahb
>>>>> +      - const: ipe_pps
>>>>> +      - const: ipe_pps_fast_ahb
>>>>> +      - const: jpeg
>>>>> +      - const: ofe_ahb
>>>>> +      - const: ofe_anchor
>>>>> +      - const: ofe_anchor_fast_ahb
>>>>> +      - const: ofe_hdr
>>>>> +      - const: ofe_hdr_fast_ahb
>>>>> +      - const: ofe_main
>>>>> +      - const: ofe_main_fast_ahb
>>>>> +      - const: vfe0_bayer
>>>>> +      - const: vfe0_bayer_fast_ahb
>>>>> +      - const: vfe1_bayer
>>>>> +      - const: vfe1_bayer_fast_ahb
>>>>> +      - const: vfe2_bayer
>>>>> +      - const: vfe2_bayer_fast_ahb
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 30
>>>>> +
>>>>> +  interrupt-names:
>>>>> +    items:
>>>>> +      - const: csid0
>>>>> +      - const: csid1
>>>>> +      - const: csid2
>>>>> +      - const: csid_lite0
>>>>> +      - const: csid_lite1
>>>>> +      - const: csiphy0
>>>>> +      - const: csiphy1
>>>>> +      - const: csiphy2
>>>>> +      - const: csiphy3
>>>>> +      - const: csiphy4
>>>>> +      - const: csiphy5
>>>>> +      - const: vfe0
>>>>> +      - const: vfe1
>>>>> +      - const: vfe2
>>>>> +      - const: vfe_lite0
>>>>> +      - const: vfe_lite1
>>>>> +      - const: camnoc_nrt
>>>>> +      - const: camnoc_rt
>>>>> +      - const: icp0
>>>>> +      - const: icp1
>>>>> +      - const: jpeg_dma
>>>>> +      - const: jpeg_enc
>>>>> +      - const: rt_cdm0
>>>>> +      - const: rt_cdm1
>>>>> +      - const: rt_cdm2
>>>>> +      - const: rt_cdm3
>>>>> +      - const: rt_cdm4
>>>>> +      - const: tpg0
>>>>> +      - const: tpg1
>>>>> +      - const: tpg2
>>>>> +
>>>>> +  interconnects:
>>>>> +    maxItems: 4
>>>>> +
>>>>> +  interconnect-names:
>>>>> +    items:
>>>>> +      - const: ahb
>>>>> +      - const: hf_mnoc
>>>>> +      - const: sf_icp_mnoc
>>>>> +      - const: sf_mnoc
>>>> You know... Failure to look around is a sin. What are the names of
>>>> interconnects used by other devices? What do they actually describe?
>>>>
>>>> This is an absolute NAK.
>>> Please feel free to correct me here but, a couple things.
>>>
>>> 1. This is consistent with
>>> Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml. no?
>> I see that nobody noticed an issue with Agatti, Lemans and Monaco
>> bindings (Krzysztof?)
>>
>> Usually interconnect names describe the blocks that are connected. Here
>> are the top results of a quick git grep of interconnect names through
>> arch/arm64/dts/qcom:
>>
>>      729 "qup-core",
>>      717 "qup-config",
>>      457 "qup-memory",
>>       41 "usb-ddr",
>>       41 "apps-usb",
>>       39 "pcie-mem",
>>       39 "cpu-pcie",
>>       28 "sdhc-ddr",
>>       28 "cpu-sdhc",
>>       28 "cpu-cfg",
>>       24 "mdp0-mem",
>>       17 "memory",
>>       14 "ufs-ddr",
>>       14 "mdp1-mem",
>>       14 "cpu-ufs",
>>       13 "video-mem",
>>       13 "gfx-mem",
>>
>> I hope this gives you a pointer on how to name the interconnects.
>>
>>> 2. If you are referring to some other targets that use, "cam_" 
>>> prefix, we
>>> may not need that , isn't it? If we look at these interconnects from 
>>> camera
>>> side, as you advised for other things like this?
>> See above.
>
> I see, so the names cam-cfg, cam-hf-mem, cam-sf-mem, cam-sf-icp-mem 
> should be ok?
>
> Or the other option, go exactly like 
> Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml.
>
> What would you advise?
>
To keep it consistent with the previous generations and still represent 
the block name, we will go ahead with the style in 
qcom,sc8280xp-camss.yaml. If anyone has any concerns, please do let us 
know.
>>
>>>>> +
>>>>> +  iommus:
>>>>> +    items:
>>>>> +      - description: VFE non-protected stream
>>>>> +      - description: ICP0 shared stream
>>>>> +      - description: ICP1 shared stream
>>>>> +      - description: IPE CDM non-protected stream
>>>>> +      - description: IPE non-protected stream
>>>>> +      - description: JPEG non-protected stream
>>>>> +      - description: OFE CDM non-protected stream
>>>>> +      - description: OFE non-protected stream
>>>>> +      - description: VFE / VFE Lite CDM non-protected stream
>>>> This will map all IOMMUs to the same domain. Are you sure that this is
>>>> what we want? Or do we wait for iommu-maps to be fixed?
>
Yes, when it is available, we can start using iommu-maps to create 
separate context banks.
> Thanks,
>
> Vijay.
>

