Return-Path: <linux-arm-msm+bounces-50715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D97EDA57C82
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 18:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39336188FD85
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 17:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECCF81DE4E7;
	Sat,  8 Mar 2025 17:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5W+1Vqx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88179D528
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 17:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741456135; cv=none; b=AWc4YYQg1tRGu/eL7mMowaZgLkJK3dV/eXgP7Esy0qf/0HnF/7P/XByXOAGGhtMnoR4iXORJTmXjZRBxjdSCbQLvr5LuYmr1EcXdSAfQseRqfj1OFb9w+ywvxti1omare/LfS2g4rNUx3EseD/JtMxs8l/5N/PqoxWdMxXumCOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741456135; c=relaxed/simple;
	bh=ONK1kMMZ2tlq7ImNd6unr943MlZoZ4E9hWT3KTW2Fj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UFwm71jGmNNrk/P3/tFGok0AcLSfDsDE36eUgmtfGEfX40EsMo33fCZBjmEl9pctcb69SOM4durvoDX4MHsULrdNIExisydz8WN1/B9ROgLeMs5EFsBSRvPQkaRjPB26dSus700htW+N05XUwtPoF8J21ED1sPO87pJP697WEU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W5W+1Vqx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 528DKuiP026350
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Mar 2025 17:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9zgESm2DJBeKwNRa2kpBfLUx05b1iadnUUGYGKJsXFI=; b=W5W+1VqxoIboIAao
	o7OHvznBlV72U24+pAB4JcWtW0piW2pworPz3K7fFgr9bC95WRRx541EaagvEUfF
	YRXCLxHBcFTlDcjZZnQKIOCzXCJiFzjVbD2K/WB5wF2x6TrpezQ/L8G3lvpnt9SC
	2+nseKwfoB6Imo67972mEObK7Z8UjXKwtzK9ryxvQK76q8OBtBqMEgef3MSOjhTD
	hjd7rm23WufRhZ3KtSQ/LGf1ey16XdxxMzrDyuCD1jCNkNmXMk+OhkaBE+yZN8kI
	61jYb7fC3fqnxs8LTP0BrnKl/r9WPOQbE7x99u4h9Q0K0Pw+0+1/14Rh0pL+uFLX
	9Uzmzg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex6rwxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 17:48:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c3e2117a6fso40524285a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 09:48:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741456132; x=1742060932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9zgESm2DJBeKwNRa2kpBfLUx05b1iadnUUGYGKJsXFI=;
        b=NWyYMDzc1PZO+Zm8kKSsKxSPMTwWLqrnHSy8MG8CEKBs0TmeCpeM6SHRkHWQjHPuwz
         M8RUVQGblaIGDbZcxXuKTtlO3chbPb0uzlsg3WRw6DJIEl8w4atbHAI7k8mQYDA0Iq5F
         YHRzPjaYDzb/DsvPDSA7+cPeuw/PHGVBBZkvMJ0Xn5XHr4bXM9QSQxnQ+J3nEwcX7pej
         /rYs0LAr/8mX9cyzec4ZVp2pQu9oErGC/DZI9muqDEqooUpQ5In8dXfijl3iybBpt92I
         lB6n6C7sumCdG29kfnip0EuBa4iAk0AzLiGUVNtwXXZzVh+jWilICL67AObwsxX/Vm9A
         tBxw==
X-Gm-Message-State: AOJu0Yw3j69rLWXYGu4YzA2EpciwY4ZbIEv+MxQj8N41LlDhO8vIG6pI
	gx9Nn7d64BFKWFCApkcCjayZ/M1yvS0z0lKnDDhonaB0vXUTGDJKnbHm0eiluDxpdU+SgAg1zBD
	GPKJaOYHv/kIiQAdDNGeyHkQv/1R5A7OW4cq7Y+nEkOXROLVbDT2xruUawqyUoxtG
X-Gm-Gg: ASbGncvz9RvweGJQPeZKtP3/b3ps+n+HMI0LRVyn1xmaYOIm0fR9ueZX/lrwzXqB1B2
	ZDpZAr0bFkhcbfojEo0Peeru5Nc/aeGKx8K/IABwXXPsohSfOjKV7rdXsGbkIq+g8mMTF1MPpst
	MK/k9n1UiSF6na1fpqDBFOXdJdTm6hqLA8ZSucmLPnnXbunaqPHPFYG8YWUci8H+7cdWqtOmq/O
	CYbzfjvilUZwZSrdPCoMNuykLYCv0IElEf9Er5HTCsZ2LDR0aoFij6F8kJblBSp7Io+8Fhk7Wiu
	oZCyc3QRuoG/UwwETz68FL3SrrH2mf8TcYAsasdkHdn7ulfc/JB0FOoBulagvnVJphLTyg==
X-Received: by 2002:a05:620a:1a8a:b0:7c0:a1ca:93b8 with SMTP id af79cd13be357-7c53e03dbffmr174467985a.2.1741456132469;
        Sat, 08 Mar 2025 09:48:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjAXC2YaGFJRA94KJeJmLjjJ5NKBnfQcZY0wcOSqqMLcDRcER+6YBErzya43C+IrezGavqtQ==
X-Received: by 2002:a05:620a:1a8a:b0:7c0:a1ca:93b8 with SMTP id af79cd13be357-7c53e03dbffmr174466685a.2.1741456132091;
        Sat, 08 Mar 2025 09:48:52 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23988c542sm466544866b.134.2025.03.08.09.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 09:48:51 -0800 (PST)
Message-ID: <3795a811-e202-4f7d-94f6-7afdb5046e84@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 18:48:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] ARM: dts: qcom: msm8960: Add thermal sensor
 (tsens)
To: Rudraksha Gupta <guptarud@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, wctrl@proton.me,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250227-expressatt-tsens-v4-0-d70afa5a1fd0@gmail.com>
 <20250227-expressatt-tsens-v4-2-d70afa5a1fd0@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250227-expressatt-tsens-v4-2-d70afa5a1fd0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8bmE8k5 c=1 sm=1 tr=0 ts=67cc8305 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Idcbk8-iRzM_5biadzEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kTQOY1-f6DN-oeldDaYh77dojRb3ClRQ
X-Proofpoint-ORIG-GUID: kTQOY1-f6DN-oeldDaYh77dojRb3ClRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_07,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=957 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080137

On 28.02.2025 2:16 AM, Rudraksha Gupta wrote:
> Add support for the thermal sensor (tsens) on the MSM8960 by copying and
> modifying the relevant nodes from the APQ8064 dtsi. These changes enable
> thermal management.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

