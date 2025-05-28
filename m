Return-Path: <linux-arm-msm+bounces-59645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E0BAC5FCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 05:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 511D51BA2B11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 03:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A378218C01D;
	Wed, 28 May 2025 03:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="URsZhDuh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AA5C2D1;
	Wed, 28 May 2025 03:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748401345; cv=none; b=m87FTVmK2XiDKXkQeEtxHQFuOeqHlbbqZO6M/o7OnrmTzTWarGepvrLpx6G9gvFusU8DHES7jA1zmJB4QIsn8Y8+comaxmYLjGzB2/4kaqde6WnlbCMpM45wj+12zzDwkOA9257b+XcKeOC/Z363watiSOiiQd8i9ynh79AS9SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748401345; c=relaxed/simple;
	bh=V4N0QlLndwhp+7iGLidvA8gBZ3DccshhG6KBalwRhBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XhZXH/vA8uvFGTtMSR92prI03ZO7Z49lU7J5j4lUtW48sdpDCwleIakf67Ul8pEUYCJQ1+T+BHq2CwdfGJ4c40w+Wz3fFu77L6DotMhsiW9KUDMNBEziMaP1G/ZReV6pHjbDehU1lUWHANT7GlMprh6jm2ImqIpeNYSt0B2h4Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=URsZhDuh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RHTZp9028900;
	Wed, 28 May 2025 03:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aCmMZH6fVUihhyJ2gWZpLO2QRq9B2MY8JDD25Y0R9FE=; b=URsZhDuhvUuL/JXi
	VfY7jq1UDx6D3PhFt5iwI7kSD1zDQyupLfLlAq2STH+iMUSad+GGGFQ1mnNVHK5I
	KtN2YlF/FfO/5aeE3tp+8tSWBexs+MOjmYmEXSAn7l7tMqbtLlQoGWOeKbnGhqn7
	YKzw38deuWZYOSAsuOSXUNZbR7vDJTL8uWBSDX4+lzIjtoKJvKF12/KE7jjjBCJY
	WWANk8TVB8oh0ajq1kflO123iCobZxTOYkJjL34/a+swvjr8Vk+AFr8loSD+fPmk
	V53g217x44CeV+vWMhMtKC7XlG2froXZnijwsxqtPG/tc+3lAcySyxLY+dUPdEAj
	Ca6pTw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf16nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 03:02:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54S32Kdb008450
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 03:02:20 GMT
Received: from [10.133.33.76] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 27 May
 2025 20:02:16 -0700
Message-ID: <79f5e42f-f857-4247-abf9-d0f3f5c1a498@quicinc.com>
Date: Wed, 28 May 2025 11:02:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: disable the CTI device of the
 camera block
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Gan
	<jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250527015224.7343-1-jie.gan@oss.qualcomm.com>
 <5fbb515a-c3d0-4bbe-a689-41e730ecd952@oss.qualcomm.com>
 <9a156925-cf7b-4d2e-88a8-fdfed5528553@quicinc.com>
 <1fef810c-47fe-4f6d-95bc-0d72dbd63bf0@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <1fef810c-47fe-4f6d-95bc-0d72dbd63bf0@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=68367cbc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8
 a=lW3qVuOrv7gLkRXel_gA:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: 9scQjtoa8sGwS9-dGnfGdFggTEspXCb6
X-Proofpoint-GUID: 9scQjtoa8sGwS9-dGnfGdFggTEspXCb6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDAyNiBTYWx0ZWRfX7km28jnnQnbS
 vqHf0uAjZ2hi4Kg4Grrmwe/hsnmYrWO/iLoiKNN1cumsAVHVTXGquO/0CrbHSVlPMAllkN4V0lw
 wp6BHgW2SDA5OZsfaXmLvHnRx5/jbzSfVaUA1+ux3U9OojE5UKUUD0jbLwltUgEi1l52AhILB8a
 ui+BvQRI0Jd4X6TpjQNrPWgWtr79LSS6maXwJVkrHHoh9kvDspJM6O/a8RNTyz1972iYsZdd64F
 cTdGlpQjxkCOiwEfLxTWNhWXmYBA5e/Bq3mrY0Wa3btrD/pgUuCknqVgeCzS6AC9356eUgJ9eDF
 JnagxxpxyVYKpIXW4ZwlqIZePOpmX7Qpe8SrCSjfkvE1AkhMTo4b1g7JhH4kMOHOgzpjl+MV8Kj
 9hZwpqQQDzgHq+g2w0Ds1bWuch4pKGTA6KN26snlVmIWpcIj3S0WnIoDZWlQR1C/jgCD4zzl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_02,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=631 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280026



On 5/27/2025 6:41 PM, Konrad Dybcio wrote:
> On 5/27/25 12:32 PM, Jie Gan wrote:
>>
>>
>> On 5/27/2025 6:23 PM, Konrad Dybcio wrote:
>>> On 5/27/25 3:52 AM, Jie Gan wrote:
>>>> Disable the CTI device of the camera block to prevent potential NoC errors
>>>> during AMBA bus device matching.
>>>>
>>>> The clocks for the Qualcomm Debug Subsystem (QDSS) are managed by aoss_qmp
>>>> through a mailbox. However, the camera block resides outside the AP domain,
>>>> meaning its QDSS clock cannot be controlled via aoss_qmp.
>>>
>>> Which clock drives it then?
>>
>> It's qcom,aoss-qmp.
>>
>> clk_prepare->qmp_qdss_clk_prepare
>> https://elixir.bootlin.com/linux/v6.15-rc7/source/drivers/soc/qcom/qcom_aoss.c#L280
> 
> I'm confused about this part:
> 
>> However, the camera block resides outside the AP domain,
>> meaning its QDSS clock cannot be controlled via aoss_qmp.
> 
> Do we need to poke the QMP of another DRV?

The AOSS has a clock control register for all QDSS clocks. when we vote 
the qdss clock, the aoss_qmp driver will send a message to AOSS to 
enable the clock control register, then the clock control register will 
enable all QDSS clocks.

The QDSS clock is not a single clock source, it is a term that 
representing all the clock sources utilized by the QDSS.

Thanks,
Jie

> 
> Konrad


