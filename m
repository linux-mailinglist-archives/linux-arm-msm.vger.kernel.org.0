Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A359871011B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 00:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236703AbjEXWqh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 18:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbjEXWqh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 18:46:37 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EAC6A9
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 15:46:33 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34OMCKbe003194;
        Wed, 24 May 2023 22:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EGTIICS+z2ZD4zAuqwaypE6qeaQhq4jHugYQnQ0MufU=;
 b=Iq9eRLuBdL4Nk9GkL/guvNMvEw8gIQyDsIaZ7IwPckPvqsdgCKug0OMNxfqCCbLt73lY
 esVIcs44/wNW1SBAq6R+paCBReoKG0Y6lJOnkiUSaKf2hl5PGyvRCEvAY6ZAiKhqXNuO
 9qUzsRuftvOjDPAhJBnB78vtF5kbq08kUvvKtLbDnZ9pwsmGMiROX+B9uk1bDZBSnJFQ
 TfVEMTVyOCxaDsMSvlcXmltpkfyjfkN69HiWKhNjGfRYslD+7B+VvvzChU8TvytZqW4p
 zvrLbxzAGe6pRyrhQGn/xnODSDVoenfiR6p4al0bZuvUpMDsA+dV8CuwiDW6oXcJLHFx EA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qsp508qkb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 May 2023 22:46:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34OMkPu5005350
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 May 2023 22:46:25 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 24 May
 2023 15:46:24 -0700
Message-ID: <4af411bf-290c-0818-bdf2-878b2da15146@quicinc.com>
Date:   Wed, 24 May 2023 15:46:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 09/13] drm/msm/dpu: move pstate->pipe
 initialization to dpu_plane_atomic_check
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-10-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230321011821.635977-10-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e5SxxxjwqRy96Oj6nTxk-K0W4SScXWJP
X-Proofpoint-ORIG-GUID: e5SxxxjwqRy96Oj6nTxk-K0W4SScXWJP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_15,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=776 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240190
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> In preparation to virtualized planes support, move pstate->pipe
> initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
> case of virtual planes the plane's pipe will not be known up to the
> point of atomic_check() callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Will legacy paths be broken with this? So lets say there is no 
atomic_check we will not have a valid sspp anymore.
