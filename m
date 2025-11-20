Return-Path: <linux-arm-msm+bounces-82619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FF9C72848
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 08:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id F35122C1BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 07:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DB12FE593;
	Thu, 20 Nov 2025 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iet7WMen"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6E32FCC13;
	Thu, 20 Nov 2025 07:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763622585; cv=none; b=In1satkrAXhSTRWnAZPGHVJL3jyJvdfcBHlmpBfvZOtZ6NfTNT4dm9euEG8/n3kL/6HBrcVMdWVPPaXWH/IKQAOHQyxs+uY9/AHI5DjOHYJzfeNRVUzV7OgxhAfGzzVQGMSf8Jxvt/9vmaFEY8gMfgZ2YYa5broU56eOpCmSUgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763622585; c=relaxed/simple;
	bh=OStGifVzhkARSAhL+PFKBpLVy7fSkuiBT/TKf2W0MDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Zjvbv9rNHN2ckvuP3CEYYgAlEwCL7fFW4cQDx0RSRi1Gab6aujMsUJgAG+bys+Pi1Po8L2PYEOfPPDdotJABCx/SLhy3UIC0bh/LlXqWPT8Mo4PBYvZWL2V0LYEVoNHjOGzI5WBcuCOUiWqk9zILB9MhfhsKtYefAWuhmuvJRzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iet7WMen; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4ppPg3844053;
	Thu, 20 Nov 2025 07:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jJoy5MQod7N9mees7dxVFCvLmRHyyJmynYXyKNAX098=; b=iet7WMenMr0/a/CS
	1ZgmVYupk9R7lukddDfwggPrcago1oI2b+SZ5UTmD4gTj6kvnymxXQlJTouhIlHb
	K1B2DpSesP8fimP2F+u05/ayEaT7CuXzH1OGZLNKc6IIAc3CplznIZljwenRayee
	8C6NKiPaCiHUCBMbTaVDewQZcPvHQIWwy/kiJxfYnMGdEgAv0IrA54/X8xp6jqfZ
	AKQVJpTwspNQmVFg4lU3oelKhOqy8QQKssS637gQeEFlfZx7ivUtYDF9WIxJ1VGI
	/WHJ3vsVY4rPafqqO1Ul8HUntvD9BArcPl9mZYbqI5uen05jNyifp4D9ib5E/LnL
	S0UmNw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahdpr320m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:09:03 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AK792TZ015417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:09:02 GMT
Received: from [10.204.78.57] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Nov
 2025 23:08:55 -0800
Message-ID: <655305dd-50a4-48c8-8ba5-a93ed46b36ed@quicinc.com>
Date: Thu, 20 Nov 2025 12:38:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Enable mdss1 Display Port for Qualcomm lemans-ride
 platform
To: Bjorn Andersson <andersson@kernel.org>
CC: <dmitry.baryshkov@oss.qualcomm.com>, <marijn.suijten@somainline.org>,
        <swboyd@chromium.org>, <mripard@kernel.org>, <abel.vesa@linaro.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <robin.clark@oss.qualcomm.com>,
        <jessica.zhang@oss.qualcomm.com>, <abhinav.kumar@linux.dev>,
        <sean@poorly.run>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <alex.vinarskis@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <freedreno@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>,
        <quic_riteshk@quicnic.com>, <quic_amitsi@quicnic.com>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <b26devgysl3s2tc5gncmpwsq57eyjtcdqzidt3c4bauw24kosb@chmgunmg6iv3>
Content-Language: en-US
From: Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>
In-Reply-To: <b26devgysl3s2tc5gncmpwsq57eyjtcdqzidt3c4bauw24kosb@chmgunmg6iv3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Uq5u9uwB c=1 sm=1 tr=0 ts=691ebe8f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vDrjvunVpv-7mF6DcdYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA0MCBTYWx0ZWRfXxHuxHuRAPPQw
 tyrEx/of8zSqDF9HRWV83PnuWDhfAsG+8yS92e6OOgWrhsw2ZcdOxVgRy8gxvMeQlp7gbFrjN5K
 Mnq5MwTrRYeJWwE3DrrQasKpFKIhVrnoOmNMdKcIy1MlJAbZ5dV3WmV3eUb8eYIhIwpOMDTdwCu
 rbj7iVFzfOdGV1TCdZRcv3OelGKsdP/DpdAi8F5Ms75smLvZtMOuWnsTKKccpI/SNR48P/tK30j
 jD7n75jB+pr80wROG5G0xYuoL8kg1DaZRbqTug2VfbCk/9T1EgpZzYv/oAwLPYfZ6d1mqk2ujPr
 jLmNmf0y9e63YGCH72ZjDOQkBYuEK+mrTrCDtxg0kStlSiUGXeF6WHkHpY/yej0cjOjjvsbfdo6
 harBap8qePNBkpE7J9g5ANXccgal5Q==
X-Proofpoint-ORIG-GUID: GsDKYUxhTje2htrS_yvf4HrGHAVJrwWT
X-Proofpoint-GUID: GsDKYUxhTje2htrS_yvf4HrGHAVJrwWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200040



On 10/18/2025 4:21 AM, Bjorn Andersson wrote:
> On Fri, Sep 26, 2025 at 02:29:52PM +0530, Mani Chandana Ballary Kuntumalla wrote:
>> This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
>> on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
>> lemans-ride platform.
>>
>> ---
>> The Devicetree patches are dependent on following patch:
>> https://lore.kernel.org/all/20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com/
> 
> Include that patch in your series instead of relying on the community to
> resolve your dependencies, please.
> 

Sure, we will include in the next version.

