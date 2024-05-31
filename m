Return-Path: <linux-arm-msm+bounces-21187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C08FB8D56F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 02:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 771FF286FAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 00:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F2A15B3;
	Fri, 31 May 2024 00:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OelYT71v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540CC360
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 00:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717115543; cv=none; b=VvphknpAVB3Gk/yRKofaDtR52w6L8ui01/QEFnLgaVEeqCeTNa2ErkFuKpoYcht1C9YsrCo3QN5SUk7cRhDe6f7zR9Yy8vG6BdPTNaCfcDXwfVjJoHNsIQXWkXjVD21dXFpmjeTvYwaX9aKdZ7kLxjJYPqN0CVaBK9xwShekcbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717115543; c=relaxed/simple;
	bh=sfFx4Y+VbYzVRTRoT2mM5KgdMQW33Ap3TFAT0WAPmDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gCdwrgG+2oVoCp7CsGoUm7uaKAUzBcaYKaIpohQQAvMoKTKdCzXSssB4qvtBPE9V+ZsrQArzFYoV1iSWtPD+BX47ZwVv0Pr604eTDbtCKj6M7ELKGgigaRBLn+QsYcDDDYrxOzS48xVU/yGIA5WUFJ2rfMsMlyDMjUeruOEJGzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OelYT71v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44UCuCA9003486;
	Fri, 31 May 2024 00:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LYYKh5O4pJF5nTde079Kp2HZD3FHF0DFk9mmvkBMQ5E=; b=OelYT71v5/LkpHJ4
	tlr3+ZK71iLp0IE/R1OMR2uEFHI4aWRO4H/eWGywkixptPNcMt+z0yFL4Eob056/
	6a1C45SkP6dJXdOdmyIDtbvPqQrsYHH3DcKwBEwftdHOlFJ6fBgtGMVFfADfWde6
	SVOvneSPhe9g63iX29dzF93xCJZNFZR1sgzpAsfhfUngOZX/OF8wXEyAQxKS244i
	5G8jaZLonhD7XyWx131n99nwE0YutzJ+lsbAE0x+6udpfdpwB+7ttx3280+vvmRQ
	0SZUjq1Q1rNElUSsu9tP9TBFcq+YmrmzJv1Yij9UUBPK9PSl5FmqNprMVNkDKyhh
	PEkrHA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yesw5hdut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 00:32:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V0WCem024849
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 00:32:12 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 30 May
 2024 17:32:08 -0700
Message-ID: <1a087652-a15c-83d4-de72-ebe305c1aad6@quicinc.com>
Date: Thu, 30 May 2024 17:32:06 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 04/13] drm/msm/dpu: drop virt_formats from SSPP
 subblock configuration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-5-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240314000216.392549-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: U1QBdPkzR55QR_AcxehXort-EQ41niTZ
X-Proofpoint-GUID: U1QBdPkzR55QR_AcxehXort-EQ41niTZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_21,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=702 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310001



On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
> The virt_formats / virt_num_formats are not used by the current driver
> and are not going to be used in future since formats for virtual planes
> are handled in a different way, by forbidding unsupported combinations
> during atomic_check. Drop those fields now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 --------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 ----
>   2 files changed, 12 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

