Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE6FE6E028E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 01:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjDLX1c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 19:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjDLX1b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 19:27:31 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2253B59E1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 16:27:31 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33CMNRGH032467;
        Wed, 12 Apr 2023 23:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=P4Fkaby+GYnp68YCJrDFElPHEolJ3pS9mh61d7u/CbQ=;
 b=iM5D/Ebnq7WNC+xv21vePFFsDPA3N8od02KQ3mVS+mHrIQQU3QdKDR4a/0ud5aX0wASA
 OfxntUn81Zso7xUubMv9QB9Fir6yPUYkSrdesWRmiEVW/KPdDe9URQ1vFjN1P6ISIbW5
 j/FgRf4YxwpHMwDmAm4Uxl4jyhI+NrhhCO+qziB9AVwfWZvPv23NMIkdHp2NSh/mvypq
 G0ehxG1pItJPmI2JRPZ/OAgplwLcTItE7tsUt56WwQu5eBETxKPoxskyGB5JOi0nWD0+
 xxHkhmN49+znwNOHyCJnoA3WvAjzid7lGlDykVFapFl/bvkEagi/o9bBZs/9BRVIMToy 7w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pwqn1hyv5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Apr 2023 23:27:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33CNRMkc009248
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Apr 2023 23:27:22 GMT
Received: from [10.110.73.215] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 12 Apr
 2023 16:27:21 -0700
Message-ID: <b897f29d-0ae6-1aef-0f3b-7bb653da64f4@quicinc.com>
Date:   Wed, 12 Apr 2023 16:27:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v6 1/7] drm/msm/dsi: use new helpers for DSC setup
Content-Language: en-US
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <freedreno@lists.freedesktop.org>
CC:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean Paul" <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20230329-rfc-msm-dsc-helper-v6-0-cb7f59f0f7fb@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v6-1-cb7f59f0f7fb@quicinc.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v6-1-cb7f59f0f7fb@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d4NAW_B6YLJHA8ysPHlmfhEO4MNfR4sl
X-Proofpoint-ORIG-GUID: d4NAW_B6YLJHA8ysPHlmfhEO4MNfR4sl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_13,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=707 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120197
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/12/2023 4:25 PM, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Use new DRM DSC helpers to setup DSI DSC configuration. The
> initial_scale_value needs to be adjusted according to the standard, but
> this is a separate change.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---

For completeness,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
