Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D47D6D2C3B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Apr 2023 03:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbjDABDV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 21:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232373AbjDABDU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 21:03:20 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E0F31206C
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 18:03:20 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32VFZICO001913;
        Sat, 1 Apr 2023 01:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1xMS8OLByiO+4EMAJRvJ9BVxGS9UI6mUItK9ZC+Ql3c=;
 b=S1WA+5LBc7yE0FKmzxxBfZ7suyn2hTUs4GYIASYRBwlU+rk0kAV+FCnFcwBxYZu4IFVJ
 LX7Y2NMSv27RlvWT9Wud6b8FraHw8dYah2o5eQWGMAit1ctz/fbBu6QuBuLJWADZkNzQ
 Wb+H/RaMse6abukRoHPco75aGSgktfjsRqUePTh5lG/Sul84cB5nsicChoBGRCj9NSVa
 Xe3vdVtXq8PyfBFPYOLqwoJarNkx+BiBGWdzeYykrjFRV0jT90MiKtFXjh5EE8IfJgbu
 YqiiMyMd/xOtTnEB5KQvetw/dBSkRqnoPIfUXz+kUsvQ4+q7DBTSfeDiwT88247x1Q+h xA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pp29ssax3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 01 Apr 2023 01:03:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33113DZU006494
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 1 Apr 2023 01:03:13 GMT
Received: from [10.110.53.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 31 Mar
 2023 18:03:12 -0700
Message-ID: <1b99dbef-692c-7151-e713-9fa87c1ff1eb@quicinc.com>
Date:   Fri, 31 Mar 2023 18:03:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 03/38] drm/msm/dpu: mark remaining pp data as const
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
 <20230330215324.1853304-4-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230330215324.1853304-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -tU-pvUiEh4h-NK0IPkMNa2boS0asdfO
X-Proofpoint-ORIG-GUID: -tU-pvUiEh4h-NK0IPkMNa2boS0asdfO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=837 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304010007
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/30/2023 2:52 PM, Dmitry Baryshkov wrote:
> Fix several leftover _pp strutures and mark them as const, making all hw
> catalog fit into the rodata section.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
