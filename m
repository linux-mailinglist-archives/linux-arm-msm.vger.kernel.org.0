Return-Path: <linux-arm-msm+bounces-62031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9C0AE3CE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 12:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9F771897F96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 10:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95BD623BCF1;
	Mon, 23 Jun 2025 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEW0xE/J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F2223C509
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674804; cv=none; b=ceb+wSOJmWcixYmk5BFBlr1BRhshy7gqJHi4jES1REb2OC0sUnC70jhKoYs2/wpMeysB9X+omjoafxX4x+J+svNBNB2luxYXuwUsdGAZGd+XKA+T2WfyhUeEIwjpp67r1gT7ZDmk0jrBDJutDEzaAer8iIq6awoZPMk8PiGZl8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674804; c=relaxed/simple;
	bh=a50t6i0ar2wX7879ESe8BCD02vslV3PUl+14n0qOR+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eaos4oV+tRrlNw0ajmbNhonVrnv0TZLkSgWxRbKyEAHqRxo4kulHD1zyzapR8FXooxtsPEkqu9CIr7hj0NweYP19HmdhdD9YWujwzd9v8ZnODUBBZBSufam8ev6kiYgzrniavQSIs1Ke5LuZHpbeocqBy3mHFkcqHEHPZDJadBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BEW0xE/J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N3eVFk029883
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dCmb85WVO/51E6pHDcfAo/yNEVZoP1t3GhBBQKdPtBo=; b=BEW0xE/J6nveVp+7
	BUFXPzGXWeaG/JO+/TLBQUMVrHzp8V/Bp16+NC0kaNZ0fL7tr5hHAgQIpvV+pLsb
	bgZj8YsYXYaHSyQ3Q9Yv+WFqBF4rG9uF1KX1SlbLpT8xU1YkWNyvNlXECAdSU/6j
	iXLw/znWnvv415x0WCkyWW3Ymb7fCWVNeAv5IFOGPsiEvUxTPJ2cGOV38kOPPdUT
	mD7zOAxi4oo40kOezB/eu/Qay0rk0czT/6cl37stT1GDS1WXI5MHAIHfoR29FoWF
	G+8+UitxufmkZVVW9hsHNrodAZ1cAHrcCe18bDvG9687HV0cA8ME1fs1ufk2i5kY
	pWLBPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ey7k13bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:33:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d21080c26fso106615985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 03:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750674801; x=1751279601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dCmb85WVO/51E6pHDcfAo/yNEVZoP1t3GhBBQKdPtBo=;
        b=X4J8VyvkKAsSXY3pifseUN944GLvPAKIU3C6Anj17d+ItsZdfDp8R72RwFQkptvaSu
         Q8uFAhe9d0pKxE0HY1XLuDoJ/WFmzxlIiLaOOtYRjIdUQbdXXW5ub1qY3iMEDg4mV57X
         dHfLpRg1Oj00dQ2dCRH/vE/yzbLGKBMQpmBXauOyLHRpO5DEwLHM5Iw5YpEqZrbyV1Wr
         JlmI+mFJcapQVHbYUdnei0phzNawuad3q6C+VzwZE81TU8jbYW/yBQ/xfJo0XFmdbzao
         Vih2tMHLl74nYM8vqh+7BqICYYWjvZWHnnEChAyxiUlqSRC0Pkwob0ymhsX8OdFsULKA
         vwpg==
X-Gm-Message-State: AOJu0YwKgm3mBAT7m8SKXqIgddIFd73MJbtxW04Wh/KWwv3eWVUYQiu+
	ZSO7wYXujZdrRZjmuTBI22tinyJD1c4SoyygyrP7Uh1CalYBWo3vqSTqck1TlU8HMECFczp+3CX
	jA33qglcmPjUIllqdU8UZSuLAbk60+YNZfXTsStzUgi82TSjn4wzyrNRXC4sUp069WVbh
X-Gm-Gg: ASbGncv2vc/bL6eFgQVz8MmX7PJ2dYHpDTRMPCOu+9DhhExA52+ZnhkedtBuECVKkU/
	nQjsDLGhZxoY1AOQOP/Q9Rr3cSEz7stqScNTuEUX31ZKJiBzJMdaCzHeIfn1mI922nlAhoS+VTd
	t76AurfXs4mOO00a9a0QEm2auC8BROHonP7uGyTmH4jKIyidjb/nQOXaGa/6Y0Tp0a1t0DIgsW2
	vCaFEk1NX3q7UPuIMZv493C6a2W5GWjiU14ttHzg7R/jVgQNTcXhZiw9E/ic+A8v/1vG+KQTKfE
	6Ete8n2L6Y+E/LGMv+RQw41SLZ4CXNdNUqI0+f/narakGTcS3L7fPUWppo0zoZbcfqvXKiTzY/8
	f16k=
X-Received: by 2002:a05:622a:8c:b0:4a7:4eed:2582 with SMTP id d75a77b69052e-4a77a208dfdmr74778751cf.4.1750674801065;
        Mon, 23 Jun 2025 03:33:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEln7ZGKKW+D+JHPZzQ0nxqJnJa2BYglgaPTSkAIb5LBz0k52R7GuKUBnLC2HnnT1pe5nkr7A==
X-Received: by 2002:a05:622a:8c:b0:4a7:4eed:2582 with SMTP id d75a77b69052e-4a77a208dfdmr74778551cf.4.1750674800631;
        Mon, 23 Jun 2025 03:33:20 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541bc9absm692214466b.145.2025.06.23.03.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:33:20 -0700 (PDT)
Message-ID: <f791e356-a24b-4db6-8d11-fd2c3211e2ab@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:33:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] firmware: qcom: scm: allow specifying quirks for
 QSEECOM implementations
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-1-6e8f635640c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250621-more-qseecom-v2-1-6e8f635640c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YoEPR5YX c=1 sm=1 tr=0 ts=68592d71 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_nksSFq5nnA09yPRHO0A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: U_h64tg_ODfiCBvKsnAawaSnR4oY3_O7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MiBTYWx0ZWRfX1IFMPnMJx+v5
 HBUwYUm9OAQH0Kq0TbQy1U99lfxfaUU+iZMvC7FB7A45OyVuU1vK9fyjlyfJ0O4jiP9qIiHRKto
 +Z9byKPg63yyJ0YcssPlen8+3/WNilVzoE4EUQ/mK2yP2juvO2/7cFGS9UEnroEUIxbqs/aq9Jq
 rzzA1BQx4scYDiknc44W+r+i3KQn/k2YwGW3OLpsSrhKCPKNQXOZNJH+IcIHyq9Sg5MpiJF8rZD
 ElO2LitPDD/KoI5fDMd1qraJvzJlZdwecEhhwcnLwJqymxqW7nIm08TkFoqSso3SMOiGb3yVyYW
 t9ZqqAPuVZj/5OHR2Lq0AdMR5gTBPtqopRoV0zoiPRdk/7cbYFHgV26Rms7/hSxIfr7ci1AdnCI
 bXLyNQ0NNFO8lMSKDLtpx2L5zpHvSnTHEXMbiwIEjw1HjgPAA7ZgYDWd1n589raHHDgM8vDk
X-Proofpoint-GUID: U_h64tg_ODfiCBvKsnAawaSnR4oY3_O7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=933 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230062

On 6/21/25 9:56 PM, Dmitry Baryshkov wrote:
> Some of QSEECOM implementations might need additional quirks (e.g. some
> of the platforms don't (yet) support read-write UEFI variables access).
> Pass the quirks to the QSEECOM driver and down to individual app
> drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> -static bool qcom_scm_qseecom_machine_is_allowed(void)
> +static bool qcom_scm_qseecom_machine_is_allowed(unsigned long *quirks)
>  {
> +	const struct of_device_id *match;
>  	struct device_node *np;
> -	bool match;
>  
>  	np = of_find_node_by_path("/");
>  	if (!np)
> @@ -2020,6 +2020,11 @@ static bool qcom_scm_qseecom_machine_is_allowed(void)
>  	match = of_match_node(qcom_scm_qseecom_allowlist, np);
>  	of_node_put(np);
>  
> +	if (match && match->data)
> +		memcpy(quirks, match->data, sizeof(*quirks));

bit weird to use memcpy since it's just an UL

Konrad

