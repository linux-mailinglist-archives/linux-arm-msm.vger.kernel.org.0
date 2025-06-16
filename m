Return-Path: <linux-arm-msm+bounces-61415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDA2ADADCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 12:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D4F5188E1B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 10:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C53329826D;
	Mon, 16 Jun 2025 10:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqNOazR6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE902264AC
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 10:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750071137; cv=none; b=arlhuEhXHZGxJiOFEfVqotan1Stbv2A2qVANTnFD63ZgCQHWz3QZkRrlGTKh/IwvDS6CdL0bbRJZ4WZ0lh7eFNET9VxljwtzfQm7Ec3Uw2QDRDausVWZRgYl9weaCs5698SQfCDdPTkOpEcX/btNC+QkNhsJ0isQXYcVZDIAkSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750071137; c=relaxed/simple;
	bh=Xd5HQxch8DJ8T7mxwkyj8OYWsC/SVmBYJYSpYWhAnqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JO2Ox4ZaqwiSOosa05O0Atdnsqfjr3mIgb5aBJ/AqBoTOzlHArNTq1K0BOLWkNKOgY6QfiOQ8we4+mXMPOIDD4eIykxHwy/oQ+FV7fb5HFEz1Wa6raXuZC0cWQMbaMZ9yeE5RCzqaBh7y2QT9f8z/EkyFUNSJHMrxIwa03XzkJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqNOazR6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8UiFv008199
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 10:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VUJEcgadRGVVdACDvLFJMjAg
	G3Ukslnrtn2VKYsQ5ic=; b=CqNOazR6EFXiLhiQXTxle3BZjNvSVwwrYcBO7n6J
	/V3alRKwFaJToxGdzCVZtH1dIhnevENrocahehzNH4Jp4P7y/EmCLjXxOFHAASbA
	WpFKmYF/XTXDh33wq26LSrU+vO01HjaomSPg9ITbVKqaYE1yNbZ/YV+uK59oYQj1
	oNdS0MBTV+f3Vh5VWB6eRYv+Fen/t6QkbD8CSpgEFkoK4VXnmEkQi066Q2bICyX8
	RaFDubkVFwfKwMp/3H+kvavxXbXp34rC+9ycm1VsYEF1yDOpnXYn+9tYh/DwHWTl
	tQvTsDbKLRv8YQG9V8zkVQAY+ZsJkgYswQtFBY74fo+CwA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crm5c3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 10:52:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d38f565974so942592285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 03:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750071134; x=1750675934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUJEcgadRGVVdACDvLFJMjAgG3Ukslnrtn2VKYsQ5ic=;
        b=WbxZAYcxl+WbqQCa/kZyWXBs6Wm5eed+H21oR61jtKH7vhF/gn5CzT1rKx3M+X7RVD
         tNyYAYI7Q9nNiaE8bG/IIdrEoodo0+uhzBcZCAJBFKZr2wDx70zO79kbgX/ewjvIo4jT
         /IOZrF2j+vBkF1tw/GkiXMrs2ckiRW65yfsKzzARDVUb00D6oEc5bcSVb0XuIJAEjwbu
         JeQMPqMaBy0LAVJhCrn9k5VWSf1INsfEtHbRUXxpA6QBKwpNl28fjb4RVHCFg/v1OYMR
         DFUTk7PgFz7DENp+CX60z+JAD5vRQSf0TMe1a5dDqlxkqZ2vSaxjrBMDNdhJKYvgSwC0
         Dhng==
X-Forwarded-Encrypted: i=1; AJvYcCX+jxqz+qG8eDEzPWjDaOWBQ/TMCcxLy/osDt8QgJ/8KRInugHAsLEho8NhMCIf3tGKt1D1eqt5EfjRyHZl@vger.kernel.org
X-Gm-Message-State: AOJu0YwvD1xfKxb3IzABZke3XFYE/ijvXNbZufwQ3h6uucNjTr+alViZ
	kKi2NGhRC5xr52sOrnsklP31ZK89ibc/+36EYbQaAZmGE403TKTf/mHp5ZCYA3dk1hW8wccMluI
	aL29Om2rRKNrfj3fWNOL/MtjD+dPET4XgaD+KG9F4LSkRg3s/mOg90Apb/WnIxkVBge+k
X-Gm-Gg: ASbGncvp2MyjPuvW4JumzFrf+CYz56co74s9VVmeahcE4BdMxsR77P5ZStL8v8A+0pA
	wk87sBQol7v4iXyOodOvYUxq9Py9DNrNtWxY2JKdaAbCmcV7PTjb0dtdVH8RNGZowA4Ghrhwbc5
	z+2H1KDY3/ouGBkamkZuQIf6Hps8EbvctckrThRkLaPOfnHpa3f5txWyR8wHCCT8rLHjO7yS8fc
	dsJOsCaMhs9Zq399iUg/KySex0Xxd26yfOobwLw7I+5Wo+h+bw3QYsBwW1PxWQgEDmCRW4mY4vV
	UzfotpfOE8I9lg7SWLlECuBMpHe55WwQn5Uf3GIHKoChT4JMhKmh/V0+FdwDziQzeiWnuGqS15O
	F0+Vo8q+76BGqRBLMKEkeuW9Q3iFxpmXmZgA=
X-Received: by 2002:a05:620a:319c:b0:7d3:89c7:684d with SMTP id af79cd13be357-7d3c68548b7mr1118616785a.20.1750071133745;
        Mon, 16 Jun 2025 03:52:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEepDi1ZYDSTtYKF0mLtAVvx1xpIfGtgjgZd2J70oP7izfYqJxqwXkDfhP4ZfXaSTlD+UbJKw==
X-Received: by 2002:a05:620a:319c:b0:7d3:89c7:684d with SMTP id af79cd13be357-7d3c68548b7mr1118613585a.20.1750071133304;
        Mon, 16 Jun 2025 03:52:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1ab3e7sm1517482e87.111.2025.06.16.03.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 03:52:12 -0700 (PDT)
Date: Mon, 16 Jun 2025 13:52:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: qmp-combo: Add missing PLL (VCO)
 configuration on SM8750
Message-ID: <azx5zo4rbhw434vyyunpjswtjfyr5notjd7glm2hvg3yertvzq@wcbrrmhstvlc>
References: <20250616062541.7167-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616062541.7167-2-krzysztof.kozlowski@linaro.org>
X-Proofpoint-ORIG-GUID: Xplc0T2EppOESgxEKYkm58r8s1n8lGWv
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=684ff75e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=v-rge3Vw8ZcHLs8CdegA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Xplc0T2EppOESgxEKYkm58r8s1n8lGWv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA2NyBTYWx0ZWRfXyO2jj+EVscVT
 1cbClZfaxrFjs/eMK8/tOSNAwphU6+NIgbZfjjcWlw9E85crCR7VHsOix828e51kK8quWHdha4y
 YeoYMcF8jdjn97ibRoWGJCpjbkAAXyA3C7bMmhNjbzskSTTk7erUxEOIwmKIvGnMmQ+PGh1cM2x
 +oQKIppjj5jkHzFAkh8ecnFdU4BqSQFHQO8NtSmifNIWMJw0f6o65Nt9jNQPZ5RXSue7ckoDp0f
 Oj34gsY+SA4/iEMnR6zEK+gS1g7NFNiYWQwThgrmaHIFaUwhj6imbl2WSscUDbyoFPmFNhrRiiq
 DAABViNQIiQ+ao2wiesuZmw3Lnud/RCWiz8OimXaaWAVVT9lJ2oLlsQyjuplSAUpbMEQUlYEmAz
 76pO1/Z3PqihsTPIN1XuLiclxg5vxDGEOc7G9ryrTscnHrMlGdC2VQ+8kY9GyRAaKnYt6op6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160067

On Mon, Jun 16, 2025 at 08:25:42AM +0200, Krzysztof Kozlowski wrote:
> Add missing DP PHY status and VCO clock configuration registers to fix
> configuring the VCO rate on SM8750.  Without proper VCO rate setting, it
> works on after-reset half of rate which is not enough for DP over USB to
> work as seen on logs:
> 
>   [drm:msm_dp_ctrl_link_train_1_2] *ERROR* max v_level reached
>   [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #1 on phy 0 failed. ret=-11
> 
> Fixes: c4364048baf4 ("phy: qcom: qmp-combo: Add new PHY sequences for SM8750")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

