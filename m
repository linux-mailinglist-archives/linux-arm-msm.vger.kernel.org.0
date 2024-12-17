Return-Path: <linux-arm-msm+bounces-42481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9320B9F4572
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 08:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACC257A38DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 07:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9EE126C08;
	Tue, 17 Dec 2024 07:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KeCt8YlF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFE8A29;
	Tue, 17 Dec 2024 07:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734421649; cv=none; b=CeqUCGZ0l8kUQMjx+1ELkM0GR7M0CuY18FHjQaovTpOSpwfiE07tkZ0rGy9QlWKulJ4wBYDZjcRzLYdji0U3SuzdKjmdQYoKbaapYdVgyt2LaI8Cpdw3yeTLsVC10UkZ7GKk6ncBNh7cCNyP7YUAtSNuMbJ84HjVQL8N0BCboyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734421649; c=relaxed/simple;
	bh=RvUYAbXWRlYm4usEWLpMcWLM34/6FiETEbx7j1IFVjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uk8cuDcSzLIJmVs8gstS4Y+ItgjxGK3nCobXtyVM8x09znB+O9kJbhCBgFvr6RfqCdzBglzrpcVGpk4XTLuwfk81ELvUWza3kGS3XTZNx2MKA9Ugx/7R6WXEZ9SQooQi2sjlnr6aXUBxL2cK7/1sUv0pwb1Aqb/pcsCXRBvKfMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KeCt8YlF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH61s9n005066;
	Tue, 17 Dec 2024 07:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YTo/P7f/upBFio9J5H+90ORp8e2JdLD5o/PbOI6evEI=; b=KeCt8YlFhB2x1rGb
	27DZOyy2UAFu1DvLwhs4rWGKCrr1BPmofn9DSZIu527upggXVFmpfjJH+sX5TwOv
	XM6J4MKYa//ayP8dOzPGLce85L8jl5sxh2R9u7WeyK5Th13rFON3xFYyptdsljfr
	RyxNtm4e33tf7GwfdIUM8lg16q6PXFScfmCmKLEYH4M3hOTINA2ABL93S3D6Ni2m
	cijymIv5Z3YIyO8EtWeBevaySc0Q9LErcAA95fMPcJy4NZ27z2q1KlosEifvrk/D
	nqRuWGhbZkKisiarhSaoKnC5L1MBmi1F7yFi6rURpDN9c2xLPdS8d9fs1f44Dv/1
	ZEQUlg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k3p488ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 07:47:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH7lAO7003168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 07:47:10 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 23:47:08 -0800
Message-ID: <65de323b-ee7f-41cf-a300-1cf883494d1d@quicinc.com>
Date: Tue, 17 Dec 2024 15:47:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add support to configure TPDM MCMB subunit
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20241105123940.39602-1-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <20241105123940.39602-1-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Xojj7zGYs_Wm-DhaeECuX7FKFb8Asblb
X-Proofpoint-GUID: Xojj7zGYs_Wm-DhaeECuX7FKFb8Asblb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=920 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170063



On 2024/11/5 20:39, Mao Jinlong wrote:
> Introduction of TPDM MCMB(Multi-lane Continuous Multi Bit) subunit
> MCMB (Multi-lane CMB) is a special form of CMB dataset type. MCMB
> subunit has the same number and usage of registers as CMB subunit.
> Just like the CMB subunit, the MCMB subunit must be configured prior
> to enablement. This series adds support for TPDM to configure the
> MCMB subunit.
> 
> Once this series patches are applied properly, the new tpdm nodes for
> should be observed at the tpdm path /sys/bus/coresight/devices/tpdm*
> which supports MCMB subunit. All sysfs files of CMB subunit TPDM are
> included in MCMB subunit TPDM. On this basis, MCMB subunit TPDM will
> have new sysfs files to select and enable the lane.
> 
> Changes in V2:
> 1. Use tdpm_data->cmb instead of (tpdm_has_cmb_dataset(tpdm_data) ||
> tpdm_has_mcmb_dataset(tpdm_data)) for cmb dataset support.
> 2. Embed mcmb_dataset struct into cmb struct.
> 3. Update the date and version in sysfs-bus-coresight-devices-tpdm
> 
> Mao Jinlong (1):
>    coresight-tpdm: Add MCMB dataset support
> 
> Tao Zhang (2):
>    coresight-tpdm: Add support to select lane
>    coresight-tpdm: Add support to enable the lane for MCMB TPDM
> 
>   .../testing/sysfs-bus-coresight-devices-tpdm  |  15 +++
>   drivers/hwtracing/coresight/coresight-tpda.c  |   7 +-
>   drivers/hwtracing/coresight/coresight-tpdm.c  | 124 +++++++++++++++++-
>   drivers/hwtracing/coresight/coresight-tpdm.h  |  33 +++--
>   4 files changed, 158 insertions(+), 21 deletions(-)

Gentle reminder for the review.
> 


