Return-Path: <linux-arm-msm+bounces-32033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E591C97CD9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 20:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 913F51F21F0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 18:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B512FAD21;
	Thu, 19 Sep 2024 18:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pWEPHfSD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2541BC49;
	Thu, 19 Sep 2024 18:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726770839; cv=none; b=olh5OkBPx0k7UQKPTZi8mhPfJeuuIctQns5LBAdFKSVGjUbWrRCEDqgadTavlgTgv53FOHtQQHhIoogcnEaTMioXmuzywhnev+RoTsPTyeRCpvxrcbgD+8pTrDobxY8eVjuMy/+2D6qTayXAKHV7aJegP4lEOIHRN0YEBaX4CL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726770839; c=relaxed/simple;
	bh=fyqZTrXV6DkdPLOJsfqnSbNq1a48IkkR/ElFZjPwRS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HcBZXWqf0ZtgGdgpT2ot0umzL1hn20sQsK1p20EPx43/zhlb/xd0H7L0FeInJv8QnIGvPRqmpnEVJuTCpvo5JOYSjp/hrhIgsY0JUbcxNuJc5z56FteEgid9c11vEc2woW1Id93yuCYYY8S3ajZNmVgaN9lzdVpvBMy/UThlV6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pWEPHfSD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48J9P1tq031418;
	Thu, 19 Sep 2024 18:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2v9W5ToTAXSX0uVR1sXtPadf0VJTte9c1GTqVCirCc=; b=pWEPHfSDcQIoV4Wz
	y8QRrJuXXmYACz7WxrGCO6a1c71RR2+4x3xFFwXAqg4owgjCjCNsZYMuQzp9Yk98
	65BWQR3ZFiA3uRN8uGWyjVKempiYlpBIZJhez65H3c4rUJA/4jHa6e6lGWp5Up10
	GgVH23091NyKgN+JqaMeB8aUkmFEZqmkzGiu0/2BRDe7gIDMf/qd5tN/H4vOsj+n
	UmmxqzGVSBM9W1SerD/AEIstxwYjXOfRHR2gjP60+xRrF0tw+CHEyUC0qae6cmEH
	70ow2f9JHClSbGgLsMoUUtcL09pd5jPC5yqCO922uqSTQjAzBEJ+EWu79/l3ReaO
	0dmAfA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gee5y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 18:33:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48JIX1xi028143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 18:33:01 GMT
Received: from [10.110.111.10] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Sep
 2024 11:33:00 -0700
Message-ID: <08494313-5ff4-4730-90f2-4fad14071c91@quicinc.com>
Date: Thu, 19 Sep 2024 11:32:59 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/msm/dpu: drop LM_3 / LM_4 on MSM8998
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Sravanthi
 Kollukuduru <skolluku@codeaurora.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Archit Taneja <architt@codeaurora.org>,
        Jami Kettunen
	<jami.kettunen@somainline.org>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@somainline.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Jeykumar
 Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
References: <20240905-dpu-fix-sdm845-catalog-v1-0-3363d03998bd@linaro.org>
 <20240905-dpu-fix-sdm845-catalog-v1-3-3363d03998bd@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240905-dpu-fix-sdm845-catalog-v1-3-3363d03998bd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KIfRM3LUNuoShbYbhEDhOEKIdzxXR4Zf
X-Proofpoint-ORIG-GUID: KIfRM3LUNuoShbYbhEDhOEKIdzxXR4Zf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=768 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409190124



On 9/4/2024 8:26 PM, Dmitry Baryshkov wrote:
> On the MSM8998 platform ther are no LM_3 and LM_4 blocks. Drop them from
> the MSM8998 catalog.
> 
> Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
> Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 12 ------------
>   1 file changed, 12 deletions(-)
> 

LGTM

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

