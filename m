Return-Path: <linux-arm-msm+bounces-118158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6ecJFraAUGrr0AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 07:18:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1D17374B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 07:18:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lsItxuOl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HiDnDB0l;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118158-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118158-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 565593019480
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 05:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C1C36683D;
	Fri, 10 Jul 2026 05:18:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3174235DA63
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:18:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660723; cv=none; b=HL5fQzH9a56KymOz4J1i2LgYuQXnFRfmRUSS8BvfTKe+70oOdYysv9nWNmY2NJOZ2WxogFhxA4cNfdmvxuQL6NKcups2J2/6GuIdWwf0rzih+YjumJ3r8l0gtaz8zqHa9zBVEgLT+hMMtdUSDFm81wXczwd637nn7/+j+d6m7kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660723; c=relaxed/simple;
	bh=CFhYBpFASUi4kJne5tmfoaQfUFFZv0IW+q7BueYXfxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TpY+DZa7bO0+6fOWiaFGea0jz9a1SN3BvwHBTzVoZVsF3R604AlWH+vIKERnCgBBV/RIEGqXGxH6cAaWc8QGZD/+caFSH0/uLZ1SjmsngRmbhHtrV8Nc7rmQmE2Cfg2jka/KB6lk476A6mWRDIsYG4EQ1sbeOhwB8EdBo3m//yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsItxuOl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HiDnDB0l; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3nUFO3803937
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qD0u0athdFjd83FLWFwWIF6JDNJtir1aylsMBxMUGw=; b=lsItxuOlinmPrGGo
	e/sAdhde3zp4fkaLf0tqm6rNNNlkbikkCHuo0m8SkmVJzD5P++tySqQXKc5xkIOC
	/ypNuqui5UIqRha32qCs0KDYtd98NdRk3gFEnPSV7/tevVkdPnV5ytLplpIZV8s4
	cneQfmyxxGBMHgW5n52W8xfnKrIfBPaqBbsIdJlMxGklJJfZRIHUFodsNNOlnDwl
	e9qR7ur4E04sdSlLLrHMwZksEZyi044E1BZlMweD6ERwMiNkqgMbyq4WDMotvPXU
	GbprAGEYwZoecXlhRDcMtvy3o0rqw/tnLc3wH1a1DYYmcidXl8gpXAzdcr6urbdC
	WK2BKA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf5mtk18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:18:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f0c46bfb6dso12367806d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 22:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783660719; x=1784265519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qD0u0athdFjd83FLWFwWIF6JDNJtir1aylsMBxMUGw=;
        b=HiDnDB0l/0YYstWKwgkYwtNvqgtkxc1UpPBdzwYPpVsEGwpX1MtXxXABSUj52j2rVz
         cftzY7jxnSMFwV9PxJg6dS6a6HaAlY1iLimF/Kq6sppIcLZ61A3B72/DZYpS/Xt8RdhR
         R0vtun0ViQPlPgoE+1dlaS5YPCaFsdSnynQ/jgs3nhyKbG4GSCupWgikBIWY3euEeaUE
         yF/rzJ856Q/me7TQ3u/wb7aB8oGzDEhYIT8fkPL065ULPDQV4IpZYSxtud7HCu84yww4
         Pje+xKFAtRvzKbmWCPzhDeClJpTEtAscnr/wNF7pa0tsRLhI9LHsb+zwKbeEOzS89+6w
         DpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660719; x=1784265519;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qD0u0athdFjd83FLWFwWIF6JDNJtir1aylsMBxMUGw=;
        b=WK1ngt+M2H0QViZQkc7rc1113txSg2TEzk8I/CFrfCZ/GisW3GX2lYlN0StDwKG6ct
         a/n0ULp3pglbfREi/lR4X4ryt8zZglRvBj3mkDiYrFxQCtUcJF+ZeO3GNIsVHsbFhwvK
         XmOm4RDIY6bROtCFhjxjj4jhq5QYqW1QEKqMlKRgCHWt/IzPuyqhOoW569tHovu9E7Mi
         M+8scfuLzuS4dlYNSxj2dVcRid9GR5numClB3Ctsgo7vkaSQYEOg5bIAv0FLiDWvNRjz
         6rX3ZAu5UZ8RxnPQqqUtTZkP9xP/eY2YRrML1ELSgxqsm4nXXZr5W2EQ6eMulGtmA0zZ
         Jr2g==
X-Forwarded-Encrypted: i=1; AHgh+RpYcvzshV3sY0vFcPJM7EjPwkblB23tFjdt1eqbJFcCclHhRoHg0wHDFiEs6jqyG5FyKR7ohmYK6SuqFYpu@vger.kernel.org
X-Gm-Message-State: AOJu0YxY4NppiqD5rc1z/xZ+JJsbwffLx5n8HZIMp7X0SttorW5wmCzw
	5iIU4S2lj2goa2pUVyhkXQvPf78hmjhRiJ1v0yq523hqKHG6B+rWbMBhEbgaIwcmpiFk58D3xc5
	sNuN2jvFn9aA6GL+q32v8e4sdAnwT1Y1ls7ezzITVFz5dcUVlEa38J6DvJKfR5eRnHPDB
X-Gm-Gg: AfdE7ckkol2e0typ5EjETNcjHIdXVsDX+4TCkMLfI0Cz2Hy4ZSMui+SduCCQju4f+yB
	wfRCDWVcHtYk9vznSxmqYm5JFxNdIe/uRgaIUGcqapFbszslmrzDk/PcbFkfyzbX0nq9JueJbzC
	XfioR6vJMT0GTrXcIFqJBrblk5Thfujbb+2315dSJq8JryvHgfQBO2D3PGdGqG8zvmyZc2Ix2rH
	JZlnY6CAPzV71GQLx0zHxpCtD5t85lCJOUZSxzikSabxVGKo5AfP9n5V/IGASZQOx8U7DFiuPgu
	xuOZa1wM+5IGjOfLN8/CIfv1ZRLW6j5Iig55f63+vZ/Uvv/16EgT5ZG8Jbqwqiy0QpR8JEWgzj/
	V90sQObkzlcyWBxYFxse//GDv6bnpyO2Dei8ZqQ4=
X-Received: by 2002:ad4:594f:0:b0:8f2:c086:2523 with SMTP id 6a1803df08f44-8fec304ad3dmr107914746d6.30.1783660719189;
        Thu, 09 Jul 2026 22:18:39 -0700 (PDT)
X-Received: by 2002:ad4:594f:0:b0:8f2:c086:2523 with SMTP id 6a1803df08f44-8fec304ad3dmr107914626d6.30.1783660718713;
        Thu, 09 Jul 2026 22:18:38 -0700 (PDT)
Received: from [10.239.96.184] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e3083sm33403376d6.6.2026.07.09.22.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 22:18:38 -0700 (PDT)
Message-ID: <c76f6810-d477-40cd-8534-cdff82605d67@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 13:18:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Bluetooth: MGMT: Fix discovery state race against
 cmd_sync worker
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
References: <20260708093822.3495633-1-xiuzhuo.shang@oss.qualcomm.com>
 <CABBYNZJ+Kw0RGE3sW4AWUTzHeAH0Z1UhBQwdkhtpQg5FKOUtCw@mail.gmail.com>
Content-Language: en-US
From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
In-Reply-To: <CABBYNZJ+Kw0RGE3sW4AWUTzHeAH0Z1UhBQwdkhtpQg5FKOUtCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bljFpuEsfWyHHHJ0Skdw3zmEsZl5_ms7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA0NyBTYWx0ZWRfX6bX3xm7NWqdZ
 wgb5UjIMGbo7634dCfKbddO3zrYsupg1WwtT1uWYb7G+81khxsj32U+ktd8HaZEcusmkSMHi0Yt
 gSA35ydGIuxw62bH9vXNQ/hlqjWXvkA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA0NyBTYWx0ZWRfX53Xw3wTgLnB9
 SToZWR0JbP95XmptjbsGCUqyG0SGQBV/XjLVuk/Iob+4Ay1DxZxeOwSY3xzYvk96lju5uVQYuV3
 i0wN7cfG00zVPUwoLSnx/p8B/fSIUokU50IyhIZ+LJ1mlwQDQ9vRSWUji9sdKs0hhnyj1/L/iA1
 AFpXTjtlG5iTNGoaFNgW0mnZFup7WGEYmhbttWFNir2UJz9MHc8AsF2bP1Li6nvYpHlh9uPmwfp
 iBNMvq53PyId49i4M1FAP+mkzgYO19whKv9XsjMXnogZXTtmtahSztbKqLQfG7mrWAMB/Zx5UQJ
 488VMJ2xJyv1vIdnvfB+ut04BVQh2GXGzEx0OCxA1u0+zbNeF9WJ35cWAnBoaZu3mkInPSd+8TZ
 x8qOFajAHinaoGkncVQT4qfBDeqrnuEmLYfUseNQ33SHMrBeCAj7MaFoVHS211Q5vZa+ufUIAkw
 uqTrbttlRT+9D2n8Ktw==
X-Proofpoint-GUID: bljFpuEsfWyHHHJ0Skdw3zmEsZl5_ms7
X-Authority-Analysis: v=2.4 cv=N+QZ0W9B c=1 sm=1 tr=0 ts=6a5080af cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1R3jAp6bkt0XbGehbloA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118158-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:luiz.dentz@gmail.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cheng.jiang@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xiuzhuo.shang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiuzhuo.shang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: DC1D17374B2



On 7/8/2026 9:51 PM, Luiz Augusto von Dentz wrote:
> Hi Xiuzhuo,
> 
> On Wed, Jul 8, 2026 at 5:38 AM Xiuzhuo Shang
> <xiuzhuo.shang@oss.qualcomm.com> wrote:
>>
>> start_discovery_internal(), start_service_discovery() and stop_discovery()
>> queue a cmd_sync work item and only then move the discovery state machine
>> into its transient value (DISCOVERY_STARTING / DISCOVERY_STOPPING):
>>
>>   err = hci_cmd_sync_queue(hdev, ..._sync, cmd, ..._complete);
>>   if (err < 0) { ... }
>>   hci_discovery_set_state(hdev, DISCOVERY_STARTING /* or STOPPING */);
>>
>> The matching completion callbacks run on hdev->req_workqueue serialised
>> by hci_req_sync_lock, which is independent of hdev->lock. So once the
>> work has been queued, the worker can be scheduled, run the sync function
>> and invoke the completion before the caller has executed the trailing
>> hci_discovery_set_state(). The completion's success path writes the
>> terminal state (DISCOVERY_STOPPED for stop, DISCOVERY_FINDING for start);
>> the caller then overwrites it with the transient value, and the state
>> machine is wedged: every subsequent Start (Service) Discovery is
>> rejected by the DISCOVERY_STOPPED gate with MGMT_STATUS_BUSY (0x0a),
>> with no HCI traffic generated, until bluetoothd or the adapter is
>> restarted.
>>
>> Fix it in three parts:
>>
>>   1. In all three call sites move hci_discovery_set_state(STARTING /
>>      STOPPING) to before hci_cmd_sync_queue(). The transient state is
>>      therefore always published before any worker can run the
>>      completion. On queue-submit failure, roll back to
>>      DISCOVERY_STOPPED.
>>
>>   2. In start_discovery_complete() and stop_discovery_complete(), wrap
>>      the terminal hci_discovery_set_state() call with
>>      hci_dev_lock() / hci_dev_unlock(). These callbacks run without
>>      hdev->lock; serialising the state write matches the pattern used
>>      by mgmt_set_powered_complete() and removes any residual ordering
>>      hazard against a concurrent mgmt path holding hdev->lock.
>>
>>   3. Generalise the "ignore -ECANCELED" early return in both completion
>>      callbacks to "on any non-zero err, also reset the transient state
>>      to STOPPED". With (1) in place the state observed at completion
>>      time is always known.
>>
>>      For the stop path this also fixes a pre-existing wedge: when any
>>      sub-command issued from hci_stop_discovery_sync() returns an
>>      error, stop_discovery_complete() is invoked with err != 0. The
>>      existing "if (!err) set_state(STOPPED)" tail then skips the reset
>>      and the state machine sits in DISCOVERY_STOPPING forever.
>>
>> Fixes: abfeea476c68 ("Bluetooth: hci_sync: Convert MGMT_OP_START_DISCOVERY")
>> Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
>> ---
>> Changes in v3:
>>  - Replace inline patch title with lore.kernel.org URL in v2 link
>>    reference to fix GitLint B1 line-length check.
>>  - Link to v2:
>>    https://lore.kernel.org/all/20260708062009.3047447-1-xiuzhuo.shang@oss.qualcomm.com/
>>
>> Changes in v2:
>>  - Fix if (err < 0) to if (err) in both start_discovery_complete() and
>>    stop_discovery_complete() to also catch positive HCI status codes,
>>    flagged by Sashiko.
>>  - Add Fixes: tag for commit abfeea476c68 as requested.
>>  - Update commit message wording from "err < 0" to "non-zero err" to
>>    match the code change.
>>  - Link to v1:
>>    https://lore.kernel.org/all/20260707093426.372897-1-xiuzhuo.shang@oss.qualcomm.com/
>>
>>  net/bluetooth/mgmt.c | 86 +++++++++++++++++++++++++++++++++++++-------
>>  1 file changed, 74 insertions(+), 12 deletions(-)
>>
>> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
>> index 733a4b70e10c..81c09c24a14b 100644
>> --- a/net/bluetooth/mgmt.c
>> +++ b/net/bluetooth/mgmt.c
>> @@ -5975,15 +5975,38 @@ static void start_discovery_complete(struct hci_dev *hdev, void *data, int err)
>>
>>         bt_dev_dbg(hdev, "err %d", err);
>>
>> -       if (err == -ECANCELED || !mgmt_pending_valid(hdev, cmd))
>> +       if (err) {
>> +               /* The queued start-discovery work failed before the normal
>> +                * completion path could advance the state machine. The
>> +                * caller already moved the state to DISCOVERY_STARTING
>> +                * (under hdev->lock, before queueing). Reset it here so the
>> +                * gate in start_discovery_internal()/start_service_discovery()
>> +                * does not wedge in STARTING and reject every future Start
>> +                * (Service) Discovery with MGMT_STATUS_BUSY.
>> +                */
>> +               hci_dev_lock(hdev);
>> +               if (hdev->discovery.state == DISCOVERY_STARTING)
>> +                       hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
>> +               hci_dev_unlock(hdev);
>> +
>> +               if (err == -ECANCELED)
>> +                       return;
>> +       }
>> +
>> +       if (!mgmt_pending_valid(hdev, cmd))
>>                 return;
>>
>>         mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt_status(err),
>>                           cmd->param, 1);
>>         mgmt_pending_free(cmd);
>>
>> -       hci_discovery_set_state(hdev, err ? DISCOVERY_STOPPED:
>> +       /* Serialise discovery.state writes against any concurrent mgmt path
>> +        * holding hdev->lock; this callback runs on req_workqueue without it.
>> +        */
>> +       hci_dev_lock(hdev);
>> +       hci_discovery_set_state(hdev, err ? DISCOVERY_STOPPED :
>>                                 DISCOVERY_FINDING);
>> +       hci_dev_unlock(hdev);
>>  }
>>
>>  static int start_discovery_sync(struct hci_dev *hdev, void *data)
>> @@ -6051,15 +6074,23 @@ static int start_discovery_internal(struct sock *sk, struct hci_dev *hdev,
>>                 goto failed;
>>         }
>>
>> +       /* Publish the transient state BEFORE queueing the work. The
>> +        * completion callback runs on hdev->req_workqueue serialised by
>> +        * hci_req_sync_lock, which is independent of hdev->lock; setting
>> +        * the state after the queue allowed the worker to win the race
>> +        * and have its terminal STOPPED/FINDING write overwritten by this
>> +        * trailing STARTING write, wedging discovery in STARTING.
>> +        */
>> +       hci_discovery_set_state(hdev, DISCOVERY_STARTING);
> 
> I guess I will need to repeat myself, now that the callbacks do
> acquire hdev lock the comments above are invalid, the callback will
> attempt to hdev->lock making it wait the hci_dev_unlock bellow past
> setting DISCOVERY_STARTING, so the change above is no longer needed.
 Hi Luiz,
Thank you for the clarification. You are correct.

With the hci_dev_lock() / hci_dev_unlock() added to the completion callbacks in Part 2, the callbacks are forced to
wait until the caller releases hdev->lock. Since the caller holds hdev->lock across the entire hci_cmd_sync_queue()
call and the trailing hci_discovery_set_state(STARTING / STOPPING), by the time any callback can acquire hci_dev_lock,
the transient state is already published. Part 1 is therefore redundant and has been removed in v4.
Changes in v4:
- Drop the set_state-before-queue reordering (Part 1 in v1–v3)
- Update commit message from "Fix it in three parts" to "two parts" and revise the description to explain the locking

Will send v4.
> 
>>         err = hci_cmd_sync_queue(hdev, start_discovery_sync, cmd,
>>                                  start_discovery_complete);
>>         if (err < 0) {
>> +               hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
>>                 mgmt_pending_remove(cmd);
>>                 goto failed;
>>         }
>>
>> -       hci_discovery_set_state(hdev, DISCOVERY_STARTING);
>> -
>>  failed:
>>         hci_dev_unlock(hdev);
>>         return err;
>> @@ -6178,15 +6209,19 @@ static int start_service_discovery(struct sock *sk, struct hci_dev *hdev,
>>                 }
>>         }
>>
>> +       /* Publish the transient state BEFORE queueing; see the comment in
>> +        * start_discovery_internal() for the race details.
>> +        */
>> +       hci_discovery_set_state(hdev, DISCOVERY_STARTING);
>> +
>>         err = hci_cmd_sync_queue(hdev, start_discovery_sync, cmd,
>>                                  start_discovery_complete);
>>         if (err < 0) {
>> +               hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
>>                 mgmt_pending_remove(cmd);
>>                 goto failed;
>>         }
>>
>> -       hci_discovery_set_state(hdev, DISCOVERY_STARTING);
>> -
>>  failed:
>>         hci_dev_unlock(hdev);
>>         return err;
>> @@ -6196,17 +6231,40 @@ static void stop_discovery_complete(struct hci_dev *hdev, void *data, int err)
>>  {
>>         struct mgmt_pending_cmd *cmd = data;
>>
>> -       if (err == -ECANCELED || !mgmt_pending_valid(hdev, cmd))
>> -               return;
>> -
>>         bt_dev_dbg(hdev, "err %d", err);
>>
>> +       if (err) {
>> +               /* The queued stop-discovery work failed before the normal
>> +                * completion path could advance the state machine. The
>> +                * caller already moved the state to DISCOVERY_STOPPING
>> +                * (under hdev->lock, before queueing). Reset it here so
>> +                * the gate does not wedge in STOPPING.
>> +                */
>> +               hci_dev_lock(hdev);
>> +               if (hdev->discovery.state == DISCOVERY_STOPPING)
>> +                       hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
>> +               hci_dev_unlock(hdev);
>> +
>> +               if (err == -ECANCELED)
>> +                       return;
>> +       }
>> +
>> +       if (!mgmt_pending_valid(hdev, cmd))
>> +               return;
>> +
>>         mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt_status(err),
>>                           cmd->param, 1);
>>         mgmt_pending_free(cmd);
>>
>> -       if (!err)
>> +       if (!err) {
>> +               /* Serialise discovery.state writes against any concurrent
>> +                * mgmt path holding hdev->lock; this callback runs on
>> +                * req_workqueue without it.
>> +                */
>> +               hci_dev_lock(hdev);
>>                 hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
>> +               hci_dev_unlock(hdev);
>> +       }
>>  }
>>
>>  static int stop_discovery_sync(struct hci_dev *hdev, void *data)
>> @@ -6248,15 +6306,19 @@ static int stop_discovery(struct sock *sk, struct hci_dev *hdev, void *data,
>>                 goto unlock;
>>         }
>>
>> +       /* Publish the transient state BEFORE queueing; see the comment in
>> +        * start_discovery_internal() for the race details.
>> +        */
>> +       hci_discovery_set_state(hdev, DISCOVERY_STOPPING);
>> +
>>         err = hci_cmd_sync_queue(hdev, stop_discovery_sync, cmd,
>>                                  stop_discovery_complete);
>>         if (err < 0) {
>> +               hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
>>                 mgmt_pending_remove(cmd);
>>                 goto unlock;
>>         }
>>
>> -       hci_discovery_set_state(hdev, DISCOVERY_STOPPING);
>> -
>>  unlock:
>>         hci_dev_unlock(hdev);
>>         return err;
>> --
>> 2.43.0
>>
> 
> 


