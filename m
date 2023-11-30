Return-Path: <linux-arm-msm+bounces-2774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A45D97FFF30
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 00:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5832D2818BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 23:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE9654666;
	Thu, 30 Nov 2023 23:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oqnn3HG8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD3A1B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 15:07:57 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AUMuSjE007551;
	Thu, 30 Nov 2023 23:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NScN8YULGF3cAIDE2jS0CJcuHY5dR3pD1skEqqwTrDc=;
 b=oqnn3HG8dYIk9ZcHQHXvrpR5K4euRZnm3DVTEqFvJteLCnZDAaQvy2hL7gC7PW0EAwv0
 FibRpBlKt3KAYyi1EzgEk6n1ggMOsoVrUWsAf1h3OoColDMgg/1qy2f02KBtGQ4JCff7
 4jf3He/69AHSnJ0RKYMFZE0yiZLMgBPIqzPzCPYjTqdq2bgttHeNkG3CmxoAw8s7Iqca
 OsThXAiw7YSrIplAHUg8TDWId1pacuXYSPCwwwKQ8NSFldg8nP4Y+XNjRtnEcAqcdhh4
 ShyD5CZA/RI0BRpSQRLuTm0+mXNydHJHlA50v0LxLBIHNfubAVoi0IL8XFEdpApMehiO cg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upv481a80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 23:07:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AUN7hto021008
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 23:07:43 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 30 Nov
 2023 15:07:42 -0800
Message-ID: <fec52360-5e55-75c0-ab39-412c48084ab1@quicinc.com>
Date: Thu, 30 Nov 2023 15:07:42 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] drm/msm/dpu: Capture dpu snapshot when
 frame_done_timer timeouts
Content-Language: en-US
To: Paloma Arellano <quic_parellan@quicinc.com>,
        <freedreno@lists.freedesktop.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_jesszhan@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>,
        "kernel test
 robot" <lkp@intel.com>
References: <20231130224740.24383-1-quic_parellan@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231130224740.24383-1-quic_parellan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZD8OLb0JeCAYwYlYaI9a4a07wwOkqxq4
X-Proofpoint-ORIG-GUID: ZD8OLb0JeCAYwYlYaI9a4a07wwOkqxq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_23,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=531
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311300171



On 11/30/2023 2:47 PM, Paloma Arellano wrote:
> Trigger a devcoredump to dump dpu registers and capture the drm atomic
> state when the frame_done_timer timeouts.
> 
> v2: Optimize the format in which frame_done_timeout_cnt is incremented
> v3: Describe parameter frame_done_timeout_cnt in dpu_encoder_virt
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312010225.2OJWLKmA-lkp@intel.com/
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

