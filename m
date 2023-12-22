Return-Path: <linux-arm-msm+bounces-5867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4090581C706
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Dec 2023 09:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 719691C2225E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Dec 2023 08:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2007DD298;
	Fri, 22 Dec 2023 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Dj5wJ+5u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA54FBE5;
	Fri, 22 Dec 2023 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BM6MlFc028055;
	Fri, 22 Dec 2023 08:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=OL2XzN7EDGy5bMY0OFne4LQrBx0wrnoKoEQ7MaxQsXQ=; b=Dj
	5wJ+5uD6XqCemRRD726eiD+AjrvVMPe78wH2oRHtccab1hfsymipxD0S7olIP/G6
	rCtqNzwnmsFXGSeRgeWDTx3XP9p50EHFqkYyv/6DEjV/Ac3EvQPI12+5uThjhrYD
	2VFyxZwou2coHvvtJ2uTDmr7sbDr+Bb6pDvwbKNjunrz/i1wA22RDpnolGKR+vh+
	1LxJfHFL1Kv7/MovZQqLd3ifqhvJrSRYQYjVsNE2pWoisCEnWP82b4oRVCNCjC67
	LhcS/atzN9MsWLeR6bUZvN9bvwebCsye1pIm4IyW2NyK9Jl+nkLiSOfmFx1p2KAb
	KL6UlE8sAXNdZZ1YuUVA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v4xpq944q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Dec 2023 08:58:57 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BM8wuAh021049
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Dec 2023 08:58:56 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 22 Dec
 2023 00:58:50 -0800
Message-ID: <27f8bc0a-0262-48dc-a879-552c3c5ec9e2@quicinc.com>
Date: Fri, 22 Dec 2023 16:58:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] dt-bindings: display: msm: mass-rename files
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Daniel Vetter <daniel@ffwll.ch>, Rob Clark
	<robdclark@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>, Vinod Koul
	<vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd
	<swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        <linux-phy@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
        Andy Gross <agross@kernel.org>,
        "Krishna
 Manikandan" <quic_mkrishn@quicinc.com>,
        Kishon Vijay Abraham I
	<kishon@kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        David Airlie <airlied@gmail.com>, Rob Herring
	<robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>
References: <20231221102506.18320-1-dmitry.baryshkov@linaro.org>
 <20231221102506.18320-3-dmitry.baryshkov@linaro.org>
 <170319289437.96441.9965499072649831420.robh@kernel.org>
From: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
In-Reply-To: <170319289437.96441.9965499072649831420.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ck5j7imLKK1HMHeZYYRirQhcvywRSUYs
X-Proofpoint-ORIG-GUID: Ck5j7imLKK1HMHeZYYRirQhcvywRSUYs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312220063



On 12/22/2023 5:08 AM, Rob Herring wrote:
> 
> On Thu, 21 Dec 2023 12:25:06 +0200, Dmitry Baryshkov wrote:
>> Rename the Qualcomm MSM Display schemas to follow the main compatible
>> string instead of just using the block type. This follows the
>> established practice for YAML file names.
>>
>> Cc: Aiqun Yu (Maria) <quic_aiquny@quicinc.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/display/msm/{gmu.yaml => qcom,adreno-gmu.yaml}     | 2 +-
>>   .../bindings/display/msm/{gpu.yaml => qcom,adreno.yaml}         | 2 +-
>>   .../bindings/display/msm/{hdmi.yaml => qcom,hdmi-tx.yaml}       | 2 +-
>>   .../bindings/display/msm/{mdp4.yaml => qcom,mdp4.yaml}          | 2 +-
>>   .../msm/{dsi-controller-main.yaml => qcom,mdss-dsi-ctrl.yaml}   | 2 +-
>>   5 files changed, 5 insertions(+), 5 deletions(-)
>>   rename Documentation/devicetree/bindings/display/msm/{gmu.yaml => qcom,adreno-gmu.yaml} (99%)
>>   rename Documentation/devicetree/bindings/display/msm/{gpu.yaml => qcom,adreno.yaml} (99%)
>>   rename Documentation/devicetree/bindings/display/msm/{hdmi.yaml => qcom,hdmi-tx.yaml} (98%)
>>   rename Documentation/devicetree/bindings/display/msm/{mdp4.yaml => qcom,mdp4.yaml} (97%)
>>   rename Documentation/devicetree/bindings/display/msm/{dsi-controller-main.yaml => qcom,mdss-dsi-ctrl.yaml} (99%)
>>
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Nice to see names get more unified!

-- 
Thx and BRs,
Aiqun(Maria) Yu

