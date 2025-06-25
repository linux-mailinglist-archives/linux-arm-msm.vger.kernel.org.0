Return-Path: <linux-arm-msm+bounces-62430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52951AE8070
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73DDD7B916B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3932BE7AD;
	Wed, 25 Jun 2025 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ij4auXQo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA5A3074A3;
	Wed, 25 Jun 2025 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848727; cv=none; b=tGeXica6EGRkhn/P6m1BB8UZb1kmH6fPXTYGjDnFf3IKU0fZGOGWZuWlFC27CUL9/R0BBmVM1n443VO0Lu00is1zMKt9zp0sM/cdcDzCV+hEa7PwQWlpYLbIJsJeWHhfaeNkYbm4gKEBQ5YevA9dZaZNjWrnZiX04VHG9qaSakM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848727; c=relaxed/simple;
	bh=1YHsKIdOqJMrsX2Kpl5DnLJEoFjWsPIpEHyTFgeqMmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K1ii9iZVBmirzUm66gxuaVbbKMZEGOzcdSSDOuo5BqjtZ3IxOGHB6oT9euMZqlRh0/vVBW83cpcPXeIOsvfzoMvG3fV1l4Q63WkzMLOmIOydI2/wmjv58rkTqdp7Lz8bbQvTaT8H0Al1uni7STY3EYp8To6Sqg5/ourTrZG5JCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ij4auXQo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAI6H2013820;
	Wed, 25 Jun 2025 10:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5PY3URjo6lfFndro9HnX+YLREKT8H3OWjeSoal0FdE=; b=Ij4auXQoXpzCQt7J
	nIgOQEXW5y1QvYNKCssm+Udjz9Qt9laPnT5wvqRWCVzZMWdY79mT5zXrF/gOszsN
	m85jPjDFGD8ANXBH+fo3xwcpjooGxAZ8u1dikYmPeOS937YnBJoEwP43eJ2JAiM+
	LON6Rn94tZEFxen+u70zW4QwWxAzqsa+9ekHsvcribTWgNEFV5P3dpcDO2PYpbco
	ryMHxemvFAXFJYdXfBAzwgNsNKvjQM7/6KqmoS4boKATGxsAp46ZWdu7ubHcxs+s
	/Wj9V1YPh4eCSjYmfWuSJOMgLDTdBO3STTEU9q/tIZ+AiCNpBhxd89TBdCrCgYCi
	vxeZhg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1x5ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:52:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PAq2gI025275
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:52:02 GMT
Received: from [10.217.217.109] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Jun
 2025 03:51:57 -0700
Message-ID: <b71479b9-2f54-4d87-b384-04a948325328@quicinc.com>
Date: Wed, 25 Jun 2025 16:21:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add support for clock controllers and CPU scaling
 for QCS615
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20250612-qcs615-mm-cpu-dt-v3-v3-0-721d5db70342@quicinc.com>
 <jtirzyxqdffbqwlhuepgspyepimn7tx3btcovutfhzveynlk33@3xnoc4awrbma>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <jtirzyxqdffbqwlhuepgspyepimn7tx3btcovutfhzveynlk33@3xnoc4awrbma>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685bd4d3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=ig_1wT9v4rekqANRyDEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kUIEfbVIeSNk_M-ScQQn6TY_mOloYmIX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4MSBTYWx0ZWRfX3SaAwO3275vV
 UjdtBrtmN16H5PfLJCQ0KKlD8lgOZfhKFw0CvbXnWgBQGxH5ijwsAxeXmXZKwKSOxw61ajwfeJJ
 59Bq1NMxNPYOdQmb/FLNWfYFSRkmEpfnitf+495M+Hn7BRpGj16S1BX3QAbxH37mDDQ/Jk/LtsE
 +Z3Sn2/ItMpT3TzIw999OmbSlBdDc94nlfd7KOBamEwDH/u0Tjwo1ya25loFkNypabxZYdLjQTx
 9tUQgJnN76SeduqLxA0cId6tc2x894hrzZB0crpjg31QVGZrvi5ohEI3/eqp4+mSc43OXBGnD4F
 MdJa9/SJGsV+S5+MK3oQJG6BzMroEr3Fro3G3o/lG+n39Cu0XbstK/0IPzhhJ5toHqKJEqw2qEL
 DaLcjH+ydwFliqARcc3/gotnSOuGatJ+qgAvOWDZZ5WCHeIieYEjkyDN6cpJM7DxtJrtf1JR
X-Proofpoint-ORIG-GUID: kUIEfbVIeSNk_M-ScQQn6TY_mOloYmIX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=571
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250081



On 6/19/2025 2:51 AM, Bjorn Andersson wrote:
> On Thu, Jun 12, 2025 at 03:47:19PM +0530, Taniya Das wrote:
>> Add the video, camera, display and gpu clock controller nodes and the
>> cpufreq-hw node to support cpu scaling.
>>
>> Clock Dependency:
>> https://lore.kernel.org/all/20250119-qcs615-mm-v4-clockcontroller-v4-0-5d1bdb5a140c@quicinc.com/
>>
> 
> This was rejected 6 months ago.
> 

I will update it to the correct latest link.

> Regards,
> Bjorn
> 


