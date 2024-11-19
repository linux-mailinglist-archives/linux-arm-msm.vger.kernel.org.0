Return-Path: <linux-arm-msm+bounces-38279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4846C9D2018
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 07:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 027231F21C5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 06:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9B615359A;
	Tue, 19 Nov 2024 06:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MuC8Sprn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF41150981;
	Tue, 19 Nov 2024 06:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731996614; cv=none; b=WPGz0oV+vuZ19qa+/61c8qbXnt4KIeNtqpCtUZ1s+GpgjQ9+L+wXmHr4057y179S0soDlrVsRF2h9/qvuKNixo+B+nDUePddVb2iy9FPMtF7MHqGVQVaL0o9TgX7aECn3Gjn4l10V3E9HSvEzmHeHEcfcdYvnXzaSppzB6WqPec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731996614; c=relaxed/simple;
	bh=Q8B73amCq3EBfQhnX1ggj0T2U/dV2aXVnN31EkRgx3E=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bk3GIcE08J0fOowebGuQkHv6pAGXGHHGs+8S4mUu9gnxRVLhi9f2Pn155vduceLnyJJpLzmDaXDpBqYnq/AnxsxY+CRGdaXenbWMFaCTSPfECFb7LROjCfcPhMnBVGBrGNbXBDTAFVdKxxhvDQ9MBIqXcF66drHcKEw50HfkIzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MuC8Sprn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGooA028914;
	Tue, 19 Nov 2024 06:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z1M0G550cA/4sts8HMnkoI3J
	ppShxWkWdoplaxpd3ZQ=; b=MuC8SprnuuKP+sPF2LzyY2c/Q14uUl94qQkv61+b
	ZrSZ29zHNpWANtTZa0Vm0P3PDAHigmilIV2Puk97gGc/iW6Z3OT7a5cyzhTeRzMp
	dCwnOcuHivn3ZoxrBC8g8LHuPIRKYOlcPWq2mVW6FEA+b0annvbAnFp2mVjcNyjN
	qipnfve5Q+um7cEjcIY/l+xlF/YHO2iNhPch/xAsSB37hucSnFl9A9TpMudwLOJV
	I2A9v7XrSZRAlbGnYJL416uW9V+v5A/UOcNmIaP9WzNkW2kxm4MtWGmkJRW6maPv
	U6a6kFLwvg5p0THSxENUCJOzcE4TJ+6s2pRYioVMHKarJg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y81jxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:10:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ6A9Dv013993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:10:09 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 22:10:06 -0800
Date: Tue, 19 Nov 2024 11:40:02 +0530
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <conor@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] soc: qcom: llcc: Update configuration data for
 IPQ5424
Message-ID: <ZzwruvCxwnvTQF8q@hu-varada-blr.qualcomm.com>
References: <20241105102210.510025-1-quic_varada@quicinc.com>
 <20241105102210.510025-3-quic_varada@quicinc.com>
 <cd31a99f-569f-45ba-8f57-777f71541f82@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cd31a99f-569f-45ba-8f57-777f71541f82@oss.qualcomm.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: krBFHplTfM-8w87MAzpXwKFxH8PW0Q3r
X-Proofpoint-GUID: krBFHplTfM-8w87MAzpXwKFxH8PW0Q3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=753 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190045

On Fri, Nov 15, 2024 at 09:08:50PM +0100, Konrad Dybcio wrote:
> On 5.11.2024 11:22 AM, Varadarajan Narayanan wrote:
> > The 'broadcast' register space is present only in chipsets that
> > have multiple instances of LLCC IP. Since IPQ5424 has only one
> > instance, both the LLCC and LLCC_BROADCAST points to the same
> > register space.
> >
> > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > ---
> > v2: Use 'true/false' instead of '1/0' for boolean variables.
> >     Add 'no_broadcast_register' to qcom_llcc_config structure
> >     to identify SoC without LLCC_BROADCAST register space instead
> >     of using 'num_banks'.
> > ---
> This looks good now. Please rebase on next as there have been
> some changes to the driver in meantime.

Have posted v3, please take a look.

Thanks
Varada

