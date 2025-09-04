Return-Path: <linux-arm-msm+bounces-72008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A506DB43694
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 11:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59D4F482047
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 09:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF99F2E1C6F;
	Thu,  4 Sep 2025 09:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8CdGFlp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD8F2DF12A
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 09:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756976726; cv=none; b=pKlbQdRiDLX5lck4KXuR/gcFD/jkkWfwKJEoZ8+04bi94riJs5NFwU1HvkzbXlOgW5do7UXNVnkDgSQ9QHBPL0nrc0M4jath724MyvGcXf6/XUYKMnjx+2fKXl44fc4k4YKlPJ6H9kPRPc1Kakhdk6JW16TwbDXMSszaLIBGVNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756976726; c=relaxed/simple;
	bh=plmPEpfQMO3YEjTyCXmuGh54NXSVgSjwnmBAsPAbVyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BiIyaqEpww97XHGVDYejUt3c2Oea0yXpbqMXik6bHVNWv83r+SIT8EmafUMJbwm3x2A7GLO5R9pZm/XFJSIGEweN7zY7SdhgLaSrQkxd/JVe2AkER/gxpzcDJRF/Q/y2JJotSA9B2OASQpkc6oqhLAsirPULgTTTfLVwtW9FLH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8CdGFlp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583NuItL021011
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 09:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y3354bZOtkc6dotBrNo46+kgtyiv6WAidh4XlD2eQB0=; b=J8CdGFlpYm23cM3o
	qA9PNlfuOuT/8H21G4e1agtfqjPU0sHk741L/txViUEOWwz8iCNFjhv9muUZ0wbx
	gaDTd7JeDpC0gqgImekJ4YiDCvqRj5eBmBlwnte8tCMHTWv2SNZ7SynLJdCLulPw
	N4uHT+qhQQJGl5cupih1yGy/TVqCpGUI1LpIXkNBeIPDgbpyx4qAV+ONX+SNn1IW
	KvEG2ZB7fh4HHi2Qj8E56l+YdrKbt9h3GtDbK0UtHQOv4U5/vBQ5omax5XVtS43I
	kF6l6bo9Tb4kbIbCGd5vaZhQxGdtrLfutgcTogjUoB2kUGnPi8pTc+t0vyTM6347
	oOUQHg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fps54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 09:05:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b33e296278so1338911cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 02:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756976723; x=1757581523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3354bZOtkc6dotBrNo46+kgtyiv6WAidh4XlD2eQB0=;
        b=kINm+YS25OKMMWXdTKdMMX4zGH6dYPCtNFDqpmExzPIzZgT7STSQnCoJj1nlq4lEQl
         VTH2i7DDEvPYnWoZ6l1qlSvjvLM4ZDwlHauS85BOC+VTI1y8bXLkjGMCKwzUjgN3OROQ
         yI4H7b2vRlKymqfKAXwJbRGKV1HQvs123dfBj95M32/E90Kdp638GcqxzPR+ju5YUbXh
         SfR51ctPzN5ohFLt7oIv+5wVpyLY32Q3m0UnOmahGNwWLC8mb2I+U9LlLN3T0yFtRD27
         /zMgRqbVrnctAK/Ocsw8DqHZrnty4tlrHoLh0O9mBc6mYToNaTxL/3J0Im+P3E+e9ZdC
         CGZg==
X-Forwarded-Encrypted: i=1; AJvYcCXnhVxp0gAaxVDNIPL2i6moPTBQAO0Bmu66eJ0Ru/u3FSnGgPao6qtmHrV1ujRjFQx9zFulfO2s7sYgmosD@vger.kernel.org
X-Gm-Message-State: AOJu0YzaAQk+ToZDUlT1doivTOpBK67J4veyORY9uAuWpLBVRULpixAK
	WkAO6MS2nCaBr25khqqnSLzGG4CZcmrovZyXfu8OzPLUkLX/6jMMxJJ5pE4l5JYjQjcopMlNUiO
	OojDcIREdBuIqFgFcAiSrBWEfu2WMXo7ovy2AjjpH/IgLStZGrVJojOwQtwDjn4HLtzqo
X-Gm-Gg: ASbGncvhXrU0fwbeXzI+0qIrOPD+UmVYbBE0p7TeVGsOkJECe/D0PAihhroLgLu79sy
	3wJP1iBZ3W1f0FyRCdKhb/FENeGZg9dyTnTuTleZgRldScmhNui/tS/h5kKP0BU5fO6drZ1tr+0
	GLOFLeuN29+hJ3EA97IKPip3DYn3mP4DKANQF9rNrsZpB1ekZs70oRTNJfFnuY8EZAGRbAX7xGc
	lMEtdabtO8b6BSfSSPt9UxOFbsXMdIsfUQpu8GAO9gm7ecA6HyvXpQ4SwojSGe3zVOAnxsAc/5v
	KAnzi7d2jFVDAA2343M8s+shFrd3wem+TDt8WqXQfHxWy4s8lVr6D8NKXndc4OC0u/JfMBjasKc
	3vUUaqLiNuWL+8SV74IHdWg==
X-Received: by 2002:ac8:5d12:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4b313f0e6e7mr174872801cf.8.1756976722792;
        Thu, 04 Sep 2025 02:05:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKp0JIOqe7KcHRuwNbMy/T1sz594GUnF25np1+U7x9aNCZ0OMz0fmzvg55AOLuXRjrIcc7gQ==
X-Received: by 2002:ac8:5d12:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4b313f0e6e7mr174872511cf.8.1756976722305;
        Thu, 04 Sep 2025 02:05:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041f6fb232sm1089893966b.87.2025.09.04.02.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 02:05:21 -0700 (PDT)
Message-ID: <da1781f2-448e-4236-8af2-d2ee0744f588@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 11:05:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] pinctrl: qcom: Add SDM660 LPASS LPI TLMM
To: Richard Acayan <mailingradian@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, Nickolay Goppen <setotau@yandex.ru>
References: <20250903-sdm660-lpass-lpi-v5-0-fe171098b6a1@mainlining.org>
 <20250903-sdm660-lpass-lpi-v5-3-fe171098b6a1@mainlining.org>
 <aLixvcgoRIHoniv-@radian>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aLixvcgoRIHoniv-@radian>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfXz8npT9oFP7JD
 1BguPQzWGecbx9g1AySZwBoTn7IfYJRtZmjUDFe5+j8hpsJ5DDXGe4LDNmmEnhmNwRmsCte7Gco
 +c+QUWmYBPnz9S4E5FsPdBzHx5J5Ef5hZ5zdvPqNOQs2o9td8ozDuFp7YGR5sQ+9GJea/UQG7tg
 ToroAWsyLb3Vo+0lk5n9utaY05sAa+m3CvEkXmRBx7BTVfXcP5IPWkNsO6abagQoBbnCftAJBz3
 hBtaKKhFim4wWTQ/0nyk66oLUVH+hwkT6wUSkVTBAioJJI1YppcJqCVrpCqeF2lM8PvcTRFkAqa
 5DG3Hrb7z+Prrgs+EKM+9Q0O4Q4G3j7mg8wA2jl8s5ktfLyOJrvA4RSEVrOjxwPeCKulG6+YKTO
 AFE1cOCi
X-Proofpoint-ORIG-GUID: lxUXGakZAadpmAY_cfqUPa6b6V_TNmTR
X-Proofpoint-GUID: lxUXGakZAadpmAY_cfqUPa6b6V_TNmTR
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b95654 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=pGLkceISAAAA:8
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=cKVQg8D8wNGJnLBI7BwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=fsdK_YakeE02zTmptMdW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

On 9/3/25 11:23 PM, Richard Acayan wrote:
> On Wed, Sep 03, 2025 at 04:39:03PM +0300, Nickolay Goppen wrote:
>> From: Richard Acayan <mailingradian@gmail.com>
>>
>> The Snapdragon 660 has a Low-Power Island (LPI) TLMM for configuring
>> pins related to audio. Add the driver for this.
>> Also, this driver uses predefined pin_offsets for each pin taken from
>> downstream driver, which does not follow the usual 0x1000 distance
>> between pins and uses an array with predefined offsets that do not
>> follow any regular pattern [1].
>>
>> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107
>>
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> Co-developed-by: Nickolay Goppen <setotau@mainlining.org>
>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>> ---
> 
> (snip)
> 
>> +const struct lpi_pingroup sdm660_lpi_pinctrl_groups[] = {
>> +	LPI_PINGROUP_OFFSET(0, LPI_NO_SLEW, _, _, _, _, 0x0000),
>> +	LPI_PINGROUP_OFFSET(1, LPI_NO_SLEW, _, _, _, _, 0x1000),
>> +	LPI_PINGROUP_OFFSET(2, LPI_NO_SLEW, _, _, _, _, 0x2000),
>> +	LPI_PINGROUP_OFFSET(3, LPI_NO_SLEW, _, _, _, _, 0x2010),
>> +	LPI_PINGROUP_OFFSET(4, LPI_NO_SLEW, _, _, _, _, 0x3000),
>> +	LPI_PINGROUP_OFFSET(5, LPI_NO_SLEW, _, _, _, _, 0x3010),
>> +	LPI_PINGROUP_OFFSET(6, LPI_NO_SLEW, _, _, _, _, 0x4000),
>> +	LPI_PINGROUP_OFFSET(7, LPI_NO_SLEW, _, _, _, _, 0x4010),
>> +	LPI_PINGROUP_OFFSET(8, LPI_NO_SLEW, _, _, _, _, 0x5000),
>> +	LPI_PINGROUP_OFFSET(9, LPI_NO_SLEW, _, _, _, _, 0x5010),
>> +	LPI_PINGROUP_OFFSET(10, LPI_NO_SLEW, _, _, _, _, 0x5020),
>> +	LPI_PINGROUP_OFFSET(11, LPI_NO_SLEW, _, _, _, _, 0x5030),
>> +	LPI_PINGROUP_OFFSET(12, LPI_NO_SLEW, _, _, _, _, 0x6000),
>> +	LPI_PINGROUP_OFFSET(13, LPI_NO_SLEW, _, _, _, _, 0x6010),
>> +	LPI_PINGROUP_OFFSET(14, LPI_NO_SLEW, _, _, _, _, 0x7000),
>> +	LPI_PINGROUP_OFFSET(15, LPI_NO_SLEW, _, _, _, _, 0x7010),
>> +	LPI_PINGROUP_OFFSET(16, LPI_NO_SLEW, _, _, _, _, 0x5040),
>> +	LPI_PINGROUP_OFFSET(17, LPI_NO_SLEW, _, _, _, _, 0x5050),
>> +
>> +	/* The function names of the PDM GPIOs are derived from SDM670 */
> 
> Not anymore, the names now match the other LPI drivers closer.
> This can be removed.

With the comment removed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

