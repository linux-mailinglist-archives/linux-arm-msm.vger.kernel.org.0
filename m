Return-Path: <linux-arm-msm+bounces-90930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBGGEUjZeWlI0AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 10:39:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1E29EE82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 10:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E7623003833
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4F53491C2;
	Wed, 28 Jan 2026 09:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SAqH+zfX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hg3WAR/n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E44337BBB
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 09:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769593155; cv=none; b=Zh5mulT24oUWERjp9GJChMYRXFqCN89bdbP/gQdHxCH3nc5knj+gwB9ZmU6C6yD1BdPs4Bnn5WbxiSLXmf9vd6Qu6+e0IOJh7Pcg5e0lyJ9jHFtfnoIjqssYWSeNGexNDx8BsrQVNERCGIQfyEWKm4RXCE8guSwgqMrX9OjMe6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769593155; c=relaxed/simple;
	bh=K5ZEN/duoiXPG9bzPnaDmslMimyxgixMi1nt9Q3UDOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDrmF7PJ9xXTBSGoFr9Gy74x08HK/BsRs/8N98DFXlmuyKd1CVgySBoq9TzM0Pl9kGBs095hvojUz46cQTFL5mWmknf64HUrFEg1Eh+CQfA2l2mLqg7NxxbWQHYlBdJqU2QufibOtTVJr0NfLlFMow0u3ED/NErtauCLwd9faqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SAqH+zfX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hg3WAR/n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S927Sr811587
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 09:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nm5vNdqRfLEBF55FPQ1/gDCsJCzH9FYWFBL/2AtZOhg=; b=SAqH+zfXwKuoA27Q
	u//MjSCjUME9pePPqosMKO2u/QcUUQfXvimi7Tf8PYIwdRfVGaRK6WGlW7SWShFY
	xIi1XDmGJ9NUz6pjL0SMbyqcHivCMFB00WbFm1Set/cK1LqpTNlRxAa6TgNA8vLh
	Fmewby0sf5vorVd+9OfYLWs522rvh/a8aX1Cza0srJBQOECqzwC4UEbufjaEDXG3
	5kT/4shwmv9BzrauhekkpdWz/qKAxGaP0kWspuONws2QiLzbtZRwbPmoW3NbplJz
	j3BEMpDRuhOnMHgobeudlFerCirZG6zPXEePnq5nuoi0i1gqwQjPdEb7v7LNFvE5
	vydPag==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbhve2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 09:39:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c314af2d4so4820422a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 01:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769593152; x=1770197952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nm5vNdqRfLEBF55FPQ1/gDCsJCzH9FYWFBL/2AtZOhg=;
        b=hg3WAR/ngmGfHbKjbU1MpS+gXDMtO84cOYGRhlJnvqFcmLAPK1VDq4xedKra8A6+hB
         tlNRjLGZg5sTmMLUZhIEvKwmbnkTYYo256AylEGkaF7nQ0XLkQUPHrl3AcDKCpzFN5YK
         4kNhyhEvP4HeHDUk0GcoH4a9hkxLbXd1rg5qKKbooMIOyMf2W88qqJocTySFMfn5tyBB
         bXbAb5Ttci4IeIgb0NBUm23v0ULvOikvzlAFIIi+s5eGpeqF2ei8j1Y7HKr+xSz+AQGf
         vgzIrEyt3l3TTLgwU9W3c7XkXnvhdjbMXMNpNhQPrLAqabO+vA1WHVYQs/f0tbLyQHDf
         nQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769593152; x=1770197952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nm5vNdqRfLEBF55FPQ1/gDCsJCzH9FYWFBL/2AtZOhg=;
        b=PRZFtyVjheWMzORBDD77zDv1eVjEA+EkDl0DzLCZ41Qfj7V5k/eeG6iodQ9xRL/DSb
         OmLFuHBBgkkZsyjCXUg1HtFUc+B2ijSPnD/a3MHQ67nK7bZOAydc2LA58SqQLdiJWp2t
         KGSqUqkMQHbUHhpyuQiTMnioQGD7RY0ggLleTmG8xrqmIzCq619IDOenZMRj7VcBx4f7
         ZDoREV/cna5h3bJCswy6coMdDkIg8aLc1dExBumK67Ps+TXtI9AdalHKLOmbeBrbUoVW
         HwhaHbh5vt5+jfINkvT+DeretB6Fpgkv6weoPLdvUJJasQ7UQjCx3RBryfVlKF6z39/i
         sVLw==
X-Forwarded-Encrypted: i=1; AJvYcCWL80nUSGY+c3gOZCRhwP/pQdQ6IF9H9DR+3YlJeQRIqVlrQVVdyr2NEaKDFltZ3KfRvZHP7GOLX/eT40LS@vger.kernel.org
X-Gm-Message-State: AOJu0Yymh4BDXO84z6MNHD7v+pfvTZ3MDP7HLP0h88Tyr4MJ4bCC31U6
	y6W7v2Wq0HEjAKI0T9vA9WnHYpw6tURfgwH01HT9LN/i2KtBeG1Uxxw+N6ZKHwab7WlTwGp3j8B
	v7hnbGUB+ihXu84YUfmIs1BKaakc0xfqIvs2yRh83tTs77gbm/0rz/qqfNtGulObXGvHh
X-Gm-Gg: AZuq6aLRqnU6uSwegs74BI71sJzsAbBrgTY7j43nw570HJ7XfUQg9q7wgDXd4EWKiU/
	LXnf7vUjUZ2Rroj5mm/+TdjEbHd2YcnqybZJoalJDTOAqyuXFYhab+0+svRUJsPs+43ZkzKCT64
	AvDfLubJn0dc1c1ibaF6/OHTDBGHR+0BRGhe2f4MDdOKsDisp0grYAsuE7LNexffRdDPaUHX0Kt
	xgJ19KqsCGlr7ZCJJbE7gTF4iZxrdQpmtFfXKPGVmQbcFgIVravAItGroh0Yxida45PH7JY7yKY
	pxJAp1D1MgVfNtw6lP0YgT3FoCr5rIz6MeLMnD8I9aMD37lxRkzZ0ffoSuzeHzSB+0j3oB7fc86
	btkOjziuipsBolbLfkmIHGC5nBXPuDsSpIfh1XiA=
X-Received: by 2002:a17:90a:dfc4:b0:341:88d5:a74e with SMTP id 98e67ed59e1d1-353fed87bf8mr4407353a91.29.1769593151259;
        Wed, 28 Jan 2026 01:39:11 -0800 (PST)
X-Received: by 2002:a17:90a:dfc4:b0:341:88d5:a74e with SMTP id 98e67ed59e1d1-353fed87bf8mr4407331a91.29.1769593150691;
        Wed, 28 Jan 2026 01:39:10 -0800 (PST)
Received: from [10.218.12.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f61e0007sm5012246a91.12.2026.01.28.01.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 01:39:10 -0800 (PST)
Message-ID: <ef1911f5-2d96-428c-93f1-3d1815710894@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 15:09:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] remoteproc: qcom: probe all child devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, mathieu.poirier@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, amitk@kernel.org,
        mani@kernel.org, casey.connolly@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
 <20251223123227.1317244-3-gaurav.kohli@oss.qualcomm.com>
 <evb5tn2cht7wk76fuc2wpsyxepknigfw37633n6ypuapstbceh@tn5glmi65bdv>
 <cb5430c8-12d6-4439-b1ae-c2f36f29a9f8@oss.qualcomm.com>
 <57493aef-fb35-4377-8cf3-1df7f53470c9@oss.qualcomm.com>
 <74h7r3vsig3csejax3eu3uk53mdiimg2hjx7ntmmfrwdai6s3j@eiztghclfcvt>
 <5db5dafd-3c1f-4844-b822-bbfe86b3eb4d@oss.qualcomm.com>
 <ctrpymbvjlchp3djnsqq4bghkq2zvqnf5bebszi74f3d36l5dv@icvnkdwgdxmi>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <ctrpymbvjlchp3djnsqq4bghkq2zvqnf5bebszi74f3d36l5dv@icvnkdwgdxmi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pqxkHosaWdx68mbXcd23MZYNXVRUM-V8
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=6979d940 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=PKciL30m5ai67S71p9gA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: pqxkHosaWdx68mbXcd23MZYNXVRUM-V8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA3NyBTYWx0ZWRfX65D5nmA+xh9n
 tSUk6ApDrmvzyNaqQKXN91I/zy6rGOw7KP9W702FVDmvSYq7HAp26qJ0WDTqaFC/4qEhtrVEpu3
 wYt4QRxrHU+b9wVGnxXKVENO363YwIU+HgVm5yzjTDlwze520XFv1ueQem9QyNKieJJBdAAaUn0
 /L04imGpxZOxLZ+Ia94bI7fg1+AmVDMHNLxUBcaTNKBi66GhVTogn/ta4dLVOzUbBXYtQyEYUsy
 6NoAkKJ2d+ot9kPpxAyaSoNU3kR4cNzgZU9ePDRkey7PZ+J9fBYR8yVpRnjo/yqQ1sWMjPz3BDW
 AG5wz7pbvHGjIjfGt9oBcYgQRen4pGY4mbYrVGFnKrsapuv6KOqs3QsR3lSmLORb9Pmgga1d6t4
 GAHYKjlZwA5zcgHB/sfpr4cvgIRzwc0C8pnEq5/DDZVw1eJRS23u4MHgGoyE3GHIGEdxdw0nTiD
 MhOGZRjjUV0sHRwmU5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-90930-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF1E29EE82
X-Rspamd-Action: no action


On 1/27/2026 10:11 PM, Dmitry Baryshkov wrote:
> On Tue, Jan 27, 2026 at 09:42:10PM +0530, Gaurav Kohli wrote:
>> On 1/24/2026 12:33 AM, Dmitry Baryshkov wrote:
>>> On Fri, Jan 23, 2026 at 07:23:39PM +0530, Gaurav Kohli wrote:
>>>> On 1/8/2026 12:37 PM, Gaurav Kohli wrote:
>>>>> On 1/3/2026 8:26 PM, Bjorn Andersson wrote:
>>>>>> On Tue, Dec 23, 2025 at 06:02:21PM +0530, Gaurav Kohli wrote:
>>>>>>> From: Casey Connolly <casey.connolly@linaro.org>
>>>>>>>
>>>>>>> Generalise the qcom,bam-dmux child node support by probing all
>>>>>>> remoteproc children with of_platform_populate(). This will be used to
>>>>>>> enable support for devices which are best represented as
>>>>>>> subnodes of the
>>>>>>> remoteproc, such as those representing QMI clients.
>>>>>> Please flip this around, start with the description of the problem
>>>>>> you're trying to solve.
>>>>>>
>>>>>>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>>>>>> This must have your signed-off-by, where you certifies the origin of
>>>>>> this patch.
>>>>>>
>>>>>>> ---
>>>>>>>     drivers/remoteproc/qcom_q6v5.c     | 4 ++++
>>>>>>>     drivers/remoteproc/qcom_q6v5_mss.c | 8 --------
>>>>>>>     2 files changed, 4 insertions(+), 8 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/remoteproc/qcom_q6v5.c
>>>>>>> b/drivers/remoteproc/qcom_q6v5.c
>>>>>>> index 58d5b85e58cd..a02839c7ed8c 100644
>>>>>>> --- a/drivers/remoteproc/qcom_q6v5.c
>>>>>>> +++ b/drivers/remoteproc/qcom_q6v5.c
>>>>>>> @@ -6,6 +6,7 @@
>>>>>>>      * Copyright (C) 2014 Sony Mobile Communications AB
>>>>>>>      * Copyright (c) 2012-2013, The Linux Foundation. All rights
>>>>>>> reserved.
>>>>>>>      */
>>>>>>> +#include <linux/of_platform.h>
>>>>>>>     #include <linux/kernel.h>
>>>>>>>     #include <linux/platform_device.h>
>>>>>>>     #include <linux/interconnect.h>
>>>>>>> @@ -351,6 +352,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5,
>>>>>>> struct platform_device *pdev,
>>>>>>>             return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
>>>>>>>                          "failed to acquire interconnect path\n");
>>>>>>>     +    of_platform_populate(q6v5->dev->of_node, NULL, NULL, q6v5->dev);
>>>>>> There are other child nodes here, in particular the GLINK and SMD edges.
>>>>>> Do we really want platform_devices registered for them?
>>>>>>
>>>>>> Regards,
>>>>>> Bjorn
>>>>> thanks for pointing this, can you please suggest the right approach.
>>>>>
>>>>> This should not impact glink, as that is registering as rproc sub node,
>>>>> And we need rproc cooling as child node
>>>>>
>>>>> of remote proc subsytem to create probe dependency only.
>>>>>
>>>>>
>>>>> Can we do platform populate for specific child, would that be right
>>>>> approach. or we should create rproc cooling as independent of parent ?
>>>>>
>>>> HI Bjorn,
>>>>
>>>> I’d like to highlight the impact and details of placement of remoteproc
>>>> cooling dt node:
>>>>
>>>>
>>>> ->As a child of the remote proc subsystem node:
>>>>       In this configuration, the cooling device will only be probed once the
>>>> corresponding remote proc subsystem itself is probed.
>>>>
>>>> ->Outside the remote proc subsystem, may be part of soc node:
>>>>       In this setup, the cooling device will be probed independently. It will
>>>> wait until the remoteproc subsystem is brought up
>>>>       before completing cooling registration.
>>>>       The drawback here is that if the parent remoteproc subsystem is
>>>> disabled, the cooling device will still undergo an
>>>>       unnecessary probe, even though it cannot be registered.
>>> Bjorns question was different. It wasn't about pushing cooling device
>>> outside of the remoteproc node. It is about not registering the devices.
>>>
>>> Can we follow the approach outlined by qcom_add_smd_subdev() /
>>> qcom_add_glink_subdev()?
>>
>> Hi Dmitry,
>>
>> Thanks for the review. Since the remoteproc cooling is a QMI-based driver,
>> it will receive the
>> subsystem up notification directly. Therefore, there’s no need to make it a
>> subdev node or
>> tie it into the init/reset sequence of remoteproc subsytem.
> But you've added a subnode for it (and we are discussing exactly
> of_platform_populate()) call. So, you are tying it to the remoteproc
> device lifecycle instead of the remoteproc subsys, which seems strange
> to me. There is no cooling device if the DSP is not running.


For the cooling feature, we don’t need to define it as a subnode. The 
cooling subsystem becomes relevant only
after the remote subsystem is up, at which point it will receive 
add/delete notifications from the QMI server.


If child nodes must be modeled as subnodes for rproc, we can move the 
CDSP TMD out of the remoteproc and add in soc.
Is there currently a way for the remoteproc core layer to call 
of_platform_populate() without requiring a subnode?



