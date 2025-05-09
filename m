Return-Path: <linux-arm-msm+bounces-57494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B398AB1F55
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 23:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6343CA26CEC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 21:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5772609FD;
	Fri,  9 May 2025 21:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEBfc6CA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9731323A990
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 21:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746827309; cv=none; b=p385Bc1ExfpzZshhq5gZSGI6GY9FTQGgDPWrLpvqw+8PNTF9kguZGrHrdPE5VP+V/o/aNBeJWoTFmTbwXfoeptsE20h9rceKomJHL8/j6CcjiDlRKVTbtpF6j4KEcYKxgl1FJVGx59wBPmjCJqQEj9c+NSNVUoph8lKOZA0sUJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746827309; c=relaxed/simple;
	bh=jMiO8dfIWqztSqyBC/M/E5+POfZySH8C5EjWZ1zmoKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFlcKY07f7eRiaaMWOX4tH9tryWm3xxhQwNeRTVCSvUbutbzTHVQtz8+fm5CNU7dogveI59tuwXFvD9wolk2h3I5YTdxP58tmlyOGQOjUMK20CLbVWmZ3qpUwyJ4PQW70oNMKwvZrkH9Q+c3KiYMctKeqb36xE9laWNW88O0mHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEBfc6CA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549C6nwO016419
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 21:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkn3x/u1u+KSHGaXD2ujk6gLEDw1t6RvipnTJM9byJU=; b=aEBfc6CAEW/1P5VD
	rf8YMFtCf/5+TPYoyKd1Od1YS51NRKX6BgS+KKDzeoO9dusIJLged2z5xf5xV5cK
	AQ/ogyrCkhUEdF3/+5uaw6CKeAyo6mejDWfZ+k+dV1ZsZIh8sU7efEGnfOm3DKlA
	DF2BQg5bi4Vj5nRIjuGH3c4CQU0uesd7esPtIQwEPY12H8rp06qv3jcNJOS4rJaN
	gimSPQltAo04eIc3ECexxUkScmRLR5C/Kvn3ViPZXmGYWTyYtKt8v1iJ3yQCpqgj
	a82tG9Qw0p6o5d46Hi16fnmFDuHSpkjDWnBMWu5HEN3otQQPsPuNom2nATaBoAcL
	TYO1FA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8wu8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 21:48:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f2c8929757so6766066d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 14:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746827305; x=1747432105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkn3x/u1u+KSHGaXD2ujk6gLEDw1t6RvipnTJM9byJU=;
        b=datGyVuYkOsRCjQ2XWKCeICse3vpuzRYWrEwu0M6RtkU+o4ViWw1m/5sSm7wQKhSHg
         rbNE4Tw4m1tilmbC19i0s/dN4bqjRWkkBDNUllCJJ/jxq5pvd/kSi2VFBJh2gyZYXf5y
         gesfA8jTmoAJM38MeGZSq/JsqYO2hmfvLUfQmCqfUIp61/kND3a5x0XnIBP6MquozFtI
         bsyLJiJSzVISppGn2QxRskGbsde0wtcpp4dUR6xv+9Ts/LbBkSgiisqEP4WNhAO1RN/D
         tfiA6VfD1Se+9Zs4mDG0lBPN9gpx7A0SA7A1jvsOphvQaB7HkUH8SDQvmV59zrCkMS70
         t2mQ==
X-Gm-Message-State: AOJu0YxVHiMiOPGq7QlXBXj2VMcPHFxgPI1k6MqItqJ7ltsrUxk8EUlK
	LwFQNmkTNYWV4AxjHeED+7fYJ7/kR6k2H8U62yth4Qmcwokd6kzVh7e/wQFLR/M7qqvSxT3ASdt
	WfIq1TAYTgC9x2SnKPZUkz67ORjrvBVbtXX2dEE0N0XSW4hDXTmydMq3dsYjvuHOT
X-Gm-Gg: ASbGncvRr13xGMIMNrV2XezWhwftXm7E7Q2Lvc9evxAi8Or+Rj/YzkfmdY8Kue9ELrB
	K3CZylaugt3aJXgtJJuObMBxWtXm4I+Ate20xQ/Qht6ftWDeoSjlue2YDnXwXNryyc+SKkCSPWz
	rZ9FauHOfMm1nubf5DfUd+SZ1TFzg3d8Io/ucEdM1iTkcfz/Sg4C24bUz3jpL92UjwTeRauLJ18
	3svMqhvTfB2rJE5xn5al7YmRju5kDlpoVF3AAWt6AZloUDvS+Qucx9k3WCjff6t+B83m9+11K/f
	m4ZkUnoOIuWozizUMHwOCCORIZsTStTvpwvLxUpKc6uHAq5S63ZLqWQnWsFe1gYPsHk=
X-Received: by 2002:ad4:5e85:0:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6f6e47bea88mr29484146d6.2.1746827305438;
        Fri, 09 May 2025 14:48:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSGc2XgNJYZeKKzikhTNArCWy0JPoDUUmmdsKTNg1QXI9xsFUIewBL4B3CBOAqNpYYGbz9XQ==
X-Received: by 2002:ad4:5e85:0:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6f6e47bea88mr29483826d6.2.1746827305088;
        Fri, 09 May 2025 14:48:25 -0700 (PDT)
Received: from [192.168.65.158] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cbe496asm1899058a12.6.2025.05.09.14.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 14:48:23 -0700 (PDT)
Message-ID: <43dbdfaf-fc02-49f4-b2e6-5c08b1998d17@oss.qualcomm.com>
Date: Fri, 9 May 2025 23:48:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: qcom: ipq5018: remove bindings
 for XO clock
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
 <20250506-ipq5018-cmn-pll-v2-2-c0a9fcced114@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250506-ipq5018-cmn-pll-v2-2-c0a9fcced114@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d9bz6BgY7FieYDIAkTE7J4N-lGtDVAGO
X-Proofpoint-ORIG-GUID: d9bz6BgY7FieYDIAkTE7J4N-lGtDVAGO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDIyMCBTYWx0ZWRfX61VixDhlAcTK
 kfjF/C2eZOlpFXy2Sqt4RFd78vVY/5VkpxL35k8CNn4yRxUoNft390VtRY70y0rcIQZlqPTRq2L
 BkkN56dkBoJHYQmrk0gurteTlKLFkO3e9uhU4A6ftTahelsp7A3oQgu1S93vMeMe7zov7UFwLbz
 9NARPAPIDGTq3aFn+8RtHrYcSWJt5w/81aWIbSWtkNOgESdWvR01hAweJIY2FZrOOCm7FvGIpz8
 rOgquY+JF5lk3zW/qHopwVYMw3HILQwW/12yEpdX4sNX5stSAXxQJnb/yrggjQiUBr7m5YNgVjq
 hDSxeTrjvN/yQDR5l/00WvXkU+4sPe0acF3GuEhgcHIHuElbSdd1wF2FnBdE2wUgN85WTFV0TIT
 JKi6kM4wUP8KVFQZRRGfpzqhW55Zy7HBWXoUa05Qxz/CNIwOHJ/sLt4yBMUe/TG2DIqXurH3
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681e782a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=1mxAAckyurNBcPisKkgA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_08,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=945 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090220

On 5/6/25 7:43 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The XO and its source clock must be always-on and is enabled in the GCC
> during probe. As such, remove the bindings for them.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  include/dt-bindings/clock/qcom,gcc-ipq5018.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/qcom,gcc-ipq5018.h b/include/dt-bindings/clock/qcom,gcc-ipq5018.h
> index f3de2fdfeea11f4b8832b75a05e424ca347b3634..d4de5eaffee7b4cb81e0ff2dcbf9e6669c3da8f8 100644
> --- a/include/dt-bindings/clock/qcom,gcc-ipq5018.h
> +++ b/include/dt-bindings/clock/qcom,gcc-ipq5018.h
> @@ -140,8 +140,6 @@
>  #define GCC_WCSS_DBG_IFC_NTS_BDG_CLK			131
>  #define GCC_WCSS_DBG_IFC_NTS_CLK			132
>  #define GCC_WCSS_ECAHB_CLK				133
> -#define GCC_XO_CLK					134
> -#define GCC_XO_CLK_SRC					135
>  #define GMAC0_RX_CLK_SRC				136
>  #define GMAC0_TX_CLK_SRC				137
>  #define GMAC1_RX_CLK_SRC				138

Let's skip this patch - when we add dt-bindings, we promise these values
will be an ABI, leaving them in there, even if unused, will help
introducing spurious entries

