Return-Path: <linux-arm-msm+bounces-117842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fxJyIB83T2oScQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 07:52:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C981772CE5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 07:52:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cozis1wM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iXOFa1az;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117842-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117842-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A91413041A4B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 05:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E40A332629;
	Thu,  9 Jul 2026 05:49:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73DF3A872D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 05:49:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576198; cv=none; b=J8XVSC6D2am+Iho711ddg5d1a0GjpcLlIrhOkN2T+1XbZMplK+LkQkXTOSQBfUrk+L8wZsKR/9IbhTRa9PxFN/CqXM7d+tg+0TM4Jy1kf1wOBgitOPeaqrKTkMm+r/PWqjkUcJuR0inZizzAfkXTs0/8e96CeJ9Zxvrmg2vxbsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576198; c=relaxed/simple;
	bh=3N7yfM3uQ1okr5kka4rpaQGPCFucS7dK3w5eGF5hkEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tddBrTEmbD/OmKFloHAm+a8P6nZO9NGg+J3xMUCRGmZutjMXR94krCzQDh72CWPr/hwgdyI//n8gd3lyb81kwHxkjo3ZzOqzmjQTMosAW0ixl3L3DEJT5fpeT1HNl2rzlhqpSvKDcFWY3deLKpLnBjut/IijMRI7X3JFwr54+xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cozis1wM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iXOFa1az; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6693kuP4638141
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 05:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NALSQ0Dw5Lbqt1NCbiSIryndvAMq6kLYEDbo/CY7xs=; b=cozis1wMS8L2FUgx
	cepcsHXh0axn8p70eC4gXcGvnSVEzEUff/y8/Ky99iBpGK8p90colMWMc2PFfBL0
	tvB6OhzqP1YGXGkh5yaY2umWomva21QRb1TxbT0eIG5ZutGQjMCDKVzGqMKqHUwo
	c0CIFphtqLF9FJj1NgD7XUGojKvPouvnGHRDybeg5YtPhWPS2rMJiU3+xaMOeKSi
	7mAmIr2+1T07vW+v7vQeL+3wgoEXHnL0g/K38b8F9nEMObXIA0MLyvByT9fryZay
	TRKvrdY6auPqCuphQxKQD0YJUYbl9hoOjnoYn7nrtwGIzuoe5A50Gc6PcoMt/XkD
	9LcEwA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418gcp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:49:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38827cee19eso825266a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 22:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783576195; x=1784180995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9NALSQ0Dw5Lbqt1NCbiSIryndvAMq6kLYEDbo/CY7xs=;
        b=iXOFa1azc4G9UT5elS8z9t4dVStefaMGGxJRUlc2CgE3O3v7PNmmzka3SUsrPMrNOA
         0XbKBXHOG9xvG0Szbw3Y0jNlMxIGjouHg0DEnDo9WGda/CtxDVNc5jGUFq+6Ui6asOrR
         vmGHO6EaHFYJm2kaW6Hou8ON135MzFdGIFOXWugNHBU6N5ykH+IrG2++36whsJ7ewjLz
         QH6MMUMK5l2yFOO9LQPU0OyjFhw+1rrmM4bWQiNsBV+keUU+ZfHqEcoQWBcm5MUk0fRY
         J2+QMz6mHhJpN5A0VHiyguYteBkaDk17aN92+8dpE4r07tMmTEuuejgxkf1mPt0DD7iS
         jO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783576195; x=1784180995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9NALSQ0Dw5Lbqt1NCbiSIryndvAMq6kLYEDbo/CY7xs=;
        b=ImYwC1caaN3nmKsgJryrN575xi1YcO6HciZi598z+uY0Y27+1cl/uXZaJXo0LMUNef
         xE1mU7xVrJ+ec/Srq4jcOJhTbqenEBpIajJ6lH5cSMX/CRFVSR7Au9yPS8b9XpMxpEx/
         tV+NZS6Sm/Mc+0KGamvRpYOXzt8K2nFDktyG3aGd6fRK+Nkl7cq75uaql0BRb1RZyxAR
         1eQZI27mAQ9CZAL6dqvYtnCOOA4IdO2LJARF4DJN7I1l1aaG7QhSSYNvsoha6UGUjG7g
         hFylI1orw24/aDIx2UZGBbXVk48E2DSUqrKL1JKW3pU8WGjHBoykUOg2CecYT89wYqeD
         L1pA==
X-Forwarded-Encrypted: i=1; AHgh+RpkFJ26LtyV6F4eGy1tLh2O+WVXCP5fA2AlCqNqsSSKZ7teP7OhpLzJPWsjXwRJVL/1bE8b+q/ZGCe+2o6x@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8q99t/TKjStC7pXAJ13DPiC/OTPwoBeBNpvs/2RJBfs+LKPS7
	2VNoKAK9dR0MxUAApTLyHuwlTSdXQ1EiH+1SH24dXxU2czjzzIj+TByvh4kIbl7iumZpAsMnEhh
	2gJLJKXlslG9KYlIzEhNZD7WbwVkB5Q5oCm7AIHxg02e3GnbwesBjO/P9IKs+zzcJ+vKP
X-Gm-Gg: AfdE7cnJLmC+Cu8YbQI7EbY76z07LaU1Ryz/Kmh0K686GPYSmrO/zQdaJAY33tpmROQ
	1/bdgukfCNR2Ba0EY6mKgQAfKZ77q8jVfFH/dcuATPkRRsEdsKNWAo5WcxUF+ive9OSWlQlJx7B
	b831r5xnTDR9Ram86nvvV9JkdKEWXtZtXsTAnZoa89geMZ0HozCvjLA1G2ITRxSt3afZk3sriJS
	fbCYjHx0H+xqaTcRHatoipkeQisnCGl4oRxjdubS7oGlcJIFstCFT2JBri8JTLnCHsxvxHWRies
	C+rbJecNjTOGO0XnFLajUTnxnVXgGUWzv/dtyYKj1hYIjbcRAPS8mxhe7Zkp/0ImgPFBLRnXGuu
	wcTkiR3R6Nsl5AvccvfA8aypf0XQ2GEAAEt9IeKpQ7d8rCBSOzw==
X-Received: by 2002:a17:90b:2c90:b0:37f:f89a:a1e6 with SMTP id 98e67ed59e1d1-3893d2429bdmr5476204a91.0.1783576195303;
        Wed, 08 Jul 2026 22:49:55 -0700 (PDT)
X-Received: by 2002:a17:90b:2c90:b0:37f:f89a:a1e6 with SMTP id 98e67ed59e1d1-3893d2429bdmr5476176a91.0.1783576194794;
        Wed, 08 Jul 2026 22:49:54 -0700 (PDT)
Received: from [192.168.31.103] ([152.58.31.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a55a47286sm562981a91.10.2026.07.08.22.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 22:49:54 -0700 (PDT)
Message-ID: <734537a8-7ece-4d2e-8e72-d090d4788b22@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 11:19:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260705135739.4038826-1-aniket.randive@oss.qualcomm.com>
 <81e84294-b438-415d-82ef-a523c4381eb4@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <81e84294-b438-415d-82ef-a523c4381eb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f3683 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=9AXozQ6IwN0d4JI31gUtBA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=QsZEBUMWvTWtZ6nCauIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1MiBTYWx0ZWRfXzvPyPpNa6Ec4
 9xO2KhYXkwXnvf8gVVfRuvwUh92Fp47Ygy/Aa5Es6rjna1UH6Dli1+zgoyT/uN4IAwy5My5fZ1k
 NAUT7zIJrAZ9LORpS0p3BZ+txyEvnfvQfD9Jh4Pc9DUnAklmEn5in2uM3zIwqebNoIuWS4uLEpK
 i5Mpzs5qOX/7krvCyC2Vqzl2PZNdJXccmVsRYyslk2C3fozjX+qAT4U7w+yLZeMaNkrmxjXdrPt
 5AghJW8OgiXcsA0icM/XFLpMR2MZaX2jPuPFIv+6jtb71/LIF5NcCrUyYioTfL9FS2smDWWlF5L
 5EmqTejd0FEjoloyRamPazSMcTEJFkWRlBWzI8xaA2SwAznmd8QqDb5+VH0nltZ5t4ImChHHKpF
 ZJ+PsWN/25yGV9meMXAjp4eGrXJW38ExpzlKkp+4nKSQnQx7n+jvdqCI/DJHiHZlharsvZy5DRj
 3fRsTG2vkthj06hw6NQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1MiBTYWx0ZWRfX9ryk1HwJyehY
 hS7pyhOQTZgcrTfZ46cpdNibg6tdfklP5cf5FyhDvWYGg4IkEtDvbWGMPXfjnCMx2RKf0Os+s+P
 aQqNv/cPckpeiDW3Z7KaEsObS6lknj8=
X-Proofpoint-GUID: pY7jBZZG1jiv-EHGOnEoGQmYoCnB-5D6
X-Proofpoint-ORIG-GUID: pY7jBZZG1jiv-EHGOnEoGQmYoCnB-5D6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090052
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117842-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C981772CE5C

Thanks Mukesh for the review.

On 7/7/2026 5:37 PM, Mukesh Savaliya wrote:
> 
> 
> On 7/5/2026 7:27 PM, Aniket Randive wrote:
> [...]
> 
>>   static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>>   {
>>       struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
>> @@ -471,7 +484,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>       }
>>       cur = gi2c->cur;
>> -    time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>> +    time_left = wait_for_completion_timeout(&gi2c->done, 
>> geni_i2c_xfer_timeout(gi2c, len));
> Simplify with timeout = geni_i2c_xfer_timeout(gi2c, len) and use as an 
> arg ?

Yes. we can add extra variable. I though to avoid extra variable.

>>       if (!time_left)
>>           geni_i2c_abort_xfer(gi2c);
>> @@ -513,7 +526,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>           writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
>>       cur = gi2c->cur;
>> -    time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>> +    time_left = wait_for_completion_timeout(&gi2c->done, 
>> geni_i2c_xfer_timeout(gi2c, len));
>>       if (!time_left)
>>           geni_i2c_abort_xfer(gi2c);
>> @@ -591,7 +604,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct 
>> geni_i2c_dev *gi2c, struct i2c_
>>    * geni_i2c_gpi_multi_xfer_timeout_handler() - Handles multi message 
>> transfer timeout
>>    * @dev: Pointer to the corresponding dev node
>>    * @multi_xfer: Pointer to the geni_i2c_gpi_multi_desc_xfer
>> - * @transfer_timeout_msecs: Timeout value in milliseconds
>> + * @transfer_timeout_msecs: Per-message completion timeout in jiffies
>>    * @transfer_comp: Completion object of the transfer
>>    *
>>    * This function waits for the completion of each processed transfer 
>> messages
>> @@ -601,7 +614,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct 
>> geni_i2c_dev *gi2c, struct i2c_
>>    */
>>   static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
>>                              struct geni_i2c_gpi_multi_desc_xfer 
>> *multi_xfer,
>> -                           u32 transfer_timeout_msecs,
>> +                           unsigned long timeout_jiffies,
>>                              struct completion *transfer_comp)
>>   {
>>       int i;
>> @@ -612,7 +625,7 @@ static int 
>> geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
>>           if (multi_xfer->msg_idx_cnt != multi_xfer->irq_cnt) {
>>               time_left = wait_for_completion_timeout(transfer_comp,
>> -                                transfer_timeout_msecs);
>> +                                timeout_jiffies);
>>               if (!time_left) {
>>                   dev_err(dev, "%s: Transfer timeout\n", __func__);
>>                   return -ETIMEDOUT;
>> @@ -736,8 +749,15 @@ static int geni_i2c_gpi(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg msgs[],
>>           dma_async_issue_pending(gi2c->tx_c);
>>           if ((msg_idx == (gi2c->num_msgs - 1)) || flags & 
>> DMA_PREP_INTERRUPT) {
>> +            size_t max_len = 0;
>> +            int j;
>> +
>> +            for (j = 0; j < gi2c->num_msgs; j++)
>> +                max_len = max_t(size_t, max_len, msgs[j].len);
>> +
>>               ret = geni_i2c_gpi_multi_xfer_timeout_handler(gi2c- 
>> >se.dev, gi2c_gpi_xfer,
>> -                                      XFER_TIMEOUT, &gi2c->done);
>> +                                      geni_i2c_xfer_timeout(
>> +                                      gi2c, max_len), &gi2c->done);
> Simplify with timeout = geni_i2c_xfer_timeout(gi2c, len) and use as an 
> arg ?
>>               if (ret) {
>>                   dev_err(gi2c->se.dev,
>>                       "I2C multi write msg transfer timeout: %d\n",
>> @@ -852,7 +872,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg msgs[], i
>>           if (!gi2c->is_tx_multi_desc_xfer) {
>>               dma_async_issue_pending(gi2c->tx_c);
>> -            time_left = wait_for_completion_timeout(&gi2c->done, 
>> XFER_TIMEOUT);
>> +            time_left = wait_for_completion_timeout(&gi2c->done, 
>> geni_i2c_xfer_timeout(
>> +                                gi2c, msgs[i].len));
>>               if (!time_left) {
>>                   dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
>>                   gi2c->err = -ETIMEDOUT;
> 


