Return-Path: <linux-arm-msm+bounces-47204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D666AA2D120
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 23:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01F7C188FAA7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 22:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF681D5CFA;
	Fri,  7 Feb 2025 22:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fZNuc1eG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BF51B040E;
	Fri,  7 Feb 2025 22:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738969027; cv=none; b=Do/77fnvqVmLp8HiDwEVHmQfWlAqtAoYhZnsIn4fZ4X9Ipmt/LZoO/3eyYSgn5Sh+kRWkk8KKsGPMzhf/8vQ/CddBOFRrgck7PC2UMLv+fkKXk5AX+lWI0np78BHoWbQjR+cLz45VqxIqcIqSIyphqAQGo8yT2UPotIfJ078OyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738969027; c=relaxed/simple;
	bh=ybd3bcbQbXCjyGkVmrZKlnuqxC9lcKpwD3DjX7ZBa7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dgP5nng9yJoP6I4T2OBDklrfpT0CsF+yg4r+P3BkGhrVwvgTCIB0FyBqXE4XU7o6z6d2q3Ev7NS/T1b7hVC0mpnnsTUJmLfksEMdP8ynIu7SQ1wdeVo7C7moB0RH9UITvNOWxaIbAVS5zP9nFcoqhK5zUYGDiu/zuVHhKM+2uts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fZNuc1eG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517Frbat002491;
	Fri, 7 Feb 2025 22:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DZfGe16kUvK2uoRxcC6y7EgJPMLh571re/lSazxIgJM=; b=fZNuc1eGNlmoNg/5
	qDK91wAkkN/5wCvrluErMH0IpnTNFyrPUKMLxy3lvkM9x80+ybmcKDKl34nrqdWm
	03k91NVqkdyO3TIlMUKaJD2RQlMCiTEvMOwIZDRVHGl7DTbvgfuJal8j0ybbvthZ
	ka42/lsZfTM+/YG0ecS1gDkjLDb1c7MdntyDoEqMxSKhfxvfrG6jlF4OgOkh5sd5
	tN/CHc5CrY2wbAQ1uuGKqNVYN/RkbwoiZPpcVMh8eFQKsxRj4+bzK13YM+hdQHwW
	8i/h4t2VlSFKbB+9WOyvAK4pdb64m6B8zSAcmYSmHz0UFe7CxcNb1pDNW9w5c9c8
	V+J+/Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nn7frx12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 22:56:53 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517Muq7q000546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 22:56:52 GMT
Received: from [10.110.94.65] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 14:56:51 -0800
Message-ID: <7cfdab48-a044-46f7-8700-46e3595d8690@quicinc.com>
Date: Fri, 7 Feb 2025 14:56:50 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] arm64: errata: Add QCOM_KRYO_4XX_GOLD to the
 spectre_bhb_k24_list
To: Douglas Anderson <dianders@chromium.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>
CC: Roxana Bradescu <roxabee@google.com>,
        Julius Werner
	<jwerner@chromium.org>,
        <bjorn.andersson@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Scott Bauer <sbauer@quicinc.com>, <stable@vger.kernel.org>,
        James Morse <james.morse@arm.com>, <linux-kernel@vger.kernel.org>
References: <20250107200715.422172-1-dianders@chromium.org>
 <20250107120555.v4.1.Ie4ef54abe02e7eb0eee50f830575719bf23bda48@changeid>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20250107120555.v4.1.Ie4ef54abe02e7eb0eee50f830575719bf23bda48@changeid>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zFzCzlrlKLzDYaPtM8TJwd8ZbdgsZ1iU
X-Proofpoint-ORIG-GUID: zFzCzlrlKLzDYaPtM8TJwd8ZbdgsZ1iU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_10,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=907 adultscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502070172

On 1/7/2025 12:05 PM, Douglas Anderson wrote:
> Qualcomm Kryo 400-series Gold cores have a derivative of an ARM Cortex
> A76 in them. Since A76 needs Spectre mitigation via looping then the
> Kyro 400-series Gold cores also need Spectre mitigation via looping.
> 
> Qualcomm has confirmed that the proper "k" value for Kryo 400-series
> Gold cores is 24.
> 
> Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
> Cc: stable@vger.kernel.org
> Cc: Scott Bauer <sbauer@quicinc.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v4:
> - Re-added QCOM_KRYO_4XX_GOLD k24 patch after Qualcomm confirmed.
> 
> Changes in v3:
> - Removed QCOM_KRYO_4XX_GOLD k24 patch.
> 
> Changes in v2:
> - Slight change to wording and notes of KRYO_4XX_GOLD patch
> 
>  arch/arm64/kernel/proton-pack.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index da53722f95d4..e149efadff20 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -866,6 +866,7 @@ u8 spectre_bhb_loop_affected(int scope)
>  			MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
>  			MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
>  			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
> +			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
>  			{},
>  		};
>  		static const struct midr_range spectre_bhb_k11_list[] = {

LGTM. Sorry for the delay. 

Acked-by: Trilok Soni <quic_tsoni@quicinc.com>

-- 
---Trilok Soni

