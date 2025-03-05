Return-Path: <linux-arm-msm+bounces-50313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF85A4F6E6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 07:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F5827A89D6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 06:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3986F1D6DD4;
	Wed,  5 Mar 2025 06:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Rovov+zv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE13170A13;
	Wed,  5 Mar 2025 06:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741155189; cv=none; b=b1X7CyjubPIKqdsXVw4CLn9vjs4Tjo9ionTF4u77rxAzJBxYUelwremR8I1ktnT5jG5GFSTG++lGJu5i1XLo9jx9BUCQsgiuwRPcDKViYMLxEpdLdndqgX7dT6+DFSky2uIzCqxgR4PV8m4GnRWroX0rmAksWhottiKwSC7+KN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741155189; c=relaxed/simple;
	bh=bsjLj/RdvfYHKtMWDIUAr7/t8NiumHbZXtyrawtMVnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Nn3XCgmISkDYpYZ8fv2zmv8p2qZqSV0QyoXT56snQs34t5+HelNNmMKhKLsH5jlsYSquuPdYYHYzq4sEPeXne8E4rC2Wnqve4liWWmignKK7c+zCrd90PzioSkMte3ZbAhmhyECb4QQrgTniPV1BMQs733q8StIElPMVMpZ2Qa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Rovov+zv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524N9xbL006945;
	Wed, 5 Mar 2025 06:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lthvfMRpFe/t5AUZVu98pEhGrG/C0dkSNEneanWo0AM=; b=Rovov+zvpDysf+Qs
	azPvi+3+LP0xfbWlTNNcPnJ74A29/E5hQGBj0WTOjXBofIsvbby80PVDaDnIN44j
	tQgvRxQ+pFbgJ1ZTNNJVgUIvHXzCkzPGo8mJwjz+mEum+A+haBQD782l59DrY8gX
	XiFPMRZU/zyhEtfNjMdnLeXGJ9KhNLNJ0r6X2K8Yc+9qe+3pc5EAE3SXcyc+VUIT
	kbabTZF3z7KQB4kSmh9UCJqD+JiD7erIbSYj84rdO4bw6odDr19F3n48tHUT3ZH7
	436bYsl6xVtUugUAiqbbFkGcS4h8YX8Sf3sIL6n+SLxFop3/8tjQc6M/owIqDHMN
	jJ9htg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6um975-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 06:13:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5256D0tg022674
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 06:13:00 GMT
Received: from [10.216.38.32] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 22:12:56 -0800
Message-ID: <bd783642-5806-405e-b52c-1ff0aa619e78@quicinc.com>
Date: Wed, 5 Mar 2025 11:42:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>
References: <20250228045356.3527662-1-quic_srichara@quicinc.com>
 <20250228045356.3527662-3-quic_srichara@quicinc.com>
 <lakoxihaqlu3vq42eoqtlip23ggdieizotyzax5up5n6ndbwsi@ddqyzvsdtmkv>
 <1359984c-2ace-450b-a3ff-bac0b9fb5cc9@quicinc.com>
 <2xpu26pu4ovnchumwx7xzlp2gldpfgsurnhuqaioygb4a6xmsp@ygmpk6furqs6>
 <3e326578-ab46-4d7e-ad1e-3d572613498b@quicinc.com>
 <CAA8EJppXHXafwx+GPh0UhFLRLW5DNj8RwXdO4+fDdXp=SE13Uw@mail.gmail.com>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <CAA8EJppXHXafwx+GPh0UhFLRLW5DNj8RwXdO4+fDdXp=SE13Uw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zva7B2HAq-jYLsd9T0AnvN6qXo42MkBA
X-Authority-Analysis: v=2.4 cv=H40hw/Yi c=1 sm=1 tr=0 ts=67c7eb6d cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=JxPl7ORNNP5S0vLHAkUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zva7B2HAq-jYLsd9T0AnvN6qXo42MkBA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=812
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050047



On 3/4/2025 3:16 PM, Dmitry Baryshkov wrote:
> On Tue, 4 Mar 2025 at 10:33, Sricharan Ramabadhran
> <quic_srichara@quicinc.com> wrote:
>>
>>
>>
>> On 3/3/2025 6:34 PM, Dmitry Baryshkov wrote:
>>> On Mon, Mar 03, 2025 at 03:58:42PM +0530, Sricharan Ramabadhran wrote:
>>>>
>>>>
>>>> On 2/28/2025 12:03 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, Feb 28, 2025 at 10:23:56AM +0530, Sricharan R wrote:
>>>
>>>>>> +          dev_err(dev, "Failed with status: %d\n", msg.resp.status);
>>>>>> +          ret = msg.resp.status;
>>>>>
>>>>> return msg.resp.status (is it really errno?)
>>>>>
>>>> ok, yes error.
>>>
>>> The question was if it is an errno, not if it is an error.
>> status != 0 is an error always.
> 
> Is it an _errno_ ?
Ho ok, good catch, checked the firmware spec, does not map to a standard 
Linux error code. Will check and return a standard __errno__.

Regards,
  Sricharan

