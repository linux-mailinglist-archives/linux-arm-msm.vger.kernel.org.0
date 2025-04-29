Return-Path: <linux-arm-msm+bounces-55996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CB1A9FEAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 03:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24F3B3AA30A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 01:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A72B1CA84;
	Tue, 29 Apr 2025 01:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eAAqN5cI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A911BF37;
	Tue, 29 Apr 2025 01:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745888468; cv=none; b=KLpYriif2b9w9qXQjfh3z0Ihgy80QiNA+rGN4+yQw9RgWEDxrG22ivmFblcbRb+R6X41fU1nEfzXBAfCe6CbJsmFB8BLrtSjv2JGBwPH/jZl6wB3ujfHiLi8rqtc/lXBxS8bfBn+2KpURN/qhcA/+mG9FX1s9nAbPkFn107UKSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745888468; c=relaxed/simple;
	bh=kX0epumywcPxcl+dvFn26s6+nKaoDnUB9XsoLe9U2Sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dyHInUmy6N6cwFKTXs5zPLCmZ38qTcvbZ1OgyTEQX2GA1YGKLgJndqf2uhzKc7HWum+FZR9QRFbLwumvvx515r7d4d2ruz7cKKVRb58EPhP4fkG7nQUCNuyMRKQzvRroee6MW8RkJQx/S/lPIvuXZ7+LelggFloBHz622GJ0Ris=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eAAqN5cI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq3pK011841;
	Tue, 29 Apr 2025 01:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xABTVYeqIo53PTiETkVjsl0FavZkzzQUufeKJgd35wI=; b=eAAqN5cIEjZzyMI5
	ZorXtMIUc96EOvXVY80iqChj/Bo3Ju0TX7KFM6Dyy3r07VHsTVWMMgAiqS1m8Evq
	BoIHbZVjGmv/iYv0DzbJ9IU6lqDYEwy2KhNuGORWqhgNmM+g9IVfIEk8GtPru65L
	xKmSsam9HdpayNrLMGW+JcYpR+7Nr1WoH1Cy4mjb/iO7aTNFdLQ0YPYGSiwJwH0Q
	e7DLHvEVv6KWNLfgyZyhs0Py/BMQzkHDzzNAfjN1HAOmFIw/lW/OADDx1IvfzLIF
	GtRTWltDwocYN48i24UVwXLmrOYaiPBYPbIuwnE7ZX2aWq0Yf8qqPseHdxBx8iYs
	cNPE/Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9au8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 01:00:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53T10TK0010104
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 01:00:29 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 18:00:28 -0700
Message-ID: <34e9b7f3-e0b1-4a00-931e-b941d65706c0@quicinc.com>
Date: Mon, 28 Apr 2025 18:00:28 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/msm/dpu: remove DSC feature bit for PINGPONG
 on MSM8917
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?=
	<barnabas.czeman@mainlining.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
 <20250301-dpu-fix-catalog-v2-2-498271be8b50@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250301-dpu-fix-catalog-v2-2-498271be8b50@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=681024c2 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=iTZM9pQ1TWb8sfHiNRoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DLORimGwcjSuYkUTCjwGJ-PnidCX0WdW
X-Proofpoint-GUID: DLORimGwcjSuYkUTCjwGJ-PnidCX0WdW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAwNiBTYWx0ZWRfX2OQNyRqMlMoq HA+ChGXkJRqprBRgENdvPnugoJgRIWweGHESTFIr24HM8BDkD1I9TYEb+zFEAriXGjdsYHJEiVP CFjkYAUcb4oSqyd4VT1TWFpggeF8DTcQr+Hi3Ix9tHJTGN2+rPoZ4fe9MzzRYMStYVPmyqG230f
 wCg2nPl3Jf++ojTfZduVWz/vnmwCdXvb+6qaeLVO/t/St9ID0mIc0P/+oyjV/oTOr46JjC3DRBP eTue430QJqzifWQNSZm6IHXinf3gPhoacXZSKfxb7dxfNso+SQEaRps7obmhNVgJEjLjXL0wOlk sP9L12qqVSoFdaJOWGWcN3n5jXf3VvZYnKYYTH11JOJvKfeMXr10bq2bQjWZfw49cO9HLO9Hy+Y
 6SiMjQrcTa4cKPnNK4ccgmACDrS3BzvgeLbVSrVBkhGq5D8hB1Ri0TCl2a0/wwr21Ym9A9oc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=938 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290006



On 3/1/2025 1:24 AM, Dmitry Baryshkov wrote:
> The MSM8917 platform doesn't have DSC blocks nor does have it DSC
> registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
> from the PINGPONG's feature mask and, as it is the only remaining bit,
> drop the .features assignment completely.
> 
> Fixes: 62af6e1cb596 ("drm/msm/dpu: Add support for MSM8917")
> Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
>   1 file changed, 1 deletion(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

