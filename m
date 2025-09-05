Return-Path: <linux-arm-msm+bounces-72283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2B7B457E1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 14:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 273235C5E78
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BED634AAE8;
	Fri,  5 Sep 2025 12:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkhVojmV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C356934AB04
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 12:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757075295; cv=none; b=f8RcrBCpJ/tucWm6oQ6xWflf/t0d0S2aJUdb6vnHqg+5n63Icc/Xgyrhby5+/830iMXtcVq47MPNRaa4ILR4Xo+gmqQBJwGMC93jNcCxVCPnKAQpKNHf+OUi7ZenbZw0sPEQhqWJcvdD5KNNpO9OENnktN6e+xM9boBJaGKdGvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757075295; c=relaxed/simple;
	bh=uDpudofOkYBdbeH6V9Y+kTFhVPT5jO4rSOKc/EyVu/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NlkxapeBiVkjNMOPlMFzY4o+y2yw696eOeVBBgmDEFeceXloJEFH4ZHkkui5SB5IPlfLx7cSVsO78uLMtUcZX5AaADbBvOPWN9idVu9YNE3HYOPZBmqw/A+U27RO8GlXm3WWmorvabe7I2g6xI/f6giJvfhVoqvTAwxs1+ERBxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkhVojmV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857ZEcK022154
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 12:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eajFPWn1xdqMoWwy/ddDT0Q7ux3XoVox+4G1phz/d6g=; b=dkhVojmVX4VHTs4G
	OryMgMrveKpyHaaD1gHSf1OsDuVwfd5Q3FYNga+eRnhpR7iKI6FtQCT3gD3Lbavj
	K6rDQbf+bk14Y1Bw+R/azPFYH/jNDMQFo8HGYMoyo0zS+/StU2qgGVhiJIDFvXTz
	yW2SPXi3NQRn3J0+83tmP9Kug94w8vRMoz7Jt8jMiXoO0Iab48qGPIysJptyi1A9
	JzUioUnBLQyboraA/sS+gr2ls6IkdWCVwnJ4bcptDQY1Hgr0R8radtWdmPJJc/lJ
	kLWXGxp3lZ7cmTL2viOk0tIuWVHWr0vSiwCwpGSnVw73kEDQ8a7Ov+1sS+xhOc08
	EELPYA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk9ayak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 12:28:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b32dfb5c6fso8162191cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 05:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757075292; x=1757680092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eajFPWn1xdqMoWwy/ddDT0Q7ux3XoVox+4G1phz/d6g=;
        b=S195U3/EmpEDK1O9mZYhYkTOnXiea21j//K2A1CDbMD66Eu7JEWMdXrDjiTGs5P1UJ
         Y1JUWwnY6rUKIDsndPklrMi3TloLc6Z+Y8ylbSSRB/BZfpn757+9EsUGL2A2QSEkxz9z
         FC/FdLUKhGnAkqEjzBpwtDqGosms+gcQKx1p5ut2I+RQr6txxx7JsQdam+T32uPHeN4d
         rTX/Pq6dUdCr66O3RBEAz2YK90NzC1mb3uMdWXPwzVdISx0E8VytsxDyARrzb4yay/Rm
         sbFrMhGmGHR2zb6pHAGcSsxwj9J2iG8mQi2X9GaG9CUREI4ycMPwLqn1ZW9EtRl7igUY
         zxMw==
X-Forwarded-Encrypted: i=1; AJvYcCUeriYMYinjfRUM6m/stzhlg0xTA1CWSoPJ9F3Q82HCKUhHVFLTUpTel0elzQ1sUNBbXJMGqclKIVUfAtzy@vger.kernel.org
X-Gm-Message-State: AOJu0YxfWGnInB1rB6BKmSUlSx8miAFFBLlnc3apWeQ67MnFNgSvDnep
	8mNwOyjZs3XMtifm0ZVI4l9iwmIsmrvoWvPjU1bnZZcNFvo9O9tE3IvCVRqDV6mlDXoRKU9eHXe
	o5wHLFzzcECZx7WsNjTffK3j/pAZPfNS9/GaDYU9nB6xAwiblfdIC8tviTvBob2fhkTvd
X-Gm-Gg: ASbGncvSxQgOlJhof1VcUIE8qPds7SZdA5sQ4FDnxapGg6wnnnPbjdlQhWY2UasxFnP
	UYBmC6ccPXdvTxYfKQ2AFd4OYhQMeJIxshHw2mo40viokI/RIQ+xlk+mOYkamGAYxRZIcMWwgqW
	PKMe5RgHokxYKMR4LNI0gvjjSrlVo1dzHRvRM9RIKTUZc/NO1sNy77df1czKFOkN4G/LHhtdTHV
	s6YSiIt48KDo1JkjQIJgipC/C7zQEZ6t48xXScbC1N2cJZuMTSyeIeeprgIWTs+YCm2qYy/B3bX
	yUbuDWWtaw4RiJYDbi6dUQ85vlmz2kSRq6HCX1WYajIrh5SBV7AsigMqoIFKe1wvSdrAdPljrLB
	QVhmvrpVk4Ud4WZ4u0WvWDQ==
X-Received: by 2002:a05:622a:295:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4b5a0fb5d27mr60552231cf.2.1757075291624;
        Fri, 05 Sep 2025 05:28:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWg77L4QqQOKdAgOxGg9M+otrPnQYWNj7jNcsX5+drgBYt19UXWJz+PIWIgaNs5LHPYJywFA==
X-Received: by 2002:a05:622a:295:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4b5a0fb5d27mr60551941cf.2.1757075290926;
        Fri, 05 Sep 2025 05:28:10 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff0cb2cb07sm1724345966b.16.2025.09.05.05.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 05:28:10 -0700 (PDT)
Message-ID: <a54442d0-a22e-42f9-889c-4bec128b3b58@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:28:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Enable PMIC RTC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250905095353.150100-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905095353.150100-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ffSWu-cbwihDGAyZUu_xpTot5hRemGpQ
X-Proofpoint-ORIG-GUID: ffSWu-cbwihDGAyZUu_xpTot5hRemGpQ
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68bad75d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=HTN6E6hfFVIKqq8n5ioA:9
 a=QEXdDO2ut3YA:10 a=AdHoc0ENqhcA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX/Ah6yTaNUss/
 McoXb7HiP+DFDiavjSi9Jnkz40mcJuZehRGoiHRKNnMVssf76gpgOPP/EemN4+18yYkmNFH6IFY
 tsIV2DMrmIHa6kwrq40s1Qxdz4oM6hqYb5vqeNnm3SO5ZR9jYVskRcOZAjaHUSUO//mFUpTybnw
 Ech3AbCOl37kqDiV3M/bswZ1vRxBxJV//8vMBVMAhkpn9vTBJiJ8LTrZKgAbcN95j/2tPX1K2VG
 mJTHnAoj2xWlUNwX8rrs9MKQyLH5aKNUI5Eb1iLcri+j2LfLNaAZijWLKxaNxkJQFKaK57P3h/4
 NqjUvb6VkEVZjPGeNHxdJr2iOWrEprKFoPodGO0CpA46tDwOL4DZGewXxDNDxqbOCrgge5/hnp+
 clE5c7SW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On 9/5/25 11:53 AM, Krzysztof Kozlowski wrote:
> Enable the Real Time Clock on PMK8550 RTC.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

I think it makes more sense to enable it by default instead

Konrad

