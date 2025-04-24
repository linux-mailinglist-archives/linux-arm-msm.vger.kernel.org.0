Return-Path: <linux-arm-msm+bounces-55519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D75A9B93F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 22:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D228D3ADBFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 20:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A1421CC79;
	Thu, 24 Apr 2025 20:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6jfwCVH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C385216E32
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 20:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745526770; cv=none; b=IFGLZWqRyVxcFzNfEg6k+Z/Hx0h1Qk0ifMabNnH9F57yYOVBqNtLe3cJVa1UJmjQbJvhChT7tT+cBurUWez/SU/SDehaeWJV07IhhUc6TqdME22lhfddX9M5tD5PUxTpZcxPrmHwxisXkzW5XqQquRPjCQe2gkS1GxueF+NOD7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745526770; c=relaxed/simple;
	bh=tjaBPN56UPOtib4A2G46hSfnd9J/OzQOEib8ipL3O24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QcH5dsjRcafInUcyEJHCjpK76vsejnRMPqxJW7IcS562gnykQLlFewN0cUPOx+5IJ/JC5LiLGLSMSFeEv6kqOFZFFc4ZyG5iVzcfui4DRSEDjpiCwzTdr1UxzL/IlD8XuxjiVARm37Pu0n7JKfGhmdAWPAbiBvkJ9ri3fstWTAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6jfwCVH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJmoqv006865
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 20:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8HkOPFKN3GC9vWOM46Nwa7p+fPHQ6WYQxK03zZBQac=; b=h6jfwCVHDQOYZElI
	KqMdn+DgOWPc7UbIDJNyh+xGuawbfmXa8O0O57XaiRXJsnmV+l/iGaHsp0idoiFp
	wO+gEUVRIXqPHuEjil8byuZHj+LvyGZwvDOTWOczB1QMMeIaY1ShCNR3C5PcxytU
	/c6UZQhL93L6eQzZ5Nbhb0RUNvbOTCdB/x94/ZA2y4/4Q2w8RbGXgdm1uvhRnHGk
	rOwaLk3VIKby1TQ9v98EgkVtAUdOWiHO+wEh1dSpFBgBYOHT8vR81vn6GZLcYtTX
	plnrPVO6ig3K0zRVIbiDw+EaiKLA5jq86tMJnvNt+NtHFa4jzbOouq4hDcL9xy4P
	S2zGJQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5eupv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 20:32:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54734292aso31375685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 13:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745526767; x=1746131567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8HkOPFKN3GC9vWOM46Nwa7p+fPHQ6WYQxK03zZBQac=;
        b=YZuT/ZvnXDKnJB15TELG/MTgNUi2Pn+A+PD2w6p4tixq1kNS9N+tGQeghiW+UQGFqt
         cZ1jztlBOmDmVv6/e6RI0tD5ecKmnAi1LN5QksUHhWRBOtJYe1+EaijwMoaNaN7H2RoO
         XWv92z7Z20d0XpJceYtERCAIoRHK9TRbWUgw4l+AKvA/bZ8gq7ORZKjw6JK0lX3G/9EG
         do2pA1rBozLS3VZbuqJac1kemypcPGSxIe7jEEQj9HbvD1Y6UNkswdF7EKIKiOzAE4Mg
         jh3BVVz5jBskVYJot36sNkPC4usC75n79IaJwg+Jy2IExoVSzlQDq+kqbkliSfcTKqbY
         HdZw==
X-Forwarded-Encrypted: i=1; AJvYcCU/kqgGXPpyISW3XQLbea17MmvKs1D7zsMeN4J393pIZ3ZEQKUjol4t0mck+7JtBsVNo6WV5hMWDa9rLFoE@vger.kernel.org
X-Gm-Message-State: AOJu0YymetiG1ERQR/8tKbzXtxi+iX0B49qyhY3pf21IEWGdifggxhZg
	AHZ2Hp0ip3pOpLN4c4tE/Vc8w/LN7ZA+R5XcoABemLpg/+8385kbetndwuIH2YFYWAjOumQ4psT
	juZdXbuiGQ/m+VLKdgP2I8q8oLjdV+5dK3oOEaMH6R53lqrghW98zISqBHGXeX/Qx
X-Gm-Gg: ASbGncv+9mFfY84KEkrcaFViJI/iDSSxeBZCKYr2tNJlcdHaB89kysPT52KS9eYS5Si
	wDGppKF2Ei8gAq+F+2487+uwx3IR60tPrVgjtsPElU8lZ5zuyjRTNXFMM/TZy1IH4X4C/VBm2gV
	CFfI7BrgDqJj4AhjWaoAI6FVm2GAvkX9GWcHPUfjURVNacym4/8cC9LMmirPplgfDjZkbr3W7ix
	pHJYqXZsTE0xbBFV8SwraOGonh4UV7FUinmAdbuNFaf8wD1LYFVtgKektxquiX8DBl8m/Ysggin
	xEWC78eOsN93DRx75BFJV61DhnFrUBVeiFIOiwgGvF2Yw02xbi+zKdV52IzI185t/A0=
X-Received: by 2002:a05:620a:1729:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7c956f79fe9mr259898685a.10.1745526767274;
        Thu, 24 Apr 2025 13:32:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzye98f6Zt0tar8sWeQ6uN8aYWFW+oIeMzfavLC0AjRUoW90eRnRuTlTFArGMlyuz16164NQ==
X-Received: by 2002:a05:620a:1729:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7c956f79fe9mr259896085a.10.1745526766905;
        Thu, 24 Apr 2025 13:32:46 -0700 (PDT)
Received: from [192.168.65.221] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f658csm173401a12.41.2025.04.24.13.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 13:32:46 -0700 (PDT)
Message-ID: <01bb7183-eb33-4b9b-b73a-e7e3622bf9dd@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 22:32:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] coresight: Add remote etm support
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
 <20250424115854.2328190-5-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424115854.2328190-5-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE0NCBTYWx0ZWRfX3XdNJ73uRNbG w84KH8O/sjlXCY8g79ObulhctcCbtY1rYyjx0Vhzleho5CW15aaj9XLaHrm+PfJ2mS754JiUGZe LWsUAzyLdFdq02A2bWKF8+6ev+Kg/MI3spZacNwhvwsCXOQpMf9h6Rm9XoIy+oOVl9gvJJCSbz/
 4UCmHigjcapMWekZ+PdDZ5GRmy/wR7SzpiD+0AG2FQimcmg6gMfkwBa+KCIF6ilFFLkcKpJdbXN FjsFV7U/DRk2W8bdKX402hoticv9mV8mr2PwuZ7z9O8ZYj+cRXWiAbFtYxYnZvSw6JLRX77sXch rccTtH3Xzk6TkBdmWdxOQKCgE6HT2cXKsWLbfl4sGSD23Mqqi+tgYHEC/jlLn9SEEeFLX0CZjaQ
 pWDHtuIZ6Of/VTViAbrtvwb9p28ISWiNB9MUtf67Ep4T8ukWuxYlewbSntz5yhLWQgeHObA0
X-Proofpoint-GUID: sxs9IqwqFYq9vr7jmDZNp8S6xW4v8rCk
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680a9ff0 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=day4Cjbagy4oAH_-zrgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sxs9IqwqFYq9vr7jmDZNp8S6xW4v8rCk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240144

On 4/24/25 1:58 PM, Mao Jinlong wrote:
> The system on chip (SoC) consists of main APSS(Applications
> processor subsytem) and additional processors like modem, lpass.
> Coresight remote etm(Embedded Trace Macrocell) driver is for
> enabling and disabling the etm trace of remote processors. It
> uses QMI interface to communicate with remote processors' software
> and uses coresight framework to configure the connection from
> remote etm source to TMC sinks.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---

[...]

> +/*
> + * Element info to descrbe the coresight_set_etm_req_msg_v01 struct
> + * which is used to encode the request.
> + */
> +static struct qmi_elem_info coresight_set_etm_req_msg_v01_ei[] = {
> +	{
> +			.data_type = QMI_UNSIGNED_4_BYTE,

There's one tab too many here and in other declarations (make sure your
tab width is set to 8 spaces)

I'll try to read into the actual code a bit later

Konrad

