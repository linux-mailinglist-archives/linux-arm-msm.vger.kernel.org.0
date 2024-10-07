Return-Path: <linux-arm-msm+bounces-33454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69032993877
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 22:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85E2D1C22C1A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 20:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E071DDC0C;
	Mon,  7 Oct 2024 20:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RDVrhouW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220BF1DE4E9;
	Mon,  7 Oct 2024 20:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728333867; cv=none; b=UTG547/ujtG3NGbGdrDxM1MsvHeONSJBurskxwTk70zJpUAHmcwPVYQQ/1tIxFjv5AjszxeeJZ5BLfLyJDfa+lJ9ult5nHQgW0b1nCXOsFnrZHUW6qDKvgehtVD3JcBuy+b+1VCS3RYKfCRVsYjDQqzyoWV+23qCtlaerhU0pNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728333867; c=relaxed/simple;
	bh=GXo/yXyFjpu9ohEyCOnFiUK6XPSuRoDemIM0xnFCMBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VZCH94Z/Yq5UK7tMMxWJ9xZ31ooOVNZfzFR+jD5LlLL+B8wTaoh2v6NR/N0tt57W8a71iG/HMBWdRWanxrUK6ry77opsytQSXGVJJb3AZz6guG5lQoXP36wWHphOxxoOHUWloXalyDyjTvanMBR6DrNntEmuBWZSG5ZLVEJYEvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RDVrhouW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497FADrn021746;
	Mon, 7 Oct 2024 20:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjxDf+ELb1HoawO1px1+v7Wh3AAJnJv/W2UZ2Hy7mTo=; b=RDVrhouWFX6awRtu
	XP1DycpGLxmxHtA1V0+GOCsc4u74/V1ucDfjIziXHtn1ccP0gnaQoVUnUK1NrK2H
	nwvbenroZHLgNKqbBbo+qlIt03KADwgQLaZRXNzcG9MaoIMAtrHNeZTd5NUWDkq/
	rl+FbeG8Z6/t+GYu6brp0+JEUuTnvivX/+aEVUEFbOX7G5Fu1OSpXetIp9JxNQB7
	BxfxJDR0SHDlmXRwf5pOvTfKo4NuXBN+ASbnuJkgBIWkma1gXKqWyKRZKXvLQAXS
	rGPGueKvzdoshNWkYS9dHz1b2Dx5X/L1s040eOh7k9KIjy//EBmz8zP6XqL+MOFU
	IFzepg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xr5n7ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 20:44:22 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497KiLUJ025199
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 20:44:21 GMT
Received: from [10.216.6.71] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 13:44:19 -0700
Message-ID: <015c697f-5842-4797-89c8-7c6cc68ced49@quicinc.com>
Date: Tue, 8 Oct 2024 02:14:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: qcom: qcom_tzmem: Implement sanity checks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
 <20241005140150.4109700-3-quic_kuldsing@quicinc.com>
 <wzrj4vhrb4h3pe5dft7vqz2tl55txdyuciuxlysuck5isi7r4z@bs2ts3popy2t>
 <2eb53ea6-848a-48bb-8c31-83a118bc5a73@quicinc.com>
 <CAA8EJppEQKJ=oQh=TeFaP0z1sXDQhz=LN_TC4YygiLOe_EX6Tw@mail.gmail.com>
Content-Language: en-US
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
In-Reply-To: <CAA8EJppEQKJ=oQh=TeFaP0z1sXDQhz=LN_TC4YygiLOe_EX6Tw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AxUGugsuhZ8_oucAWY-aIgcvj10jwF7S
X-Proofpoint-ORIG-GUID: AxUGugsuhZ8_oucAWY-aIgcvj10jwF7S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=720 priorityscore=1501 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070142



On 10/8/2024 1:43 AM, Dmitry Baryshkov wrote:
> On Mon, 7 Oct 2024 at 21:17, Kuldeep Singh <quic_kuldsing@quicinc.com> wrote:
>>
>>
>> On 10/7/2024 1:00 AM, Dmitry Baryshkov wrote:
>>> On Sat, Oct 05, 2024 at 07:31:50PM GMT, Kuldeep Singh wrote:
>>>> The qcom_tzmem driver currently has multiple exposed APIs that lack
>>>> validations on input parameters. This oversight can lead to unexpected
>>>> crashes due to null pointer dereference when incorrect inputs are
>>>> provided.
>>>>
>>>> To address this issue, add required sanity for all input parameters in
>>>> the exposed APIs.
>>>
>>> Please don't be overprotective. Inserting guarding conditions is good,
>>> inserting useless guarding conditions is bad, it complicates the driver
>>> and makes it harder to follow. Please validate return data rather than
>>> adding extra checks to the functions.
>>
>> Sure, I’ll remove the redundant checks.
>> Please see below for explanations.
>>
>> My intention here is to handle erroneous conditions gracefully to avoid system crashes, as crashes can be detrimental.
> 
> Please fix the callers first, rather than adding band-aids.

I see your point and understand the emphasis.
I'll submit v2 as per suggestion.


-- 
Regards
Kuldeep

