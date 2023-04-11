Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7C26DCE98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 02:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjDKAyS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Apr 2023 20:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjDKAyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Apr 2023 20:54:17 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141BB1BC7
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 17:54:15 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33B0eA08018316;
        Tue, 11 Apr 2023 00:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jssJ0zorj/2h8CMdT+JRnsCsO9uE5gGa7J50aUHuJ6s=;
 b=jRX+C9QYG9fIfyC//uvzMZkdjjgZD+b8QwfybxORQltZM9xYl3fts1iTVj+aTIPjQfaP
 lbfL0D7gNG1AWGEJ7JqSyqgsV5ZBMQr2Z4XGmNK7563JC+jPGNxpyu+rfdWP0VmsRhtO
 YhmdCTtsRnwEeNhWaHlhDH5uAXtkCMRQy9gZLfIlExLxV9Ylm+xrpAVAwmLMYN2/d+ZL
 87K/uPVSpww9cNk7eqEZcDQt1zN+0sVasXLVpUGqCGE1N0booi01tvRBk+LzDREiChTI
 hkBMGEQhQBvgGQ5mm7OPqSugU3UG9HIrjkpK03As5UxncIPaHcoPGSz0kKH9RxrYnfNr kQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pvnjerwbd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 11 Apr 2023 00:54:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33B0s65a002893
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 11 Apr 2023 00:54:06 GMT
Received: from [10.110.115.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 10 Apr
 2023 17:54:06 -0700
Message-ID: <fd7f4695-c9b9-ba81-1b07-1b265e0c2ae5@quicinc.com>
Date:   Mon, 10 Apr 2023 17:54:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 2/4] drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
 <20230408002750.2722304-3-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230408002750.2722304-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Z_xr1DmWYrUxTW-MFTbVsj3B8QY-ie1u
X-Proofpoint-GUID: Z_xr1DmWYrUxTW-MFTbVsj3B8QY-ie1u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_18,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=548 clxscore=1015 lowpriorityscore=0 adultscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304110006
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/7/2023 5:27 PM, Dmitry Baryshkov wrote:
> Mark DSPP_2 and DSPP_3 as used for LM_2 and LM_3
> 
> Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
