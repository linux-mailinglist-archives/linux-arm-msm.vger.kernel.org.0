Return-Path: <linux-arm-msm+bounces-48485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7D4A3BB30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 11:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06EB1188F2FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 10:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C1E1D6DAD;
	Wed, 19 Feb 2025 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g5I03+4s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1F315B971;
	Wed, 19 Feb 2025 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739959646; cv=none; b=frzE/GvUnqy8nY2WZw4co117bgyCVal1nsg1RVp7EsLLpm2g9+h02RT6GU7BiFfzkVR0MkadrnyYtNRsbuvn78na88V6hWVlFR3bUUiK9XqJKxaGt/SAdDSVFTTTeYCm27/ASXE2shC3LfejcAQZl7DbV74CGEg6igqcjfTWdss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739959646; c=relaxed/simple;
	bh=RM5ziJiKirU80NiFUVgxodFGl6VFbTGrpJd98BJWNm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Lkvo0TKXa9mz10YiZraoEypnBJGw3u3qoJqwEDgxQ3zeY+mR31FB5EQuin2Txg3A0vJojOmqRRdlHvh1sRBbhtahtgtbKLsjmbQmvF1ybW/K7752SQKt8nCMT6etwCFO0jV5uyQlOg7/dx083k9vuxyOOnkW6jcQxgLS7BNUoF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g5I03+4s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J8GABm025577;
	Wed, 19 Feb 2025 10:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	migp/H6waSbZvABgFADiLiD2FdkHWrDuu/2RIFvQi+Y=; b=g5I03+4szlQ8eIIf
	0QXTwWOptjxco4sQWeneoDbsut/miXiKnjUv7tw9mw2PNgYkDADW9/U7sHItNh22
	5VoLmgq5b1Tf4CshsEHjhshgp3lu9N5F8+Tms9gEpfn7yYINMIa3KT2t7zqx6ODJ
	5spOktBRYAuGcu17I6FyCs72EEm21+Sc5N6hm2xUsWZilHwvuS/lrGzStW5QqZWp
	LoOoL9wxukF9bL6SZzgoYd+khGWehG2z1YgzLFRkBJ7kt58sRhwJW5LHe/WObjm3
	RdEI1h425Ge+Io1xnZ5wJH0Sf7fpROOwhXK/hMIq3/9MpgwaRVrlSIOGd2eOKTSt
	bygn6A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy0j23k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 10:07:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JA7Cuj000858
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 10:07:12 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 02:07:07 -0800
Message-ID: <3fff9266-fd9a-4c12-acfa-2ef953dabcdc@quicinc.com>
Date: Wed, 19 Feb 2025 18:07:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add MST support for qcs8300 platform
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <iwr7hcavp43u2yoif5fefd7y3q3rlfx73gxdyfotfuz5s2jalo@kzyt4kotpawh>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <iwr7hcavp43u2yoif5fefd7y3q3rlfx73gxdyfotfuz5s2jalo@kzyt4kotpawh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jxb780ZwJBVKNt9_WrwY58n12zUZx4_X
X-Proofpoint-ORIG-GUID: jxb780ZwJBVKNt9_WrwY58n12zUZx4_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_04,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=838 spamscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190079



On 2025/2/12 18:51, Dmitry Baryshkov wrote:
> On Wed, Feb 12, 2025 at 03:12:23PM +0800, Yongxing Mou wrote:
>> This series of patches introduces how to enable MST functionality on
>> the qcs8300 platform.
> 
>> The qcs8300 platform uses dpu_8_4 hardware, which
>> is the same as the sa8775p, but it only has one DPU. So it only has one
>> DP0 controller, supporting 4-stream MST.
> 
> This is irrelevant, unless you want to point out something else.
Got it.
> 
>> This patch only enables
>> 2-stream MST, using intf0 and intf3. The first and second patches are
>> modifications to the correspond dt-bindings, third patch is the dp
>> controller driver after not reuse sm8650, fourth patch is the qcs8300
>> dts modification which add the clk support for stream 1.
> 
> This is obvious. Really. Instead you must explain why QCS8300 isn't
> compatible with SM8650. How many streams are supported by the SM8650?
> 
Got it, will update in new patchset.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>> This patch depends on following series:
>> https://lore.kernel.org/all/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com/
>> https://lore.kernel.org/all/20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com/
>> https://lore.kernel.org/all/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com
>> https://lore.kernel.org/all/20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com/
>>
> 
> Please don't patches against series which were requested to be changed
> singificantly. Don't spam mailing lists just to be able to 'FROMLIST'
> them. Instead work with Abhinav to get this patchset integrated into his
> next iteration of the series.
> 
Emmm, got it, thanks for reminder. Will work with Abhinav to modify the 
MST patchset comments first. And then repost qcs8300 enablement changes.
>> ---
>> Yongxing Mou (4):
>>        dt-bindings: display/msm: Redocument the dp-controller for QCS8300
>>        dt-bindings: display/msm: Add stream 1 pixel clock for QCS8300
>>        drm/msm/dp: Populate the max_streams for qcs8300 mst controller
>>        arm64: dts: qcom: qcs8300: Add support for stream 1 clk for DP MST
>>
>>   .../devicetree/bindings/display/msm/dp-controller.yaml     |  5 +----
>>   .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml | 14 ++++++++------
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi                      | 12 ++++++++----
>>   drivers/gpu/drm/msm/dp/dp_display.c                        |  8 ++++++++
>>   4 files changed, 25 insertions(+), 14 deletions(-)
>> ---
>> base-commit: 7ba9bcc5090556c007d9a718d7176e097fe54f19
>> change-id: 20250211-mst_qcs8300-4c18a5179165
>>
>> Best regards,
>> -- 
>> Yongxing Mou <quic_yongmou@quicinc.com>
>>
> 


