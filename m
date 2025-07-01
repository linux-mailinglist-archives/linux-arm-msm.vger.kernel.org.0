Return-Path: <linux-arm-msm+bounces-63193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47207AEF5AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31F0D1C0128A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00CB270EC3;
	Tue,  1 Jul 2025 10:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="estkSzoU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58929270EB2
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 10:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367320; cv=none; b=BhV/dhBTIVuuDSh86hUL8KAhCrY7m4LeAmcUZrzRxbNVtb943Plbs7gnkYJ2YLJB/o+onrFvPUFB4KtGacLRv3hVygKADd1pzGqWmoolyZwvlC9HCpxBTCMtMIIL+s4yvM1WrxSUCYeH4U81KqjxJSX8ZvoxiFXhscj6aIJnDjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367320; c=relaxed/simple;
	bh=NCd5sIQQTpAQ9G791uZrqHLKe+SMtGOJg9CS63AJgdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nN+4Qz26reEdY+gzQWAPP9fbeGvnow44FTK9Dnw/RazMFH3+Ue5/m0Idry+CNLQz63mtbnfraw7A9JNPxlOF0rDgeSy8ZFF0+k2MdX8TYucvXJ3JAC3PrXNmtodLdXvSBxq9pOI6VZcljpAuO/6/YImShM3Uuun6bzgoBwjZ0GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=estkSzoU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56195kYc002153
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 10:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e2pKpLvAmXhT0uHCFrgzvpgPRrPMpCsaV/9qCJmh82o=; b=estkSzoUBdzewSBQ
	d3RXgmpoLZabRY3dQl3Its1mpJ4RHISfg9oquS/Jf0ZgP1KoZRUrtlEAAzcYSXRG
	79YEly8t6j18uJZT64PLICD2kTgwfDicCGXBApuWZ0V/yK0XOMbs2vStfkvXQUfM
	Otg7+20N/eQJvEJM4aPJge9NeYzGM9QGINBw39rO3NwATXAh2DoGRuqoAnl6ia5T
	m59WuaM+qWyvBNrcnfIJUGVEqXlMkKuOYshmUc0vL1LB9Jb9Btq/dCN0pfkVsnAH
	R65PjUXf7V362P0ruNX+XOOwuHK6tofAD/EZ7zD8R/54q7/UoQgm0SkdfNuCcIGG
	QgfKBg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcrefj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 10:55:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fabbaa1937so17478096d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 03:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751367317; x=1751972117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e2pKpLvAmXhT0uHCFrgzvpgPRrPMpCsaV/9qCJmh82o=;
        b=L99R6wautaHXgdVflKN4kmZzaGBt6wAaDDvCOmICSyLUdtQYr4IGIhP/4gy/mgopkO
         sejtDVM9M85K+3feykyBgaAOknxkk0wnhKEJIAJqu6Fj4Y2zi60sdvV1xSQ04xTFW9Z7
         nO6j/n6W+ck36SI/EJL03ZPr80tBhe2FxTlA3KkSPaws5rEB6k/WABZJ7bwF3gTBT/jG
         5+8JdXgi/HcgY9dVhGA2NpNRIfSH2UVGZ6npjrlAhJdWxFOG3HrdpgdxFmhBcq/LP++o
         L4rRTfKu5QVom8Wv7qkO6XGd5rN9Aw9ZD+evnfPthTmt17vIBRokvkF5RZApQRLxV7mV
         M2Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWSbECGlWYqdR7zj0tmAAuqEMrWbIlSYAiNZFgrQUxzGWLzvXXdyotM4diseosJG9+4cGFBXMQMgGNa4Yea@vger.kernel.org
X-Gm-Message-State: AOJu0YzHcRNloPBghvrD/XE5vuEpXN5mtTCziBICkFMSyYzkGxOLwAt5
	o4oCXwC0rC2+QMVE0sqzpZD4kLIsHH6mQ9CkrOk7xId4H22Nz6SN1U4L8vtPUuGT72ae9jwMbCC
	szDVn49AXO68iHkWg8DLlzBxT/IlJqPEMRzWzRUpmNKGToIUUvmYlCDEJ+0YDVv40UINo
X-Gm-Gg: ASbGncuZWCUJ1CuzQ2eXbpHHNeyLHu4/xzC7PrLycFlkVdHKEv/Qjye8mF2YKyyEAD3
	Qs3AgL+nmPhzwYvnkmoXDY5qu+Tt2VT5nrO/jyPSDhrhbqCSIJcpbu8j5wLlTc5B957FNx83rdT
	itrAiriF0ouGffoftnOpbId0xQUrEjsdBLE9se59dwi55fhDdp812c04w7uKLBCKtsPlnOoz0hj
	5PH2mTIdZhJbmQl/bm7NuODsLX58qoyAtj2Bs8FErbqwjkzHnnBbKvpGLGWqMjQT+IxuNpSTRhT
	ATRjRbkhxraFK1UrVHol9ZRP+ovTxAlFOnRLWk4OUH0coGxLciIj/l+kTOIspJG3cvXCuLhsU6I
	i59o1vs92
X-Received: by 2002:a05:620a:3710:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7d46774f6eamr135173485a.13.1751367316978;
        Tue, 01 Jul 2025 03:55:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFQqI9KNTOy8LPHCm3hRNrOV23xCgE8dnjQkn6eZsL8uc0BW3Nf4hDGABNBn0BIgxQLuAUPw==
X-Received: by 2002:a05:620a:3710:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7d46774f6eamr135171285a.13.1751367316401;
        Tue, 01 Jul 2025 03:55:16 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831ccb44sm7137232a12.57.2025.07.01.03.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:55:15 -0700 (PDT)
Message-ID: <f931e284-6ae6-4177-83bf-c6eb1ce583f9@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 12:55:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm670-google-sargo: enable charger
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250630224158.249726-2-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250630224158.249726-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: O7O3Etm72ctJXHOeKTo726w0MiSvls59
X-Proofpoint-ORIG-GUID: O7O3Etm72ctJXHOeKTo726w0MiSvls59
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2NiBTYWx0ZWRfX/otbVDYYC+ya
 QtsfLX0xWwwu6iDyWTzr4piXHakW2rqb7jyFmNAIcZs4jMNB3XnIlyszRUBOd/zXYgwHhCe4iyc
 Z1JdMhSLH095QnoPnXuUS45oFEgxciuRNgEVkYOVQBRitLSzJj0nDd205vIYqFruUQWYJbZ4OFr
 V9W/YTnLQxWOqW6pxFB27MSFKg44IDfnW5H+N/J5SrkmN9tH8/T5B5RlCPD1WG6aETpICmyvkBf
 l86zmVRRQfrBkgEMN2mIwP58gaOPKf77oH7KYfRerFYXoO0xyx2ih0x+Z4nDM29Bx4+baEH8RR3
 yQGC8tRdKrSo9L+cduN9N1t2SuQ9jr9OPNTPnln/RxitUYOYD93JWmvzd05fe10CTftcNIG5UIz
 UisLx/BVSuoSsyt3rRHNc5+xGV5vzJmToKUrNjRf6ixFbZiCAQpfK/zp3NsMu533+aLjq6LF
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6863be96 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=6ieJxNg1SIxEGqXPB-kA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=833 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010066



On 01-Jul-25 00:41, Richard Acayan wrote:
> The Pixel 3a has a rechargeable 3000 mAh battery. Describe it and enable
> its charging controller in PM660.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../arm64/boot/dts/qcom/sdm670-google-sargo.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> index 74b5d9c68eb6..d01422844fbf 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> @@ -33,6 +33,14 @@ / {
>  
>  	aliases { };
>  
> +	battery: battery {
> +		compatible = "simple-battery";
> +
> +		voltage-min-design-microvolt = <3312000>;
> +		voltage-max-design-microvolt = <4400000>;

Does this match what downstream sets into the hw?

Konrad

