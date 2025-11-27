Return-Path: <linux-arm-msm+bounces-83603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 768B9C8E911
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 14:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ECAE134E726
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 13:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F07223DE8;
	Thu, 27 Nov 2025 13:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZfbylVXI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iXzbhPOn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A1F212549
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 13:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764251262; cv=none; b=CIDtvjJThZhJ3FD2k9cpeKsHGHDC4IYWEEQRsWUIqgT7HbkXIRt9od/Wvd5ZsSLwJv32ybD3hhgv7Yl1fV7w0ZA1g9X2enbSNKm/ggxaOlQK9cgzMb1elI45tIMJCgM6QTgLbv26WMJYdWNBDL3p+JIRRWhBv1okfNk4zL6+Qh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764251262; c=relaxed/simple;
	bh=FQVqutWdqyP7Nl9TP13LYUyfchM2z7U84aHfdwPoTEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YqY9vZCK6UIhr09CBaLzr1BTb3V5uuu5AJZzE2lD/+XZrO2BS99AXJJZqammUi8tAqDDzmE0Yh6nhBPvp+pbVYTRUP0QJxNYVMhTdrwUrGLhlaumy8jEgma0DTycPcQ6vZTqI8lMfwGgAoMjc0mtrl6FD4QyMnsabFr/0QJMj44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZfbylVXI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iXzbhPOn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARA6tOT3840313
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 13:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mv2I3k3r/RnePcRZs9VXFrqRAy47C1akTnpCGieEj3I=; b=ZfbylVXILrr9mu4Y
	RCBvSrsrHnrAGoFZRPnbSBVsyJfDtV8YhsDzaTD49U8ptDAVEIjI1yafKw6G71Ki
	vlHsHoAkvi80Tih16WojfC7UDKvec2Qs6ZuyXcvgytqOX1WV5Mlv7jK/8rLYpMSt
	eEXiBo8VSBq/WiFVMj6XuD1PGZD0P0a0SoQOD8oboTv1LMkQ6OzLhxQIkePVUwR0
	yjpcHsnjFiyo3gLLmOM+FqQfGQ8uJEgGOzJVwZtSeEYU3Gt0uQYGRV295Gcsiw3c
	DN6RuGphbS+ZklGDK/xxfl+z6QmoH2BeVXorG2yCV7yYOiEnbDz7pQqxPEf9HGcZ
	8L0j7Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apdj09tku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 13:47:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso1882981cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 05:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764251259; x=1764856059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mv2I3k3r/RnePcRZs9VXFrqRAy47C1akTnpCGieEj3I=;
        b=iXzbhPOnZdZ8hTtN/rPlazkQ4YYwAZ+xzawB6Ss+Q2a3Syu6dZbcroNnzWDpA/ie/O
         sSpu8RPkhuEt1b+SjSfangg+myOSvFfq1ySkF/CG4KDWOCxj62p7kbGdkv/ixEkNvjcy
         64xu6Cdfhs59XOKABSVTKHoCO8YunYlPhgW5BQBVHe2l6luxIXo6rsYf/9vI15t5MFZz
         3rJ6yR2l5yKh35bdBQ8ndsomXUK7JGIYPZ0JVnEfHShY25evrYL3EahXEWG8qa0CJEeD
         7en+4fyFP3nXpi3QDwQDcLKNAWYAdUs+O5uEi7QqUWrmOjXtXwoKaV/ZhkXm7oqMqvfF
         myww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764251259; x=1764856059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mv2I3k3r/RnePcRZs9VXFrqRAy47C1akTnpCGieEj3I=;
        b=LKvK7gN1xYjR3IzCWKLZlfdOzvSwViXNL+2+MF8SQobucgf5/rha7pVSA/XdUyQGHq
         mE8sQlChXDcq7wiOuNfmFXnkp8nG2u70UuKaacMIY5WuOqL+os+SMzT4Ugg/uh/H0y0t
         9l4e921zrkr/oCddg3kqXp6eiunidW/xvwK75HBOU1lq4Hj2DQUwcaKaZqzFZpV7pvWM
         Bo1mbMFmpX60bKBtCdVbwMrLLFBnsfQ7HQoRQBdVV53mT4NH/DtOk79O95celzFEY+h5
         JQ4FColQHDyBy/yb7ZA/53i96G73cDatZF/EnznEKMFye5iK0i53U+EQf3wKTJcNlHkX
         NfDA==
X-Forwarded-Encrypted: i=1; AJvYcCVjzzBxsbQZPz369nwN4r1HC+mgoBeuDkw07lCA+khM5/lkVKVnCJHfPswOVmBWau4bWNYV/Cod5aApThlM@vger.kernel.org
X-Gm-Message-State: AOJu0YyHgM9k5pLC2e4DA99wSKxuc5BWjr9Mw+M2yOSmDvbTz6WwMS3N
	pJfGkvCPPMOJY+xDFbTh6B/upTjCY1TT1K9yxlYonk1KFKDT6o6BM5JWqj8FMb5ubU+70icKWam
	rHJOYpY38OiNDx4M/gbuwdteOEqiq/JFgvpKGviXtsElHUJKffngfNlHuRZLbeY7F1pOO
X-Gm-Gg: ASbGncsb7UaUY91Q6rrfAZ3pduIA7LBA3B1UACvz5OV4ZL9ATvHDBHa3hkH5MTrG8uN
	j8fHCmhHIpLs6zxZp0PbtDpcQ2PzmWdRCrB22E9Lgo+FMxq6PrAMx87DoPa8O3UadK7UQs7Ihx1
	MKeeOWEeZdqCBX9S5BgHQ4BlqAwKpHeVxKVxi6P3XCTise4E37/ZQyMRPlcKdWiCDmfdaTj7UH6
	cPU7WCviyT6hsuIOhYNzGWhxOXsjJ4AQGu30nlcJZWJb9iw66jTfkkqPLVt6EG7tvm5qSbcLAvm
	23umGUrJd2wuIWF7ta3bqR8XYj8ggwzZD+8lBPVs51nCtJtTnM4aFT32X+NCgrDDQTIczBDsPdG
	7Gia306aTgwjBLSSPo+3KJSfK5LSVs71S0GFYWp1Uv2cmP3Ji8W3cmkocE0jH+w+Vcd8=
X-Received: by 2002:ac8:5a46:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ee5885ba39mr230599071cf.4.1764251259155;
        Thu, 27 Nov 2025 05:47:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6iw/NbbB/BkfWmCjcxa2Agkt11et0h3eJ2YzX65775JcGnaWJ83sw779WcdrIChy1AMLznQ==
X-Received: by 2002:ac8:5a46:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ee5885ba39mr230598701cf.4.1764251258519;
        Thu, 27 Nov 2025 05:47:38 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51a9819sm178881466b.25.2025.11.27.05.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 05:47:38 -0800 (PST)
Message-ID: <3b609409-e19f-4685-848d-807a4e840ad8@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 14:47:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sm8x50: Enable UHS-I SDR50 and
 SDR104 SD card modes
To: Val Packett <val@packett.cool>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251126012043.3764567-1-vladimir.zapolskiy@linaro.org>
 <bdf3f54d-a223-4eff-aa71-0d74a83ef46d@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bdf3f54d-a223-4eff-aa71-0d74a83ef46d@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEwMiBTYWx0ZWRfXyTNOzLDiz4Fb
 cTcUBpIdkX7keLIaXdjgadNv9rhl2CNr39tBTNj/pSx5XlOvbSIHoumZmw6vr871TqzJRFfsjk7
 6tiAVC3NYYjYzgggroNiwGuVlhOGET3W1yIzdKOKFzuYAyTyoV4+6RTIK+r51S9dvZ1+yEDpV8Y
 wvORELBHrNE006QN9S0tLZ0OpRmy19EO+C5WeRuTv4yG6DDszrywVBBqqvWmlDrS0VEBXdnMcK8
 jAWaFKMMYLVIVpoKSULzgzdDufTERn/Ct2mLZ8BFsTea/u+KRn3UcG1clFgqUWpo5iA9zueoMDf
 2u25A1eHqbEnWWRL0YeY3qJ5fjcgqRxgyzXhy9QWrZNFOijI++o8xuGFCS8JMYd9kVOxH022Nol
 QnoFTRxeo0ur+YIttf/0kyH/Q3JgLw==
X-Proofpoint-GUID: F9OMyJW36dPiqtTz4YVqdLjlkbVAPj2P
X-Proofpoint-ORIG-GUID: F9OMyJW36dPiqtTz4YVqdLjlkbVAPj2P
X-Authority-Analysis: v=2.4 cv=PJoCOPqC c=1 sm=1 tr=0 ts=6928567b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NZNovLmTKhFXNInCTM4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270102

On 11/26/25 5:14 PM, Val Packett wrote:
> Hi,
> 
> On 11/25/25 10:20 PM, Vladimir Zapolskiy wrote:
>> The reported problem of some non-working UHS-I speed modes on SM8450
>> originates in commit 0a631a36f724 ("arm64: dts: qcom: Add device tree
>> for Sony Xperia 1 IV"), and then it was spread to all SM8450 powered
>> platforms by commit 9d561dc4e5cc ("arm64: dts: qcom: sm8450: disable
>> SDHCI SDR104/SDR50 on all boards").
>>
>> The tests show that the rootcause of the problem was related to an
>> overclocking of SD cards, and it's fixed later on by commit a27ac3806b0a
>> ("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs").
>>
>> Due to a missed setting of an appropriate SDCC clock operations in
>> platform GCC driver the workaround of dropping SD card speeds from UHS-I
>> to high speed was spread to SM8550 and SM8650 platforms, and since
>> the fixes in the clock controller drivers are ready [1], it should be
>> safe to remove the speed mode restrictions from SM8450, SM8550 and
>> SM8650 platforms.
>> [..]
> 
> I see you have tested with dd on the raw block device, but have you tested hotplugging SD cards that have partition tables and filesystems on them?
> 
> We have this kind of issue on Hamoa where we get I/O errors early, right after the card is inserted and the partition table / filesystem headers are being read:
> 
> [  714.057106] mmc0: new UHS-I speed SDR104 SDXC card at address 0001
> [  714.060567] mmcblk0: mmc0:0001 EC2QT 59.6 GiB
> [  714.503873] I/O error, dev mmcblk0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
> [  714.505660] Buffer I/O error on dev mmcblk0, logical block 0, async page read
> [  714.513632] I/O error, dev mmcblk0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
> [  714.516469] Buffer I/O error on dev mmcblk0, logical block 0, async page read
> [  714.516512]  mmcblk0: unable to read partition table

Before we start debugging, could you please confirm it's using the internal
(&sdhc_2) MMC controller, and not one connected over PCIe, like it's the
case on the Surface Laptop?

Are the regulators supplying vmmc and vqmmc in high power mode?

Konrad

