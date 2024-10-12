Return-Path: <linux-arm-msm+bounces-34198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AAB99B71D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 23:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F4F6B21C9F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 21:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A5F137750;
	Sat, 12 Oct 2024 21:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QvAqnk0N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAF412C549
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Oct 2024 21:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728767002; cv=none; b=HqO7AjHu2dFxqs7n7dyfFW5mnbWvCeyI1uS2NkrEn7Tr1ZxuEXipk76S+BPDMJAHdhSvM92UJcjdS0kpbRktdCEvHuEG3nsDXv0KBCpBp34j6y8F/PpnIPb05ZC9x+toCGuHD6R0u3gsduXtF5QUlDlhmCRhNWbrkVNZ4jFZgEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728767002; c=relaxed/simple;
	bh=hcMbwpo2kU68HeGSs7OPEFEVyUfMgiHsBYWJnkktqpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tch0Maw+sn3vlDj6Cfhf8u7fXVv5Vs5eIjtVBtIVKMARVaN2BURJ/hWf2KZsJ8cLuTmfd27O4M0lzDWvW22+zUwe/NBmDHNziWwN/BhDICz5sN1IVXhUZmG+9viJD5DDyF37eCD+fvqVu/oLDSn555WY3lNogOdosFSu7U0Kzu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QvAqnk0N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49CKNbNI029646;
	Sat, 12 Oct 2024 21:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5uOFDen7ZFAy8cBjHMzqnQRTq5LF/j7BzUJQTOj/Zh0=; b=QvAqnk0NfBkVsEP7
	cEp9mCJu4HZpQnUCHzxLoAm8h2ml0QVCE4KOMD17Vzw8bGi20M43QS8LyL0mY4xa
	UO8Ahu+AXOJveIV2hDIgrKuajLUzp6J4ZdfWuEw12u3Dw6lW5X9pwrbpiXt4FlxF
	NsyI4Ges3Fv1yoVAbAX8W1m7kjQhP0W5pYIG8OAtyyCMsh3runMQ8TlpR6dN2LtI
	7FNFt9hvoKyl1/0SRQW3i8qcaSDpeL6/DBoWptZFGPozGjQGkwGyaRi74WU2ajtY
	WB5tazGo1bngYmburNZuSHXnTWkbuO85l6L2hXYaPE6SJEOIHUdRPVXtFux89yJq
	Z4RTyQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427h6ts5ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 12 Oct 2024 21:03:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49CL3BAE011719
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 12 Oct 2024 21:03:11 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 12 Oct
 2024 14:03:10 -0700
Message-ID: <58cb14e5-69b6-4bed-142f-72fdc33a5283@quicinc.com>
Date: Sat, 12 Oct 2024 15:03:09 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Fix the for loop used to walk SG table
Content-Language: en-US
To: <quic_carlv@quicinc.com>
CC: <ogabbay@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <jacek.lawrynowicz@linux.intel.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
References: <20241004193252.3888544-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241004193252.3888544-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bNmkJOND_rve7aOMD9CSlH--n6nsX71j
X-Proofpoint-ORIG-GUID: bNmkJOND_rve7aOMD9CSlH--n6nsX71j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=863 malwarescore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410120155

On 10/4/2024 1:32 PM, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Only for_each_sgtable_dma_sg() should be used to walk through a SG table
> to grab correct bus address and length pair after calling DMA MAP API on
> a SG table as DMA MAP APIs updates the SG table and for_each_sgtable_sg()
> walks through the original SG table.
> 
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Pushed to drm-misc-fixes.

-Jeff

