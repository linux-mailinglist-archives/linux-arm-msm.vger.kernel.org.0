Return-Path: <linux-arm-msm+bounces-35265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AE69A7063
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 19:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7145281835
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 17:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7DA1EBFEF;
	Mon, 21 Oct 2024 17:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NlJXDB6B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A021EB9F3
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 17:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729530067; cv=none; b=H1saGJiRuMK4DD6zPG6eeu/oCN8t24R2gQLEex4YaqCdGMQZkkIV5DjcEfIkb3q5E/9uYqlCCc2XOSitbfTIPbYlAfJ8MpUd5MSc8U9NrYHLyhV6bWIH3zWuYRze1XpmI4LPNbjTdIjhYbEhiXWVG/ZbuVdXjYQLU67sErs85Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729530067; c=relaxed/simple;
	bh=r6o8rdIvn3XeSJKRPzNcpH/BfDqUi8A5FsCsX1zDXWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dkO69NMGHIKUzjDdlfbecxNHADSlLr/DbzM9kFBV4S2enEITPnx7X3JhlRll5H7jJmBOyZMPH4urUTCtAl0eQ5q8T0UGBOggQERd0F7qJW0osqexzvGQVn5PMrz2S6cmxurb+SHkDHsde/h0+Q2aXRL9SM5Z6LcxZ3eyeVPbYQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NlJXDB6B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49L9fQGJ000739;
	Mon, 21 Oct 2024 17:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XAzviJ4nH0MdXJtAvjaBKYau9mxWMWnSPv7eFyma4jM=; b=NlJXDB6BjkCnedmQ
	CCLlz8rDIXaL7Zqq12bmlFGzTOnclVFV4AwcQXHch/aLwpf5tGnmZCeFOxsMqzmO
	H0+8e0RrjDAZPbRSEQdQSa/8JTeTJt9zXTfrQgmtn1rYzzyA3BBZeiB6vUKOBQ7p
	pwxc8P7ZCR4JR6MaetEc5JenE6zeW1YG+eIYudMLp9919dFArPJEp6EXnNCO2Ajy
	KtYEJHGa5SWcKwMaB5J+J86oF1uPBk+V7Fz0bsYES42a6uhZhy5Qi1U+JDVcAFlv
	s8rsVkIysTi7hUqVEYcwOZsp8D4JtZZ/M+NaH6a+TEofMjhydYd49wQbPwBo36AI
	cmYuJQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmj11e67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 17:00:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LH0tfm028207
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 17:00:55 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 10:00:55 -0700
Message-ID: <b329a928-45f0-496d-b4cb-b79164f54653@quicinc.com>
Date: Mon, 21 Oct 2024 11:00:54 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Add crashdump to Sahara
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
CC: <andersson@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
        <quic_carlv@quicinc.com>, <ogabbay@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20240918155254.3186031-1-quic_jhugo@quicinc.com>
 <Zw2SjWn43zeFjBtR@hu-bjorande-lv.qualcomm.com>
 <6a2fe39b-eb7a-4b6d-9ce3-20685663cffd@quicinc.com>
 <Zw68qSk8n+Izrevg@hu-bjorande-lv.qualcomm.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <Zw68qSk8n+Izrevg@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XDKYoB5yRp_NTteYzsumFwG-3x1nitW-
X-Proofpoint-ORIG-GUID: XDKYoB5yRp_NTteYzsumFwG-3x1nitW-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210122

On 10/15/2024 1:04 PM, Bjorn Andersson wrote:
> On Tue, Oct 15, 2024 at 12:34:29PM -0600, Jeffrey Hugo wrote:
>> On 10/14/2024 3:52 PM, Bjorn Andersson wrote:
>>> On Wed, Sep 18, 2024 at 09:52:54AM -0600, Jeffrey Hugo wrote:
>>>> +	dev_table_entry = (struct sahara_debug_table_entry64 *)(context->rx);
>>>> +	for (i = 0; i < table_nents; ++i, ++image_out_table_entry, ++dev_table_entry) {
>>>> +		image_out_table_entry->type = le64_to_cpu(dev_table_entry->type);
>>>> +		image_out_table_entry->address = le64_to_cpu(dev_table_entry->address);
>>>> +		image_out_table_entry->length = le64_to_cpu(dev_table_entry->length);
>>>> +		strscpy(image_out_table_entry->description, dev_table_entry->description,
>>>> +			SAHARA_TABLE_ENTRY_STR_LEN);
>>>> +		strscpy(image_out_table_entry->filename,
>>>> +			dev_table_entry->filename,
>>>> +			SAHARA_TABLE_ENTRY_STR_LEN);
>>>> +	}
>>>> +
>>>> +	context->mem_dump_freespace = image_out_table_entry;
>>>> +
>>>> +	/* Done parsing the table, switch to image dump mode */
>>>> +	context->dump_table_length = 0;
>>>> +
>>>> +	/* Request the first chunk of the first image */
>>>> +	context->dump_image = (struct sahara_dump_table_entry *)(context->mem_dump +
>>>> +								sizeof(*dump_meta));
>>>
>>> I would have preferred to see this (and above) written such that it's
>>> explicitly clear that you're filling out an array of entries and then
>>> point this to the first entry in that array.
>>
>> I'm not sure I understand what you would like to see here.  Can you perhaps
>> give an example?
>>
> 
> Per your devcoredump definition at the top, image_out_table_entry is an
> array of struct sahara_dump_table_entry, which you fill out by sliding a
> pointer starting at mem_dump + sizeof(*dump_meta).
> 
> You then have context->dump_image to be a pointer to each element in
> this array, except that it's not expressed as an array...
> 
> But it took me a minute to understand that this was what the code is
> doing.
> 
> If you instead wrote it as:
> 
>    for (i = 0..table_nents) {
>    	image_out_table[i].foo = bar;
> 	...;
>    }
> 
>    context->dump_image = &image_out_table[0];
> 
> (Or perhaps even make dump_image an index into image_out_table)
> 
> It would have been obvious to me when I looked at the code that you're
> setting up an array and then looping over each entry in the array.
> 
> 
> So, I don't see anything wrong with the logic, but it would have been
> easier for me if the code manifested this array, as an array...
> 
> Perhaps I'm missing some detail which complicates things, as far as I
> can tell the logic presented is reasonable.

Ok, I see what you mean, and I believe its possible to transform the 
logic to use array notation in the loop as you suggest.

-Jeff

