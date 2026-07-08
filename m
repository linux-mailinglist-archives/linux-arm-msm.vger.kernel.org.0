Return-Path: <linux-arm-msm+bounces-117502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bp9wGUznTWqT/wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:59:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D141E722095
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:59:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jVyYHudR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CRolegn6;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117502-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117502-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87DB330157E2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4567F3C1094;
	Wed,  8 Jul 2026 05:59:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AF7137923
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:59:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783490373; cv=none; b=pCJnZV5TxQnNMGN2CLhrTEsS+q+353+vlBYwn79mq0HrGpRZeuLP/y/CLzVLwghMNa8uCtw22cDwBT3yfLORG+OCQjKnrdPME9pCwmBBDqIux8wfxFOONf+IrWhaB4nKIkeoF63OUw4hc26c9fW2/pyIO0vZImg/aUIQLbRqgFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783490373; c=relaxed/simple;
	bh=Ln+AWCppdQzjqk2SGTiLTurDNLipGzjEVNh2P21j3tU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OZa3H+1Z3GB73i6C1hbxlxSmBjDYnHop5CFipapcO10QLA4cfPR7IEhEw2geHhr4kgR+u9bYX2viCcCkrvs2mL6DTgB3C0sut8g5ev3hmJcfTvEm18QMDgeXFtKb+jU1G0IEtVMFOD2O3BwqTQhk/SY5o37SmIegDXqWppQcvN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jVyYHudR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CRolegn6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842L1Q1509149
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uqSny8F8Ghd4R0ySyoayfvtgxKEKbyO13k2QK0qpJlM=; b=jVyYHudRqBZxWwbA
	KgFgSLtJtkoZ4ycMl1ULtv5tpJgcrUWlV0Zb/z/ki3WfIxKQDXreP+NjozaM0/UL
	Yytud2R/ZWD6oQMOSHnlo4XIv2SgK65yaTH8PeISi+L831yo9AK1OGnEx6wyzdm9
	GrUgy9pti+gBvLRVKep5bqGQdU01X42rQ8aub7U1PvV1cIeyYQR51cnAmIwZFZnJ
	CexjXFLrR+XhSY8sRoA7S2KMUSnBl+ZfS3P7Fd6mxRCL7f6Plv2OOvVYS/gnr7Gu
	XFzYxNC2UH7pi9qfSthRqaa9eqswRp+A8sNRDVJ1VM6JZsTOV2rNMrdDzF5FuaoT
	oMbUlw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5946w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:59:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8482df30da4so541743b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783490368; x=1784095168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqSny8F8Ghd4R0ySyoayfvtgxKEKbyO13k2QK0qpJlM=;
        b=CRolegn6Xa0n1IUJac3SIEGt2ObUDkuD0zfcpPo1flfdBaoHWhkJe2GZwEXb9Wlpcp
         pT+cy6WyH5zubh8oOa7fRl8BcAPrquecJi4fQJfy/b1QcISAty5sQ57m6cKKWEGr1O+q
         F1LxMjQbPLxIhBs0PsiqUkToLTfgyToTwUCV+MM4TckR9F4sJF1WswS49Z6FSvpEGiJv
         Nw12KykB6rpjo4bR/GDXoE03O8cpiRXZiYfVAMgNLWof57aF43cInVtASF2AOKXNKp8z
         BMhTaXVsrralCkn/txSzs3zo4m0sK2yg1JDbFHQc4p/gbRzZsdXhIZwA2VBLrkHZI2I0
         te8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783490368; x=1784095168;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uqSny8F8Ghd4R0ySyoayfvtgxKEKbyO13k2QK0qpJlM=;
        b=DlFXaiIG+677Hs5AruZtxg2Ee6gNmofMSoasB4s/7yVp2cS9zzX2/vpn1Rfzbd4AQh
         jxeOpchdAXZ+C5fOPyEJ06T1sr4u4sdftWhrqlzjWOjfczgueZu6qBLx+OUVAiewCH+P
         kl8znOYthWwKSQGToEJZaycBbZTitG8+z/hTeztU/A9pvP+kCKbdfWNhCtlYymICTaz/
         uZOrh/MlK8W4phqi1tvjys3br8u5VoSaOJ+RcSS20xWObto0WFpQ01Q+HV/hi3u6tHrv
         2x8PeUAiVjZyG6AEipuACvgBxkXO5L+qyj09uHnwK3B/ycBYI6N+depAQHEgaXMoHEoV
         yq9Q==
X-Forwarded-Encrypted: i=1; AHgh+RoTuJLJI5axZjaF9NUIiJ+g5modblY8MoW4UsRGZ+3Pap2XVqS/wxB8FJj6wwsfvXE/xKjeCv79gi7LZesM@vger.kernel.org
X-Gm-Message-State: AOJu0YzaUqIuMDGe4jyh3u+MnvYqXCh7E8QAFes2EXgdjGcW4mr81t8u
	8Revymegp2faMcesYuu73FgnwqwndmEbpnXWjbn60xIP20DAzkBOan0SmEBomuAorvat2R2Ytv2
	xyC1Cr2khOe5IQvZcn/4K9xsbChjEF1Wfxk4OJ3G41TD5jIIccXkUnSRK0sTg48U869WF
X-Gm-Gg: AfdE7ckqZKl7e0YFT5vDEbkz/dY799Dni27CEbENtia9JzAeN5bJ8hrfEc9hvnffAf4
	f+rEtWZwQyFicBaGD7RSepA1swKLoIjg8QJ0b9Q1u8aWDwqwzT0jJSuqZCSsi8TRB0Mb+3uO1OJ
	P9DhGm4WPjFLpCZjAnC03bq5D7TA8apl5o5rYbGUkgd8I31glT/W1gO/LUYHDZTDuvkPvuSBRim
	9vBp2VuMVjwhKdG7FVuN0RW02aTRAutl1NAm95uh5s783J5B59PmsOyt3IumBJutauw/jGdelz1
	W5bha5+ho1xq0ZQOMyGEGGnqsyKUG7gYolcpIQCH1MJbbSiV2cyKD7KRqNdx8EbZXCCyxw4GB9T
	taDYbqddc0+flfCLHhVvxs7OYaM9yHHuLJZpY7m4B
X-Received: by 2002:a05:6a00:2e08:b0:842:68d3:e29d with SMTP id d2e1a72fcca58-84842fd41cemr1147442b3a.36.1783490368390;
        Tue, 07 Jul 2026 22:59:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e08:b0:842:68d3:e29d with SMTP id d2e1a72fcca58-84842fd41cemr1147406b3a.36.1783490367737;
        Tue, 07 Jul 2026 22:59:27 -0700 (PDT)
Received: from [10.253.37.137] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afeb060bsm1882589a12.14.2026.07.07.22.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 22:59:26 -0700 (PDT)
Message-ID: <6067fddc-d3f3-471f-a82f-025f7ebb2159@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 13:59:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: MGMT: Fix discovery state race against
 cmd_sync worker
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com
References: <20260707093426.372897-1-xiuzhuo.shang@oss.qualcomm.com>
 <CABBYNZ+X-+ZJYz-V-_QSP5kCJpJJaBiyO=wMHD+Ut+b=639t2Q@mail.gmail.com>
 <CABBYNZLXZaY7KiUneNMg7PrsTJjPF99hPY3sq5a2pL0RC9Z4tg@mail.gmail.com>
Content-Language: en-US
From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
In-Reply-To: <CABBYNZLXZaY7KiUneNMg7PrsTJjPF99hPY3sq5a2pL0RC9Z4tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4de741 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=cC5VhTdkmkCdcEF56qsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1NSBTYWx0ZWRfXzVUvJFqw88mT
 cfLzNpW46h4A25UvCw+jo+3Trniu4C5j/+erlh1GPZt8pk7PKgtskL9VYBZZF5Z0SmAkiALXHOa
 W9xcbZFA9jPDSaio/LLSfT0oR49WpcY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1NSBTYWx0ZWRfX7VSRjGkUP7MS
 i1kBIxj7WwQR70LKJHc3lbBaFToSRp7T09fOYZcvruNKL/xgq/7lCWHsrrKWlGo40ZI6vHXTWk3
 sn/t+i2k7KIwABSYNOidWST77vZp9laExHLzsXQwcptHk8A3Q5uB3jHMoOgcvkwbYEVg+5p07T6
 4OKbQRflK137tv2Jkwgw0Bo6Lj/VOyPHY82jE6bB39Nc34SsQOxP3O3tBYD84lDr2j36RAqn1bW
 9NNPaqhjUx+jFVy9jiucQcbDJCiD8O9bVqFVWw0w+50u9AGC42Cxe5VPcYMquCP4KN6/hRslTuj
 n1ymyfKm4lXkw4/x71FHP6LBskONphQYmUZgQCmLey74hbg9kSerAerIUC7YeB1EWy5p04EHMOZ
 hb4aljjazomi/NOGspgWgrmAQohMC6JxVabw4aZCsj99ZADWrE1xz7LmI19qoTbDkJ99EzJJq+8
 0707IhDjXj16tuDJ0PQ==
X-Proofpoint-ORIG-GUID: KgaD87td5c_Le5sU-hYlin2e_Kbtc5wU
X-Proofpoint-GUID: KgaD87td5c_Le5sU-hYlin2e_Kbtc5wU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117502-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:luiz.dentz@gmail.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cheng.jiang@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xiuzhuo.shang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: D141E722095



On 7/7/2026 11:17 PM, Luiz Augusto von Dentz wrote:
> Hi Xiuzhuo,
> 
> On Tue, Jul 7, 2026 at 10:09 AM Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
>>
>> Hi Xiuzhuo,
>>
>> On Tue, Jul 7, 2026 at 5:34 AM Xiuzhuo Shang
>> <xiuzhuo.shang@oss.qualcomm.com> wrote:
>>>
>>> start_discovery_internal(), start_service_discovery() and stop_discovery()
>>> queue a cmd_sync work item and only then move the discovery state machine
>>> into its transient value (DISCOVERY_STARTING / DISCOVERY_STOPPING):
>>>   err = hci_cmd_sync_queue(hdev, ..._sync, cmd, ..._complete);
>>>   if (err < 0) { ... }
>>>   hci_discovery_set_state(hdev, DISCOVERY_STARTING /* or STOPPING */);
>>> The matching completion callbacks run on hdev->req_workqueue serialised
>>> by hci_req_sync_lock, which is independent of hdev->lock. So once the
>>> work has been queued, the worker can be scheduled, run the sync function
>>> and invoke the completion before the caller has executed the trailing
>>> hci_discovery_set_state(). The completion's success path writes the
>>> terminal state (DISCOVERY_STOPPED for stop, DISCOVERY_FINDING for start);
>>> the caller then overwrites it with the transient value, and the state
>>> machine is wedged: every subsequent Start (Service) Discovery is
>>> rejected by the DISCOVERY_STOPPED gate with MGMT_STATUS_BUSY (0x0a),
>>> with no HCI traffic generated, until bluetoothd or the adapter is
>>> restarted.
>>> Fix it in three parts:
>>>   1. In all three call sites move hci_discovery_set_state(STARTING /
>>>      STOPPING) to before hci_cmd_sync_queue(). The transient state is
>>>      therefore always published before any worker can run the
>>>      completion. On queue-submit failure, roll back to
>>>      DISCOVERY_STOPPED.
>>>   2. In start_discovery_complete() and stop_discovery_complete(), wrap
>>>      the terminal hci_discovery_set_state() call with
>>>      hci_dev_lock() / hci_dev_unlock(). These callbacks run without
>>>      hdev->lock; serialising the state write matches the pattern used
>>>      by mgmt_set_powered_complete() and removes any residual ordering
>>>      hazard against a concurrent mgmt path holding hdev->lock.
>>>   3. Generalise the "ignore -ECANCELED" early return in both completion
>>>      callbacks to "on any err < 0, also reset the transient state to
>>>      STOPPED". With (1) in place the state observed at completion time
>>>      is always known.
>>>      For the stop path this also fixes a pre-existing wedge: when any
>>>      sub-command issued from hci_stop_discovery_sync() returns an
>>>      error, stop_discovery_complete() is invoked with err < 0. The
>>>      existing "if (!err) set_state(STOPPED)" tail then skips the reset
>>>      and the state machine sits in DISCOVERY_STOPPING forever.
>>
>> Needs the Fixes tag since we might want to backport.
Acknowledged. The bug was introduced by:                                    
                                                                              
  Fixes: abfeea476c68 ("Bluetooth: hci_sync: Convert MGMT_OP_START_DISCOVERY")
                                                                              
  Will add in v2.
>>
>>> Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
>>> ---
>>>  net/bluetooth/mgmt.c | 86 +++++++++++++++++++++++++++++++++++++-------
>>>  1 file changed, 74 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
>>> index 733a4b70e10c..25ad9c10740d 100644
>>> --- a/net/bluetooth/mgmt.c
>>> +++ b/net/bluetooth/mgmt.c
>>> @@ -5975,15 +5975,38 @@ static void start_discovery_complete(struct hci_dev *hdev, void *data, int err)
>>>
>>>         bt_dev_dbg(hdev, "err %d", err);
>>>
>>> -       if (err == -ECANCELED || !mgmt_pending_valid(hdev, cmd))
>>> +       if (err < 0) {
> 
> Sashiko flags the above check as an issue because it tests only for
> negative errors, not HCI (positive) errors:
> 
> https://sashiko.dev/#/patchset/20260707093426.372897-1-xiuzhuo.shang%40oss.qualcomm.com

  The check should be if (err) rather than if (err < 0). The existing tail already uses:                    
                                                                                                            
  hci_discovery_set_state(hdev, err ? DISCOVERY_STOPPED : DISCOVERY_FINDING);                               
                                                                                                            
  which catches both negative errno values and positive HCI status codes. The if (err < 0) guard in the new 
  block is inconsistent and would miss positive HCI errors, leaving the state wedged in STARTING. Will fix  
  in v2. 
> 
>>> +               /* The queued start-discovery work failed before the normal
>>> +                * completion path could advance the state machine. The
>>> +                * caller already moved the state to DISCOVERY_STARTING
>>> +                * (under hdev->lock, before queueing). Reset it here so the
>>> +                * gate in start_discovery_internal()/start_service_discovery()
>>> +                * does not wedge in STARTING and reject every future Start
>>> +                * (Service) Discovery with MGMT_STATUS_BUSY.
>>> +                */
>>> +               hci_dev_lock(hdev);
>>> +               if (hdev->discovery.state == DISCOVERY_STARTING)
>>> +                       hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
>>> +               hci_dev_unlock(hdev);
>>> +
>>> +               if (err == -ECANCELED)
>>> +                       return;
>>> +       }
>>> +
>>> +       if (!mgmt_pending_valid(hdev, cmd))
>>>                 return;
>>>
>>>         mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt_status(err),
>>>                           cmd->param, 1);
>>>         mgmt_pending_free(cmd);
>>>
>>> -       hci_discovery_set_state(hdev, err ? DISCOVERY_STOPPED:
>>> +       /* Serialise discovery.state writes against any concurrent mgmt path
>>> +        * holding hdev->lock; this callback runs on req_workqueue without it.
>>> +        */
>>> +       hci_dev_lock(hdev);
>>> +       hci_discovery_set_state(hdev, err ? DISCOVERY_STOPPED :
>>>                                 DISCOVERY_FINDING);
>>> +       hci_dev_unlock(hdev);
>>>  }
>>>
>>>  static int start_discovery_sync(struct hci_dev *hdev, void *data)
>>> @@ -6051,15 +6074,23 @@ static int start_discovery_internal(struct sock *sk, struct hci_dev *hdev,
>>>                 goto failed;
>>>         }
>>>
>>> +       /* Publish the transient state BEFORE queueing the work. The
>>> +        * completion callback runs on hdev->req_workqueue serialised by
>>> +        * hci_req_sync_lock, which is independent of hdev->lock; setting
>>> +        * the state after the queue allowed the worker to win the race
>>> +        * and have its terminal STOPPED/FINDING write overwritten by this
>>> +        * trailing STARTING write, wedging discovery in STARTING.
>>> +        */
>>> +       hci_discovery_set_state(hdev, DISCOVERY_STARTING);
>>
>> Hmm, do we really need to do this if hdev lock is taken at
>> start_discovery_sync? Because that should then synchronize the
>> callback won't be able to change the state before it is set to
>> DISCOVERY_STARTING.
  Yes, the move is necessary. The old discov_update worker was safe for a     
  different reason: it never wrote the transient states (STARTING/STOPPING) — 
  those were always written by the caller before queue_work(), and the caller 
  wrote nothing after. The worker only wrote the terminal states              
  (FINDING/STOPPED) after completing the HCI work. There was no conflict      
  because only one side wrote each state.                                     
                                                                              
  With hci_cmd_sync_queue(), the completion callback now writes the terminal  
  state, but the caller still writes STARTING/STOPPING after the queue call.  
  Two threads write discovery.state in an uncoordinated way.                  
                                                                              
  The reason hdev->lock does not prevent the race is that the completion
  callback runs under hci_req_sync_lock, not hdev->lock. Looking at
  hci_cmd_sync_work() in hci_sync.c:    
 
  hci_req_sync_lock(hdev);
  err = entry->func(hdev, entry->data);       /* start_discovery_sync */
  if (entry->destroy)                   
      entry->destroy(hdev, entry->data, err); /* start_discovery_complete */
  hci_req_sync_unlock(hdev);

  hci_dev_lock is mutex_lock(&hdev->lock) and hci_req_sync_lock is
  mutex_lock(&hdev->req_sync_lock) — two independent mutexes. The caller holds
   hdev->lock when it calls hci_cmd_sync_queue(), but the worker only needs
  hci_req_sync_lock to run, so it can proceed and complete concurrently:

  Caller (holds hdev->lock)            Worker (holds hci_req_sync_lock)

  hci_cmd_sync_queue() ──────────────► enqueued, returns immediately
    [still holds hdev->lock]           start_discovery_sync()
                                       start_discovery_complete()
                                         set_state(FINDING)  ← ① written first
                                       hci_req_sync_unlock()

  set_state(STARTING)  ← ② overwrites FINDING → WEDGE
  hci_dev_unlock()

  We have a debug-instrumented kernel log from a QCS8300 device that captures
  the race directly:  
                  
  [T8668] stop-discovery complete: err=0  state=2  <- FINDING; caller has not
  yet written STOPPING                  
  [T8668] set_state(STOPPED)                       <- worker writes terminal
  state                                 
  [T2216] set_state(STOPPING)                      <- caller overwrites
  STOPPED                               
  [T2216] REJECT BUSY: state=4                     <- every subsequent
  StartDiscovery refused                

  state=2 (FINDING) at the completion callback entry proves the caller had not
   yet executed the trailing set_state(STOPPING). Moving set_state to before
  hci_cmd_sync_queue() — while hdev->lock is still held — ensures the
  transient state is always visible before the worker can call the completion.

  Will send v2 with the above corrections.

>>
>>>         err = hci_cmd_sync_queue(hdev, start_discovery_sync, cmd,
>>>                                  start_discovery_complete);
>>>         if (err < 0) {
>>> +               hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
>>>                 mgmt_pending_remove(cmd);
>>>                 goto failed;
>>>         }
>>>
>>> -       hci_discovery_set_state(hdev, DISCOVERY_STARTING);
>>> -
>>>  failed:
>>>         hci_dev_unlock(hdev);
>>>         return err;
>>> @@ -6178,15 +6209,19 @@ static int start_service_discovery(struct sock *sk, struct hci_dev *hdev,
>>>                 }
>>>         }
>>>
>>> +       /* Publish the transient state BEFORE queueing; see the comment in
>>> +        * start_discovery_internal() for the race details.
>>> +        */
>>> +       hci_discovery_set_state(hdev, DISCOVERY_STARTING);
>>
>> Ditto.
>>
>>>         err = hci_cmd_sync_queue(hdev, start_discovery_sync, cmd,
>>>                                  start_discovery_complete);
>>>         if (err < 0) {
>>> +               hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
>>>                 mgmt_pending_remove(cmd);
>>>                 goto failed;
>>>         }
>>>
>>> -       hci_discovery_set_state(hdev, DISCOVERY_STARTING);
>>> -
>>>  failed:
>>>         hci_dev_unlock(hdev);
>>>         return err;
>>> @@ -6196,17 +6231,40 @@ static void stop_discovery_complete(struct hci_dev *hdev, void *data, int err)
>>>  {
>>>         struct mgmt_pending_cmd *cmd = data;
>>>
>>> -       if (err == -ECANCELED || !mgmt_pending_valid(hdev, cmd))
>>> -               return;
>>> -
>>>         bt_dev_dbg(hdev, "err %d", err);
>>>
>>> +       if (err < 0) {
>>> +               /* The queued stop-discovery work failed before the normal
>>> +                * completion path could advance the state machine. The
>>> +                * caller already moved the state to DISCOVERY_STOPPING
>>> +                * (under hdev->lock, before queueing). Reset it here so
>>> +                * the gate does not wedge in STOPPING.
>>> +                */
>>> +               hci_dev_lock(hdev);
>>> +               if (hdev->discovery.state == DISCOVERY_STOPPING)
>>> +                       hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
>>> +               hci_dev_unlock(hdev);
>>> +
>>> +               if (err == -ECANCELED)
>>> +                       return;
>>> +       }
>>> +
>>> +       if (!mgmt_pending_valid(hdev, cmd))
>>> +               return;
>>> +
>>>         mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt_status(err),
>>>                           cmd->param, 1);
>>>         mgmt_pending_free(cmd);
>>>
>>> -       if (!err)
>>> +       if (!err) {
>>> +               /* Serialise discovery.state writes against any concurrent
>>> +                * mgmt path holding hdev->lock; this callback runs on
>>> +                * req_workqueue without it.
>>> +                */
>>> +               hci_dev_lock(hdev);
>>>                 hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
>>> +               hci_dev_unlock(hdev);
>>> +       }
>>>  }
>>>
>>>  static int stop_discovery_sync(struct hci_dev *hdev, void *data)
>>> @@ -6248,15 +6306,19 @@ static int stop_discovery(struct sock *sk, struct hci_dev *hdev, void *data,
>>>                 goto unlock;
>>>         }
>>>
>>> +       /* Publish the transient state BEFORE queueing; see the comment in
>>> +        * start_discovery_internal() for the race details.
>>> +        */
>>> +       hci_discovery_set_state(hdev, DISCOVERY_STOPPING);
>>
>> Ditto.
>>
>>>         err = hci_cmd_sync_queue(hdev, stop_discovery_sync, cmd,
>>>                                  stop_discovery_complete);
>>>         if (err < 0) {
>>> +               hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
>>>                 mgmt_pending_remove(cmd);
>>>                 goto unlock;
>>>         }
>>>
>>> -       hci_discovery_set_state(hdev, DISCOVERY_STOPPING);
>>> -
>>>  unlock:
>>>         hci_dev_unlock(hdev);
>>>         return err;
>>> --
>>> 2.43.0
>>>
>>
>>
>> --
>> Luiz Augusto von Dentz
> 
> 
> 


