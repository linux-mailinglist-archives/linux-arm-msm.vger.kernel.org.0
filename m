Return-Path: <linux-arm-msm+bounces-112713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1rNCF/2RKmp3sgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:46:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A65B4670F75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:46:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZYyu8GuP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RjL5FUiV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112713-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112713-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FBFE33536E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B233D565C;
	Thu, 11 Jun 2026 10:43:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592D13D0919
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:43:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174597; cv=none; b=hRQbL4w3wH4DScwD4Ji6SNViMzxbjvGSA3Sr9NQJbsUyAQUiujlZvtL4voVFMuiicXuS+DVk1bBCNItI89Qq5NvAKLbJEVnAsVxZYc2c0rieSOUnzXuXHjCEV8bbAW1u7GypjSVssOt2j0LClV0yqp3sFj0uEbZAFc2yXbx6hX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174597; c=relaxed/simple;
	bh=zmNw8D5zWNdKNVzgv5ao0F5vgRAQeg0ZOCSSRFKMbzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QnsxKGND7M0WwtoCzG3nZG1EVg/xgt1RzU7QO1fJf0n6o86bjcAUkf8D98JkPy/113lBYP4ZA60T0uwv4gHRJWr7RsnpiWQ6+CJ7g/dz1mQkw+JlbpZKq1m+QYwjyr0yJoRHm4SWShSSmrg0uNfyaW6ZxJR9d8P2HnvAYHunVBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZYyu8GuP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjL5FUiV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA0p4F303967
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kSoVFawRRZBWzshRPZGQRk+ptUMUxsYND+WmlIf6M1c=; b=ZYyu8GuPzXmQwecG
	/46W6j0yy8QoY2yaWBVkoaYJXyPoCqSUqqpO9TuoSDJRCjod0KVPEiyxxZa8WL9n
	uu4bLqwh3zjurJHH9r5RW92S7yGrOoJk/5e3RtqHKzAGop7yjCzuBmwue5yBKy42
	p53S98jB4FJQz8l0J/XujeMMqHfOOoHPNsh6o4XdLKq+TKZUeA3u8qxE2urYwpsC
	7CYjLJXCNO9soKoPQxaM818l78Mo0jkNUmaSd/bcwy8F01lpGgy+BqMyFh8Yw5Ta
	7Tmmt30KqitKhXN78BxlzEznoPwUibWyEw6A9/qEUye7fig7M0ZwNc/gyMxBPK+y
	CyP1yQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5g9tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:43:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf004bf8beso90028925ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 03:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781174594; x=1781779394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kSoVFawRRZBWzshRPZGQRk+ptUMUxsYND+WmlIf6M1c=;
        b=RjL5FUiVqvr7WLuaqrZ9pv3fTyXWxAGxNZn+S95u/meMehKhLOipxdTx8X9RjNfGqB
         PWS6wpSazkPY88r1c0NAXyJ6vCtX98tPSA9ifYlgPmlqP3eAuv1FehK/a9fj0mSlorhX
         DO1H/wcuUC3qaoEU45/sl4lOHh9ITzTMGGQKTga7GM9fu/99rOgnvtAWJN6WHLzU+mot
         XZaPL/x44jDJKlbI+yf3GGi4fSVJgq8NlZBDlPMbMqo2ISoAPB/p9Z8dLppeRr9JVi8o
         LJ+9w39OJZTlVG8D53DrWZTrwMMTs8S3BSszGv0gYDTIO/ULAH6MYlAfhlwjGuKu62kA
         uXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174594; x=1781779394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSoVFawRRZBWzshRPZGQRk+ptUMUxsYND+WmlIf6M1c=;
        b=lcKVflhneGXlt8Vwy7DACK9iMuph9pLjxBcZ43x+Q+Ik+lb44w/xqnnrGsN8kBErK4
         DUqQvzHYIOlgk4i4r5WS26ApMd0Qz0QCLigOWfcXqtNS+AJxRWkO7kdE5CnXbVFMgfde
         fCutvRmxyhzP2+lnTdzdvevY1jEPW1eLNdwL+Ajypf5p2F0z+VLKFnsvO6tnEHDdr00c
         Jz32gpPfRXcusBNHKaqXQReQcXRXpEvxbcG63knEsCQZd/o43VLTD5+EQqnpVvU0Tuh8
         eilg+QELaem/PRzMIelix67+PgnSchaG/32U4+hdzawvdmHrQYqsXzG/Yu8flcK94XMa
         2VBw==
X-Forwarded-Encrypted: i=1; AFNElJ/hlJsChdeztEs3uHx+y12jLBefAvjTGzAb3BbXQWkMD/YCxlQeY2Ax8lWmX4rTtdhNEVb+IwvHfLp7pNlP@vger.kernel.org
X-Gm-Message-State: AOJu0YwGBR0J7u5ebPlaIqxRaMOzCzooZUzXq1rdLAqhY40qOVgzLC5T
	h94vE4Iig5MoXfhdePka+bBCPPN5mpX2Zmw+h72GOIqdvE6KA++K/uiHnHD2AdMKSP0WKktRp7f
	PTC3ILD4T9PrNn2pdtdlJdpp/MSRIfUPpcNdtnVJf8gxRdySCoGPU+xgTVDLRT5Hxel58
X-Gm-Gg: Acq92OFHVN0dKa/etEMXTTVafG88XCFXYxhJ+5YPidWC0rVSfotl2lH5Nsd8nzcs+Qr
	tEkyJYfdXmtELAC7xiLdEjYbj+3ZAwkSDTYawlCQX5kwfb1nbJzUlPNjwq8AcUx3Msy4bWRvWRo
	VfYcnCGR0uV+3jDhVPIs5Z6LheyKcc1zmCjdkyBeALDti4e1wXHRDJ8C13ZXV1Tsn1mnAJVZ32v
	liQoAq68GD6J4hvIUjsifCRpJCYtMGmgJ6aojkkW7JxumurYnsIHlaTN/pMiuM8rLXjSnP/5Hdf
	T9H0TfobaBFRR6Hz2RNny5qV30zCtZNR748mcWKfYUHPfpO7Ihz6Wr0FGgqwX4DzYHb3rO7i52u
	zpBvBEPB5ckqZAWO4a/07iCqII7F1s6Lbb1K7s8BNkFqELYS4UnpqAEXi2mTFUNKv
X-Received: by 2002:a17:902:c40d:b0:2c1:4d9:c8db with SMTP id d9443c01a7336-2c2f51c94d1mr25512285ad.37.1781174594278;
        Thu, 11 Jun 2026 03:43:14 -0700 (PDT)
X-Received: by 2002:a17:902:c40d:b0:2c1:4d9:c8db with SMTP id d9443c01a7336-2c2f51c94d1mr25511865ad.37.1781174593840;
        Thu, 11 Jun 2026 03:43:13 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f84335sm273881735ad.19.2026.06.11.03.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:43:13 -0700 (PDT)
Message-ID: <d095233e-ac2a-4b50-8a62-29fe1e36c2d1@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 16:13:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] iio: adc: qcom-spmi-adc5-gen3: Share SDAM0 IRQ
 with ADC_TM auxiliary driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260526-gen3_adc_tm-v2-0-702fbac919ac@oss.qualcomm.com>
 <20260526-gen3_adc_tm-v2-1-702fbac919ac@oss.qualcomm.com>
 <ah9ouLQFI7VtHCWL@ashevche-desk.local> <20260604114630.23ca427a@jic23-huawei>
 <aiGPMqHcz_AkUezI@ashevche-desk.local>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <aiGPMqHcz_AkUezI@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwNyBTYWx0ZWRfX7sZE6Ifw3SeX
 248/hIrwKkqyVFj0Eky3mqTOtQZBdoqKGBNEAvDCNj1iYuasXzTf2ftEl1Lec8HSL163TcCxHgU
 1pxNDsKBrTHoohElTIRi7g0Gg9s3DOr5QUOHwf0Lk4QnxjP5BZFwwlWcdy77AQGFbg36NyVYLVB
 O63Mv04Zyelb/s2oH8cK2jgXnVUY6bo/VWJhOgCp4FHkNjmeLd5tN8NSYlwI61vSE8+wjKGjk0H
 8eMmuRIVCMu20eGUVTQyUKwzdcHoZy06qyKB48xrh27fwpNDmhGDvesMrVEB03pJvfV7OiKhwhb
 u8MOvqeWPJws4fZ591l1ZXpMpukGAqCk16cDeqclawYdH/jyGHrSQqSUqpognEsux+jblgOSD2T
 kgIIx9QY5LLbvzlnufI2DszrMRvyJo2ySW2fkHtosfKA1QfL8wb0CKpMpQjeMrHbvEaSVJiGRpS
 /sgjYLE6Xrav9SMhBLg==
X-Proofpoint-ORIG-GUID: i6Y9lUatA2FFoDVgCm6Shxbz5W2QHpBq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwNyBTYWx0ZWRfX4/XCQweVM/t6
 bEJm1wOZzJ0YXrbGmXUuE444v+J7F9/Zc+ixkDxSNPh5uK5BmwW0f1cS6HeoXPMljAdd2rWw55h
 isQJfUe4v3SbZiWx5Uzz9pATVEx9rLc=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2a9143 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=QyXUC8HyAAAA:8 a=8gGmNC2uT6na8rc2OTkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: i6Y9lUatA2FFoDVgCm6Shxbz5W2QHpBq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-112713-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A65B4670F75

On 6/4/2026 8:14 PM, Andy Shevchenko wrote:
> On Thu, Jun 04, 2026 at 11:46:30AM +0100, Jonathan Cameron wrote:
>> On Wed, 3 Jun 2026 02:35:20 +0300
>> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
>>> On Tue, May 26, 2026 at 04:26:09PM +0530, Jishnu Prakash wrote:
> 
> ...
> 
>>>> +	ret = devm_request_threaded_irq(dev, adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq,
>>>> +					NULL, adc5_gen3_isr, IRQF_ONESHOT | IRQF_SHARED,
>>>> +					adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq_name,
>>>> +					adc);
>>>>  	if (ret)
>>>>  		return dev_err_probe(dev, ret,
>>>>  				     "Failed to request SDAM%d irq\n",  
>>>
>>> Also add a patch to drop this duplicate message.
>>
>> There is another thread going on this.  It might not be duplicate
>> if -EPROBE_DEFER is returned.  The message won't be printed but it
>> will be logged for helping debug deferred probe reasons.
> 
> Yes, and I explained that it is duplicated as long as I understand current
> code base.

Hi Jonathan, Andy,

After I checked for Andy's first comment, my understanding was that
devm_request_threaded_irq would internally call dev_err_probe in case
of an error, so this dev_err_probe print above would not be needed.

Please let me know if it's better to keep or remove this print.

And if I make the change, shall I add it in a separate patch
before or after this patch in the next series?

Thanks,
Jishnu

> 
>> So maybe we have been a little too energetic in removing these.
> 
> Or maybe sashiko consumed a bit of LSD :-)
> 


