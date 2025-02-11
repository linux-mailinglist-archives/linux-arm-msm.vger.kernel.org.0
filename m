Return-Path: <linux-arm-msm+bounces-47499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DAFA2FEF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 01:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8795188884B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 00:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709BC2594;
	Tue, 11 Feb 2025 00:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DxfVDDOG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB99801;
	Tue, 11 Feb 2025 00:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739233064; cv=none; b=o3UCeL6T9fK3nf16vmHHHoZxy+zaIUE9r5sKn95a+xuprtPAPMbKAy+5TuS4q3ewJG0nKl7baLJy4++ac2Au5aGNt+mAL+g4B9NCQ8k4+4b5nwZWwBZWlEyAR62HHRVWj7R1DSzxoU9faCz9FIcgj5w7byw5Rb/je78h3aK5dWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739233064; c=relaxed/simple;
	bh=JGsSogXLmPqgVPrNJ4sogLYXwU0yOw3MgKlrk8D8D7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I4pum0itAoFhh9F0TOy0OJumYS/1GXeurVnM3s3v7wdYMePhLDs0D9+nQ89fQi9LO0PSMDeW0lDGS9L2XFERlCAQslqwEge6nQT3AnDjYI4b0B6AIpKMmNE6MhuATeoMxrZroyMtLU44rs8fzPRRweggQwOcSH3QTrsnwT5ekcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DxfVDDOG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ABgO10000355;
	Tue, 11 Feb 2025 00:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXLA7xIkHuZLbkBc9dKJ7utAYTqNsvjNQLuR8ehqS94=; b=DxfVDDOG9LyRuEFM
	/Fo1qQiwfpMCAI/UEcMJbFiPn4Wd9FPHoO/M6Yq8DhnFaX9pA9I7XeffBGkZZw/k
	rvLmg/8ALSyfdEqWJ4iE2QIwFr5n963fICEJCzgdiaS3DakgTsqOcMoKGvD7eN36
	WfUhL5kBIdyG+YZCvWLiDQNbn+m5z+/On2+Vnh0mvdhU9YCFFagho5KJQKOPwRVb
	nN+tIV+dUEcMCP76DiFkeken5RWH36mn5eMcX/a7i0CTBQ/S/8HSYMExUp2pQEW/
	e4vnsInfAMX6d5vir/QCg1hDVj9VS23KRZPPum1Gqva6zafv6/cDj6t2Biq28FoR
	fr3QTg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qgtk1tbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 00:17:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B0HRH5026820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 00:17:27 GMT
Received: from [10.71.110.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 16:17:26 -0800
Message-ID: <4eb08a1a-b862-4295-98d9-005f12015527@quicinc.com>
Date: Mon, 10 Feb 2025 16:17:25 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Don't leak bits_per_component into random
 DSC_ENC fields
To: Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean
 Paul" <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Simona Vetter
	<simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>
CC: <~postmarketos/upstreaming@lists.sr.ht>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250211-dsc-10-bit-v1-1-1c85a9430d9a@somainline.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250211-dsc-10-bit-v1-1-1c85a9430d9a@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Yu7-Uzeq8W7oQjVQLunZwf53yOzqwdPJ
X-Proofpoint-ORIG-GUID: Yu7-Uzeq8W7oQjVQLunZwf53yOzqwdPJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_12,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100180



On 2/10/2025 3:19 PM, Marijn Suijten wrote:
> What used to be the input_10_bits boolean - feeding into the lowest
> bit of DSC_ENC - on MSM downstream turned into an accidental OR with
> the full bits_per_component number when it was ported to the upstream
> kernel.
> 
> On typical bpc=8 setups we don't notice this because line_buf_depth is
> always an odd value (it contains bpc+1) and will also set the 4th bit
> after left-shifting by 3 (hence this |= bits_per_component is a no-op).
> 
> Now that guards are being removed to allow more bits_per_component
> values besides 8 (possible since commit 49fd30a7153b ("drm/msm/dsi: use
> DRM DSC helpers for DSC setup")), a bpc of 10 will instead clash with
> the 5th bit which is convert_rgb.  This is "fortunately" also always set
> to true by MSM's dsi_populate_dsc_params() already, but once a bpc of 12
> starts being used it'll write into simple_422 which is normally false.
> 
> To solve all these overlaps, simply replicate downstream code and only
> set this lowest bit if bits_per_component is equal to 10.  It is unclear
> why DSC requires this only for bpc=10 but not bpc=12, and also notice
> that this lowest bit wasn't set previously despite having a panel and
> patch on the list using it without any mentioned issues.
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

Good catch !

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

