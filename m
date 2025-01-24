Return-Path: <linux-arm-msm+bounces-46019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A06A1AED3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 03:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AB533AFA83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 02:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B831D5CD7;
	Fri, 24 Jan 2025 02:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i3G1f+oQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B616A40BF5;
	Fri, 24 Jan 2025 02:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737686671; cv=none; b=p+Bnv4SezuFXzituCKJrtfBQspO7HT/4XgJwVVzrXlzH7cXFdC7RhlyhgB/TwLn7bB/jdRZfPl6OfYETujKb9ZMYetrXh3RB28MG2Ue5hNgenlweatbcDQjhQOcgB7PHYdaLUeYD9bG9EPz3Sm8lmvLEtvZGSEeJl8HzipSDhDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737686671; c=relaxed/simple;
	bh=gtOKiJivTZejSqA/I3FkEuHO3V7THMg8F6c0J127uOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QCqtgtt1ebYWtHOxGvnrk4M1hFGwPcjYAicFIk+3lDrBUAIlk1JucTMYOSXUVo51+0Na+lb7Y5v24A3pBc12uqSdaNX5bm4zCRpgnDInAuh2L4/uxO4ExXypvNqmzjObf3WEsk0tdHEK7942Sd5ULudqHIIUe19ueDNt75I6fJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i3G1f+oQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O1Kqnq021747;
	Fri, 24 Jan 2025 02:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9IxpUJ7xynlV8PUBAf4VpQB+vOKa6dRl6VdjY4kOdFs=; b=i3G1f+oQgDbqC5HV
	cCwBi/TNahH+IeUMxziVHiTl9h0ULJBQ7iPN0GBJPOFRxmU12oFcJuWkhqwYG27U
	OHxMmciFJPKLgKGwgR/rxUYZtJ9agxNGZvk50y21TmTPh9ZqxeESaJieQAMfCMQw
	G/mL+rpRa2KGCIa3RzQTPaDV0upORFDv7R4nvrBAzv8kbBlC3x4P2f7oTpR9q1Mf
	liuoCa0BbXhNfC9PQNAZjf1rHubhFQf53XcIOkq9KOUjUDuPVKDSXnTv7UJIUnUP
	Ar/RqjZvEbhi2c7uOQGLlT66+k59eqbZhOq6FqHiOY7U+0qxGoK0QJT4m9Mqnph8
	478Szg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c14884th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 02:44:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O2iHb0021864
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 02:44:17 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 Jan
 2025 18:44:13 -0800
Message-ID: <1bef8d3c-7d30-4586-8624-794e6329488c@quicinc.com>
Date: Fri, 24 Jan 2025 10:44:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] ABI: sysfs-driver-ufs: Add missing UFS sysfs
 addributes
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <quic_cang@quicinc.com>,
        <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
        <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
        <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        "Keoseong
 Park" <keosung.park@samsung.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-9-quic_ziqichen@quicinc.com>
 <7f8bb83f-aa15-4a58-baf4-6241b479b412@linaro.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <7f8bb83f-aa15-4a58-baf4-6241b479b412@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: G1LAzTf2MuEy0pW_9INpLhTdfSVY-8u6
X-Proofpoint-ORIG-GUID: G1LAzTf2MuEy0pW_9INpLhTdfSVY-8u6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_01,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 mlxlogscore=773 phishscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240018



On 1/23/2025 7:36 PM, Bryan O'Donoghue wrote:
> On 22/01/2025 10:02, Ziqi Chen wrote:
>> Add UFS driver sysfs addributes clkscale_enable, clkgate_enable and
>> clkgate_delay_ms to this doucment.
> 
> I'm 99% sure you mean "attributes" not "addributes"
> 
> ---
> bod

Yes , thanks for point it out, bod.

-Ziqi

