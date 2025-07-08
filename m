Return-Path: <linux-arm-msm+bounces-64053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E14AFCD4A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36C923A7B3F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA022DFA37;
	Tue,  8 Jul 2025 14:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eJMTJ1mr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B518E2DEA87
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 14:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751984398; cv=none; b=lgf7xaBqlfnREXSAE29MIb8/phGW9eOBnLElGUrLgTilYgBBT6ds3nF9W3XlEoYeIb8zKCrJr7FCm9OMNctiNTPaU1aclu3Jp4bIFrhZ0EZtDXcnY3MvU4s8WdGdHfqpYzmCnZs0qlOCT65Znh6AQm1wspt/eBy1vxMT96i2AZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751984398; c=relaxed/simple;
	bh=HkLphNqugzPNkULwlET2cC5FiOAU7AKlDuc+7g5S06I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AI2fHiLizhrLTXGil4lHTmQ11BrEWjRw0MHJNIKdtr7L+N0/69zXBOzLPj0qhii1IvG/0tChzx0w5nyXw8kKxPsHLvzFvJjGrZbZIOdfxfQ8JGd5Pxzp0gRGTCHNbJB7DaPcZG/jIzswQAt5k80Fy6tx0FNFFU4/26tnKA3DzQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eJMTJ1mr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAEX2032758
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 14:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BanEk2RHzaJeEV6ZyoootTk25UM5XmLdjVm0P5oXSIU=; b=eJMTJ1mr/+My54oQ
	vfYUTAx7Rw3nTNQ2FyBUe9fRnUVhHXViAQbaevHx2oD1eyLr4/JqiP8N75CI03WH
	yB5GIjmaLZOsjusrWg4KSJFi79SWfz/SgEQq5zbu0Zbxi/FVP2NM+YBNClLSQWoH
	PJXyaJCSXjG9Q+nMHuMZji12K7FN2lyS+x/V+73Cwa+GFxdksj4jBco2L3/ZVhYr
	vANXk+srJXm6msOTz+jKr2FO3QJpoYLIFcr1IV1hmVmRyosPR8eWJUgaUAtRw7Al
	0aQJXIlPUjZ7sP3aFbUp4IVGf9t7OJasP7MjTT+SmOiHuBCBVKl1nR+lo4f2xP4p
	pWn6Tg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrkp3qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 14:19:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7cfb7ee97c5so25456185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 07:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751984394; x=1752589194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BanEk2RHzaJeEV6ZyoootTk25UM5XmLdjVm0P5oXSIU=;
        b=FMxquBOvLilrIpkZU9JXtDPc36aZjuj+sfimvuZ7oI7hUJCvwVV7zavD9/p0z1ePlG
         JU48MyOscLrdP0MitV0PZqAyIe/LGq+Sg9VAQgBnAzohBN3zIEMIVh1EDHLDScUN/5T+
         EAZDanEAw6Z18WzMqzQ0d7pCLBtt8lzR7SWdqcAnqzo6HyO1Hz1Bxt11vNmnHpMkJIs0
         deDK5EIENOpqMqvHcUuy4g7PRnUENgCOGorEsgg1NJg6VQ/b0De9x/xJAqBZzrTSccoI
         1YtTycOp2WwzjRbwUD90ShlHbsVIirWa9uc1/QHP5CTXyh8GOOoL/DM1yI6eM0eF/sJx
         Jaew==
X-Gm-Message-State: AOJu0YxBdU55TenoP+gaovGk2offhsMOFEwa8JJyum985S+nGl7bsdDh
	PuumU7lSrbHru5fYbSr26AovdfTd1VKFWxYAJuZiw+6P42kgFxXHMe8fZJbWFhbIehMefMehRZY
	GQHFXJM/19mAIqCA9rWQG0lbSyqX0H84VVpZC3TngHixYv2jpECebrRIbq9ECjz0Sahn8
X-Gm-Gg: ASbGncsjiYfGZzDpIcoua6JS1Jyoh4wCTeqS7zAGWFzUU2DVF1i1DioRX0tFBVA9c4h
	agWm5QIh7WY5ef9leoMijw5eWL6k0Oh92jFNCpKTP7VKDQM3gEmnj8TNgrrCK2+4AvDHnofsMbN
	h1xYO81UNycnBLAK158ZWnx1101aY6FOykQ0shmvOf1xtXWG6Jdyp/X5huW+HdY/V5MnLSDqBP2
	VuyAiRvXDaTZ86OhTr/8QP7bbDbIkQestffNBQFGY3Bpv5ibh7KF4i6orKssmFH6hko5uV2qWTO
	smalv4tzs/XWtuR5g0wjlyKvr4IF79+k8t+CqQ9u9+XnU0vY3jILFT85p31Zr9teYEBAD0r4Cn6
	81jY=
X-Received: by 2002:a05:620a:28c9:b0:7d3:e939:5293 with SMTP id af79cd13be357-7d5ddc718a8mr785765885a.9.1751984394301;
        Tue, 08 Jul 2025 07:19:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv2ihPdU/PuYCUkAU8M6E+45LpiasyPqOUyBb92phaclqN6A134RMBPMQfpFuf+R7oVhVQRA==
X-Received: by 2002:a05:620a:28c9:b0:7d3:e939:5293 with SMTP id af79cd13be357-7d5ddc718a8mr785762985a.9.1751984393614;
        Tue, 08 Jul 2025 07:19:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b04d3bsm884795266b.126.2025.07.08.07.19.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 07:19:53 -0700 (PDT)
Message-ID: <bdb5e19c-dbab-4ea3-9a6d-a4ac795fb43a@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 16:19:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: ipq6018: Add the IMEM node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250708-imem-v2-0-692eb92b228e@oss.qualcomm.com>
 <20250708-imem-v2-3-692eb92b228e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250708-imem-v2-3-692eb92b228e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dIywFrOZrU67tp3OJTMiIlJln3oYu9KO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDExOCBTYWx0ZWRfX+BM5K3lMxWhm
 nF2ejeJB+PRW0f2lVjJsIDW5UUJBop1usL+vHEuraD7CvnVQtAB34v+WICYfknvDTw8foaVBmOQ
 3zMErhgVxPtFKf2Kzcv3Izo85Gdps3/KHoJgq4Bmj45dNghBJkHXuhFiq+2UxZlcItrrkcC2YH3
 qtGzuLyLWeIk4vLFrUiroeSt7OQPORuli+otr5ZXTjs2738DAl3Bwxq4YpFWVn8LKTCNCaYTTNk
 6RuWKlQ/+Ty1jj/edSrtoLmKhgzHUVr+QymRA25A/u8qZQ+naDL0X0Ej0Att461ItqQWkKsW9kN
 EHRx6xVrHXESoKYYUXroAJzAEy82aJ5OFMqNyIU5+XQ5DH3TZTDolXVm42lOR7w/DHJ8AQhGQnA
 puaWQ1gKuELypmuc67i2UlmryG0siS9SrqbCzaWWOiiCwdZU6BAGN7WZp3+2JdFuLPndOj13
X-Proofpoint-GUID: dIywFrOZrU67tp3OJTMiIlJln3oYu9KO
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686d290b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=o4o9nyK-Q1O9M6IKefoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=845 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080118

On 7/8/25 7:39 AM, Kathiravan Thirumoorthy wrote:
> Add the IMEM node to the device tree to extract debugging information
> like system restart reason, which is populated via IMEM. Define the
> IMEM region to enable this functionality.
> 
> As described, overall IMEM region is 32KB but only initial 4KB is
> accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rounded off the size to 0x8000 (Konrad)
> - Represent the reg's address space in hexadecimal format (Krzysztof)
> ---
> In 'ranges' property 0 is used instead of 0x0 to align with the existing
> format.
> ---
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index bfe59b0208415902c69fd0c0c7565d97997d4207..3b9e40045906b26b94e2d2510b0570d3eaf084ce 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -659,6 +659,15 @@ qpic_nand: nand-controller@79b0000 {
>  			status = "disabled";
>  		};
>  
> +		sram@8600000 {
> +			compatible = "qcom,ipq6018-imem", "syscon", "simple-mfd";
> +			reg = <0x0 0x08600000 0x0 0x8000>;
> +			ranges = <0 0 0x08600000 0x8000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};

On this platform, shouldn't it be 0x6860_0000?

Konrad

