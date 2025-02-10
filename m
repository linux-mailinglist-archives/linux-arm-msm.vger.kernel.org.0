Return-Path: <linux-arm-msm+bounces-47441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E987A2F2A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 17:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DE343A49F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 16:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349B224F587;
	Mon, 10 Feb 2025 16:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kFZS9m9/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89746244195;
	Mon, 10 Feb 2025 16:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203927; cv=none; b=WFmZ5NwVbLefaGbyWArc5myVOIYw6Va9y8+JHwvnQ2l7UxFX4QhnrA3KkYx2unm37LRj7ifdQlJm0AAj6SH2AwGJiJv5CWlt1WzJLgiEWw9hk9Ctq3DzvEwG6n5lHqTeIkBLmWKwV7+li585ZMHl0T9W7jJDDamWqXZQEqM1JZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203927; c=relaxed/simple;
	bh=AHwUIBv6+Erw5t7tMPI91G8lNiY1gI+y8pq1yPoloQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r7V451qjlQ9IfFuD9oFK970ZGR9SyfqB1wGUHqdgUr+5XbSk35lyCg8KYYkT2NZf7WKo4grbsmQMz7sFKt20nQPv+k8jQIZr77Qth4B0fo5AgJXe/5R2pTTNoPfG227rJQNrElnRCZSF1gikkSH2Sl8t6vdW8LRd4OLbmjXgGqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kFZS9m9/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A96uHC008036;
	Mon, 10 Feb 2025 16:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ovlsn9F30Fw0mJ+hUyiy+C9ddMhEbRMDrmwls+a82pI=; b=kFZS9m9/ioBWHCtY
	1d7MYDui0SC3jhtXICjAxvatoICxpGdIEOUjvCd9zTTfm7VpqJMCyo3qqdzVFxyi
	52bEzChpaDPkca8ok/e7f4MJH1ctM6/uDx/zwBoaezH9iWI+BjQrG4GhsGvZurKR
	1AiVa6lxoNvkU6o5HgM0/q2wZiDlByNJVAlL0yzRfAPdeYitOvNhUyhX7E4fiUBf
	9RbP5pYazyuPc2D07X70xbEz4BEQKyWlrNXZeSKeFMn1JArf4GELhcMvdkivjfdS
	rPKhW19nO9KhoswFfDAjZO7EJZRuqiXy6yvRbj/foaxzEwPj6BX1/P+6jIO9pLxj
	DznO2g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0guvucd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:11:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51AGBsbu016531
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:11:54 GMT
Received: from [10.216.47.54] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 08:11:50 -0800
Message-ID: <e5dcc2f0-df6d-46ed-b341-46de513c0728@quicinc.com>
Date: Mon, 10 Feb 2025 21:41:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] i3c: master: Add Qualcomm I3C master controller
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-3-quic_msavaliy@quicinc.com>
 <fec85cd8-4c56-4b48-a15f-e7ae08352cc2@kernel.org>
 <e5cad9d0-e602-442f-b216-2f655a9526e3@quicinc.com>
 <1e3a103d-d468-40c6-b03c-723427d7bb41@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <1e3a103d-d468-40c6-b03c-723427d7bb41@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vYpgUUbtsYet6KvVYzwGWPWZ3NDOxJUo
X-Proofpoint-GUID: vYpgUUbtsYet6KvVYzwGWPWZ3NDOxJUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100133

Thanks Krzysztof !

On 2/9/2025 5:10 PM, Krzysztof Kozlowski wrote:
> On 07/02/2025 13:03, Mukesh Kumar Savaliya wrote:
>>>> +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se-clk");
>>>> +	if (IS_ERR(gi3c->se.clk)) {
>>>> +		ret = PTR_ERR(gi3c->se.clk);
>>>> +		dev_err(&pdev->dev, "Error getting SE Core clk %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = device_property_read_u32(&pdev->dev, "se-clock-frequency", &gi3c->clk_src_freq);
>>>
>>> You never tested your DTS or this code... Drop
>>>
>> I have tested on SM8550 MTP only. Below entry in my internal/local DTSI.
> 
> 
> And how is it supposed to work? Are you going to send us your local
> internal DTSI? Is it going to pass any checks?
was saying about code was testing with MTP. DTS was tested using 
dt-bindings check.
I should add "se-clock-frequency" and "dfs-index"
> 
>> Do you mean to say i should add this property in yaml too ?
> 
> Yes.
> 
> You cannot add undocumented ABI. That's a strong NAK.
> 
sure , adding both properties into yaml.
> 
>> se-clock-frequency = <100000000>;
>>>
>>>> +	if (ret) {
>>>> +		dev_info(&pdev->dev, "SE clk freq not specified, default to 100 MHz.\n");
>>>> +		gi3c->clk_src_freq = 100000000;
>>>> +	}
>>>> +
>>>> +	ret = geni_icc_get(&gi3c->se, NULL);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/* Set the bus quota to a reasonable value for register access */
>>>> +	gi3c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
>>>> +	gi3c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
>>>> +	ret = geni_icc_set_bw(&gi3c->se);
>>>> +	if (ret) {
>>>> +		dev_err(&pdev->dev, "%s: icc set bw failed ret:%d\n", __func__, ret);
>>>> +		return ret;
>>>> +	}
>>>> +	dev_dbg(&pdev->dev, "%s: GENI_TO_CORE:%d CPU_TO_GENI:%d\n", __func__,
>>>> +		gi3c->se.icc_paths[GENI_TO_CORE].avg_bw, gi3c->se.icc_paths[CPU_TO_GENI].avg_bw);
>>>> +
>>>> +	ret = device_property_read_u32(&pdev->dev, "dfs-index", &gi3c->dfs_idx);
>>>
>>> The same. You cannot send us hidden ABI.
>>>
>>> This code does not look like ready for upstream. Are you sure it was
>>> internally reviewed?
>>>
>> yes, we have taken 2 rounds internally.
> 
> 
> And none of the reviewers spotted undocumented ABI? OK, learning
> experience for me.
> 
> 
>> Are you saying i should add this into yaml ?  what do you mean by
>> hiddern ABI ?
> 
> 
> Where is the documentation of the ABI?
> 
can you please point to other ABI document so i can prepare and share it.
> 
> 
> Best regards,
> Krzysztof


