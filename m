Return-Path: <linux-arm-msm+bounces-39994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FE59E11F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 04:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 057BEB230DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 03:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1955381B1;
	Tue,  3 Dec 2024 03:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UNwfbjfv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4F317555;
	Tue,  3 Dec 2024 03:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733197227; cv=none; b=IUXb6UuTYvd3/4Trzg34kaScTlsJFhtewumdrQYWEsfNWb1gv61QoJMdG8IXnDS8M7CyZlOBM6PprFnkkJmWc5TgrbF8zfGC795M2pEqQ0HVIYwyZfeJuaBHYP6Y/R6SJd6cN3CzQy3P0WUStUYMbK+x+C5U5lbP5hKuH4fOWHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733197227; c=relaxed/simple;
	bh=VJbKqxJRtTBnBjn4uj4QHCc3lwLm5vz9A9lA4Qiu6vE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uYI6raEOGW+v41E1yZ3LbR25VnNw09h8UqfvUPGwFtAg9Muy2ltliB78SNUIaJ62kbQj80PRaJVVHQRlPotwVinM2OkjGr4bjz3UQrhY8yHDBzAQK4L13piWa11mlpXQ0B5W6eo0AMv7uR/uuj1Y+T7O56oYB+KvpU/0zXi/UCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UNwfbjfv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2LQxUF011828;
	Tue, 3 Dec 2024 03:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8DgSpqJRZPX+nEFqGx7fJKzoWV179A77miN4DlIsejc=; b=UNwfbjfv3Ka2qSEO
	oPVq3Zh0gU13NxSZMRB+6GOS8S4NQq+8ckJVbCZV3ZB3c0kSgKs5eiRF0gjJ062A
	p4BZ/2/wlhH07Z24CQLbM7AJf9hjMoHzEYvJRcnF4ljXmPPBKI+Zm0TypwV4Iqko
	FPB0Upcfq8e41b7OKd/tl5fHJRTVG06TVOTT9PncgJJBkGJpMXOBA1eJeKnaWxy5
	Tm3QUE0ijXsOQdPdl10+vcFip2I+tD/v8j9/IhHkXxOSHo1tiNElJYGMJlYd50q9
	55alzHtJZoGlco3V80eZ+Uf72t0AvJBCqJI6o4V9In7t0vcR9M7/bgrNy5t6r5gQ
	LJXZHg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4393mpbnce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 03:40:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B33eCM7001815
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 03:40:12 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 19:40:12 -0800
Message-ID: <e93e7601-e768-4c13-9e66-b7f62565cb41@quicinc.com>
Date: Mon, 2 Dec 2024 19:40:11 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: display/msm: qcom, sa8775p-mdss: fix the
 example
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241112-fd-dp-fux-warning-v2-1-8cc4960094bd@linaro.org>
 <643d2935-65ce-4d86-9be6-c2faa1956365@quicinc.com>
 <CAA8EJpqBouv-f-QMpZ+hrA-vF4ojhUWBn5yMqYYB9LpW0TACdg@mail.gmail.com>
 <ba5d51f4-edfc-4bc5-a3d2-1a2d24ae4403@quicinc.com>
 <1df39be7-ed70-4b65-8640-c1d20c9feadf@kernel.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <1df39be7-ed70-4b65-8640-c1d20c9feadf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: W_LJybbTt_0LDwnpqFOMsGvHSjxlUHPd
X-Proofpoint-GUID: W_LJybbTt_0LDwnpqFOMsGvHSjxlUHPd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030029



On 12/2/2024 3:21 AM, Krzysztof Kozlowski wrote:
> On 12/11/2024 20:16, Abhinav Kumar wrote:
>>
>>
>> On 11/12/2024 5:15 AM, Dmitry Baryshkov wrote:
>>> On Tue, 12 Nov 2024 at 05:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 11/11/2024 7:21 PM, Dmitry Baryshkov wrote:
>>>>> Add p1 region to the list of DP registers in the SA8775p example. This
>>>>> fixes the following warning:
>>>>>
>>>>> Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb: displayport-controller@af54000: reg: [[183844864, 260], [183845376, 192], [183848960, 1904], [183853056, 156]] is too short
>>>>>
>>>>> Fixes: 409685915f00 ("dt-bindings: display/msm: Document MDSS on SA8775P")
>>>>> Reported-by: Rob Herring <robh@kernel.org>
>>>>> Closes: https://lore.kernel.org/dri-devel/CAL_JsqJ0zoyaZAgZtyJ8xMsPY+YzrbF-YG1vPN6tFoFXQaW09w@mail.gmail.com/c
>>>>
>>>> Thanks for the patch.
>>>>
>>>> I think this link has an extra 'c' at the end.
>>>
>>> Oh.. Can you fix that when picking it up for -fixes or would you
>>> prefer to have a clean version in patchwork?
>>>
>>
>> Yes, I can fix it up while applying.
> 
> This was supposed to be send still for v6.13-rc1... I don't understand
> why not, but it happened so now v6.13-rc1 has a regression - binding
> warning (binding, not DTS!). All people testing on v6.13-rc1, all
> maintainer trees etc. now have this warning.
> 
> Please send the fix soon, so maintainers can for example rebase their trees.
> 
> Best regards,
> Krzysztof

I have queued this up in a MR and will make sure its included in a PR 
for msm-fixes in a day or two.

Sorry for the delay. Will be picked up soon.

Thanks

Abhinav

