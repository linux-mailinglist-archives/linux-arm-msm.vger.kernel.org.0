Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC887CB48C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 22:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbjJPUWg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 16:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232345AbjJPUWf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 16:22:35 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA9AE8;
        Mon, 16 Oct 2023 13:22:34 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39GJBxV9007547;
        Mon, 16 Oct 2023 20:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=yo/VcCytQZLCczrUcswAkWVFFEaQqipMLKsFZgqy1+k=;
 b=NDK+9ruQu38DXNu7ZWh0QZMfPInQzaAF5dRPFM7UEL3dCQx1ZIpVIYKNRLQ1ouxioZPh
 hMRYJvX6WUhz05mpOrhQrxm1JC6u8ODMofSSx0O1e8tbXxXCs54h35tD+EqylNk3veG8
 KYAO4jy1DXP+jxxphRwgECEltsJaZs4wd1MxcvjajXhl0rGohiUokaUHpYb5ZOaF4RLo
 aPorMaUB8CV927bn5hinZCQa4dwYJ4pDSJldkSCfL9cWHgYllPga2qyAJrGPih9UZQy9
 Aavw1k4P9hmjK4L/q/WntJLmMt5XE2grNQcN8XxTtJITW4mL6McvLEJkAHuxHzDRhDgh GQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tsb3xr5d6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 16 Oct 2023 20:22:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39GKMFlH021327
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 16 Oct 2023 20:22:15 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 16 Oct 2023 13:22:08 -0700
Date:   Tue, 17 Oct 2023 01:52:05 +0530
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
CC:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        <cros-qcom-dts-watchers@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        "Rob Clark" <robdclark@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sc7280: Fix up GPU SIDs
Message-ID: <opqdrmyj3y64nqqqmakjydn5rkspizufyeavm7ec7c7ufqz4wk@ey2a7bq3shfj>
References: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
 <20230926-topic-a643-v1-5-7af6937ac0a3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230926-topic-a643-v1-5-7af6937ac0a3@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: be6AiHNEdKzb1op1gFhqcd2WyzM30CHP
X-Proofpoint-ORIG-GUID: be6AiHNEdKzb1op1gFhqcd2WyzM30CHP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_10,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310160177
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 26, 2023 at 08:24:40PM +0200, Konrad Dybcio wrote:
> 
> GPU_SMMU SID 1 is meant for Adreno LPAC (Low Priority Async Compute).
> On platforms that support it (in firmware), it is necessary to
> describe that link, or Adreno register access will hang the board.
> 
> Add that and fix up the SMR mask of SID 0, which seems to have been
> copypasted from another SoC.
> 
> Fixes: 96c471970b7b ("arm64: dts: qcom: sc7280: Add gpu support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index c38ddf267ef5..0d96d1454c49 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2603,7 +2603,8 @@ gpu: gpu@3d00000 {
>  				    "cx_mem",
>  				    "cx_dbgc";
>  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> -			iommus = <&adreno_smmu 0 0x401>;
> +			iommus = <&adreno_smmu 0 0x400>,
> +				 <&adreno_smmu 1 0x400>;
Aren't both functionally same? 401 works fine on sc7280. You might be
having issue due to Qcom TZ policies on your platform. I am okay with the change, but can
you please reword the commit text?

-Akhil.

>  			operating-points-v2 = <&gpu_opp_table>;
>  			qcom,gmu = <&gmu>;
>  			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
> 
> -- 
> 2.42.0
> 
