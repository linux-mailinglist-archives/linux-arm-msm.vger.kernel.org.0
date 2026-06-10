Return-Path: <linux-arm-msm+bounces-112296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5IreNdcCKWo7OwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:23:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31847666324
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:23:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JJ2nS2wn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="f57F/sDo";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112296-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112296-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 215C230F5A28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 06:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF9C3438B8;
	Wed, 10 Jun 2026 06:16:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E132D063E
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:16:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072211; cv=none; b=ThY+6/GXCgpRga9iy7XAbOt/zeXbiuIB1LNuvp+6PNiDBtS+BIUBEPrnm1FaBGU6XZSOE8uL28aehJGEVBDw9uqf9a2HwShIKZ3z1Qj9OIfOfeA/2a11FFzqOvO2yIMr00yoPzuJJD2zlgYdmaTjaY5qXBd9qaS5apXnsgFP5X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072211; c=relaxed/simple;
	bh=eRdB9IcExeSuHVeD4iZ6KuqU/GRLMfDP/J7Iq/x5/Ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tafE7f5wRE8F3sd14rdtio9IMlBlhLoRH+yvopWdbfj+D/9b/+d4f+S62EQKUNUAS0ATlsQYdUynUK9whw2hNzREMvEU0XBAeUiTjLQr4H9lOphvBe3R7j6J6X7k2No+FdQtqiJ+mrPvzbmee6zW9xpESADgqxzIXc2UMC92kGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJ2nS2wn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f57F/sDo; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2ehh2282619
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TFJyzzVwH204oZf0Zg9D/JDdPLwjY1lv4WhKivVcE3A=; b=JJ2nS2wnDcbLNzEp
	MeWnFjGDML5Dcd50WyQkOhOulgMRAX1Zfkx190kXhHHuAaOhKmHwxC5CwK1gISpL
	d1w0gsEK8HTMFU+pUdY7G8wxijIvQE3foEfoDa0D+gyKIJJOelMlCK82xO+s1MtL
	50HZSuTTvyddKQUHSaCa8wueKM28knuHUnj91BIJ0IlFA86aiGObIjisDb/mxFAf
	wRIcmPp2FlXFUm1+b70u1TOIuefevAXmMeW6kNJScW/cOYckJE/vYqg/mI4jtqJb
	APipRJVXmIqBQJqbZt7+KxkCX/UZ086sY9iLbOtpD+oIA1/PeAJYyGHPY02k4Asb
	J3Ti1g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnns116-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:16:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d982d932aso7966493a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 23:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781072207; x=1781677007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TFJyzzVwH204oZf0Zg9D/JDdPLwjY1lv4WhKivVcE3A=;
        b=f57F/sDoxScGnxE2ksN7aHuc9fIXQYZrGvn3PSn59VwNZZp9IbVIoijCL/BNrX4K6h
         5F4H31o2gvFYStek631q8HGkVh9LymVlD6sKNNvVjXtcs1dRoMwxK/EW7fLUfY2h2ve2
         wk2D2je8M1LozTHd1k1BtM2svb5LeassT7C6/s1rwLhNOuqmfRR3sN4+/gs5FW9Czf11
         ijIHES73t0q1bwd1yx2r/gZs0ckmekSCnGcebJv9pyThz3rpE/tEihhEO1CGshrFnMO6
         oTYptmzUjRLabu7pSwCqsxSeknExOfYewoh5/+3kJoCI4fK2xc8OASUnhNAYd+SGwhuH
         mEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781072207; x=1781677007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFJyzzVwH204oZf0Zg9D/JDdPLwjY1lv4WhKivVcE3A=;
        b=g7rj9THQvFRftv9DajFnZhTUsvgdeORABQLeiLqWdBAg0ZeDyllHf21V7Gt/fT45RT
         OddrryEYQ+1Ge5EQnLksQtL0uSYi8BygEtdkFqci3Z684A/28L0yl9+4M8th7gIBZQSL
         ZqPqm4AOQAtw+jkGn6vgIRezUU6pHjXbI6RBTxyXPdfLTvlwP1YBb0u1tbWsMYrM7u5Z
         cSpB1fBz2IhDWILyxwwbdYsg8Bbz5hPC65bZt2qoaLxrlmbz9LyhYufKQIzgbOz9M+Nl
         xW/EvkDgmYO8Akb9f9xbilEOyVdG5cyqy1gFeGcezP2A4z5vHwtKjIpXuXH9m839ny0M
         9k2A==
X-Gm-Message-State: AOJu0YyZVZ9G+eF0DO6O7O0ckJgj4CNBo9UrXalV1B9+RzHlzeopgr3T
	dqOvV9oD7mvdPnYWjYJVCoFl+wSMmoBQlo3ByVJycTeOP41UZgW1zhsNCU8H+GepXq/XiRht0V5
	SwZscwmTK/OsuayKpUBIeFL2KXli1Jd4s7x1zRQ0I0NYPVK6ACOTbgQVcph2/7rBQAj5b
X-Gm-Gg: Acq92OETHCDbOgJcYd/i4dVs54Vylc+zBx9DpMfW4ml+jWSvQeKd9qmmFqHhwADp2LX
	m81nJaG0J9EbfiiWMEWZt0ckrc2K2rO2uqtomh3PhvPR6iglOgce2aFwR51dvsb8MwxkgtB9V3f
	FEZb5L7jv2Yaj5pg7+qmRfFQHGf7Az2Q1FW/8P6NJveua7ict+4I0EkQzk7jPRYwbJBdAKpXhMf
	3PQvhwYJ3Lb5GQACuaXZeJ7lcob+GMTlRC1rm6MYApTuE1AwTpx/PoCd+NQQZRNVXitjW9USgDk
	msLKm6wMy43ps6COxTLcBxCTrJO8wK9YovjCIVcags6OqNi2RGdJDm5FHYcS8DEDnN8nvVTgw77
	pWHsKXSsoJSm39XnI7BuSdvazpBBqpCv9nWXlPzNqCqwl5o1Xw/fwV4eoOKlD
X-Received: by 2002:a17:90b:54cd:b0:36e:2106:ded8 with SMTP id 98e67ed59e1d1-370f1333f8fmr23429122a91.25.1781072206896;
        Tue, 09 Jun 2026 23:16:46 -0700 (PDT)
X-Received: by 2002:a17:90b:54cd:b0:36e:2106:ded8 with SMTP id 98e67ed59e1d1-370f1333f8fmr23429087a91.25.1781072206473;
        Tue, 09 Jun 2026 23:16:46 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37624b83589sm1779078a91.16.2026.06.09.23.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 23:16:46 -0700 (PDT)
Message-ID: <8b110f90-2001-4655-856d-ec8cff98fc0a@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:46:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pinctrl: qcom: Avoid assigning thread_op_remain in
 unthreaded test
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
 <20260529-tlmm_test_changes-v1-3-88bfdccb4369@oss.qualcomm.com>
 <bf77fa4c-168a-49ac-bfe9-87880b0bbc9f@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <bf77fa4c-168a-49ac-bfe9-87880b0bbc9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IgrpRATsWAqAI95kGvMD_k93ULAtQ0rv
X-Proofpoint-ORIG-GUID: IgrpRATsWAqAI95kGvMD_k93ULAtQ0rv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1NyBTYWx0ZWRfXybwa2Eg8elqs
 6XnEqjflbqAuE1ZRJgSOy8EgDKnaVmWJTS0WEjugOalB2w5iHBYoXj4LGML/oPwT+QjTP2hMuPf
 1noH1onwZW2QAa972AIPj1qcZQ/0oTOc9b/03NGyOLyGGQvA06oPvkGHtlwu5wOuqClK+EllS2g
 Y0uRTHU2bMBtsv7jzervoS+ClYxtKMcPFzZz/Pe8RW6Qd3Qk3PrxhPzx51NqjGCNEO7AAN0OTd0
 JBK6/d2wNZlouqIP0JHcI+mLKg0Wcnu+hlinmlZJ5fRJ5QG0JlFwQ14+K6Gf2sRQfyi20cI6WaQ
 lf3KmiHud8DWlRu6N5F7LEYIkFz3acrLOz3dwuJhRGvTzYxRbzBHEbSWagFVKzNT3/emFDJBSIk
 PAem5B3Ecqpso14FyY6W2lMvYGVh9Dh6yeX0B3rkMQMj/SDRDqwgC2ih4szBQdO/YO7jQMqw1JZ
 A+nYk+hGoGMyammiDnA==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a290151 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=86_BQXzD9sKH6W767hAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112296-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:quic_yuanjiey@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31847666324



On 03-Jun-26 7:28 PM, Konrad Dybcio wrote:
> 
> 
> On 29-May-26 14:55, Sneh Mankad wrote:
>> tlmm_test_rising_while_disabled() sets thread_op_remain to 10, but this
>> variable is only used by the threaded IRQ handler to control the number
>> of GPIO pin toggles. Since tlmm_test_rising_while_disabled() does not
>> register a threaded IRQ handler, the assignment is never used.
>>
>> Remove the thread_op_remain assignment from
>> tlmm_test_rising_while_disabled().
>>
>> This does not cause any change in functionality.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>  drivers/pinctrl/qcom/tlmm-test.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
>> index 007d6539ceced294e81cfbe93a00c75a98c858de..e9e04300ab3687825255885821ebde0f3ee586a8 100644
>> --- a/drivers/pinctrl/qcom/tlmm-test.c
>> +++ b/drivers/pinctrl/qcom/tlmm-test.c
>> @@ -521,7 +521,6 @@ static void tlmm_test_rising_while_disabled(struct kunit *test)
>>  	unsigned int before_edge;
>>  
>>  	priv->intr_op = TLMM_TEST_COUNT;
>> -	atomic_set(&priv->thread_op_remain, 10);
> 
> Should this be setting priv->intr_op_remain instead?

Should not be needed.
priv->intr_op_remain is to indicate the hard IRQ handler how many times to toggle the GPIO line within the irq handler.
Here the test case does not require any toggles within IRQ handler.

I also found other test cases where intr_op_remain is assigned but never used. Will remove them in v2.

Thanks,
Sneh




