Return-Path: <linux-arm-msm+bounces-74856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB58B9D0D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 03:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F4F3428164
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE682DEA97;
	Thu, 25 Sep 2025 01:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YPKwqz5I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9386772627
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758764790; cv=none; b=s20bwi0lCwVM8WGWF5N6sTt4rZR/QAPzXXRcJg8fPzwaPILXZS3Z1kwPp98wORcjy5+Ut3qeYDWP6MwUQbdYzhwo/7gj3YDPgSwhLW4gqPqXCzNEJo4B89p0ZdZFTE88OZPCadQNLaPpCuYHd0f22WcV4H5H8ZnZCIc7bJQLKlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758764790; c=relaxed/simple;
	bh=u49OwmKzl7uoH8qGSLjjzbww9IPB7agb2Aw94ZJcZTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qh0aKO3AED2pSt5jn9QEZEb4rxwRZFPLNRv0qdC4jfonV75aRIIdUd6ibd6e0GtVYBWf7aPm+UrIdSvMxcY+w4h7zJgyF1roe4PXGlLrAnJKwWsvghbxz+sMULILUTkkPUR6XzLgVL7QF8PZ+iwXLoFwhPZFOPfTSl6WJbImfuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YPKwqz5I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0qipq001992
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z10OZLyPBneNQ93YhoH9EuyJNkxrj7NSBb0ueDONA9o=; b=YPKwqz5Is8V8m0Li
	ycZ6HnW5uOrnFV3/3ucxzdwRSOYy3kw90cEYCZ/WU3Oz+WQOJRaqoj7SmKdQDixH
	zOscYBeIJcCpipV7+0KhEhpoViCFId0kJPBcP5+eHyIil6Pac3OrxD7rSrGf6MIB
	VrmHDxa2lVzZS8sncR4evzL3u5s5b3NDFxJcjkVUrI35NkDhCQ/saPrEojr7mkFz
	OdH4Jkm3OyxxrVZ7p8D/XDZ1V0JVp+JkuFM4AqN7UOpskjVuuD+9LLqTtcOeZ1cP
	IZtezERVwahLGxTecBwvHqfTocJAqjMoSvDwL++oNdB+TTwXhMCUt+uzcwuL7spS
	JKH7TQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98pbg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:46:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4c72281674so276320a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758764785; x=1759369585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z10OZLyPBneNQ93YhoH9EuyJNkxrj7NSBb0ueDONA9o=;
        b=nJCSeQBM7rnc/R1lsgFKsF4dLFVffJQ77H3vAsBs4laKSTIhd+LNOL2/VjBdeCH6aT
         JompoSvXduOQNWSLLx0bZPUXwXOSR2k6Isup03OXIKetm9VJ/RPgXec/fPuEV6gbcwvP
         Tc1a1+BUGPnbpVjz61yZLe6zy+oMBHRT+w9BVLgNxY8stPSrgvV28jnU+3I1kaDwNx48
         NbPQAewf0Sm9eYUmLDjvo8xrgVahLkpjSUN19RkiVWgz4nMv7JUfOHhsmBDhu3Vmi5F/
         WksjmGLU1G2abHvRfpyKlyxFnVATYzZEZcxxAqRLHJQevffcrYY6hWJ7422DmohqOGnA
         06sA==
X-Forwarded-Encrypted: i=1; AJvYcCU+sLMIyEbYt0fgQm7LpYSJzdacU0ZvZXvuhp/6a8tBXkNiGPGYw8NA4DREnitKbt3QzUe2b+ADLN4l0WAZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9/dlV34tDTT0R0yFBnWwzEVUsUSzHxIrxJTCwcbKAwqkxhMxz
	33d0holG5D4jzTnDQqpKzPbLA6j8jHyhjk0/BfD9hMeIXENbP/8vyFdu5PNfrKjpmH2dkNrK/DZ
	8jN3j9yYCgS3Uh3GKKO96IQmKAE+c0ngT2FMIjgvePim6yp8H+Gx6hZpAGDjkHliVVKtglsehMv
	c=
X-Gm-Gg: ASbGnctAq/GP5n8euzGR8ERm6apxtrPK851eaBK/bhaywO/KzXCJHTs1WxLpciLsJxm
	ONaRCl87lX4Pz4LqbhX13Oqg8XezpBSu+woZVZZZWDbwKmZS9IRoGQ97/XndN6wI8T6U2FBOwqk
	8CzA3/Zzl9dFulAAuKajeN2/slLBpH9nQ1CXjrZ7IIMIEbL5ZD1YTK2NqZRIMWPznjE9vR9/suR
	C3ZGMw1WtumOvom7nEttlMzwY4GqBfXeEsUK0IqnWN/gupO77BJWitTP1nceUdJrgwrnRaCE35y
	tSetTbUeS4Td30kxjsHYJRLC/7g2NW3ZNsIKV4VXm8B3P0DTRiMJpBy1l+HHi/wBKePURDXxXW9
	F3xV1qYGInVH8IyHDUGyG2sHbK01fl91Rj+0fwg==
X-Received: by 2002:a17:902:d4c1:b0:26a:589b:cf11 with SMTP id d9443c01a7336-27ed4ab31e3mr21067105ad.43.1758764785051;
        Wed, 24 Sep 2025 18:46:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkWVGsBMaLTmduKHWETBWGp2jxTB4gwYRIKlo2+7MPdlsABDo1JV2x1OEc2s9kaTB1M7uB4A==
X-Received: by 2002:a17:902:d4c1:b0:26a:589b:cf11 with SMTP id d9443c01a7336-27ed4ab31e3mr21066865ad.43.1758764784645;
        Wed, 24 Sep 2025 18:46:24 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6adca51sm6355395ad.147.2025.09.24.18.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 18:46:24 -0700 (PDT)
Message-ID: <6a0477dc-2f4a-4a72-85b3-9de42759cdb5@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:46:19 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] tee: qcom: prevent potential off by one read
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <aMvV4kK386Sni10i@stanley.mountain>
 <adbccfc0-0f9c-4b71-9fb5-5582c8180ac7@oss.qualcomm.com>
 <bb776102-310b-4a84-943a-86d4138592d8@oss.qualcomm.com>
 <aNOfXlG21HIBR18E@stanley.mountain>
 <CAHUa44G2yaB28sd0FjkjyCNJKXjx2Jg9j-9HXytyvsmiQ3ThAA@mail.gmail.com>
 <aNPAT_uf-JFvBvkV@stanley.mountain>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <aNPAT_uf-JFvBvkV@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YR0aknW95WZO0-E9x3LzDDLkx8jHkd4N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX62InHV+ildKb
 w05NawI75CZbrVXRg3XsCSEPBRaNYP0khWHA8M5zrd5HXZ2vKjaGKlX1v2DenBT44IHjh+xtPJ+
 za5xvovOGDFJwtgpBiM+6MmTeCQkENcUyIoUu+qXEhFw4LzKkKM3u54UfycahJ0nll3Ty3q34ts
 xCt+9a5qSiZ53DoadXZg1YiKdSMifd/HHRuB5yx+wuQCKS8NfxX4CjHMKiURwuVWNkPkNecYDL3
 7td1UOuacBwlj8sOvZCEoRrmfAr3WEv/wfNi9X3/5DUeFqIpDdaNkAl0xV978aq3MNOzl5e8iLO
 ymoG6NofuwHyBrxJVdZFSWgH07npSJ3K2wzovxWGJ99qHU8cu0/GCKCV9S09zk0rZ7HF+S71oj9
 LyJZy9Z4
X-Proofpoint-ORIG-GUID: YR0aknW95WZO0-E9x3LzDDLkx8jHkd4N
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d49ef2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=BRsQPDxWgBvOXLHaTS8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018



On 9/24/2025 7:56 PM, Dan Carpenter wrote:
> On Wed, Sep 24, 2025 at 11:21:34AM +0200, Jens Wiklander wrote:
>> On Wed, Sep 24, 2025 at 9:36 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
>>>
>>> On Wed, Sep 24, 2025 at 08:58:45AM +1000, Amirreza Zarrabi wrote:
>>>>
>>>>
>>>> On 9/24/2025 8:48 AM, Amirreza Zarrabi wrote:
>>>>> On 9/18/2025 7:50 PM, Dan Carpenter wrote:
>>>>>> Re-order these checks to check if "i" is a valid array index before using
>>>>>> it.  This prevents a potential off by one read access.
>>>>>>
>>>>>> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
>>>>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>>>>> ---
>>>>>>  drivers/tee/qcomtee/call.c | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
>>>>>> index cc17a48d0ab7..ac134452cc9c 100644
>>>>>> --- a/drivers/tee/qcomtee/call.c
>>>>>> +++ b/drivers/tee/qcomtee/call.c
>>>>>> @@ -308,7 +308,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
>>>>>>    }
>>>>>>
>>>>>>    /* Release any IO and OO objects not processed. */
>>>>>> -  for (; u[i].type && i < num_params; i++) {
>>>>>> +  for (; i < num_params && u[i].type; i++) {
>>>>>>            if (u[i].type == QCOMTEE_ARG_TYPE_OO ||
>>>>>>                u[i].type == QCOMTEE_ARG_TYPE_IO)
>>>>>>                    qcomtee_object_put(u[i].o);
>>>>>
>>>>> This is not required, considering the sequence of clean up, this
>>>>> would never happen. `i` at least have been accessed once in the
>>>>> switch above.
>>>>>
>>>>> Regards,
>>>>> Amir
>>>>>
>>>>>
>>>>
>>>> Also, size of u is always num_params + 1 for the ending 0.
>>>> (basically means `i < num_params` can be removed).
>>>>
>>>
>>> Yes.  This is true.
>>
>> So this patch isn't needed. I'll drop it if no one objects.
> 
> The patch makes the code better though...  It never really makes sense
> to use a variable first and then check if it's valid later.  In this
> case the check isn't required.
> 
> Ideally the code would only have one limit.  We could either do:
> 
> 	for (; i < num_params; i++) {
> Or:
> 	for (; u[i].type != QCOMTEE_ARG_TYPE_INV; i++) {
> 
> Either way works...
> 
> regards,
> dan carpenter
> 

Originally, it was written as

	for (; u[i].type != QCOMTEE_ARG_TYPE_INV; i++) { ...

but changed trough out the review process.	
I do not have any preference. But if having it as

	for (; i < num_params && u[i].type; i++) { ...

is more readable, let's keep it.

Regards,
Amir


