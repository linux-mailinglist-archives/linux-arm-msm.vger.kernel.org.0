Return-Path: <linux-arm-msm+bounces-42512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9039F48BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 11:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3EBC16A2A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 10:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149131E3DC3;
	Tue, 17 Dec 2024 10:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dLiR97cQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E841E2607;
	Tue, 17 Dec 2024 10:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734430770; cv=none; b=u7T2Pc3aqE/HhR1jfolTOxn9S8CYby1U9uRBwiakwv0i46S0qEYFBbmcYK0vA2dnAlE6DQgxMamF3xiy9JHWMCZ0hxBwDLGVSe01ABRzdoBK528fcByjJUrwZaapSQf+WA1So1dktGEZPBXRd2h4X5qloch41fxryRUp25/EnC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734430770; c=relaxed/simple;
	bh=UEptcp5tU8de3p6vaM3drmHNttcrpLSfkG2TaLiBuYM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UV8eXmlX/eMi38h6uSqWus/AaUHEIvT1kbACyrsZxnl6ISJZMUgzxAf0RDSedQJ7NBkEnzLR1H1kiteXRjnNtvBgVjtm6oK8w5vz0y2ZqJfgqTdTRSJuEx3hY02svlnCEQeV1zVPohV4zgz/TC1DC64ppdrkCluSyntOJUGQhs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dLiR97cQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH95efE023901;
	Tue, 17 Dec 2024 10:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vjsiep5ZRr98Ed5cctG12xE+
	Kw6m+dJm4BgkndjpywM=; b=dLiR97cQc/lzQ11H1TZrowBPM+OSwXr+4RTsdAl/
	NcdqgjGSzk24r3I4NPa5YjuaKUs+bYPuZkrKJ7mogfAX9gvSs0xbMJsnas9XrfdP
	bPd0Pt1MdoQ7ae16tD1Fs4lcxXVLk6IcAPspa2sVFCCxnEPKs6mLx5N4CzlgzvnG
	zfoIHlhptqeGkSzZDZ/2JDX/7pvtRzQ16626pRj1vPmCXn6i5M9zWgS5fTRKIDaa
	2EYY/Tr3EyTtZsQrmdv6pxHpxjvk8imr2l5fMUvpFFSKcrbCi+CGpUJRcLMosViX
	Mb7IZL/LQUe+KkXNXu32/FqE/swWQx+IJY479P44dzFJWQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k6c8g7ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 10:19:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHAJNO9026529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 10:19:23 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 02:19:18 -0800
Date: Tue, 17 Dec 2024 18:19:15 +0800
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: <ulf.hansson@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <bhupesh.sharma@linaro.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_yuanjiey@quicinc.com>
Subject: Re: [PATCH 0/2] Enable SDHC1 and SDHC2 on QCS615
Message-ID: <Z2FQI+8A8U7dhqhQ@cse-cd02-lnx.ap.qualcomm.com>
References: <20241217100237.2932895-1-quic_yuanjiey@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241217100237.2932895-1-quic_yuanjiey@quicinc.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wo2X3sbkGQtjiTARDXhB1jOAPgWDpJxk
X-Proofpoint-ORIG-GUID: wo2X3sbkGQtjiTARDXhB1jOAPgWDpJxk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412170085

On Tue, Dec 17, 2024 at 06:02:35PM +0800, Yuanjie Yang wrote:
> Add SDHC1 and SDHC2 support to the QCS615 Ride platform. The
> SDHC1 and SDHC2 of QCS615 are derived from SM6115. Include
> the configuration of SDHC1-related and SDHC2-related opp,
> power, and interconnect settings in the device tree.
> 
> Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> 
> ---
> This patch series depends on below patch series:
> - gcc: https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/
> 
> Changes in v5:
> - Modify SDHC1 and SDHC2 interconnects, for the cpu path, use
> QCOM_ICC_TAG_ACTIVE_ONLY to replace QCOM_ICC_TAG_ALWAYS
> - For SDHC1 and SDHC2, Add a newline before status
> - Rebase Change on tag: next-20241217
> - Modify dependency changes
> - Link to v4: https://lore.kernel.org/all/20241206023711.2541716-1-quic_yuanjiey@quicinc.com/
> 
> Changes in v4:
> - Move properties which are not properties of the SoC to board DTS
> - Add ice region to SDHC1 Node reg
> - Add 50Mhz 200Mhz to SDHC1 opp table, add 50Mhz to SDHC2 opp table 
> - fix SDHC2 Node compatible space
> - Link to v3: https://lore.kernel.org/all/20241122065101.1918470-1-quic_yuanjiey@quicinc.com/
> 
> Changes in v3:
> - Improve the commit messages and cover letter
> - Link to v2: https://lore.kernel.org/all/20241106072343.2070933-1-quic_yuanjiey@quicinc.com/
> 
> Changes in v2:
> - Improve the commit messages and cover letter
> - Remove applied patches 1
> - Pad sdhc_1 node and sdhc_2 node register addresses to 8 hex digits
> - Adjust sdhc_1 node and sdhc_2 node register addresses to hexadecimal
> - Modify sdhc_2 vqmmc-supply incorrect power configuration
> - Link to v1: https://lore.kernel.org/all/20241023092708.604195-1-quic_yuanjiey@quicinc.com/
> 
> ---
> Yuanjie Yang (2):
>   arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
>   arm64: dts: qcom: qcs615-ride: enable SDHC1 and SDHC2
> 
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts |  37 ++++
>  arch/arm64/boot/dts/qcom/qcs615.dtsi     | 211 +++++++++++++++++++++++
>  2 files changed, 248 insertions(+)
> 
> -- 
> 2.34.1

Sent by mistake, please ignore this patch. I have sent a correct patch.
https://lore.kernel.org/all/20241217101017.2933587-1-quic_yuanjiey@quicinc.com/

Thanks,
yuanjie


