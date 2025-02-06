Return-Path: <linux-arm-msm+bounces-47049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 491C2A2B270
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 20:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB1AD163421
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 19:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060B51A83FB;
	Thu,  6 Feb 2025 19:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JEiWV6ZM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4141A9B29
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 19:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738870854; cv=none; b=ru9THYTWguBEUhOF6wzWiHZ5pK21CZeRf4jARgYecolDb8RBI/ZKEaeiyu3NJ1f8ZpW0VpqH8/1pWcWKi5T6/bLq30lQnNvgQQuAYY4Pgu8Yw3uo7YMKIqmvSRv6Ltuh2HXIqgqlGicTn1uOQDOiecbZNswa3pfPHlqap4uF6vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738870854; c=relaxed/simple;
	bh=kzFOt+hUFf2hH0dfSHzEMgZGBx5oqybElRnsgUP9O+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNPX+X6+gtPpk19NE7ZUECIwvshfLxJAnuK5Vw7XixB3mI1bi1CJospvq0NUJhRO9yMO6D6JDIJTlMGUkd2jz6SIiHAOMFaFHUOu51m/LCOM6FFI5A0TsS3mGgkvtBnZLHIDeBE5JUat6YyHjnYecMqNo4Sy9GKhmsdmsj6t+zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JEiWV6ZM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516Igbtk023589
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Feb 2025 19:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kzFOt+hUFf2hH0dfSHzEMgZGBx5oqybElRnsgUP9O+I=; b=JEiWV6ZMs6Rcgd6m
	Rk5pSE6UsQbQ/v6Uoj16oVvB23CD8gYVux7FGaIrFWWCPTwm7FqtlWfGJypfJaKt
	/cYCSImgiP6PQ+b9UscfGuuL/Pty1N6DafI5ypBRjxcW0gBYHDoH/oRunhFw2Ynr
	LQQdf8cJXJ7SAkCPFc6mi1l+CPlaBUzKQ3xGMlnLVNQkP2DO/Zsx217gzeD8JiPf
	pizf24t7hCX9KvMUxjn6QEXbphRS2umZR1E/E+Yx1Dqeg10UHc9NgzRokhCVjYvu
	Zor2Dwow+V8FNBFuceikJQbbejD0k7mbtCUrpgdPmEomAiuSXP7NIA0rq5QWG7ur
	YmdOpQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n2kkr4c3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 19:40:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e19bfc2025so3081746d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 11:40:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738870851; x=1739475651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kzFOt+hUFf2hH0dfSHzEMgZGBx5oqybElRnsgUP9O+I=;
        b=VDvSHqoJfzcAagNaZ3pLX50obVVa6pdnlsHKfjFZGagINTGxI1DQM0kxLCP3PbYZaT
         z/WkX/UHDkEWZqy3XcbjMsfCcJBbl0SKa0ES7r8drKKJJUzN4kU9TnQuUpJQ/6ZhJ/cL
         /g0Cwn1YIj7EKMGxynpGU95Lc3oVBm//aTJPKcIjvl+rlc4qzr6k/j3G9AHJ94ZcD6eb
         TS7hK1S8ReOlyh8Tjp/aGdM9w3MLVd1KYXOKHuWddgoNZiBOPP2NBiwzp6ND3ckMGl14
         WT5qmdmFaI/hES5Eixh1hOFBVWQau9JrmrJKhK3Np7tlN/0S423h+OeD2Pw9Rda+D8iB
         odzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYetegoKAjg39q3hk3OLXCeWeEa5y+0+qz5e2jQpMrNob+0DZx4HfILqvAw64vN5Wxgab06OedU7RgHV7j@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6SbwAnBxkfm6hSvy7uA3TfZacsYLimL0LK9VT3w5rr3DFC0bE
	HaYWpiv4b2bmISK2k+Ex+lX5FZL6gglag+YZ/EUHMIQHkVNyomi4+EpQE4+ec1Q5WnPSu87a/lf
	/SAXGf1eJRXD6Ijjc1xm384oFtBGqbBZRk9BvaLj/9Qdatx5VcMMOoBtGNJsJt5C6
X-Gm-Gg: ASbGnct4OlfnfnQ2acC354/4yfcIBT8O5gFki79LDfPgzQ4Obeb+vbYStrt1Tzjcsy2
	2RfMuPHsvxDEN/CncZP49DEnLOGvt0UyUoryys7ZPmkd30jFfmRAYVchag9j1rj+t2rZLjC6/0P
	Q1oyjMA4HG7VzvtCi+tq4kmfcgHvgILCBnfhv9vNm3OHBWOBzDh4oXGp5lH2BtEkVAYo39LpVHa
	QApAht6tJkNc7BYJmqVtrC1ds+yZTA7H/WE/IzXojCYF+qmiYwUAwiBql5nJcnC97ohNEVHzNP5
	iSpZEqNpsfCGSrdrQJaW+Q==
X-Received: by 2002:a05:622a:3cc:b0:46c:86d8:fbc with SMTP id d75a77b69052e-47167ad1375mr2774391cf.11.1738870851243;
        Thu, 06 Feb 2025 11:40:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGK2GFCexxJpENqKGcHNEyCUS9NksWXDELz9dkEmRkjk/gHfsgg3nLmQnccU+pMc4HP4PrA1g==
X-Received: by 2002:a05:622a:3cc:b0:46c:86d8:fbc with SMTP id d75a77b69052e-47167ad1375mr2774141cf.11.1738870850809;
        Thu, 06 Feb 2025 11:40:50 -0800 (PST)
Received: from [192.168.65.90] ([78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f8460csm145266866b.62.2025.02.06.11.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 11:40:50 -0800 (PST)
Message-ID: <1ded2597-d5a1-44be-b5d2-30b70657730e@oss.qualcomm.com>
Date: Thu, 6 Feb 2025 20:40:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: ipq9574: Fix USB vdd info
To: Varadarajan Narayanan <quic_varada@quicinc.com>, lgirdwood@gmail.com,
        broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        agross@kernel.org, dmitry.baryshkov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250205074657.4142365-1-quic_varada@quicinc.com>
 <20250205074657.4142365-3-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250205074657.4142365-3-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hDzp8Pkm7AP_HxIvbzIXXg2Bn_TtO8rb
X-Proofpoint-ORIG-GUID: hDzp8Pkm7AP_HxIvbzIXXg2Bn_TtO8rb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=620 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060155

On 5.02.2025 8:46 AM, Varadarajan Narayanan wrote:
> USB phys in ipq9574 use the 'L5' regulator. The commit
> ec4f047679d5 ("arm64: dts: qcom: ipq9574: Enable USB")
> incorrectly specified it as 'L2'. Because of this when the phy
> module turns off/on its regulators, 'L2' is turned off/on
> resulting in 2 issues, namely 'L5' is not turned off/on and the
> network module powered by the 'L2' is turned off/on.

Please wrap your lines at ~72 chars

You use "'L5'" and "'L2'" a lot, making it hard to read. Try focusing
on the effect.

Konrad

