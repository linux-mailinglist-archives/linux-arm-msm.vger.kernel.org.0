Return-Path: <linux-arm-msm+bounces-47812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2435A3301E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 20:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5866B188B844
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 19:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE8C1FF7BE;
	Wed, 12 Feb 2025 19:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bQHsgIEZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFC71FF7A9;
	Wed, 12 Feb 2025 19:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739389796; cv=none; b=WXh+JOJJu3n/kTZJEexpCJ1eeqHk6akd0PmuCmSLNOoay2eBWvlODbkiUDCgrgRHYUS44NbtyULdHtD2lTrfRM//e+JH7UIvQS3mfVYhCynWRpJp1lRgraawrpVi0sfEzUvdP9aGfk2XXnBaDLD3EloUzFfoKD2gm631wG0P6yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739389796; c=relaxed/simple;
	bh=S4kGXBmLAhT8tNvdMSHew5y3YrPfqe/6Eg7HJUaGSI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hHo8pD6B6pE2wPhZ/+9/kktjZogW8rIeJ5M9gvBkzaejHpGskxxznMPikt7D2XHs9BvXS2sJcRCo0rNjZ2V5DfZN+hXRuwdOJre+16SGqFyPn75EceIJQugYkJDSXngPzLuDuDlmp3F5XjaOVX2nQrS1eKmaiBnPJF5AvsE7LnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bQHsgIEZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C9nHt5014145;
	Wed, 12 Feb 2025 19:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DrmOzWfmrqIIZFBnsku6PH47bHCleybsQ70S0i2f8Jw=; b=bQHsgIEZdwEhdNs/
	0AHCqMrNnXKp3TLG38wXe7m9AzF/ZadQw1xWKjUC5rzoLw0056uhVDfHPUP3u5FX
	6A1KZFc53JTn2q/GOYYJteOMxgeACsP28X5SV2Qye7dJPk6ZuzFtXxWgm/Ubnr2P
	XEpvH/Qat77Uf9Avow8BM0DybvLTFjlsge13FfgWN6U2g0EmZGS8nPmvBaLQrIJ5
	pOcnCEoqLlz8xotZEST1e/3St6ef6q5wbIXrCjyepVErGRNtmX5ZwPVvRTLvoepE
	QmJVjsXiLRNaNGwNICFulkM7BD8rZmeqSiICfKa01Qo7EPTJZa/YFs+n7xwlcqDA
	oq1BYQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxv3wxpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 19:49:47 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51CJnkbx008705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 19:49:46 GMT
Received: from [10.216.10.30] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 11:49:42 -0800
Message-ID: <37954fc4-27cc-4e5f-a8ef-0e7f4ac0e041@quicinc.com>
Date: Thu, 13 Feb 2025 01:19:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] i3c: master: Add Qualcomm I3C master controller
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
CC: <alexandre.belloni@bootlin.com>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <linux-i3c@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-3-quic_msavaliy@quicinc.com>
 <fec85cd8-4c56-4b48-a15f-e7ae08352cc2@kernel.org>
 <e5cad9d0-e602-442f-b216-2f655a9526e3@quicinc.com>
 <1e3a103d-d468-40c6-b03c-723427d7bb41@kernel.org>
 <e5dcc2f0-df6d-46ed-b341-46de513c0728@quicinc.com>
 <20250211214128.GB1215572-robh@kernel.org>
 <b873c744-6b38-4ea0-a5de-2cc7dd0e4501@quicinc.com>
 <5ae2fc10-c5fe-4400-8f15-de1fb7ef7144@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <5ae2fc10-c5fe-4400-8f15-de1fb7ef7144@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QeskENwyDzHbaTTBMiHtPPqyhSpBm00y
X-Proofpoint-ORIG-GUID: QeskENwyDzHbaTTBMiHtPPqyhSpBm00y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502120141



On 2/13/2025 1:09 AM, Krzysztof Kozlowski wrote:
> On 12/02/2025 20:29, Mukesh Kumar Savaliya wrote:
>> Thanks a lot Rob ! sorry, i was late to respond on this while waiting
>> for other comments agreements.
>>
>> On 2/12/2025 3:11 AM, Rob Herring wrote:
>>> On Mon, Feb 10, 2025 at 09:41:28PM +0530, Mukesh Kumar Savaliya wrote:
>>>> Thanks Krzysztof !
>>>>
>>>> On 2/9/2025 5:10 PM, Krzysztof Kozlowski wrote:
>>>>> On 07/02/2025 13:03, Mukesh Kumar Savaliya wrote:
>>>>>>>> +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se-clk");
>>>>>>>> +	if (IS_ERR(gi3c->se.clk)) {
>>>>>>>> +		ret = PTR_ERR(gi3c->se.clk);
>>>>>>>> +		dev_err(&pdev->dev, "Error getting SE Core clk %d\n", ret);
>>>>>>>> +		return ret;
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>> +	ret = device_property_read_u32(&pdev->dev, "se-clock-frequency", &gi3c->clk_src_freq);
>>>>>>>
>>>>>>> You never tested your DTS or this code... Drop
>>>>>>>
>>>>>> I have tested on SM8550 MTP only. Below entry in my internal/local DTSI.
>>>>>
>>>>>
>>>>> And how is it supposed to work? Are you going to send us your local
>>>>> internal DTSI? Is it going to pass any checks?
>>>> was saying about code was testing with MTP. DTS was tested using dt-bindings
>>>> check.
>>>
>>> make dtbs_check is how you test.
>> Sure, we are running "make dt_binding_check
>> DT_SCHEMA_FILES=qcom,i3c-master.yaml"
> 
> Hm? Please read it again. You anyway have it documented in your company
> guidebook, so I expect you follow that one *very* carefully because
> reviewers repeating the same as your company book and then repeating
> themselves three times is just too much.
> 
sorry, i will run what Rob has pointed "make dtbs_check" as it's giving 
me exact clarity what to do. I just mentioned what i was doing.
And as you pointed, will follow complete internal guide too if it's 
missing dtbs check. Thanks !
> Best regards,
> Krzysztof


