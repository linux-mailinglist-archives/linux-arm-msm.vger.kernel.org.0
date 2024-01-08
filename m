Return-Path: <linux-arm-msm+bounces-6688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C9B827A53
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 22:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03ADC284BA2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 21:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB9956464;
	Mon,  8 Jan 2024 21:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kWqWR2BV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D1356466
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 21:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 408LfScv024334;
	Mon, 8 Jan 2024 21:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=mJCwMMMfxkhuZVL0gzk8j+yfK5Ar9Kj1Saa4MLJv/EU=; b=kW
	qWR2BVd7zL7Iv0LvQIK9wx1d7Pkfjf3uLIAyckSCGs6GsEjCQQv7/bPVL1IkUPxM
	dAEYqSrn2sQzfQa3smnsagbz/e1XOsPVVN3U1JxMpptUKu7u0IRkJV+4IKlwuFAg
	XaM+YSAiMtVDqwCnjGdg3cZ5nQaEaA3anhafX8CR9Lmhm4sRpz4+Ci4DsFY91FN4
	BgDnq48SRYVW1A3X7lh2QJ3EMlFvt0n4OktuuOE0C0LJI8mEqtGvaqaY4V7TeXKe
	tqktB2b1heEllZC0eZTlXVdnlPGAsatNX1NlmTGS2NFljtNAVOtC1GUVsM9NsxbM
	x4pWBL5vBl5ZjYh/3nAQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vgbjyhwun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 21:41:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 408LfXkf017140
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jan 2024 21:41:33 GMT
Received: from [10.110.115.78] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 8 Jan
 2024 13:41:33 -0800
Message-ID: <d19ce547-56be-3524-0832-05388ebbe8f7@quicinc.com>
Date: Mon, 8 Jan 2024 13:41:32 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 0/5] drm/msm/dpu: remove
 dpu_encoder_phys_ops::atomic_mode_set callback
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
References: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pcLXBdzkQ-Pgb-hzovKEdD4K1_vi0qsu
X-Proofpoint-ORIG-GUID: pcLXBdzkQ-Pgb-hzovKEdD4K1_vi0qsu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401080178



On 12/25/2023 5:08 AM, Dmitry Baryshkov wrote:
> The dpu_encoder_phys_ops::atomic_mode_set() callback is mostly
> redundant. Implementations only set the IRQ indices there. Move
> statically allocated IRQs to dpu_encoder_phys_*_init() and set
> dynamically allocated IRQs in the irq_enable() callback.
> 
> The writeback backend of the dpu_encoder is the only user of the
> dpu_encoder_phys_ops::atomic_check() callback. Move corresponding code
> to the DPU's drm_writeback_connector implementation (dpu_writeback.c)
> and drop corresponding callback code.
> 
> Changes since v2:
> - Rebase on top of linux-next
> - Also incorporate the dpu_encoder_phys::atomic_check series
> 
> Changes since v1:
> - Split trace events into enable/disable pairs (Abhinav).
> 

We will provide a Tested-by for this series soon after re-validating WB 
and CDM with WB with this.

