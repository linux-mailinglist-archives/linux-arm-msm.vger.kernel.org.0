Return-Path: <linux-arm-msm+bounces-65692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03589B0A893
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 18:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 350515A51C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 16:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9632E6D09;
	Fri, 18 Jul 2025 16:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jh5w+yIQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3040E1ACEDD
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752856657; cv=none; b=jtpPjpWoF7yKcaF3mTiVZprmr4VBeEDQ1ZAhPfSsy9EZtX+ewAe7/Edxr6Bcn2JT436Zu6X5CtBsPwTCcOYW4HWX5LQYC6Ixf5PR+JOFFUZQu0SZSmZ/zdKbUlRinR+wDlAZufc/f82Nl7WAuyPmhWogX+obeBzdW3CQRgXXyrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752856657; c=relaxed/simple;
	bh=twxh0YDbsy5bG2ICpRMFh+TxK2HYQr21LmR3HLWkcg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iwFqAy2Xb1z1Wwsa8iJZFPMX1Hhu9QmYzX+KcX5hnNFB65DeSctaI8EXfIwmjZtjI73ukRLnb+0gPGscy/mFvgtdOTof0RidWPnjeg9HuL/wbRN25QfA6HiuvPYvvcdQ+Nk6FmMDAmcY/yWx/kElw53zHLWTY653KN0x7dbdams=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jh5w+yIQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IE303q000647
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ZegwlQ32iOxl1i+QMZet/CdzL3ki4WTCIaMhmI6DoA=; b=jh5w+yIQ/PZJavnM
	t8UNy6oanuFBNUU67lLQmR94C2gMSxvSRl8qjlSntcQePRVL8Hl2Aul5vY4n2Lhr
	34gr6hK7wj6sDUGOMm/6IlvczcwH/D5fqq+1ozSDyLXYJjqLIR17UmI6lMucjB8t
	SZi8A0yWW/oZVDhXmEvIqAmmAQoFjrQoqnyc0lghq1DSm9iOZhO2NIsN5M2iWp8A
	3MN6zqA1rRGqrWnxvhWFpx/1MnXYfzAc33p9Bn8Jc5rpvVscDsC3jYELWwVcKnE0
	2o1h7ZGy6NoqlT5UYwx2079BxL3pY3bdk0EbOVG3NJQY+xYw9Nf9vKsHkVfK8PDj
	AEsX0w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dryb2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:37:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31215090074so3500301a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752856654; x=1753461454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZegwlQ32iOxl1i+QMZet/CdzL3ki4WTCIaMhmI6DoA=;
        b=G9p8GSkaEV79ifK7Ay885DE7dIG6u6+2n87vMYqUxmf6p/atvE965UOFF9tqjIQttE
         tu1UInaUGHicck9gZLBHx7ttH9MdC6yfHJB39W3NGViDKUWADvM/PaHtkRd2c8pgvkuz
         3OI0xomeyKjqP140yPXbyyykc4FpwGVluik8Cw5iKnJVWGP1xS2JYLwyaIeWVUM9Rx/z
         DjAGZc1pOU2ycR8VipivIWlglzNe3AUWsqxu0+MZNYH4w9WAHUiq+5YTlUECnmDXtawG
         LQpYu7WGpMKNF+0xv98fLXQqoneh/bNqdHhIvnoACjUHdzqbX6ceP/4TYTwPqP/Ja07u
         zyLw==
X-Forwarded-Encrypted: i=1; AJvYcCW1gQe10pFgPO1gOPJTuH+cGb+SsWYvMi0c53B4GyCVApAZtx4zJAnsbo7JyKhuDMTFCJoCN+Uo/Lcqg0tj@vger.kernel.org
X-Gm-Message-State: AOJu0YzV4koooTQn3CI58jAiSYES+JGZVYDEVjnDcAsGpAR59a9pyvd4
	BPM5rx/ca9E93GjjNdnyGtuiqTNQ7+REQx8sZiTp8Y0x07MGGM1DHBv5SVu6kGWr0LKVWBQQADS
	hGz+5X0KOfex9ajPZ5oEEKZQ1JNMOAnc2674MXQkNyVFEMxs++b4F7cXKCiPxgLhA7cgj
X-Gm-Gg: ASbGncsOIz3ZjM/cKoHxY8IfSSuOdqdLpxrv2vAJakQt3OK78iNwqxkgTyhhuqmM9mS
	0+l0X5GiLNNEzwxsKrIUsUkp2wKGh9Jccs240IjcZTWyxYP/s3Rq5nWpoOoFCtAxmaiHCuoXwVe
	3OXGyrE0YKPuecRREuUMRI+AOVU9mHJuoifnBr8A8ex6z7zMQgWLKmC2cO5Jt+/DClZ0HOJ6s+R
	4ThMIgpTBVJL8eWQMoJe6fBOSFuUC0KHYNDqAXe98oyk0gt27SRa1eNt74sElDmdu3FGgqijxYW
	s7+E67ekKQ3lhx3UuQftqwz3CS9L9R7mNLt5rET/iCW4st6hpx3x9ptVprbbN/OU5GseD6SATst
	W5BIKFRp+vR9SaNAvXy+BWQ==
X-Received: by 2002:a17:90b:2d81:b0:313:bf67:b354 with SMTP id 98e67ed59e1d1-31c9f2a0103mr18430793a91.0.1752856653727;
        Fri, 18 Jul 2025 09:37:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJSpYJWt9gcJBSv5M7yM4Tjn3hnjTMDiyr0xa8abdyvUZWBHlraaApCwJghcG7Ye9/EcQihg==
X-Received: by 2002:a17:90b:2d81:b0:313:bf67:b354 with SMTP id 98e67ed59e1d1-31c9f2a0103mr18430722a91.0.1752856653333;
        Fri, 18 Jul 2025 09:37:33 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cb5c5da0csm3170530a91.25.2025.07.18.09.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 09:37:32 -0700 (PDT)
Message-ID: <0261da76-a1fa-42ff-9941-4ce235a449d0@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 09:37:29 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: Add MST pixel streams for
 displayport
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov
 <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-5-72ce08285703@oss.qualcomm.com>
 <17ea4f08-daf0-406c-8760-23a23417ec1f@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <17ea4f08-daf0-406c-8760-23a23417ec1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LLVrKW4DlBtJp7DhQUAXk_7lSqsnSyf8
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=687a784e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Q06rUcgQto-sQqt8d9IA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: LLVrKW4DlBtJp7DhQUAXk_7lSqsnSyf8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzMCBTYWx0ZWRfXwjrWfQhQUHl3
 M5UjCOMqTQpJuwk9C/8Qp13NcdsBxI2Iua54aVXXpYAIuxF0grNvzUB3yBc7ZRxHlfnMAzBqqps
 bupu7un+tk/EkHVXeiVlLERa6G0wMSpUc0n/rtiwxkYqvWPnTBUz1V0a83/accYgNjNxWE0AFQb
 IR7sZeAzRzCUYawpuUAW/KkkKUU2ZlwhgRTUeXh5YxlVerQG99dsvTjHOgyet++wOInEm1FQVCS
 JFjIMVUUoewqviHCV0xGdx16Q/jXbaZonEiUTMyn4nE0T9jDcw3HWGUHtVgEzCFhe2vFuPjIKP1
 2oQT0inRUB2oTjk/z4UF0wXfLFu85LGJz6sPC3b1EXzMnom/Vdv5R9xB4gnO3UfKC/YtjSwml/x
 eHFjrCQvj79vYiNJvAJfLie2QR3cHqbuv3wi4pUedK/0ZFqLJtx4VrZhOTnmNE5E4tLA3e0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=686 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180130



On 7/18/2025 2:23 AM, Konrad Dybcio wrote:
> On 7/18/25 1:28 AM, Jessica Zhang wrote:
>> The following chipsets support 2 total pixel streams:
>>    - sa8775p (on mdss_dp1)
>>    - sc8180x
>>    - sc8280xp (mdss_dp0-2 only)
>>    - sm8150
>>    - sm8350
> 
> I think 8250 can do 2 streams too, no?

Hi Konrad,

Yes, 8250 supports 2x MST. I will include it in the commit message.

Thanks,

Jessica Zhang

> 
> sdm845/sm7150 also have the clocks for it FWIW, but that doesn't
> necessarily mean they're consumed
> 
> Konrad


