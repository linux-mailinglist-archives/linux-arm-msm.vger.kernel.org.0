Return-Path: <linux-arm-msm+bounces-87867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C95CFD7CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2124D3032FCD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B734930DED4;
	Wed,  7 Jan 2026 11:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cR/ZEDFw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dq6ViWG8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504692DC323
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 11:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767786496; cv=none; b=JdEOOoJCE7QaJP01bWtXZQcwPLsh39/rdlaxvepUA4O6dVvzdaoYI9LpVOqAaXCKXbq2aPxeyoOcDO8Rwox6eBeO4L62m7/iUFxYDJKaAE/oG/+lQ5FUdwSqc9/47xx543+trcHbZFZgBYQIDLgjzSTOK8GuypkpQYGX6rlHOdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767786496; c=relaxed/simple;
	bh=NRPqCnq+bAxi08NrdzH+fJbdsb30br232ITCEdo39WM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q9Hy2WdmUg76lcxz73wyTitf12q1JQ5JNvAZ7dN155CZiX4mTwbEFctAlaDTATkoIERy+JGPzC6s3JBdn0DFfLCo5It7dNyogpgsgXSLfF2e6CojCnUKGS+akVpPoJNjpaasF+ItZ2yTR6+mwIx9F5bl1tBbFYx+GT0WhkLdv5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cR/ZEDFw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dq6ViWG8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079CH3c2453891
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 11:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oGpzHT3oLL/fLY3xKQef70iNFay52DCte5QHMJsrv4E=; b=cR/ZEDFwIerULcGT
	ngAQ/B3xIWQRkgrdGuaTrIEXlmuSnyFBrM+/gW5Cc3/K2WicLq5g3lTBVPaB63Dq
	cfON72+6URJqq0YOBCDytaKT00B9qD762M7Ngvj2fLlemwJnKCnmI/gTMN23gCi8
	ytx83ZnfMfjM1zUPRdlxdrDhgpmjR1kJVu+468T/aPV2q5BBLW21qWddlZsLbIRM
	ZKZIDzbm4f25ZshCw90BdwPiamc8HHKIcinr7kDypOHfZXJ9QdMH2r3YGmqaXU/v
	OLMekt1ThVtp1ZZItjtyEEcRGlM//2OLLQqMd2XEJPgPq8uhYuZfKR06N85SCj9X
	TtnpBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhmnbgf1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 11:48:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bbb6031cfdso61851485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 03:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767786493; x=1768391293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGpzHT3oLL/fLY3xKQef70iNFay52DCte5QHMJsrv4E=;
        b=dq6ViWG8J4OarF2SVCQlAiibD843OZanLgIWYsfheTbDvN2b3FcCQHrYdLwZE34P19
         K0RNkgt1WPugKiHnq/tNWi5d5ac84XTlSrxCrw+Vwo3PA1uzb8rjAp8zOd6Hhifp5WD+
         YhKvRR8upZHYtgXfSZkuRr2A5KZ6u69/XrrgIyxzFn91R4Wsvst0PWx1GUabYypJXZ5j
         MOoT/AN9IxLNXR8CW1ExgGZtB8kegLtZ9FRaIUXh72bEmeg5GN0mRuwmAUvlCj+eAJcH
         sp2Euo3Eu2Q8U0EtZrVZVLSGm6m/uyNtM9LyNgfhziCa1yVzjoRcL1DxecUZMfOoS9cn
         N6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767786493; x=1768391293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGpzHT3oLL/fLY3xKQef70iNFay52DCte5QHMJsrv4E=;
        b=fu2OA6zJMntNPBEf7AO4vi4Vd7i6u9+VEYbRNpTYPQHSHpIzzu5q8Mg/qYcQI6wl0k
         DONHu9gwcT2wOvCHfKsEQfC2eZEFdzkFhaqfrDYTXWO2QkN6zm9DrFKlGgnRtvWENO7Z
         Y6QczZNaIkbYltP27YPj/BqFMFjgi3Nm0vcAqfXD9aU6LicFo/hffNVZOlD0wSG2UdZq
         izvJNHlfvcYQ2thcZ7dIQcI+4K6d93Vb2/L3d7tj/GClWHyhOBdE91p2pngTwafKHxRl
         Gg0Gm0qy6y0YT0O59ieZp/Nz65ApNf10WnQdk+ccZkErQpE+TFg0sdCz4W1TdypeWpR0
         h6OQ==
X-Gm-Message-State: AOJu0YxFDykToZhRi8KX4C0+HIWYscHNsRgzHdRAoMIsVFSIwSFtnixG
	ziK1kGD+C7vfPVz/dTNnmNvp1V3kn19O9b004a9Im0k+PI+9fzYH8pedmiqG3H382UwNEKMNrwO
	MJX9VTpl7SMf6umVDvy1ebJWak1i12tC8d2pOJslOtr5cFZU79d35E1UyTs6b8Cpc8WGI
X-Gm-Gg: AY/fxX5uuI/Rit3OLlh7YKSXyc3Z6BRfFMihjA2TXxI4PDLJRzBpS7OooOAs15EUiqL
	RzoTl4tp+tC7QiI1xcpXQtV4l76PeVJSQ5Nv3Qrptk5g8uqHVxDDugJlu0zVakvTNU5gi0wy1aJ
	AVKsidrkIR4y5gJ+hSqdBXsqsjS12RSPUI+fvcMhzzi1UeRKIlWIyLNUEFql6Z/zm042gCO1WHO
	em8dkpf2wLkA34McA44qgB11SSzUkx7vMhufLC7NnlxiO5fEHvApbipjWOyy/yiafaKRauxgQ6s
	RaGvSglvM/dvtooTOa/trdevJxry8e4F0QlkaNbh0mKyRndnpIRCkckKAEpj3MYq5qChLPEChOd
	0pNnSBZpCxJADjaFIIWYMdlcZTroEgImWmzqVeZ21HXapffOuv9T/hZ0F55kSekDvqyA=
X-Received: by 2002:a05:622a:143:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-4ffb4a9a78bmr21357851cf.10.1767786493507;
        Wed, 07 Jan 2026 03:48:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEebjouS1vhnyClFzjTQUpWuxPqpjDOfa/93dLe3B4HBkvbfO+6dWv3OQW/2rAvjdmz+Go6VQ==
X-Received: by 2002:a05:622a:143:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-4ffb4a9a78bmr21357651cf.10.1767786493042;
        Wed, 07 Jan 2026 03:48:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d0290sm484352766b.32.2026.01.07.03.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 03:48:12 -0800 (PST)
Message-ID: <34c13225-efc4-410d-bc47-21efc262a078@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 12:48:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251230-add-coresight-nodes-for-glymur-v1-1-103b6d24f1ca@oss.qualcomm.com>
 <785daa0f-c9e7-4e6d-8140-dd16afdf2674@oss.qualcomm.com>
 <b949779e-5b9b-45a8-a505-03168afc057c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b949779e-5b9b-45a8-a505-03168afc057c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MyBTYWx0ZWRfX3bsQBibOpwpZ
 YSngiAWggKDWII0jHpXJTYmdZ2BM0rIFumakGfJ2GCrqylhfousD5r7KgdMIMGLxbELpjBP3rCJ
 K24FfXqGqR1FfF18i+ant2xEXNvnKmY+cPy5gHAYTV4/0UtUnz3G2CQM67Qe0ACeVoultp+ZWcW
 iC44VRD/Sd8YaFQy2sHLQDT8hR+54ga+kt0JUW06E0LlrpyS7F8TfHrhs2nWo6u6RbQwEFo34/N
 DkQ6bL9Y/0WA6FBkd+PdHEYASuHr7pYkaZ37nmwEQAAJjnvCSpW2SiIxPIJl0Hp4Sr9JklD9r9J
 CQuN3DQ+i/RRcHmApgDbWt2lnvgAPZiLY5er/YFrnJwYpCceLnIF4YgMfVfC1jYGln0j3sctGaf
 GO7+SqnRe9aUX1uJERQz5lxMBFvwT1RBHFFXL/cXxwUQ38tTG3xc5AKxlx8w0DT4UovOtcBm9Aq
 MsKfbgjOWNmCh76Sj7g==
X-Proofpoint-GUID: GJkZkOUGYTsNLNdZ1lAs0iiszSYN2T1l
X-Authority-Analysis: v=2.4 cv=eIkeTXp1 c=1 sm=1 tr=0 ts=695e47fe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=64o_WFQJoLfARPdmrdAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: GJkZkOUGYTsNLNdZ1lAs0iiszSYN2T1l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070093

On 1/5/26 2:34 AM, Jie Gan wrote:
> 
> 
> On 1/2/2026 8:20 PM, Konrad Dybcio wrote:
>> On 12/30/25 3:10 AM, Jie Gan wrote:
>>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>
>> 0x1121f000 - 0x1121f000 seem to have different/wrong names

For the record, Jie notified me offline that the documentation I was
referring to was misleading..

Konrad

