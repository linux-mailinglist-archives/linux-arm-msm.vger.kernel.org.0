Return-Path: <linux-arm-msm+bounces-73084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8C9B52D37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8C7AA003E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 09:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D882E974D;
	Thu, 11 Sep 2025 09:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I10uxBEg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6322264C7
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582870; cv=none; b=W+LYi1RaFk64A3D196wxPMrMAg51JAVvX6p9Ly1k/+dByv6LchgQnKfxBh/zdTjHB/CutiFJGa/DPa0BK3SSSRxa7LQ8SusmJbX1nbh+YuSejZHJPv3RATZvEMsb5a7figP69Z/ICMG31JIowcE8+bFSSASzlCvpXg/iPwM6KNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582870; c=relaxed/simple;
	bh=m6pAp4M4VuJGO/7ZNH55C6eth/+eqyqKCY5NaSTNUY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=udzeV8IIyYUOUkkJPx7j5uiYe0Pn6E6E4QoS5XbTBIzYvK96OasolGCtgotQmqUq/En2BvDdGHr5a2P/2SsWSX5K7XH7tT4sgkdfEWK27bik3X23aWm/GF6eCeVhiiUY/EjmORW+x0TG7MSKObjYDqd3dWctMiwM/cBSE1T9yeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I10uxBEg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IviV005760
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+XjtRX9W7ekp3Y8Qr02gly2tUmdnuvJNT6c8/8CmoGI=; b=I10uxBEgEFiXRN/U
	Z9NZoHD9A6LRgybL+gVVDYxybbg6lIE+oB4CYsaaucLeceVuc6PcAT/s1y2QJDYl
	RtjypXrhbHMFppsaQMRsIfvUjeAU8SrwTx4ZifBqnpM438FcPDr3SeX/nX6qUZtl
	Guj7ENTrOBKWdXfRvmDhepADts6EI3mdti0r5aVftTdWjPJqWCKDOgEX3rsDKCpK
	jTvd3+EsEMHJrqL3GSZUxrPOB3rUAMs7RTJbYRM/GMRJMZ7pwQSGnF0tMzOXbU3X
	Ur7lu4zwOHgcxWY9V/dr/JSzmfX03WQY2SIs+zjWcJHPffsGrdWPO4G1KTai/O1m
	ZNJ7eQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2b52j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:27:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b600d0a59bso1695941cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 02:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757582867; x=1758187667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+XjtRX9W7ekp3Y8Qr02gly2tUmdnuvJNT6c8/8CmoGI=;
        b=aB2ae6EvTM0LKbbbSn51hYD8xdnkXJxTSGIs5bAFeZMIGgj57+la5/tyZEnSgzZX6f
         LLBS2UR3AI3+fU45ksiV3mx7eXTH0fJPdkcai87PG8MM0bRzyV3QkgqbxrwCNy1V+iSF
         Y/eX7Kqx0CS4avrdA2I+Ys3UW5vx9m240V5DLq1EzAZvCVnkG5h7B2TjYO3h0QjWJgPJ
         YmIeauZgOGSLg5YF5yGauihcvfRGpYyXUN6RU61Tq5wUZH1ONFxWz7fPvN1m+I7opxGR
         ku5fTQtANbhvc5Nh7hLZQmnQckjtIdjR0sMxv5vJR9m556Ntk0aW8a1AzV+m3Z9sai8B
         wqYw==
X-Forwarded-Encrypted: i=1; AJvYcCWFf2f7uptIr5tzFbPF2+NMuaFKLvwTQJSMm7anlqSA7tMW32KkDrArHRaK7G+0bQ8+DvBQR/Cgb6XEr+39@vger.kernel.org
X-Gm-Message-State: AOJu0YyHpFxHnTAGBWnujEhG9AME22oWMZ+BHSwUCQhdpr1eMi8XyaJS
	XOpuWjHQ9XFVDO8Fezs3nKJkvJxtQnwvCJOgApliz+hCgWFVv78aeb2IyBx3hbgELNwiUsDZZ4S
	0rOfrMLzSpjS4MJtlvyB2qvoUlXZgeu5KJyhWmj7Yvt6kvqzXJP+kUJqIhIMSCPfVS27Y
X-Gm-Gg: ASbGncvtVaMi+Gh/5XmY4HZC8JTRUnuYQ28Xqm0CK1DbKu+Cz+7PxN1H61ItTVLmSrZ
	IaohvrwlA10uq/Ntc2F4/CbREhtX4IpvlXxJgwMRwJeo5Fi3nhIe98nEv97FXzjKioaPsFoFkL+
	8G8YIvFTvJTqF6ifuNQGB9gKQb5y/wDgCuZ0uJAp29FNGgqQEgmzX3GHkx7cYM7C3ygkuvpj4QL
	zYGE8s29/WusNiDE95U60FEJ5zi7OKYoDJxEG2bDKPWRiGfBU/ofAghzeWTFvmCDg5DU4tBaar5
	iDDDuWEieCmHrYJZOLTZnT6zpL0sAguiiUbqO8GD6rkqe5QzIUxoy6pRGiW7nWAoU38X7jIMMY/
	7aQmUu7fADHd353ylFFJsPw==
X-Received: by 2002:a05:622a:350:b0:4b5:eb40:b1c4 with SMTP id d75a77b69052e-4b5f842e182mr152502091cf.10.1757582866682;
        Thu, 11 Sep 2025 02:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE849UrKSKJjqhI05tzu70gw0sAz2sb0i++Amqc98Bmj5mWMe6WA/bB3YZXeJj0zWPqM2katA==
X-Received: by 2002:a05:622a:350:b0:4b5:eb40:b1c4 with SMTP id d75a77b69052e-4b5f842e182mr152501941cf.10.1757582866128;
        Thu, 11 Sep 2025 02:27:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b31715fdsm91195866b.49.2025.09.11.02.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:27:45 -0700 (PDT)
Message-ID: <01ec7a6c-d258-4382-b689-a64a29f7e94a@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 11:27:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: camcc-sm6350: Specify Titan GDSC power
 domain as a parent to other
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-3-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c29613 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LDDDIuMr0XRAt-0CmwQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2XKZyJ0segVylSQnmBsMCHYRiIloFc_T
X-Proofpoint-GUID: 2XKZyJ0segVylSQnmBsMCHYRiIloFc_T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX/W4ef1GPtCs8
 oLel4mi5syg9UbcQ70nDL6hg1jqN8sRe2o5LFj1XhwZH2xWstj7Z+ELjoIXZxuvuWpEVqgzxb2U
 peOtQ7SXjdSzPBG9h82ZsZDsqivroIUHQtpYYdTrwTjFNIg74WQoI4BTo85Rb4ToYOLr0BOJdmb
 0CczH6+sgdaVd5112InO8bY4BApH9kkXVEvJzWCGE2/iUMvafjsjB9E9Gvk//+ItG7t7nfG21bF
 kOJFi89CJVw3DcW4D6yve794dDqRuSMwYvyYwbY2dxK7rwlJdKu2XkIgXqztsjggIwBalLUG4hj
 XDLSUWdavH2rUMgrs5q+/F9udYkU0FO/vw5qTZiTv3Go5SdJI58J2/QQyuE6qIqp65Ok/PUPEr5
 VafL7NFM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

On 9/11/25 3:12 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM6350 camera clock controller to enforce a correct
> sequence of enabling and disabling power domains by the consumers.
> 
> Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for SM6350")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

