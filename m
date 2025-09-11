Return-Path: <linux-arm-msm+bounces-73164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 237CFB536E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 17:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC00916691A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 15:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03252343D9F;
	Thu, 11 Sep 2025 15:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XEipPzJn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E34E3112D8
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757603087; cv=none; b=Gxjpo4JFhiq1/HC1F2acVyCNmWMJo44NgUFDY7lZJojTruPikekaF2duWBC9VlIni3Qg4AcAK8zA7l+r8ff4KITuPD4Jkqi+qKrb2fIWWWmK7mFEnuRhEwsaiiQvK1kdV5iZ6Hbb6OKyFpj53JKIenyKG5/9EeeEQlyKG6t2UnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757603087; c=relaxed/simple;
	bh=4YrZyyB8Rfh+T+OQdySIWTJZ0Z8Gm32c75Hx6y54/Jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nd3Ho5HC673NPp2YMX1w1PFuTo/dQgR9Q5aM8+vRhlpItMFmrG/n8naFtXokkY53p2eNr9g/Be2EvknFS1uOyMCHaA/Y+vS0JNUAd/gVEopyRIBP8do31KXFxGHYMiPgEPYg4wPkfVeEaAtXsXCXqrvIU501So57YIUCX57+RPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XEipPzJn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BDYVdx002431
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 15:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6FKGH0QcPq3zUDyOCCypdh5UbCID7mN5vXsMYkcjroE=; b=XEipPzJnvAcMMuSp
	rQ3ee6JkPG3R8DPRaI7rTSrrfrayqYsM6hwMWsZfks66TdYvX/cx4bnBGuROXhRg
	vot5BBI/Fs1CmMWqS7rSc2e/WVQqmYqLP6hbJPuX1jn2A7sGP1fr5+Q24xFUVQxt
	Qp+DpKkv6bjRzSmeToebculihMnO5yxbEyHTo4l7eiicZiavfJ3imkGhX3mtaTOq
	m0gPy8oZWiLBDBzb94AQ7EZVMvg1cLFrQrnoYw4Wdq7oKCp4j5Z+yDqkl1OsKXbI
	jS7DthkM8CUeyLTHuReci23rdT8UgocSEzDSHvy2GLeu+MKs7R2E5RnlG4ykO3W+
	pLZwIg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493ydv0cjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 15:04:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b612061144so869941cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 08:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757603084; x=1758207884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6FKGH0QcPq3zUDyOCCypdh5UbCID7mN5vXsMYkcjroE=;
        b=m7CGJtXcAmXc24MRP/Kgfxfn2w1qvvjTNIeBBLuHV/hg2Yp2hLwQAxI5le1g8FRM2f
         kE25BqubeR9J/gDXVHIFxjVGtUVN+fy18HxZJjIbEGctr2T8mYv0RlXdKICckcmnCx4c
         KWG9Gstndf/LfaSbdh+4kKGCb3rk0TifEDBVFgG6KdRQFzj8x+sEzCY82HuM2FrGyHvj
         jzUEAnvCsEIXs7Kb8pyBjEw7Z+/WLrG3u8SP6nNtP4Yd+1dVWXDcHrOTOW+nHmblNHR7
         lhUwjKvuYyN8GuX4PdGdprUJGOj3Fxc7F2dzAU5atI88OFPxA7Nw5DwBFDYuc1bG1YEk
         Kayw==
X-Forwarded-Encrypted: i=1; AJvYcCVgM5PtMe272GAZYIgXFrexkNp3G/fbctlw7/PnubXvKHP7BDBZD8OmGzy5ncohejl5vvF6Y9bF2SLVnjuV@vger.kernel.org
X-Gm-Message-State: AOJu0YyThIOETZiUcjUXfpbfbAKxugKnxD+VA1YIjRcvZI8ppztWffB4
	tD4amfFPX1LWm3yG450k4YmrqFcSBYh+g4/kfO5C251dzI+oO2TIIbQqe47DRGmgCHsCJt7MT+U
	501px/re4QGsU+zhyjJgSkikQx0emlCpxc44H2qDheLxHRF/2iGsAD8aFGgRuwgZJuJj0
X-Gm-Gg: ASbGnctMP9Q8vvunZE+8/JqGFWHnR4AbFkqLMx9RZRSpBAJcnoCT1cJ6TTt3vYqibpu
	z0izBKcuO+9mhTIG/SU2QN0qRbnm4fgig0ovG/1qDTIW11Avf04iMlak9r9mw1T2PSC3XlcYWZL
	0M/OyTNWqG0bPTXbP4IDt2nAFPjnRzMPch/zQ7N3uF8whQgdn+kL9vTynJebiUF+P8Y0rTGDnDW
	p+lKBPRL1ZBKZjaVAuB8AqZJg4xVCR9xq1+ClKseEmrKmvC6Bn8qnOcegMcjfHbEBEpUlFTcQYO
	W4x/fL8YargMR61D1qP+F81tlf7hmHh4NM18mW9Tdx3p+Jn56w3h5c6vhbxCwb6U1gUNAdTRm5x
	ffAZXkUEB87vqeSWKIBsL1Q==
X-Received: by 2002:ac8:5f14:0:b0:4b4:9175:fd48 with SMTP id d75a77b69052e-4b5f830417amr151528241cf.0.1757603084208;
        Thu, 11 Sep 2025 08:04:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0FppMif3cYGizhNCQ1L/ibDbAQ5mYytEfu5gYANTSlZP+Xwy1nadB0B3Hzn2U//SYcIlZqw==
X-Received: by 2002:ac8:5f14:0:b0:4b4:9175:fd48 with SMTP id d75a77b69052e-4b5f830417amr151527391cf.0.1757603083289;
        Thu, 11 Sep 2025 08:04:43 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b317124esm149966666b.46.2025.09.11.08.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 08:04:42 -0700 (PDT)
Message-ID: <53f1e121-302c-4b35-9dad-114d16c2a9a6@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 17:04:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] phy: qcom: edp: Fix the DP_PHY_AUX_CFG registers
 count
To: Abel Vesa <abel.vesa@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250911-phy-qcom-edp-add-glymur-support-v3-0-1c8514313a16@linaro.org>
 <20250911-phy-qcom-edp-add-glymur-support-v3-2-1c8514313a16@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250911-phy-qcom-edp-add-glymur-support-v3-2-1c8514313a16@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDEyMCBTYWx0ZWRfXy5rU2OTqh95d
 6ornnlIF2m2rALy45tqCkGUz3HEIUqC9m0sXtMT/Nlxz9UBlYUB0uT88I/0kubugCy5PiL0hF9U
 iEx/LroptMW73b1nWua94xVZt/njXE8bzBp5VXKRtD3h6ZdXzRaFr88ke3tteWISF9seDkA6Xrr
 op0aM8q1i/711SjhDlSyINGXiwpaz8Z0O90FIGqnAm3n5+F2dl90Q93hqKpTsSQIIY11z5GUqrW
 EE+s+xBUxOhvzVGPxaCePsCxM5gKTtNIVPnSZMGcwMgxku5Em7hUMLq9vDS3tCvZAPRp+0oghNO
 hFAnjYhTA09TnDGUsw6tu2bKj+YxftrbVb8QF8P5CX8tblFjgRkQTRdETnk9gxCxrueiOoVDgRD
 EExsmUmP
X-Proofpoint-GUID: w-lVfX01NE2Sc7W369NI_4h2PY54j42R
X-Proofpoint-ORIG-GUID: w-lVfX01NE2Sc7W369NI_4h2PY54j42R
X-Authority-Analysis: v=2.4 cv=LoaSymdc c=1 sm=1 tr=0 ts=68c2e50d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=c4sUNlcVcd6a9V-9oyAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509110120

On 9/11/25 4:45 PM, Abel Vesa wrote:
> On all platforms supported by this driver, there are 13 DP_PHY_AUX_CFGx
> registers. This hasn't been an issue so far on currently supported
> platforms, because the init sequence never spanned beyond DP_PHY_AUX_CFG9.
> 
> However, on the new upcoming Glymur platform, these are updated along
> with the rest of the init sequence.
> 
> So update the size of the array holding the config to 13.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

