Return-Path: <linux-arm-msm+bounces-116051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N0PrCMx4RmqsWgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 16:42:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3C26F8F9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 16:42:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aLDyEODg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kK5It9yM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116051-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116051-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93FAF30B4008
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 14:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A66372052;
	Thu,  2 Jul 2026 14:37:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9854A1387
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 14:37:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003046; cv=none; b=BTNZm+q05U9vkVMf0EeB6o/EvtHn9Tysri0mUyI802gJVvRj5mJNIaLH62jfWqaMeQSs+veVnFef+gLpXhBlXmx/ZhSQIj4W0cUn/L8eDPVolfsaveD4Ve0EdZERANje0pQDA6mzzxZ0hBNlsmDSW4Gtb2ymZUU7aZRVWMtr5hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003046; c=relaxed/simple;
	bh=4XBzZoo+h4kmWuzy4werglNgVdZotIo17q+T00nScV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A7v32WgIzs0dPQYEkkftg2YZ+FKibFRQ3sRivAiwx+YqMSx6Lp8ZZZU6BlH1PIJf/2WJuxWhRruO2QwpoTXAJmnh4IP4YeGoiMSzB+lljkrd5bwoYwRXlSUlDMiE9tZGfOdX/sZqxrB7k+VtVLnaETxMyYjmGQu3wDzp2YiJymg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLDyEODg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kK5It9yM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3BQX661676
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 14:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wP8xgeRMrZjwY+GUgtUjwAJL9TITkBUKSSIOh8p2URI=; b=aLDyEODg9lmuyxeR
	95JclMHUoHPWAA07RSFj7CrZpz9XisBgNI5ooc2ZTSD8B0zacGJjqYnee5C8GV/8
	hcFDgum2qxl4OHSB1i6JohXLlt5Cfpq9df1wqo+U1rOlygfLfh0T59O3nvhKRirq
	M1f52hOzY/roEPnpnq7zeuCLDolju0nZBkfDmJ+TMrRPVT2vGw0N8DPUQGavGHjk
	nmrPBUczlRNtqBZRjq8gL1p45Ayv9mw78LWuB5VH3SIWvmQcApWO5lRore7eVo78
	/lBogVmDVCUWMfd68Oaup5ygBFMowf0axEkXap6V0r3yABNKUGMxpGzdVvfsEyyP
	1D1wrQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc0pdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 14:37:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380fe2a3fc7so385163a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 07:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783003043; x=1783607843; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wP8xgeRMrZjwY+GUgtUjwAJL9TITkBUKSSIOh8p2URI=;
        b=kK5It9yMAzRN2t0zEExikRFgnd4LVWZMv7cwK9lbardXTxSolNgr2L37S1anb2bpyK
         o71CS9VJjvd+UAeV/5RLF5dM7rebMpLXDRUVFFM5SL8j5lbT7LbBmrfprd2TsskFmnHx
         9Oa/h02DUZ0mr6rRk4uBErsJB2VQb4bxoIgGO9XWw+2rGGadWJwUIKGxwyAmcr5GO/Vy
         lWcLloW4HB0vrWEZnGZycAJUJl+wOXtKWJqgcSh3YZSCr5YdcDNUHkTkphcBDBGvPwxo
         MxRyX8t/IK3tzdD39ZIWb46hItbdko1jMyXIwhV9awwDB3wn4+l4tS6LuL5aAcbME99n
         qivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783003043; x=1783607843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wP8xgeRMrZjwY+GUgtUjwAJL9TITkBUKSSIOh8p2URI=;
        b=LWW/dkRaNEq2K5SFgtD+MNEDfff6IkvS2Ezmu1WYOq2FkTHsJSj6OWjMBoKc5xiyJo
         EGcViDId618uBMYfroTouh4D5SgIZgVmF0AlrpArMEeQadLmfEcynEHEJ6UrrB+EJYc9
         NiC/I+qZdPJq1R8GUqhILmCq/BWZRvGNldFmw+SWwn/y+CmjhID33ZSns64pY/uuwS60
         RxLR6dFYr2LO4GdcNQZlhgrJrlhY8ts0KQJLk1pY5uwu8wR8OjhyP++L9MnUNXzga3Hu
         BGQ4/uQv/fKbrwuPkXc56uSbkRt13MTCDIyynRc6ZlgZJVTSdVbNfrhE+BUitgRTv+yk
         ywKg==
X-Forwarded-Encrypted: i=1; AHgh+Rrl8mykEJ6wYYyuclcW6ZJNMa3K1NxEFrz0Ia0ci+ab9t7eHyR77vh8diwtlYJsiQSLHtu4V42IgOxGeUTH@vger.kernel.org
X-Gm-Message-State: AOJu0YzwZbPAdSg4hzcdGPD++sK9s4rM59Zl9rui3ME6fRPLVYqy4GjS
	rqZ9lkOcrod9wtrCCZUuSCrcA0u7a5UdhRastXaijIfW6SOVMl3MrMS80vE6d+Jule+O1l7Ntk0
	44V7xjVGjRVCks6i0HoUpxViJ8OkFt2mgpIwmPXLyMUHRQsaBHD1h8lKD8gcjbss5EYj3
X-Gm-Gg: AfdE7clzC2Onz9GIRnIoxVeLoLYn4c1sqcInqtq7LhHPLinxB5Kelpqy9/S8VxiQLoV
	oBS44yWkQG61Fd6MvUSV8ED2wJ30HG1roFTP6FMxS0EyREPmyGjcb/vPgj2XmYjy9HwBqazPImD
	+LK0dre4IHhHYos/xXXHWpbmyi3b3x7QOAQU5/0URb4HmVotpBqhO6cVwzMvhxByUN487V502fh
	f8LFwYpZZYa9QY6a7hiaHwFuurdyEdji0Etr7STw9Y1A1XWzyGLU3cIQi4wFjTFbLFzq8LAqUWB
	cJ+jjFtHI1G3PJCoB0QBNG69OZPMltEw/8LlM83Sd3dDJI8beh9prB1c/StGAAtX/g1cFyxV9Us
	J9Qt8wshadkiVnX9ZKkpGgh5M2m8qTJ6ghJaxgNjGyBE=
X-Received: by 2002:a17:90b:1dcf:b0:37f:e326:6559 with SMTP id 98e67ed59e1d1-380aa1c7ac5mr7876878a91.22.1783003042556;
        Thu, 02 Jul 2026 07:37:22 -0700 (PDT)
X-Received: by 2002:a17:90b:1dcf:b0:37f:e326:6559 with SMTP id 98e67ed59e1d1-380aa1c7ac5mr7876812a91.22.1783003041894;
        Thu, 02 Jul 2026 07:37:21 -0700 (PDT)
Received: from [192.168.0.4] ([49.204.110.217])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b4c5577sm11801265eec.0.2026.07.02.07.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 07:37:20 -0700 (PDT)
Message-ID: <4e41d5f9-1b6f-4037-bb4b-9a5cf3fe0821@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 20:07:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] PM: runtime: Clear runtime_error on supplier after
 failed get_sync
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan
 <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson
 <dianders@chromium.org>, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev
References: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
 <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-1-6ddc317011c0@oss.qualcomm.com>
 <CAJZ5v0g6iRNUAKtDNKWa-_pshmnSCdStenNBJ91Xt=PSrhx=aQ@mail.gmail.com>
 <04b67f29-2afe-4c72-8c9b-bbde56f27a83@oss.qualcomm.com>
 <CAJZ5v0hc5yYphPjtF8kNBTPaTaVDxq4Fdb=DRuQ953EAo-CMqQ@mail.gmail.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0hc5yYphPjtF8kNBTPaTaVDxq4Fdb=DRuQ953EAo-CMqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VTRpVErKh7KjAEp-BYgPI5VHimcUvrJJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE1MiBTYWx0ZWRfX+nfgvYl2PBlC
 NRJ4avDdJz0JHj+LlMMoBQOR6oP895keeTDaEd7JNCi4hyl5EcIXa0yjhlgv8QRAjcJHwPg18h7
 ct3Nr5DQjHF4Du4iDg6o7QFTGfvNMsT0NY/E3qMovPcQWGxVmmQ4jVBXJhzNMVeMk0F7NtRpWw+
 NGqx54x9WOy59cld/R3N9R3sEZW8YKPm1CcwcAeVBBvB5Op2p7u5tfoAnbla7D/+0Um6njxRjne
 cCP6shLHrio4YeOuhuDOfYITY+DbcXhH+pt4IGxhOYqV4NhIQGli29d7+kc9NANdRsqGvWgRBi5
 F5uHTAcfkNQ2PBET5p/V2Owzojpy8M5yRoPGD7v5JWeC/3QHQ0twLnKbqCH+D03BOZhU+udIZtl
 W7bYJz7Ryk6NHSH0k8HrSKf/li31A+0QJdG4gLe1YyrSS2rtCLAeG3sOGnjcdYVjDdj7rS3X+tv
 wlSBmdCtFzszhQJzyNg==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a4677a3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Hw27I4OjMF0sY04QisIZkw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OjDW0bff2K29XYBzBmMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: VTRpVErKh7KjAEp-BYgPI5VHimcUvrJJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE1MiBTYWx0ZWRfX+07RZPXTqX1t
 mjntwBqoU0/d8aI9wT1lx8074ztlmCLSugdpw/TK36d8NBSJ9IRnHZ1+dexQ/b86PTUhhcR7HFm
 UTRHFX/r31U0TYeaiWM/RXgfnTfVDOo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020152
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116051-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F3C26F8F9F

Hi Rafael,

Thank you for review.

On 02-07-2026 18:29, Rafael J. Wysocki (Intel) wrote:
> On Thu, Jul 2, 2026 at 1:53 PM Praveen Talari
> <praveen.talari@oss.qualcomm.com> wrote:
>> Hi Rafael,
>>
>> Thank you for review.
>>
>> On 02-07-2026 17:07, Rafael J. Wysocki (Intel) wrote:
>>> On Thu, Jul 2, 2026 at 8:08 AM Praveen Talari
>>> <praveen.talari@oss.qualcomm.com> wrote:
>>>> When pm_runtime_get_sync() fails for a supplier device in
>>>> rpm_get_suppliers(), the supplier's power.runtime_error field is left
>>>> set. This causes any subsequent rpm_resume() call on that supplier to
>>>> immediately return -EINVAL at the top of the function without
>>>> attempting an actual resume, making the failure permanent until
>>>> runtime PM is explicitly re-enabled.
>>>>
>>>> Fix this by calling pm_runtime_set_suspended() on the supplier after
>>>> pm_runtime_put_noidle() in the error path. This clears runtime_error
>>>> and resets the runtime PM status to RPM_SUSPENDED, allowing the next
>>>> consumer resume attempt to retry the supplier resume normally.
>>>>
>>>> Change-Id: Id5067d09caca464f663fc95fe745d037e9c56664
>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>> ---
>>>>    drivers/base/power/runtime.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
>>>> index 335288e8b5b3..9811d024d140 100644
>>>> --- a/drivers/base/power/runtime.c
>>>> +++ b/drivers/base/power/runtime.c
>>>> @@ -309,6 +309,7 @@ static int rpm_get_suppliers(struct device *dev)
>>>>                   /* Ignore suppliers with disabled runtime PM. */
>>>>                   if (retval < 0 && retval != -EACCES) {
>>>>                           pm_runtime_put_noidle(link->supplier);
>>>> +                       pm_runtime_set_suspended(link->supplier);
>>>>                           return retval;
>>>>                   }
>>>>                   refcount_inc(&link->rpm_active);
>>>>
>>>> --
>>> I don't think that this is the way to go here.
>>>
>>> Can you please say some more about the specific scenario in which this
>>> happens and explain why it is OK to effectively discard runtime PM
>>> errors occurring when suppliers are handled?
>> This was observed with a consumer device whose supplier's
>> ->runtime_resume callback returns an error (e.g., a transient failure
>> such as a timeout or resource unavailability).
> In runtime PM, errors returned by the suspend and resume callbacks,
> except for -EAGAIN and -EBUSY are not regarded as transient, which is
> why they stick.
>
> If the driver or bus type wants to signal a transient error, it should
> return one of the above error codes.
>
> That said, I can see that this is problematic on the resume side where
> it may be desirable to repeat resume attempts in the hope that one of
> them will succeed.
>
> I would then consider changing the runtime PM core code so that
> power.runtime_error is only set on failing attempts to suspend, but it
> will not be set on failing attempts to resume.
Yes, that's correct.
I hope the changes below address actual issue. Please let me know if you 
have any further comments or suggestions.


diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 9811d024d140..88450438dc88 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -470,7 +470,13 @@ static int rpm_callback(int (*cb)(struct device *), 
struct device *dev)
         if (retval == -EACCES)
                 retval = -EAGAIN;

-       if (retval != -EAGAIN && retval != -EBUSY)
+       /*
+        * Only stick the error on suspend failures.  Resume failures 
are not
+        * treated as permanent so that the next resume attempt will run the
+        * callback again rather than short-circuiting on runtime_error.
+        */
+       if (retval != -EAGAIN && retval != -EBUSY &&
+           dev->power.runtime_status == RPM_SUSPENDING)
                 dev->power.runtime_error = retval;

         return retval;


Thanks,

Praveen Talari


>
>> When that happens,
>> rpm_resume() sets power.runtime_error on the supplier and returns an
>> error. pm_runtime_get_sync() propagates that error up to
>> rpm_get_suppliers(), which then calls pm_runtime_put_noidle() and
>> returns, aborting the consumer's resume.
> Right.
>
>> The problem is that power.runtime_error remains set on the supplier. On
>> the next attempt to resume the consumer, rpm_get_suppliers() calls
>> pm_runtime_get_sync() on the supplier again, but rpm_resume() now
>> returns -EINVAL immediately at the top-of-function runtime_error check —
>> without even attempting the resume callback. The supplier is stuck
>> permanently in the error state until someone explicitly calls
>> pm_runtime_reinit() or re-enables runtime PM on it.
>>
>> when rpm_get_suppliers() fails and we're already propagating the error
>> to the consumer's resume path, we should not leave the supplier in a
>> state that prevents all future retry attempts.
>>
>> Would you suggest a different approach here? I want to understand what
>> the preferred recovery path should be when a supplier's resume fails
>> inside rpm_get_suppliers().
> Well, this isn't really different to any other cases when runtime
> resume fails.  If it fails for a given device, it will also fail for
> all devices depending on it.
>
> But fair enough, please see above.

