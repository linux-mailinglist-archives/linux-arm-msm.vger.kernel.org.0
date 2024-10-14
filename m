Return-Path: <linux-arm-msm+bounces-34368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B11999D73F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 21:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB91C284016
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 19:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1CD1CBEBA;
	Mon, 14 Oct 2024 19:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KH1RNvPZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765B71CBE8B;
	Mon, 14 Oct 2024 19:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728933778; cv=none; b=Vd39g6Tq5eyYSIJK6FKyC1Zfk0Eylz5dNNrzrJe8rdGap0ve/wRVfQ7UCKvOm3UJmZieJn/XZSh5WnH6mXDyxAV5aPAxqobM/0pK6dcjFW3fEJHAxMKQV8Vsh+DcG5ZIrknZodXWxuBGFOpOWD4ldmYzlJL4E2Own9Hjm9FrfYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728933778; c=relaxed/simple;
	bh=u0t0qNkf0QAtWuaQXJkECXunLokaWI6GNjPYrhSs6Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EIzGv1qGSdfFPhvpr8Mqd5Md5qhOnNMsEiSBl9p6/Mrk95iDXGayxpX5x1N5vpvnH4qVklSXBMPN/3a2n2vUmsJ6u1XWWo/1rjUgDvknSlduGh7NurxhAtWMmGftnYB3dH3/NFDixID9kqp7nr8I/BufI7ZJwfjsaijvUteLgGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KH1RNvPZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EB551u004976;
	Mon, 14 Oct 2024 19:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+IFnL4mUMiitkJabSAAeUc+H/UvzVDoulSrPcPlL1KI=; b=KH1RNvPZcZ/qRI6t
	gC2ACP2gFUsltxUqhfnsJACkT4/US0zycLAHi2KhWFrF9hqBHc0UEuTSXEb94PCT
	iw+Y6NqB2fXuMHAt7swgGiBRKuWp4jD2Ovse2FQ04sQfw4WfjghkJ8DgQj3pS4eq
	5S9PN54vnMa7uOrpDT6VlN0t8a6ZrK6mATgRkFMHp0seqJkSS9UmIWDZgvz3C+xt
	s3NLDohSHGrETzwVlzae2ZqGamYGz/rtovuO1vmXLVCTrrd9Pi44FSbwvCT5CwaO
	jpf9Y9xhNsTqC5xyO6xBkytXyaiV7wREJrY9kfvgLVraLojRG1+dpMP7C5EPmbbU
	qQOfPA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427jd8waer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 19:22:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49EJMeFO026699
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 19:22:40 GMT
Received: from [10.110.109.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Oct
 2024 12:22:39 -0700
Message-ID: <e938ac3d-48f3-488a-96df-80c94b7686cf@quicinc.com>
Date: Mon, 14 Oct 2024 12:22:38 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/hdmi: drop pll_cmp_to_fdata from hdmi_phy_8998
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick
 Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <llvm@lists.linux.dev>, Jani Nikula <jani.nikula@intel.com>
References: <20240922-msm-drop-unused-func-v1-1-c5dc083415b8@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240922-msm-drop-unused-func-v1-1-c5dc083415b8@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qdud2PHy7wMKhm9ZGVxgrNFYTxrpsi4i
X-Proofpoint-ORIG-GUID: qdud2PHy7wMKhm9ZGVxgrNFYTxrpsi4i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=887 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140137



On 9/21/2024 2:14 PM, Dmitry Baryshkov wrote:
> The pll_cmp_to_fdata() was never used by the working code. Drop it to
> prevent warnings with W=1 and clang.
> 
> Reported-by: Jani Nikula <jani.nikula@intel.com>
> Closes: https://lore.kernel.org/dri-devel/3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> index 0e3a2b16a2ce..e6ffaf92d26d 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> @@ -153,15 +153,6 @@ static inline u32 pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
>   	return dividend - 1;
>   }
>   

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

