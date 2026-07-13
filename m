Return-Path: <linux-arm-msm+bounces-118657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h2xGFs2UVGpEnwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:33:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC727482F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:33:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oFRZG0FB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eOfRdPyh;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118657-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118657-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A80F43012C67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E638738F951;
	Mon, 13 Jul 2026 07:30:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ED2390217
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:30:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927839; cv=none; b=URc1B3aFJJ083QdYOna1TyMMiSB+j6/jw1OuyAN1chh64hPHj4mCzntVhGUN9WfbaTz158XIVykL+uum1F+OTQCfC55YIy4nBFsUCaVwtRUTLwzMd56mw1K5L1yTdAVENL6716fTLISQT+QCPx3kurbNn7OuHW9+D7eXTcWtPCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927839; c=relaxed/simple;
	bh=Y+CcFGR2oOYkQpeQy0juSOs+7RRYPsi2bo3KBJtoaF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYZJ1g4ejh+V2kbK1SCS71feFCii9ioVhaHUq0/bfeXeY8CYp07/yN8dr3QrmFl/DDJT3wKIP0RXPsidFuszkzOX7whhAW4btfZsj0zLCJCQzQNNHgQzwADqOrpV4QpJO5ygsw4LYAiKm5krYpucwiYWU8YWDDreJFi/ZMzenl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFRZG0FB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eOfRdPyh; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NwHI674467
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Em8mVgyGdEfRfVq1ukW+9EQ7G6falQSSjNEsV/umQPg=; b=oFRZG0FBTXeGJMO7
	f5LvKnJ3r5wpsshA11v9obYuL3jKH64/1p+uVpjQ89vRdVurxK1TSUVGzT/0IKuH
	BoZjyVWB5FV1OXcTREh0siUr2XPrPTg9STj2dYweUWCtsivda+Z/lhJ3pno/+E4K
	+YyVQK1UkoF7yhpr8TQYwBgENLnJOdvUMaNh++9PhlguQ6o+wTG5myzklqYXbS6l
	upsNOmHwYJJaJQigTKTRI4yLU/7KHJ0MzmLjjEpzdOxpZ9nvT0spUZxRfeLu73CM
	qVYVITCw5AmSJLIt2y07or3Hk5tWmpz0jnasNBVTpAZ0zXmkQzmJj9bzdWg68lLC
	Q+DKKQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgn0fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:30:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so1641627a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927835; x=1784532635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Em8mVgyGdEfRfVq1ukW+9EQ7G6falQSSjNEsV/umQPg=;
        b=eOfRdPyhgiHY3qUADVuEms3+Ru26EXB4ht9rVeuM4Z6udXwOovqsv2ac7R9ZdV1eZ+
         ENltjnQZ/0JmRitFyt1Nx1pmda7hPUxQLaEl3n7fu5vz0tqQbJPu/6P7UZaDmFKOW6xN
         zPmzslGCzpPc5vNhZPGDbypGcl+cGKCU3kNPJQVPGMn6x2i5LwOyVVDoP5wKF7Q106iH
         dfa8T+4cKinOSd80EyoLXm5DN2uuNr+m6MTA0Mgzlcv2WZ3E4elHAtJZWthK2tHpf+x0
         E5VenIrgwi+vHlHXhPS/zAFdrQNxAjoBCWvy12WCq2CPlaLa9fuhe1Yh160GlagBtjsF
         9SqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927835; x=1784532635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Em8mVgyGdEfRfVq1ukW+9EQ7G6falQSSjNEsV/umQPg=;
        b=MP//vFiNp3LG21yrOwc/NugV/lH0x/h7VtFnXwks/0bYnw/44hkM+doWcl5dg2Vx4A
         qmaBUmTZt7E1IoMCRr/tWHuRY04R2wWdfY2qMiMYXkI8j09XUYMmEHa4EAoAKNvlYYuR
         Be/9eNOgK85cfhkU19iQtpH3c8SK6Hfko5HT/EjJ6TvU2hkWTIHc5Bbz66NhBpS1aDEo
         9m7XYxhCLLON2OTR0xMzvoJ31aks7ddS8ILyOfaqH7n/QYLkPWppzXfltZ3ASvy5R5RU
         /35myeF5W+9CmaxRqvYCu3ndIwT+TtQItdJX/5c/ytLZ9gBkufmb+Msy4o3WXJ2OhoV3
         dZwg==
X-Forwarded-Encrypted: i=1; AHgh+RpbBu/5SfFCpRtrfgo25DVDuPmiDEwvhfb4w2sYSnD56iCMPNbIITQc/aorKWdwclT1+PmE9Fg5N0crWqJt@vger.kernel.org
X-Gm-Message-State: AOJu0YytMtcv5dGsBYhJFTK5SWCx32w+ijpsjHRLemSXLqQZf50Sf+yw
	SX7TVsWJU8y68T9wYT4eWabrPeUmUGZVGO8JwHTsVb7IB2PIIJ3YNn3gocSoMhx2sghBwaT4VH9
	K42/dvkaQMGLo4zgwsLS3pbaWoF7Z5/qEWb1XyWWuhXSgHKBRg9iQt3BhFigqEXdwOCL9
X-Gm-Gg: AfdE7cm3ZqBytJabkVZBurOeqXA8m3xAweVC+MfBe5Amm/GNv14OQKae583HYVHk3vI
	X0vzm987q5+/mc1w2x2HOYoOIMtwM4Shblj7q4j6ubtwKQt0sDJC0s1haGRVsCwOska79kw7WgO
	3hu+tll4/M9ECUGW5maqz0a2/7o16nJbDrOpLWWvZr/oh7s40KTLW8KYfwm4Aj1w7RVKvEGcCPi
	p0gT0HYou/ERR3RGQ/QA6IHVn/KRb5C0xL154hvYyfXL3nhngUMT023tlEjFy76SvK/qm3jINfy
	OywwdqHMIOFi4GU+tDhCV1E80cywVfx67P2ZI/hLWyP9ko6Zb7TIapEwfADLfEGRVDXmIYlMcnq
	LWkhQmWHWTZRcQrTqGSI8Aocg1NHrkiqEYp8+SB+U3ms=
X-Received: by 2002:a17:90b:1fc6:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-38dc7769973mr7950736a91.27.1783927835569;
        Mon, 13 Jul 2026 00:30:35 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc6:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-38dc7769973mr7950579a91.27.1783927832681;
        Mon, 13 Jul 2026 00:30:32 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a56417527sm6208769a91.16.2026.07.13.00.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:30:32 -0700 (PDT)
Message-ID: <fb34c262-5c91-4beb-a792-f00da203d1b6@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:00:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-7-3a78362c4741@oss.qualcomm.com>
 <n35ouuyvy25ocbfaedksryoz5d53cylk2pcsxz7f25us444gh7@7ybkifq3fbae>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <n35ouuyvy25ocbfaedksryoz5d53cylk2pcsxz7f25us444gh7@7ybkifq3fbae>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfXzOSxQ+A2jBfO
 qOeRst2hiZtxy8j9w/wEnMEkriMDaX7M4AVRfr5TZOkdwudAGdBFayeB/WKFpiCQphx3j3lYZs5
 pQhFo7kj0+TOrLquzDdHKRb5MHpmkPc=
X-Proofpoint-ORIG-GUID: BuKmt0HP_a6RKloXV4AUYRmpNYJw5nOc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX4UHzeYMwpKjG
 ni41sDDr6vp9uPC7dmmHWDQLt8MdFA5zqcXUT2HzW4jRrNvcjIP5Bgx2T0tfXsm1inzUQhCO8gs
 0Zp81TxYEBQ0mEnG+8j/5r3zikDFVNe5EPQbwNRjNpZw/K3lP2ouoq82/PzZ1rF4FQGtAMcecQT
 Mx+QRdouheA9ldE/ClljeYQDfz2u8+rke2k0NRoWVZDK6NYXmwunhTTOfJuAw+BLSLOehhoJnDi
 da2gIKGsTQwRsfGgINVHDWdqvY20Q5qAvBI0VeYlia7eZspqGVXx7FIGF74dUzFOZe9ZJ+Bma1O
 OttOGFhLSv5m25L3qhi+iORvJmFqERfz5KLSHQSNPhJG0VfwlpHA3vsQcD8VnB0ZSyuVgJVfXqW
 hTXArMlUMYASIdWMDo+7hWm0ZncxJ3XDx8OMa39s26aKVsRUlAfu0RfqZ9cMB3KMZwjSHSr+q49
 Wi5ypZ4axam+lJkH4uQ==
X-Proofpoint-GUID: BuKmt0HP_a6RKloXV4AUYRmpNYJw5nOc
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a54941c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=0IlxrgZsFcjQ__LXY9EA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118657-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:mhi@lists.linux.dev,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CC727482F9


On 7/9/2026 12:27 PM, Manivannan Sadhasivam wrote:
> On Wed, Jul 01, 2026 at 04:07:41PM +0530, Kishore Batta wrote:
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
> If this training data is RO, then what is the use of exposing it to userspace?
>
> - Mani

The userspace component will read this from sysfs and save it to a file 
named mdmddr_0x<serial_no>.mbn.

On the device's next boot, Sahara will read the training data file and 
send it to the device. The DDR driver on the device validates the 
training data and restores it without running DDR training again.

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
>>   .../ABI/testing/sysfs-bus-mhi-ddr_training_data    | 19 +++++++
>>   drivers/bus/mhi/host/clients/sahara/sahara.c       | 62 ++++++++++++++++++++++
>>   2 files changed, 81 insertions(+)
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
>> index 07bc743aa061dd2fa85638067d494562152474e3..72ac751c302a98448b5756c9feb438647bd0ce4b 100644
>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -273,6 +273,66 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
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
>> +static BIN_ATTR_RO(ddr_training_data, 0);
>> +
>> +static void sahara_sysfs_devres_release(struct device *dev, void *res)
>> +{
>> +	device_remove_bin_file(dev, &bin_attr_ddr_training_data);
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
>> +
>> +	ret = device_create_bin_file(dev, &bin_attr_ddr_training_data);
>> +	if (ret) {
>> +		dev_warn(&mhi_dev->dev,
>> +			 "Failed to create DDR training sysfs node (%d)\n", ret);
>> +		return;
>> +	}
>> +
>> +	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
>> +	if (!cookie) {
>> +		device_remove_bin_file(dev, &bin_attr_ddr_training_data);
>> +		return;
>> +	}
>> +
>> +	devres_add(dev, cookie);
>> +}
>> +
>>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   {
>>   	char *fw_path;
>> @@ -1131,6 +1191,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>>   		return ret;
>>   	}
>>   
>> +	sahara_sysfs_create(mhi_dev);
>> +
>>   	return 0;
>>   }
>>   
>>
>> -- 
>> 2.34.1
>>

