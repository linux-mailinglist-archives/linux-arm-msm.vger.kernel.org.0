Return-Path: <linux-arm-msm+bounces-37438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 034339C3454
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 20:15:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 359521C21089
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 19:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3A613B58F;
	Sun, 10 Nov 2024 19:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UOclVtsP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3691038FA6;
	Sun, 10 Nov 2024 19:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731266148; cv=none; b=fyQV8PXJmXmrgoQFOpzorwYf/19qgXx4JnYCocaAS9Ktb+7R60Qy9+F/U44pnNctrAcg05jSuzOJTX/mYAHpJ7DhfvENeBvKBey5+B4nq8i4T9KeFFVBFizdNObaSVFk3rb1M9pSWf2PnxEDdKZIAddhewsCmEfx9ChFxVQ6X3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731266148; c=relaxed/simple;
	bh=PFwDsvL8j8ycE49SQFQgEKX6cN/OQNBI2bLw3QG41R4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H87fw4XOqaOpeR5DzUDzLDXNuirKuWdxJle9Iu4qZjK0atfm0kken8052KeVnCwoYirmRKYqbgUsDC9dJq0JetVs5T9BekZwCbrleziw2Pca0kikCjNQVLk4ryZuseKEfrQELM5nAn4T0RTcFlsoC9nNtkyD1fviCrsfmSg5jLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UOclVtsP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AAIumDM025224;
	Sun, 10 Nov 2024 19:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sYH3IHiMloT5KhcRPMQLyHwJyYH2ZqDEZ3L2hRZPc3M=; b=UOclVtsP9oE1h6b1
	a7j0NN8tNz6zQXQl2uEdcQJI/YuK1xRVZoEXdhtRzwf/N3w29ugmk5Udy4TI3uDN
	t6FT0DaTb1XQtUDwb0zVlT5q3IHC7LXxAABv4jv93l6Z3GmxD9ikTop0ZWe/hj8c
	cOFslsEbz2k2NrYmoN3Pqbnd7khDqYT+Z3TeVGkxRBmj0L+XkY6p2TNvVAmjMGaf
	ueGzNVLPr2F40dNcBxcJfhG8astCqX01r9y8posu5AGjEAaR9J9lro43BEVFKzJj
	tDDDBVoSHCIxmSr9VCWS8+gG7rsPrd8uvUHDNPfQStQFTwxk69q6qm3WcEqdhfDx
	134Hyg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0gktdvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Nov 2024 19:15:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AAJFhgQ019921
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Nov 2024 19:15:43 GMT
Received: from [10.216.41.5] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 10 Nov
 2024 11:15:39 -0800
Message-ID: <1d6bb573-6366-49d1-a921-cb04136627a8@quicinc.com>
Date: Mon, 11 Nov 2024 00:45:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC: arm64: dts: qcom: Disable USB U1/U2 entry for QC
 targets
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>
References: <20241107073650.13473-1-quic_kriskura@quicinc.com>
 <f15c4760-b52f-41d8-9dc7-3896879b3ca8@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <f15c4760-b52f-41d8-9dc7-3896879b3ca8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9D6LEspZ9q5WReBWUfXgVQMZ5O3dVM3T
X-Proofpoint-GUID: 9D6LEspZ9q5WReBWUfXgVQMZ5O3dVM3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=336 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411100171



On 11/9/2024 2:22 AM, Konrad Dybcio wrote:
> On 7.11.2024 8:36 AM, Krishna Kurapati wrote:
>> Enabling U1 and U2 power-saving states can lead to stability and
>> performance issues, particularly for latency-sensitive or high-
>> throughput applications. These low-power link states are intended
>> to reduce power consumption by allowing the device to enter partial
>> low-power modes during idle periods. However, they can sometimes
>> result in unexpected behavior. Over the years, some of the issues
>> seen are as follows:
>>
>> 1. In device mode of operation, when UVC is active, enabling U1/U2
>> is sometimes causing packets drops due to delay in entry/exit of
>> intermittent low power states. These packet drops are often reflected
>> as Missed Isochronous transfers as the controller was not able to
>> send the packet in that microframe interval and hence glitches are
>> seen on the final transmitted video output.
>>
>> 2. On QCS6490-Rb3Gen2 Vision kit, ADB connection is heavily unstable
>> when U1/U2 is enabled. Often when link enters U2, there is a re-
>> enumeration seen and device is unusable for many use cases.
> 
> Would be nice to enable it on there too, then ;)
> 
> Generally per-file commits are preferred to make potential reverts
> easier down the road
> 

Hi Konrad,

  I agree with you. After the SoB and the "---", I added a paragraph 
mentioning that if this RFC patch looks fine, I will send a series and 
make this change for all SM and QCS targets.

Let me know if the above commit text makes sense. Although I don't have 
all the debug details, I didn't want others in the community face the 
issues we faced and hence the patch.

Regards,
Krishna,

