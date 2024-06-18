Return-Path: <linux-arm-msm+bounces-23149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 535E190DF71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 00:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64B271C22244
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 22:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE94178CEC;
	Tue, 18 Jun 2024 22:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cUNtJLET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166271741EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 22:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718751186; cv=none; b=MuSS8475OjnyTBMIGauu0/nlVDvBb5AEir94KL5WgDNvcInuMzsQom2/r81S4g8ux1DglOsaggy9S5g23Pk77eSbfMWcOTT3HOX4gurGi/w+ENdKnL4R02i60N6Qm0VIJ3RreqTJCOgUBfa6aYlYU/2PJea/sfIQ7WoeTV1bj+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718751186; c=relaxed/simple;
	bh=cgVMdtdFo1Mz6gv5CFP2352IjX8tIs0picsRZa0XcZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S6DL13npWHc+KUaH0izVdt4lYq70oEDuIEpikPwZ1/5x8b1NruhjkPrBY3YRMkT2QdjNLDS49ZnsgeAui1N96C+/VF7Htlpk1/sayhbryBR1lfCuYgEOXVM21fbox8ejLRSXansN6z8yoAsluWUslWaBTPP7VSII6WE2qOMeciA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cUNtJLET; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILfQPI028119;
	Tue, 18 Jun 2024 22:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ow/7AiCtl/ipw7BpaoHge7POu2Z+ZmdTfR/Ltauh0TE=; b=cUNtJLETF11Qk3Wk
	C7zcHibxmod0YrZUiPEWyrkpY+RGlE2tH+CHAu8DDGhJIE/0dPQtP8Cb48HuVRrl
	o8OMwavOaw1g2adbV1PpNmjKdC6SVFeO0w5ZwgNNy+/fcPmJ6P2XZkaQ0FguzKaE
	+On2XY2Dyw9+oBNj2GD2A6lhBn6CWO775QTqI9+Jc99+Vrml/0KDEADQkwTI4xq5
	z614ZqUufu1w8aBLqrpD+YVXZE689U7wYae++Aj19qc6MJfobIZ9TA1EwVCziytU
	+zinX2hhHY/XpTbqskNPR/R16l9rh6aVxZ2ZM0EUW8Yu8cfrVpLl5hZk2In07rcU
	qkfwuw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yujc4g3nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:52:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IMqsIY028292
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:52:54 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 15:52:53 -0700
Message-ID: <f6263147-092e-039c-8b7e-99c23370c0bc@quicinc.com>
Date: Tue, 18 Jun 2024 15:52:53 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 5/9] drm/msm/dpu: move dpu_format_populate_plane_sizes
 to atomic_check
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Abel Vesa <abel.vesa@linaro.org>,
        Johan
 Hovold <johan+linaro@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
 <20240614-dpu-mode-config-width-v3-5-29ec4069c99b@linaro.org>
 <df63b33c-2e5d-1e30-5b6f-8af3d2bd2c6e@quicinc.com>
 <gcwsfv7ieedz246a54fjyjgn2skkro6dsohdgf5psyz3aebro3@7yqnc2kqrwyc>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <gcwsfv7ieedz246a54fjyjgn2skkro6dsohdgf5psyz3aebro3@7yqnc2kqrwyc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yR1T4mcMWRRzgzlrrNtQWIXZafmNOrRm
X-Proofpoint-GUID: yR1T4mcMWRRzgzlrrNtQWIXZafmNOrRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_05,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=876 malwarescore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180168



On 6/14/2024 3:34 AM, Dmitry Baryshkov wrote:
> On Thu, Jun 13, 2024 at 04:19:07PM GMT, Abhinav Kumar wrote:
>>
>>
>> On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
>>> Move a call to dpu_format_populate_plane_sizes() to the atomic_check
>>> step, so that any issues with the FB layout can be reported as early as
>>> possible.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++------
>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>
>> Did anything change between v2 to v3 that R-b was dropped?
> 
> No, it was my failure to run b4 trailers, please excuse me.
> 

no problem.

Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280

>>
>> Here it is again,
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

