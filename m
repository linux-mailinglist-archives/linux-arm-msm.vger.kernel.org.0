Return-Path: <linux-arm-msm+bounces-26845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FF69398EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 06:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 608F028261D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 04:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D1213BAD5;
	Tue, 23 Jul 2024 04:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FWVzECzK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7830213BC0E;
	Tue, 23 Jul 2024 04:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721709413; cv=none; b=bEwh1oqKIXPVBPiBGiUJvEnINcITq4xGGVemA4hE8ujGjJjBlqJq7hbrNDXeONz0AIKAlX3AjMxBYyj/nSkzVO78/aE7al6R3SxPFWuDQQdNzQJmPJoUV6xLs8bC6TwBGbI01ZbXD4/uWl5VfuFni8Hi7fwhaMvKo2yo690/fOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721709413; c=relaxed/simple;
	bh=gKyCQvlvriLFI69vG3kQfftTahUT6YauWYeCpKolpNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=p/7vt7L0MtcKN/DhmN1FmtUUCCk0FJjsOexyEhdKeuhHTt01Vb9ysgBX2CQxlA1sRRqTZW8DNf22uPI5YNpl+tUm+DSdOCYrIFvKUhY9RvhXCFzTbMeM4jQwHPpgv+HBlLa/fY9IQ2r7pUiYmSQbqPM9e2QHQMWtaNut1frY7eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FWVzECzK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MNLuus019103;
	Tue, 23 Jul 2024 04:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9G7Br/aTHUsukQqZuMGo6lUo4yLTM2tBZ376mK6pofU=; b=FWVzECzK+lHxicX0
	BGlhBMlBp7F5d9cAsVonvxHM2/Kd896snjguL8B1ge5iHSyufLm1oQ1TJ7vDK8Sp
	BjalF4KpAF4Iabwjb3wTkH8PEg7Rex727jTQt9zPgHJS8eUSWB47yQeCO4hS6h+Y
	Lf1ozlpKeaV4uLGUG8eOmci+3rja0AtBJbBdFiXrIYTLb0GGnJA+MrjkQmpT5ssY
	Kx9y7gomMo1RQ0h96iYfw+L9Rzi8Aly/UtatCngf2xq5GNQVcIhxUUnNW0kNgjHH
	fx3qu7BS7iNaMeVXtxEBuSkKL0t8kbYVL3jmQBljwNor91zpffIZdeifsiQcUVXK
	gisXAA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g4jgwkrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 04:36:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46N4agGr032228
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 04:36:42 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Jul
 2024 21:36:38 -0700
Message-ID: <be9ffb28-3ad7-4537-bf80-45ea43f97374@quicinc.com>
Date: Tue, 23 Jul 2024 10:06:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] misc: fastrpc: Increase unsigned PD initmem size
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>,
        stable
	<stable@kernel.org>
References: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>
 <20240722080200.3530850-3-quic_ekangupt@quicinc.com>
 <cr6xv4tsk23sjynnucve4366fwvffgq3rjnbkpxhzdfeiktwtr@ydrp3mduapui>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <cr6xv4tsk23sjynnucve4366fwvffgq3rjnbkpxhzdfeiktwtr@ydrp3mduapui>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lTJpHUAwz4lqml0Gc1UbTiXL1Dy-1kfE
X-Proofpoint-GUID: lTJpHUAwz4lqml0Gc1UbTiXL1Dy-1kfE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_18,2024-07-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407230032



On 7/22/2024 2:04 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 22, 2024 at 01:32:00PM GMT, Ekansh Gupta wrote:
>> For unsigned PD offloading requirement, additional memory is required
>> because of additional static heap initialization. Without this
>> additional memory, PD initialization would fail. Increase the initmem
>> size by 2MB for unsigned PD initmem buffer allocation. Any additional
>> memory sent to DSP during PD init is used as the PD heap.
> From the previous commit message I had the feeling that DSP can request
> more memory if required. Currently you are stating that PD init would
> fail if it doesn't have enough mem.

DSP PD can request for memory only for PD heap and that too once the PD
initialization is complete.

>
>> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>


