Return-Path: <linux-arm-msm+bounces-17120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8238A007F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 21:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 191B0B216C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 19:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89F317B4E6;
	Wed, 10 Apr 2024 19:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aBqAW23A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3514C53372
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 19:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712776774; cv=none; b=lkIRVJ+ewfV8N8XLqUPkiCW6vR7oy16rH1mHuvwnkXzBSq92iqU0r0z848ysOA1paCVSOmEWaWw/d/kOuNuSMQosWlhNHd8Sp+WfLYVYQ929OCGjLMCiKAHllTLs0TRB1IEcllBYVbVMc7qlEt2CIlZhBtZ3Hq7Egk/4sVYEtEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712776774; c=relaxed/simple;
	bh=g5DFjmsZ/oNRXC5LKbe1MYjL1KemC3S6lzBBujkXd9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SzVUNpEf80hXf5ZYPjvmBVdoZpEzy/XJFGLj37Wy+khZol7b2HpEgckftntuPbLtVoME/icS9Gwux8FnxLnTgGWSNrp7JEirntWPhKRfbcPFrsBWyNs+wZ4bAgSJlcQ/2iCF/lwto8RkBQIR8BIZlcheqrBBPhxIpXljpklLsco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aBqAW23A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43AJD9MR012691;
	Wed, 10 Apr 2024 19:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=aOtMuCZPZXZehadNIm7JctrT0KUH0+JaiTWuWZVuzPE=; b=aB
	qAW23APQdT/hwcAhqZGCL1yX0IG9a351mUlGxxa6iicS5VCZoJyu22L3sWgoaxZO
	FYfazK6cgehWa2v/51gfWOYqUIeUfCmMuZPJ+/hbsC3M148yZzoX+k9XXTOa+5GH
	Cldd/FGOQGQMmTDGeEwaHpnvhiMM/a6qslRovszp5A2JJXveTzrcwgQQ0NsWHiYY
	5FfXYc1nvh/85NQNhOcz1FwuYIcvNJsowFvxf+lT5E48LOYIXFNpZx0Bb9iExgX6
	hcFz10kufBXX4LVcpPOOS+PLrbwMPC7FWk72HA9sBAo6Cu7mmYaqdJFbZ4qNtvUb
	a1gyC3lnpbJ13TYN7Ytg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xdquhtp74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 19:19:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43AJJ2cB004617
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 19:19:02 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 10 Apr
 2024 12:19:01 -0700
Message-ID: <1c5470f9-05cd-5b18-e97e-a3abc1ffdf5e@quicinc.com>
Date: Wed, 10 Apr 2024 12:19:00 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 02/12] drm/msm/disp: add mdp_fetch_mode enum
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
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231202214016.1257621-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lJNgTZS9Kh3fTM0T73YxSxVHQ6NHfElQ
X-Proofpoint-GUID: lJNgTZS9Kh3fTM0T73YxSxVHQ6NHfElQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404100142



On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> Pull in new enum from the mesa registers. This commit should be replaced
> with the registers sync with Mesa instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/mdp_common.xml.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

