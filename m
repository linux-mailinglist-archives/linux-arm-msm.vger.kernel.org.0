Return-Path: <linux-arm-msm+bounces-47207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA2EA2D128
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 23:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3655161C03
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 22:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08D91BC062;
	Fri,  7 Feb 2025 22:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lcoxVyw2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AEC1B040E;
	Fri,  7 Feb 2025 22:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738969179; cv=none; b=kzkfekgbgguUKVj2YDuP1yTfCtyDvM6HT6O+zwVFSXdMNMh2KKkkNISvYAVc6YUvSbMHWraPgydNxV6TDlgDDEfyJok+QCaQMOf7L6jwjwXaUwwQvLu+8cv9HOSoemDT1mVJASLpnzV/iJWb46eZfGekt6u4BBAxcgytmJ7t33M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738969179; c=relaxed/simple;
	bh=93b6lC0yEmmEbAchcr/tIBghqBwznr766ANAtWatFjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Wnf44m/0CBKcne7SptP2Wo1XUytoc0pEJoHsnPISjsKjaSWRGc0Nz3ij6p7564QO4ubXkVT9L3D6tKitvIvMX9JDh6GQxZ75bs4aMCZFK9xn6x0jb2w9xFPNAWiHFNuLAZLcrVSbLKXL3HVTqRQJ1bCc+GpTWrYD4HcZykrG5pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lcoxVyw2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517GuNDj003589;
	Fri, 7 Feb 2025 22:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3dWjBlFpK6iG/l0ZpfT4pfKMeRYTyR+opXdSefY3fa0=; b=lcoxVyw2MRej/dxH
	dnzD8h2zfnmLjBFNMdiSXujT4QI4m/u9oI8hmL7z6Tc+DVmen5T8bcPD5jrKNDqa
	l3OGFMb6KRaiRhdjIr2RXl/Qd2j0H/btExSuRhUQ16D1VwBp8OVbGRJRQhTgs1RO
	dgFba/dT9VB94i125jVvjhEr3jqRrF78X5rxsfFORfEMmDqO9TOqPzdJWFqG8Kfs
	BnolmlN4IYYdCiErI2frab5ivInL6CRQqc9/IoTOxObdyDpR6GUhpPYW6ZstNYKL
	oJEBJdxrYoBASWEUhAdkzC4dLXDH/dHqyO6gAXjVO10HoCraaQMCbvNvLxwGUo+1
	rFxf2Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44np4w0rue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 22:59:16 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517MxGW0008737
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 22:59:16 GMT
Received: from [10.110.94.65] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 14:59:15 -0800
Message-ID: <1d4ce981-d91d-4dfd-b92b-7046494ef1cc@quicinc.com>
Date: Fri, 7 Feb 2025 14:59:14 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: cputype: Add comments about Qualcomm Kryo
 5XX and 6XX cores
To: Douglas Anderson <dianders@chromium.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>
CC: Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Roxana Bradescu
	<roxabee@google.com>,
        <bjorn.andersson@oss.qualcomm.com>,
        Julius Werner
	<jwerner@chromium.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Anshuman Khandual
	<anshuman.khandual@arm.com>,
        Besar Wicaksono <bwicaksono@nvidia.com>,
        "D
 Scott Phillips" <scott@os.amperecomputing.com>,
        Easwar Hariharan
	<eahariha@linux.microsoft.com>,
        Oliver Upton <oliver.upton@linux.dev>, <linux-kernel@vger.kernel.org>
References: <20241219211131.2389091-1-dianders@chromium.org>
 <20241219131107.v3.2.I520dfa10ad9f598581c2591d631aa6e9e26f7603@changeid>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20241219131107.v3.2.I520dfa10ad9f598581c2591d631aa6e9e26f7603@changeid>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Mjt4Rn6SgZRmwYi9hY3EskWLAEoWKbEY
X-Proofpoint-GUID: Mjt4Rn6SgZRmwYi9hY3EskWLAEoWKbEY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_11,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=955 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502070173

On 12/19/2024 1:11 PM, Douglas Anderson wrote:
> As tested on one example of a Qualcomm Kryo 5XX CPU [1] and one
> example of a Qualcomm Kryo 6XX CPU [2], we don't need any extra MIDR
> definitions for the cores in those processors. Add comments to make it
> clear that these IDs weren't forgotten and just aren't needed.
> 
> [1] https://lore.kernel.org/r/l5rqbbxn6hktlcxooolkvi5n3arkht6zzhrvdjf6kis322nsup@5hsrak4cgteq/
> [2] https://lore.kernel.org/r/tx7vtur7yea6ruefrkpkccqptahgmxnsrudwdz5uzcfxnng25b@afrr5bmdk2xa/
> 
> 
> Suggested-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v3:
> - New
> 
>  arch/arm64/include/asm/cputype.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> index c8058f91a5bd..8782d4721f81 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -200,6 +200,16 @@
>  #define MIDR_QCOM_KRYO_3XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_SILVER)
>  #define MIDR_QCOM_KRYO_4XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_GOLD)
>  #define MIDR_QCOM_KRYO_4XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_SILVER)
> +
> +/*
> + * NOTES:
> + * - Qualcomm Kryo 5XX Prime / Gold ID themselves as MIDR_CORTEX_A77
> + * - Qualcomm Kryo 5XX Silver IDs itself as MIDR_QCOM_KRYO_4XX_SILVER
> + * - Qualcomm Kryo 6XX Prime IDs itself as MIDR_CORTEX_X1
> + * - Qualcomm Kryo 6XX Gold IDs itself as ARM_CPU_PART_CORTEX_A78
> + * - Qualcomm Kryo 6XX Silver IDs itself as MIDR_CORTEX_A55
> + */
> +
>  #define MIDR_NVIDIA_DENVER MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_DENVER)
>  #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
>  #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)

Acked-by: Trilok Soni <quic_tsoni@quicinc.com>

-- 
---Trilok Soni

