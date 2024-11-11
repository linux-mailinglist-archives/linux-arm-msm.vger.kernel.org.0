Return-Path: <linux-arm-msm+bounces-37467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A97449C3F4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 14:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CB7E284764
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 13:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE81193092;
	Mon, 11 Nov 2024 13:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c+6fUgTT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A051158558;
	Mon, 11 Nov 2024 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731330662; cv=none; b=KMtZ7EXjO9xMPYLKQntj7ZK4Oe44OZ5kyCKeQ82IHCFvt0VU1DA3MWWGWB3n7Q2hapa4LxWTX23dmyOlprRAke3+Sb9EiYwa6f4XjTM0MMckQz8aRDru3o/BgqA1CxxbhuVJVcz/WjhZsQRPtGZ3JD+NTTBTS+hhHtsUUSNWtzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731330662; c=relaxed/simple;
	bh=LDFPHDpTO0jfHPz//SlbU0SzK20oKkqQGjmHrBR1gbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UcDIJ19eZfZ6nhMGjN0MvJFAGPEd18bprDGUE/tguTAGrHsYom3viBVRj24pdnLZlGSNiZ7zuZ6+dSBGgOlhl8CuDXzCmPN3V/baPCQ2gtgdNkaXx1LglAwJq8d+CercJAujBk1xHLURjzrHTA+8Vmq6SWs83yHAm6vzqOizWf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c+6fUgTT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABBa7Sg020024;
	Mon, 11 Nov 2024 13:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2+JOVLWsfMahws3OIYU+n+q2eo0s0kTrtpqSJxkHTtg=; b=c+6fUgTTwGvORhMZ
	nI739gQsudY/ee82rHayAR/35x2853IfLNr0KsVtf54KwsWrGm0zoyc6alDB+MET
	ab0ZoTkxr8Guyo5Wm8+vnRakqL/b/2EXBAZHcEgxvf8L/BnmHY4O+c/FeH9CG/6R
	Lxuwu+ef78IKV9B0d7ztWUiyGb/4N8s+PCiZSYrHRje1AWAijjEnqbFU0b5ZPHTF
	eQG35MimJ4ksK9v+MRfzTmQFr7Gzf/LiLPDgaTtooMi6pT+qnCFw9zEi3+xYAEwh
	hfCU1cU2gK182rZPcCAgrhf+s8QpP34kOMW9tsx040MJouSLwR2h4QFjrJNozXG2
	y87M7Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t11846bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 13:10:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ABDAvOn009580
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 13:10:58 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 11 Nov
 2024 05:10:54 -0800
Message-ID: <9f096970-3408-4ea4-803f-2c63b4b60e6a@quicinc.com>
Date: Mon, 11 Nov 2024 18:40:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sa8775p: Add LMH interrupts support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya Kakitapalli" <quic_skakitap@quicinc.com>
References: <20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-0-074e0fb80b33@quicinc.com>
 <20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-3-074e0fb80b33@quicinc.com>
 <de2561cf-4aa8-4b7c-889b-4c3737857bdb@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <de2561cf-4aa8-4b7c-889b-4c3737857bdb@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ubRlwkMhHMsQlQUGMdkBpuvj3zCdyclW
X-Proofpoint-GUID: ubRlwkMhHMsQlQUGMdkBpuvj3zCdyclW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=551 lowpriorityscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411110109



On 10/26/2024 5:57 PM, Konrad Dybcio wrote:
> On 17.10.2024 11:28 AM, Jagadeesh Kona wrote:
>> Add LMH interrupts support to indicate if there is any
>> thermal throttle.
>>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> ---
> 
> 'support' doesn't fit here, you're describing the interrupts, passing
> them to the cpufreq node. 
> 
> Adding support for interrupts would be fitting if you e.g. added code
> in the driver that would start consuming them.
> 
> The code itself looks in line with the docs
> 
> Konrad

Sure, will update the commit text in next series.

Thanks,
Jagadeesh

