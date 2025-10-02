Return-Path: <linux-arm-msm+bounces-75799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83015BB37EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 11:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C322E3BAF6A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 09:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB712FF66A;
	Thu,  2 Oct 2025 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qq1ph6IC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623EC2EDD58
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759397951; cv=none; b=Fb/VaOyM3qCwycRv8ze++uOC2t3T39ZQnnSw4Au1RaQYYnJS7UOfrk4T4TWkx1Uns/i+iKDc5M5DjeStxb4mLNNcVaH8iFiTNsFlJrKX6lzjzNMgn2S+Z6Be83EVyOWcuKeeN+bqOor+K5mTLpyN5Ga6gayFd8i6h8iEiYhQgPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759397951; c=relaxed/simple;
	bh=UwztpzhqGUQ2CYEBx2U0W4UNqinr6IkqAUvmrULaz90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=biYl7L3CcqTstQKOMxSpnzdWvKzzkauMHKSAHWt5vkXahQ/zRC3O228UknGvh222AWxt2iaIWo+cm+lOnXeEAY8fWzctA/wa5ubXUPES3s8IG5XVaObYmedrtQLUWZt0gUI3+LBAh6Dc87xu5K6zNn5CHc9EDjO6n2ra0dWx5kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qq1ph6IC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5928qJxQ022701
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 09:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4++SDA4MgkhTViFxfPV8DJ8y+3F7sLMFivIo9+B/2Rc=; b=Qq1ph6ICQHMup/E1
	SFklfRyEvxEbKZVw6Iew+usXfYDkNwI2OqW9B113sqaNPpBTH/a8fRIJ2WugDalj
	YnCQ2HEBnbZhDS3JcwE57xWY3EF5sutB3h0VEAaokZ5eP9tjvxiOm3rnfKp8/DUp
	T00shb1nIP5LxyBJzGDlVlQtEMHKD7YTmtV2AC4hHBidfUtd2GxaHAIcIGqhFAZ1
	6hw7VeZwzq9RFjglAHk6GPu80lqya9sgpaPgkZVV8rCK20ccQc0xUZIsuzLiNzrM
	bgHA3SyQN6qkU/ZVwFzbJUy0UCv53VUk1IiSUOXwiPKiwc4O/wEsSSySfHLQEPYa
	IFNi7A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n7s02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 09:39:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-873eac0465eso2483546d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 02:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759397948; x=1760002748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4++SDA4MgkhTViFxfPV8DJ8y+3F7sLMFivIo9+B/2Rc=;
        b=VwhfnMCqE8JpFZhRgpGN512O8Kqjj0vv9QIwhuhKvESO++k5VJOqArE1a4iwNAQstm
         pne9ZnFQ1XxOeMYr3aRbpKcWRX4O5w1apDxOoBmtIucf40DKkubSixRjdvXFwv4rG8E4
         4SudJeLrS28+Gpa4+vFneybeONtTjHfIp2YyxFZKYrFFFSbj8NwqsVsAQQW5yFHhyGhA
         WPcfRUzNbD060mx/NECwIyYGqr1cYX8KjV0uxaqa+SAoeuhZN1XcoeGp1ewcWaMQS+gu
         Lm6YkQTtwyqj1BaqfKVHxqqB/bmJDUla8Sw7fUUArgIoqlSMfyiZIMxJd/9KE9ui+wQN
         nMmg==
X-Gm-Message-State: AOJu0YyFMyYnf1F//gl/WxHdcZkwu2YuZGH4jrnKIIhRPw/+OpfFwAz+
	V0b5akWjhduVssKLI2bgDl5iADFDt51WQAeabkxcLr0kRypzxuTm9WH9aCq6TaPOEaa4lJqSN+s
	fTAXIWr+z+S/2y72175xJyYe9NQAr7HggRflajSSMYEeddLl0ROXNze8Zn4PFb/s53Iwr
X-Gm-Gg: ASbGnctuiYyV8Q4g7ZgH/eEpRrh6ZgLIeEv+Vs7KwgKZVVF1H7d/ZYYcRjOIsQC5Yg0
	c//1rsXK8C1wdtnwGwSBcoR3M2t+j/HtuSOPnYCQcqj+89hAFzZ1p9UCWKGIP2oKOLi82IE7N8Z
	DwrOGzifrul71ZWwmgyeFMmLthUSySw0mpRvVpBDJtEAGEqvug6ey4dF9H55K2ss1t8mPeQsWOc
	7ll+psUnRjRY3h916jMOb6wOesbr6gWlaWrpD8Wypd9+CKUVR/+SvtRFdyNoxSj02d2GjtzkhCE
	Lj94lx5nFztuGdcTergiG2tB1QA8iOTUt+11y784yRlFRv3SH1vccos5rI77XJ6+jFMEpxHEiuL
	bxYPcw7ayquWAxDfd3FRf3mTjyU8=
X-Received: by 2002:ac8:5d86:0:b0:4d9:5ce:374e with SMTP id d75a77b69052e-4e41db86a34mr53783301cf.8.1759397948295;
        Thu, 02 Oct 2025 02:39:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsMAVkG8Lwm+h4EZ0ZLCIem+qL4p3pTvptBNaYQFRFSEVLHYf2ys4wFomzZ7apxqS3zsjovA==
X-Received: by 2002:ac8:5d86:0:b0:4d9:5ce:374e with SMTP id d75a77b69052e-4e41db86a34mr53783111cf.8.1759397947668;
        Thu, 02 Oct 2025 02:39:07 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865a83482sm172919366b.26.2025.10.02.02.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 02:39:07 -0700 (PDT)
Message-ID: <fca8355e-9b34-4df1-a7e6-459bdad8b1ff@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 11:39:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: ice: Set ICE clk to turbo on probe
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251001-set-ice-clock-to-turbo-v1-1-7b802cf61dda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251001-set-ice-clock-to-turbo-v1-1-7b802cf61dda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bLLo6J0gdOWvVmZcKRqaI3iVBJDxDCsC
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68de483d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=kiQjUq8FSzjVjtPiR3oA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: bLLo6J0gdOWvVmZcKRqaI3iVBJDxDCsC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX8vuvEnfFPnMN
 l3aCZ3gWdhRPvD7K9z6PQKMly0OIzT59kJjbahVT0MlcxehBbtwcBAjewHjyi53kz8fi5QwFSWQ
 8YikGlcjcSs1SWard3F4tyyyhWvm6JenIVpx8cogDFfz25W7wcOGohDbXJb4uIr55Opstbi18k/
 wzfGhMLYVlB9bxFX9LY7BRw1w0xXp7G7JBDfnLy+gLrvxpk5BvLVlcDJejr3YV6hqYX/FKkKAk4
 2fuuEajuREVwZwzTbopv9C46lAFrGDuHF1MBcVf/Mt1DcwpUD2hbBYT+cL3t06uOWAM3sM7ouJB
 KVaoKM+Sely8Rh4Z0Dn9+BgAKDTtF8YVl6i0T0MhU7BU6wyscR1sn8UaY7+iF13yvzucTpj8CDX
 NO2G0ImwyPgXeiM1AbzbWvU3C9vFmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_03,2025-10-02_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On 10/1/25 2:14 PM, Abhinaba Rakshit wrote:
> Set ICE core clock to turbo (max freq) provided by dt
> entry at ice device probe.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
> MMC controller lacks a clock scaling mechanism, unlike the UFS
> controller. By default, the MMC controller is set to TURBO mode
> during probe, but the ICE clock remains at XO frequency,
> leading to read/write performance degradation on eMMC.
> 
> To address this, set the ICE clock to TURBO during probe to
> align it with the controller clock. This ensures consistent
> performance and avoids mismatches between the controller
> and ICE clock frequencies.
> ---
>  drivers/soc/qcom/ice.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index ec8d6bb9f426deee1038616282176bfc8e5b9ec1..eee06c499dc36a6bf380361f27e938331f1fcb10 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -535,6 +535,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  	struct qcom_ice *engine;
>  	const __be32 *prop;
>  	int len;
> +	int err;
>  
>  	if (!qcom_scm_is_available())
>  		return ERR_PTR(-EPROBE_DEFER);
> @@ -577,6 +578,13 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  	if (!qcom_ice_check_supported(engine))
>  		return ERR_PTR(-EOPNOTSUPP);
>  
> +	/* Set the ICE clk rate to TURBO */
> +	if (engine->core_clk && engine->max_freq) {
> +		err = clk_set_rate(engine->core_clk, engine->max_freq);

Please make sure to use dev_pm_opp_set_rate() and add introduce an OPP
table to ensure that there's also a turbo rpm(h) vote to match..

Konrad

