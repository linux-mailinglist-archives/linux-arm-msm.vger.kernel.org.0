Return-Path: <linux-arm-msm+bounces-115643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AI5JAL7tRGp53QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:36:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 669466EC34A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:36:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Xjv5oH18;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Da20vxMJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115643-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115643-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41169302978C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B134192F2;
	Wed,  1 Jul 2026 10:36:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411FB3F1674
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:36:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902196; cv=none; b=hpcAs3wfsYo1jLcmMBAK0cCXIQE1iWSNPTRuXjbSkcfdwLmRqlzFHo6SZlbmgIG3yYu3GppdEPkBXv8BC8zZe4UMGii1dpGoaWcFA1ZKZdT/gKBjE4pWUTJe9CT6hRrsQ/AdJ/LAttGf5ztj7OdOAJxtbaAu3Hqd5Rhk/18zc+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902196; c=relaxed/simple;
	bh=AFBuZF9+MK6MOBrXljGd2j9MG1qbHJ+p1ga5zd6y3rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjQ4Sczgk1wKsrhfcpdOLaVo0SNJU8UKiwIvuEVd+QljSXVLKDi65fN3PySsIUEWxdfghJ+doO+WRK7Ua6Yq3oEAclQ4Mjhl1lEnX3zFE3VdAKTED9Pn7mSLpFs1QzbEHKWlzQ0xbsis4ofermhbBdl7rYMvm90auKpdwNbbfiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xjv5oH18; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Da20vxMJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8Ols761389
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O8G6SEKueMAy0GKvF0ivRFmIBQ9+gkPfS66+uUscIR4=; b=Xjv5oH186eURa32i
	pv60++cqYka6A4+MLPNPZRWttiWo+5Uw2mVC44ibCjKYpdE0dW8g70mIx8/qk8gl
	G5zuZ49wxkH2HZmrNyKCN3vwBb8lFzGDz5jBklbIOFRrb7S6FJ+qAwkSvxiAiqc4
	QqUpem95ahLLmmqKjQHeYDkK9NkTi6IhynEpP1U5H4IySL6+zee/d2xxxT26ub1I
	LxhvIFr39vOOk171cF4ljxL8981ABXnArN2jjqza5A6ApZl4dYJ5kNCtJDsRsQ3/
	uomUn8l+wyrN13QziaD+IjncZ0ruKigT/S1KPDRXFxYcmn9Ri4AWG0NZ1GlBAqY/
	oyChAQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd05a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:36:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847a2509456so600198b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902193; x=1783506993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O8G6SEKueMAy0GKvF0ivRFmIBQ9+gkPfS66+uUscIR4=;
        b=Da20vxMJfIiOuakRTJClKmVWEAeNrBFyikKEAkkPWB1e5O4GhZXgWDneiurGqWV45O
         2KiDzWiWbzWXb/aOd7c9L4Cve78qhcKyYJUNZgiKJnPF4BMAEftdljS08RIvsY3yIgfe
         7QXNOzzGHXolVTi5M6jAzwngOZ/KOHN72v106y2Mkj2qrMAf02jHvR0EP3zMnS+PVNIS
         dVYYPYVxOI4Nm+PhE0idOi9npBWvoflzqGX5dK7UMb9zJR11cSI/tWhkMMF0rPdyNsTL
         oYxyStxZTtdZQKowB3lKZrLhOAG1oWDnXy9YGy35xys+klEI8PbdneezN4bttsBJaYEX
         igzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902193; x=1783506993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8G6SEKueMAy0GKvF0ivRFmIBQ9+gkPfS66+uUscIR4=;
        b=HcpNoTRXgokq9OCbjOcipe7SzhbGG8Rjb4Rw68bejNDvj8Us6RgbCoKm2yHGrZmV0k
         /0TwORKHY6Nz4pZ2z58QavXQnI0KjxC6qPqY47Fc/TxxgORmSBykZZH2SR8Exr3NXF8O
         mR4qfgJlG+jRvHpCU+fgho9OtFrP2XxMJtVLsM/Ht6O9SFKmTJzlUiLqvpKy05U23NJA
         hyTl8CzJj3k7EtJfcCLXDm00lHOQMQeaT0cRMsaDFYolkc2nRYKpcVGC+LW4K81sMQL5
         09GYJ6hSzknxIO831cZYKrdQ0EHoQ3IoiWI6FkazwYhCcmfcWIz1OpmATBOvAbNa2DuS
         47Vg==
X-Forwarded-Encrypted: i=1; AHgh+RpWy2EPQ70jTrfmO9I2n35Y0vi18WVprg8cvncXE0IfpBo0ASLVAZkU3HwOwDni2tMBv4bcoPQ4IPDYXhbm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8vq6L+Qb+o1E3DwS7DwS1vCAHmyQVlyfSrl+8Bu0R0g6Bvdwo
	POQHCPqZNc2LmY2q5e2044ejCs23xpIOl2W8qiotxy1v7eSfNn+AyJBNq9dlUXl49kt/vtfhKEB
	AVhKg3ydK5vKhb5PDi6aqJvvjjWx1BwG8NS0H9iSBlmr9dNZ6+LZ3doNfsGN12zQ/NGII
X-Gm-Gg: AfdE7cmxLoIiyiVMLmoVMwL+xzdD2zr06Vsr+GsW25Ev2lIhu7sy/V5VXACAE1FOdJb
	feehqovx6zOQaKZpPn1XjrMbpcO7iCjslsoEzoF3mMnsZyjaJ4OyraNk7dl9904+KVAAS7df6zH
	/Y4+7Vr4E48xvL9lnN/8BlKTtQPMW1vieamFEKkG7vi/VxLMSAff6/Pi6yliyaRwIjTMJhjXCq4
	hjovRw7jun/R5IlVGyDSxW5T87s0YGKd+OTpONwjISTZ7Qdwrd08NLYaHTzBZJn36MNtlP1OOUm
	zzm9ZucCecfI9tCuNTpIAi0Zec1tNObfjjenqR8YpKJaz8lEGdt/d5lNKIPzhlr7csdcBcHlv/b
	SEirs2Qb8O9A7FfN299rny+IqICJhduJxmNt8rn6kgaQ=
X-Received: by 2002:a05:6a00:1a88:b0:847:8625:f7bb with SMTP id d2e1a72fcca58-847c09f1bd2mr873343b3a.60.1782902192713;
        Wed, 01 Jul 2026 03:36:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a88:b0:847:8625:f7bb with SMTP id d2e1a72fcca58-847c09f1bd2mr873321b3a.60.1782902192198;
        Wed, 01 Jul 2026 03:36:32 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fffa4f0sm3803736b3a.19.2026.07.01.03.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 03:36:31 -0700 (PDT)
Message-ID: <6a40311b-8f3d-4bcc-a3d7-98022ad119eb@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 16:06:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
 <20260416-sahara_protocol_new_v2-v5-7-6aebf005e4ba@oss.qualcomm.com>
 <x732txb6wf2giiv22xw66sqrnkjluaua5kbsmjugv4rbvpjqrw@ro2wbv2olzbd>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <x732txb6wf2giiv22xw66sqrnkjluaua5kbsmjugv4rbvpjqrw@ro2wbv2olzbd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a44edb1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=n9NIK8s-xoBB9Vmc4qAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: IQiOD-BoomB-bNhKwZfPb1ZyjzHt4oet
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX7sw6FNB3x/je
 z5cTJFhOmBs0OB3cpIPmVSf/PoD5U7TrlRY+2ej/vT9sLUn/+P9WhKdSHfOErjbE8jAbh3WY72S
 +fgcvigsaC98cY3w8+3KGhj4xwWSToA=
X-Proofpoint-GUID: IQiOD-BoomB-bNhKwZfPb1ZyjzHt4oet
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX2O45aTq8kfSA
 +BM+qN3FAhagUnA0gm3xHwl447XsqL6Mz/uOQvQgm5YoNG/QdTtWEgKO9ptjc5Qr7JKdDPEZ+vu
 FuYojmn+jgOHSgCVuT0nhQCGOsCQ1bG4yVytueO4Ttv01i8tHhgpOU1EfzHVzVqqZ8zDmAyhdrI
 p2IgeyZOz65/TWTcGTqoJmTVwP5T9XGZasV46HfXSIBUX6LRCYi7oCT3XcTs/3YK6BZxsgRchjq
 +5px8kHK6/jjUs3wj34L3zA3Zq4i7XN50D8cF2oy+3qPFt8CghyND882UF4e72jzTTJH+06Nt94
 R6OsTxhF2S4QoJm/XyRK3m4+0i2Mza0LrT+2CuLyL41YHhHiRA3bv2YmkrA8gpr9beBl45ftwbR
 HMYbga8FJu93Sf4oc1PRljseafg3VT6mrZI8ZceUe5GTYwxG96rOWpZKrItp75s3Akl/5ukUDcB
 w+s9fVT0By+qEfxPxGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115643-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:mhi@lists.linux.dev,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 669466EC34A


On 5/12/2026 7:49 PM, Manivannan Sadhasivam wrote:
> On Thu, Apr 16, 2026 at 07:39:48PM +0530, Kishore Batta wrote:
>> DDR training data captured during Sahara command mode needs to be
>> accessible to userspace so it can be persisted and reused on subsequent
>> boots. Currently, the training data is stored internally in the driver
>> but has no external visibility once the Sahara channel is torn down.
>>
>> Expose the captured DDR training data via a read-only binary sysfs
>> attribute on the MHI controller device:
>>
>> /sys/bus/mhi/devices/<mhi_cntrl>/ddr_training_data
>>
>> The sysfs read callback serves data directly from controller scoped storage
>> and protects access with the controller training data lock. The attribute
>> lifetime is tied to the controller device via devres, allowing the data to
>> remain readable after Sahara channel teardown and ensuring automatic
>> cleanup when controller device is removed.
>>
>> Userspace flow:
>> 1. For each controller device, userspace reads the ddr_training_data sysfs
>>     attribute.
>> 2. If the read returns non-zero data, userspace persists it using a
>>     serial specific filename (for example, mdmddr_0x<serial_no>.mbn).
>> 3. On subsequent boots, the Sahara driver attempts to load this serial
>>     specific DDR training image before falling back to the default
>>     training image, restoring DDR calibration data and avoiding retraining.
>>
>> Add ABI documentation for the DDR training data sysfs attribute exposed by
>> Sahara MHI driver.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-mhi-ddr_training_data    | 19 ++++++
>>   drivers/bus/mhi/host/clients/sahara/sahara.c       | 69 ++++++++++++++++++++++
>>   2 files changed, 88 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
>> @@ -0,0 +1,19 @@
>> +What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
>> +
>> +Date:                   March 2026
>> +
>> +Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
>> +
>> +Description:            Contains the DDR training data for the Qualcomm device
>> +                        connected. MHI driver populates different controller
>> +                        nodes for each device. The DDR training data is exposed
>> +                        to userspace to read and save the training data file to
>> +                        the filesystem. In the subsequent boot up of the device,
>> +                        the training data is restored from host to device
>> +                        optimizing the boot up time of the device.
>> +
>> +Usage:                  Example for reading DDR training data:
>> +                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
>> +
>> +Permissions:            The file permissions are set to 0444 allowing read
>> +                        access.
>> diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> index 07bc743aa061dd2fa85638067d494562152474e3..fef5dc1d8884133397d204f23361584fd1d9b075 100644
>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -273,6 +273,73 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
>>   	return ct;
>>   }
>>   
>> +static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
>> +				      const struct bin_attribute *attr, char *buf,
>> +				      loff_t offset, size_t count)
>> +{
>> +	struct device *dev = kobj_to_dev(kobj);
>> +	struct sahara_cntrl_training_data *ct;
>> +	size_t available;
>> +
>> +	ct = sahara_cntrl_training_get(dev);
>> +	if (!ct)
>> +		return -ENODEV;
>> +
>> +	mutex_lock(&ct->lock);
>> +
>> +	/* No data yet or offset past end */
>> +	if (!ct->data || offset >= ct->size) {
>> +		mutex_unlock(&ct->lock);
>> +		return 0;
>> +	}
>> +
>> +	available = ct->size - offset;
>> +	count = min(count, available);
>> +	memcpy(buf, (u8 *)ct->data + offset, count);
>> +
>> +	mutex_unlock(&ct->lock);
>> +
>> +	return count;
>> +}
>> +
>> +static const struct bin_attribute ddr_training_data_attr = {
>> +	.attr = {
>> +		.name = "ddr_training_data",
>> +		.mode = 0444,
>> +	},
>> +	.read = ddr_training_data_read,
>> +};
> You can simplify the attribute creation with BIN_ATTR_RO().
ACK. Will use BIN_ATTR_RO() in v6 patch series.
>
>> +
>> +static void sahara_sysfs_devres_release(struct device *dev, void *res)
>> +{
>> +	device_remove_bin_file(dev, &ddr_training_data_attr);
>> +}
>> +
>> +static void sahara_sysfs_create(struct mhi_device *mhi_dev)
>> +{
>> +	struct device *dev = &mhi_dev->mhi_cntrl->mhi_dev->dev;
>> +	void *cookie;
>> +	int ret;
>> +
>> +	if (devres_find(dev, sahara_sysfs_devres_release, NULL, NULL))
>> +		return;
> So you are expecting this helper to be called mutiple times without teardown?
>
> - Mani
Yes. This helper can be invoked multiple times for the same controller 
device without a full teardown. In this case, Sahara probe can be 
re-entered across events like subsystem restart/warm resets, while 
underlying controller device(mhi_cntrl->mhi_dev->dev) persists and is 
not re-created. Since this sysfs node is associated with the controller 
device (not a single probe instance), it should only be created once per 
controller lifetime. The devres_find() check is used to make the helper 
idempotent and avoid duplicate sysfs creation when probe path is 
re-entered. The sysfs lifetime is intentionally tied to the controller 
device, so it is only removed when the device itself is released.

