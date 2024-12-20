Return-Path: <linux-arm-msm+bounces-42957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6021D9F8FD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 11:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB4591897BE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14C71BD9C5;
	Fri, 20 Dec 2024 10:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dYKBziqG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE431AAE33;
	Fri, 20 Dec 2024 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734689190; cv=none; b=qdCGivF5IiIGE20on9TE6bmt+C2bqYi7PPSoqCd0LCWhH4HymQNimHmJGgJyJf7WiHRl/DkTst5aYveJ4w4bsGXNBvhmrU5jXDbTDvFMnBPSyTXHY7p91tMImeZl/i0rTlgw9s5Tf1hGdtzWC9rDpjjoj4yy+kVZidnKVe8n+b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734689190; c=relaxed/simple;
	bh=DLmwSM2lo5lnYMzvp9cy1FJMzLutSGaEBabuCtapcB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A6+SxiXfd+t9SLljs0XjmMurv1Lr3JAdplFRyGBGzpEAEK7cJIShWM5oEDBeiks81/yXexsKiNlb8bVUVoOhOZ23jX7aCs5BXWX/i1w2bPd5a5io1jaiOgv3ukJq5YIrTBLTNSbz+h9T+/nwbE2ygL93EYp70ja7Nzsjh12IptM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dYKBziqG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK4PXBD024584;
	Fri, 20 Dec 2024 10:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EbWH6PzvPSwBBL3IR8Km5GJcpj7lj6OvamPjCQxRXd4=; b=dYKBziqGatgO3id5
	SpuDsO6OZAB2aIMtAfGCjgFCFcI9ay1kiC/LkP6h1odet2fj/7k+9YPm/z065Nb8
	D8JS6rs3v1w4LKzcA6eJbJuN094QIgKZhmOuBNKCWv7MrOuQZXn1atfT7GH3Jj7W
	GkD1l51L+Jwgvbohy7N9rLpy9t6dcrSZ3QV6Rn/fQxiYOx3kUitS/5IzaQv6pIIW
	Zo5kX/viNdhd5Qh45lXD3X3Yb2IGjlWQ8tcc0CFGtfdK0OtzvXwwj9UT2K5m0NE6
	YgXB27fJrsQ9A7DapWQNVI1M1zPtlTItFD6T8vY7KONyuqT0Ulm12kdjYprjSo8Z
	uPgSTA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n1hx0uwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 10:06:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BKA66ij015624
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 10:06:07 GMT
Received: from [10.218.43.20] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Dec
 2024 02:06:03 -0800
Message-ID: <1d407f42-681d-4e8b-86f5-a4d368987115@quicinc.com>
Date: Fri, 20 Dec 2024 15:36:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] scsi: ufs: qcom: Enable UFS Shared ICE Feature
To: Bart Van Assche <bvanassche@acm.org>, <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Naveen Kumar Goud Arepalli
	<quic_narepall@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
References: <20241218151118.18683-1-quic_rdwivedi@quicinc.com>
 <ac08d417-87b3-4ddd-ae68-8e8e9a68e04a@acm.org>
 <69503b23-12da-4270-9910-9440dba7df07@quicinc.com>
 <eadb98dd-f482-4479-8ff8-dcf301edf18c@acm.org>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <eadb98dd-f482-4479-8ff8-dcf301edf18c@acm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VUEoKOIH1eVaERMaBcwie1htMm7cPabe
X-Proofpoint-ORIG-GUID: VUEoKOIH1eVaERMaBcwie1htMm7cPabe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=810 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200083



On 19-Dec-24 10:53 PM, Bart Van Assche wrote:
> On 12/18/24 10:16 PM, Ram Kumar Dwivedi wrote:
>> On 18-Dec-24 10:49 PM, Bart Van Assche wrote:
>>> On 12/18/24 7:11 AM, Ram Kumar Dwivedi wrote:
>>>> +    uint8_t val[4] = { NUM_RX_R1W0, NUM_TX_R0W1, NUM_RX_R1W1, NUM_TX_R1W1 };
>>>
>>> This array can be declared 'static const', isn't it?
>>
>> As this value is not modified in this function, we will declare it as const in next patchset
> 
> Why only 'const'? Why not 'static const' as everyone else does for this
> type of arrays?

Hi Bart,
This function will be only called once during boot and "val" is a local variable, we don't see any advantage in making it static.
If you still recommend, i will add the static keyword in next patchset.

Thanks,
Ram.
> Thanks,
> 
> Bart.


