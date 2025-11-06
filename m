Return-Path: <linux-arm-msm+bounces-80503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E879DC38F0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 04:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 519181A2337A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 03:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2808B21C173;
	Thu,  6 Nov 2025 03:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRW8VA9D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RqGpfL4n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A6B2A1BB
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 03:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762398112; cv=none; b=ToRxhl6WFsTfJr7krCUDjMZaqcGCMRMIBjfe6y4aZ3Oo0+bGtc8yYKQ817MHvrTOSZdaHEPogBcLEnmAb+U1Hk5pSABZDUD/B8JDT+qgy589ujYKjMqZqhauhrcmFBHOTSaV7AXyVjB2LCqezYzEiAa+1pMr0S6eR5Jo8qu8VCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762398112; c=relaxed/simple;
	bh=nUTLKkkulc9/hptETYKiTiydQrJXhFrgVjkwtfokOwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=leUF2TVnmYnNJzmXCjqT008gjXpNh2dPDZ4GUe86MFzO23fKdzx6JlpZczoYO+e0OS1gULVjYtg/WuuDQj/ryzc65ytkHJwepkE8pvNr21WXfVTY6kZyNCk7k3aoPxZFCMz2EcFkIaE9IMKx+u/qKtjtV5n8jTEi7fzUm2G2ago=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRW8VA9D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RqGpfL4n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KFUvp1726766
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 03:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IcZ5XW+5y/suI/eniq9nSNCUyFz6b6A2Qd06C384cqA=; b=GRW8VA9DCGQUoWUH
	i2Flq1TNst1Uo5MVMmkwASOBiu9IFkmDjCYQmiWTkrFQQLHvB4f6MpY4Oxt1w5Wq
	nNW1qaSC9MPzFJBZSpZ3Wg8jx6j16m2BqyZQ3+BmSzZi1uX6TuyYu9N/kfqLoAr5
	E0l59Pll8Q+keWbrOPX2fE4VYVoLml2Q8pxHnz0JYSlLqNwumdKYrUAPCYSPcyRd
	BVabvTaShP7dxs1dSW6+jg5fVmhQZFuFlqC72gQmbHFimKiqB0ySHP1oI9d0aX6v
	HnB/vMIji4mOJN9XigMOuCtk7QaHjA7ufrhbGsdo337W7vm4TVM5QSKeSaRQku9r
	11H5Eg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a82mt33ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 03:01:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-341661973daso602507a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 19:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762398109; x=1763002909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IcZ5XW+5y/suI/eniq9nSNCUyFz6b6A2Qd06C384cqA=;
        b=RqGpfL4npqqgxg8F3xodc874s+M7mPst7Rp32na0kNFsXPdqJasBuXhT479Ccjmytq
         VqOM4yVCWk8XKlT0EYPabFs5iuw7MD8ebakXKbg6QZXGG1BpgNtoUA/tTYEIp9e0LCsu
         6x5yXnTbykG0X9lj5b8ZCmgOr7Jkt6zt9ZW1qW3arjPlQrUMRbDvTEXH6b0QKQJMB2rR
         qPV1RQcAtSrQoyQmJRxQ2x0Rz4PrXVwI/oK7QCOT4AH57KitqcBR3tuWoe7tzYEbeZDt
         Vwzk8ci6OzSxx2IgoNOTpW0n5I/0fnnJW63rtydD7eatIALd1WbLZC012mdzxFHbl5ks
         yc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762398109; x=1763002909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IcZ5XW+5y/suI/eniq9nSNCUyFz6b6A2Qd06C384cqA=;
        b=drDo+rMOTFMITKf8KW/rrLn+p6fi8YYbt76n6oe9FixCEDFiGtNKV786IUTx7t0j4C
         G6i+DicTtvfoEZvMoFnV9GCpfKLbBCqluCHT/TdjNohEqiwUxB74/9uCtZY1scQIV2mx
         QGYxhRi6T2ylTvGkmRLaAN36h0c8U3CIpH/qogbx2fHdH5XkAYBhhxy7bn7MHvGEf77l
         mxhf4Unr/5/YAB6aw5pahnlTI0Ib+07Eu7Sjw4FBUrcBCMcAYGjDSyWHfvCq48c1p7yF
         kDkPfrpED5YkGWm9HchHLhAeNUrJ2wg4u4vAtt7F8abW6lPlV1ZitINQeqro/6HNIqIq
         Ppyw==
X-Gm-Message-State: AOJu0YxBh1J3hz4OFXlObeIGLTQGo+j1NsEDAqaXZsE6LncwsZ7BRtBJ
	mXW93uu67BXyGuEH+kR9IPdbQHAVaL2mii/ed0mBfHBJ/835aDXoEr5Vq1RPYmt1awmJGoeln5x
	pfuwBNcsD2f7AdpCIa7TrhPETF9uYVL2zbI3pugZI92KtFp4u7ZDXMVY/CfjcC322iYKg
X-Gm-Gg: ASbGncvpgX0J12AUeMU+pzPqD+bO1fjVSZmZ8wh2EG+YeipkTp6O7KCpFmDMCj1gxP/
	EhZ6ch45uuk2W9+Oxx/5IHkQiZJcKZO3+83ufDn/4NpHSBAMtbLGgXjL+Lhwkty+mOm0SChdjLi
	G+AZMQQJJt84a4T+v9x+c5eqbWfkvMwDGqh133psQpRoE/g/595bVwwQt2aq5r5+Najw+Fc29eD
	o4V1y0rWU0DATo9gr4NGkU0QcgZWsI1EXLrZDngzBQ1wE7zXCztq7OTBilaHAiYhiSZZjbTR+Li
	A4l3uMqiasc89QJI4i+jLHWruEPa0h6l160DVi9r+DQOquTuaQEQZTNFFY4ugC/Ls5milgq0Jw2
	D3wOAB1VGvn7EmhDKb2u9r94Ejq33B+outrH91ytDG8i5faAK3aMQEjLP0ZwsM701LkhW
X-Received: by 2002:a17:90b:2f0b:b0:340:be4d:8980 with SMTP id 98e67ed59e1d1-341a6c2d896mr6620011a91.14.1762398108804;
        Wed, 05 Nov 2025 19:01:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoXDA26snF2QAx1SJ2dm5RA8MLCOM/hsiL6D4DdcIt8AO8K6jFoPUSbmPwY21HSMJ+zFzRig==
X-Received: by 2002:a17:90b:2f0b:b0:340:be4d:8980 with SMTP id 98e67ed59e1d1-341a6c2d896mr6619969a91.14.1762398108317;
        Wed, 05 Nov 2025 19:01:48 -0800 (PST)
Received: from [10.133.33.93] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f9ed21f6sm817620a12.13.2025.11.05.19.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 19:01:48 -0800 (PST)
Message-ID: <57adec59-17f2-458f-ba31-12a9b3a88dfd@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 11:01:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: dma: qcom,gpi: Document the Kaanapali GPI
 DMA engine
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
References: <20250924-knp-bus-v1-1-f2f2c6e6a797@oss.qualcomm.com>
 <d8b302ca-c2fc-4583-be77-6b720d5bdab7@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <d8b302ca-c2fc-4583-be77-6b720d5bdab7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAyMyBTYWx0ZWRfXzjgigzbhPHj9
 wyF9WrP9Y4facrd2RVr9z2FTpzWUSKFa9CszBWBNAvI+ejwIEMDOARpN3Pjb7wY3l8JWIfvexie
 ht3HRvdwFg8WUbvTHEeau8irt3AHYDFLcwvBdnQwR8r26cvCy10HBLmxOdpF6UHPjeeJGCbmc1P
 kIPvHTJZQCjcBXS8xiYZOgW1zYtzxKYfo1iSmY/arg3cpouhoTsQAVEGkknlFKzJvm2qW6Hld2v
 qhnOTsJ0OcXXVvc1HyzbZBvdQsKTCHYjBMhkLicP5m6kUN9EkJ0zRfnKvYGnE6/uqysYB3bAFyb
 Wx1zhAvQHnPNvgDAv9Snj9R3ifA0EyL2ce4C8uK9raCGwr3eaTe9jO+7UhrOBGLpQCS+lRf8d+W
 wEISzHCHnwHfw4RonsPPzX9ldUKjTQ==
X-Proofpoint-GUID: YeyKDeFI1eO1D0MlpsN948qDr0eFciVB
X-Authority-Analysis: v=2.4 cv=LLtrgZW9 c=1 sm=1 tr=0 ts=690c0f9d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Cd-w85Unq2EMQxkHV9cA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: YeyKDeFI1eO1D0MlpsN948qDr0eFciVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060023



On 11/5/2025 5:50 PM, Aiqun(Maria) Yu wrote:
> On 9/25/2025 7:44 AM, Jingyi Wang wrote:
>> From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>
>> Document the GPI DMA engine on the Kaanapali platform.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
>> index bbe4da2a1105..e7b8f59a5264 100644
>> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
>> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
>> @@ -24,6 +24,7 @@ properties:
>>            - qcom,sm6350-gpi-dma
>>        - items:
>>            - enum:
>> +              - qcom,kaanapali-gpi-dma
>>                - qcom,milos-gpi-dma
>>                - qcom,qcm2290-gpi-dma
>>                - qcom,qcs8300-gpi-dma
>>
>> ---
>> base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
>> change-id: 20250917-knp-bus-e5ede66d8e0e
>>
>> Best regards,
> 
> Suggest to have glymur support[1] as well like other similar bindings
> change:
> [1]https://lore.kernel.org/all/20250920133305.412974-1-pankaj.patil@oss.qualcomm.com/
> 

Well noted.

Thanks,
Jingyi


