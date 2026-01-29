Return-Path: <linux-arm-msm+bounces-91194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGiiEH6Be2mvFAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 16:49:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5543B19D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 16:49:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36ACC3010530
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 15:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6043C25485A;
	Thu, 29 Jan 2026 15:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pjqwH6xP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g2QLf9oc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD142218E91
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769701754; cv=none; b=nsHCWqPxQC/xiaREnqT0J6LKAe+zyfTQm/rGcoyNsLMGib/ptm/KSx7m4pQaMlhYhSGiltxVcVdrUmQD/Brzzoj/FYiF7qSdU56UO4H/Jit6N+E56udT7q2rS3/WSAUzKbRy0CQGQoSfMM2EnTfi2h/NerF7KihAZ+0ppAQlaso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769701754; c=relaxed/simple;
	bh=wcTESOf7AidL9TI2v50Z1dwmr64aG7bhXo2++sRShtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bVGo5QqXdSPSqIz8/ANsAk7v1hoqmLF5X4DsuU03iDwgLHawxnPQrFz9mxzuk2pkZl73IzXpIDOLEfJf7JZTziG0BOS4i9/Q03yvSlJCxa374gtvTZXO/TnzMkxl8sZt06y69OGf/fN0PzOZytIlPoGhb5QlewehzQ686g70IP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pjqwH6xP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g2QLf9oc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAR9sh2505699
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9l3lRufO4nmq9wcYZ7mtP19dWxQPitgYMjCxPzwqxjg=; b=pjqwH6xPOOqRpE/y
	czy200ckVhFRUSxnQPjs2AibbZuYeW45qXCo3dIFua5hGhczNQZBVp94Ztm7HyWa
	nQDhUgIsNaqbuAFsjLV72NxVPcyLfGN8vUaFt77Ooh5XDc4wy5AsTCiBtAfAFQ7w
	zrcySNRPMQVIJWfc49+Xtejfkt8OreSaNzWw7Q3u/7IcO98BFsgRM7y+W9HBmY1S
	MYB6MLPJ6mblXmC4/wvzdsq3moTffGqsSXD2R7WF+cFYw9wO5ebrYvv9ZX6IlaQE
	J7N4Akj9RHCwaJ7+JUzoCOzmkX9Ed4oNeyUq+4Te4Mp6BlRUnxcC5jDeOrjS8V6h
	Z1QOSQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05tbs08r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:49:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6133262e4eso709684a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 07:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769701751; x=1770306551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9l3lRufO4nmq9wcYZ7mtP19dWxQPitgYMjCxPzwqxjg=;
        b=g2QLf9ocULArJ3DQoNGzNsyvn0LJ2OsMysgdTNGAHJzi4A6a3d5Zc8TbwRFrKLYfWC
         1BsLqfX5oi6D6THD7e9ULzle0IZTgIyI0AYhXE3JTa/NzazlJQwJdb+NeTduggum65aQ
         tzW2TqBUBVd22vCGj9ooD2E1xim/xgt9M/dbYEAY+z4l2vHwpaSps50TuWSKE85yYdLV
         G7wdF2TmPZ98jQHvvetRo0yc399hFttSZ0aay1ybzK1rKLuUM6U+BADUZBT5Drawc04j
         ecRguwbp88EPfpny5kF7qGkNvkxetRorabGHueMK7RNwjywcMW9K+APdYMZ4sC00GdTw
         QZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769701751; x=1770306551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9l3lRufO4nmq9wcYZ7mtP19dWxQPitgYMjCxPzwqxjg=;
        b=osb1EUtZppDX88ZzClD+BGTsUYpZjSjvTg7GMSt5+O0VtiLWO+/lYbbZZdYjiD+adw
         05rt9ss3XVGt9x/jY0ce9w645URSpP+0uQVSchx4kZiuYJ3DeyJzRTKwAxvgSsNFokRf
         Jciy/LmSBrEi6CQPutk12t35YYj9NgnPvBPPMlGwwLdmh5euJuxV31CZxnbL+ote9BLP
         zJs79Jw9k9RaYF9cmrHz1oEBjJo595YNI1z46aezlXMB9dIyAA1MaWZcr8wusxXO+YwM
         5MR7p9TYO9pL1AHWIzh1QKXLY94SKCBOh0NQggT/6nBJXQ0i6SG+sGLzaOdDePn8M8aX
         0WeA==
X-Forwarded-Encrypted: i=1; AJvYcCW+buQKzNMnfJzOOks9WMTKmP//1JMJYACXFxFwW/xcsub1szDBYB+vroHYdU0O8PpickPRRhO+woUtzld7@vger.kernel.org
X-Gm-Message-State: AOJu0YyGWTQYSV9qsEKMiYRwNTORSEUQYCGZ8jt2XhYQ5iffiCDFp1CH
	i3PshqQS4amb0GG7kMp1ihwUuYhK5+pMHwsduW1oVTMET57gDywwq649ciYZS6Crt9K0Spy2+Ar
	zXz8nD+xECzHGTpmrwpjjZmpnbFpzxS/IOXCZ42TwPz5SFDnAMOxqlyXAIyVYlxyMuxLo
X-Gm-Gg: AZuq6aLTM3A4Y8FCSy2xXMFPEYtNKoG/AcyQHPpGGZwtPYwANWEWtLDyTebKPoxUwZe
	ZzaZ5K3o0IzJdg26oQyGwQ8bFpn8a0i3oZZxNnJN1F5uBOaLdFAwi7FxQF7pdh1kRWjhZve48K0
	vwaAiGcKDOKkicOzXAHZngPsEikQIwjz5Jz2WUHaMp950IIikj8dxdZKmcZmGP9gEoPxMVD9E/8
	AQEOLxjg+JvQZ32y0GM0uSYFK3kDvoQQeLKsrqpGp52/ZFOuJpt9u/tC5GGlJql9OOxAKOjYZgd
	T6S5rlRAThHsLxW9aE3aR7+KUzz6Sl4vaq1j0I8oh0nFqLWvnW6rhWC3btsGPReyxUuG+ACagvV
	PfH6AazXPNaAzgVEOeRnkOG/Ikj52CJMNnzzzzQBVkA==
X-Received: by 2002:a05:6a20:7350:b0:343:af1:9a57 with SMTP id adf61e73a8af0-38ec655cc0emr7712060637.56.1769701750353;
        Thu, 29 Jan 2026 07:49:10 -0800 (PST)
X-Received: by 2002:a05:6a20:7350:b0:343:af1:9a57 with SMTP id adf61e73a8af0-38ec655cc0emr7712011637.56.1769701749595;
        Thu, 29 Jan 2026 07:49:09 -0800 (PST)
Received: from [192.168.1.2] ([49.204.110.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c64276efbb7sm5048588a12.2.2026.01.29.07.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 07:49:08 -0800 (PST)
Message-ID: <565a54cb-32cf-41d8-87fb-d60be63cca95@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 21:19:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] spi: geni-qcom: Fix abort sequence execution for
 serial engine errors
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260122151008.2149252-1-praveen.talari@oss.qualcomm.com>
 <20260122151008.2149252-3-praveen.talari@oss.qualcomm.com>
 <9d9d4d3d-42bf-4f4a-99d3-19df73f89c30@oss.qualcomm.com>
 <95bdb386-1635-4f8b-84dd-b5123d271b7d@oss.qualcomm.com>
 <0fddd038-185a-4cc0-b080-d12ba973cce3@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <0fddd038-185a-4cc0-b080-d12ba973cce3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -2N2TcopM2hNfL9hmkxk2krpjy5W__FH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDEwOSBTYWx0ZWRfX4BZ6OdEIW0vJ
 LFo2TN45PKMJRTX7k2F7tP+iZdE80+TWnyiAuNXk97++J7Vn/aZtN01dY2hpWLGy+9bK1tb0FT1
 75cRha9IRs85jFm7caUtFJ9Qpo2C3dzuOt8nhDL2MrZTvTj4bKAZsUbNltJds6KCdbea/eXtUbp
 6t8Jg3YkSd+mfFLoaJkUvDZNutzO1ujI86CTMgIG1RMYPcOTB5O68SruGLkgd8E6QfU5pnmFWpq
 tDQ6dZ0bMYFrPZozJb1hquSViceZTmnCzZ6TuTxaIqUgdJt9/oetymLFtM8BAsaIa+DnIwi17Dk
 c9kw2AJw627twgtWX+uwleNGpVOsGVUMxHwl4lRQpXgDz1o8VT2lvqK8ojXxGePPUXNszTR/1Rv
 wXxpYbfspCNQVk4arVZBkKKWyh7vtXcACs9+XmEluAK5DeUNkXAF/yJmmGHcGVK9mMsgGDmvp6n
 V6PGTvXuQ9qfbX6BUDg==
X-Proofpoint-ORIG-GUID: -2N2TcopM2hNfL9hmkxk2krpjy5W__FH
X-Authority-Analysis: v=2.4 cv=betmkePB c=1 sm=1 tr=0 ts=697b8177 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=hmzEZbfuJy6/QR5cQt8XuQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LZ84-7LdfmDJ-_vHDukA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91194-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5543B19D7
X-Rspamd-Action: no action

Hi Konrad,

On 1/29/2026 5:18 PM, Konrad Dybcio wrote:
> On 1/28/26 5:22 PM, Praveen Talari wrote:
>> HI Konrad,
>>
>> Thank you for review.
>>
>> On 1/27/2026 6:47 PM, Konrad Dybcio wrote:
>>> On 1/22/26 4:10 PM, Praveen Talari wrote:
>>>> The driver currently skips the abort sequence for target mode when serial
>>>> engine errors occur. This leads to improper error recovery as the serial
>>>> engine may remain in an undefined state without proper cleanup, potentially
>>>> causing subsequent operations to fail or behave unpredictably.
>>>>
>>>> Fix this by ensuring the abort sequence and DMA reset always execute during
>>>> error recovery, as both are required for proper serial engine error
>>>> handling.
>>>>
>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>> ---
>>>>    drivers/spi/spi-geni-qcom.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
>>>> index f5d05025b196..e5320e2fb834 100644
>>>> --- a/drivers/spi/spi-geni-qcom.c
>>>> +++ b/drivers/spi/spi-geni-qcom.c
>>>> @@ -167,7 +167,7 @@ static void handle_se_timeout(struct spi_controller *spi,
>>>>             * doesn`t support CMD Cancel sequnece
>>>>             */
>>>>            spin_unlock_irq(&mas->lock);
>>>> -        goto reset_if_dma;
>>>> +        goto abort;
>>>>        }
>>>>          reinit_completion(&mas->cancel_done);
>>>> @@ -178,6 +178,7 @@ static void handle_se_timeout(struct spi_controller *spi,
>>>>        if (time_left)
>>>>            goto reset_if_dma;
>>>>    +abort:
>>>>        spin_lock_irq(&mas->lock);
>>>
>>> Now that the jump is just 5 LoC, you can dispose of the goto and change it
>>> to an if-statement
>>
>> Is the modification below good?
>>
>> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
>> index f5d05025b196..4feaf24d47ea 100644
>> --- a/drivers/spi/spi-geni-qcom.c
>> +++ b/drivers/spi/spi-geni-qcom.c
>> @@ -167,16 +167,15 @@ static void handle_se_timeout(struct spi_controller *spi,
>>                   * doesn`t support CMD Cancel sequnece
>>                   */
>>                  spin_unlock_irq(&mas->lock);
>> -               goto reset_if_dma;
>> -       }
>> -
>> -       reinit_completion(&mas->cancel_done);
>> -       geni_se_cancel_m_cmd(se);
>> -       spin_unlock_irq(&mas->lock);
>> +       } else {
>> +               reinit_completion(&mas->cancel_done);
>> +               geni_se_cancel_m_cmd(se);
>> +               spin_unlock_irq(&mas->lock);
>>
>> -       time_left = wait_for_completion_timeout(&mas->cancel_done, HZ);
>> -       if (time_left)
>> -               goto reset_if_dma;
>> +               time_left = wait_for_completion_timeout(&mas->cancel_done, HZ);
>> +               if (time_left)
>> +                       goto reset_if_dma;
>> +       }
>>
>>          spin_lock_irq(&mas->lock);
>>          reinit_completion(&mas->abort_done);
> 
> I think we can make it even shorter:
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 231fd31de048..59567ef6759e 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -161,25 +161,20 @@ static void handle_se_timeout(struct spi_controller *spi,
>          xfer = mas->cur_xfer;
>          mas->cur_xfer = NULL;
>   
> -       if (spi->target) {
> -               /*
> -                * skip CMD Cancel sequnece since spi target
> -                * doesn`t support CMD Cancel sequnece
> -                */
> +       /* The controller doesn't support the Cancel commnand in target mode */
> +       if (!spi->target) {
> +               reinit_completion(&mas->cancel_done);
> +               geni_se_cancel_m_cmd(se);
> +
>                  spin_unlock_irq(&mas->lock);
> -               goto abort;
> +
> +               time_left = wait_for_completion_timeout(&mas->cancel_done, HZ);
> +               if (time_left)
> +                       goto reset_if_dma;
> +
> +               spin_lock_irq(&mas->lock);
>          }
>   
> -       reinit_completion(&mas->cancel_done);
> -       geni_se_cancel_m_cmd(se);
> -       spin_unlock_irq(&mas->lock);
> -
> -       time_left = wait_for_completion_timeout(&mas->cancel_done, HZ);
> -       if (time_left)
> -               goto reset_if_dma;
> -
> -abort:
> -       spin_lock_irq(&mas->lock);
>          reinit_completion(&mas->abort_done);
>          geni_se_abort_m_cmd(se);
>          spin_unlock_irq(&mas->lock);

Thank you for help. will review and update in next patch.

Thanks,
Praveen

> 
> 
> Konrad


