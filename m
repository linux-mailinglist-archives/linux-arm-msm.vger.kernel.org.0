Return-Path: <linux-arm-msm+bounces-39010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E599D7A4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 04:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 670B0281989
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 03:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127FD17BA9;
	Mon, 25 Nov 2024 03:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eNHKjN7G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5470B383;
	Mon, 25 Nov 2024 03:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732504445; cv=none; b=S9a6k8RgvvcwFrDqYgzNgt3K8nCw0yzsXi2ihd1tCRgE/j7/DIVjMsaFGW8d0KFe9UO4PZZ/GPDMbog4vxXGdaJXyPRqraa5nlx+VTBE91AuB5eG+qsJYrMVnkhzlIUELX3x1OwQOnArUoyDFbJ9dGHlvsheUKW4abyIvo97dXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732504445; c=relaxed/simple;
	bh=pTGYPFo6Z+TK+DkZv5Gs0AXghhwV5WfoXwoa6Z2dTlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=picf7ootnVVE3ePEDyE6R83Oi/HU3Mok9CYUWC08p3ag6Advy4jUFjXASniLVgfnYRh0oC4JfnJ6kdg6ddwcHvZvqYD5F+no3z2X0D/BbmHHt+TjATvLv0z67gWvDj7ywHH+fFUgKPJAfA5eC+VcXULmcGhISMxpyuXvxGNTZ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eNHKjN7G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOMPXIJ020204;
	Mon, 25 Nov 2024 03:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7srjLy0sYgJyfNZP7xTpyvhOJYgGenNW/olK9TK0sig=; b=eNHKjN7GZHe0ycf9
	fsqWwYO25NTC/pq7qZQ2zYmEUPX/YpXg3jAMCeifkMfGgCd5Yo377RlR4giQW9zE
	qlVvhuXPMTr1kTO/PFYXLHZV+uKRLsdsOMI+VEyjYiqFzkHwcK9cOklFrAI5Jj2f
	70cCZddp1IP7BfAp/3+I4XxxCzW4QpSS9qGk03XzJ5Vp8Wqh4JwHapovsi+RdL3m
	VRxqZxGSyPa1vQJrA6XQ49bk0pLn9iCMhPyezybLhVno9iSAd2Ayc+h13hKEbwRp
	WNELNhySunU91hHYveelVhiPICzWDP0z4JhoJrSL5haqPZkwGxs6dUNcy9cL3Heo
	rrrqUg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43387jb3mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 03:13:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP3Dec1023329
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 03:13:40 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 24 Nov
 2024 19:13:33 -0800
Message-ID: <5d4c8862-7b3b-49e3-93a9-93cc05c6e5ef@quicinc.com>
Date: Mon, 25 Nov 2024 11:13:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] dt-bindings: display/msm: dsi-controller-main:
 Document SM6150
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, "Li
 Liu" <quic_lliu6@quicinc.com>,
        Xiangxu Yin <quic_xiangxuy@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-2-35252e3a51fe@quicinc.com>
 <grizxfiq3zlquijtufhtjnnwlq2cl264ouzxrglroafreoujoz@lk2rjcaa6lxy>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <grizxfiq3zlquijtufhtjnnwlq2cl264ouzxrglroafreoujoz@lk2rjcaa6lxy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4eITDb8VK0_GLvFMgM0kYNdxcCHD8HuZ
X-Proofpoint-GUID: 4eITDb8VK0_GLvFMgM0kYNdxcCHD8HuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 impostorscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411250025



On 2024/11/24 0:28, Krzysztof Kozlowski wrote:
> On Fri, Nov 22, 2024 at 05:56:45PM +0800, Fange Zhang wrote:
>> From: Li Liu <quic_lliu6@quicinc.com>
>>
>> Document general compatibility of the DSI controller on SM6150.
>>
>> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> index b0fd96b76ed1376e429a6168df7e7aaa7aeff2d3..a7fbb5af4b0583e88ebcad07dd004046c38f95ee 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -30,6 +30,7 @@ properties:
>>                 - qcom,sdm845-dsi-ctrl
>>                 - qcom,sm6115-dsi-ctrl
>>                 - qcom,sm6125-dsi-ctrl
>> +              - qcom,sm6150-dsi-ctrl
> 
> This is incomplete change. Where is the rest for clocks? See entire
> file.
Got it. will add the clock part in the next patch as shown below
                - qcom,sc7280-dsi-ctrl
+              - qcom,sm6150-dsi-ctrl
                - qcom,sm7150-dsi-ctrl
> 
> Best regards,
> Krzysztof
> 


