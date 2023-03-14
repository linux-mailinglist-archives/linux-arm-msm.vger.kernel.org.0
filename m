Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E55E6B8993
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 05:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjCNEZd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 00:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjCNEZK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 00:25:10 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1909794A4F
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 21:24:41 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32E4OZ0b028014;
        Tue, 14 Mar 2023 04:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=64xiuODoRRwkAVVwOL+ykrU9uPR+cctFsJvyhgaUZIs=;
 b=Bz9jQ4PlqDk9uxnA4dr2iZxGVrWVwrxT/BKUQ1+Pjb9eoBn9AsZlEjvVHZYh0ldRpWBH
 NWVo1yD4nKaBot2DYgEw1fsiH9GJPFuWFuLdSX9Ti2FhE8n9ND9r1wN64yYu2Jxo1MSQ
 j7fuhZsu+iCtl7OlkTRvivr72ZOORJZqk0ebKaASJ0IXMlMScs2p1zZs/IDLfaUP2JKU
 ySExC8LUCYrmicTwoI6lsMF1k8x3cHMXIlAb0In+gFSxERztpOt5jOjYg+lm7UIW6joP
 Fj/c/mFkv/1TJOjTNK9xT52lzLIDCz4ZbnBMNgrrYfvlDbaKzGLNh84kf1ExJiDmZiKx 2w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pa1qgth65-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 14 Mar 2023 04:24:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32E4OIw9005066
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 14 Mar 2023 04:24:18 GMT
Received: from [10.110.64.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 13 Mar
 2023 21:24:17 -0700
Message-ID: <dbd8e5cf-e68b-dacb-604d-c56413403309@quicinc.com>
Date:   Mon, 13 Mar 2023 21:24:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 23/32] drm/msm/dpu: rework dpu_plane_atomic_check()
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
 <20230310005704.1332368-24-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230310005704.1332368-24-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5LR_64ECN42tHPfE14iixYRuGjU75Xuv
X-Proofpoint-GUID: 5LR_64ECN42tHPfE14iixYRuGjU75Xuv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_13,2023-03-13_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=697 spamscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303140038
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/9/2023 4:56 PM, Dmitry Baryshkov wrote:
> Split pipe-dependent code from dpu_plane_atomic_check() into the
> separate function dpu_plane_atomic_check_pipe(). This is one of
> preparational steps to add r_pipe support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
