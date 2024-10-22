Return-Path: <linux-arm-msm+bounces-35473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5A89AB5DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 20:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6207D1C21D3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 18:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D1319DF40;
	Tue, 22 Oct 2024 18:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nm8V9wJR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864C17E0E4;
	Tue, 22 Oct 2024 18:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729620937; cv=none; b=G7U4asONNrTi+8Oh2YqJ/+MEoY5iTaLaxdZeSniHq5ZDxeEiDBfNWs1754pnECoizrkM0vOGT4gbGSFdZ0K6AE+1CTUmhqFOaIzX2+qgqRHDYgiBVw9c4V/WpDsGkeghCNK5KhlzMyZIP/WdtGI0QecLliFobpjbKzfJfKUE8MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729620937; c=relaxed/simple;
	bh=1wbsMhC82AHn/OmKtlVfqJCI19GE9EO2XAraNnxxr3Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=TLaPPv2ncP6wDp+WAI/pLWJX4h5yK/GMnTIqairJTdwAD98+6nFusDDKl2DwgDIimXKcx6plRmfnsim3YlIwr25LOEUGSj0uDb8S0F16E/D6hTDJPUrgGbpCyds6kFOtDxveHaZGVFwNMa8bRmhA64q7B4QIdfSMw+lljEIJyo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nm8V9wJR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MDForX026250;
	Tue, 22 Oct 2024 18:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPjL0Bd03vYG+Oil5C4bIJBAekQWDxctWzWTvL/rTe0=; b=Nm8V9wJR1J+P4hkU
	tOrjWqfkiirjJLcQrcCca5Yvs8BklJDAXo9R4ZxixQef4kTMGwMm5qm3GQcXcXxN
	+GT0UPGrjtneAuCua/m9zZrB0aqdS+sJQOETZyvSwwJSdg0h7S5amc7hHC/paC0z
	S0fJmRASVgiOlBd0j0B+QCF6Kl77MmMi377JoTI7mL1ETAo21DUHzhLznLSHKbVv
	EW4y78x576sYZ2JGPQeNeDUD4+qtwAKy3DS1jIAFWqtUQCl/4q7CCl5Vz+1sKnJn
	UdEnSIw/v2go49QtgWDH2iTzgWiBPdwKNzVtoQzFdbqdkxoLOnC+5zqQf0tBB/i5
	IwyVXw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ecse0y5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 18:15:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MIFRxZ014717
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 18:15:27 GMT
Received: from [10.216.8.66] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 11:15:24 -0700
Message-ID: <39b71082-731b-4a49-a999-0684f30dd79b@quicinc.com>
Date: Tue, 22 Oct 2024 23:45:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] firmware: qcom: scm: Return -EOPNOTSUPP for
 unsupported SHM bridge enabling
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qingqing
 Zhou" <quic_qqzhou@quicinc.com>
References: <20241014111527.2272428-1-quic_kuldsing@quicinc.com>
 <20241014111527.2272428-2-quic_kuldsing@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241014111527.2272428-2-quic_kuldsing@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 35f-_mluyBD34_uhSEZ2S8CC8J7NvIR2
X-Proofpoint-ORIG-GUID: 35f-_mluyBD34_uhSEZ2S8CC8J7NvIR2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220117



On 10/14/2024 4:45 PM, Kuldeep Singh wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> When enabling SHM bridge, QTEE returns 0 and sets error 4 in result to
> qcom_scm for unsupported platforms. Currently, tzmem interprets this as
> an unknown error rather than recognizing it as an unsupported platform.
> 
> Error log:
> [    0.177224] qcom_scm firmware:scm: error (____ptrval____): Failed to enable the TrustZone memory allocator
> [    0.177244] qcom_scm firmware:scm: probe with driver qcom_scm failed with error 4
> 
> To address this, modify the function call qcom_scm_shm_bridge_enable()
> to remap result to indicate an unsupported error. This way, tzmem will
> correctly identify it as an unsupported platform case instead of
> reporting it as an error.
> 
> Fixes: 178e19c0df1b ("firmware: qcom: scm: add support for SHM bridge operations")
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Co-developed-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>

Hi Bjorn,

Can you please apply this fix I'll split this one and send separately.
This fixes qcom_scm probe failure and is needed for other patches to
build upon. Thank you.

-- 
Regards
Kuldeep

