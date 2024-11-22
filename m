Return-Path: <linux-arm-msm+bounces-38773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C4E9D5A12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 08:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC4CF281BA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 07:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A8E1465A0;
	Fri, 22 Nov 2024 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pIBh3yJk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547D73C2F
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732260978; cv=none; b=vGijMt2KYcSs46TL2daoy6BdJEGKIAerUERJuDTfFw2B4w+s9F8HgPfzYfAH8tVmUDw89anwPkE+adnkzUderUH1TTBlxEfA7BfHSs4NOAqbZbWRyJbc8hHuzobCHgdk543YHv0B3+as9VTFYOCMEcke4fttIXD+pDV8jXv4/do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732260978; c=relaxed/simple;
	bh=gN3jnIxl2B8A9djREMmccPoxMSSpxRy2D2Ek0ts5yg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VP3RaBu3LsHJ282fMutEeC1uvGKaQtD2FYDP6LzN5swNHmO2KnQy+u60hRdJL3vbimj7KwGUujvI3qW/6ylh2F7TNKCNBXeGBxoQ754AkUnsMMEXg87nYBwWkvqq0cW44e85jizKyd80MosP2/xZcGeja2oUpCwj580hrswEeTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pIBh3yJk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALGmTab016858;
	Fri, 22 Nov 2024 07:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uW8Uxklhw9fj22npEg+76xvyKrj/GHieQ/AppJc14SU=; b=pIBh3yJkPyiwQILo
	Px5GbxvoYq9+qFMpDuXHTSP/5rz1p1ej152dh4foFFoX39i2m0JUFzpeP5s8raJE
	BW3TzZy4DoPFEugLzmfy8ePE9nXP3Gpphh0nqx/jEq6eR88gYsQukmnzKHc0snlv
	BN+dnyk35IfE61PbL8LsM6JltUY9r+puKPuY69O+itpyxBpQOOSGgJRDnbVMwgrs
	YNRlArvPlI67iqj3f+UtKDMy2QjPdXeGf3tawzmOmCT9KkXWPdTJ4WK4adHHXLJA
	FC7Mi+e5OKwC3093L/zBO/0y8paklzh215ol0bPmz5HAEV5VawgiZOnD/q54DZ4/
	sehkYA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4320y9kc04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:36:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM7aEKd000424
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:36:14 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 23:36:09 -0800
Message-ID: <dd3ef5e3-ba93-4ffa-976a-52492832487e@quicinc.com>
Date: Fri, 22 Nov 2024 15:36:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/msm/dpu: Add QCS615 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <kernel@quicinc.com>, <quic_lliu6@quicinc.com>,
        <quic_xiangxuy@quicinc.com>, <linux-arm-msm@vger.kernel.org>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <20241014-add_display_support_for_qcs615-v1-3-4efa191dbdd4@quicinc.com>
 <ezatn7e5sm74dd4xs4r4qnkcwouu3cu72vlvbbsrj42eca3dyo@xfmga7rpzspl>
 <ccfed778-6257-4da1-90af-c5d8ca5a98f7@quicinc.com>
 <CAA8EJpotZ8giXYY=1EjyKa1oHz=aEHecZPi4G4CfNNqSQ8jW4g@mail.gmail.com>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <CAA8EJpotZ8giXYY=1EjyKa1oHz=aEHecZPi4G4CfNNqSQ8jW4g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: A2gF4_h1DqPmoAv4uK4y8NyvtGfKTdMP
X-Proofpoint-ORIG-GUID: A2gF4_h1DqPmoAv4uK4y8NyvtGfKTdMP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220062



On 2024/11/18 18:55, Dmitry Baryshkov wrote:
> On Mon, 18 Nov 2024 at 10:52, fange zhang <quic_fangez@quicinc.com> wrote:
>>
>>
>>
>> On 2024/10/14 18:47, Dmitry Baryshkov wrote:
>>> On Mon, Oct 14, 2024 at 05:47:29PM +0800, fangez via B4 Relay wrote:
>>>> From: lliu6 <quic_lliu6@quicinc.com>
>>>>
>>>> Add support for the display hardware used on the Qualcomm QCS615 platform.
>>>
>>> Not all hardware is described here, comment regarding the DP, etc.
Fixed in v2
for DPU part, commit message would be:

Author: Li Liu <quic_lliu6@quicinc.com>
Date:   Tue Oct 15 12:50:26 2024 +0800

     drm/msm/dpu: Add SM6150 support

     Add definitions for the display hardware
     used on the Qualcomm SM6150 platform.

     Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
     Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>

with these file changes:
  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c

>>>
>>>>
>>>> Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
>>>> ---
>>>>    .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_qcs615.h | 268 +++++++++++++++++++++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>>>
>>>>    drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  17 ++
>>>>    drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
>>>
>>> These changes are not related to the DPU, which you listed as a prefix
>>> in the commit message
>> ok will split it to these four parts.
>> 1. dpu hw catalog
>> 2. mdss
>> 3. dsi phy
>> 4. dsi
>> sorry, one more question about it.
>> is the driver patch order correct?
> 
> Usually MDSS comes before DPU
Got it, will fix in next patch.
New driver patch order as follows:
drm/msm: mdss: Add SM6150 support
drm/msm/dpu: Add SM6150 support
drm/msm/dsi: Add support for SM6150
drm/msm/dsi: Add dsi phy support for SM6150

> 
>>>
>>>>    drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
>>>>    drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
>>>>    drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  21 ++
>>>
>>> These changes are not related to the DPU
>>>
>>>>    drivers/gpu/drm/msm/msm_mdss.c                     |   7 +
>>>
>>> These changes are not related to the DPU
>>>
>>> For the whole patch: s/qcs615/sm6150/g
>>>
>>>>    10 files changed, 320 insertions(+)
>>>>
> 
> 


