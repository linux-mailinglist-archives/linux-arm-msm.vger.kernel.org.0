Return-Path: <linux-arm-msm+bounces-62578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39685AE9518
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 07:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A03D16307C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 05:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7521C8610;
	Thu, 26 Jun 2025 05:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WamTXcIZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE6EE545
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 05:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750914977; cv=none; b=Pxn6tDT9M1896tsXevYJq78gOo972+2N6B2ATlH/w0JpMPQWb6JkjrELgq/i4Rs6qWnjnE54kqXdUXh4ZPntFzsoL0UIxIXXWjg0RRU9z2DzOzRdM9/bmPHCej6hOZKL1nk7ljPnQhnDvNJTnNPHGTMl4v4BhKkrBHP7Z2B5edE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750914977; c=relaxed/simple;
	bh=DGIscSfCziwlOv1P8QbTdNlq9sdRWlYurdgZqoUEpB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LWbTqxl8hXxRgdEf0Q9QOCc6puQgiM0Mzw2smxLaALAc4gGmyUEE7Gw51IxNSRV2Q4g1C8zWh4HcrQJK91zgoVIvz2FR2Djl56xOcxnUiFLytMgOKNcUCYWAtrQXj2gl8que0W98RrSiOwREweh9t81ipq9fhxmZvETvRMhucFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WamTXcIZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0DnZe026634
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 05:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LY71DyKBMD5t9RNhRw/JYOoNO51ZSy07y5vbGuiOBVk=; b=WamTXcIZMQ8WxaBH
	wlzoE4GqgHlTV9FknB5JMrW/KsaQzyAaIgZEk0DkT/Hoftwj9M4y+HbvEZQqyTQI
	cYQecNR0NVYfjCx6yhR9lfnLqM8Mu3I82ZX9u2PUk64dgSJyXSO+TEvpMJtx3xuk
	tTiWWXvTKEqvAaHaAez43By1nfthjJCM+kVqeu+V+vuFMjVabHG1tdGuh+n414Vf
	IKQWQTLrzjVDojbeCg97njnjOt69X4qUaluLNSXMdPkFRU5zQkh3zbhJbcWg4y3G
	CZASp0i3lwAXlJesgDaSL4OljDFLGo4J05zyqh3YrVm22qTV+7QPcIa6UUd37Tlr
	ZR9Myg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5u5r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 05:16:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2355651d204so5609335ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 22:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750914974; x=1751519774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LY71DyKBMD5t9RNhRw/JYOoNO51ZSy07y5vbGuiOBVk=;
        b=JoMsBbLTINkF6iXdkVYIRI02JOGjGFS+FUsqX0xF1nCVg/aMKOpZAgdh/UIHzyrLSQ
         9MInITBEcoO5P4WuO+aoZGdHGYrZLKceuEk1kZvbzE82oLrX9Y+mTJPCijHjIubHRJLK
         MS1D4wfvEwl+V87YWbLm9r0qA/BU84NNC6o6lltx/+ALCthIwkmxJniPp5UC1sLV7nOE
         RiJVxvcgPKlLej0/wDSMBaFZYlN20o82XewBAjFqAzBPtvjfxP/ASrvBKdmnzCv7eJXB
         EeubfQH+AxhZx1X2Q3+FgcSupTXMmzH+Y9vyvuLtVh7nDmZDsG3o5be1ZICYBp04pjLc
         8zhA==
X-Gm-Message-State: AOJu0YxnJX5VDa90q3YsuHCaZSC1IpdMfuC9lJABI3ABTRJd9rNaWxH8
	1CYsUf2jipxQEughcROLtTk7urdozsPr9aPz1o1caqNUZiUMSjbMoII9Z/3IA+tQGmI+nOLAOSc
	lRDIRPCZuLc+er2zjrBftyEILWY0EsUrfzoQwv9p/DKkytMEd7dLz7nxNP6LtJb9e3fWw
X-Gm-Gg: ASbGnctXEWW6Lzm4nustwfdrHcKjgPhy8Cbka7QJpTknBYDh9jywbuUliF559BpGmvn
	eP6zjAG+x128NxWD/iQitg3KO6Xj/LGhebwB/PjoKbPZ1ucrybfLKG1Zi+js53yVWAtLbCgKPpl
	UejXrz6tiSrzvO9yg1FS1ZDd/HInTzjjyXhK5OS6z/EFSh1yFQvWTRdizbYQcBW/4OAUSb4lbms
	++PsE1KfJ+Tq6Cad1PCa6AQ9n6Z3JdmNd+Yj98P6QyYqJAquzOazNLENs+ZK3T2Y1f+xw2JVHKi
	nvRy1b7sf/kAYga7MS8o/zPNu3bIJhz1tSWy1AReDhreXXQHl4FeCKlh0i19WrI=
X-Received: by 2002:a17:902:c946:b0:234:9066:c857 with SMTP id d9443c01a7336-23823fda014mr93556375ad.21.1750914973622;
        Wed, 25 Jun 2025 22:16:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1J4U+ZM0bzuwizefQYFWAFIBA+Dan1+AA0/xNRtmYf7564YTHsnuN3w6c86htat1ivMpLSw==
X-Received: by 2002:a17:902:c946:b0:234:9066:c857 with SMTP id d9443c01a7336-23823fda014mr93556165ad.21.1750914973097;
        Wed, 25 Jun 2025 22:16:13 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86d1b74sm152989225ad.209.2025.06.25.22.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 22:16:12 -0700 (PDT)
Message-ID: <5925b608-1251-4b73-b310-948b383f7b7b@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 10:46:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5424: Describe the 4-wire UART SE
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250624-ipq5424_hsuart-v2-1-6566dabfe4a6@oss.qualcomm.com>
 <bdf7e3e4-f1d1-4f3f-aebe-ded7b8091884@oss.qualcomm.com>
 <3514a3af-ab7d-41e6-9e59-95defe9105b4@oss.qualcomm.com>
 <da6daf53-11de-4ca1-892d-73754adb435f@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <da6daf53-11de-4ca1-892d-73754adb435f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1fmPCUS9_eNDe-IrTqOz0I03htT4muXx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA0MCBTYWx0ZWRfX97OJYbN6FkBU
 OLavX7nSFnT1JQRzEPZN5vLu1zJzWQJkxwHAnAwAfCx1by29LjcDfUve5DZMG/wU0nNP3tNcOi5
 d9OsRl9FGXizb5/UlLK2Q1Q6gyy7We66GKb+jklTJQFALU+KkwovJCEcjLyXYato2192e1ji7aa
 5fYEEdYIuW0LdJOU9JJSn078ILPTjoNwp11WddEXdiftOywCGRDs4G4p9OkKQfQVPtlzPJ0QUSs
 +WWmKHpQaJ2EOhJgktFOkrBRAR1YriQtEXCuEvneAPlBiR7NaaQsTQVSChxYRfhOl9xMJlMQCYv
 FUwGcR7pnLB+bp9ZJLjfN1wfVXGEcg8hAWwlmVZG5bIEJEagRP/e0BLdQCTVtF3daJyhZ3n6J4o
 zlGSBnKw0ZSZiDLDpnSFPkDikBLyQfwMczDXp3ZG0AmaLrEdJyjAjcjUu2SWE5pTJeoP8cXA
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685cd79e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Dgig-iccZCONCpKWDfgA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 1fmPCUS9_eNDe-IrTqOz0I03htT4muXx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_02,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=594 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260040


On 6/25/2025 5:44 PM, Konrad Dybcio wrote:
> On 6/25/25 7:55 AM, Kathiravan Thirumoorthy wrote:
>> On 6/24/2025 8:08 PM, Konrad Dybcio wrote:
>>> On 6/24/25 11:00 AM, Kathiravan Thirumoorthy wrote:
>>>> QUPv3 in IPQ5424 consists of six Serial Engines (SEs). Describe the
>>>> first SE, which supports a 4-wire UART configuration suitable for
>>>> applications such as HS-UART.
>>>>
>>>> Note that the required initialization for this SE is not handled by the
>>>> bootloader. Therefore, add the SE node in the device tree but keep it
>>>> disabled. Enable it once Linux gains support for configuring the SE,
>>>> allowing to use in relevant RDPs.
>>> Do you mean fw loading support?
>> SE0 is minicore, so we don't need to load the FW. But apart from FW , protocol specific configurations to be done in the SE's Image Configuration registers, which is taken care in the patch[1]
>>
>> [1] [PATCH v5 0/5] Add support to load QUP SE firmware from <https://lore.kernel.org/linux-arm-msm/20250624095102.1587580-1-viken.dadhaniya@oss.qualcomm.com/T/#m37a6b739c66040cde5b6b0121a03da7ea6715842>
> I've heard the 'minicore' or similar name before.. how does it differ
> from a "normal" SE? (+Mukesh & Viken)

There are 2 types of SE. One is Minicore and another one is FW based.

Minicore SE supports only I2C / SPI / UART protocols and it is fixed in 
RTL. Depends on the protocol needed, we need to configure the "Image 
Configuration registers".

FW based SE supports wide variety of protocols like I3C, CAN and so on. 
This can be achieved by the loading the protocol specific FW image and 
configuring the "Image Configuration registers".

> Konrad

