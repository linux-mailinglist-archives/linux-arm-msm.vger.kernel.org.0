Return-Path: <linux-arm-msm+bounces-55757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE69A9D274
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D19E79E2B22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEC221CC59;
	Fri, 25 Apr 2025 19:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dk1kinGB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5F818DB02;
	Fri, 25 Apr 2025 19:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610875; cv=none; b=DkK0AU8o9AevUT07gI0UVg8mvczNACEw0xk52XtBHzBCHXv2/erPWCAwdXqoCjLEzbTarGZKXjIHF6P2rM4Hv5aWR4YlNjg/mTqy1gWdg9qjbW3FV67/PkyJQNDAjw6WajjX99VRTvdEsEvR/dPNZHdM8dlzpXUXQAfBB/fk8UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610875; c=relaxed/simple;
	bh=3LQMljLX6K+JGwy9o+ZtV0Uxjli/3SDiY1ljFgZXVMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dj9qtIkkGEmASJUD5ANAVGRm0xMtrI1MB/fSfFMJKK8NniXZXtLj8Hmezwg6z3TZLMXJGKCJcWbjm8xPdkxEBhH9Gy4plWvUtTdv0OVwdb/hgCmBhhMTG68oRxBLC6VAia6UYmWFhdZICE/3mr/eOl1xQrWkBJ0Rg5Krn/tlGNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dk1kinGB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJtCd007904;
	Fri, 25 Apr 2025 19:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Chgmk99tO/McfpVRdz6Lyu2k+jP3vCElNSk20yge45Y=; b=dk1kinGBy9ZiQluE
	Mrer4hN8gbaDLZ0rB/BvaOLAbAdr0SvqHZkmrwX0fl7o0xmpcvukJf5JOAnf0nHJ
	SWkOvVhxs/Mahnt/Pe8PwfYWQqbr69unqBX7nTdxoZjfGTG+PjEJrIhU2j0Vcd7F
	Vo9eSGMYLDla6O5WUTQGSbs+orPWev26Xa+0pFJzO0b052iS117CQbI67QfftVon
	wsQPk0QpvY0tMrb9BEZkPoQwpqZRDMeZ/e3XbNEyWIVt+mUTG/xGK/Z8W/U6azpt
	mDFsHnrcAxzstwXf56B5QbtjTOgfp+9+YX6ipHUjwmlp78L3WBz9/4nnVuo1Bx3w
	YxiTnw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2j7kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 19:54:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53PJsS5r020895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 19:54:28 GMT
Received: from [10.110.43.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Apr
 2025 12:54:27 -0700
Message-ID: <d1e71406-d759-4444-8a82-7f809abe1cf9@quicinc.com>
Date: Fri, 25 Apr 2025 12:54:25 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP 0/4] arm64: dts: qcom: sm8750: Enable display
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang
	<jesszhan@quicinc.com>,
        Abhinav Kumar <abhinavk@quicinc.com>,
        Abel Vesa
	<abel.vesa@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <w6f3s56gx7psqgweuntqvkzrot7elhc5pdrxhvenukzwyt5eys@fndmaszfbo5k>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <w6f3s56gx7psqgweuntqvkzrot7elhc5pdrxhvenukzwyt5eys@fndmaszfbo5k>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Hn7QpiK8f0H_uERz5NnN1coudrsaVS7y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MiBTYWx0ZWRfXzZKNVSJDL8op 1gSndp0jcbmgFN8XptSjIehoXgDwmAYvqhc4Rs/1uY2qy7Io06M2QYLwdfly1pL8TWcZenPNEEP 6AA4XzWFDb6Dgut/3AMrqohAT9Mt4Fu43T/7XoB5erMQwS0N4Xg0a5o+j3vQ+8hYAJiQ75ncWOL
 KDQrLi991ZispVaVrFAtYR76fFyVq9nFR90MfsAkMWUbYc7uQIJqtchfzuCC3NMabdC5MJE0DuV aHRNzKZEhRrVo1ONlhCKBv8VNqCEGLKkNBCbOkbi6Ql4zxyhZY+44zRbHj08UAApQt3Yna6mvA8 UlJmKkJk5i7qDBZEoJxGHAJJBMMJOVJ2uJ/HjIJUAVRIDg1wEbFgyL8fMUHjzvLaF2V6Xj91PPa
 VAaNz8qlWPRYuyiJO0RlYa+3dxaCMYouausVpL8nxzAQy9zqztXTDnm3gayi/XOJgSK1JIxi
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680be875 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=Ti9TukswnVR9IDma3V4A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Hn7QpiK8f0H_uERz5NnN1coudrsaVS7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=824 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250142



On 4/25/2025 12:34 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 24, 2025 at 03:04:24PM +0200, Krzysztof Kozlowski wrote:
>> DTS is ready and I consider it ready for review, but still RFC because:
>> 1. Display has unresolved issues which might result in change in
>>     bindings (clock parents),
>> 2. I did not test it since some time on my board...
>> 3. Just want to share it fast to unblock any dependent work.
>>
>> DTS build dependencies - as in b4 deps, so:
>> https://lore.kernel.org/r/20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com/
>> https://lore.kernel.org/r/20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org/
>> https://lore.kernel.org/r/20250113-sm8750_gpmic_master-v1-2-ef45cf206979@quicinc.com/
>>
>> Bindings:
>> 1. Panel: https://github.com/krzk/linux/tree/b4/sm8750-display-panel
>> 2. MDSS: https://lore.kernel.org/r/20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org/
>>
>> Patchset based on next-20250424.
> 
> If the DisplayPort works on this platform, I'd kindly ask to send
> separate DP+DPU only series (both driver and arm64/dts). It would make
> it much easier (at least for me) to land the series, while you and
> Qualcomm engineers are working on the DSI issues.
> 

Afaik, DP does not work yet on sm8750. Thats the next thing which needs 
bringup.


