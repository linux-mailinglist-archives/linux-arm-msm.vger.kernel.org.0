Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2777320AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 22:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjFOUMI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 16:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234048AbjFOUMD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 16:12:03 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A55432D4E;
        Thu, 15 Jun 2023 13:11:47 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35FJu9tT031635;
        Thu, 15 Jun 2023 20:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=kIRTN6UrVIS2yHQZ2vEzLvG3wl4ylStlzjDH/RNZQ8o=;
 b=aujoH7/UAhnbayh8QlSM/7fj3tBYoBIEdZLoiZ5gNls1L2pdIx6I4UAesS81N1Mkq7/n
 uDA5JXR5PZd0aC12tw4CPLM9tESbbrxpqZHyFjpoD3qcSzJctBIC75TR0a9lu9UAXvmf
 ZKwGH8ot3IcHAzCwZ4bATi1wg2SLdwgNOv2T+wrqN+en0szHDBdZL81tqOJNBCTh5nF8
 tbFWN8rmw4XBBFJyeHqdOnZqPvW2HjsZYl/UPU8QoqOKFekJO7uAODSfWqWDatDybRjs
 c82+QbrvxhCJBhXN3ARwhM8Y3ogSbrxziy/iTXgkBlBSpg9GP8V+ULwIsZehJMljdo/3 AA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r7p4qaj20-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Jun 2023 20:11:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35FKBXLc002978
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Jun 2023 20:11:33 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 15 Jun 2023 13:11:28 -0700
Date:   Fri, 16 Jun 2023 01:41:25 +0530
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
CC:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v8 07/18] drm/msm/a6xx: Add a helper for
 software-resetting the GPU
Message-ID: <rd4mte26n22xlgx5umerpgr66b4wfi7mdm6ovszafyinrg3q4c@g227oj3nh2vc>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-7-69c68206609e@linaro.org>
 <jplt5g5xuphbnci73pdtaxd63fguxtgtp4c37kc7ehavzrjbau@kamshezxnvgy>
 <001d7571-5e9f-4f60-f6d0-35806a3e51c5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <001d7571-5e9f-4f60-f6d0-35806a3e51c5@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PiBZfZ9M9EfnFAoxAGTWvrdGWLXTpbNJ
X-Proofpoint-ORIG-GUID: PiBZfZ9M9EfnFAoxAGTWvrdGWLXTpbNJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_15,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150173
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 15, 2023 at 12:34:06PM +0200, Konrad Dybcio wrote:
> 
> On 6.06.2023 19:18, Akhil P Oommen wrote:
> > On Mon, May 29, 2023 at 03:52:26PM +0200, Konrad Dybcio wrote:
> >>
> >> Introduce a6xx_gpu_sw_reset() in preparation for adding GMU wrapper
> >> GPUs and reuse it in a6xx_gmu_force_off().
> >>
> >> This helper, contrary to the original usage in GMU code paths, adds
> >> a write memory barrier which together with the necessary delay should
> >> ensure that the reset is never deasserted too quickly due to e.g. OoO
> >> execution going crazy.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  3 +--
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++++++++
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
> >>  3 files changed, 13 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >> index b86be123ecd0..5ba8cba69383 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >> @@ -899,8 +899,7 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
> >>  	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
> >>  
> >>  	/* Reset GPU core blocks */
> >> -	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, 1);
> >> -	udelay(100);
> >> +	a6xx_gpu_sw_reset(gpu, true);
> >>  }
> >>  
> >>  static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> index e3ac3f045665..083ccb5bcb4e 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -1634,6 +1634,17 @@ void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
> >>  	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> >>  }
> >>  
> >> +void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert)
> >> +{
> >> +	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, assert);
> >> +	/* Add a barrier to avoid bad surprises */
> > Can you please make this comment a bit more clear? Highlight that we
> > should ensure the register is posted at hw before polling.
> > 
> > I think this barrier is required only during assert.
> Generally it should not be strictly required at all, but I'm thinking
> that it'd be good to keep it in both cases, so that:
> 
> if (assert)
> 	we don't keep writing things to the GPU if it's in reset
> else
> 	we don't start writing things to the GPU becomes it comes
> 	out of reset
> 
> Also, if you squint hard enough at the commit message, you'll notice
> I intended for this so only be a wmb, but for some reason generalized
> it.. Perhaps that's another thing I should fix!
> for v9..

wmb() doesn't provide any ordering guarantee with the delay loop.
A common practice is to just read back the same register before
the loop because a readl followed by delay() is guaranteed to be ordered.

-Akhil.
> 
> Konrad
> > 
> > -Akhil.
> >> +	mb();
> >> +
> >> +	/* The reset line needs to be asserted for at least 100 us */
> >> +	if (assert)
> >> +		udelay(100);
> >> +}
> >> +
> >>  static int a6xx_pm_resume(struct msm_gpu *gpu)
> >>  {
> >>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> >> index 9580def06d45..aa70390ee1c6 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> >> @@ -89,5 +89,6 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu);
> >>  int a6xx_gpu_state_put(struct msm_gpu_state *state);
> >>  
> >>  void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
> >> +void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert);
> >>  
> >>  #endif /* __A6XX_GPU_H__ */
> >>
> >> -- 
> >> 2.40.1
> >>
