Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03FB165719F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 02:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbiL1Bhg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 20:37:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232412AbiL1Bh3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 20:37:29 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC6C91F4;
        Tue, 27 Dec 2022 17:37:28 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BS1R4iL017686;
        Wed, 28 Dec 2022 01:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EtQgIDvKrvyHmtio3MslDG+WSNFv2qz7IHi4lqsPyIA=;
 b=RXs/YccymCgepIvT8lOyxHm0td1w0KFI48IZmCEo8f5d0DDcDDe9ZLQ5Vvy8+VMl3q8i
 d7UhoXnOYO9YXNMJWHhuQjljwQkcLSDq9o9KSBC+UcUOfgX9//t/pUP4jEjGZJqMVknS
 fgjA1P3PLvvw2p9DtFk5GVSFS9ajCwcC32yiembKAmrSGlB4GJAQlAmIJkuU5tqVDdaz
 AO9A4q0xRP6ZTUjIfOkjJHWBlxZuIRlSIWoMLT/quqAr4fR5WzNRvd3XulvUAWJXl9j0
 1/Mr5lHWo0Pl0/fu6GuDT7sWWoK/grJS5X+nEXXmKzKy8RgS46HbdX+wsDxu/UAkxRsj 0w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mr1r1h4d6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Dec 2022 01:37:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BS1bFnR004746
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Dec 2022 01:37:15 GMT
Received: from [10.110.12.185] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 27 Dec
 2022 17:37:14 -0800
Message-ID: <e4d8d393-c940-d322-ef19-92393515f4ef@quicinc.com>
Date:   Tue, 27 Dec 2022 17:37:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] dt-bindings: msm/dsi: Don't require vcca-supply on 14nm
 PHY
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC:     <patches@linaro.org>, Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20221130135807.45028-1-konrad.dybcio@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221130135807.45028-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e2ae_V3ReDy4r0afdqyLoT5y5ZIezzZN
X-Proofpoint-ORIG-GUID: e2ae_V3ReDy4r0afdqyLoT5y5ZIezzZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_18,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 mlxlogscore=906 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212280009
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/30/2022 5:58 AM, Konrad Dybcio wrote:
> On some SoCs (hello SM6115) vcca-supply is not wired to any smd-rpm
> or rpmh regulator, but instead powered by the VDD_MX line, which is
> voted for in the DSI ctrl node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Fixes: 8fc939e72ff8 ("dt-bindings: msm: dsi: add yaml schemas for DSI 
PHY bindings")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> index 819de5ce0bc9..a43e11d3b00d 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -39,7 +39,6 @@ required:
>     - compatible
>     - reg
>     - reg-names
> -  - vcca-supply
>   
>   unevaluatedProperties: false
>   
