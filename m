Return-Path: <linux-arm-msm+bounces-23454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 889459113ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 22:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 426A228481D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 20:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E105E757EE;
	Thu, 20 Jun 2024 20:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QJwHIQeJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE9679B99;
	Thu, 20 Jun 2024 20:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718917088; cv=none; b=kYI/Silr9UIon5hY7ZNO38N/8dAbKCkUxTg2pKmByjVO3hdO6N2TGdP6SH7oPgYhZSaCGNoZkEqz4fZWJlVrV0j1didLibQDHHGOX065ZCa86dRqdQHf2Be38XYx16CwKCezJB3EZGkkxMD6Mc0+MQ4vIdSzuX3wQKlQOpI/TWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718917088; c=relaxed/simple;
	bh=+TqwMif2XTyhArljm9AZMoQGdPFQ3ZcSVFgU5KYqXm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qxSNyPyo7GsushqgS8KSS53fNH7fBeF7TW19DsJeqPIGKe/9kHZU+s4ZGFY8AHBaQXkVwr5KOaJy8DbJ+nblHbr2yU4BdJCIRdwffLrUjyHet/jXhdHZR4Jxy6ojsas+FPIJoU/qGV3BiJm4tad1f0+BWfj3jIwYyyMaj7hMxtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QJwHIQeJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KHBC6t025991;
	Thu, 20 Jun 2024 20:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7uinE8mNlfyxFn5pejTGcwgKDlHhRITAVURCqIbmn88=; b=QJwHIQeJFbT3+Wjk
	6/2pfeu/+pj9MBIw+GwJjulsrNDstASGn6n1G5JRsirMzNOFh0ZvNhoNGqtirUR9
	xC3J1bl8qAJNC2mfdbm4mI8STW6DyzjW6IWGICIIO+h06/Ntfh/CHgeWzI/Yumc9
	p62KEVBLB6OFs4JBPvRA6jwOwg6vU9YAhT76ySu4AwrZN1dTMxfqYk9WMqAmLlwj
	sLfkWoBbOOPo3yIyXx4Gtt6HSB67jZ8EOOqYwb6MtXNLs5wf+zRcSEbh7smWHfTK
	ETyzZqPOXgJzUOKWiLfPOXW5cdqYFC6LtZPXW2wpk+jl0EIGAHUu6osWoV2jlZqH
	awYKuQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrkr0jy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 20:57:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45KKvmXf032579
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 20:57:48 GMT
Received: from [10.110.82.141] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Jun
 2024 13:57:41 -0700
Message-ID: <5aa23f31-a4c1-6da4-9a0f-a312ec410eee@quicinc.com>
Date: Thu, 20 Jun 2024 13:57:39 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 8/9] drm/msm/hdmi: update
 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andrzej Hajda
	<andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert
 Foss <rfoss@kernel.org>,
        Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej
 Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
 <20240607-bridge-hdmi-connector-v5-8-ab384e6021af@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240607-bridge-hdmi-connector-v5-8-ab384e6021af@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9EKDVIqvCL1um9S9-OlHj46SCl_qc9CD
X-Proofpoint-GUID: 9EKDVIqvCL1um9S9-OlHj46SCl_qc9CD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_09,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=938 mlxscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406200153



On 6/7/2024 6:23 AM, Dmitry Baryshkov wrote:
> The GENERIC0_UPDATE field is a single bit. Redefine it as boolean to
> simplify its usage in the driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/registers/display/hdmi.xml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

