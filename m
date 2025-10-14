Return-Path: <linux-arm-msm+bounces-77155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A30A3BD8B12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD53A19241AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC8D2F5A2D;
	Tue, 14 Oct 2025 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gr7KgG+R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A85629E0E5
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760436888; cv=none; b=hOW9ctmZgVEX9mqA3afeSHATySLRTO4sVSYXUoe7xAz1b6Gm9PqGbQoFBk0ZTdniLWSIba6QcUH0tt2+YAnAWecUAdR5CPhl554d3EKXqXJWtH7D5HcetIPiMajS+jq+qyu3j0bhH3UH6B6AfutrNdC84P1kfxPkliYc2KgOwgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760436888; c=relaxed/simple;
	bh=FNhAC+DjR1cbFtU/1yTjFgJ+Qyfumds9d7hhs+zZNe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V83E6ANuJVKqfhNx60fpqGuvQkBcqmKFJoEGSraBl5i47G86xEASvCwZAh+4fCVqj0AR+bRD8cYX+IEihza11nEqlUf8gLk/BhW7GnmfDTXFmDQSctti38zNlpO59V/VK6UYWZ2nRzFOrvJwxa8LltCAceM0asTjQSgqlqWHXW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gr7KgG+R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Tkr016917
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l9rKwlPsUJdeJAHEExRqTPGByiEiREOtbI0+U/FL4xU=; b=Gr7KgG+R4ls7QgRu
	MkStyMk6EH6BRUMXRLrNj3WVyb8Hv3voLkg/1gAABsLctGUpngdYHX48RfX0p1Lk
	rBHso2QgbVS24u5W9azCRVbe4f2akovVOJPJh3/rgpnIylXww3pZMXmesMEOl2uO
	SAz4dzdB4iHbG4bTFGS0xH9YTrRBvqQbDAfqKuxl4jBnEHChmYGmjbq+vrSaJY4O
	HjxZQTX2BjEmabWWnmJw3eg7ioT4/uPP7fHvCj8oSGBAMDYqPsT5t6ahcDX554LR
	70/EOHMUFrg6Dg386+ECsGq90mQ3mwKP085Japa1nUoRvhwLLHD3fTfiKSJPu1oO
	wOVkXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd904hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:14:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-860fe46b4easo290689485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 03:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760436885; x=1761041685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l9rKwlPsUJdeJAHEExRqTPGByiEiREOtbI0+U/FL4xU=;
        b=ET/YxbmnyT/QREvZxfz5ETSUy+P5cn7FsXMi66zcypURvYL61W0csxbprk4hDKUtaL
         2I57VkdFcxDD9zqtivN0OHnnDXywvWfy68nYIdJRt7ssfAadXzpME18acAIrqWzVZ3mw
         6076pIxXKNIUUyxg3n6aLjXjcYSE7pDnJ/Ke+FnTxbYYFvh+EUaJS6AyYRZowYe3bNKD
         fOq6FqBIDFiszoCBgvDN1Hzi06JZl7+iCHdFCMUu1O31s+RdgOQ7lP35ZqiZMMyL6h3t
         D7D20Upk8eHXe5ddDp3Usq4sHRqXZtMoGFNcz+pHaJNiJq6XrvxCKz7ssZFeNfXKB75u
         ZFvw==
X-Forwarded-Encrypted: i=1; AJvYcCWhDXmytnZiTmLKUPJrDrj5AFoVPCZmBh5Rz3QIoLiJxVElMsvcwom4g94zpj5rUs9P+7t15ZyBsjGuC4IR@vger.kernel.org
X-Gm-Message-State: AOJu0YwrJKNAOY32Y8zi4+ANjj3jtBnqw17mr1q92SBuQT7na29l2axF
	eBihRbi8IbdBz3xvtnWbf3Y0XmkEkJT6cKbE/r3adRHatjxWox5yRcg/KSKyjq0M0WDu+fL69cs
	2mnJkFh+DTyHwW+2WcIsRR3aO5aLVmCf2THLyWbIVr1N3ZYhn0HF75Gdrx0RoqHMGfQtH
X-Gm-Gg: ASbGncvIvPix/dCsfwLhgyUQ1fCgLKrieE/T/Do6ItpPYJ023mvvJYJ+UigDuH2RqFd
	Wdjs/s4FV5Xfyz+qBaZ5vwrx01WjOzO0mW8OhcLo91p+Ecf3rnhmevaIA2cbrSAHfLJGr6cO/Ub
	YEwrwUSCTwTVEqtyOEEq4Bq+twci0J5TSpdxrod9nJF675fwB9LXgnI9fySGYPcR6rq84eIY5+V
	MdwEg1okuocBgioJjA4m+3ivqDusSf49NYYCtVJK3SNdOmHWD3ko4ImjwtfufPeM4y7HAOjXj4P
	XpRuvJbc6ORjRftS1ZHrjhmmEF1swmGxCMFmTl0kI2cSo+8vtpSFMfkn+0WaUMDMBdLsgzyXmnS
	H2A+hjuVuXo9rXCNnlLuERQ==
X-Received: by 2002:a05:620a:1a95:b0:842:88b9:7b79 with SMTP id af79cd13be357-88354304c1fmr1910731885a.11.1760436885020;
        Tue, 14 Oct 2025 03:14:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPjPBnmn6mJXqnG6YBQ6APNzkiGyolZ1otTclgS1/6WXpzY/rNUhMQ8GrRNEPU0tzu1IH8SA==
X-Received: by 2002:a05:620a:1a95:b0:842:88b9:7b79 with SMTP id af79cd13be357-88354304c1fmr1910729085a.11.1760436884532;
        Tue, 14 Oct 2025 03:14:44 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d900bf8csm1115262766b.59.2025.10.14.03.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 03:14:43 -0700 (PDT)
Message-ID: <7f86be1d-3ab1-4936-856a-3f4e87a0063a@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 12:14:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8550: Add description of MCLK
 pins
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251013235500.1883847-1-vladimir.zapolskiy@linaro.org>
 <20251013235500.1883847-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251013235500.1883847-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1Cc0M9ZmwT4iGBbMwK3NFNepHa5jbsTl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX7cmOlbSJPT28
 NbZDxt+1n0UIwLtmygW2MReF7WAyQFgl3N8pHciYPh7z+5wlE3taZWZvuPsjdyteYpHgf+e2Px+
 2XLKWNReplWWHIGUA4tw90BKaQZ4bm8FKwdcCHf+gqQDHXbetDYWJZgGyrsQ744IHai8gEt+8h5
 SqlSx3us0PVbiS5XjgfVfORvW4y+ShnNdozl64tYinJNY0AR87SIZg95ab8O0LGjT/xmFaLL20a
 8u3WjZ3LLI7a+9Ln7DxXxw2YoIkFW/A7c7xdfOTU6nRgVgBNh0CtG7uwbtli/mV3Rgwk5O/yuhb
 tIx72UsYmoj4L8VNt7wlhdUOVD0OnThVBOOxpnOrGXdTjO29AaQwpROVGMlby47Hy/qVlyEJAWP
 9MYtNuruKlqtPXgzOOVTd8qy03rCDA==
X-Proofpoint-GUID: 1Cc0M9ZmwT4iGBbMwK3NFNepHa5jbsTl
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ee2296 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3SXaxz8BPcZ4IL0GYY8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On 10/14/25 1:54 AM, Vladimir Zapolskiy wrote:
> Add MCLK pin descriptions for all pins with such supported function
> on SM8550 SoC.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

That's a lot of cameras!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

