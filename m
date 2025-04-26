Return-Path: <linux-arm-msm+bounces-55809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB67A9D9EA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 11:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FC8C4A2F08
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 09:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44CBD22539D;
	Sat, 26 Apr 2025 09:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqJ1iq1W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30B121C19B
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 09:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745661262; cv=none; b=PXN5ZWYIcj2rP/3JriFVgX6TnylpaYFLP3+xmx7IhMVBYa67EkzwQ7B4qoB4PH8ORqAbxQsWZMqZ+ukeb5wo5rJDmdlfdga3U/Fm6XGtW5Gb7ilOXOfz4icRXVS0515+WLUVIg7kPgUleoRCykeFmad8JbEwhBicKjIqa4TpX24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745661262; c=relaxed/simple;
	bh=E5IobAi/dA7bePCWkMdHzHuLjZ8cTyeul54B2zGVTwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IxoGNfwogfYnxmAT7p72+mW3nlhqbhHVFNMSL7bNU3dkoVnzDmpCyrFn3Dtr43DeHNwSESyR5T5itfL4vAVYakK59dMixjUzZs0sj7Shd/lnS03nunS+O9rdiQuRnvprEExVU3nqIXA659fUFkSw+ORUFJq1LUDmkPu9Y8suoBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqJ1iq1W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q4lxEm012252
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 09:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KTVIpIKJMgx7PL6j/16nNJybn4tGFA1d8wmMtkAAWGA=; b=XqJ1iq1WKxa+Yht5
	IwibmeM9cQ90mvdWksMdv6QKoE679f9w65ahFHJiNdrHJH1TpeVyg2Kl2hKmd6f4
	i5RDdkoueXCLulfY9pQnmIGt/0jzKsB5i9DK20jCu6v+GTk4iJ3lJuViFEuuxSNh
	IeD/bNQxSP8du4Yn5Ld05EOjqoLPQaD/W6Vnch2q/Qe8ZW2oHMNX6MUI9Em2Ik8a
	5WiS5Ik8AERwcgfw7c4A4ncPRBqqbzXjHwqvRTxcG5+/eawraU5VxzOTpW352f6v
	/LgDWYW1Gq+H6+i26b3lfQSXqFqWUVNpEWq08+0A3lpgj1CQXdxcHdYkoMK7xMv7
	pfQ0eQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsb0nwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 09:54:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4767b8e990fso1601201cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 02:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745661257; x=1746266057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTVIpIKJMgx7PL6j/16nNJybn4tGFA1d8wmMtkAAWGA=;
        b=dxTV57siy8Ipypsn3Fn9X11tJ9gtD78b9W89MVDRHJu9AnX/CBqAwTgrHvEuysJpiJ
         o2rUcWve9zJ8LBpT0SjRWj8/iUJX6/IGyiv19+Dc7N4r5IBKGx7nuAFU1EyzCpEkJ/SW
         d1N1cOftsjLUM3OR3LZwQ0R+0nNCd22itgigPoZkGM7u7VhJ3Hsv39zW9tMPtlg3eig0
         r1IV125L9TPXSeRLwg2eQJJ3/ZM+QJBNpeUbplGVQbbyx6Diw3kO43M7PRDMq1rql2ef
         y+LDSu3RUhVM7w/o+eLTp2T32x3QAA8UMWid4vfUvzsf8pebykaIZb4PhXzcy8tZAcnC
         JO7A==
X-Forwarded-Encrypted: i=1; AJvYcCVaMU5Fh7l6fbsHIeO7z6AXm8yzrqn2uqxvsnY4+IEWDA2TlNIXjWQ3TWr61oa2xH8O6fjP3CT7eOlz7kga@vger.kernel.org
X-Gm-Message-State: AOJu0YzoSI4demXkn+KmoSiXGp0YUxMrzpj36AYXEiE+KZ7YYu/NgQKu
	7JhQRE0Hjja+sNDcTpAZEfvLjgAjFRpGiaaZ/XS1bVtubWjBAMcXXXhYiUEGwRLRFMOnv2z1pSd
	89y6Qh+NyD+EGpKzot27oiOWC60OPfXYlC4oH9ovg5V2Jr/iH0vC7vc7brYeABACW
X-Gm-Gg: ASbGncvSe32Z4GcVxvM8lcc1LEpVM1mqhYLIGdNLP7xiBf91NuOeM4o4iyktQP9/ZUL
	Qh7gSLR6G5msnZMcaWi7wpyekU5JWYi2Xs5IAv7hTSVBEjgRkN8yyk42w5MeIXXpz27AYUBhPVX
	pCDWGWfSJg0BEz6YjSTKW/61HCvvMJN0e1Xy+4nr0Ht92uwBxMo2Z3plRTKHVWmLIuXA27Qw/0L
	Cr/ehK/D+QtSumYtST7lu9ISK0j6569ukN01ljKTR5vEZZI0Z++ThxcYm4Lpz23UCQaL1G084w3
	a2nt6HCiHHv5ziAo2MySciCIAwtqqOplurA8GhkJj3OFS/IHdF19iXmWzyhV+Ju4igo=
X-Received: by 2002:ac8:5f12:0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4801cf53297mr34926951cf.7.1745661257703;
        Sat, 26 Apr 2025 02:54:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZNvX/ilxEAdVDSLaCIbroQr1WR3nh5RCJRq54/cavOxBSuNVxeIwqJJRqmEBtDmqNHuf1Hg==
X-Received: by 2002:ac8:5f12:0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4801cf53297mr34926821cf.7.1745661257308;
        Sat, 26 Apr 2025 02:54:17 -0700 (PDT)
Received: from [192.168.65.154] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e595abfsm264941066b.86.2025.04.26.02.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 02:54:16 -0700 (PDT)
Message-ID: <3510a805-66db-4796-8deb-e798a6d0ce37@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 11:54:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <20250423-add_qcs615_remoteproc_support-v1-5-a94fe8799f14@quicinc.com>
 <654e4b69-dac2-4e05-bbe7-61a3396da52d@oss.qualcomm.com>
 <774c2476-937b-4d3a-b0dc-d66f12d9f60e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <774c2476-937b-4d3a-b0dc-d66f12d9f60e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA2NSBTYWx0ZWRfX33Kn4scsYlZL 6C/HFwn6rXP5Z0CyyJxtIHMFaYOrJwlnHb31aTmcZYmujissScruATeULrV21MEKw0q86zpTBst SRdtcBV6YDzWxXsO3IFrpgZjszeO1yGL3u6r1gd2JAqNdZEFLFg7/DTlHR7v0PVe5Fs6P7T7tQm
 lb6c4UPXvIBxhImao+HtE6/87rX31R9Vh6+JftWpj0mx50qs7bvogo3lBxgz8870vDOI67a5IOy lUoOOLWKzM832HvPaH41rZH3/DIrDuFN6ygmrga/eWwQtrmOr1GVjadFo1c2WrXgDQ7HTaTthwD wieicsNqUn1IBtF2FRyJEKemGDpLs9u0ytMft0pCKjF7bPuvzJ0dihajUQCS6ipPbh71eCYkuEr
 ZMEXFN/9ETekL3mmZyy+HOxIjwia/mtAe1l75tJJw1kUmRiGZxHwjw9ZsXCHnMU5jhT7rl85
X-Proofpoint-GUID: sXYoe85jdTjJDo2F6Xptzj_9Q_3J5-5Y
X-Proofpoint-ORIG-GUID: sXYoe85jdTjJDo2F6Xptzj_9Q_3J5-5Y
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=680cad4b cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=YhQMvyRDPdZ9LwTnx6IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=730 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260065

On 4/24/25 9:56 AM, Lijuan Gao wrote:
> 
> 
> 在 4/23/2025 5:34 PM, Konrad Dybcio 写道:
>> On 4/23/25 11:17 AM, Lijuan Gao wrote:
>>> Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
>>> remoteproc functionality.
>>>
>>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>>> ---

[...]

>>> +        remoteproc_adsp: remoteproc-adsp@62400000 {
>>> +            compatible = "qcom,qcs615-adsp-pas", "qcom,sm8150-adsp-pas";
>>> +            reg = <0x0 0x62400000 0x0 0x100>;
>>
>> The size is 0x100000 (1 MiB)
> 
> Sorry, my mistake. I checked the latest datasheet, and the size should be 0x4040. I will update the register size for both ADSP and CDSP

Yes you're right

Konrad

