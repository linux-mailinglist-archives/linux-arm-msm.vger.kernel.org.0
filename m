Return-Path: <linux-arm-msm+bounces-25395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59852928D89
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 20:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 062562811AA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 18:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E30113A879;
	Fri,  5 Jul 2024 18:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CnsJFfhY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE268225AE;
	Fri,  5 Jul 2024 18:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720204242; cv=none; b=Oe+ww9e7oGp7PSqUcrjKPZYfnh2T0tf0HVQWBuPkiHpLmNonKFyDCQ2mLDrlrLP9+t8BXuc33uLscQCFkv7N0lmspQLKhXKnW0vRWJrUtSGWP0wm87KSNI89Y802393uKSHSIycOrQefQF2+yAgukMyo93XIG8OBJovspy1l07Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720204242; c=relaxed/simple;
	bh=TAwceALXuD7x1GkKj9vKLJfp4GnQLkF/WuMmrQY9WyI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKKY6U+zMSjnSF2cSp88Xl5xgyCi7OpCU+Ag3tuzI0VnZAP9htEn6lbFYbY5jqqr2cHy9xdK84CSFQKWGeO0jVXvkCFWGxWdhA8v8Z4iC5XW4hHq7E6YvkdqNtNCmvUHkXYPpbynIu/mUfDT3frLCFfEY8sDJ62m8cacMIZp/rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CnsJFfhY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4659bQQs018290;
	Fri, 5 Jul 2024 18:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HUi/pTY/uAf3d3IqhkIiGEVl
	5QfvpQSUQ8D/mfOlKlA=; b=CnsJFfhYU5Y3GL9TAnbnkkozib5UFuY0yQk4AJ4R
	zHtbO0W3DnGw3hoJECpP2HP2Z8IeGGrnQtlSbxcunlYhulZMeKdJVbOEvTH97QKe
	Q7//ifzF3aq5SMdXZthy/jiCEmvVOvJxAmEVZhB9H4w9QTkyq8kavylPS9n8ajEG
	8+dLBz/RwOwop7uFGKkJtf/WoaRQ/fTCcruIbDZU2JiKk0Ys5CJgRzvMQzY0zIJK
	Wm2eiUsPAEsF0B0uF63keJf6ccu8RhvRjCOP1B3CfsRNPMNRf4u4lJg0CeUFyXOQ
	jG8TG4D5txSr0qSvrNrXT4wIjfwMVZMgdbPeF/lZcmN+QA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404kcts67m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 18:30:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 465IUaST024703
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jul 2024 18:30:36 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 5 Jul 2024 11:30:36 -0700
Date: Fri, 5 Jul 2024 11:30:35 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
CC: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sa8775p: Add TCSR halt register
 space
Message-ID: <20240705112957248-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240705153252.1571814-1-quic_mojha@quicinc.com>
 <20240705153252.1571814-2-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240705153252.1571814-2-quic_mojha@quicinc.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jdI4osVg0EHkxi3nPBxiU4bEiXnPgHKw
X-Proofpoint-ORIG-GUID: jdI4osVg0EHkxi3nPBxiU4bEiXnPgHKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_14,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxlogscore=614 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407050135

On Fri, Jul 05, 2024 at 09:02:52PM +0530, Mukesh Ojha wrote:
> Enable download mode for sa8775p which can help collect
> ramdump for this SoC.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>

Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>

> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 23f1b2e5e624..a46d00b1ddda 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -221,6 +221,7 @@ eud_in: endpoint {
>  	firmware {
>  		scm {
>  			compatible = "qcom,scm-sa8775p", "qcom,scm";
> +			qcom,dload-mode = <&tcsr 0x13000>;
>  			memory-region = <&tz_ffi_mem>;
>  		};
>  	};
> @@ -2824,6 +2825,11 @@ tcsr_mutex: hwlock@1f40000 {
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
> 

