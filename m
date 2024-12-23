Return-Path: <linux-arm-msm+bounces-43141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6C29FAEEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 14:32:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B710B164945
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 13:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E722C1B3931;
	Mon, 23 Dec 2024 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QkHd/8Qi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E0C1B372C;
	Mon, 23 Dec 2024 13:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734960682; cv=none; b=QBL8rS3crUPQU5GbXmhS8+sW47fr/uC+gZRwH/aDFZi90LGDsHoEyBAMGhQUtZy1G7y0Kcse6YDWAwzvl+mNhqLKtEJLamYPG2rtNHVeY+yhI7QYGxXS9/QgI98URkSqPA9MvMks3M/AdJw1WyWHXla8DrAfU5X/fswf8svOdLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734960682; c=relaxed/simple;
	bh=4sFu8mjtacVomJspkP7tDDwscA8H2Y6v5M2qBMEIAoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hvmagzGTwIJpqkqJa6ibc9g5XWX4ib0gT+s1XWlrSdvXtTqoi2iMzubVKJAWIVADsSm3SgY1+QvZ/eVSDstMLG6BYMt8Qv+nlB6sies1nD8HWdkX0Y4WsMkAcGFcsV0P0R0qTT3Fxn7+AofAHVW6ERelSPByUIPVLPEDWpxMyik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QkHd/8Qi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN8oZQf026653;
	Mon, 23 Dec 2024 13:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3g3BPf1ylnNN9k8yzQc5JUi88jiBE4n7vNXnKhQ0374=; b=QkHd/8QiCQsw5OX3
	QBGEnI/WxIfCmJlEkRgkacrETMN+bejbfahkUZcOt9bUaKmw/tosTWBH9PAmT52H
	onhKC8TXOqsTxter5AozP2XbWv8ZLBMDPTYzBf78kWWovw1KIK00WPjEM2JXS8qO
	jdpTxisuDMG2ZIysVeh05ticR6jXr6fClYb1VbrVPzkq/UwP9IVNGw2MIuPObB7t
	e//oh7qs92IiEIx0LtotLAgm56X7BkB8lKj5X3uOEP7iPgHZcQxw5ipOvIos4ANZ
	1bXxCi5ferfG9M8+MOPk43i1wWQQZdb2gcJrlqPs27It/1ueErbMzMMEK6H2SmqF
	+OZW5g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q4q4rn9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 13:31:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNDV1rf017390
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 13:31:01 GMT
Received: from [10.218.43.20] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 05:30:58 -0800
Message-ID: <24e5e463-0ba2-4bca-a586-80e1d67cef05@quicinc.com>
Date: Mon, 23 Dec 2024 19:00:55 +0530
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
 <1d407f42-681d-4e8b-86f5-a4d368987115@quicinc.com>
 <a6eb14c7-84cd-41da-a24a-f0310738eb2f@acm.org>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <a6eb14c7-84cd-41da-a24a-f0310738eb2f@acm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9OacMA1OxP4mLq2u25-CtYkxrvDEh_tD
X-Proofpoint-ORIG-GUID: 9OacMA1OxP4mLq2u25-CtYkxrvDEh_tD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230121



On 20-Dec-24 10:46 PM, Bart Van Assche wrote:
> On 12/20/24 2:06 AM, Ram Kumar Dwivedi wrote:
>> This function will be only called once during boot and "val" is a local variable, we don't see any advantage in making it static.
>> If you still recommend, i will add the static keyword in next patchset.
> 
> The advantage of declaring the array static is that the array will be
> initialized at compile time instead of at runtime. Additionally, this
> will reduce stack utilization (assuming that the compiler does not
> optimize out the array entirely).
> 
Hi Bart,

We have added "static" keyword in latest patch set.

Thanks,
Ram.

> Thanks,
> 
> Bart.
> 


