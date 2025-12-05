Return-Path: <linux-arm-msm+bounces-84450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E645FCA766A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 12:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F4303026DF8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 11:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C73032937B;
	Fri,  5 Dec 2025 11:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eAXGOvPi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RtDREsc+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D14F2FDC3F
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 11:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764934174; cv=none; b=M5gqrL1syBF2Y+p8DMR9rERb7kkNiYI0F9wVNRF93IhgGIQ/Km8fis3VG4bkPVbOo9YMHv8M87iWGUhg8ihSzJyPDszMSpJUcqIM5Sra47Be2HXlahenQyg7q8z+tiKz7jnmc2lIUyWSzvYSLwpsib2CNpl8/+tsGczkRVTYglA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764934174; c=relaxed/simple;
	bh=2QbpmW46B2AGPfg22M8RWdwNWnwwgqRBCb3JhSiPqEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ngENL/1a+dokUmYUMSsG6NUHG6AZoYJ4ZKQKxooIIa+LPTtK2qukkK2rkq1anKxUuWNkYK+iJkLY1y5rLAIXEcg2ALO+6s4wvh8Kx0wfwmxO822LZ0ej8BwL25K54gkAGVDzbLqZsCEmzvtFLXEURO60+lHhmM414l5j3Vjl0TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eAXGOvPi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtDREsc+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B54Jxk13643664
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 11:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LWL0ydM3L04AohTCdbZotp5wDtMDsHUfvxSpYEhTDwc=; b=eAXGOvPib2vDWGMr
	oXVzROqEKnOQy6BOu6O9PlL/6wDazam85enpte7V+1dF30wSfFW44URGoenppFeH
	VJ8g4loGrYXtC0T49kU+Vkxja7FdQdZiOyOjZGDXb+RmHx6414c3tK26S8NPMAoK
	1kDnijXJXLA2rZgD9DwXDtYpApVv1CX1yYyki/iDUd/NdjHEFVfkY2jsaxtvfZOZ
	R7EecJS2E55acTzV7rTOVqj+kuSYGvYjugfzXjgwLj2fZVGxiuk7hyHbvLrYgC5s
	v9YBIJeXljEgV6kFkTBX4TfWwbKh58Gg0/PpjMdOJmwIMKF6fo9t/Y5mPwPrYf/k
	HJn+ww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aur9as57f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 11:29:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaa289e0dso6800431cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 03:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764934168; x=1765538968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LWL0ydM3L04AohTCdbZotp5wDtMDsHUfvxSpYEhTDwc=;
        b=RtDREsc+cNLaWa1i7+Rx6GZQffsxwgVnalm4BW0garqY5dhoWwLfnUcASrSXebhR3z
         Zil5sP4xR8jLAInnrWfcQhw2IRv3UYf0cgmi4dKCcVUj4YFkqZXEy9wcdJiopfiNA69+
         Dh0v44dLj/WJxWzqTOiJvmsAMSGBCQosFFowv5oYcxK6DjrgVfyvzY10phGMV7rXQWQw
         ktQdd27FBm+48GfWeDfFe4jhJ1vllj4TrZnUoCR5GTLdkLGlKgZ3x9LtFWDgVcO3oYlv
         BcSKwYgPawBRTlQ87U3zjBazFIcEE2YNTcPqDi5ixhmyVhZ1hCA/X1VGkGS5FgtmW9uZ
         +bnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764934168; x=1765538968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LWL0ydM3L04AohTCdbZotp5wDtMDsHUfvxSpYEhTDwc=;
        b=kIMaFtB06YlwGxm9MKZ9CJ6P1PPEFz56F1Yzrxop/82uyiuTQOHBnXHJLUUC+loEDc
         BaqaedMr/FJPTotLtIkHipkUiVY8FXokM87zjNmYyjE9iiz9Ak0GejsyrbSUMZuRnyBd
         fwPcdRpUUJvTIevII8g5Ha4xX+EAxfzftmZAY5GBWSkVjimz0b4f+w7ftxJV02UICcd9
         8DYCvOEGIbDbTY/Sjc3RjQgpliaRpFk8QkmoH7ldnIgsSqet4VYHpElAZ4aHp/jcqexJ
         3VUFaLe9HhPaHQt8bh6rbebI6j/3jurm0YnfdaVdjS8LlVPAxzgEP8/BUZeICln9D5l7
         6TVA==
X-Forwarded-Encrypted: i=1; AJvYcCWi/WyoxqTqOnBYWl2qbOBKcxz9FQEVF6I2BepyoMtACLm8ZLYWfkFK1AxX+d9TVj1zNGSu4XjLLXMkEM3i@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1uBrnwAMYmsz/W89XTFvNGsw/ckxFj7jIuxRn6p67gZpEnjxo
	/dBV073TPPslvugEdZetWOEz1NoLdaeqVsUcQcdUbk9laEohAy7qsZv87Q0wmsgpM1UGKESvFpn
	qA21ZzV9wCqqCXCsuIulKYWquASJ8U12yCrKM9UsTzVDmRT9Os4rzN80NkXMe+/Zdpiiu
X-Gm-Gg: ASbGnct/ZezIidJgBkKjQlFRGvm5jXvKA2FjiQn7fIZdjDgrL0AroH8Go6tGi+QDxan
	Lz6twvjmb8EGpd964R/jspyiYax0Na6GJsmoxkSWKoO7YN9qAxjBbcdf9WYVU/QMZ3ijJxUTSv4
	mB+hYTV/GR1yCubuDS+iIOgKLTFZKDRfkO4lf8mzc0IDXBxz/C0iBsoUsIJlOCKX9U6Fzr5UzBG
	yK3s+LLTnPwL7D8Rvbc2iprB/v4Wg2qkwF+yqVJLoWUcopQ/Wq2pvO5Qh28yGmngf1kF8HVDGHe
	phKhirBz+PgrohzBXyy4kPm9KKtNJ7+T8Q7n9R5Vlui6UN6J2/S+yUJdAGMd6PeP8zOS60rk3dW
	nnrnx9SBSH3RDuDmDRw8+BDj6OKjA7+4zgONUU6BwVFK+WOfJLBLXCVcRyNBJqFKuJQ==
X-Received: by 2002:ac8:5ad3:0:b0:4ed:67c4:b7b9 with SMTP id d75a77b69052e-4f01b092f51mr87709311cf.1.1764934168462;
        Fri, 05 Dec 2025 03:29:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEa1ijzoTxkvUrge3Gxt0hrZV7i9L38lwB3FXCXbmtB3yye8Rnw9ekPcTmVNaAdPycz01M15w==
X-Received: by 2002:ac8:5ad3:0:b0:4ed:67c4:b7b9 with SMTP id d75a77b69052e-4f01b092f51mr87709091cf.1.1764934168031;
        Fri, 05 Dec 2025 03:29:28 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b41219c1sm4054011a12.27.2025.12.05.03.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 03:29:27 -0800 (PST)
Message-ID: <a2c6cbdb-a114-423f-a315-6e5e9ab84e5a@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 12:29:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
To: quic_utiwari@quicinc.com, herbert@gondor.apana.org.au,
        thara.gopinath@gmail.com, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_neersoni@quicinc.com
References: <20251120062443.2016084-1-quic_utiwari@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251120062443.2016084-1-quic_utiwari@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=6932c219 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=HDohle4KqOvtihE_74YA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: NCLDfKI0c5rq1UpT1CCGDkoW3KGCd0aT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA4NCBTYWx0ZWRfX5D45MnRpicym
 XgZ4t5k8i1Ya+BxsZfm16HGafQtqvr3Nqcixt6HXH3b/xDDGPk93tcjsEfVINeygVhhYu0MXRyf
 1dqF8w1ClSGr4aa1jrdAkHWaC4MaiA1VDIN91z1Ilm4x/kWR7YHGA1k7zCYJWhjvuwyAGtv6nCN
 GsGbU0eaz2pQppDmXVJ2qMOp8HrtfWEuxgZQhiDVTdxsdjMcf4BPWZT0deBckEmsm7DbgxFTm1H
 7FVa/OUU6BrPtF+OdW47MScaBzOtzescQNGlh7eRE5RshFsPYni7La5o8vnTnypRNMyCIZDCWBE
 ilWzgcO+SRgYNalEe8ireDGhItkYBKVXg300CVpr9iKzL3u40QGiGbD3P0T+moglVLKOIO4//QH
 xdJFROTr7LM2fbesuLjF7izXf7tbTw==
X-Proofpoint-ORIG-GUID: NCLDfKI0c5rq1UpT1CCGDkoW3KGCd0aT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050084

On 11/20/25 7:24 AM, quic_utiwari@quicinc.com wrote:
> From: Udit Tiwari <quic_utiwari@quicinc.com>
> 
> The Qualcomm Crypto Engine (QCE) driver currently lacks support for
> runtime power management (PM) and interconnect bandwidth control.
> As a result, the hardware remains fully powered and clocks stay
> enabled even when the device is idle. Additionally, static
> interconnect bandwidth votes are held indefinitely, preventing the
> system from reclaiming unused bandwidth.

[...]

> @@ -90,13 +93,17 @@ static int qce_handle_queue(struct qce_device *qce,
>  	struct crypto_async_request *async_req, *backlog;
>  	int ret = 0, err;
>  
> +	ret = pm_runtime_resume_and_get(qce->dev);
> +	if (ret < 0)
> +		return ret;
> +

This is quite new, but maybe we could use

ACQUIRE(pm_runtime_active_try, pm)(qce->dev);
ret = ACQUIRE_ERR(pm_runtime_active_auto_try, &pm)
if (ret)
	return ret;

and drop the goto-s

Konrad

