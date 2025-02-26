Return-Path: <linux-arm-msm+bounces-49413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67434A454BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 06:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F7517A1D7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 05:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EFCD197A67;
	Wed, 26 Feb 2025 05:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BuPLgp9G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993B1137E;
	Wed, 26 Feb 2025 05:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740546101; cv=none; b=E6xIdWgAGelqbaIcILGz6m1d9XGl7AWZEBTGvTjcpc/cBj3PWA30spv0z6cf//B4nYIVMhDFqY7lTVK8AfFl2cypZwHmxnOn7ScZkHgc+/xbSi+jFFMIokYMhTeohxVAlNyLss/YKdP6+ZIws6Y3tdSAkSxqcKCXjodQmtL/PJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740546101; c=relaxed/simple;
	bh=efSu3mwUdMR1fkKWz11QP8aenDn3KCFZVRg+WiXkvig=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=j1deL9L9fv4JoRMbqhqtKhp8K58OpAZUYeeyC9snbfaB1OMhFSE9yZ7LLG7wK5ZUu3Kfa3pxoSCT7v8YIGiDroG+dzXy82wB2Jaxjgr9eP1Mr1osCO8aMbRtWqyvdH9QISEDT+K3nQHChCkBkxJX7AJaHZEXWe15jIBQFW22UzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BuPLgp9G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMWuPp023841;
	Wed, 26 Feb 2025 05:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VWhI0syG6QB20ebyFxOWWIX+f5b0+9OtnruBIeyuvsc=; b=BuPLgp9GWk8IK1oF
	8cLbfY+UR0WW2JOqPNwdW11Gm8OmV9DzNygs4ZR3PJYLvJAb2r38hbKhuLt6tMi1
	/oBDrg2uC21qiW3kECqljPNjbG9mxqvxmbCgw8tGgzONvvjNYShFR/nmXQCSOMC0
	tobk9er39HuIS+MI+N57NGlpjk7qwqhr2HLrqL8DNPKd6Q4fc/fO4DCoYAeVfVOz
	dT1v0mHFNQHWGLLun6+irWxxQa8MXEGIjOzBK2TD9LxsHxmur+d+7di2xJNABaoF
	gYO5E/13fdoXwnXF4KtiBBtElIqaAhk27y9VDATTcaabj4PaGCqt4hDsom2XMKsL
	43Ng3A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmgs5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 05:01:36 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q51ZlQ017513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 05:01:35 GMT
Received: from [10.110.0.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Feb
 2025 21:01:34 -0800
Message-ID: <502e002d-f5a1-4b78-9a9c-4b227623e5b6@quicinc.com>
Date: Tue, 25 Feb 2025 21:01:33 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-idp: Update protected clocks
 list
To: Bjorn Andersson <andersson@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
CC: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250206-protected_clock_qcm6490-v1-1-5923e8c47ab5@quicinc.com>
 <j43f4wu6wgoho2tl4crckemnngyvek5mma6ghkdyqcivk65dcf@gfsimovfuqy5>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <j43f4wu6wgoho2tl4crckemnngyvek5mma6ghkdyqcivk65dcf@gfsimovfuqy5>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MYvbGafrwgsAA1lq4IHVrowsR3RA7TT3
X-Proofpoint-ORIG-GUID: MYvbGafrwgsAA1lq4IHVrowsR3RA7TT3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=517
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502260037

On 2/25/2025 8:42 PM, Bjorn Andersson wrote:
> On Thu, Feb 06, 2025 at 03:43:21PM +0530, Taniya Das wrote:
>> Certain clocks are not accessible on QCM6490-IDP board,
>> thus mark them as protected.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>> Mark few clocks as protected on IDP of QCM6490.
>>
>> This patchset is separated out from the series[1] to remove dependency from
>> the LPASS reset.
>> [1]: https://lore.kernel.org/all/20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com/
>> ---
>>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 21 +++++++++++++++++++++
> 
> I merged the patch adding this board in November 2023, are you saying
> that for the last 15 months no one has actually booted it!?

Should we just delete these boards? I prefer to not have platforms which 
are not maintained.

-- 
---Trilok Soni

