Return-Path: <linux-arm-msm+bounces-97727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DLrMwjitmloKAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 17:44:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D729929182B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 17:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE6AE3006829
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 16:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999E1372EEF;
	Sun, 15 Mar 2026 16:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eOBOgDzT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K3WXNdMS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F042372EC7
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 16:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773593091; cv=none; b=IiHoC7XYQVekJr/e3phxkPD0wyQLaM9H4khUOzR1MoEXY9gG2P6DEYKgl9Az2ElljoVqCTAiG6eHgKolRCUM37D5h4IEmR4HYNx9CvtQO8MVROoRp+bHIkkHTsLlTDhzCHEuKZoXBqcsgflxO5aJAWa3qitgxzY0n9J9fQfQT9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773593091; c=relaxed/simple;
	bh=Kj8EMlt+YcIS2O96Uqif4A/9D4fL3z9oA4sqp9byO/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MAR/cnwF7Mub4l7dsDTE1etb/SmYkpRByX4m4ZqXvx6h3NTg6ObpBafDLO7K4ZQay4ovMDwttgr45LlPVQE4Y9v96EbVcAtGKK8rOH7/Iq605akSDnRjgYgNX+BMWycqEE4nE0zjf8l7ctT67stBecgTc14zhpUDY9+gDmR2HZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eOBOgDzT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K3WXNdMS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62F6UUWl1957915
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 16:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vlh0UMYtaMeioYXkM4rvp9tC++xOLzdzVq3WJDRWFcE=; b=eOBOgDzTeF8R6VY/
	FgyDDN9UUKFz/7hypVC0lkz6GfbY7/sEQ0LL10EmoLFVpTN34rfsyjEG541lHw28
	bOUBn2c2WpxcvFY+H0XJN0Ky4gioErWE+V0mODA7MQyUKxdkBP11fTFG6x+TT04F
	s//+PWtP4kkneFYC/hi9gVGxnfzY2NOlAci2yqhwcMsieRYgFDzV6oDV5Pi7OuqL
	H0OEjqc3fCJplLxiSGuY6AN6rpkntelAaYQ6rangtNY5IlQ4nO4F/Hot8obVbKEc
	lnPTSwtVidb3aYVGVuZm1+zyIuigTjdiOqalGhEdBufwGHkHJK5OhAtazQRrSfuy
	HCLp3w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw043jx0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 16:44:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bead0a9123so86776536eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 09:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773593089; x=1774197889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vlh0UMYtaMeioYXkM4rvp9tC++xOLzdzVq3WJDRWFcE=;
        b=K3WXNdMSXuM8saknG0cXsdV17qsvJG5I2Iwn++VDx6TvB0e1FVaZsmXBVJS+B20fKg
         r/kiA8l3N3yOsGFR9GJ4a9Pd6ij6mOzVl7bPULbXwGcMuOweIxlDpiaoRqWoWdTxT+AV
         pgfuqqYXpY3fARLwGKXJmCQhDciXFP9/6inU3xzBRXIOWfNrdKsj729/5iWi+VWdni91
         EjzEifSKYn/30UYIMGiO5zvzcunCZc+wEvj3ZfFLiR0LABujsWFJl5GH87EEsC6KgJs+
         ZMkOIl0Y2PYt6afVwE6/PfucB7i0HvwWPTdtJQdS0pVg0R8fSN032dChuxztcNyWXpwO
         y2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773593089; x=1774197889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vlh0UMYtaMeioYXkM4rvp9tC++xOLzdzVq3WJDRWFcE=;
        b=iJLXfwQjLEXKmEZ6Tx3DKd/9Ix/ELR01+gsxUOOycvBOdoAJQOGPmR5NZqo+sQkyao
         n2wYx7hX+gGpy/KKO1f7RXGx0u+JfiRgXfIg6FCA7j8krh+IY/C/HF1spkjUzuc8mUmd
         NUfx+vvLQUm/f8CQFDpbDBSOZ9kt2LtqXgJdAkKcDGdiOZ+xh7ro23zbjHJCmZVfpvhx
         BAKf+a9zKtwMHGk3FME8CLEcp/Q6N78Q8cyPx60+8qgsZKtbljmx/yMl7xfRIq8tdiBG
         6qPMtm2iqp75wtgfZECbaVZXCT8KXQ1E18p+lyp27QTM+yU14byDaMLoG5NZ+RVo93ft
         RsqA==
X-Forwarded-Encrypted: i=1; AJvYcCWO183yuqGFoyEK5vA7NkFt5Vkvgki6LK4CzGzxhtN/1VEkZSpBZ8u8EYMUtga4TNyIsOOG256DdmuTMIc7@vger.kernel.org
X-Gm-Message-State: AOJu0YxxRSE72WHEgH7xOt8fLMNtoasYz+dH14OIjLYm3R95gZsonfol
	GtsIyxvcrklvhkV6XqgdRDsIA4xBOrob4qp7lLHtwWwcS1hsnZAscST+6HVu7Oleuj2uYKB25xf
	Plwa0alsgBGeWiIvPVH7XPI3edwT845DfFctFYHLy0Nm7wKNpAP6tXhMGLevypWZO0GET
X-Gm-Gg: ATEYQzzMIoUMjt7n38rzUnW6QNjrqHKJ8qiDnDDmR4EC6csEvDhZtZr7HoW26tw7u6l
	+X8uuelVQuFk4KPJUHymibjAbHN0ZV6UmOQskatx+0CrODFuBiZV02Nvmno/+y+03oxF+JDCA/2
	YW3z1VqdCq0PX74Cp7Ac9S6rVCJneiOZ4BKgBkDAs7Il4KYljD3Jkyhf6tytBwIheaTGTLBpu/f
	qDXEaLOsKclNMqhdEwXxBz+5MddkUh2baEEK64glwWXgQEUE20ChY7AGao/TFpf9ps8GWDDGEbP
	ozMJ/qchbG3ylKKUPqkWa78mWjpioWz+M+rDzwjq4MC4/UsjVr3k8FJx07hlfK/0TNFDTxzrX1F
	UMl0f/X8XNlecyfeBmjU0WyvOwPabcLymNnY301LHHsfobBKDKIVYcFkJr7cBoTj7Ynwip9p54x
	Y=
X-Received: by 2002:a05:7300:5383:b0:2be:3f:307c with SMTP id 5a478bee46e88-2bea55ef0c8mr4689033eec.29.1773593088886;
        Sun, 15 Mar 2026 09:44:48 -0700 (PDT)
X-Received: by 2002:a05:7300:5383:b0:2be:3f:307c with SMTP id 5a478bee46e88-2bea55ef0c8mr4689026eec.29.1773593088389;
        Sun, 15 Mar 2026 09:44:48 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab55541fsm12945850eec.24.2026.03.15.09.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 09:44:47 -0700 (PDT)
Message-ID: <42d61f90-bbfe-49c0-ae09-cb6738ec7014@oss.qualcomm.com>
Date: Sun, 15 Mar 2026 10:44:46 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic Fix HELLO_RESP mode sourced from wrong rx
 field
To: Alok Tiwari <alok.a.tiwari@oracle.com>, jacek.lawrynowicz@linux.intel.com,
        andersson@kernel.org, ogabbay@kernel.org,
        carl.vanderlip@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc: alok.a.tiwarilinux@gmail.com
References: <20260301091214.171263-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260301091214.171263-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE1MDEzMiBTYWx0ZWRfX6deuzJc4bs9l
 kEN4PJkB6a1zA8EpLXqOVpI5L2zYffH5mRziPLTHkywmiXSkveG7h4YeDOS0M0mI/Ax9tbaJ1Cf
 29IHVg0dEMNauvzl2dIWhyLoxfdfQK/2JzL9uUeUIcnYeSwTsm4Ij0kDcURgLyuHClp/+ALF864
 LQAHJ0VYFbbXAnGBcjSTsthwx0GhWnFv5MyeiJgyr3iAuMnBMmoiihjx9abRr6FumFrKSOlYRRt
 bF1maxX4ZqKfUOBNSLnuAJrNlnZK1WqRl/dXGEthaK+i4HoHaan8cp/fDw+zhbDYYRqBJ927e/p
 KBrD3Q7ALgTJFxccA2L83ZastAZRMWf2OCfC8SoruyKS9NNW5pHl5F3/yioICE85OgP26uLLYjh
 lIRBC3wjLCqiofBDkHd3RDTba8wi/JpHaj//L0y8Rgv7QTqPwk5jIHSnhaPjo5A2haG46/haHEG
 f4k1BazkLYKsHOWsdPw==
X-Proofpoint-GUID: Ng4xwr1BvmKnEbaRj50EyE3EC1K4_X-C
X-Authority-Analysis: v=2.4 cv=fLs0HJae c=1 sm=1 tr=0 ts=69b6e201 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=yPCof4ZbAAAA:8 a=Wz-czTzbEKbp6fIjhE8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: Ng4xwr1BvmKnEbaRj50EyE3EC1K4_X-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-15_06,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603150132
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-97727-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D729929182B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/1/2026 2:12 AM, Alok Tiwari wrote:
> sahara_hello() handles SAHARA_HELLO_CMD and validates fields from
> context->rx->hello. When building the HELLO_RESP, copy the mode from the
> received HELLO request (rx->hello.mode) rather than rx->hello_resp.mode.

This does not explain why, nor what is broken (since you have listed a 
fixes tag).

rx->hello.mode == rx->hello_resp.mode

Also, care to explain how you discovered this?

> Fixes: 76b801aa2198 ("accel/qaic: Add Sahara implementation for firmware loading")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>   drivers/accel/qaic/sahara.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
> index fd3c3b2d1fd3..99bf832e2825 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -325,7 +325,7 @@ static void sahara_hello(struct sahara_context *context)
>   	context->tx[0]->hello_resp.version = cpu_to_le32(SAHARA_VERSION);
>   	context->tx[0]->hello_resp.version_compat = cpu_to_le32(SAHARA_VERSION);
>   	context->tx[0]->hello_resp.status = cpu_to_le32(SAHARA_SUCCESS);
> -	context->tx[0]->hello_resp.mode = context->rx->hello_resp.mode;
> +	context->tx[0]->hello_resp.mode = context->rx->hello.mode;
>   
>   	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
>   			    SAHARA_HELLO_LENGTH, MHI_EOT);


