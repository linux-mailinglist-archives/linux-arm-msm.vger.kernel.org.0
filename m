Return-Path: <linux-arm-msm+bounces-114117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id viXLJbxJOmqC5QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:54:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 332476B5725
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:54:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dY63+Hl7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ETmjHYrd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114117-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114117-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C9A330253AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942893CF21A;
	Tue, 23 Jun 2026 08:54:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4D13CEB8F
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:54:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204857; cv=none; b=skti3C7vAXqLRj1an/1JnQxx1M6moL2SY12tiiU5mOFKW9nV+3vFweQfWIvm1xU9DS4uEILZWfADVoQIQx2tDc/4xQrKc2c+kskUEoQ9yxo6WtF8UjbjRqsFAp4gCVfTEMhM2hOLN7OcaL58UamSsCk9lX8D0TEx3OiOnQoQ9jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204857; c=relaxed/simple;
	bh=UKPeFZkVjoN1f5cOoU9zC8RjUtGvrmqD0t/+VYvZqs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8h6Fla7HGcEuIX6D0wPSRVllNUIDir0wRghf7zb5ZVfISQL5JdDXz4s7hgCSNcl/KzNl4TX1gelAV9+WW09szGk0q1jMB4aPUbwdNyU2zYSvUVdY4JWj+mrrQsKsfPUgItM/GHX7VaOMqeoV2jmlgan9pvXQ9XliTLsGxb97hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dY63+Hl7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETmjHYrd; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6dCoR3565075
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CSmLihCC6mZQWr5AxByQaYexpwIz57mc1SOGzHGUD3E=; b=dY63+Hl7lHY6DDfC
	wbdVJO8lUv0CVAgrHUtRCtn+WuBd0LqrsjAQDdXv+cp0eOIjIwxqQQRO6ivV97iC
	3ZOp9wLemg5Cw36x+SiD6jpaDWK5jSkTB4LH5z9DaOuE5LEsJ/W9ZM3EowrqVp//
	FAPITVA8wPafSijfp+99umvyxWXKXYSymRrlwtOrWgC6oymjv0cATCTZvWNq+YJF
	SO0VLF+QqrkCYrQeArb964o80WCM2pwV3DsJwawV3CebamRh8Z2NgBfXG0I/5AlZ
	nMxoOYaWRgB+oUyGeFUAnMWf9Jrt5SM19hZHpCkdvL+qukrXda8DJ6JW1cM9RXpM
	PRoYyQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n43utv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:54:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37c89e480easo5840849a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 01:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782204853; x=1782809653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CSmLihCC6mZQWr5AxByQaYexpwIz57mc1SOGzHGUD3E=;
        b=ETmjHYrdQIX7/8mmi8lrTVZYWBEtbc/1PhypjlslEMfOogmlUMMjiNRV5QMaFbv5LR
         36dkbfx4X3LLYI9yEhMzBfFC3iRf6uGpxmHOGJKzgXy0jfKfcHAsAuNUmmFbzPfcJEz9
         nwHUmzeWUAedWXJieXBJOrKx2QXDO319P6tDSNXgmC31RKuzdTDpHTawD43NllesG/jw
         NYOYQqMFBhM6SclMwTv3FrZ35pG6uctsF6VwLo90Rio0EfFUmdRhhNp++ieSTPBKL8Nw
         njCwVKPqYc+afKs/LIHQylLl5L0B29+Yb5Kpcjl33vXxErofTBYVizxWjfzZewdUD86m
         8qwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782204853; x=1782809653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSmLihCC6mZQWr5AxByQaYexpwIz57mc1SOGzHGUD3E=;
        b=cvmyeGs3QILRrTdn5HPunP9iy95ELuGG6jIsaQ+B/9EPTQu+LFd71kqulVR7JlUTHJ
         ghaDlUPliN74sZPFBh2cvDbvIbzlPVPpWx/+MuP3rfIXBSkcOv1rFDzESkWfu5ppximK
         fBMiPOHOzCR6tL+rBkEBcOBADvr5hpX+LBaTFnxYPo/Us57d1B43vlmMRsvDvZoyprDS
         1BTSli/S5JpWZfpIqtdR+kcvqhO5sSdLksesHi+5QcfqtT+BG6ihy6SPE9H7EJX/HAko
         siVtODvBl81SHwFuCQ9o/Y92J2oU77vn3bycqO1SbG1EeqndRj+YtgTSuc37KPdUUmYk
         ouVA==
X-Forwarded-Encrypted: i=1; AHgh+RqP5XM5L/dodbVoMEDlRLUPXfRlAEzZXG3r+ufy0xf6nmxuqioDY14ojNyyc2I5NpowTUnoXhSg8vFhrnfu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2fgecrJTx5X7gNdqiemMFnQ2gQdb3b3rh+OQCCe/ssu2CZVte
	a4rQUfsSTMYfs3pBsQms5lYgLHsv5yHWjuMVsIAT4f8T5KOPZJz9Yugjsw3/fTYhIWf6v4IcF6d
	xOiqR0HejFin1MViuAsDP1YfxwJIom5BT40CnTfFTlb0xRdDu+oLJ+tGn3P6Z9POVJtcKHAgOOR
	Z7
X-Gm-Gg: AfdE7cnrcHqpmYT9zzCQNdLz4+Joh5y97dJcmK4GzXmI5R1DFAcMmNftujA4OfVWnn1
	xiWjdrEz87DnrmTALXHbFVK+yAh8RgixvZMGd9dyZTSR4hylXbwlFp5hDp4IhTdinmdY4mnf6ri
	ZdaFvbkoEuNINgOtJ3oqdbHDF+6Mb5XS7noKqqpLEZdTzOosanVpRv7AmFoRTWbgbYNjmGrz3YM
	DrwMj4a6PzCiDqd8wdsbw67HEfmb8birBQq0YxVD0aUW4WAy13H9Bg2gL62V/FKKP3FKt8X40Be
	12js8Npw1xWupkSbidDCCvSHxungBgyXAa0Q1QcgqbOSMbPRLlCXc2RvqvMEhVZcyYOREDWjGg+
	QVVSvDmPjPYKpFXvwJWaYDtAexw6do9C1qipOm51YHwUN
X-Received: by 2002:a17:90b:35cf:b0:36b:8baa:a683 with SMTP id 98e67ed59e1d1-37dd176c01dmr1791509a91.19.1782204853000;
        Tue, 23 Jun 2026 01:54:13 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:36b:8baa:a683 with SMTP id 98e67ed59e1d1-37dd176c01dmr1791480a91.19.1782204852457;
        Tue, 23 Jun 2026 01:54:12 -0700 (PDT)
Received: from [172.20.10.7] ([106.192.20.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15de53ffsm12654566a91.12.2026.06.23.01.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 01:54:12 -0700 (PDT)
Message-ID: <3705ac5e-7e9c-43ec-bd1f-9757445984b3@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 14:24:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: sound: add qcom,wsa885x-i2c
To: Linus Walleij <linusw@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260610155708.151067-1-prasad.kumpatla@oss.qualcomm.com>
 <20260610155708.151067-2-prasad.kumpatla@oss.qualcomm.com>
 <CAD++jLkFPb4CZqTsAh_qX1Jt9pWxhwhgbhREe9uybL_S7-t60Q@mail.gmail.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <CAD++jLkFPb4CZqTsAh_qX1Jt9pWxhwhgbhREe9uybL_S7-t60Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HAdkbxtA0wco79olu5SaIyD7IuVVMWf4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MSBTYWx0ZWRfX39gOrhdqO/1w
 BHBVMiEQ2VjCY2ySoRg40X4i8LqwY+kzwOvWN2W+hbjYjL2Bny3+yPM56b5RlsVmhxWIRfpS8om
 JjdtmmmwFemvNLI+dlpIZqIAtup3OZg=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a49b5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=GtHFPjVsJ1z6j8OeKiQY1g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gEfo2CItAAAA:8 a=K5i35rRROUDlzIanDXoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: HAdkbxtA0wco79olu5SaIyD7IuVVMWf4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MSBTYWx0ZWRfX6z4jRxxLah76
 x3IIrgY6hZEIXmjykLYLCLttZ/p0qkjJerhDX4CnmJapaElpCR2lqzoLqHnH8qj9JaAm6oT1bL1
 +bK0ns+cz/JNKHjIbF5MdP3UCPjaqzYpau2al02jAFl3PuVizGz8466OFKGfVtmDpOhXh5WQjTm
 pL4DpO0Y+45HFLNJRNETX4U5j3rxmAAkyogd670wzuUHBdzQpRFd4vB7eX1R4plT30sY3a3x2l0
 5Pd50IFGVzgNPSpgqT8k4BcRMo7QxJDNE6lWnJ6DZAm0Vmobr/4uSsRIfdNBJGYoBPdWvVMd2gA
 605wZIjLROt7Bm5o1Us1GlXiU0gbHUtFC0I5ez3B/1fZJFJJp/AFTgT7rjnPhfTYxKfCD3mcHHS
 fghwWDe1rA4BwcjlyQPw6sD8GHcLoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606230071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-114117-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:brgl@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,devicetree.org:url];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 332476B5725


On 6/11/2026 2:50 AM, Linus Walleij wrote:
> Hi Prasad,
>
> thanks for your patch!

Hi Linus Walleij,

Thanks for reviewing the patch and for the feedback.

>
> On Wed, Jun 10, 2026 at 5:57 PM Prasad Kumpatla
> <prasad.kumpatla@oss.qualcomm.com> wrote:
>
>> Document the Qualcomm WSA885X I2C smart amplifier binding.
> Skip I2C? We don't need to tell e.g. "PCI" in some device on PCI and
> there is no reason to mention I2C for this device, the fact that it sits
> on an I2C bus will be apparent later.

Ack, Will rename the file name.

>
>> Describe the required supplies, powerdown and interrupt GPIOs, the
>> optional battery configuration, and the optional init-table property
>> used to program the device during codec initialization.
>>
>> This matches the driver programming model and documents the DT data
>> needed to use the codec on platforms with Audio IF playback.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Perhaps add
> Link: https://www.qualcomm.com/audio/applications/compute-and-mobile-audio/products/wsa8815
>
> (...)
Checking internal to get product Doc to publish.
>> ---
>>   .../bindings/sound/qcom,wsa885x-i2c.yaml      | 89 +++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
> Drop the -i2c suffix on the files.
Ack, Will update.
>
>> new file mode 100644
>> index 000000000..1069f470d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
>> @@ -0,0 +1,89 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,wsa885x-i2c.yaml#
> Drop the -i2c suffix.
Ack, Will update.
>
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm WSA885x I2C smart speaker amplifier
> Drop I2C.
Ack, Will update.
>
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> +  - Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> +
>> +description: |
>> +  WSA885x is a Qualcomm Aqstic smart speaker amplifier with an I2C control
>> +  interface and a digital audio interface exposed through ASoC DAI callbacks.
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,wsa885x-i2c
> Drop -i2c
Ack, Will update.
>
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#sound-dai-cells':
>> +    const: 0
>> +
>> +  powerdown-gpios:
>> +    description: GPIO controlling the SD_N powerdown pin.
>> +    maxItems: 1
>> +
>> +  interrupt-gpios:
>> +    description: GPIO used for the codec interrupt output.
>> +    maxItems: 1
>> +
>> +  vdd-1p8-supply: true
>> +
>> +  vdd-io-supply: true
>> +
>> +  qcom,battery-config:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Speaker battery configuration, 1 for 1S and 2 for 2S.
> What is a "1S" and a "2S"? Include description here.
Ack, Will Update more details for 1s and 2s in next version.
>
>> +    default: 1
>> +    enum: [1, 2]
>> +
>> +  qcom,wsa885x-init-table:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 2
>> +    maxItems: 256
>> +    description: |
>> +      Sequence of register/value pairs applied during codec hardware
>> +      initialization. Entries are encoded as alternating register address and
>> +      register value cells. The number of entries must be even (register/value
>> +      pairs); maxItems is 256 (128 pairs).
> Can this just be a table inside the driver, if it will be the same
> array for every user? If this is board-unique then it needs to describe
> what each value is actually doing well enough so engineers can use this
> documentation right here to configure their board without looking through
> register maps and what not.
>
> Something more abstract using SI units etc is probably needed here.

These values are part of a fixed hardware initialization sequence and 
are not board-specific.

I'll move them into the driver as a register table, making them easier 
to maintain and

avoiding opaque DT data.

Thanks,

Prasad

>
> Yours,
> Linus Walleij

