Return-Path: <linux-arm-msm+bounces-4263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D42880D5AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 19:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EBDC1C21466
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 18:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1705101B;
	Mon, 11 Dec 2023 18:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gfMvcpqy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA865EA;
	Mon, 11 Dec 2023 10:26:56 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBEtlt5002463;
	Mon, 11 Dec 2023 18:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=SUy6SytFXhQLR7ozwwUFjxNCX/QmtttR5eigucrZQOM=; b=gf
	MvcpqynYOCnVb4sy8D/eZ4wFwvPZiVOTL/cuOvHUhDHA6GkhIN/REkd0KlmWRcMl
	Wi1y1xaMV4oG1YWW7IF/T/EVU8UdtfElNaF9EhhwiU59Om2Wes8uEqpsNejy9Q5P
	veCxo6IkBdpHbRb2Rfda2GrrU3+WIJh0iHLu/+asKCvfioGvNTLY/lAeoZGZDcrY
	3iTQWFr8XfIscsKqUbWMX2VJOVo3Wd+gsa60yeNqrpfaGXVLX6VqsmQH/QIWlh6Z
	+ty06GjTML2QvSAhk0iRkqhUgGcrFNmEydy2aOdJE/4eTia9sSDoEochPBHz5nT0
	KEGLyPb38b4EWp4vr3fw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uvnrg410k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 18:26:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BBIQjHJ026156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 18:26:46 GMT
Received: from [10.110.62.164] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 10:26:42 -0800
Message-ID: <6d91c5bf-68cc-84ad-5d78-53dd1926167c@quicinc.com>
Date: Mon, 11 Dec 2023 10:26:40 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: Ratelimit framedone timeout msgs
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        "Rob
 Clark" <robdclark@chromium.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>,
        Vinod Polimera
	<quic_vpolimer@quicinc.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        "Dan
 Carpenter" <dan.carpenter@linaro.org>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20231211182000.218088-1-robdclark@gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231211182000.218088-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sVgGnpT9OkPwvnHLLmGW9fycK6JdIJH1
X-Proofpoint-ORIG-GUID: sVgGnpT9OkPwvnHLLmGW9fycK6JdIJH1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=834 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110151



On 12/11/2023 10:19 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> When we start getting these, we get a *lot*.  So ratelimit it to not
> flood dmesg.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> 
> dpu should probably stop rolling it's own trace macros, but that would
> be a larger cleanup.
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 ++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     | 1 +
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

