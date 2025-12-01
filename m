Return-Path: <linux-arm-msm+bounces-83990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CA1C97F4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 16:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1C5AB3415BA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 15:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C19F31ED89;
	Mon,  1 Dec 2025 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4h1g+m7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfM0FPEg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D730B3009FF
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 15:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764601614; cv=none; b=ripuo7GwyyhXtIBoZNeIL6ifrTD0wEJKCNi+AjydpBIQsdiG/BSXnIbARqxUm9By6XPpVytO2/zDTj3jkxipyOdvG04A/4V8HNQrXglaoVy98G/d389gkVR1ud7Ak0/RODZqa7NfXiYoW2EVtY8oe9e6j1Qjnf6nXcFTVD+4Du0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764601614; c=relaxed/simple;
	bh=PThqKDlMOg91G9eF992kfltVjOsaxU5dxzmEfM1kCN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgbX7/5eXKXECMIor607KBYZaIUDJzSnZKXsa60l+sWRylx2tgYhK9S0UeIzUSboTTgmNcsmJdCH/6BFaPIp5H3bnhzV+UFa6ekCOLU3Y/l5+IWcOTdk6LfEPzDhPuFJdtmh53mbHnBvaOWy2vnKqjknkv6EnY21D1ZWphgEtBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4h1g+m7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfM0FPEg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1B5cX7396696
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 15:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WN31XpVKAWNLpUrQxWKBO3fZgfcxLv8M2+uJRSw2WAM=; b=o4h1g+m79D7Y/C54
	/8ZiqwNjYEJmcnVRZaLzNf0rbmcjOw3pnb+n5xhqwxJp/0QHfCnnRtrTeEfHNAfL
	GG+T0vRr9AzUjtIiBBCDiQYZLOatwFOD0iU6qxD+GkJKM7UsEsu5Fp0+3ekIz6jD
	O0biRBwYPpNEjA5+7SxvI6OBrVgGDMPvU9ShJw0KxRzQt9fD7stNzqFy5T6j23qQ
	dkNFjdhu5R2kh3L23INdaZtgB9j7nmb/Ox3B2OsArnq/Cciu5+OwUbAD7MExH+kH
	DVxrjxv+Yp14sHeOvM8eoi+g+MKAQen3qMBY9oQ+AYOkR3llaLs9fVlOwksLSsbf
	Tw9fuQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as9ug0ngp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 15:06:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5dfb8e7d182so531493137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 07:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764601610; x=1765206410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WN31XpVKAWNLpUrQxWKBO3fZgfcxLv8M2+uJRSw2WAM=;
        b=dfM0FPEgXFGvgY4y6yJ7slzXjywSDSTNLRHUC9soJlCdV9x1pgAkCZIowuhCB/VNPW
         wtwnxceMfjBSl7HQpvmTC7rFDEOqCacnnTCZmgv54FqETfXSG5IecQ77V1JIAYCHYTtd
         HUIwZ8W+q7zK5k3DW6U+drk3Bo6XioHOajWeBBAKDOK7wPs2gi7Uoj1JNlam3unhxp7e
         NlzgKRXbaKspBk2s7UDUOoAJROLwBC+sXkczEQVGZhUIyM7enOIfryv/Ksv7QcXTqd5Y
         seETnn4cblU/0isdz6+GsbypwCIfeRKe3a9DJNRGNYUy3INlBwOTCxY+7I2j4xNimZdM
         9D5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764601610; x=1765206410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WN31XpVKAWNLpUrQxWKBO3fZgfcxLv8M2+uJRSw2WAM=;
        b=ECN5OR+7JwA8Serm02IvmbFiT4m6qEHEidYNcOKYxWKHCSRTMy1QheHG3iNdPEDlOO
         92Qp/O0j7ijyGnSEODt4aPLVwFWmU137spmjZYEVXU2f22xe1+dMYZoYLFYhCH/5bWgf
         5AX5gw8D7m0Zha9N1mpGN+v2fLX4A3Z1+SEX74K7+POzYkP0T3WggP49660KfnpzDdTR
         iM/STVmln8sr9wpkTR68ISio5rNKfn/hyQQ7i+efxSEiSucu9+paLdXIzY7TnD/zLf9y
         2VnxNn8s48WQKlfwKqUVMdJ5kYsjIQ56Pg1eJDLPFGRaeQpwLlOG7BXy8osJlXV+vi1O
         p/og==
X-Forwarded-Encrypted: i=1; AJvYcCXaHEn0pg7cS09U7rXcarsXdys/4umv2bvEQ/37XrFIJuuoDQkYO0grcHX3zKMAnzo5d9R8KI7ni+RuAYUb@vger.kernel.org
X-Gm-Message-State: AOJu0YwCedFOWiSwOBFR/ugwcrn0RAwSPrIDmsO7m4z3mWppMf0BQxfD
	9Arv+ONWXGJIUTjNuUcUG6+b6xZcfhTTi3z49uwdvRs5DfSeiSDW6fWZlmPsw6XRjNciTdKtOUW
	InU6G5WUgEFcYoP0hLGAfeYXSSdNX2JmjZjVBSNTDzUQvunWGa/61uDn4Jmw5gT7CntjC
X-Gm-Gg: ASbGncvSb8oMEAz7YRtAbIPyf160DttjWiSxB6crg+aoyG/3Q80plJVvEqfO6sxeHu0
	F9bUbnUneqysaNF5HRxyc/EVPs9wLJDkKDYtyc0K7pIOQXFLOBe39l9GYiGHbmXe9fCwggfyt8C
	nt1wtAkvrwWH0zhntWQ4s2RlVeBQ7v0BrbBtnq6u7GrWbpsUd1SBcweSHDmQgjwKCftwRzmGOB4
	e+rDNv8nRM/cmr8+HD46/3x3zLLaGCtgOtNU2L2CSdpFH+UON9Xl965NFwEZLgJsbxA0+8nRd95
	H6kGVUvbmMH9AjjlnYfbfc+R/c7+9Du/OxwGorDFVhKYh79sVEROl2cKoCr96Nk70ZHZMR1o0Ey
	9M/NJsUnxR/NqdcIjhv/lnnv0IKZeV+jAAv1S5UFBfx99P/UMEIcMHcLYAbrCd8GiZpE=
X-Received: by 2002:a05:6102:dd2:b0:5dd:c3ec:b76 with SMTP id ada2fe7eead31-5e1e66f4505mr8267343137.1.1764601609972;
        Mon, 01 Dec 2025 07:06:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfVlN7RdzDAkpjv08QNbaMbaegno0fcNkNHVYzQ7+oy8pVcRZH27l0E3h3aEvMozx/stlEug==
X-Received: by 2002:a05:6102:dd2:b0:5dd:c3ec:b76 with SMTP id ada2fe7eead31-5e1e66f4505mr8267225137.1.1764601608838;
        Mon, 01 Dec 2025 07:06:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59e93c4sm1215866966b.53.2025.12.01.07.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 07:06:48 -0800 (PST)
Message-ID: <5fcfbd5a-bd08-4549-9846-29c3da888a84@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 16:06:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] interconnect: qcom: qcs8300: enable QoS configuration
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20251128150106.13849-1-odelu.kukatla@oss.qualcomm.com>
 <20251128150106.13849-3-odelu.kukatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128150106.13849-3-odelu.kukatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEyMyBTYWx0ZWRfX+0zRSTWF1f6k
 qeaO+lshTMKlJ7sPSPQiQD1Zjl6sTAtgJyW0zpMNHXs4GKHy71gSroH8JujI1gRafAOP2oAk05o
 pmWXOyrUBS6g8m8TomkCngXUDxZvZNss8RA4VsHZ/NVgSIfOMphVckm979C0k0loOwSvW406rVN
 /ksiPbGMzylqKmAkHtdPqZg57sSIg+c8wdx9EpBkrCEsqcC1NkWBX2uU15rPVJMCa0+HrFudAgT
 E8TWK7XRyJYBpaVg4p2k/LnTVYkC/CP1e0o+4o8YsyD/JnZcX1+7uKfgCIiYMXUDcxonpWWjc1T
 7X0FyxUFySzYPTSFfLlUQkHsIww/tsE3oCi32GkjMmBoy067MOgnj0t2NBUeIEpGrlliUhRcr8h
 Y23wpANUdXuzakgXl3+Zd6Ui5PvCQg==
X-Proofpoint-GUID: L1A3OfJOl-0PmQOdhiMNycdKJuNsffio
X-Proofpoint-ORIG-GUID: L1A3OfJOl-0PmQOdhiMNycdKJuNsffio
X-Authority-Analysis: v=2.4 cv=EunfbCcA c=1 sm=1 tr=0 ts=692daf0a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mjAHdMWAtFLaYi06n1EA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010123

On 11/28/25 4:01 PM, Odelu Kukatla wrote:
> Enable QoS configuration for master ports with predefined priority
> and urgency forwarding.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/qcs8300.c | 375 ++++++++++++++++++++++++++++
>  1 file changed, 375 insertions(+)
> 
> diff --git a/drivers/interconnect/qcom/qcs8300.c b/drivers/interconnect/qcom/qcs8300.c
> index 70a377bbcf29..3f4fe62148d3 100644
> --- a/drivers/interconnect/qcom/qcs8300.c
> +++ b/drivers/interconnect/qcom/qcs8300.c
> @@ -186,6 +186,13 @@ static struct qcom_icc_node qxm_qup3 = {
>  	.name = "qxm_qup3",
>  	.channels = 1,
>  	.buswidth = 8,
> +	.qosbox = &(const struct qcom_icc_qosbox) {
> +		.num_ports = 1,
> +		.port_offsets = { 0x11000 },
> +		.prio_fwd_disable = 1,
> +		.prio = 2,
> +		.urg_fwd = 0,

FWIW prio_fwd_disable and urg_uwd are booleans, so true/false would be neat

I checked a couple nodes and things seem alright, hopefully the .max_register
values you set don't clip anything

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

