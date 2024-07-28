Return-Path: <linux-arm-msm+bounces-27155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FDC93E939
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jul 2024 22:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20BDE1C20A14
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jul 2024 20:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACA722071;
	Sun, 28 Jul 2024 20:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QoXHmYlR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF7C664C6
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jul 2024 20:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722198283; cv=none; b=jvnUhrrTcnbFnWIOfBgIALGVyhLOScm5or37CZuwsD2rq2BLr8wdR+1i8ADPQBiBL6VwjwN/avCxq2ol4u59jvIQ2Zc3gB1wQ6Cn87qluIzrWXkCIp/itStwTUT/sPphiSWUPb8LPiFoN/F6z1QRjW5l7Ojpr9u/HMFwsyeZ8oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722198283; c=relaxed/simple;
	bh=l37+D5jPdVmzUQZqcQTAUJXAP8v01iWMr3NEmJ8HLto=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PvqqkArkcChOuC/67qeaH53PHlfLSEqs0gHKlrlRPU8Wb+zg+1PE/xQmWmC1Vi4pjpuwG/7i+loDMY6KLSjhMf9dH/kVPc1Hy95DWzdzO4hRYsox3tTBki+mOTsBV5s5GzQr+k7+POZP47xgSDzPJGN7g7KVfPeClwWlOrK5RJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QoXHmYlR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SKHMJ1026478;
	Sun, 28 Jul 2024 20:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UlLAW9cwUi00h4BwX4+absEmOxCp8cM0tyMbo5iTfYU=; b=QoXHmYlRnZBo4Vdf
	EQwOHsiGFheWszU6bq9d7QBqJtuKEAhWVnBZZnh2w0mPlDuT41OMHk0JZq6CPRyw
	g53RROE2f1SNtCQVwFlKrS280zY8hwhgRDlkbFlcsGo4wcI7C7P+8LJ+GfoSgFmm
	Uhx8Qnyk++F9yxh8eJapj6jijq/e4HcxGAds8UQDijHMM0X+CohSZNET4HjBcJSN
	gApNFVxBzBiEqJPbMU/OicgVfsJUYWvDAjZzP2/eFYCxObKRKW7z77ZLqIuiO2iG
	wjZANIQd9Eo7KbbRz+TbeeUE53x/yjsCWV3H58KlAjFeb5u2kwAgSL/E8sOeYH1j
	r6KA4g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40msne28x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 20:24:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46SKOcrJ024028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 20:24:38 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 28 Jul
 2024 13:24:37 -0700
Message-ID: <59c286dd-ec8a-6dc8-d743-f025b8787e85@quicinc.com>
Date: Sun, 28 Jul 2024 14:24:36 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 3/6] bus: mhi: increase RDDM timeout
Content-Language: en-US
To: Gokul Sriram P <quic_gokulsri@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
 <20240718061344.575653-4-quic_gokulsri@quicinc.com>
 <ad7c6dae-b682-b01d-3850-40858bed4c2f@quicinc.com>
 <27989102-49b6-442d-a9f7-f099cd1b4ed8@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <27989102-49b6-442d-a9f7-f099cd1b4ed8@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Mk2cxC2aAUj9hqFJpQR3FrjC4gCgj2WS
X-Proofpoint-ORIG-GUID: Mk2cxC2aAUj9hqFJpQR3FrjC4gCgj2WS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-28_14,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=982 priorityscore=1501 clxscore=1015
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407280147

On 7/28/2024 7:41 AM, Gokul Sriram P wrote:
> 
> On 7/18/2024 9:53 PM, Jeffrey Hugo wrote:
>> On 7/18/2024 12:13 AM, Gokul Sriram Palanisamy wrote:
>>> From: Praveenkumar I <quic_ipkumar@quicinc.com>
>>>
>>> Host sometimes misses the EE RDDM during kernel panic causing
>>> RDDM failure. Increase RDDM timeout to overcome this issue.
>>
>> If we are in the middle of a Linux kernel panic, the host is going 
>> down, so why do we care about RDDM?
>>
>> How did you determine the new value?
>>
>> Really seems like significantly more detail is needed here.
> 
> If kernel panic was due to mhi, we need to have the RDDM dump and this 
> is already supported in upstream MHI.

Why would mhi cause a linux kernel panic?  That just sounds insane to 
me.  Also what you point to is not used, so I fail to see how it relates 
to your point here.

I'm still unconvinced that this change brings any value.

