Return-Path: <linux-arm-msm+bounces-4273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E70F80DCEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 22:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F55AB213FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 21:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C469654BF7;
	Mon, 11 Dec 2023 21:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jxG2lPv0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35C7BCE
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 13:24:43 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBKumYg024373;
	Mon, 11 Dec 2023 21:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ltWNGDm2PYVeA0aOi8USEhnAa11CNpojgOdHNXq/edI=; b=jx
	G2lPv0ZvjaUP4m0LE+N4qYbBlB97sWBxRDf/apJ6Ovbe3moDlwf4cgozgVON0C8c
	WINCQOjh6DsP2A9bhDlKygLXRZEB/vikZfDQjX2l31wCemmugb5GN+leMNypNk3j
	5/bz1r3w+YF7aJ6SVlYW94OYDlBrxRrf7hWkq/CjcsmtvxvZubdn4wY9RmV5YpEE
	T/zbuIGM7gzugXUN+5w6sFLbDcwZMYTRtY2D8cMrKX0saGAb/UTRXjmPNTu8gP+b
	mx2dw3NjWGiJ980CNNWBjiNfNm0RUZtp1DJH6KaWpviasZ3rCVPbFfRXAnDMYYXz
	BCL8Tn5ueW2IaAeWozbg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ux28s98bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 21:24:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BBLOUDV024567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 21:24:30 GMT
Received: from [10.110.62.164] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 13:24:29 -0800
Message-ID: <5e4dc7cc-a4b6-7cad-935a-6ec68dd96c75@quicinc.com>
Date: Mon, 11 Dec 2023 13:24:28 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: remove extra drm_encoder_cleanup from the
 error path
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
References: <20231211145440.3647001-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231211145440.3647001-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZacLEPgnKmb3JF4rGN4-bwXs_V1xPLpM
X-Proofpoint-GUID: ZacLEPgnKmb3JF4rGN4-bwXs_V1xPLpM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 mlxlogscore=860 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312110178



On 12/11/2023 6:54 AM, Dmitry Baryshkov wrote:
> The drmm handler will perform drm_encoder_cleanup() for us. Moreover if
> we call drm_encoder_cleanup() manually, the drmm_encoder_alloc_release()
> will spawn warnings at drivers/gpu/drm/drm_encoder.c:214. Drop these
> extra drm_encoder_cleanup() calls.
> 
> Fixes: cd42c56d9c0b ("drm/msm/dpu: use drmm-managed allocation for dpu_encoder_virt")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 ---
>   1 file changed, 3 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> #sm8250 CI

