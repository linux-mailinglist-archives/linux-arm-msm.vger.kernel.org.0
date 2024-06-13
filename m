Return-Path: <linux-arm-msm+bounces-22656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D107907F44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 01:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ED1B1C2152D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 23:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4B414D29A;
	Thu, 13 Jun 2024 23:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NVmdRWcI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56050142652
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 23:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718320413; cv=none; b=XhgU2ySaiFkcloaK6MdHNBkrgMN8R7rm4oMACWrpOy6O/ijJeiEAOzscGCfGXmasMJXYixqGGFe4j2/bw35VFESIYh9KU8TIgIlY1aJSFlCpxfjKyQYEcssORN7+MToQat+U99DkBl8BINk6/ClobesQH9sn7PdnsdA/UzUXvLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718320413; c=relaxed/simple;
	bh=Mi1rQ5CfHf/3JzlaDI3HJmhpdh+5pTfEVVAiFFFYqC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EksZvj14Tfa6LD7o+zrTvumW7zzWlDn7Z2DJsZ4C/fT7iStFjUwNBw30dQs/fUTBdMHSzXjOcIN49rQIz/IAO/O0vTvnksjlDv656NgC6IJujda3GX4/YHUunRYd57cN3paj1LZNdH03Whwgnz8rpuxT95Fv+iROHfnXeTYhL2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NVmdRWcI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45DJGMm6024227;
	Thu, 13 Jun 2024 23:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5zeY6v+l92d5kTwjsKH7gVmTuBY4OLuy/EY97FpXTI=; b=NVmdRWcIpMYFhYKA
	nTZp2/Z4d4G0LS94tdtO26uaDk0Ms5dLIgoSa/1Xczxo/DDB0GoJU3C2Ec2QUvso
	FR1SpwlO7FjUgj5sqT3XOVhU9iYl3VGQvWMxfRwu27rfKqw+0J93N0B53i1+n7rT
	CsAMMfopVuq+fujySFbFgerClgYry9JbfuHkdRUFADzXy3evWGtMlwoKP8wluBsc
	i8nENZ1HVLDB5XQW85kGbCufat40Y63iySvGK3M0Wn+gaRwrHCPU26IK0Nzf7FJp
	133prW4nm0T2PKceKmcU+6p6+I0I1ZpoNkb1QJa0jL/sXUceJfc05uC4577pqQrr
	DYRoZg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yr6q4rggw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 23:13:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45DNDJgU031183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 23:13:19 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 16:13:18 -0700
Message-ID: <52fef0ed-d9c6-682c-2d30-18cdd78f7a40@quicinc.com>
Date: Thu, 13 Jun 2024 16:13:18 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/9] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
 <20240614-dpu-mode-config-width-v3-1-29ec4069c99b@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240614-dpu-mode-config-width-v3-1-29ec4069c99b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EcluWeOU1Imb928PQ-7qbu6V6xPeYKGa
X-Proofpoint-GUID: EcluWeOU1Imb928PQ-7qbu6V6xPeYKGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_13,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=975 lowpriorityscore=0 phishscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130165



On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
> Make _dpu_crtc_setup_lm_bounds() check that CRTC width is not
> overflowing LM requirements. Rename the function accordingly.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

