Return-Path: <linux-arm-msm+bounces-36343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EABE9B5438
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 21:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12AE5285743
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 20:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE1820822D;
	Tue, 29 Oct 2024 20:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZxPgDyXP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDD1208968;
	Tue, 29 Oct 2024 20:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730234385; cv=none; b=HFjX8018Gb2VLDVC7UG2DG042LS1L7/KmqOA1GcQNae/s3WRlwP5KXQ5XfBI4xYLzUY678XmpB9uf/EHOlh4QKnn3QldCBGBR+Ez9BYy4wOTTMFspVmeVk8+Zv/qYQyWQwQ4i1QINtcu9dbgUQ51ZVqfGCHxgZjDx+nTyndDC1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730234385; c=relaxed/simple;
	bh=P2r7FVu9gmkCkbpkLPVLnxXL+ot5pQ4WfUYR4i9wFAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=COPm1RTERz/kAHu5VJTMMzQdaw5k2aGz1A60Uim41pWE4WkQ+++bF8puGSfEyvOMmXd3HVt8YW1xYIHimYVdSYTYj9JUcKYA/9ayFhLd0qWdoKhPva5BVBRe6m13XEYEqc9II0qbibd99BCjWe2RFYRYFrOLbA86tsYGuaF6lC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZxPgDyXP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TKRPXm012841;
	Tue, 29 Oct 2024 20:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Trw1wRvZ9jDquLyXUweN4WS1PG1v/WqPfv/Q/6OQiIo=; b=ZxPgDyXPvQ50xR7K
	EEqkB8+51A70EIK/vEenmMSm8hfTPTu8R55cLghudEEeMN0zSDwvuFo92u+hL6S7
	IVMs1xTl8Layk7kFsBDRdgmDAkclxCEuWSgUDg8pB6iwCRua73NqsVdizGilvPrX
	78morgdO2IlP7DCS+1KVYy+vfhrlSb1a1WqbsdMdHqOV4OoocQe5ubEYyfLpYNiY
	e4ROv/7ldzOyiJrX+au1PriQ4iJ2T2BAqtf4ehnFyFunicr0RLjRTXeBxo5Sv0vq
	UA+4w/DN1mkdBGQw2IXBpFpplHCo72dij1ulEuT5HGqZQLFEMY+xZpBgB4hYhrAa
	Z2gs2w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42k6rpg0xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 20:39:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TKdVTn021525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 20:39:31 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 13:39:30 -0700
Message-ID: <db7bcfce-e649-4c87-9723-b5af5696bc3e@quicinc.com>
Date: Tue, 29 Oct 2024 13:39:29 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/msm/dp: rename edp_ bridge functions and
 struct
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241029-msm-dp-rename-v2-0-13c5c03fad44@linaro.org>
 <20241029-msm-dp-rename-v2-2-13c5c03fad44@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241029-msm-dp-rename-v2-2-13c5c03fad44@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SjLrSfNWOhEkp_Fw_AkPkXnct6C5LIjV
X-Proofpoint-GUID: SjLrSfNWOhEkp_Fw_AkPkXnct6C5LIjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=814 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410290156



On 10/29/2024 1:28 PM, Dmitry Baryshkov wrote:
> Follow the estalished prefix and rename eDP bridge symbols to use
> msm_edp_ prefix, moving the edp to the end of the symbol name.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_drm.c | 36 ++++++++++++++++++------------------
>   1 file changed, 18 insertions(+), 18 deletions(-)
> 

Thanks,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

