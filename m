Return-Path: <linux-arm-msm+bounces-103028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Bk7Fv7I3WnujAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 06:56:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3F53F58CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 06:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 341C230440B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 04:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D582E62B7;
	Tue, 14 Apr 2026 04:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n7EgZ5ZG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgzBo7Se"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A14282F1B
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 04:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142582; cv=none; b=jXoP+eoBbOq3pV3URu6c/ykwBXLMb9sA+FU9bhJNGf1VrWzGZ3zKNDUyvcGM+LVJpCsjeGdd5DeuBL6qKQh5QaQiBXwNlWDySa+rDhN5Q15d7Sa1P0MolF20JYLzjEszhjEKTGHuWJOYY0f0TdmFK44a5VLzHTXtVa6z+A9MCKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142582; c=relaxed/simple;
	bh=y5VTxtxHsWt2j14l//r2NxT+lEEc+DvcYIccjKTyRrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C4E9jD9YipSwunm0jgoyeKIFjJGuztt5NTQzOMnvhzFbj/vztx3jqLr4oG9wcoUcvZkFQ+SGv3F0tREopxo7whmaz3UrLmL2v74Km/5m7iI2lYhQm6gxStB7hnZMXflUUWwSP7Ool7UIZC/IU1F0dxr9gTacwJJeuGO8Jin4Q74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n7EgZ5ZG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgzBo7Se; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCZj1280927
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 04:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fi8pulVtALprFX1SR5pTsXZBuqU3gtCs3uorg3DIcGw=; b=n7EgZ5ZGtWjLN62G
	fk8oNndSqlmDgaKO3nWcb+HtSE7tyeVs/j5jElLSuvC4O6SNWYligEpTxlpytx/+
	aooa9BRTZi/Il3amTmJvKmObibHKGu3lgQ0xHWy0tzrv/E/yEM3teMGHJFrdYTnu
	6puSMRZEPOgZeYkBcEbWahW8a7pp11X8E7NjTf0QP47l5Gmd02o/GaR8fQ+MEl8x
	o2Wb91IPdhqvUZVCo9sc2YyIZHR34cbjqmH6F9zlKENgMM6neMee1EXtTxt2mn4g
	kY/b+Ia6UF63yuwECrupv+Rf27XY9V8V6NEObr5vPIfhQbf2yjxxAmUlPaAwMLuA
	uhprHA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vh1ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 04:56:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7948640854so372056a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 21:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142578; x=1776747378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fi8pulVtALprFX1SR5pTsXZBuqU3gtCs3uorg3DIcGw=;
        b=fgzBo7SeWIK2oFSG6P26TwaBuiJqSUJEu9Gys9UpP23ZTcJp83qEWaKLHA7b3IQTGv
         ZZ51bXNykkDGLl/sB2KrRFhimzKS47uCbagiQdrcqKhBcwSoPRksQD/nsMfYKCP7ueyu
         wDEWQ7CJKHTgnR/c9EpaNvybf9oTP0dmAZg6R9UpEzc8AwwW1OGOuV+Y5vDR5T0h04X6
         g3POs+4oE09hEmV6LsdR1mrMotMzk9YjTF5C7atJWfEW+hXD9qhjToT7Ph0l2jCu9KpL
         ifWDHdB6YlWxGSUvz0aV/VVpoWgGY1KMlgw458xL+3mCK+CbTz9orWcG5hKtRvJLjpU8
         FljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142578; x=1776747378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fi8pulVtALprFX1SR5pTsXZBuqU3gtCs3uorg3DIcGw=;
        b=B0ZkRY8jm/KK1cGFYsLWAt4pqXWW+dxeryp8cuZhHhhf8F0yKl+ZqP5i0wH7vHXgwH
         aVQFAkPWmap8Dddd1Vp3IaACnkwfa8MBn76LFs6pgiCBeAaYW9BrRl8hJLwwRWUsjCZe
         SVGudenRcVXbfLgyqmz/r7yt7gpKK9DOkUCOd6zBLlDr0B1mjs0Wu+v0qfcmPJeprt6e
         5dW3uLqFYBofsA43DI4SpPc0B9FzUku2xxl145QwbAX4YZIUMSfNLWUNXhlcSUkWFIE0
         6nbTPfAI0BavQKkLVsgv5OAdI2DwplhaxmxziqZTamk3P9uMq+OknU6SzgTxc/NltNxB
         yj/w==
X-Forwarded-Encrypted: i=1; AFNElJ9OutMT0TT7f6RsfeNEbIsT4F4ywWFrxbKjwSfQDipMUnQDfOnXwqCs070nIQGXC3b9XUBlFwvVjoYskJL5@vger.kernel.org
X-Gm-Message-State: AOJu0YwNNPEaGo0E4KxtWqHzDZq3IaC4fRQGZycJ1l6qApGZNbli0HaT
	Q8W2eG7qQEER9WFbutiE6aklEwy0uDVBrfTI5RuhB7RS7NGMeREL9CczoMXUY7AxargE6jxe6Q4
	Xc3nd0SftJUjegacjh3JF9f+NfOcp5KjE7kYyzEEWD7VsAJPt+LJ3bp5YTd412LzZ+zKf
X-Gm-Gg: AeBDiesz3nTsY/zIZK7hN/iVZRfQv6axrWt1YO20cDwDz9n7RD+M2dkUupW2yj6GjH/
	J9ZwO8L/ENx2ILu4RRjNOYHNJJKpR7SdsevjuyNSsl98Zxl9lDBpV0Cly2+mhAmctQQqUdzLrJp
	DYANW6QI4+jJkJbviPcMnrAK4mCgbPS1+yQig/5C5PSePLKBKIBmHSbWLxZMzHIIqE3M3qdOduF
	uBHhBv+lKC9tnVoxkaFqry2N1McIImwQP5YhFdYgQvH9tNmJTDOCkr5KFQBw0Lg6jHnUzk5FuFj
	NjpDBMLzM+z7TxPPJMPRE+PA0D06JrQjIpYsZGVY5tfjDzqo+2kFe0t0behg86rNFsf/+tVlahS
	dsmmfWpJK1EF9ERaLXLxrQvDHv13bSPrQegChQgolnOVb+kcC6pjQkRq9IyuXInHrynWtQpv2H6
	0B77qsamMMZqVsWks=
X-Received: by 2002:a05:6a00:bd8a:b0:82a:5d55:5807 with SMTP id d2e1a72fcca58-82f0c1c8bbdmr15554613b3a.6.1776142577899;
        Mon, 13 Apr 2026 21:56:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd8a:b0:82a:5d55:5807 with SMTP id d2e1a72fcca58-82f0c1c8bbdmr15554580b3a.6.1776142577386;
        Mon, 13 Apr 2026 21:56:17 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c33f2easm14955968b3a.22.2026.04.13.21.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 21:56:16 -0700 (PDT)
Message-ID: <7bd01424-e611-449f-b5e0-7c823ad3b978@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:56:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
 <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
 <adm37MruBfXAjLpZ@baldur>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <adm37MruBfXAjLpZ@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IQG8_ga7FbhkhTEs5CA5jEwN4_-mUL_j
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69ddc8f2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=MOLdXubu67ztUzaw2HoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: IQG8_ga7FbhkhTEs5CA5jEwN4_-mUL_j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NCBTYWx0ZWRfX0JH+FPw3ZPgK
 oRyXO62d1lc8KEv9iokgrno+kdYtpK35F5egalBy/ew8gtpNuPq1qFqmZpqVrRquUOUA1ORRIOn
 PZAS/nyCzp9swEU1UT8cSY0ActWMAZncdaYkzAHAcBEYLkCkEhXDLfT5w7FFWKqhYKn+YtQjEqI
 v1wncyeUtc04QKCPRZO/yHlr2v4y7G4fOhTemlp5+0eOlcKC87oy8b2p4sfgY/0UP7zKwA4hM2J
 Q+gBSsWj2tjByXisqc8dcYwdVpzi5/1uHm0+IWAdIjvyeVcmGz3oekolT4Rz8VkrBJNFPpCVW9q
 WkzV7jv6YzPSG16WAKbxa6MqTAazvBloburEmu6KC4DvNz3L+EJ9Bl/8NpwghoAX4mXEC8GmvIo
 QDsMFoGUbG+xwffDyZXToXX7oQq/4JRt5RZhQ68HiHUef4bnnXmMSLiL5PDTegBr8QbBKUwoyqN
 mx7rQMhN+SYfiexg3ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140044
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103028-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB3F53F58CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/11/2026 10:59 AM, Bjorn Andersson wrote:
> On Thu, Apr 09, 2026 at 01:52:27AM -0700, Jingyi Wang wrote:
>> Subsystems can be brought out of reset by entities such as bootloaders.
>> As the irq enablement could be later than subsystem bring up, the state
>> of subsystem should be checked by reading SMP2P bits and performing ping
>> test.
>>

Hi Bjorn,

> 
> I still don't understand.
> 
> Are you saying that devm_request_threaded_irq() will succeed and then
> calling irq_get_irqchip_state() will not work? Or are you saying that
> SMP2P driver isn't reliable and we're loosing the ready or fatal bits?
> 

This says the ready state is getting from irq_get_irqchip_state()
instead of q6v5_ready_interrupt(like what rproc start do)

> 
> In the reply to v4 you replied to me with "it's a downstream feature".
> That isn't a reason for performing this extra dance, either downstream
> or upstream.
> 

I think the "downtream feature" in v4 means, if getting ready state
from SMP2P bits fail, no more waiting. And this has been removed in
this version.


>> A new qcom_pas_attach() function is introduced. if a crash state is
>> detected for the subsystem, rproc_report_crash() is called. If the
>> subsystem is ready and the ping is successful, it will be marked as
>> "attached". If ready irq is not received, it could be the early boot
>> feature is not supported by other entities. In this case, the state will
>> be marked as RPROC_OFFLINE so that the PAS driver can load the firmware
>> and start the remoteproc.
>>
>> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   drivers/remoteproc/qcom_q6v5.c     | 69 ++++++++++++++++++++++++++++++++
>>   drivers/remoteproc/qcom_q6v5.h     |  6 +++
>>   drivers/remoteproc/qcom_q6v5_pas.c | 80 ++++++++++++++++++++++++++++++++++++--
>>   3 files changed, 152 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
>> index 58d5b85e58cd..52247c17c38a 100644
>> --- a/drivers/remoteproc/qcom_q6v5.c
>> +++ b/drivers/remoteproc/qcom_q6v5.c
>> @@ -20,6 +20,7 @@
>>   
>>   #define Q6V5_LOAD_STATE_MSG_LEN	64
>>   #define Q6V5_PANIC_DELAY_MS	200
>> +#define Q6V5_PING_TIMEOUT_MS	500
> 
> Changelog says you removed 5 second timeout, but you only removed 4.5
> seconds.
> 

EARLY_ATTACH_TIMEOUT_MS has been removed and Q6V5_PING_TIMEOUT_MS is used for
soccp ping-pong.

Thanks,
Jingyi

> Regards,
> Bjorn
> 
>>   
>>   static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool enable)
>>   {
>> @@ -234,6 +235,74 @@ unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
>>   }
>>   EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>>   
>> +static irqreturn_t q6v5_pong_interrupt(int irq, void *data)
>> +{
>> +	struct qcom_q6v5 *q6v5 = data;
>> +
>> +	complete(&q6v5->ping_done);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5)
>> +{
>> +	int ret;
>> +	int ping_failed = 0;
>> +
>> +	reinit_completion(&q6v5->ping_done);
>> +
>> +	/* Set master kernel Ping bit */
>> +	ret = qcom_smem_state_update_bits(q6v5->ping_state,
>> +					  BIT(q6v5->ping_bit), BIT(q6v5->ping_bit));
>> +	if (ret) {
>> +		dev_err(q6v5->dev, "Failed to update ping bits\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = wait_for_completion_timeout(&q6v5->ping_done, msecs_to_jiffies(Q6V5_PING_TIMEOUT_MS));
>> +	if (!ret) {
>> +		ping_failed = -ETIMEDOUT;
>> +		dev_err(q6v5->dev, "Failed to get back pong\n");
>> +	}
>> +
>> +	/* Clear ping bit master kernel */
>> +	ret = qcom_smem_state_update_bits(q6v5->ping_state, BIT(q6v5->ping_bit), 0);
>> +	if (ret) {
>> +		dev_err(q6v5->dev, "Failed to clear master kernel bits\n");
>> +		return ret;
>> +	}
>> +
>> +	return ping_failed;
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem);
>> +
>> +int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev)
>> +{
>> +	int ret = -ENODEV;
>> +
>> +	q6v5->ping_state = devm_qcom_smem_state_get(&pdev->dev, "ping", &q6v5->ping_bit);
>> +	if (IS_ERR(q6v5->ping_state)) {
>> +		dev_err(&pdev->dev, "Failed to acquire smem state %ld\n",
>> +			PTR_ERR(q6v5->ping_state));
>> +		return PTR_ERR(q6v5->ping_state);
>> +	}
>> +
>> +	init_completion(&q6v5->ping_done);
>> +
>> +	q6v5->pong_irq = platform_get_irq_byname(pdev, "pong");
>> +	if (q6v5->pong_irq < 0)
>> +		return q6v5->pong_irq;
>> +
>> +	ret = devm_request_threaded_irq(&pdev->dev, q6v5->pong_irq, NULL,
>> +					q6v5_pong_interrupt, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>> +					"q6v5 pong", q6v5);
>> +	if (ret)
>> +		dev_err(&pdev->dev, "Failed to acquire pong IRQ\n");
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem_init);
>> +
>>   /**
>>    * qcom_q6v5_init() - initializer of the q6v5 common struct
>>    * @q6v5:	handle to be initialized
>> diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
>> index 5a859c41896e..5025ffc4dbe8 100644
>> --- a/drivers/remoteproc/qcom_q6v5.h
>> +++ b/drivers/remoteproc/qcom_q6v5.h
>> @@ -17,22 +17,26 @@ struct qcom_q6v5 {
>>   	struct rproc *rproc;
>>   
>>   	struct qcom_smem_state *state;
>> +	struct qcom_smem_state *ping_state;
>>   	struct qmp *qmp;
>>   
>>   	struct icc_path *path;
>>   
>>   	unsigned stop_bit;
>> +	unsigned int ping_bit;
>>   
>>   	int wdog_irq;
>>   	int fatal_irq;
>>   	int ready_irq;
>>   	int handover_irq;
>>   	int stop_irq;
>> +	int pong_irq;
>>   
>>   	bool handover_issued;
>>   
>>   	struct completion start_done;
>>   	struct completion stop_done;
>> +	struct completion ping_done;
>>   
>>   	int crash_reason;
>>   
>> @@ -52,5 +56,7 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
>>   int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
>>   int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
>>   unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
>> +int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5);
>> +int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev);
>>   
>>   #endif
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index da27d1d3c9da..34b54cf832d0 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>>   	int region_assign_count;
>>   	bool region_assign_shared;
>>   	int region_assign_vmid;
>> +	bool early_boot;
>>   };
>>   
>>   struct qcom_pas {
>> @@ -423,9 +424,15 @@ static int qcom_pas_stop(struct rproc *rproc)
>>   
>>   	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>>   
>> -	handover = qcom_q6v5_unprepare(&pas->q6v5);
>> -	if (handover)
>> -		qcom_pas_handover(&pas->q6v5);
>> +	/*
>> +	 * qcom_q6v5_prepare is not called in qcom_pas_attach, skip unprepare to
>> +	 * avoid mismatch.
>> +	 */
>> +	if (pas->rproc->state != RPROC_ATTACHED) {
>> +		handover = qcom_q6v5_unprepare(&pas->q6v5);
>> +		if (handover)
>> +			qcom_pas_handover(&pas->q6v5);
>> +	}
>>   
>>   	if (pas->smem_host_id)
>>   		ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
>> @@ -510,6 +517,63 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>>   	return qcom_q6v5_panic(&pas->q6v5);
>>   }
>>   
>> +static int qcom_pas_attach(struct rproc *rproc)
>> +{
>> +	int ret;
>> +	struct qcom_pas *pas = rproc->priv;
>> +	bool ready_state;
>> +	bool crash_state;
>> +
>> +	pas->q6v5.running = true;
>> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
>> +
>> +	if (ret)
>> +		goto disable_running;
>> +
>> +	if (crash_state) {
>> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
>> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
>> +		ret = -EINVAL;
>> +		goto disable_running;
>> +	}
>> +
>> +	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
>> +
>> +	if (ret)
>> +		goto disable_running;
>> +
>> +	if (unlikely(!ready_state)) {
>> +		/*
>> +		 * The bootloader may not support early boot, mark the state as
>> +		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
>> +		 * start the remoteproc.
>> +		 */
>> +		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
>> +		pas->rproc->state = RPROC_OFFLINE;
>> +		ret = -EINVAL;
>> +		goto disable_running;
>> +	}
>> +
>> +	ret = qcom_q6v5_ping_subsystem(&pas->q6v5);
>> +
>> +	if (ret) {
>> +		dev_err(pas->dev, "Failed to ping subsystem, assuming device crashed\n");
>> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
>> +		goto disable_running;
>> +	}
>> +
>> +	pas->q6v5.handover_issued = true;
>> +
>> +	return 0;
>> +
>> +disable_running:
>> +	pas->q6v5.running = false;
>> +
>> +	return ret;
>> +}
>> +
>>   static const struct rproc_ops qcom_pas_ops = {
>>   	.unprepare = qcom_pas_unprepare,
>>   	.start = qcom_pas_start,
>> @@ -518,6 +582,7 @@ static const struct rproc_ops qcom_pas_ops = {
>>   	.parse_fw = qcom_pas_parse_firmware,
>>   	.load = qcom_pas_load,
>>   	.panic = qcom_pas_panic,
>> +	.attach = qcom_pas_attach,
>>   };
>>   
>>   static const struct rproc_ops qcom_pas_minidump_ops = {
>> @@ -855,6 +920,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>   
>>   	pas->pas_ctx->use_tzmem = rproc->has_iommu;
>>   	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
>> +
>> +	if (desc->early_boot) {
>> +		ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
>> +		if (ret)
>> +			dev_warn(&pdev->dev, "Falling back to firmware load\n");
>> +		else
>> +			pas->rproc->state = RPROC_DETACHED;
>> +	}
>> +
>>   	ret = rproc_add(rproc);
>>   	if (ret)
>>   		goto remove_ssr_sysmon;
>>
>> -- 
>> 2.34.1
>>


