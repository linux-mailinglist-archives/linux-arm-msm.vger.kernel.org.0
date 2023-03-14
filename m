Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58FA76B89E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 05:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbjCNEuT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 00:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjCNEuH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 00:50:07 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D761043D
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 21:49:53 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32E3Yjhs013206;
        Tue, 14 Mar 2023 04:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7QqZE0z2xs+bwv+RIeWA877o5bGe5tx466u0HxZW4oA=;
 b=E53mvIGzBzGVe7O6Hzy2xyUr3u8oGQmuYkVFPJjpjZHFw/sSMkfRw6affAqrQTLq8Ogf
 gTfCW4KrM+ed2Lbo/beZVm68KDAXIf4SF6YUR2i4KhO8DeVCl98PheWREEr8jiKJ85bQ
 ERADR7qichfRFMUo7VFL52imkcf52sLEtrZRrhrMDbMVGFstuj5mjvJ+apIKunqQUs5W
 3GKd8yNLhps6KRtMcfDUvRUyGtSdk8spCOF2I0RG8R6okeng4/BRuVzTQJfsrQYELxoU
 TVrqtMtBFRddlGGorcKGuKN8MBXFDwLSYJOVnjFr4UYa6EhbiSHt9mJwW4AImOiztBso 2Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pa40pj6wf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 14 Mar 2023 04:49:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32E4nk7F004551
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 14 Mar 2023 04:49:46 GMT
Received: from [10.110.64.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 13 Mar
 2023 21:49:45 -0700
Message-ID: <3d7212a9-8f26-3427-83e5-21fd5234351c@quicinc.com>
Date:   Mon, 13 Mar 2023 21:49:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 28/32] drm/msm/dpu: populate SmartDMA features in hw
 catalog
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
 <20230310005704.1332368-29-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230310005704.1332368-29-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GJBqt88jKdIQBDsQwr6xoEjcJbC_MWBx
X-Proofpoint-GUID: GJBqt88jKdIQBDsQwr6xoEjcJbC_MWBx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_13,2023-03-13_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxscore=0 suspectscore=0 spamscore=0 clxscore=1015
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=804 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303140041
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/9/2023 4:57 PM, Dmitry Baryshkov wrote:
> Downstream driver uses dpu->caps->smart_dma_rev to update
> sspp->cap->features with the bit corresponding to the supported SmartDMA
> version. Upstream driver does not do this, resulting in SSPP subdriver
> not enabling setup_multirect callback. Add corresponding SmartDMA SSPP
> feature bits to dpu hw catalog.
> 
> Per Abhinav's request enable the SmartDMA features only on the platforms
> where the multirect was actually verified visually (sdm845 and sm8250).
> An (untested) enablement on the rest of the platforms comes in the next
> patch.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks for splitting this up.

Strictly on the basis of your validation of these chipsets, this is

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

