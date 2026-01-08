Return-Path: <linux-arm-msm+bounces-88017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1437D01E94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 10:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C60B33ACF7C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 08:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699073A8FE8;
	Thu,  8 Jan 2026 08:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JCctxsx6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3Ni5bRO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1783A900C
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 08:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860103; cv=none; b=GGhHt6fr2+/E6f5vbmSO4fb/4DQpFzT+BJs118rrSK6PBDH3pRoOgxIhDK0dMRN8Dt0g6qoiDaMYLOmolaZmx/oiRwNDry7wGiZpzz3M9wquMc60DmJBYZDJ+mPM0RYrctqfNYFeQwgHd/lpGGf1I6h2CjsMH6V05+uO5VXXexA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860103; c=relaxed/simple;
	bh=xGA2deJBmp6GVWRXFiZPp3J/QC0WRqhz2yQ66RlKhhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r5Ray9cPAhXFVRUtsMGRP4ueF+zqoVkUexkSB/lfrbTYkNddYUqQGetFT9gQiAV81KF4wQXxeTZFvOgeIQY2S3FzSkf5kOuj4fOkRm41W37yuLgHAidB1Q/EtyMaS9fp4S5iukm10rUkakUYFYgc25Q+v3HIxB1eFerEYJpAfsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JCctxsx6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3Ni5bRO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60855BdC3890549
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 08:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oQmhOR5VTllw1N6UBG/MNA865KDu2tZfzbbQxCoVIro=; b=JCctxsx65nGfdt5N
	8d424nzFqNmB51Avo9nTyZU0jhQVUC3Z/IezpaNMldfmQmHtP4FNnPUoqt9L8Hhd
	Knl8Js3GVjVBSVeJ7WTgwy5B8unDC64gRVWM/T34sqfja+aOJM8/ukCCn+zY0BPG
	p+vyrDJRSAfSE4Oj6EKu3AodtQP8VS49c7txrwfRwu+X3MH/VjZLoxZFN1SCQ4ZU
	65j+p3GWwwiod5UDkN3WO+TBUP4EL52fQMFCSG8Nxamp81vhIZOYDL79Tl2w16/Y
	SxSh7565EUxZbCUtWZNdj+lheOAfg7nwQZ/g4Y1ZWs07n7rwDoy9My5tfFfAo9rv
	5eAC0Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuy72a27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 08:14:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b1766192e6so2009784eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 00:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767860087; x=1768464887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oQmhOR5VTllw1N6UBG/MNA865KDu2tZfzbbQxCoVIro=;
        b=Z3Ni5bROm1v80tUwSi3kx3MbSKeFqqYoVTZjAyRd5zoVggTQ7l3TTerAfcaXjaC6PS
         V0BPuVJAZwGbe/BvOldvD8wHzMI6LsxP/APgOUIZOwis+A8lMqAmX9l+Zty9VBoZFaU+
         B00X6EBcOJw5bXjvAId2gFNGfouWTk9rhXxiD3JKdsFaF42IaDzGeNIAG5fFxQtWllST
         YhIb1wb4jWabeUfm7Yicr1GQ3nCa7ZnDlky/QiQMoiFdvhErZ67yJXoN6l+Afmy/VAKE
         ggom1mv5dKLubm8jAA+gfzmrl1aiWJwCGpgv38iKR4J+yntM0aUWtnbkbHjehS97BQHL
         vDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767860087; x=1768464887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQmhOR5VTllw1N6UBG/MNA865KDu2tZfzbbQxCoVIro=;
        b=X9xjOTrUJ0keXuKMGEn/eONAk4w1mVrAk7Oa1LSPLXLYHtN++JzeFAg5jEAYC+l6s5
         0+23tbTHivsbUrVHao6FHj3pIsDwGSGOjbeqT0yvBUsvmyfu/BrizuAdV/wOoO5Q9ZYh
         t6PnbsrArTVgAXykdDn/cjKAfXBUT5WT0atucxvVnZCaxSDT6Tw03QsqLFw6lFeLhPRo
         PQ8gvyq1NIAy27Gr6Kbzx8LZ5ZpKHK4XhseBEdhDFIortbWXW3tTZ1B9+MlnDYpkEF/M
         JNjjRVP6psdsL2k5OjeSkzrjzbCHv1lzwjDvWaPnIXu2Iz/LqmI1cZVlR/hRL+iyjsp1
         ocKw==
X-Forwarded-Encrypted: i=1; AJvYcCUFFlNCyjNBTirWMLB3Dbs6KVC10Z9hoO4NeWsjZ6RAyuCYSQJYlonL/YiqdYM6yq6UH0VMW4vsR5z0TNjs@vger.kernel.org
X-Gm-Message-State: AOJu0YyGiDUjFish4THpl+qqi/N0NTLD8n9cfrveXpmEYEM2RC6RaLD9
	/u+PtU4BdTVldSB/vJxFQMwPYxlisPkKAIse1HouVZrCcAlLB7/3sVCxnYY3Jt3vRfXiou7oxnn
	u1uVpstBSKuyyqfdg/CMqZW6OCP0RuBM4R1zHrBCT7Hr8OEvU2PWKteD9rEjJ+laB3tEzb+19JP
	SD
X-Gm-Gg: AY/fxX6EJxhjuU88VhCLJQIjD42MASAqdHMFj7lt5nRLXIC/T1JmYJX1Khusxue42E9
	0ikM3sC6v9oKHI12Ocmy5xl3Pu/UsFVnC+EcH8T+gmzfN0VYE8YO6rTLlPYXsEH70x3AOyYrdoc
	SX2rh1woNFanOZn4dtUFrCm5GoLEoNxbFYwSP0+FqWj1pCW2QwqrVFRm4fX3Ov6kP9PFNMtKEPg
	LXtB61cak+nvSaOHQYstU4D1iBAeUtZPLQw1g6jNexi6aGxOi4CMmmkMBWP+2n+cVuPRDY4JMz2
	jffR8IcdnJXW0X9uEj1ZKNBX+BPOJ+0kAjjZLJJJdQUT+3edrItkYfX83tiuAAACxXpclRc0Eka
	Zyu7RXsWIhpw0nQQF+23n9O8ZCaMjxEaPyGXprPwjvyFNNg==
X-Received: by 2002:a05:7300:2286:b0:2ae:5092:935 with SMTP id 5a478bee46e88-2b17d2cb04emr2879944eec.35.1767860086797;
        Thu, 08 Jan 2026 00:14:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMZz5/2sK2+1cn1w1LMbXfHAiGxF+jIuIHMhcw3bspcPT2dvGLJ3N7V2r7bE8lhoxii9SUSg==
X-Received: by 2002:a05:7300:2286:b0:2ae:5092:935 with SMTP id 5a478bee46e88-2b17d2cb04emr2879922eec.35.1767860086169;
        Thu, 08 Jan 2026 00:14:46 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078cddasm8379618eec.22.2026.01.08.00.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 00:14:45 -0800 (PST)
Message-ID: <027842d4-cb5e-4f89-b7fe-345d68b68d55@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 13:44:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31
 eUSB2 PHY for Kaanapali
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260108052459.1819970-1-krishna.kurapati@oss.qualcomm.com>
 <20260108052459.1819970-3-krishna.kurapati@oss.qualcomm.com>
 <20260108-congenial-bonobo-of-lightning-5ceaec@quoll>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260108-congenial-bonobo-of-lightning-5ceaec@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aS9JQERE-xsmomOFmhsMmhMKgYnP939r
X-Proofpoint-GUID: aS9JQERE-xsmomOFmhsMmhMKgYnP939r
X-Authority-Analysis: v=2.4 cv=DZEaa/tW c=1 sm=1 tr=0 ts=695f6778 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=I_mDRuPlVTlm_7miLhAA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1NSBTYWx0ZWRfX+JzLbe/mhF8+
 Y/DVcUYgScHn67zRbE4cMdEaJsvIjRh7nU9C8/VWMjOlrGHpnH0R+wLVmQyYhhvoqkRJWCsrHec
 19DWaB2Ho0R0l0Z50+xHifROF7xN04MzWmaNjViQOSJW1ze8mjuPwexwZGSLiUObK3pJ3mknH5D
 K2lwMGQLFzvqipJfOZQU8Ns4jkn7SCsJce4FrtX2W+/iPfgtN4M1pBHGFFgz5BFNqXJ++SLaMXp
 y/Egfp582rl9LgJLpjIl+0q/4R9vrUvKWFYVVn/65J1DBjtYw0uVKLsVaOGSSQLLYw0cjeIdRLf
 H8iQ91O2qbiA5zAsuurVs9JnnEGSkEvY3dwKnuYGGHxTHwcL1L+hyUT7njK8GvjbUt0N1a9qH47
 BLaYgBwi1c6h6D+JT0Zuv7Ddk1rpAbsrnVr9meztBY+rJjcnl5cfaG8Tl0IqKO4VWzQNLiyqLqk
 U5I9a0pO23yRtVR6AaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080055



On 1/8/2026 1:40 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 08, 2026 at 10:54:59AM +0530, Krishna Kurapati wrote:
>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>
>> Document M31 eUSB2 PHY for Kaanapali which handles the USB2 path. Use
>> fallback to indicate the compatibility of the M31 eUSB2 PHY on the
>> Kaanapali with that on the SM8750.
>>
>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
>> index 409803874c97..cd6b84213a7c 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
>> @@ -19,6 +19,7 @@ properties:
>>         - items:
>>             - enum:
>>                 - qcom,glymur-m31-eusb2-phy
>> +              - qcom,kaanapali-m31-eusb2-phy
> 
> Huh? So you did not add new compatible? It's exactly the same code, so
> the tag should have stayed. Really, do not overcomplicate things. There
> is no need to poke people on multiple channels to ask them if EXACTLY
> same patch retains the tag. It is already explained in submitting
> patches.
> 
> Keep the previous ack.
> 

Sure, will send v4 retaining the ACK.

Regards,
Krishna,

