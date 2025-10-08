Return-Path: <linux-arm-msm+bounces-76336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D96ABC3DAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 10:34:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C78618870E6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 08:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77BC2EBDF0;
	Wed,  8 Oct 2025 08:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8yr1+Ma"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537C423E330
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 08:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759912448; cv=none; b=Cjq+W2byKslQr08R905DSz7ZokiuSktGJd2kW9eKqYrqZt26QvtDcCdiYSX+VIJfVYJgGoWixVU7oND3gGXoVnB4kQF+2nNxm+vbVw7Pxr6eda1lLZBPN9hT54vVu5jW3UsfqgCtcg+JkAVwAjTAOQKIX1mYFGtQnOWOc753rQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759912448; c=relaxed/simple;
	bh=oLH4gL3sKlBNp2czL6jTG0vNHuT7xrp294jl0Tqqsms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EEbYnSVDrSPrWQTgq2iRAtmHQyarveer+RakYAmmJ3aAFMbiRcvClk5n95O/FJtSIOoBVKCi85xidbc513yaJkGOttQJnYpJVCjbijusR2JX+qtht+f7WzUgsLTAAHuvPpKP9VwzjAGUWLMHJOtxk1n/JYb+a0v7szvJHBDsxj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W8yr1+Ma; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5987ak3Z014218
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 08:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	96qvYt9PH2+8Esd4lI6EIlwJhfA3GfEiTtlpLaXBruI=; b=W8yr1+MacjgEdqSK
	l+PcG4AoE7zDkaffnYmhAbiLYLE/Tno4c28R1AsW8nPUjpI4UkXyQ8HVMHizBlTD
	FffdqEzBuN3SSYZALcoFhGZdh1+aLIRhnsAIBKqe9dKAhuexCD49SOZGmWnvU8ud
	fQISVl09dj1ADqX3m9qKM3WRJ5M0mkh2bPmB4Kxcz6mV+4oVfMNCQPuM06QTlb1P
	kkNjUoSllWQ3OrQij2BPYCt4lf4B22+UiI5wE8sgvLCLrbvKkIglo5fgEk5Mi74D
	zrCJHZxbb1w3iGxzDf3VuTrzVE+MY/iQLvPffsmClWEmiaVtnwCWWkKPoil7unr9
	eQeQTQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpvn9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 08:34:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-873eac0465eso26614766d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 01:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759912445; x=1760517245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=96qvYt9PH2+8Esd4lI6EIlwJhfA3GfEiTtlpLaXBruI=;
        b=LCdPeYT6E91gVakaiDEB43itl6sHB9PIHKThxMbLRWAFwc5hmyafqEgLY2JQit4Fn+
         S2abAyRmslZnUu0f1bHLFRXm/IX4xKC29AvMGl8f0YHO1+xIAWJ68Lmnee0H+C61wqLm
         j+YnPVP+yYDLdJ3b1D7BTD6kBewwsguhLRXU6yqLdVv70RHvuUIFJ4W430AKivf2uNxz
         qaBtPgXXsp9665QL2hcVd5Q9QXuwQ0mKNdLb2GmV1r/rYmN3yNVCZjHGzSdTzReIKttL
         aVm7s146AyG4TbE3zaGZ23pyeIzvMtXoJuVN3NTxjxM6qVRAaCmxkiqy+Be2f/nPRkZa
         AgIw==
X-Forwarded-Encrypted: i=1; AJvYcCXqNGWWdMU52lRP/vIlc+Q8/pAJCEwC6APUDDWOcw1W4RGdXKsR5yWklBL8fCm7aDuZa80fIziaENd3m6Si@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+9x16ohLO3f+x325N6sJhVB1iK6okE1FXNI6GD/ruAftg2wjr
	oUNtMoPV1pVTeZIJt7pSPhydu50W5mHmJS9iTOEUaXIRnIc9ntf20gCVGdR0MEZapxPUjOeDuzu
	jOdFNolk2qzWZHChxh6MHMG2piJxEI/ox3ky6R/mtTYI6RGaoDTPB97/HK0cTIJm9zNJW
X-Gm-Gg: ASbGncsw4MorpBWq72rdHHtYLZok1zQosL6pHrKpiu1LujfvoM8glm7gxic6r98svGW
	J7Aplv9LVvnZYHdtr8q3HBNUWMQqAujnnIlJwxhqAOgbLhSyAZZ8Qwhq+MNh/cQsVq1o2nMoF7R
	44uGHndSbBgJG2KTVLWtLT5jegR7kQeIZMys6im98G9DCwu/DNTsxZPckWp7cKhwyPcr/vyHMpZ
	CmOBIeva94+AftYcqyXrUifHfyf+0T6zBpgDNSmK2fkaX5oiS93T+0gDLQd+EuQgmwplhy701qx
	ZY+VYWfkEeiSuDGGTLYTK9weBLJkXNLGMGbxIgzg6O78seYOnaVhpoe1uVCiM2c0QhKnqT1B9LJ
	rMdUMcL8XhR6XRYkeUUzaUXrSJlc=
X-Received: by 2002:ac8:7c4e:0:b0:4d9:5ce:374e with SMTP id d75a77b69052e-4e6ead2c524mr23170591cf.8.1759912444815;
        Wed, 08 Oct 2025 01:34:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnBHdB/VM2af2NJjNuVbyejWL9PETbDr/MrcW1c2vYD+dYad+sKWfv4fFHmFxNwUckGnx2NA==
X-Received: by 2002:ac8:7c4e:0:b0:4d9:5ce:374e with SMTP id d75a77b69052e-4e6ead2c524mr23170341cf.8.1759912444217;
        Wed, 08 Oct 2025 01:34:04 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486606bd5csm1609320066b.44.2025.10.08.01.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 01:34:03 -0700 (PDT)
Message-ID: <823af9ee-df4e-40de-bf30-084442bb1d2c@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 10:34:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: r0q: enable max77705 PMIC
To: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250920014637.38175-1-ghatto404@gmail.com>
 <20250920014637.38175-4-ghatto404@gmail.com>
 <53b1a622-3afc-4fd9-98b1-3c166f563ad0@oss.qualcomm.com>
 <BB4E3024-F897-452B-9D3F-250ED2D52195@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <BB4E3024-F897-452B-9D3F-250ED2D52195@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jwGQqsVgL_3bjErIFzWSi3Q_wKjCZx8K
X-Proofpoint-ORIG-GUID: jwGQqsVgL_3bjErIFzWSi3Q_wKjCZx8K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfXy6CQAaET1Han
 JHjaPtVDZ+DAyrt22bN84c2cuOPpO8rEfz79O99VqCgHzA0RuVTTogbzWu+Y40cBVXTc1Lr1Qbt
 p6VL+znYB5tKEbDXphuD8OUNkl04ejFIoh72BaPLo+b9tkq1GJJuE+N0ZS2OmJcp3kZhBjY/9QU
 xmb31IXiXn6ngyIPCIm3FfxGHJMWWTymTJSl9OqX7jDDDY4OUZ3dHF5UUlYE8YCUhtVMw63A7vf
 NeRGLu5BF99yyrXnkaShTXusEza4Ssat5YV2DolXqq1FohL4MnEzRdRba7ETwH+FvuL545TO3Sz
 apjH8Rdcor0A8hvNR3CQyIke9QOphp8yvXp/SqfikiKUPgsByYMZ+xmqoSNltwrusMb5ze6IoP2
 19/2o8vdDosecFGfqddwQVUuDeqxbw==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e621fe cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=HA2ILUQYlQLclBA0Y7MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168

On 9/26/25 4:19 AM, Eric Gonçalves wrote:
> 
> 
> On September 25, 2025 10:06:53 AM GMT-03:00, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 9/20/25 3:46 AM, Eric Gonçalves wrote:
>>> The Samsung Galaxy S22 uses max77705 as its charger, fuelgauge and haptic
>>> PMIC, enable the fuelgauge and charger for now.
>>>
>>> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +&i2c5 {
>>> +	status = "okay";
>>> +
>>> +	max77705_charger: charger@69 {
>>> +	    compatible = "maxim,max77705-charger";
>>> +	    reg = <0x69>;
>>
>> Please use tabs consistently
> Sure
>>
>>> +	    monitored-battery = <&battery>;
>>> +	    interrupt-parent = <&tlmm>;
>>> +	    interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
>>
>> interrupts-extended = <&tlmm 5 IRQ...>, here and below
> why extended?
>>
>>> +	};
>>> +
>>> +	fuel-gauge@36 {
>>> +		reg = <0x36>;
>>
>> sorting by unit address is welcome
> Sure
>>
>>> +		compatible = "maxim,max77705-battery";
>>> +		power-supplies = <&max77705_charger>;
>>> +		interrupt-parent = <&tlmm>;
>>> +		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
>>> +	};
>>
>> These nodes should be children of "maxim,max77705"
>> (see drivers/mfd/max77705.c)
> What do you mean by this? I looked at the driver, 
> should I add the pmic@66 node and put
> the units inside of it? Because starqltechn doesn't do that and
> places them outside. Also, by adding the
> pmic@66
> node it expects to have led/haptics nodes as well.

Well, the chip comes as a single package, so this only makes sense
and the bindings (mfd/maxim,max77705.yaml) corroborate that.

Just looking at the YAML, you should be able to omit the LED part
if it's not connected anywhere

Konrad

