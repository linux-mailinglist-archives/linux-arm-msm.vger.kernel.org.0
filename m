Return-Path: <linux-arm-msm+bounces-102908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOD7E52x3GmbVQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:04:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FBD3E9853
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67A07301A7E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AA03AEF4C;
	Mon, 13 Apr 2026 09:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iDJ391v2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAMHUZI+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126B13AB29F
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071017; cv=none; b=lz7ysNviVu7rSh/UtVPurzX+fyqFR7yEX795FWuwVmr0iCOcpRTEulwH3Vw6aiJXgn7pt4uj2IIJdDYilMRmZvS0v8pHY16dPu1btXbGQKgDZYv8NETzaDtaYyTr9vQpbA1Cwbn4wLi8lCpctO6bLBGRWdPbxUv+0YZYfFVdCO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071017; c=relaxed/simple;
	bh=jDriKEpE78zV5rRxLxVFCEEZcvmOGTvNiCLV/kC703A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gq45aibDxAAFWsRRHVNC9rJU7pWEy6Un7dXcV1uLvsAth6xgZVOCFYO+LcyVUZDLDRPEkjDxqk0NkmjsMZW8URCD455IYg0gPxZ3mSmnsiUrd7Yf6+ktjwaqSGeTjm1Ed6pN2KE1gL1rJfytC9yiNAPylR9UYhBu3tG3hdqZUdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iDJ391v2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAMHUZI+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5Ceej3560421
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B5gpHsGFBiG9NzyQ9KmiK5FuQxfwhE+0d/0V7QIpHko=; b=iDJ391v2Ol7XmTG+
	vCvZu4MP3QHQHeeLg12dB9Vv44GLxAu8xs1h7xYDTzILee3veBjpYVHfq1k8r/U1
	YjywM3nWbzhHxbDHH18dOewNQcdQc8I+8acHpOdiJe/CXB5VAwXaY6icpmn3x6wz
	ctHb1LKz3KlKIODXTttWPgjlqBbra6VlOLVC7CtBNC0K7vjCgPKHWJioN2Mp3utP
	zhy3hFi7i1tZAe0WL/CPNYeUFEvmMJQuSs9NdKChcweBQhg+hD0TgZiojFM2th32
	7i90HEAi/+fDm3TsTQddUUCeIAaln7gRIyVqTbRiHdKDKJDjKBT0DpKJlHV5fPsv
	ltoWuQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0mhdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:03:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aad5fec175so57091455ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 02:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071014; x=1776675814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5gpHsGFBiG9NzyQ9KmiK5FuQxfwhE+0d/0V7QIpHko=;
        b=aAMHUZI+Bxd0tDrlOAiC/As7FxvPuDCVpLiDYvaOeoS3SC90U0X01zpOaZB6keiiG5
         AXqFzJjf+2p3oiZ86U8+ThK17AUiJjNVPEVKsbIQ+BpYCXN1/h5bt4+6Q9zEWNvo5E9y
         UpXT60XEHM9ZZ8SOQ8/HgTETBXPzAwfSK7Rkwx9LWal8JJwXdJSGYRiVZtSzRSGcH3b+
         UuY1zhzNGzVXnfevQEJG4ksNxSrQqXrj3YTqGmZ+EQuTz+f9k1Zl4aloGEvHq0LooBBi
         Ze9tQY7fgAN3kHKK9+6ebSFOxxLXayjwGZQdaxAgnysJExAVW+tdN5HgJKvX3ZL8Z060
         et7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071014; x=1776675814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5gpHsGFBiG9NzyQ9KmiK5FuQxfwhE+0d/0V7QIpHko=;
        b=NmxKns1Ormc/0yWmX4D112HY9J+nPANx7KE4WQXAY1+n5sLFiMlLABeI52rsJmbPat
         wOAfh4q5KuWlWbRonM6Y6C0JUot+JW2/znvNeaX2s3i830uw+W+dexcSy9C/HYTfJXR4
         EDuUywifPNhIhOVCBY6O1MN3FNPyKYDHVwLwYPEKg/AjZuRoNVGXeobG+MrNud8dB/I1
         ytbUoCUnB3NmaWC86hWpHIUJ5Yhs52ji1xg9WK3nmt18vMTuFqkA+wOIoA8uSc3OSdCT
         ozDKnCRFOdAV8nBHX2G9bzRqHxOw5gbfmvAl7WiIGq5kS90VvFu7bvLwOaWh4jTDFMEM
         5l6A==
X-Forwarded-Encrypted: i=1; AFNElJ9SCeaVOd++pHfs2IWaLTiF8+GXCLKspK3qAJ10+0O9gU+d++YutWEpw9ttqu6tydtmKpCHx2k0qyrdY52+@vger.kernel.org
X-Gm-Message-State: AOJu0YwVi7kGtfuRvXywG2/Tp5EKfyJwaHNLnkGVsoiXZGuFBbkygpGS
	3wWMGgixt5NSLRSKIJ3GZGvpKNdBoBRaUx1x0tsR2WJyOa4z3E+J2j6P5kuVVlCm2teZKfDZkiI
	NlpDJIWKD01bUHAj+Q+my6TPO1k/ZmXA0EqqLzDnyiCfH1t1rPhPhrDQnt5f/BYG/wG8c
X-Gm-Gg: AeBDiesGYphKmlGYL/wpRQJqk9LdC0utqESTXWqHcqA/v+/svroNG1GrFkvGnyBN2W5
	6q8eiFXvdbhwLb1RWwup/0SH76qj2B2cuXylnzbdH4qvAXYdpd3Sa1XGfV52GOpbjN9QhK2Z/QB
	tJJY40hcfipWUMVpYmE5Il8IzazZbkCLvTvBg0hFfsoYH4Rj8CIbh5T7DeXYawW8ba0Joi1HN7/
	0rhfT0zuLfEnpAT336wArlo/fGzi6eP7Q6n7cozpfRMLTMzs+1sAMdN3HrfPagEMCZUt7XQrlFG
	bCMiDIzOaCC+ystcl+ZaR9rSFm7dTY1b88Po0pGDY18VByInW3tjhYk91havIDZeRcwJ/omuGX4
	JXDk2HqGunUaV/DtX4AFwZrK9Yx2bNg3V0UtMAOI0oAMdlR7h5YRj3XY=
X-Received: by 2002:a17:902:fe8b:b0:2b2:5840:80c5 with SMTP id d9443c01a7336-2b2d5a8a99cmr85152525ad.37.1776071013133;
        Mon, 13 Apr 2026 02:03:33 -0700 (PDT)
X-Received: by 2002:a17:902:fe8b:b0:2b2:5840:80c5 with SMTP id d9443c01a7336-2b2d5a8a99cmr85152195ad.37.1776071012576;
        Mon, 13 Apr 2026 02:03:32 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4dd5cfasm132584295ad.18.2026.04.13.02.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:03:32 -0700 (PDT)
Message-ID: <71ed19bc-30ef-486b-b587-03a2503c484a@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 14:33:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] bus: mhi: Move sahara protocol driver under
 drivers/bus/mhi
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-2-47ad79308762@oss.qualcomm.com>
 <0a2af0d1-27da-4f60-952a-409a5abc5647@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <0a2af0d1-27da-4f60-952a-409a5abc5647@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dcb166 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Ac2sXQb6l7TJn-fM1yoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX72d0RloOc3vN
 HEFjnFn5odD7RLTFRkxahQiONJCRPE4Q2cChB2uaImIEyRTuIjH7vFcNOC5MTb3fHFzeUJ9/KXA
 KjLvHaEKINevGa5AKZRnfoQxwyYfiPh6gcw+nB+uFNWGsjokd7bX3xA5IoNTE17lTILjPj1Uq9b
 3jv4dtE6fKr+zELhcj7GCv1uWbnC5jVrerqFmWS2PGILLdjU6DxSTuUdU9K/d/RZCCvDy1DcqCS
 WVreNPrM2A4GJ0dwwZLUlRKAp8R6gdu4OMoYU8fw+/09m3solDn4vhpYZ363eD/AbRkgVyZbT/I
 mShBknOzrVJa95HBD7Ass5HG7zvjBL3tljPuSw+dujmdMDYI/0i3QbIBU+IQNt6uO8qgMLabjaw
 Vi/mHQF7gIWyJPCDDELH7f6R1DM8T81zPxc+x+Q+2BXLz6RAB1A4BPCioPy+0FgJpL3WdIsMq5v
 qLPJNCJccY54CHXAzTw==
X-Proofpoint-ORIG-GUID: eahQUQbRIb9tKpovQBjSFSRmzMxuvDl2
X-Proofpoint-GUID: eahQUQbRIb9tKpovQBjSFSRmzMxuvDl2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102908-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05FBD3E9853
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/10/2026 1:50 AM, Jeff Hugo wrote:
> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>> The Sahara protocol driver is currently located under the QAIC
>> accelerator subsystem even though protocol itself is transported over 
>> the
>> MHI bus and is used by multiple Qualcomm flashless devices.
>>
>> Relocate the Sahara protocol driver to drivers/bus/mhi and register 
>> it as
>> an independent MHI protocol driver. This avoids treating Sahara as QAIC
>> specific and makes it available for reuse by other MHI based devices.
>>
>> As part of this move, introduce a dedicated Kconfig and Makefile 
>> under the
>> MHI subsystem and expose the sahara interface via a common header.
>
> I don't think this belongs under MHI. Mani needs to confirm that he 
> agrees with the concept of moving this there.
>
> The Sahara protocol as defined by the spec does not require MHI. We 
> know that there are Sahara implementations over USB. I don't see a 
> dependency or relationship to MHI other than the current in-kernel 
> implementation uses MHI, but there are plenty of things that use MHI 
> (qaic, mhi-net, ath12k, etc) which are not a part of the MHI bus.
>
> The implementation presented in this series is not well integrated 
> into MHI, which also suggests to me that it doesn't belong there. The 
> Documentation is not integrated with MHI (which I mentioned over on 
> that patch) and I see the header file (sahara.h) is also not integrated.


On Patch 1 series, I have got a review comment from Bjorn to have it 
moved to drivers/bus/mhi as this implementation only supports MHI and is 
going to be used with MHI. Hence the sahara driver is moved to this 
directory. Do i need to move this to a different directory ? I will move 
the Sahara documentation once we conclude on where Sahara driver needs 
to be moved.

>
>> diff --git a/drivers/accel/qaic/qaic_drv.c 
>> b/drivers/accel/qaic/qaic_drv.c
>> index 
>> 63fb8c7b4abcbe4f1b76c32106f4e8b9ea5e2c8e..76cc8086825e7949ed756d51fcb56a08f392d228 
>> 100644
>> --- a/drivers/accel/qaic/qaic_drv.c
>> +++ b/drivers/accel/qaic/qaic_drv.c
>> @@ -15,6 +15,7 @@
>>   #include <linux/msi.h>
>>   #include <linux/mutex.h>
>>   #include <linux/pci.h>
>> +#include <linux/sahara.h>
>
> What do we need this for? register()/unregister() get removed.

ACK.I will remove it.
>
>>   #include <linux/spinlock.h>
>>   #include <linux/workqueue.h>
>>   #include <linux/wait.h>
>> @@ -32,7 +33,6 @@
>>   #include "qaic_ras.h"
>>   #include "qaic_ssr.h"
>>   #include "qaic_timesync.h"
>> -#include "sahara.h"
>>     MODULE_IMPORT_NS("DMA_BUF");
>>   @@ -782,18 +782,12 @@ static int __init qaic_init(void)
>>       ret = pci_register_driver(&qaic_pci_driver);
>>       if (ret) {
>>           pr_debug("qaic: pci_register_driver failed %d\n", ret);
>> -        return ret;
>> +        goto free_pci;
>
> This is wrong, and there should not be a change here.


ACK. I will revert this change.

>
>>         ret = mhi_driver_register(&qaic_mhi_driver);
>>       if (ret) {
>>           pr_debug("qaic: mhi_driver_register failed %d\n", ret);
>> -        goto free_pci;
>> -    }
>> -
>> -    ret = sahara_register();
>> -    if (ret) {
>> -        pr_debug("qaic: sahara_register failed %d\n", ret);
>>           goto free_mhi;
>
> This is also wrong


I want to make sure I understand the concern correctly before changing 
the init flow. With Sahara now being a standalone MHI client driver 
(moved out of QAIC and self registering), QAIC no longer calling 
sahara_register() is intentional. However, removing that call also 
removes an implicit init time dependency/failure gate. Is the objection 
primarily about losing that gating / ordering guarantee or is there 
another issue with removing the call itself ?

Once i understand that, I'll update the patches in the direction you prefer.

>
>>   @@ -847,7 +841,6 @@ static void __exit qaic_exit(void)
>>       qaic_ras_unregister();
>>       qaic_bootlog_unregister();
>>       qaic_timesync_deinit();
>> -    sahara_unregister();
>>       mhi_driver_unregister(&qaic_mhi_driver);
>>       pci_unregister_driver(&qaic_pci_driver);
>>   }
>> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
>> index 
>> b39a11e6c624ba00349cca22d74bd876020590ab..4acedb886adccc6f76f69c241d53106da59b491f 
>> 100644
>> --- a/drivers/bus/mhi/Kconfig
>> +++ b/drivers/bus/mhi/Kconfig
>> @@ -7,3 +7,4 @@
>>     source "drivers/bus/mhi/host/Kconfig"
>>   source "drivers/bus/mhi/ep/Kconfig"
>> +source "drivers/bus/mhi/sahara/Kconfig"
>> diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
>> index 
>> 354204b0ef3ae4030469a24a659f32429d592aef..e4af535e1bb1bc9481fae60d7eb347700d2e874c 
>> 100644
>> --- a/drivers/bus/mhi/Makefile
>> +++ b/drivers/bus/mhi/Makefile
>> @@ -3,3 +3,6 @@ obj-$(CONFIG_MHI_BUS) += host/
>>     # Endpoint MHI stack
>>   obj-$(CONFIG_MHI_BUS_EP) += ep/
>> +
>> +# Sahara MHI protocol
>> +obj-$(CONFIG_MHI_SAHARA) += sahara/
>> diff --git a/drivers/bus/mhi/sahara/Kconfig 
>> b/drivers/bus/mhi/sahara/Kconfig
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..3f1caf6acd979a4af68aaf0e250aa54762e8cda5
>> --- /dev/null
>> +++ b/drivers/bus/mhi/sahara/Kconfig
>> @@ -0,0 +1,18 @@
>> +config MHI_SAHARA
>> +    tristate
>> +    depends on MHI_BUS
>> +    select FW_LOADER_COMPRESS
>
> Why are we selecting this? I don't see anyone else doing this. Sahara 
> should work with and without firmware compression.

ACK. I will remove this.


>
>> +    select FW_LOADER_COMPRESS_XZ
>> +    select FW_LOADER_COMPRESS_ZSTD
>> +    help
>> +      Enable support for the Sahara protocol transported over the 
>> MHI bus.
>> +
>> +      The Sahara protocol is used to transfer firmware images, retrieve
>> +      memory dumps and exchange command mode DDR calibration data 
>> between
>> +      host and device. This driver is not tied to a specific SoC and 
>> may be
>> +      used by multiple MHI based devices.
>> +
>> +      If unsure, say N.
>> +
>> +      To compile this driver as a module, choose M here: the module 
>> will be
>> +      called mhi_sahara.
>> diff --git a/drivers/bus/mhi/sahara/Makefile 
>> b/drivers/bus/mhi/sahara/Makefile
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..fc02a25935011cbd7138ea8f24b88cf5b032a4ce
>> --- /dev/null
>> +++ b/drivers/bus/mhi/sahara/Makefile
>> @@ -0,0 +1,2 @@
>> +obj-$(CONFIG_MHI_SAHARA) += mhi_sahara.o
>> +mhi_sahara-y := sahara.o
>> diff --git a/drivers/accel/qaic/sahara.c 
>> b/drivers/bus/mhi/sahara/sahara.c
>> similarity index 99%
>> rename from drivers/accel/qaic/sahara.c
>> rename to drivers/bus/mhi/sahara/sahara.c
>> index 
>> fd3c3b2d1fd3bb698809e6ca669128e2dce06613..8ff7b6425ac5423ef8f32117151dca10397686a8 
>> 100644
>> --- a/drivers/accel/qaic/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -1,6 +1,8 @@
>> -// SPDX-License-Identifier: GPL-2.0-only
>> -
>> -/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights 
>> reserved. */
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
>> + *
>> + */
>
> What makes you think that changing the copyright markings is 
> appropiate when moving a file?
>
> Furthermore, I wrote this code from scratch based on the spec document 
> and therefore know beyond a doubt that this file did not exist prior 
> to 2024, so what you are changing the markings to is completely invalid.
>
> Also the SPDX marking you are using is long deprecated and should not 
> be used.


Sorry. I misunderstood the review comment that was given on v1 patchset. 
Only the copyright style needs to match the subsystem where this driver 
is moved to. I will make the changes in the next patch set.

>
>>   #include <linux/devcoredump.h>
>>   #include <linux/firmware.h>
>> @@ -9,12 +11,11 @@
>>   #include <linux/minmax.h>
>>   #include <linux/mod_devicetable.h>
>>   #include <linux/overflow.h>
>> +#include <linux/sahara.h>
>>   #include <linux/types.h>
>>   #include <linux/vmalloc.h>
>>   #include <linux/workqueue.h>
>>   -#include "sahara.h"
>> -
>>   #define SAHARA_HELLO_CMD        0x1  /* Min protocol version 1.0 */
>>   #define SAHARA_HELLO_RESP_CMD        0x2  /* Min protocol version 
>> 1.0 */
>>   #define SAHARA_READ_DATA_CMD        0x3  /* Min protocol version 
>> 1.0 */
>> @@ -928,8 +929,13 @@ int sahara_register(void)
>>   {
>>       return mhi_driver_register(&sahara_mhi_driver);
>>   }
>> +module_init(sahara_register);
>>     void sahara_unregister(void)
>>   {
>>       mhi_driver_unregister(&sahara_mhi_driver);
>>   }
>> +module_exit(sahara_unregister);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Qualcomm Sahara MHI protocol driver");
>> diff --git a/drivers/accel/qaic/sahara.h b/include/linux/sahara.h
>> similarity index 100%
>> rename from drivers/accel/qaic/sahara.h
>> rename to include/linux/sahara.h
>>
>

