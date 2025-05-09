Return-Path: <linux-arm-msm+bounces-57421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 535E4AB124F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 13:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 636B17A49B4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 11:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EA822A81D;
	Fri,  9 May 2025 11:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpxGwwOd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5132B223DE4
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746790632; cv=none; b=kIyL6dg9SVlpb5HYzDYKzaFzsIJ+SahKHk8A2DqhZJBucj5qD1XibdCCG8WcteV1F9R+nMKYzscDGiubtfvgQHIpF1sFYUGjcNqLxhFRKfVGnYD9jeszns3QtTaPK0/OIoMC3vUVGcWfsFT8eJ91t5D2T60EK53O/KCykkKrsHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746790632; c=relaxed/simple;
	bh=v3/X/EsQXza5RfDWmNFY/6SXCtBK2b8m4VMT4qW9eLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dtGyJ1ixBO7BEMOI895GcEuancoQAGJD78y79YDfWkNZbaWZDjN3dqe4N2LEbOAXttCqSZ9XNfDfGl12zRwm7VvpffWQaQbP3LCXPKHa7PpgMy6GR0ZokeUGIVgkGCCYB7nA0Oi51XKF+MCw/OTFQoGPgN2ynWjya4yGvQw5I+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpxGwwOd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5497eN9d019185
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 11:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jQYvA039xQOq1EAfq66VEyDGldlR86EFFJPP/2sBrOU=; b=gpxGwwOdLcT4VVU6
	mlpdKrnZHRbfbF1FwcU+0c8Lxzudb93lf33vs/czLEBQrYLhS/492C6UjHCR6uXm
	itHS37wugjgvMTSXsRxvoF2ib7+sPhEHzXsiqSHsvU9ntny7AQJHZvwWQdtZevfB
	4djbuBxMpJ8+PL3R6QSwCo3TpqIM4CIBb5u+eI3nZ4ad9ENHMZXYfupTWo3j5Ndu
	BrPHxFPi9+0dagym6txfQVFh6zdwBdkxbChjMK0zPeSwhc8yHya972+K+CUSq8dl
	TdOpJIK7K3/qNw66g3oGhuQXJojEVyiP0rp9mkbbR7UucHE8DsBfwVHTys9tQIMA
	ErQq3g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj3xhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 11:37:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f0c76e490cso5044726d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 04:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746790629; x=1747395429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jQYvA039xQOq1EAfq66VEyDGldlR86EFFJPP/2sBrOU=;
        b=F/GaSRvZa79XPrOlTd8qDY9NIpuv939F3AoefIqd7tysVvqotnZ6OdtTvQl2bWOAdX
         xR6+ZAjPxTwHHfxIF4b66I9dDIRZeYf3c8KCKzKgesxVx9oNw2Fu9QaJWz/kvNXXVDSa
         Ox7aJfuK9LZBVdtMCbRsepe5p+kpIT5MH2JBOuhPDt5daZSFPC3g350lGK26V5VPpuVa
         kovgT6DhfdWf1BJAIWsgdES0m8xPeg7Z9ElxQnux6hAC7ATX3odJgv8AOV6B9Z8KQJWp
         lk2dDG4vQXm2DtBjdZa7bIrEl8Tb34lQzvriOekmQ5+uXe07tSYDQYIpzhpFBRPaVoxL
         xsQw==
X-Forwarded-Encrypted: i=1; AJvYcCU6Ni7cpWdfB5h53oM0tKVnK+kFzkeYpS1FxCTvMMV/RN0NI6fF+DdaExMofo8Riq6VBTptJ0RUikzHj5KK@vger.kernel.org
X-Gm-Message-State: AOJu0YxwGAOSewQBdVUG1w1qB5jSmZjEhJXiD3qKOSes9b8x9Z3gwsDr
	Mf7fHeXf/dWxHTLJ9CS1lHTD61/WoWcNu1qdUqqBSI9QjCPlh/O4UBrXU9lNvEiRFvFGmD968fC
	aSqSYvGTpT6qgpGhDNfEgvfgo/bCFoDxPIKnlf2pcPN5flxo7Tj6VefhPEYy9BEn1
X-Gm-Gg: ASbGncsXliE1nhEIYYt+DUBnmY3AdH/sZ3vMF709QCRMSqo6grY3VAhJBV1fialf+dM
	iRV3f+2rHS04j+UMTIAsbCEarDy/XKK6qL2+MMVZ+O1cmnu5BPqYisvHq4ktXNMBeq39DXL+r4p
	pNm63R5H5ckWaiCWTVm0+jYXI13Qs3ieX5oJ38/yZaWgtS1+xUjm/kOU9VcxJjU0rgjWo1QaUsx
	W7ymipu6Awf6+CDOtgCCyzRI2ZYGCxBjL8ivHq4EmyOiCDT1NX9fQZt1kABb5+9LoiRRf6RT7ra
	sw0Vs9al8djte0epGvWkiQGY/TSWghZ9gKyn8lpnuOMhfV+OyW4bLmJDZ3KYNxPGRp4=
X-Received: by 2002:ad4:5f8c:0:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f6e479b1a0mr17500956d6.1.1746790629012;
        Fri, 09 May 2025 04:37:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEM61nHn0Kr2ns9tneLJwOSpfCca4k81zAOLbsRmIWWWiH1KtlKtWvlBuAwRRqu3Bq9s2A6g==
X-Received: by 2002:ad4:5f8c:0:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f6e479b1a0mr17500686d6.1.1746790628543;
        Fri, 09 May 2025 04:37:08 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cbe516asm1260658a12.15.2025.05.09.04.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 04:37:08 -0700 (PDT)
Message-ID: <58d913b8-0715-41b0-883a-423f29cb5a8c@oss.qualcomm.com>
Date: Fri, 9 May 2025 13:37:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 10/11] scsi: ufs: qcom : Introduce phy_power_on/off
 wrapper function
To: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-11-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250503162440.2954-11-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681de8e6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=Wi1UdT8OlrGSyUgSRKsA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDExMyBTYWx0ZWRfX7Wg9kOrjxOgg
 9I3aT4AV3NMcxX+kusM6AbzzlY66HunPv9jNkabNLk5OqfJZzVsj9LrmXX5D+4ozlLcg4yHEpM7
 3nwO+o+3rAFuxCA87NZkGfBI9vOk1LO0lC8TM9Orp3m+1MFfvkf4D3GxbjIC5/OpLiqJhf8rgGF
 IYTEWE0Yn/25Sg4jX9+CItplZZ/tr2uzUIetIB2kh9z8ot8kWX+7xI1/UPlhPy1Rcw3Poq/Fytd
 /XEHD74cgHFewjTCv+WPwV1s9pEHUDwFBk4IHWkXNvjMAoEiMfG4MIVIK7VBAc517PoXlIbsQmD
 g7I5KRDncJDwTtcbuZ49+qfS70OzLUVQOKwIqyhLrWOOxOy8hNlygGgV9DAw5zLaQsSzKmTnsiJ
 vTCQxlz+EnKAnXqIeRP4OwG/MAmCNAevmtiPuSrXqHdJFXqAojx5XsbwYpJ5Tv1aXPAkNNHL
X-Proofpoint-GUID: JHdcH_M2q6JCyyelZYJ0mUgZ0xcK_XgR
X-Proofpoint-ORIG-GUID: JHdcH_M2q6JCyyelZYJ0mUgZ0xcK_XgR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=685 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090113

On 5/3/25 6:24 PM, Nitin Rawat wrote:
> Introduce ufs_qcom_phy_power_on and ufs_qcom_phy_power_off wrapper
> functions with mutex protection to ensure safe usage of is_phy_pwr_on
> and prevent possible race conditions.
> 
> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---

The PHY framework does the same thing internally already, this seems
unnecessary

Konrad

