Return-Path: <linux-arm-msm+bounces-86237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DECCCD6173
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 14:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBFCE3044681
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 13:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA372D4806;
	Mon, 22 Dec 2025 13:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g436c2Np";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvD5N6k5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0642BE7DB
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 13:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408811; cv=none; b=GLw1twqezAzZ9nfZJBGUvASvg4Vpep9mnFMkHtMGt5FyrXSTw8Z7P106LLV6DcTjMK08ovWTjhlxFZePURGcU8VGpy/9GGLpd7wUQQ9u/nNWIKr/kTEjM3Gai+EZeV09K3mmzs1Rk6Ehbbnfqnr58dKOCYQtAZ86Dpy38ZYLhiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408811; c=relaxed/simple;
	bh=wv23DNsmsWzJoqwPtzDiDiysbtjWgZAM6vtUwbCcQwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AKqCvN9Wd6Vd9OSIpwc+8gbq20SslbfBasvficRh5huE4utCRBVYQxVT3iVwihJxNWvKfwsE2RXkVLqxeWIPaOMOAG0BwoqyyO2luuF2ewLjEeNKxKsfK7xgN1lpMaLBpxVl5xh44JeXSdUhmofPqTJCB072AeqrmET9e8fOWDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g436c2Np; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvD5N6k5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7qUlY3985379
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 13:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rl34VUSIcLKGSTcgfDKK7LNhN6XEgT4eoWUw45WEru4=; b=g436c2Np0AohmjmX
	W3NF26YkDIeY7QFDA40v2H/XS2cpwspk+DIYDXnNsBE4heNkzwIx8H8Ct6ikcz8Y
	Ok4RLf/C7vOywr4L2qX3FMQI2GZOXaD3Zyg1FDWfGKhiBmz/ZRhihEpBjymjwYgO
	ZwC4tbJDcTaOhBcI1Ry+PWtyzMb8dgDA2jkRqrU/ESWapuSQ5MwdK/fxw3aAwlwZ
	j8OD34SXDYnqeQWPELQUK8GEZ1/xGpn+sRgzcjLsRJ/BEfhMxU6NSU0jVFXkpggD
	fLx6EjTQTiWTpNwEY35EgmOZKDXFzPByyBf7gkl5cA7NpGcDPu2wQEQ/kJxAd9TK
	00vWhw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfn1st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 13:06:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0bb1192cbso79239425ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 05:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766408806; x=1767013606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rl34VUSIcLKGSTcgfDKK7LNhN6XEgT4eoWUw45WEru4=;
        b=YvD5N6k55QtlCs1rAjdtuDk9TuX8bpTZCmSSxB2NZTFFMdi6C7rFTCGyd+3wNFd4/L
         ygmNKmapvXhFUv6VnCavGRlcmfQ7nC6FSD4jRc0VVVDYU+HEanXHBJAFZpytmcxGfrjP
         ZMiBMNWaYSs/BEhWOP4EgLAegqOkzohU2ZmS/fYczi1cxeoG7FeputQfffb3XMNJOLYD
         mF4s6qpqEiCB513H0JNQZIdemYhP8vRUI+I8AAgJyuJuhsKOJ934SE9mrNNOezS4/VqT
         SE7m1291zJbsXluq0djGIeDDAEp5BlJEwqTKI/0KaLvI0YSr92ZziW5bJMauYgtLpe9L
         xpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408806; x=1767013606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rl34VUSIcLKGSTcgfDKK7LNhN6XEgT4eoWUw45WEru4=;
        b=Y1/VsTaJ0HLVUe4/8XK8V+U0idJblCDSI+SM3qPmBx49/KJB7e7dnygfX7q+78Ejpk
         vSJYgpQrEI471hDO6GA+eTd6qDrNQyxHIPlMYT1czjteI1Wl9cqTptpdUG26rRuAROh5
         +z9U1oklvvZLQ4M9VlL42b9nnMLXmdbtWymCsUEupx//+aiyqoLjShzGALm6P2bJg/ng
         jiMchKqGrqpI7YFmx3g+qd27ZQlymZ+AHKOXgrSx+SAItaCaIirXMxCp+of++oFFhAe+
         n7uuRpwe+GXyEuVeSTehiCL9AjaYHr+Kw8lj2SiQ6HFV6KU+5eArZBP414JIRu2rWfoT
         bbRg==
X-Forwarded-Encrypted: i=1; AJvYcCXpmgNXQipzMB/PJtohVqXgBJ0hEyR08z08t7lfX/ER7a/6XKfqErHuXmGLsVVqQtBDEOLwl0albDye+QL1@vger.kernel.org
X-Gm-Message-State: AOJu0YykIlmH5vCmdMzMiofqW9baI5Rq1OPctl5qEHunPZ5CYtkgLjiB
	wISX4R11Z0nLxZ1zqlB5g33WcjVCG6Aqs6mkjSYojW6+f4+IKi941khUMsJsP6svKXJA+SoxS0i
	f3YgGrqPNHeMq1FKf+nqoTIp6N1voDJ98TCG64VUK54XpOgg9lLN+gfvndgg39UIvcsbD
X-Gm-Gg: AY/fxX7QqG6/jYabO5iUYnZZGYrhR2iRRN+mJeou2AbqJMOuSmoh6mPhNRezyZKnmHq
	xJCoxlc0c5lMZmBYLly2EwLg6/1RSjKsr9rRhrXdhif3WE1HsvLK8OvsghhLssdTkcluRxUeXsI
	fiIwmsZXY1qWB7SXiwKwU5hrZjhjst0wTTqyB1oxEt4uiIeozE8YQOoGQffW1lJ+nTe2vA9Vbh4
	/qhbVkcxquE1EEtdNn7hxcloazn7kM9FpI3q3mhuRf2z7XytHerKCg1ytoaaSJApWT0Vmjmv1lR
	EnmFHlcvQjBzrCjEQ1jUm4k9OFe1EJcB+9Ieq7d9rdiemBl+eKx96AIEQnK6LcTbty/RxBi5PMJ
	Wr9G5IT3fUr7tJlaMn/vbcoB6xvwHyMxsZ5laRQty6g==
X-Received: by 2002:a17:902:ccd1:b0:2a2:f465:1273 with SMTP id d9443c01a7336-2a2f4651332mr99434235ad.35.1766408805893;
        Mon, 22 Dec 2025 05:06:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlbxx3zSYC7hX0CsS0/1ozD2P9MFWi8YNJtWnOe1tHF2S4inDEMsj0XZcm7mX2MOc53RRZRA==
X-Received: by 2002:a17:902:ccd1:b0:2a2:f465:1273 with SMTP id d9443c01a7336-2a2f4651332mr99433985ad.35.1766408805432;
        Mon, 22 Dec 2025 05:06:45 -0800 (PST)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d6ec60sm96922405ad.86.2025.12.22.05.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 05:06:45 -0800 (PST)
Message-ID: <f6ca8c43-9f00-4dd8-9e11-90f2a4e8d18e@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 18:36:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: leds-qcom-lpg: Add support for
 PMH0101 PWM
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com
References: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
 <20251215-knp-pmic-leds-v3-1-5e583f68b0e5@oss.qualcomm.com>
 <20251217-quiet-wandering-gaur-c9c6fe@quoll>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20251217-quiet-wandering-gaur-c9c6fe@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=69494266 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=g5AuMlRjdp1IwKd9_dYA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mMJ3Vg311jFMK_Gw4xwJ306EGtWY_o77
X-Proofpoint-GUID: mMJ3Vg311jFMK_Gw4xwJ306EGtWY_o77
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDExOSBTYWx0ZWRfXzH8FlnZ8saEZ
 WRkwAcZMS92dbl0PZ4LLFNAEHTUtBIegWt3i5lchlOCMq+aJf58jRX0oCCgpbRkCUoehdQJTzbX
 zdB3lHoDBCRkjt5oCTnwG1mDjXzvyPN9OdscVIlDD62ePmWnmLKr1EYzAgGHtSth5dPL9yN6OsC
 LPW+LpXVD2nn18e5k2H0IlCDeQvoH7eiHaiHAupmIT7gbRnnWl+8E789zTYBTL+93K6y/bj4G7b
 XgFVT8pCdc7/Nxvji2Ad1p41sCJu0teyW29KNT8zJ0lPgtQqn4bUpyXL7O7rtdoz9seZXbXe/Uu
 aNrTaqGME+rxJW71j2nQ3MoPmdb5cXQYmzfujdTgjFqDfVJk/RZbpvmbmfd78BGpH34Fp1golzM
 ORFHWKz7rVx7siv3IAY9pSCig+QWgMWfxi/Zvc36D4MWAVzQ1+v0l179fndV+puB0HYLXLfvvKs
 DFQMcbsCRQB4xtFDS3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220119

Hi Krzysztof,

On 12/17/2025 1:45 PM, Krzysztof Kozlowski wrote:
> On Mon, Dec 15, 2025 at 04:41:04PM +0530, Jishnu Prakash wrote:
>> Add support for PMH0101 PWM modules which are compatible with the PM8350c
>> PWM modules.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
>>  1 file changed, 1 insertion(+)
> 
> So how many nvmem entries it has? You need to define it in schema.
> 

PMH0101 PWM has 2 nvmem entries, the same as PM8350C. But I see that
PM8550 PWM was earlier added under the "if:then" condition for the number
of nvmem entries and you made this change which removed that line:

https://lore.kernel.org/all/20240226073713.19045-1-krzysztof.kozlowski@linaro.org/

    dt-bindings: leds: qcom-lpg: Drop redundant qcom,pm8550-pwm in if:then:

    "qcom,pm8550-pwm" is compatible with "qcom,pm8350c-pwm" (latter used as
    fallback), thus it is enough for the "if:then:" clause to check for the
    presence of the fallback "qcom,pm8350c-pwm".

PMH0101 PWM would be the same as it also has PM8350C PWM as fallback.
Do you prefer that I add it or not?

Thanks,
Jishnu


> Best regards,
> Krzysztof
> 


