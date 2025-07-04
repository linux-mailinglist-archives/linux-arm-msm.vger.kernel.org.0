Return-Path: <linux-arm-msm+bounces-63676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FB1AF8D10
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 11:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6197256089A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 09:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19542C08D7;
	Fri,  4 Jul 2025 08:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOD8v4Zo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326EF2BEC34
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619283; cv=none; b=cni4GQUd2/JrOAS0TL6dlJ/5XSX2u+AU9gwHbDTzO+wSYeNJc1qYfy4+2IZ86M4DvtZSaZI31DOIt9UjGOic2T3VdxCMBAwctnjJzNLFh3Mn/zz8Wpry0Ds8mU+5zFF1JCv0iJSxGiOsxPh5RX0IC0mtN1mFkdzCQT3AIwPMJug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619283; c=relaxed/simple;
	bh=zaaxoxNgjPUuxdMxeFXrTVZNMlPBYMs/ecrVcRQNRoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K1Ge1bWOsSZGdUwjiXoM4YtHpS9V/XVpGdWazIl1V0ZVMHEYEsw8LEoIKEHVd5KQj4yTXZndos4RaKP+wUJX2jjXlPO5unCdROXhj0UUZTWXL7fsTv6CwEs6+rEvw8C4ipyVxUlBiO/YmX1AyfCVdnYfUwgYUglVPtrtwKeNLQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOD8v4Zo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56458uYb009719
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 08:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNlmPCpy3Uf3D/WdjoT5ezCikZt8RI8Mo7y6vQzht5Y=; b=mOD8v4ZoNJRcLV8M
	7qpQDjxhqpFVdRZj4J06qCa/pnKaTaF7dvp4PyGf3SOQB7d8oqU3ZQuRsBEUw+4y
	hC/BznZUQ8xrAKL90JdHFywlFKUPh0M5p83gJUxML8hLx1BlKhotXJVVGhkKpenY
	6u88maKXg0G0PRTHlUtkzDBNIpR23irXhOglna/+lZ0ioAEeP0ijD+7qL7oG504y
	YPgrFWbOSsndWUG3s3BhWkI1ruw6ppEi6hlG2Gwyn1BJUEQHjOZUPLpTMIcLjJBb
	rVSivOBz1KlU3ITqN1U0GDpzh8DIQgjkGR9Yvm5vn0jeALn8THGmZYRPyp5HgECz
	RCC0Pg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw3cwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 08:54:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31327b2f8e4so877671a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 01:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751619280; x=1752224080;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNlmPCpy3Uf3D/WdjoT5ezCikZt8RI8Mo7y6vQzht5Y=;
        b=FktXRI75Ae3VDRE/M6uxEj11WPX2xmkU44CegpG/jOFYtV6Q5kQHfxIwTuU6yldPHn
         viBJEG4SYyWKLa3oEKcvj7h6RdVFmSCaE3FLV05HovM0IF8RopVEfMLOVhO/NcH5+p/G
         nFGFE//JRqZ+vF7bu23Y++QAS5UHkG931RARkvD3u579543zO3L4cTs0osnmKqUTiIql
         hufQFUyPOcPdsqUu7SCXS0NU+zpkCovzMLpoxoMwPLprhkwWfKXRAqMhSHLQIyErLQC2
         lbTrLvIIgLaUsWH47xC58rb1NoEm3+CrtQ2WICgC3dQ533sSk7oSdy50nLF3F80lfj0C
         9Dmw==
X-Gm-Message-State: AOJu0YxXtTIdGz/EN92vMs1UwprqjNmAkwOLxYtgI09DhNQWdQq7bxxJ
	9b4aFYNLdoo6Ay2Db8+9a7alWl7k33gV+baYEsNDBdX0k+k5OpVVcmGr/g9K0wYBXY/psTtcTPu
	YbwNllONp78sw6AzihRNiH1CDKZOOeDNgbPqW21pDerVHv1RYHJ+F4Zmg9KU1hUvw/zQTPGh5pD
	GD
X-Gm-Gg: ASbGnctBMYAEh4b2hhrBVlC5pyZn74717I0hRTu9ErncTcpJ+Hfwoosilg6COT0Sd2g
	PP9r+v/v6TdBf8HX79R7yMM0zf/82lD9O2Hc3iYNuH7mocAxy4pEHEM3kUaP6gvBrW47SDprjDf
	O12Q9idrU8DEDojSTSO84K/KXq37hUfgVJC8yKiTKJKsfqtyM1to2iBnPNI/+GjYl/0WueTKqyD
	3TGpApzsGoqqDiup4vl6JzLIPejjiYIvt2dm57JpdAjlNrVWDqHuIdJ+M9FN2M69Ebvn65xP1g0
	ybxsGvSVdjNGXPp2mwN+VFxfrEx93ZzJ7v1KNmu4zx6T9x5XtlWD0o53t+MUurs=
X-Received: by 2002:a17:90a:d88c:b0:311:c939:c851 with SMTP id 98e67ed59e1d1-31aac43865fmr2897316a91.4.1751619280443;
        Fri, 04 Jul 2025 01:54:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH43RXiz/iv6OSVtPRo6JR4bRRzwFOrl87rAT3TwkUaSHbMeQVe+/sFB7ICmDNNgjDen93Xyw==
X-Received: by 2002:a17:90a:d88c:b0:311:c939:c851 with SMTP id 98e67ed59e1d1-31aac43865fmr2897300a91.4.1751619280056;
        Fri, 04 Jul 2025 01:54:40 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c84446c4dsm15030975ad.80.2025.07.04.01.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 01:54:39 -0700 (PDT)
Message-ID: <d4e7dcb1-5a6e-458b-9b1f-28298fefcbd7@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 14:24:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: ipq6018: Add the IMEM node
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
 <20250702-imem-v1-3-12d49b1ceff0@oss.qualcomm.com>
 <96073931-644c-4d77-9c61-45ec65adf928@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <96073931-644c-4d77-9c61-45ec65adf928@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aRqbPLomrCmPNDgsp8nQ9TWJHCWOeAAZ
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=686796d1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=jZhe5MNW9S75RuEgyRIA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: aRqbPLomrCmPNDgsp8nQ9TWJHCWOeAAZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2OCBTYWx0ZWRfX5kMFfMdMt6Td
 nAbZMf9210eMEN8aJkGKXNHD3tuL+LJ0USc5U92///t4bt2HZM82cjYoBEJo9RbQx7DoH/FLUiD
 KgXrFEfbJRERtGM2rOOzBnmsH7qsZkUtJLlA5xd441++scceK43gHjv3QipPQ7dd3aRUUyMznKN
 X3wx8H6iJagN3Gmdz0so0+HHJNeHgx8fO7QeEmCZ0+84eHMFDTyFbhbAejDH3dUnUc7EgHPfDhD
 ztKyHlgBS7l85vW7IxDeUMIzu9pKuXcSoIw3dfPbcmZ4fU/ShrNZ4zDDwt4kyusIk4sgOz0D/0l
 023J07cZ83EoFLHFF8YRmZcUXLdiu8IBKkXi9B1JopNvY7f01AMbP3rw/nY1UFfzJb1bQUAl7Wr
 uAyPIVTAy/L/rWP/Zap2RXuNI+nNLkDqLlbKrWisKV0YP/gORyPwoG35EOYH3SKPvJH+cTtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040068


On 7/2/2025 6:29 PM, Konrad Dybcio wrote:
> On 7/2/25 12:17 PM, Kathiravan Thirumoorthy wrote:
>> Add the IMEM node to the device tree to extract debugging information
>> like system restart reason, which is populated via IMEM. Define the
>> IMEM region to enable this functionality.
>>
>> As described, overall IMEM region is approximately 32KB but only initial
>> 4KB is accessible by all masters in the SoC.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq6018.dtsi | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> index bfe59b0208415902c69fd0c0c7565d97997d4207..7eca5ba416c2ef5ef1c4e0eb4f58f1ca94fc92f0 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> @@ -659,6 +659,15 @@ qpic_nand: nand-controller@79b0000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		sram@8600000 {
>> +			compatible = "qcom,ipq6018-imem", "syscon", "simple-mfd";
>> +			reg = <0 0x08600000 0 0x7fff>;
>> +			ranges = <0 0 0x08600000 0x7fff>;
> I firmly believe there's an off-by-one in the docs and there
> isn't an odd number of bytes reserved in the hw
Thanks, I cross checked this in the SoC and I'm able to access the full 
4 byte at the end. Let me fix this up in the V2.
>
> Konrad

