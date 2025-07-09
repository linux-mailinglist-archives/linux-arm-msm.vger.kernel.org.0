Return-Path: <linux-arm-msm+bounces-64112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D53AFDECF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 06:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA0F61BC2F90
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 04:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCF5266F0A;
	Wed,  9 Jul 2025 04:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7eXCplE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28051E835D
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 04:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752035320; cv=none; b=IKxNG3AKIFDmiISX8Ch7dOnJNYr/kQ+OVtPhihavOFiXH42BtgXg3GN2gW7LDAbo2CPc0gJ08z7NF7cNf/2eJFyfYWAYmZU4TVVzW5JQC29BUz/S0iugtja2qbWcbuY6epjeFslgPparndHs3kGC+fJ/ooNl0eAlTggfo8EaGTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752035320; c=relaxed/simple;
	bh=nGDSMdGiSbt3wON2yfyjNDeV5z0MkUjSja5IO9PLcNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gyjenVZUJcCpIYj3C5tjY8ZOlWRHWATuUttZaQPoPZICyjRFTnBA0X43AJx8UIlOM+8VJtpXf7cczJtTCeazXd9yHpFC7IHZodsOfbbAWDVZU2QUopA3zbAWkoX215fX+fNkY3/pEQ9wKCuo+4kCnFgxShfxtpnKTj7K1HMGovM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7eXCplE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568KFPSc008388
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Jul 2025 04:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	46kHjVSek0uSdgdCzU896+4gvfYavkSNrHpJbnFkc+o=; b=Q7eXCplEJXdX5i8l
	4a7Wyd5WNQCCewVOASQfUiqhZcdsGIC9z8qF+5UWBZgeSULL99PaPpqPfIBuIoYF
	2EZZ+0MH3R+eJa1BhedIWQpdNBOANg/TKEX+RHfIJGKEm1iGSfqkDlMHuW/hJReh
	kqggoXl9ZosLkTwnaIZ+a5R4R0qqe7oa+7APFhUiBQGMddEHrjoSbLurzJCRdnFT
	K0lq9i6jq76Zho9H+ebCcjmiGoIjP9lZgivfrKlTQYboqzdaKiHBJ2CMdX+4Xrum
	WDlPv+seXzcoC994pH9piuE8q3ylyFx3vdVKRQf7AggFNzOXNHLk7CxnbZcirwBB
	ft7F1Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn33fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:28:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b3642ab4429so3539454a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 21:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752035316; x=1752640116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46kHjVSek0uSdgdCzU896+4gvfYavkSNrHpJbnFkc+o=;
        b=YLyoGNSnG/LgT4ao2nFo8DkxdhrU53NYkxAIZ4sfbK4Kgi3D2ciT0sWq1kPgVC/CTC
         f1lY5EEcqgCoWi9po0F89Ep8x5ughDJf/leSF4lULnS3lHbzTQZ41osXiRC+oytnBMig
         HYwQ6yVzgrLq+OuVFe3UPVWIVmW/VJy3k8DyFdWQWEtlkNdYicQrMq6+eypCWq1kPvBi
         ok3tjHgrrGBe/8qqu1S+vvCT6+eg3i+Ws3wfg5ECq3utggluuQQUW/Wl+GytXS3j2L9c
         P7+TKSmEuNnwwcxAVzdLMvX5vU5RNhuAMmNyNFaC7tXvHTwTajSFbol9Eeiez2r7GHUT
         lUVg==
X-Gm-Message-State: AOJu0YxjZUU5Os2t7ahklfnhnIkle7n9XWNLqKx2EWtLSPhh2vxuM4ty
	sLsKAh07PH7wM+4CoRXAhlv85Gxl6nTQafjFogZVs5IJzZ+EjK3HVn4xERXKli62ZgO5BIRQcPL
	/Rkr72UGkTksbNQtU4zAYdJrMP15nU3qaPyZFc/d51My+rPpU+SGIls06c+jrukclPwRS
X-Gm-Gg: ASbGncuAIgpZihhTW2qlyXskckQ/pYJUchSKEsgZ+cP8OCwd1nVMbyVHsEjmEQWKmYP
	okDDTcx/Qsb3ecyC5+ysigEUrfBnPW9/+Xog6KeWXPsdmbDTVSJN2ME02/1ZQhS8gb6rvxjBN0h
	5RexLXr2XvYjhM6rCJcFQTcAxdkWbEBYwYztzTmuRiF1GWkrvMaEoYX55l3L/NQ/sFAERlB5/RD
	Xf15oEsswwJ0hQsUivWgjizlOh/HUnwADZy6C5gF+N5OSaJ6pNHSBF6CEkuc0g+ooY72NdIRy4Z
	+XA5EQ8uQBQEa7/GzYTkaOQpq0MNlgimzmEx/7pw5KqJSPcNDV4QScPNbsi6wRE=
X-Received: by 2002:a05:6a20:ce4d:b0:215:df90:b298 with SMTP id adf61e73a8af0-22cd865ae90mr1458521637.26.1752035316261;
        Tue, 08 Jul 2025 21:28:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1XrTBoe3AdLJKGcotRecgsSopH6Gfr07q95OqUr4/vqz2YgYImVe+KEbGNSUtTurtM2DibA==
X-Received: by 2002:a05:6a20:ce4d:b0:215:df90:b298 with SMTP id adf61e73a8af0-22cd865ae90mr1458495637.26.1752035315826;
        Tue, 08 Jul 2025 21:28:35 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450dcfsm13036210a12.2.2025.07.08.21.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 21:28:34 -0700 (PDT)
Message-ID: <dd2fab47-d451-43d2-b2d5-36d957c5aa46@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 09:58:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: ipq6018: Add the IMEM node
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250708-imem-v2-0-692eb92b228e@oss.qualcomm.com>
 <20250708-imem-v2-3-692eb92b228e@oss.qualcomm.com>
 <bdb5e19c-dbab-4ea3-9a6d-a4ac795fb43a@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <bdb5e19c-dbab-4ea3-9a6d-a4ac795fb43a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686deff5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=CWjMFFrlLJj86FlfhvIA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: au23bnJ3fMm8TPR7VGGssXTMikTu4Vt-
X-Proofpoint-ORIG-GUID: au23bnJ3fMm8TPR7VGGssXTMikTu4Vt-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDAzNiBTYWx0ZWRfX+TStoAQn1bbj
 i56W8+POAy+xQmB2lv26rE46wEzRTgG2iD4dme3UCWPj7XAhrJqCOOrQMXFFOohDk8QEW8XFj+h
 7M2LVTFWYrvfeM0xvqLFR4sqvOdRVYVSRfiknOKq4AQeHh0UvlcfzW4ZdTDQ6LAHagE3wlHWUMA
 5Bw4neLyNVWjZudRMIsyd1ufFHgBkQ4Lcm8ZJDmUBvipzBr5vBCxjIP3OfBbCcl7lo1FTDb++9j
 yt4SwK5nj/W63h587NbxzPwlyxAy3QYsB+BdsUdh6fd2Dytxu45W7cv5/RHVakGMEUmyqDhsDro
 f51DZjLrTut3YOkHXTXXo2S4nu8QfKFQs/oJFDLqxxuvDeF1mKEKakFVqya5pDD2/M6RDqfdu9V
 VruL94eLm424465gdGpcLdNbLxkqyWyneS78Gg/UFQLtAq8/C8arD61nJarIVXNY4AzIDYWH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_01,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=920 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090036


On 7/8/2025 7:49 PM, Konrad Dybcio wrote:
> On 7/8/25 7:39 AM, Kathiravan Thirumoorthy wrote:
>> Add the IMEM node to the device tree to extract debugging information
>> like system restart reason, which is populated via IMEM. Define the
>> IMEM region to enable this functionality.
>>
>> As described, overall IMEM region is 32KB but only initial 4KB is
>> accessible by all masters in the SoC.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Rounded off the size to 0x8000 (Konrad)
>> - Represent the reg's address space in hexadecimal format (Krzysztof)
>> ---
>> In 'ranges' property 0 is used instead of 0x0 to align with the existing
>> format.
>> ---
>>   arch/arm64/boot/dts/qcom/ipq6018.dtsi | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> index bfe59b0208415902c69fd0c0c7565d97997d4207..3b9e40045906b26b94e2d2510b0570d3eaf084ce 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> @@ -659,6 +659,15 @@ qpic_nand: nand-controller@79b0000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		sram@8600000 {
>> +			compatible = "qcom,ipq6018-imem", "syscon", "simple-mfd";
>> +			reg = <0x0 0x08600000 0x0 0x8000>;
>> +			ranges = <0 0 0x08600000 0x8000>;
>> +
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +		};
> On this platform, shouldn't it be 0x6860_0000?

Actually, that's from the RPM perspective. From the ARM side, the 
address is 0x0860_0000. The hardware docs show the RPM view by default, 
so please switch to the ARM view.

>
> Konrad

