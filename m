Return-Path: <linux-arm-msm+bounces-36269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 489CA9B45A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 10:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C06E31F235A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 09:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F681E0E12;
	Tue, 29 Oct 2024 09:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bkBqZCHs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC7A18FDBC;
	Tue, 29 Oct 2024 09:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730193846; cv=none; b=e5sJBQnJAxIBnTBPI6QifVaFtWWZZFVkXeVh+h3B0dkh0K7iJreELWk9CZysKVbTolNkqd29B+p2bxxcPl9aUNtYpVU27j9dcjRS409IG6Od3XtniaFTqaPlDMwBuRdST9/P1tlh0T2Z84RXR7bG00QOfTBRX3txW8bA3Al/OJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730193846; c=relaxed/simple;
	bh=t8IaEQ9rRW1L3QPfhWtAigM2TUBdX+/OVhC9Y29POQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UrSGQJsz7A1YAiN7affuKVqZZ4AeV5AXHl1nmmL6bUUGyPvCFHrH+Y+woIhuSNtwhroxNOvwKaTvgAdgj+TBrYrwKcS29rzrrMXY9Hh3YSAg/HQRM4g+T3p9g55IYxD17LsQrAF66weKuJPAzPHvEAy4vJqL25iWRKkYHVUDOUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bkBqZCHs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T99bsl001875;
	Tue, 29 Oct 2024 09:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lpGsjXu2/4/vriKZ7eshVzhDsf71wfnrZMqCKy/qUEs=; b=bkBqZCHs+IOEbrA6
	vf15a9RGAIZRgwt/y4ykeg71A9le/a3RPdVJdgKS9zXAtRGhv/7mviF5MYi/0T1y
	Y9uRKczYkARua+YVxYbvP9yWvX5aDXKWiVoyQ3ljWPA5D8sWK/OOOf6rRB6O1qRy
	HI+qzIsfslHKvqqYE3D284w10NKUEUbEo4DrrRg46tQZisWCoKDqbmElrayBh495
	nnC+DrlKM1hqe187hVPrBMzt3hwVxiwHQUmvLNE2xQQLZHS+NzoXdM0yG14Zwzh0
	rUahUC28PrA5JJU9a9wuj/8NFmw3HoyGkibP6YCTT0QobVMNO71UQVY05xVHz/7K
	wObpVw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grn4yy3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 09:23:59 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49T9NxIe005850
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 09:23:59 GMT
Received: from [10.216.48.13] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 02:23:54 -0700
Message-ID: <fff416f9-4ea7-4117-87b0-986087f8e142@quicinc.com>
Date: Tue, 29 Oct 2024 14:53:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: qcom: Add GPU clocks for
 QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Satya
 Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
 <20241024-qcs8300-mm-patches-v2-1-76c905060d0a@quicinc.com>
 <jhwf2slcwvkpxggqt42mfmnyiibhbnvwtqk3to7ueq3ppla7q7@23qrl2z56ygu>
 <0487791a-f31b-4427-b13b-b7ab6a80378b@quicinc.com>
 <ae61b485-d3af-4226-b2f8-e89ef5b4ed71@kernel.org>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <ae61b485-d3af-4226-b2f8-e89ef5b4ed71@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OCZVljbNCuwwsXfBjMgcmsL59k424CC6
X-Proofpoint-ORIG-GUID: OCZVljbNCuwwsXfBjMgcmsL59k424CC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=634
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290072



On 10/28/2024 12:35 PM, Krzysztof Kozlowski wrote:
> On 28/10/2024 06:15, Imran Shaik wrote:
>>
>>
>> On 10/26/2024 5:50 PM, Krzysztof Kozlowski wrote:
>>> On Thu, Oct 24, 2024 at 07:01:14PM +0530, Imran Shaik wrote:
>>>> The QCS8300 GPU clock controller is mostly identical to SA8775P, but
>>>> QCS8300 has few additional clocks and minor differences. Hence, reuse
>>>> SA8775P gpucc bindings and add additional clocks required for QCS8300.
>>>
>>> IIUC, these clocks are not valid for SA8775p. How do we deal with such
>>> cases for other Qualcomm SoCs?
>>>
>>
>> These newly added clocks are not applicable to SA8755P. In the
>> gpucc-sa8775p driver, these clocks are marked to NULL for the SA8755P,
>> ensuring they are not registered to the CCF.
> 
> I meant bindings. And existing practice.
> 

In the bindings, the same approach is followed in other Qualcomm SoCs as 
well, where additional clocks are added to the existing identical SoC’s 
bindings.

https://lore.kernel.org/r/20240818204348.197788-2-danila@jiaxyga.com

Thanks,
Imran

> Best regards,
> Krzysztof
> 


