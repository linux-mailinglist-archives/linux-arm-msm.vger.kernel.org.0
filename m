Return-Path: <linux-arm-msm+bounces-33567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 158EC99507F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 15:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97B1BB21008
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 13:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915691DF25E;
	Tue,  8 Oct 2024 13:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UvrVk32W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07E54C97;
	Tue,  8 Oct 2024 13:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728395037; cv=none; b=skzrPJ6MAdnIf9+6U/S+B2aDzTABKqy8o4stDxWARgkT6IizWnZkkMLDc4vftubUZl+4U4OHY0F/rej2zChWUHDD8JP5gqN0pEgJJokizHJTXJKRXNAdrkB3OJ49rfRmYnNL3CMe8au9jDIcWVwjiGWUd4SSExrVc1H8K2VNSbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728395037; c=relaxed/simple;
	bh=lF8FCfbUqwT5Itb4V5y4/qHlU++ULO84oQuk/fNBW4c=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6h1zIobHaI+o/XKEAh73R4veLTfab28fzFxLfg6nCAjEKatHVzeKnVOMWI5wgU3jCLl4/dz634ZXRhuTzaC38vulpc13iyQiNSRaM4JP+/XMlyflG4d22YY7D5nbScwbrdN7BlZrm/vFhVedkhXIteLmumGcP+c5FAGFmKjJA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UvrVk32W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49851Xeo010513;
	Tue, 8 Oct 2024 13:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zNA6pHSiL60GzuGqEascAwTo
	z6v+Rv0X68mwWwwC4zc=; b=UvrVk32WuxgmUVeLZyxE9ImkQ+ay3GWWH9IV+lUt
	I322PjhAcbLEOYAdNgYwMCsoZKVQUOUIHnZJbbm8Xgnww1ttesMOD7r/uSH4GjjR
	AMnjlWvEpV+xvU4e70DASa7TyLCFB5ogP8TUAE+mcMk9q1TRyEaDg2m/bo6kU6m/
	kW0LH7+BfDj85s7w2LYRzas8SAizIzkBiqwkZfbwy2unMH8iZV1sH+LED2X4gDRi
	/2GIKjF8+Ss94zuLQUIQcLxdjFN4ap03shgd2aauKSeMCgrp9wJgnWhGTMEoSctY
	tpN+j5z9rkN4n8OwgGid5o42vEuVeUxeM/OhM7BxfzIITA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424x7rsck4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:43:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 498DhqFw032440
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 13:43:52 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Oct 2024 06:43:49 -0700
Date: Tue, 8 Oct 2024 19:13:45 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <konradybcio@kernel.org>, <andersson@kernel.org>, <lee@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Elliot Berman <quic_eberman@quicinc.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Add TCSR halt register
 space
Message-ID: <ZwU3EeU7iCkQxINw@hu-mojha-hyd.qualcomm.com>
References: <20240830133908.2246139-1-quic_mojha@quicinc.com>
 <20240830133908.2246139-2-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240830133908.2246139-2-quic_mojha@quicinc.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: L_ypjJtDiE_L7tENbCZ2xlVWGrgp3bOf
X-Proofpoint-ORIG-GUID: L_ypjJtDiE_L7tENbCZ2xlVWGrgp3bOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=749 spamscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080087

On Fri, Aug 30, 2024 at 07:09:08PM +0530, Mukesh Ojha wrote:
> Enable download mode for sa8775p which can help collect
> ramdump for this SoC.
> 
> Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---

Looks like, this got missed to be picked while its binding is merged.

-Mukesh

> Changes in v2:
>  - Added R-by tag and rebased it.
> 
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index e8dbc8d820a6..fa057073ee2d 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -281,6 +281,7 @@ eud_in: endpoint {
>  	firmware {
>  		scm {
>  			compatible = "qcom,scm-sa8775p", "qcom,scm";
> +			qcom,dload-mode = <&tcsr 0x13000>;
>  			memory-region = <&tz_ffi_mem>;
>  		};
>  	};
> @@ -3072,6 +3073,11 @@ tcsr_mutex: hwlock@1f40000 {
>  			#hwlock-cells = <1>;
>  		};
>  
> +		tcsr: syscon@1fc0000 {
> +			compatible = "qcom,sa8775p-tcsr", "syscon";
> +			reg = <0x0 0x1fc0000 0x0 0x30000>;
> +		};
> +
>  		gpucc: clock-controller@3d90000 {
>  			compatible = "qcom,sa8775p-gpucc";
>  			reg = <0x0 0x03d90000 0x0 0xa000>;
> -- 
> 2.34.1
> 

