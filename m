Return-Path: <linux-arm-msm+bounces-52773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D61A74CBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 15:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CFE8189909E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 14:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E5821B9C9;
	Fri, 28 Mar 2025 14:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eBd6+CQu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF7221ABC3;
	Fri, 28 Mar 2025 14:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172158; cv=none; b=crMKyN26rwLwXHuyiftt3dKCOJfafQr41XMzAENRII3ER7rLbropCesU8SOevZgH9xgXl2Q8l7cmbeCHFEEpA7zf4hLYAW5ke5pz6B8eDBR+NXUq6LpIbUuC7/rfrIvzdZuRFYCMcySZicZ/UTDhCOrYtPZ4Lq+SuDG3DNwx7ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172158; c=relaxed/simple;
	bh=l/OiCU06Blsj/S9+Z5QZVOgiUG9TGxtRhkLs+UWeJas=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qWkhnI6Q/aGc/cn2IBbrvGY1SbF2/ypG2uwCMoLxbD6nvQ4+FLdKOKza1kzysAudXhz/SvfcNvdiSaqgKbbG1CKy22QJh+UZWTdO0tdZa8A7pyMt4RS3hu/gW82Dv2LLFUyeqDGyNkvTLgfbGMA95IsXxz5rrq6eBelMWBiSREE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eBd6+CQu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S7QOUS028066;
	Fri, 28 Mar 2025 14:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n4jj968sHeyLb1l/ofhgzVS26MNlRAok8RT8dkLpyZo=; b=eBd6+CQuy+BtwmZk
	kFfnjpCsKLZnsuCjbZN3K1qYrctr/mzxeXCTofl2GvXvwEwCw8Gq8Z4LNhBuJdVo
	hfTmddjsKnO2iL9omZDOm6zvkd91VNcth09inJp+qYUtLBrLo0y5LO68l2v+oIMK
	22R5ReVFKcbvBLqkI/70qGCCKwr7zVSigddEHCv0rmdtd5op+6q+9HK9U/nzl8IB
	S2OXo/WZsDO5TpSOvqow6aVoKS9MCEt9eQXgFpG+8We/eeowQYM0orSR9JSuuTSs
	erV9S29gmHmUM5Wbg8ZGDOgLHxveN/4jnbuWzUhgFdjU7bIBH18bN0cmTv9DTJEW
	UGXv4A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45nat0u3vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 14:29:00 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52SESxAi011156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 14:28:59 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Mar
 2025 07:28:55 -0700
Message-ID: <f6b0cec1-a20d-4ed8-84b2-06d464ae5e0c@quicinc.com>
Date: Fri, 28 Mar 2025 19:58:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Trilok Soni <quic_tsoni@quicinc.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250326141641.3471906-1-quic_msavaliy@quicinc.com>
 <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
 <d0b178ab-ad22-4230-a790-6a19a6abfd89@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <d0b178ab-ad22-4230-a790-6a19a6abfd89@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PPkP+eqC c=1 sm=1 tr=0 ts=67e6b22c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=xmqELmrshfw207yTACQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: J84Qot4ok5FWK2Vttf6Ol0Gvslz_I0KW
X-Proofpoint-ORIG-GUID: J84Qot4ok5FWK2Vttf6Ol0Gvslz_I0KW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_07,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280100

Thanks Krzysztof for correcting !

On 3/26/2025 7:58 PM, Krzysztof Kozlowski wrote:
> On 26/03/2025 15:16, Mukesh Kumar Savaliya wrote:
>> +
>> +static int i3c_geni_resources_init(struct geni_i3c_dev *gi3c, struct platform_device *pdev)
>> +{
>> +	int ret;
>> +
>> +	gi3c->se.base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(gi3c->se.base))
>> +		return PTR_ERR(gi3c->se.base);
>> +
>> +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se-clk");
> 
> Never tested.
> 
sorry, i ran and i got below error now:
i3c@884000: Unevaluated properties are not allowed ('clock-names', 
'interrupts' were unexpected).

so i have made below change and ran dt_binding_check + dtbs_check, i 
could fix the issue. Let me have this review internally specific to 
dt-binding and will post next patch after internal review. So i can 
avoid such misses.

yaml :
+  clock-names:
+    const: se
+
-  - interrupts-extended
+  - interrupts

example:
clock-names = "se";

>> +	if (IS_ERR(gi3c->se.clk))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(gi3c->se.clk),
>> +							"Unable to get serial engine core clock: %pe\n",
>> +							gi3c->se.clk);
>> +
>> +	ret = device_property_read_u32(&pdev->dev, "se-clock-frequency", &gi3c->clk_src_freq);
> 
> I don't see previous comments implemented. Comment was: "Drop".
> 
> You did not test the DTS - again - even though I asked for that.
> 
Sorry for miss. I did test for this but what happened is while i worked 
for multiple other changes, i did miss merging of removal of 
se-clock-frequency from the driver code. I had hard-coded it instead of 
removing because we don't give this frequency selection to user right now.

> You claim you did internal review, but I have doubts because internal
> review would tell you how to test it (there is comprehensive internal
> guide - see go/upstream). Then the testing would point out this issue.
> 
> Such trivial things should not be in v1 even. But they happened so you
> got the review. Now you sent v2 ignoring that public review.
> 
> Sorry guys, please improve internal processes instead of wasting
> reviewers time.
> 
Sure, i agree there are misses. will have internal review with 
dt-bindings and related changes in driver, then will post V3.
> NAK.
> 
> Best regards,
> Krzysztof


