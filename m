Return-Path: <linux-arm-msm+bounces-103094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD1lHH8O3mnRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:53:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1EE3F8403
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05CC030616E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71FB3BD22F;
	Tue, 14 Apr 2026 09:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNlqAFMo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESZLcJIk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D5D3C456D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160120; cv=none; b=hnEHePFBGIHD7Wj6AH0Yw1/6JWvBFpWsi9wre2z+SSWpOQyWClMCY3jvoIeIbtOIT7KNDuZGlroQPM6Jhv6eS120xVfYvr7gaydQcmrNW2k4qfr+tYrvWEs/zO1sKXiIIgP1CqUzV0CLF4q1rEOciywOY3mLPM35RRPBHIWm0Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160120; c=relaxed/simple;
	bh=vNcuxiJuz7ecPTV8B29JRlMCeIInrul1jIHPLz1hujQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVAvEQIBwIdGJExbJNEeLtY+LT2oX6BQlFOesvR35+hj/BTT6DafN353r6h2Bc9Ft3NZ8bnp2smtHkWs+lbszajd0zR5AvRL5NjjQyANTCzd10P8rmWTF+Y9p+SSTNmntU/u+KEM3l/WCLu3APjNGtzOIL7HZrcBKnEuA82jE/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNlqAFMo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESZLcJIk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6XiEQ3681483
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UYgzfLrWgyd1wrni+1rtp7Hj0T1fnqOlMeY5VN5OHf8=; b=JNlqAFMoF+0jNcNz
	Xlesh46qoOkI02fuffqxc16ZpUWiwfJMmwmVaFCnORhQZPVU1+fY9ewBIOoSqTtx
	2wXuUMsD0nmTFJZ6w2F+eD3XuWTtr6+J32zC3gyzR9qx2VJqT/Ys2eFNFFdvV8od
	HqLig5nACs6Wibg3aOE1lxO9IHmbSQ29bFmESphL9wCO96LVbLj7n3m3Qur+6cOg
	2R0lA3zifLM59GKSUUqXDfBeYQtxq8hXXmSbjN2W8fuC+mPz87aAMWgYiesBiOhP
	oCRV8vh4KRYseIcLq3db+AO1MqFLQFGk+0F8dziMZYr+EKxi37nKDp2P38Oozmf+
	8+BL+A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d25ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:48:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b465bf993cso15504625ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160117; x=1776764917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UYgzfLrWgyd1wrni+1rtp7Hj0T1fnqOlMeY5VN5OHf8=;
        b=ESZLcJIkCXTpatUBHky9w8ZdtTVpefTofOOIDdg8hTQgVrYAI/vKnhPGK5y9KOeJ0t
         1x2ulOvqmrzyukHh1ixRB8xTDQh7q4iWcuU0L5NmvrcyJxk9yoc/9HwtAi+pE/o1rGE9
         gv99DEOvBYHK2h+XfOdRV/sXOsa7cbrkZsb0gUi6lbSuuaOU2E8l4qmcrWApcc8Yt/M4
         imkyk+GarYuebUyNmNTgf0ptLPm0Wc8BvSRinaJpWrYW8sYi3XRC2qxaraajP9ANxhWh
         Y6mQ2eLkumf4ZmCwVuUJM/nxPb+H9ayaIJgh0LnZvBEGMTZXYJrr5Q1fCaI1/DeiuI72
         Kawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160117; x=1776764917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYgzfLrWgyd1wrni+1rtp7Hj0T1fnqOlMeY5VN5OHf8=;
        b=swvTbwh0fY3BCNYRXLFVNOKDcQVHavYDxZJfZbuuiQVZahRfOxqy1T1tU8hwVHwXAJ
         Z4HpUKWiPigf6EfJUv44uuw1EkzvCndmWbEg+BFjYd2KKxhb9bF5DUX4KxmLBeRLbSng
         BX5+mJnuoqDf0ruEUO6CXP6ydLQ7CSktBKqSlO6JaJQ1IcqrsEeruC//0OtZJ6f8nzxD
         0vlNPxhnquBkjiNzazaAjtn+VmnUN4+LNIW7umk4UC5puvwmWwR7wD3dTOo8PdB5BRnL
         oZ0jwiNz6zMHA6NqtrTphQUtbj9cQy7kF9S2aDY999TxRzT+YTHERbGaIh0/GaNjWrS9
         /MCQ==
X-Forwarded-Encrypted: i=1; AFNElJ94YkBSRMIxnYh1eH9tIS4PkMnX3lGI9XxeVSqmio01QdmuSzBslVnpe50DpxUpQJd2fwYAjP/szQAKou1Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yybc1ESO3+M/rfKCoYWIW5LiALlqhjDy/sPceeZYJhYQakUnVFw
	H41twdYBUZq93uUVriTYRDWU8mB9n9nfpsgKOLCypvgfeBA1kpX5YR22gSGs56vD1sz5itwLppv
	ade4jsuqp9edxFe947+SC7AUP2iq/7Lsvy0Bid/Rwqie6DKUvnxSBoU7O7+TLnmQ7f49Y
X-Gm-Gg: AeBDiev7XeJnj/fYBnkZgIqqZCX90QLttcY/8blz2PVjhiGYq9Ruh6lgO9s3Ijik6We
	NjKbBeRndP3iwO8/GTS0pgEUXc2Xgzb6frRUoI/15QLJHawYFycKtJoq+15WxyrVzOWd14bQ35Z
	6rE46aKmNBqV/LcWYgF8p3UTofvvxEpEBT7mfAugb1nEYWvupj2FitGR2VIZnLzu64m9hHZFMlz
	PqcvUE8RPQQ9EdNozzV88IAulp+DmRQJ6OdHiVa7/LdBxLeHqDGS97D0dsZ+I1u4fVJ4Hiq8GGl
	e0QYOwEm2sLW0EFAYdO1/eFdoK4oCervf2xb/44e1avx2+8d6BamsWiMDfjgqqXn+YmqwgDmYyW
	+vW3Anyv5kPsCLjHThf/HC1jn4ef7mOWSqLZvHuO52l1FJdjk57Hx6w==
X-Received: by 2002:a17:902:c94d:b0:2b2:5da8:14be with SMTP id d9443c01a7336-2b2d5a76e9amr168406685ad.41.1776160112227;
        Tue, 14 Apr 2026 02:48:32 -0700 (PDT)
X-Received: by 2002:a17:902:c94d:b0:2b2:5da8:14be with SMTP id d9443c01a7336-2b2d5a76e9amr168406275ad.41.1776160111703;
        Tue, 14 Apr 2026 02:48:31 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b468273ccfsm53628875ad.43.2026.04.14.02.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:48:31 -0700 (PDT)
Message-ID: <0ba07cb4-d337-4405-a9cc-82e17a648801@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 15:18:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] bus: mhi: Move sahara protocol driver under
 drivers/bus/mhi
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-2-47ad79308762@oss.qualcomm.com>
 <enwtopztznwtvlhukkggxcdmh4t7v7duoiuapi5gd4zggqwbit@ypb4nxnds53f>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <enwtopztznwtvlhukkggxcdmh4t7v7duoiuapi5gd4zggqwbit@ypb4nxnds53f>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MSBTYWx0ZWRfX3EvodxL3VfUd
 +8xvld154mo/NGZl3A7LvXurtThPGYJUkQVqzlIUSNuSugVN76tAou8AO1pZKdVbdcCZME6pe3A
 TaW+NUVcRvNZvaiDZ/0lsWrPpghoJmsRxXSA+pZRhXB4N6+w6JVgY/BEPK0MVN4cU048vc9Pbet
 shhU/xVTzImifkjH6W1vHfPEHxbsCfiTX+Q+wTf4nTqy7/qvsgoQllw86DQ1UajRfDyX6fJGPWg
 lSQnSy7KuAQsjQ5+ZnvagMzXZWyRQ/PaVVsSHlxtdtPnXDIJ0VfyQgBuDFRAClId+wQoXy2bpdd
 z8JcL+U9SmjzYlfXNrZVfso4wDTxYe48Y/oWzMbElV7JUUEpItdHUBlzqtA63ouE7TSkYT2AlHq
 ZKrEcCTkPGK/TSjPqSTGN2LT9vSKV5H5nN7sj8p4n7QeXC17ZAUN1WA0kIdKf+n/C+Kx2NGNy2d
 4pN3AYz1VqxzVNl35aQ==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69de0d76 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lNZ6NPquD5IsYqIz-wEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Za2IF4ZWDYpnRlbUXSJ-URnHughvKaM_
X-Proofpoint-ORIG-GUID: Za2IF4ZWDYpnRlbUXSJ-URnHughvKaM_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140091
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103094-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BE1EE3F8403
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/13/2026 4:50 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 19, 2026 at 12:01:42PM +0530, Kishore Batta wrote:
>> The Sahara protocol driver is currently located under the QAIC
>> accelerator subsystem even though protocol itself is transported over the
>> MHI bus and is used by multiple Qualcomm flashless devices.
>>
>> Relocate the Sahara protocol driver to drivers/bus/mhi and register it as
>> an independent MHI protocol driver. This avoids treating Sahara as QAIC
>> specific and makes it available for reuse by other MHI based devices.
>>
>> As part of this move, introduce a dedicated Kconfig and Makefile under the
>> MHI subsystem and expose the sahara interface via a common header.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/accel/qaic/Kconfig                      |  1 +
>>   drivers/accel/qaic/Makefile                     |  3 +--
>>   drivers/accel/qaic/qaic_drv.c                   | 11 ++---------
>>   drivers/bus/mhi/Kconfig                         |  1 +
>>   drivers/bus/mhi/Makefile                        |  3 +++
>>   drivers/bus/mhi/sahara/Kconfig                  | 18 ++++++++++++++++++
>>   drivers/bus/mhi/sahara/Makefile                 |  2 ++
> Create one more subidr 'clients' and move 'sahara' here:
> 	drivers/bus/mhi/host/clients/sahara/
>
> I'm not sure if we are going to have Sahara implementation for the endpoint
> itself. If so, it should be moved under drivers/bus/mhi/common/.


Thanks for the suggestion. I will create clients directory and move 
Sahara driver here. For endpoint, Sahara driver is implemented in XBL. 
So, its not required here.

>
>>   drivers/{accel/qaic => bus/mhi/sahara}/sahara.c | 16 +++++++++++-----
>>   {drivers/accel/qaic => include/linux}/sahara.h  |  0
> include/linux/mhi/sahara.h
ACK. I will move the header file to include/linux/mhi/sahara.h
>
>>   9 files changed, 39 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
>> index 116e42d152ca885b8c59e33c7a87519a0abc6bb3..1e5f1f4fa93c12d8ca8fb37633f2f0bee9997499 100644
>> --- a/drivers/accel/qaic/Kconfig
>> +++ b/drivers/accel/qaic/Kconfig
>> @@ -8,6 +8,7 @@ config DRM_ACCEL_QAIC
>>   	depends on DRM_ACCEL
>>   	depends on PCI && HAS_IOMEM
>>   	depends on MHI_BUS
>> +	select MHI_SAHARA
>>   	select CRC32
>>   	select WANT_DEV_COREDUMP
>>   	help
>> diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
>> index 71f727b74da3bb4478324689f02a7cea24a05c2d..e7b8458800072aa627f7f36c3257883aa56f4ce4 100644
>> --- a/drivers/accel/qaic/Makefile
>> +++ b/drivers/accel/qaic/Makefile
>> @@ -13,7 +13,6 @@ qaic-y := \
>>   	qaic_ras.o \
>>   	qaic_ssr.o \
>>   	qaic_sysfs.o \
>> -	qaic_timesync.o \
>> -	sahara.o
>> +	qaic_timesync.o
>>   
>>   qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
>> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
>> index 63fb8c7b4abcbe4f1b76c32106f4e8b9ea5e2c8e..76cc8086825e7949ed756d51fcb56a08f392d228 100644
>> --- a/drivers/accel/qaic/qaic_drv.c
>> +++ b/drivers/accel/qaic/qaic_drv.c
>> @@ -15,6 +15,7 @@
>>   #include <linux/msi.h>
>>   #include <linux/mutex.h>
>>   #include <linux/pci.h>
>> +#include <linux/sahara.h>
>>   #include <linux/spinlock.h>
>>   #include <linux/workqueue.h>
>>   #include <linux/wait.h>
>> @@ -32,7 +33,6 @@
>>   #include "qaic_ras.h"
>>   #include "qaic_ssr.h"
>>   #include "qaic_timesync.h"
>> -#include "sahara.h"
>>   
>>   MODULE_IMPORT_NS("DMA_BUF");
>>   
>> @@ -782,18 +782,12 @@ static int __init qaic_init(void)
>>   	ret = pci_register_driver(&qaic_pci_driver);
>>   	if (ret) {
>>   		pr_debug("qaic: pci_register_driver failed %d\n", ret);
>> -		return ret;
>> +		goto free_pci;
>>   	}
>>   
>>   	ret = mhi_driver_register(&qaic_mhi_driver);
>>   	if (ret) {
>>   		pr_debug("qaic: mhi_driver_register failed %d\n", ret);
>> -		goto free_pci;
>> -	}
>> -
>> -	ret = sahara_register();
>> -	if (ret) {
>> -		pr_debug("qaic: sahara_register failed %d\n", ret);
>>   		goto free_mhi;
>>   	}
>>   
>> @@ -847,7 +841,6 @@ static void __exit qaic_exit(void)
>>   	qaic_ras_unregister();
>>   	qaic_bootlog_unregister();
>>   	qaic_timesync_deinit();
>> -	sahara_unregister();
>>   	mhi_driver_unregister(&qaic_mhi_driver);
>>   	pci_unregister_driver(&qaic_pci_driver);
>>   }
>> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
>> index b39a11e6c624ba00349cca22d74bd876020590ab..4acedb886adccc6f76f69c241d53106da59b491f 100644
>> --- a/drivers/bus/mhi/Kconfig
>> +++ b/drivers/bus/mhi/Kconfig
>> @@ -7,3 +7,4 @@
>>   
>>   source "drivers/bus/mhi/host/Kconfig"
>>   source "drivers/bus/mhi/ep/Kconfig"
>> +source "drivers/bus/mhi/sahara/Kconfig"
>> diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
>> index 354204b0ef3ae4030469a24a659f32429d592aef..e4af535e1bb1bc9481fae60d7eb347700d2e874c 100644
>> --- a/drivers/bus/mhi/Makefile
>> +++ b/drivers/bus/mhi/Makefile
>> @@ -3,3 +3,6 @@ obj-$(CONFIG_MHI_BUS) += host/
>>   
>>   # Endpoint MHI stack
>>   obj-$(CONFIG_MHI_BUS_EP) += ep/
>> +
>> +# Sahara MHI protocol
>> +obj-$(CONFIG_MHI_SAHARA) += sahara/
>> diff --git a/drivers/bus/mhi/sahara/Kconfig b/drivers/bus/mhi/sahara/Kconfig
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..3f1caf6acd979a4af68aaf0e250aa54762e8cda5
>> --- /dev/null
>> +++ b/drivers/bus/mhi/sahara/Kconfig
>> @@ -0,0 +1,18 @@
>> +config MHI_SAHARA
>> +	tristate
>> +	depends on MHI_BUS
>> +	select FW_LOADER_COMPRESS
>> +	select FW_LOADER_COMPRESS_XZ
>> +	select FW_LOADER_COMPRESS_ZSTD
> Why suddenly these configs pop up?


I will remove these in the next version.

>
>> +	help
>> +	  Enable support for the Sahara protocol transported over the MHI bus.
>> +
>> +	  The Sahara protocol is used to transfer firmware images, retrieve
>> +	  memory dumps and exchange command mode DDR calibration data between
>> +	  host and device. This driver is not tied to a specific SoC and may be
>> +	  used by multiple MHI based devices.
>> +
>> +	  If unsure, say N.
>> +
>> +	  To compile this driver as a module, choose M here: the module will be
>> +	  called mhi_sahara.
>> diff --git a/drivers/bus/mhi/sahara/Makefile b/drivers/bus/mhi/sahara/Makefile
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..fc02a25935011cbd7138ea8f24b88cf5b032a4ce
>> --- /dev/null
>> +++ b/drivers/bus/mhi/sahara/Makefile
>> @@ -0,0 +1,2 @@
>> +obj-$(CONFIG_MHI_SAHARA) += mhi_sahara.o
>> +mhi_sahara-y := sahara.o
>> diff --git a/drivers/accel/qaic/sahara.c b/drivers/bus/mhi/sahara/sahara.c
>> similarity index 99%
>> rename from drivers/accel/qaic/sahara.c
>> rename to drivers/bus/mhi/sahara/sahara.c
>> index fd3c3b2d1fd3bb698809e6ca669128e2dce06613..8ff7b6425ac5423ef8f32117151dca10397686a8 100644
>> --- a/drivers/accel/qaic/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -1,6 +1,8 @@
>> -// SPDX-License-Identifier: GPL-2.0-only
>> -
>> -/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> Why are you changing the copyright?
I misunderstood the comment from Patch 1 series. Only the copyright 
style needs to be changed. I will modify it in next version.
>
>> + *
>> + */
>>   
>>   #include <linux/devcoredump.h>
>>   #include <linux/firmware.h>
>> @@ -9,12 +11,11 @@
>>   #include <linux/minmax.h>
>>   #include <linux/mod_devicetable.h>
>>   #include <linux/overflow.h>
>> +#include <linux/sahara.h>
>>   #include <linux/types.h>
>>   #include <linux/vmalloc.h>
>>   #include <linux/workqueue.h>
>>   
>> -#include "sahara.h"
>> -
>>   #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
>>   #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
>>   #define SAHARA_READ_DATA_CMD		0x3  /* Min protocol version 1.0 */
>> @@ -928,8 +929,13 @@ int sahara_register(void)
>>   {
>>   	return mhi_driver_register(&sahara_mhi_driver);
>>   }
>> +module_init(sahara_register);
>>   
>>   void sahara_unregister(void)
>>   {
>>   	mhi_driver_unregister(&sahara_mhi_driver);
>>   }
>> +module_exit(sahara_unregister);
> Use module_mhi_driver().
ACK.
>
> - Mani
>

