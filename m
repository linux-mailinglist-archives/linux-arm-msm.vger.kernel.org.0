Return-Path: <linux-arm-msm+bounces-41395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDE59EC2DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 04:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68286188023E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 03:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A75E205AB6;
	Wed, 11 Dec 2024 03:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QI+OvhAN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D514CA4E;
	Wed, 11 Dec 2024 03:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733886518; cv=none; b=tzDhG+iRT6brf5crD0/GLniHj8jA584R847nUbeiT6Roe1LQLnwU5hBtH8WvAh+MB6d1lfiqVqsaPESX7jajvtH0TsQKHoE8pU2z1YLEMynoLS6jqdCTeqw9rNGLAxFcoIdkaQjxg/LHErgIRLD66kC0DFkG09jXWCuc8HH1MSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733886518; c=relaxed/simple;
	bh=ZupiJGEYZhgT3qs0zUB4qBthfctbz/KOo9W73hhC0OA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h1lyk1yY+XgUY1eZ4zuhbLRXWDu8pFUwujzCSt7LE68OUMQ4JR92xPDRKd2XIjii7TAb1DxLtwEWFJa9NSmc0ewwZt6n1lztk+c1qOJF8UTZBu9XclEKdVKHNikoA/UjY/2g+FV+cZSVpZfeTuVBTarcJoF1mrwWqswDdmk6ChM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QI+OvhAN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BADaaof019597;
	Wed, 11 Dec 2024 03:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/tDBwUOTx9mIzdLxexBmtjcjcefKgdF/rlLWlMfugCE=; b=QI+OvhANY3JLOga6
	m5cYZnTTRYZKfztVtvn/Ge2IKu/mbKxpGL81QVIaH0WyiyI25z7SBBNILlcnxvrF
	f6wA05hOuPC0hqEEjbLF+H8+4UDysLcIjm7IY2RINkFKW0CSEqTGMMYv5k5ZABui
	f3z0U3UldPpnsllfVKqcq8CsXyR8dvNWL4H+XxY/I1VaCq91LjwTEl1SGuAqY/oo
	Vu42GVvLp3oKwW6x5Ns0nomVBupGYp7cm0dugjFyxnJrZYfGX66PqG3tVASDuY4w
	0Q55MftoGXCsDAwOAkrZdPyqXWUoiROj3cgMSp9J7cYleDgPIMcii6z3Jz+YVy06
	FaP3Bg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e341da11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 03:08:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB38NcM021221
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 03:08:23 GMT
Received: from [10.216.62.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 19:08:18 -0800
Message-ID: <1219b46d-2aea-4377-a8ca-024039ee1499@quicinc.com>
Date: Wed, 11 Dec 2024 08:38:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Bjorn Andersson <andersson@kernel.org>
CC: Rob Clark <robdclark@gmail.com>,
        Pavan Kondeti
	<quic_pkondeti@quicinc.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio
	<konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Elliot Berman <quic_eberman@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <CAF6AEGtKfWOGpd1gMfJ96BjCqwERZzBVmj5GzmjKxw8_vmSrJg@mail.gmail.com>
 <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com>
 <iyknardi445n4h74am22arpgc4vlchh6z6cvkbff2xg76pd655@nozwz7snt476>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <iyknardi445n4h74am22arpgc4vlchh6z6cvkbff2xg76pd655@nozwz7snt476>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0m9eFUcuyq9Ye7zYc1eZ8aC2lb1PuFwm
X-Proofpoint-ORIG-GUID: 0m9eFUcuyq9Ye7zYc1eZ8aC2lb1PuFwm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110022

On 12/11/2024 6:43 AM, Bjorn Andersson wrote:
> On Tue, Dec 10, 2024 at 02:22:27AM +0530, Akhil P Oommen wrote:
>> On 12/10/2024 1:24 AM, Rob Clark wrote:
>>> On Mon, Dec 9, 2024 at 12:20 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> When kernel is booted in EL2, SECVID registers are accessible to the
>>>> KMD. So we can use that to switch GPU's secure mode to avoid dependency
>>>> on Zap firmware. Also, we can't load a secure firmware without a
>>>> hypervisor that supports it.
>>>
>>> Shouldn't we do this based on whether zap node is in dtb (and not disabled)?
>>
>> This is better, isn't it? Otherwise, multiple overlays should be
>> maintained for each soc/board since EL2 can be toggled from bootloader.
>> And this feature is likely going to be more widely available.
>>
> 
> The DeviceTree passed to the OS needs to describe the world that said OS
> is going to operate in. If you change the world you need to change the
> description.
> There are several other examples where this would be necessary
> (remoteproc and watchdog to name two examples from the Qualcomm upstream
> world).

But basic things work without those changes, right? For eg: Desktop UI

> 
> So, if we can cover this by zap-shader being enabled or disabled, that
> sounds like a clean and scaleable solution.

I think we are focusing too much on zap shader. If the driver can
determine itself about access to its register, shouldn't it be allowed
to use that?

-Akhil

> 
> Regards,
> Bjorn


