Return-Path: <linux-arm-msm+bounces-76600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7DABC8689
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 12:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31A6019E6181
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 10:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34FA86352;
	Thu,  9 Oct 2025 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JXCcBTPR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C397277CB2
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760004557; cv=none; b=X19U88nedSlaYJ/PS+LoHBCADH5nN8T/f37/eJDZ2msyL+hwMy8clrXa8kVhaNSvMg9G6+3bk+vI/VHuYLdQIcEfwFGPvcVD1oV2+88/VcsFF4MdtcvhYlGRY87olPrxuXFelc5uzejQfMRDayQqvjAMwTVcrTw0PP7wLyBFjIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760004557; c=relaxed/simple;
	bh=puyXQak5xCPes5C3V32+uKNZqqPJViEywLe19Swh2E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERU0/gv7xllN3+HaoyC5bWYCtNAxFZIp4XMM87oOPOb6XhYmboKXBAJjyrT2phSHB4Sz3Yu3cfaAUiGDsJfsNLkhTJj8xalhidMHt0ChMLngd7K+ISWV46bJH3BjUHZ2urTxEEQp6AcHwbKwbJoNOcpAZ1B5ZY2H9XqFOvl3XoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXCcBTPR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EHrE029049
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 10:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ht1MeJWzpyV8az6qvFclkme+Dolv3sGsYlW3nKW5fGk=; b=JXCcBTPR4EY5gF5K
	J4dWhqNDnBYI2yBzkAuq1/y32hI4tJDw9PAnK9FNmfJEyw8yzdYvl6bKsaLAjQXp
	U0+eHrgth5ZZ4fN/hZvTag2Mm+vTi5T7zFhHasj03bvzg4OHiLS/DCZxvaUYTB4x
	5yM5NXMAM+mar9U7bmnLMeUcVIzc8BPWZL7LOu4zguO9Rb93vN2ARtE26Hc2kd+w
	p5CF6fNCDKsSFJwl2Zbb47lyBKABZd8DmvS35gx9hLttNvbWxdEpBW2Xvw5S/1+H
	x2YHgYhgKwOzvudlJZXJK0YU3eYCrldJYixlzF3+KkHpvFd11xNPDaeYASF2a7jD
	bQFFog==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ktc3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 10:09:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2698b5fbe5bso19514805ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 03:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760004554; x=1760609354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ht1MeJWzpyV8az6qvFclkme+Dolv3sGsYlW3nKW5fGk=;
        b=bpeHbSa8chRJpD6Nv/BT/ZJnWE5xglgv50nv7BwNPEMVRwW+7eBpyZNmRve24mThtx
         ONjrFThWpoWUFhjFOmyR9vObmZHMGKQYCVz5Vd+Ia/JDp53YSc8e646Cr1l+Z85esNzF
         UpTfJPKcG08If1gdcBm1NRAh8KSAuDBfMZneYRkF2/lcA8sCdZysHxHlavoTmCPIQ9hn
         QqMZAOzUCYcQ7X9L/uvw7ciPDCTV8uWUI76lyMF8T+QdWwd6WIMB0PwfcyvNq5Mn9zX9
         d5C97kze0bT/8KexaGB6Ikl9U67ejgzMlDQHSbUHmEqLj3sx0KixfpKmHPtkzTZoR8Nm
         Z6FA==
X-Forwarded-Encrypted: i=1; AJvYcCWMR3pCtFq0cTZzG+F7o3zbjJNiLbnP1JK0QFZAayFNrjYoyHi96arucyyfdgMmqQy2j4beBe/WXOz9qYm9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2FtfNYWfn8WndgQWiu0OpFDoqo9u6gjnHnuSWU4qYwRar1b+M
	2DnlywjYkPykRckDazSMnM4AVa8xofMOTKrZLVRlv4eY4H/j/gzTUlAC9aSOOR+H/31bVZ10OD5
	01WGEC8lbFGDcMaBH/OaJH+t6y258YcLNEZDp2YvazrBXgdwmxG5bSril+zotAKfZ9qxp
X-Gm-Gg: ASbGnct39PgQF4XS1fhsDOPePWe2+C8Kk4Q0xPWt7itrPOqpowJjmCCncxwMzjj13uK
	6vc9sC7GyRO1hWa5kFa077bO98hbLdHC840vsJSBALZHTvxceUVEtqUPm0kcggdGErUMv07ffzw
	RnxomFVf9sgRUDf+hLTuNpJiKpQOj8r65BTSaqeivinQQYLk4E3WSSPcH2uz4dsiJSF7zJ8TiTQ
	f6kcZPsdiR/CfmHplTnxr6SFmdAaoFmf/mndmX636ZVfd8nfyFR//2xU5NWJpiyeKskRMfusw6s
	+sqRoN4dqPycKAvastBvr3HKHCP6nx+VG80FuhvlmkISoz8VeRoFA1ITHA9HSiWN2jrSmWk9FW8
	G6aJDuFCx0MiPS0dKXpqgqT4k7WO1lkjc3NAkRFp8Rj/3Wwfk3mGAmd50dg9GYzY=
X-Received: by 2002:a17:902:d481:b0:24c:7bc6:7ac7 with SMTP id d9443c01a7336-2902723d3e5mr91832085ad.18.1760004554333;
        Thu, 09 Oct 2025 03:09:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbx041+jdp7rBtoEFzf+vebUcsdFZtILyK/9Cau44Kb79AycvWz2CsWtBIsKytzaPmMQlspg==
X-Received: by 2002:a17:902:d481:b0:24c:7bc6:7ac7 with SMTP id d9443c01a7336-2902723d3e5mr91831775ad.18.1760004553869;
        Thu, 09 Oct 2025 03:09:13 -0700 (PDT)
Received: from [10.190.201.224] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1ccc4sm23764105ad.42.2025.10.09.03.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 03:09:13 -0700 (PDT)
Message-ID: <6aed71d1-ece7-4b33-8060-ea3a51015a26@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 15:39:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] dt-bindings: remoteproc: qcom,sm8550-pas: Document
 Glymur ADSP
To: Rob Herring <robh@kernel.org>
Cc: jassisinghbrar@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        mani@kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org,
        konradybcio@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
 <20250924183726.509202-5-sibi.sankar@oss.qualcomm.com>
 <20251002005434.GA2796203-robh@kernel.org>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20251002005434.GA2796203-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0elVApEpSSpC
 jRI2fnbZbW2i6cwpTSh8aQEzqtD94sOLisf9MPJfuTBCiMdo4uaPqjsk9pZW9bO7QyLdxVPw+Ak
 3jawxNKTJCAsutIr4sYKwPA/7+cnwCXSkvOMfir+9QlhPK+kATPAtQJU+0ANgO1ufIhka3kuuG7
 tasc86Y6nTHK99Dh04liZRScGsAUA6cNg300DV61/kutvR1Sgc8ZzDfyl6uaBokZ3+GkqPeiDkY
 dkA3ewAnXpUdhdVkY3j3NGWOF8Yg5AdzsSpj2UtEIfBHhx3yBTnfHZEG6NIp96SJfSv5sFmw8Wq
 atzxOXRKtO6vw1OQG31CZ1+AXTUNNDxQKS67/cAXdbrkKQfkFskEVAAtUCUdRI+rl8j1zeNdGYG
 aJXxRgd2aQ+4Rm8Q0yIgDwdidZj8SQ==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e789cb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=K0PDbwUCbj7d31mOmPMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: bp7THE_mJlj0avjjeLnRsXD-63yxWJ6u
X-Proofpoint-ORIG-GUID: bp7THE_mJlj0avjjeLnRsXD-63yxWJ6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121


On 10/2/2025 6:24 AM, Rob Herring wrote:
> On Thu, Sep 25, 2025 at 12:07:25AM +0530, Sibi Sankar wrote:
>> Document compatible for Qualcomm Glymur SoC ADSP which is fully compatible
>> with SM8750 ADSP. Also with the Linux Host running on EL2, the remoteprocs
>> need to be hypervisor independent, the iommu property is mandatory to
>> ensure proper functionality.
>>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>
>> Dependencies:
>> Peripheral Image Loader support for Qualcomm SoCs running Linux host at EL2:
>> https://patchwork.kernel.org/project/linux-arm-msm/cover/20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com/
>> This patch has a dependency on the iommu binding added in ^^ series.
>>
>>   .../bindings/remoteproc/qcom,sm8550-pas.yaml     | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index 2dd479cf4821..cba45ce2865e 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -28,7 +28,9 @@ properties:
>>             - qcom,x1e80100-adsp-pas
>>             - qcom,x1e80100-cdsp-pas
>>         - items:
>> -          - const: qcom,sm8750-adsp-pas
>> +          - enum:
>> +              - qcom,glymur-adsp-pas
>> +              - qcom,sm8750-adsp-pas
>>             - const: qcom,sm8550-adsp-pas
>>         - items:
>>             - const: qcom,sm8750-cdsp-pas
>> @@ -95,6 +97,7 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - qcom,glymur-adsp-pas
>>                 - qcom,sm8750-adsp-pas
>>       then:
>>         properties:
>> @@ -185,6 +188,7 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - qcom,glymur-adsp-pas
>>                 - qcom,sm8550-adsp-pas
>>                 - qcom,sm8650-adsp-pas
>>                 - qcom,sm8750-adsp-pas
>> @@ -238,6 +242,16 @@ allOf:
>>               - const: cx
>>               - const: mxc
>>               - const: nsp
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,glymur-adsp-pas
>> +    then:
>> +      properties:
>> +        iommus:
>> +          minItems: 1
> The min can never be 0, so it is already 1. Drop.

Ack, will drop it.

- Sibi Sankar

>> +          maxItems: 1
>>   
>>   unevaluatedProperties: false
>>   
>> -- 
>> 2.34.1
>>

