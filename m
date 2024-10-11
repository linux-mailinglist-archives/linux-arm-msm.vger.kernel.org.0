Return-Path: <linux-arm-msm+bounces-34174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ED499AE4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 23:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5E4A1F2242F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 21:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A6D1D12EC;
	Fri, 11 Oct 2024 21:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BooXBpw9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590D819D8B7;
	Fri, 11 Oct 2024 21:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728683500; cv=none; b=mqWUlkC4O2wPdm6qcVbgWNWi6ETTaqVguFMgbsgxCPbqqe47C17VNSv/rvwKMSdHhRAbgQd+yHmWeeHKC9cQIsSXQkUTPWeATHNw9xZDTOPGf3fb+WKIouiB8UnnFI9xWaqOwSs1nnTYg07GrX5Q+77CdhJXB5Ih0RUAtyllqZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728683500; c=relaxed/simple;
	bh=rv/UUK412IaJH/Oyc9qXtpLYwwXVGqY4xqLugFXMh9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=svFvfW2NEAtMpjg/iw8ze+xGE1rx/rFyWc0mefdDsQp9lMjaZnb2EQP67KQpgwiLxDlBpydjv/QUp/veybbi9jZmy5xGzC/734drDdfjYPCwdpxZNL2r4C0x4R6fT0KOHK892ioNIfH1nO2irv23rTedw4gLosglPEGKJKN1fGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BooXBpw9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BCBOkn032574;
	Fri, 11 Oct 2024 21:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	He2Sp5cSY8GhAI2+UY1CLa3m2O450by2VVgxnyWsAm0=; b=BooXBpw985oc68eA
	8kKN7l8C5eJDy1Y0T7SWfQxLfmNoCzGcYj01GPSJwyefm97+uSYvDN2Oz+Fv33S5
	zJS0Znl4uRXQTGPLtGTW6B5Lx7WEVhcVfrML4wexlJU0GtOgog+FxMQCt4AVba0w
	SNEUIbEuGxgYYadYzdPgllzPo0kDxzMv6sBHLi3eHxee71ISAlxhifR6EV7Ol0N+
	kCq2shCqcpHvCTiyPlaPVfw04irMH0jRrPLpzEGgBojN0X+GFoVHt3Q/3COe5Ckb
	dT4h+fhVersA+U3491t9bl02FfEXhWRoj7BrUS6vw9ot2mmpp9AZf1d+2ByteNhm
	H9Udmw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424cy7qnvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 21:51:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BLpXZK014266
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 21:51:33 GMT
Received: from [10.110.80.117] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Oct
 2024 14:51:32 -0700
Message-ID: <4f11a3f8-dd77-45e8-964a-4c0935fcac8a@quicinc.com>
Date: Fri, 11 Oct 2024 14:51:31 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
        Gokul Sriram Palanisamy
	<quic_gokulsri@quicinc.com>,
        <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_viswanat@quicinc.com>, <quic_mmanikan@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240829134021.1452711-1-quic_gokulsri@quicinc.com>
 <20240829134021.1452711-3-quic_gokulsri@quicinc.com>
 <b62a851c-ffb8-475a-9de1-1211a5a6b590@quicinc.com>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <b62a851c-ffb8-475a-9de1-1211a5a6b590@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: koMLBK4qJ5X5tkuka2lp2PsOfibHhWy5
X-Proofpoint-GUID: koMLBK4qJ5X5tkuka2lp2PsOfibHhWy5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 malwarescore=0
 mlxlogscore=544 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110154

On 10/11/2024 12:28 PM, Jeff Johnson wrote:
> So I suspect this last line should be replaced with two:
>> + * Copyright (c) 2012-2018 The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.

I agree. 

-- 
---Trilok Soni


