Return-Path: <linux-arm-msm+bounces-44828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E4EA0AD9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 03:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D9C31651B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 02:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B938484A3E;
	Mon, 13 Jan 2025 02:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KS0DsQsM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB8C749C;
	Mon, 13 Jan 2025 02:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736737179; cv=none; b=aYAvb/nb14xd2DG46bwSSM6INlyn8OJW0sENDOWZwlbWsiKRjvHFkMDml5HaFLCa4aPp/qYRG1J+t2YsdBLk0lVRZB65x1LisSMa4qnkU4mtTr9tmi1D/LmYrrccJCWtgyxmz4V+G7KlplNkQ6RL6qwZuafvdpTzlJUNGEXKK9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736737179; c=relaxed/simple;
	bh=BcAl9u+K5vYiMaqtPIMLtTKIylCdEyNnUF/i4eAGuOY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=P396GkSV3hSbwD8MFcaredaFlr47FXfz4tnc0xWG+KJqRz8lM/PuvE9QBcPoImCcJ0tWyP8Hcg1xE5giz/psQ7pua+FvRYMF2ekNVFRPP1ObUkZ8P4vJcLMFthfmDP8lJs/7/8mwvewTR6e7JJNgDiSAe0yfnPTEjUcB0D0t5VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KS0DsQsM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D2sIJO030898;
	Mon, 13 Jan 2025 02:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rw1HisMX7BaCF0HZd08xQbXqYY/N4Tw0QDxlmJ/5qaU=; b=KS0DsQsMwQR9cMV0
	bNYkzdEfZzhLu0lJN8LmQw8OQLp8MeR7eZeKyMadG/bps2Iu9Rdn8BzbkrJloZJr
	h9PEr+yE2qXvNfiozIiibNpRv9678N0PNVAwtwT8iLeqYBfTs5TGrnNp7tsfPELy
	OucNqR+QqJQj4QJonwYf2HnSbX78yZKZDIL8ynAqmVGcQ6h68HTijnJPeioPHy5U
	5uWGVoZVZK1fSurbAxB9VBLrGnD/72/f7NLrQQTUMOQExQZmBjGCVT3WHPlvF8DP
	Oi7jVQTxAhIsRTiU23jk2wkWzWqWo4r4GK06TVRBS+rl7RbP1s1uQlogYBj+qxmR
	VDQAmQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444tevr0c7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 02:59:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D2xDuY019382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 02:59:13 GMT
Received: from [10.64.68.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 12 Jan
 2025 18:59:06 -0800
Message-ID: <c1128991-29fe-47e2-887e-10f63cb4f7f5@quicinc.com>
Date: Mon, 13 Jan 2025 10:59:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v4 0/3] Enable UFS on QCS615
From: Xin Liu <quic_liuxin@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <quic_jiegan@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <quic_sayalil@quicinc.com>
References: <20241216095439.531357-1-quic_liuxin@quicinc.com>
 <173631142070.110881.10056360680137751835.b4-ty@kernel.org>
 <6292f709-ca4b-423f-8d78-e7e0531b3026@quicinc.com>
In-Reply-To: <6292f709-ca4b-423f-8d78-e7e0531b3026@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GQaxR1X0zUXOyUkGHu0vCt0EOlg2OMFb
X-Proofpoint-GUID: GQaxR1X0zUXOyUkGHu0vCt0EOlg2OMFb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxscore=0 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130023

I mean the modification of binding.
dt-bindings: ufs: qcom: Add UFS Host Controller for QCS615

https://lore.kernel.org/all/20241216095439.531357-2-quic_liuxin@quicinc.com/

在 2025/1/13 10:02, Xin Liu 写道:
> This patch has been reviewed one month ago, do you have any other 
> comments? Thank you very much.
> 
> https://lore.kernel.org/linux-arm-msm/20241216095439.531357-2- 
> quic_liuxin@quicinc.com/
> 
> 在 2025/1/8 12:43, Bjorn Andersson 写道:
>>
>> On Mon, 16 Dec 2024 17:54:36 +0800, Xin Liu wrote:
>>> From: Sayali Lokhande <quic_sayalil@quicinc.com>
>>>
>>> Add UFS support to the QCS615 Ride platform. The UFS host controller and
>>> QMP UFS PHY hardware of QCS615 are derived from SM6115. Include the
>>> relevant binding documents accordingly. Additionally, configure UFS- 
>>> related
>>> clock, power, and interconnect settings in the device tree.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [2/3] arm64: dts: qcom: qcs615: add UFS node
>>        commit: a6a9d10e796957aefbc4c8d53ed7673714e83b31
>> [3/3] arm64: dts: qcom: qcs615-ride: Enable UFS node
>>        commit: 4b120ef62ed653f4bc05e5f68832d2d2ac548b60
>>
>> Best regards,
> 


