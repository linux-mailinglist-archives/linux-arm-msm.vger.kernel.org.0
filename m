Return-Path: <linux-arm-msm+bounces-50219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BADF1A4E80B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5F9F18891FC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C59F29AAF2;
	Tue,  4 Mar 2025 16:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ex0v6HYO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB6829AB06
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 16:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106786; cv=none; b=etyO5VBIvlN4gbUN/ugcfKZQPU68qW3DZfAbR0kuA3Th5XlPOES8THVJCFj1cMvFvNs7Jc5iRaUXrlPXD3ZkzODWGAU5UTAV8kgSCKbgpxYuNH/K0TmfOc0AVW7TTRyVdDH5d56RKQL3l9jtpjQNNKqvtfbZx8+V9sGHuwzTyxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106786; c=relaxed/simple;
	bh=Z3R5Pcaqs1+G0Vmv6xCvvwsCj1j/WFqkmCVrvqCYFug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IOYuw+H892h6UeLDDIOa/sbPNMJWdk+e8WldLe0yH4IFBAx9I/Chkm6gO6tBJQieI0ON1eAvnXQVeMG8/KzIK+R8N+MGH2oe6taSwhG8oa3wkpHEz8TAzWyy5ct/dxJA2ULFaFjGMiZiDh61mmUA8iexcb6tomALzxQkd908X/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ex0v6HYO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524AB29r019820
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Mar 2025 16:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y7brEcXtfbjcqoYB3XEQrIfgtnniuwEzqWd+mi+OW4A=; b=ex0v6HYODe9nYu+h
	fABau/0Xk1AapsRzLSzGrEjXmgpJVW+3+Bo++AAklQOGGVWGk2FfwYZtkM/D3Dp6
	CK6oe0LIFznNuAPFpkR/kTFkf471dAsC66byl2YASvmiJ3VaZfSifhmSU9BsJ2EU
	NDHRFtAdprgeD/3bmEzV65uFRnFPBmcz5OFXBqQNrlLjWsgdHz0EF3umNo8M8KeM
	3B3o30dhCIYfbYri6raIqiSW8x/iMMpnQnJrmQ8ub8VzgJmqmRt40AKzpxPxDx3y
	WiKQcgpT6vV9m/I8u/rFMdrI1RwNe1spPx9/9ceaCnUFgeOqm/4NUL2bzExKev5W
	NpCHwg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t2h3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 16:46:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c3c4d6244eso39918385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 08:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741106782; x=1741711582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y7brEcXtfbjcqoYB3XEQrIfgtnniuwEzqWd+mi+OW4A=;
        b=i9wZQXGgvb2D24GAAOdnxnCIJodYPUX4Jp5RGuX0f47Vyd80Iprzwr8sIvSKADfukD
         7ywWrI2054XKjiS6euRuKLFRtC9c2Wufi17H9DVHhWq2gNEvqZUp+7wvMMpx14iwdfRc
         6j4YlGZmGS2zm0pAg+i/N2jNnBynr2J8H2X5krjhVkpPg/v8OuIUNBaW90qEBpoHvpts
         ddeNKNAPpwkDhX6gVaAEMmL/N4orPpb76KYcDi0TjlTpuYtg9M/6hhfAQphMbRvl16bs
         M9zle4+P8NXXD3xaO8UiSrxh+JJz+zqTPsAQQ7/s2rn47g1xn5DB9Mq8kgcBXUyj8SYq
         LvtA==
X-Forwarded-Encrypted: i=1; AJvYcCU/hvvqU1xb/178MJIbMRyZ36MvmLx53jdj1o3d2Fmnrq4xLJ9uSseV2Zp0gSGpxL8sogIbQa20vUiHotrD@vger.kernel.org
X-Gm-Message-State: AOJu0YyjhWRW2MII37dGVeFsBwFdqVM8haUbFsTQijyBmhwuZN+zBq60
	iIVn4XUGH+lhsR7AYR7gtDgr3NdHYntbUZ3xHCyvhAVtk/93riaSjGDh8ogKPIG6qZLzhr8VM6O
	HrQc/QHkJyzkNBVdNp+56QsEVciOng4UzomOYdvxT0qa5nhQN17dABNUj0Bx4kggn
X-Gm-Gg: ASbGnctIDJVtJVrhECM3OcBh9Osbf3P348Ask7wtCE+MJP84CaoDbSNNJgeYDe8Lrme
	aEVnVUQ+xO1rIxXOIVTT/fMduFgZxt/BEHm8V4f3G2U3qDFaEj8jYtbt0nl1+QGYNIipMu4eWaQ
	yx48ikAJWWgW8rLQu3sO3rU/5GLI3VdU/R2L6MMDnH2SaartTRXfuT67qafWUKsGroOnofzGVyv
	bFQbd/py3kouv5vGvhm1OyWYb3W/2z4TcYwf5J9Ynn2k82Ld2gqcVs1Vy1uBdX/MIX5ZqJ1lh4y
	YwQ/E6kSy301KaHi/2wwaOvLMv4exltuCPASUDgemBeUIaybdbk/SgSHQ/loVIQn3h5QgA==
X-Received: by 2002:a05:620a:1721:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7c3d3a05813mr100264785a.14.1741106782076;
        Tue, 04 Mar 2025 08:46:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7EoTqVks4QCeBflC74F5I6vZviIdM8z0vuE9z7wp5fUI+aWIRcwJklBDc/2TUsnKYZjW+4A==
X-Received: by 2002:a05:620a:1721:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7c3d3a05813mr100262585a.14.1741106781753;
        Tue, 04 Mar 2025 08:46:21 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1fb09be0dsm97722866b.5.2025.03.04.08.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 08:46:21 -0800 (PST)
Message-ID: <f8efc961-2fbe-496b-93d2-55f9072bd08c@oss.qualcomm.com>
Date: Tue, 4 Mar 2025 17:46:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        manivannan.sadhasivam@linaro.org
References: <20250228045356.3527662-1-quic_srichara@quicinc.com>
 <20250228045356.3527662-3-quic_srichara@quicinc.com>
 <lakoxihaqlu3vq42eoqtlip23ggdieizotyzax5up5n6ndbwsi@ddqyzvsdtmkv>
 <1359984c-2ace-450b-a3ff-bac0b9fb5cc9@quicinc.com>
 <2xpu26pu4ovnchumwx7xzlp2gldpfgsurnhuqaioygb4a6xmsp@ygmpk6furqs6>
 <3e326578-ab46-4d7e-ad1e-3d572613498b@quicinc.com>
 <CAA8EJppXHXafwx+GPh0UhFLRLW5DNj8RwXdO4+fDdXp=SE13Uw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAA8EJppXHXafwx+GPh0UhFLRLW5DNj8RwXdO4+fDdXp=SE13Uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -yjZmR2wcyf9LKeqWpSm0Thw2gOWt1oN
X-Authority-Analysis: v=2.4 cv=KfMosRYD c=1 sm=1 tr=0 ts=67c72e5f cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=AQ-p2TLc_isDrXhQJ_kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -yjZmR2wcyf9LKeqWpSm0Thw2gOWt1oN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=756 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040134

On 4.03.2025 10:46 AM, Dmitry Baryshkov wrote:
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

Dmitry's asking whether the status conforms to the Linux's errno.h
ABI. If not, add something like:

ret = msg.resp.status ? -EINVAL : 0

Konrad

