Return-Path: <linux-arm-msm+bounces-86854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27079CE6D6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 14:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC6C430249E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C77131353D;
	Mon, 29 Dec 2025 13:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3AMa3ME";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZ8V+0N4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D434B31282C
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013745; cv=none; b=KxFocBawLnS42vdGXYJuMWgxhWBOzFSg57RkZX0hqPVDlRDSdcAR5cCXHkNs094Q1CU3GHUGI02iewu1QK/Rkl4CLaUamSr0D41X8wW8WiE5wukh/WVswTE/ZOAqhQXPw4Eqb+HaAkaP8VR6iYLbB2cpLE67S3Mx8Q+50kQVft0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013745; c=relaxed/simple;
	bh=K7I+N2TK+9B+M6+N0ivh8q1VdxBpkJ2/joNyzWaDGHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z6E8un2QJP7MW7VbZHMNF9h8qC9100sWR6lTRQr4sS1iE5kzb3ebhe9weY2AN5l/hQgcSPO4veYUX4orh3s6MYIcX6V1KciiCtlqwHgwQAkoyxG8Kz6d3xZUxue3F8lh8QEUMmNGZR0cJJ5YqNg4i/K/bVMVt9zxUdtcJBdwfdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3AMa3ME; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZ8V+0N4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAxp6f003811
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l5sE/6YnXXOX4TjbbwwHDQ7NqsTtfkOGM5Ry/XEfJTk=; b=I3AMa3MEFMnWkzef
	iJEjzK71uwbTtPSFQ9GsR2z7F+VuS0FvNwOEkDzerk8lle+gMykt9hr1fOpdRHbm
	CO4VzK6AZYlLhp8MdseF9EkSLaJ0tW7S+H1VQ8q1bZVBaudBiPp91oJYAor2sMe2
	1McbHWmIK+WzlU+VULxLDZasSmPXFELuskuyFIFdX6BrzYIm8Lc1oGjmkrVdEwbf
	rhvvfmH4xxBeIpDh6Hryej6hFzeWC2GBwiDztRZTOsLr1yKgkP1mUACesQ/Cv6ru
	wh1fgHyxtCEiYea85YKoV0W/GoKugFm66PebJaVEqzjJ1YtnwkVNgk4aaAdjqaDq
	6tIsYA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7hscdc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:09:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed83a05863so29904101cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 05:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767013742; x=1767618542; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l5sE/6YnXXOX4TjbbwwHDQ7NqsTtfkOGM5Ry/XEfJTk=;
        b=cZ8V+0N4L9wHSA8YP5mOrG9I1maZIFZ8jlibOzzGiTVUf+3oXVj0SyAdvdhP5ZjhQQ
         QQvXC184B2zPrRekt/x6vpKjRO7G16M8TP5vUqGQLi77FQ+CTi079ZRMvurAHWybp/z9
         qwrAe5ByOcagua6dYYAfvxGmBvAwSvKBLm2+TWp9Reu/m2t9mLkmxbAXhmzYu4m25BBa
         OnOEAOxgK2kbc8SUlDMhkfoPCIxWqy8547s79pIH6hj47hke1I/kxANwJOgEMKLq5GLO
         JzWbzzyyQ8LV0/0xN3pqUV5q3Fb0vP6cGCF//zl2a1WAmpAfTYL5xcDqu03EleCuu+eh
         Z08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767013742; x=1767618542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5sE/6YnXXOX4TjbbwwHDQ7NqsTtfkOGM5Ry/XEfJTk=;
        b=Idw3rQvw/luPWkTvxjst4keZij5YQLslOWyfchdJw1+J2BZ+uHY6pQW8o+7bE/1Xai
         of1+cGtlvl6V3u+m+H+yLijjtXoySI0cvZsWIVTyX5P4ZNGuj05HHUhbAKYsqCmNbF48
         1p1Z3iv/sx7qjU1oFl6x5CwAeB3p+1dHnRYqjzKVCocBd756jYmVq7P6WPJ2E6H9ZgUK
         RfOO0wH33ZADnts+DGJIEa0reS7HOYnK5KvWCdNpiPZsiQD+W1OHMgQkHIWkeoeYeA3L
         HjEBNRVQogKJh8/VIrrB4eJZqEGT4jHQha6NR0Wadu6Qk/sgUTINzmq6lrk+77lttMKU
         bjmQ==
X-Forwarded-Encrypted: i=1; AJvYcCViCXVh8Uwpt9vUbKI2xpZE8DJwytxPI1+9BSf46U9i+xxTg310M1lr0BR8T/2vSgXf6SmHslh0ebAy1vM5@vger.kernel.org
X-Gm-Message-State: AOJu0YyC93lc4k1NLZxDXacrHIj/Mr43IA/lZAQpGtH4aRxPctua5RQS
	/Ead0Ugz8r69gQpWbddsehaa9egTWhd5xsEN30tD9t76WKTzabMwPzqpRhrB9yzHN/HCQVs3gJH
	TEnQSCKJssLnk6GC8maGVSVY6kcI26vFjlUlSD8epdcA762cbXJQBwEehHb8oceW1BMcOe3gM+h
	Hf
X-Gm-Gg: AY/fxX7iCdlyMOLC2p3eJ9eLg61sWO+tQKynHLW5fD7hBKDo4mlB7h6NHiY32DPhpBS
	F0LwsrYyTS1hQZJAtI6+IH+UbeFO+H7xHIx6Sp7zzw6lIrhBARJs0p7WSZgBj/rSDmS18WFkvnR
	0A1yBqH+N/OZy7U479HEsWv3f6SNkSIes171o/3oN6t4zIUQ6h/k5sMrFVtCPY9SU+LxudQ5qTI
	+8fejZLOyzMoshuGFH4iy4ZbR+LEC96WO3UXlNVNDm4C6MKv9FH5Mo1zdF8p30K2QuDrvG5VTJ3
	kuUGGEVzu0xWlgm5DryldjjU8eQXANBiWI0WthS17DHwLYHpDpf4hnU/XHrvZEC0R5WazMC/6TB
	PZdRsj3oW9V3uoUndOpKl4VIjArH04CSWBsp13zfW2znDvzM9gCX846J2bBbR3mLNvw==
X-Received: by 2002:ac8:7c52:0:b0:4f3:616f:150 with SMTP id d75a77b69052e-4f4abbdff03mr340138161cf.0.1767013741945;
        Mon, 29 Dec 2025 05:09:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6L/f/X8HVXb6ahrdPkvVM4U5pGT51rnVv1JCHH6UPEfksBWNYJ+SfZO813k9yOXzLtWo3aw==
X-Received: by 2002:ac8:7c52:0:b0:4f3:616f:150 with SMTP id d75a77b69052e-4f4abbdff03mr340137751cf.0.1767013741499;
        Mon, 29 Dec 2025 05:09:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de0de1sm3337997466b.40.2025.12.29.05.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 05:09:00 -0800 (PST)
Message-ID: <949abe91-612c-4934-86bc-3c6519e7e49e@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 14:08:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8994-octagon: Fix Analog Devices
 vendor prefix of AD7147
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce
 <gustave.monce@outlook.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251226003923.3341904-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251226003923.3341904-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fq--x5wtnsVHZjFuE56-W3nv6om8ZJwe
X-Authority-Analysis: v=2.4 cv=O4o0fR9W c=1 sm=1 tr=0 ts=69527d6e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=NrDynsNFLfmcCilmcC4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fq--x5wtnsVHZjFuE56-W3nv6om8ZJwe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEyMiBTYWx0ZWRfXyTKU8ITF0LKc
 zWEusORpubCs6iQGVa+Gmf9Wu061wcZR0Cd+Qe8rkpWs/Q1oYHwtIe06hLUhWL8GuriDKa6oItl
 wNWt9/ytf27OB1RgUKQAiU8goulkegxxoDJYK1DhZHhq2lszCsHZPrx1T9i6flvXOlkJDpVfuYL
 LLUwoqPO8QcYTXjuCzdWM6e5B3+PEB8BTv5umOlASDTcdSbySchh93pYGp0UaI/RvRO59MKCYJP
 +llXZTPGXTZoAgKWqVxJOC4eVXhHBGFATpW88so/Jz6Jv4oklSOgonGa7ypCCSZSv/rd/WlMzoG
 PC9C80Zk7i3tN1JxhWbmAKehQqLiJ+s2Ea79vnedfT3yzK3EqK+CL4HU+jJtJlb0BnJDZZg72N8
 us6SM2ArSIH13vz9KuMU/gQ290LoFJqWDjVEvxf4bkBriKMkjjNsVod3nAhFd7l3SUKSV50bPeu
 cX0No0cmRRXt0q0i/Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290122

On 12/26/25 1:39 AM, Vladimir Zapolskiy wrote:
> Trivial change, Analog Devices vendor prefix is "adi", but there is
> a valid "ad" vendor prefix of another company, this may explain why
> the issue hasn't been discovered by the automatic tests.
> 
> A problem of not described compatible value is out of this change scope.
> 
> Fixes: c636eeb751f6 ("arm64: dts: qcom: msm8994-octagon: Add AD7147 and APDS9930 sensors")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

