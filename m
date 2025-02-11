Return-Path: <linux-arm-msm+bounces-47526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A020A30639
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED915165B3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 08:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D338D1F0E5B;
	Tue, 11 Feb 2025 08:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lBs7zg8D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD981F0E23;
	Tue, 11 Feb 2025 08:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263644; cv=none; b=fB6jBM+t7IciZHtSzLtZUl9Y3m5O/CmUoFPtxcw9TPeRC87+SiZEqrA0g3zVa0OjYBziXB4vBF+F4dQbL4rvsXB4KZVtSJm1b6KxrfL+yFBTpH3Zjx77zwpAgcPtdZDhuLgreWsyJLOTKb72urQseUfF2TfFxNiBTlXdlxptqZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263644; c=relaxed/simple;
	bh=fxSkNnWswjURBe3YN/VNeFO1XaorU4Mow1Ay0hX/jmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LA4dfpwbFMHmAObviTXL5AqZxT9yNv6xgLZ116tbqqjYmserkYrfavsk43tOyzthjeTPU6hHzQF6Oo8UKJqsc0n3I95e1pXuZ/njfkbUVww14otxQ3RGSSdjCa9TvORSz6Twh62mBHYFBWWW+Q1+UMIws3Kd4GFUOnti/CW0rwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lBs7zg8D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B71FD4006138;
	Tue, 11 Feb 2025 08:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YOhQtrBV6RaVA3wua/DaoyI2LGXzbI8BGpKTO0Q/A28=; b=lBs7zg8DRgNu/gTP
	o/zEBx/fW5vEyf9riHXglfO3MNowD3YCQilSwMlyld0FSCPaWofkniNdLo5Ijnef
	AU76tEaYcXJkaQ8sP/J+XE6jHf+T1X9qLMWjRVAk40SMY84UyxVpQtoNrFu8OIjU
	9n2Nw8UQDDNpoJKrfTQVBBWS2p2RX6dvEVAEwj0jV70O5G+Y+fV9wRfrifdswE80
	KxsWSVOzwqjqcg+LUkE6TItFCaYV+tfQfj0jLCRiGmvc/YO0Kk5RFhcq4Tm2QyI9
	m5N74a3Ya5up6vgeyvSp1txoEPw3Gfcm7ol4fUiFGq52Q/rnCYY5f41WaMYChqRv
	yOMkBg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5mucyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 08:47:19 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B8lITN032221
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 08:47:18 GMT
Received: from [10.218.5.175] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Feb
 2025 00:45:00 -0800
Message-ID: <cf78b342-6655-4cde-b877-8f498ed0e6bf@quicinc.com>
Date: Tue, 11 Feb 2025 14:14:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p: Remove cdsp
 compute-cb@10
To: Ling Xu <quic_lxu5@quicinc.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <quic_ekangupt@quicinc.com>,
        <quic_kartsana@quicinc.com>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@kernel.org>
References: <cover.1739260973.git.quic_lxu5@quicinc.com>
 <4c9de858fda7848b77ea8c528c9b9d53600ad21a.1739260973.git.quic_lxu5@quicinc.com>
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <4c9de858fda7848b77ea8c528c9b9d53600ad21a.1739260973.git.quic_lxu5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -ao38ud2dWcFS6EEWd7ubzlJJnAgiqIT
X-Proofpoint-ORIG-GUID: -ao38ud2dWcFS6EEWd7ubzlJJnAgiqIT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=946 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110053


On 2/11/2025 1:44 PM, Ling Xu wrote:
> From: Karthik Sanagavarapu <quic_kartsana@quicinc.com>
>
> Remove the context bank compute-cb@10 because these SMMU ids are S2-only
> which is not used for S1 transaction.
>
> Fixes: f7b01bfb4b47 ("arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes")
> Cc: stable@kernel.org
> Signed-off-by: Karthik Sanagavarapu <quic_kartsana@quicinc.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 8 --------
>   1 file changed, 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 0aa27db21f3d..81b2fba94841 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -4585,14 +4585,6 @@ compute-cb@9 {
>   						dma-coherent;
>   					};
>   
> -					compute-cb@10 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <10>;
> -						iommus = <&apps_smmu 0x214a 0x04a0>,
> -							 <&apps_smmu 0x218a 0x0400>;
Commit description seems misleading as these are nested sids and not 
S2-only. You may say you don't need it for your
usecase which is a different thing altogether.
> -						dma-coherent;
> -					};
> -
>   					compute-cb@11 {
>   						compatible = "qcom,fastrpc-compute-cb";
>   						reg = <11>;

-- 
Thanks and Regards
Pratyush Brahma


