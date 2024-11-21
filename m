Return-Path: <linux-arm-msm+bounces-38727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0879D55FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 00:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CD2F280CB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 23:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075CB1BC9EC;
	Thu, 21 Nov 2024 23:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZhyVJImu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E284500E;
	Thu, 21 Nov 2024 23:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732230168; cv=none; b=iDzQmOeKCWjth20YgffUmbICH91TpakN4VASQunIoPRjB2DtgBlDcq9z/Z22YgFjETAYAzoaRVbz6akejYruxFzG1SD0eeelMzfLMl1W0xNHMBkJgghyqduZMTvUnFotlZQfORLVrasE45Pfa91Ik5ExVWCRWban/vj/fF4PgwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732230168; c=relaxed/simple;
	bh=YUh71k+175ybgsdUyFe+kVdbDgxENLHIAM7Fa7GXBMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FCWLA3tfKHHAsVf8FHm9FYBK64X3yQ4IgRKqGNmwNUra+pZGrXEeAu+6fqePBPmvRlB1qN75NdpnYBgaa94pL0odXeF1kNigiMecUTIvZMS9NrruPCND7GIJi9gsrs39dLGKXk4rHW04Xlf36eWaoI1vcskU+ZaFmdvd2G9G67c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZhyVJImu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALE9i92003121;
	Thu, 21 Nov 2024 23:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b45mFdUFdlyJiFzBXY4dTXz7trbCYEjnXQHC+zNFiYw=; b=ZhyVJImuEiWu9eGO
	WAiNM+1R+KMQ2Xv+G9WPgCWsZ7pK0/5A1e2Glu8gUiGUeG7Lv3Bsijs3rjTO42Tn
	WaWncJpoyWiMzgXdORW93LH/C98cPMEPFizKHqrs6zrjKqJwIkC0ivHgSnP5I4ZD
	XlyjzGPNRubNBW0h4Ljtd3mYeHYQ+K5wO4155qpJsqoDDFqjRdPTysVq42GSLOZw
	mRfF5BvAwkRDqQ5oQluTdfifuru5xCKrVZUeZq6gBUdVJopR9gpajka/V2XwF+Uo
	8pSdth2DFuWqGnD1KpGF+WJ3CIJGLoTz2Zbeif9qNEFxcDHfF5rbKdKJ/IwHT8eM
	GcEKvA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4326cs98ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 23:02:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ALN2fwc004853
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 23:02:41 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 15:02:41 -0800
Message-ID: <022f6596-3b4c-6c19-f918-8dc1cce509ba@quicinc.com>
Date: Thu, 21 Nov 2024 16:02:40 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH net-next v2] net: wwan: Add WWAN sahara port type
Content-Language: en-US
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
CC: Jerry Meng <jerry.meng.lk@quectel.com>, <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20241120093904.8629-1-jerry.meng.lk@quectel.com>
 <863ba24c-eca4-46e2-96ab-f7f995e75ad0@gmail.com>
 <fbb61e9f-ad1f-b56d-3322-b1bac5746c62@quicinc.com>
 <7c263cbf-0a2f-4ce9-ac81-359ab69e6377@gmail.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <7c263cbf-0a2f-4ce9-ac81-359ab69e6377@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: v4sCxqEOq56I5a5KNR36HdvPDL6NYSBK
X-Proofpoint-ORIG-GUID: v4sCxqEOq56I5a5KNR36HdvPDL6NYSBK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 mlxlogscore=789
 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411210174

On 11/21/2024 3:53 PM, Sergey Ryazanov wrote:
> Hi Jeffrey,
> 
> On 20.11.2024 23:48, Jeffrey Hugo wrote:
>> On 11/20/2024 1:36 PM, Sergey Ryazanov wrote:
>>> +Manivannan
>>>
>>> Hello Jerry,
>>>
>>> this version looks a way better, still there is one minor thing to 
>>> improve. See below.
>>>
>>> Manivannan, Loic, could you advice is it Ok to export that SAHARA 
>>> port as is?
>>
>> I'm against this.
>>
>> There is an in-kernel Sahara implementation, which is going to be used 
>> by QDU100.  If WWAN is going to own the "SAHARA" MHI channel name, 
>> then no one else can use it which will conflict with QDU100.
>>
>> I expect the in-kernel implementation can be leveraged for this.
> 
> Make sense. Can you share a link to this in-kernel implementation? I've 
> searched through the code and found nothing similar. Is it merged or has 
> it a different name?

drivers/accel/qaic/sahara.c

-Jeff


