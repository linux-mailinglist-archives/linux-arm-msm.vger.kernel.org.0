Return-Path: <linux-arm-msm+bounces-31830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D0797A41C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 16:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC7011C22EAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 14:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7274A156F3B;
	Mon, 16 Sep 2024 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m93KnN4r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDC015699D;
	Mon, 16 Sep 2024 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726496926; cv=none; b=VfKcy2Jut4N1CfSQWP6YQQM6gJCVIARKFnlQItknCVNovjeTaG/XtVozFgdPEeAQmM1R2Ovpfp0Su9OU79pxNe8AmmKeQIwQRvXfDFV3jIMDQ8Xc15R895Sf+0pVKg5iTfUPYHr3124a7ou3z2unBxUwNdNL34qZs1200kTw3a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726496926; c=relaxed/simple;
	bh=PcNilg+fnu88HeDhHg2m/R5SL/aTlRAXqoGfaeIls+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fgChdFgdv9zOxhwHS7+8QdSksXdddhz0BtLHLo85w0tqFLTwoJys1vwFQS3pq8+JBNRCxSsMuAxmm8bNAG2T03YjZE5TiJMM3ZOUxEpqe6tiPytta3ZgeqwVZHJQdjqvSb01pxyCTdSpF1SUUyEq2b1GcITTaRLFu75n1Tlyg5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m93KnN4r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GE33ig030850;
	Mon, 16 Sep 2024 14:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	otb2KN9QQ5PSH9usOoKH0Pku75aDOofhJqaO5p/tP9c=; b=m93KnN4rsnM5Tz4h
	u9LDYePh6uj6R3GS1dcimAOP+pKuuq8TR815zv+8oK/rT5q7AOsdmbo9QxnU6/fA
	vyjBs1XbUHOmvgV+4HlijIrlyFWVVIeYVdAVlAxcPBQD2z9ZbjNElVm2/ZN26+Fi
	Q7o0SXemr6E+/D9AbQYEXuPL9umvuZc8kOlQbE93I/DenJD1hNO7xtjaHNylWpIj
	m19y1vtHivjfp48umf/1UJrfZsmoHlovUzHPAwvXXBPbsgmkmgDoZZAiTSRAOT5y
	Gbyk8VHEj/ER3YZisfRLXzq8Wpqo3Z4Rh3nxXIGeMmdl9zpOTUX/waLeIvTsgT+D
	z0KTVw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hh45ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 14:28:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48GEScsK026135
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 14:28:38 GMT
Received: from [10.110.0.24] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Sep
 2024 07:28:35 -0700
Message-ID: <5849a5d4-5e32-49f9-aee5-8130027d063f@quicinc.com>
Date: Mon, 16 Sep 2024 07:28:34 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add support for Qualcomm SA8255p SoC
Content-Language: en-US
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>
References: <20240910171534.2412263-1-quic_nkela@quicinc.com>
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <20240910171534.2412263-1-quic_nkela@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0MdRULhfH1lQFtmPbU6P8msNE-SVJYiJ
X-Proofpoint-ORIG-GUID: 0MdRULhfH1lQFtmPbU6P8msNE-SVJYiJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=616 mlxscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409160092

Gentle ping...

On 9/10/2024 10:15 AM, Nikunj Kela wrote:
> This series adds support for Qualcomm SA8255p SoC.
>
> These patches were originally sent with other patches in series[1],
> which was advised to be split per subsystem basis.
>
> [1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
>
> ---
> Changes in v4:
> 	- Included AOSS QMP dt-binding patch
> Changes in v3:
>         - Removed the patches from original series
> Changes in v2:
>         - Added Reviewed-by tag
>
> Nikunj Kela (3):
>   dt-bindings: arm: qcom: add the SoC ID for SA8255P
>   soc: qcom: socinfo: add support for SA8255P
>   dt-bindings: soc: qcom: aoss-qmp: document support for SA8255p
>
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>  drivers/soc/qcom/socinfo.c                                    | 1 +
>  include/dt-bindings/arm/qcom,ids.h                            | 1 +
>  3 files changed, 3 insertions(+)
>

