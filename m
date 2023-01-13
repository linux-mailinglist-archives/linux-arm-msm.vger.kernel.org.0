Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE1E66A540
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 22:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjAMVns (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 16:43:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjAMVnr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 16:43:47 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E354B10B5D
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 13:43:46 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30DLhefC002904;
        Fri, 13 Jan 2023 21:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YI2h2xe7Oehb6HTNaQtRm0F6Ktz4kT/bnhsDkzXKmN4=;
 b=U25iHe1CXbKRr4HwD39gRHnTzonT/fzC2+obGoFleVjjSpyyjpWP7tjGtHRKsX9TCpjg
 llC7g9UMzwsxDvDteeJm7ym+R4yHoeNuJ3TFUfqKKoRwc+dZndbjNKp+VgcyfYa1ad7v
 6gEgAv4P59A1aKRvz62YN9u3iPitV4vVNUvOof3J3rOoFlye14ncoen6XCiPC1VFPMmf
 WS7Qrmx7k81ecMNAnot8V8Ox3o6vdyTCb5QPB1VnT2R27ofoXxxshyJVJ25jI8PS2q+H
 ESX92ylZtV9SaC/DMDaQh5d1iJxQlUmUDhjip8paP43fx2YqmXaONyp5y3NhtNGzv9IX Pg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n2s0cts9e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 13 Jan 2023 21:43:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30DLhdgY008861
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 13 Jan 2023 21:43:39 GMT
Received: from [10.110.70.165] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 13 Jan
 2023 13:43:38 -0800
Message-ID: <cb3e7dfd-1844-65f9-aafd-32187047b535@quicinc.com>
Date:   Fri, 13 Jan 2023 13:43:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 0/3] drm/msm/dpu: several fixes for UBWC setup
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ry5DOIZc-zq--yLUPsEmXd_ox9U71UOl
X-Proofpoint-GUID: ry5DOIZc-zq--yLUPsEmXd_ox9U71UOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_10,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=777
 mlxscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301130148
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/7/2022 6:28 AM, Dmitry Baryshkov wrote:
> Several small corrections for the UBWC setup and related data.
> 

I am assuming this series will be dropped in favor of the RFC:

https://patchwork.freedesktop.org/series/111751/

Right?

> Dmitry Baryshkov (3):
>    drm/msm/dpu: handle UBWC 1.0 in dpu_hw_sspp_setup_format
>    drm/msm/dpu: correct the UBWC version on sm6115
>    drm/msm/dpu: add missing ubwc_swizzle setting to catalog
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 ++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 6 +++++-
>   2 files changed, 9 insertions(+), 2 deletions(-)
> 
