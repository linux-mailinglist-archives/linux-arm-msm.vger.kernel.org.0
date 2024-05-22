Return-Path: <linux-arm-msm+bounces-20256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4EF8CC669
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 20:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65C62B20F61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 18:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F5F1420D2;
	Wed, 22 May 2024 18:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RvPZuozD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629C6145FE4;
	Wed, 22 May 2024 18:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716403118; cv=none; b=o/7Fla2mBzYHidqjWiPE9tMvfkM4LeF6fAQFu4hr0bEkESzQuS6xi7/1rY6iuvGQdZBnUOtgeCkrynrL5XU+wT42OnqC2x89apOJjvL0+yAWtPS/ub1DIQ15Z3Tyma2DbEZ9V6TLper1+0/mQGly1X4GJMNigFlC/ZBXMVcZvo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716403118; c=relaxed/simple;
	bh=RNM806O3J8f0Tm76QANe8wZ+o1o2IaoR1IzwSrbDLf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cdnX165+V2mGwHTXq03I8kJMNPbHB7CQ7X4Ok4E+I7w0J6isBe+o2vZe2W7WPmC+P0OWq/EwOD3F2Od2wUMkpkVFulvHOELJTAHMNYqHM7Ah8nM/ZzZ5R4IQs+f5cxxRY0uJQRiW/F4Iir9NR4rbsUMyGn5XkjdEcrmaHQWvgtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RvPZuozD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44MIMbWr019783;
	Wed, 22 May 2024 18:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=KVRe2VPlKZGSHE0LMdoBZq5Vjh4S4u+2E7oFH+v9Vcg=; b=Rv
	PZuozD8jORLBPZ+F1FkQGCENdGHL1YmwWTCOJmcyiapkgrLePQbM0VqsnwLytB12
	5fM+/qWSJuJnnEqNJZ2PByOo+cNrqtMvdeteeXyxIgZkmJz+u4N7fq2uYvZ1BBI5
	TmGYdClsWQWcZPG4gMiAnKcuf0/E0OHhLovrPQcl3bFb81/HRGov0XiHfhVoCehl
	VY48XA/cW3dJztJOtUgzjpwe8JL4h/y2Nn0kTVNHfIsD/6wzltku0l18plRX1kld
	Q7lkSorexcXuHQ9QcYl8AG82moFj0+CWUMB0JRohGx3PPirM7JfxC7H0mHu+piCj
	14JP2F8V9yZJIid/KvpQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pq5hs1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 18:38:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MIcKUA027237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 18:38:20 GMT
Received: from [10.110.28.32] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 May
 2024 11:38:19 -0700
Message-ID: <224fa477-07ba-e7b2-2f7d-8f7d21f4a0c7@quicinc.com>
Date: Wed, 22 May 2024 11:38:18 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/7] dt-bindings: display/msm/dsi: allow specifying TE
 source
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xY0g3hi8saRarFUOzdkRh9Z2MYspYdxS
X-Proofpoint-ORIG-GUID: xY0g3hi8saRarFUOzdkRh9Z2MYspYdxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_10,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1011 mlxlogscore=999 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220128



On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
> Command mode panels provide TE signal back to the DSI host to signal
> that the frame display has completed and update of the image will not
> cause tearing. Usually it is connected to the first GPIO with the
> mdp_vsync function, which is the default. In such case the property can
> be skipped.
> 

This is a good addition overall. Some comments below.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../bindings/display/msm/dsi-controller-main.yaml        | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 1fa28e976559..c1771c69b247 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -162,6 +162,21 @@ properties:
>                   items:
>                     enum: [ 0, 1, 2, 3 ]
>   
> +              qcom,te-source:
> +                $ref: /schemas/types.yaml#/definitions/string
> +                description:
> +                  Specifies the source of vsync signal from the panel used for
> +                  tearing elimination. The default is mdp_gpio0.

panel --> command mode panel?

> +                enum:
> +                  - mdp_gpio0
> +                  - mdp_gpio1
> +                  - mdp_gpio2

are gpio0, gpio1 and gpio2 referring to the vsync_p, vsync_s and vsync_e 
sources?

In that case wouldnt it be better to name it like that?

> +                  - timer0
> +                  - timer1
> +                  - timer2
> +                  - timer3
> +                  - timer4
> +

These are indicating watchdog timer sources right?

>       required:
>         - port@0
>         - port@1
> @@ -452,6 +467,7 @@ examples:
>                             dsi0_out: endpoint {
>                                      remote-endpoint = <&sn65dsi86_in>;
>                                      data-lanes = <0 1 2 3>;
> +                                   qcom,te-source = "mdp_gpio2";

I have a basic doubt on this. Should te-source should be in the input 
port or the output one for the controller? Because TE is an input to the 
DSI. And if the source is watchdog timer then it aligns even more as a 
property of the input endpoint.

>                             };
>                     };
>              };
> 

