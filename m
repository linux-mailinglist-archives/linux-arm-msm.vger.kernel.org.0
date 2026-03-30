Return-Path: <linux-arm-msm+bounces-100647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oErVCM3byWlm3AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:11:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77792354B58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BF09300C58D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 02:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C7833D50F;
	Mon, 30 Mar 2026 02:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aeVAa28b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XMM1tQDN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7B633CE92
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774836667; cv=none; b=C+/mS+3bKIFXqwFKRmqkMJYeG5MlYZe25ecmxOyWe1M1+U6tBe6nbkd+VOVmAp2qSozop9Hza0Wzl5f6HRwEtMSeXaspqAwHuqvo19eyGztlLIhqvijahAx86nagwoSYwF1UqcO+oovidpi96S1ix2iukc8H6ymhGKtNv/IBjTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774836667; c=relaxed/simple;
	bh=FbloVJ6ZYAwb202X2oY4C5QbMUVhVHukJiZul5rQuEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uETu7kSn2RaHTrgjAiryVTLXlUvTP2Eyo/V6evjQaUfliYGIDyiAuE4bnOC/mcEnS6chneDHSIdFTsz9NfUp+KPLQQ+3J5Tg8E3JE2gjNRiGswbGr4iRVfMFMvJE9+FiNeTmnAAtRFtUEBNfI+IhXJmMKs3ridd855t8JvSpkss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aeVAa28b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XMM1tQDN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhkNM3864401
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gAJ++qiIe/HkmvU48xI1bbnnG+ouTJL7+deDhZkHf8Y=; b=aeVAa28bEpF2QGSe
	cgM+YN5fN6taUqQo3NvOWILmzn6RuH/zk6kDh4oCWSBjbF/HkVgs21VRkyYxCZ7S
	1D+C1Lhw6/GeJBAZbSxaMZmw+Sae6u6Ll0agjoVP7k0k72tD5ezzrbgJAR9Azs0S
	8cSddbPavJGgiaF4sVm2sBiHX/XViuanWvgF2TabGg1tEOu+EiAHzz5IJOmAKoV3
	EnC7IOZBlZ0OJhmIImfGPMAuwg8T8XtXmTUiA2SNFW5LIloWaUfAQty7bNdD60Rb
	m1gJ7JjHi3h41kesjunCvbMx/DPLT1e2+U0/gej+BfyaPCRtu76K3J0692xO2JNG
	2ZljPA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64bm4d39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:11:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d93a8149bso1997277a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 19:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774836664; x=1775441464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAJ++qiIe/HkmvU48xI1bbnnG+ouTJL7+deDhZkHf8Y=;
        b=XMM1tQDNsKc8SfG8SqSRJ2zK/vXXqKwl/33NBYimEBzYKadP/mMqiWon/NplAzfaDA
         Fm4MPzUfHaLUhkTRrrA9UXCqQ8N0m6PNy8iCb7FNqIJ0vdJWW5IR66g3M3ps3kApWLYW
         8oljPjy4+INXBkym28HoLrni163GWeKw79MMh4XwknES7lSWPDhMDtAIgC6XrcVyaO3U
         Eu995XunsKbPfFFKmoKj2468yz/wyg5o0r3irFUrc9wEC4UUPn5NifNaaoZ/S6hn9S0F
         jiy5PhQ5PcpUYGuT1/ng4iW7VTcMlFBUg4/3p1RgqjAN0pkNBi1VEuZs2b8P4DP40Hng
         Cd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774836664; x=1775441464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAJ++qiIe/HkmvU48xI1bbnnG+ouTJL7+deDhZkHf8Y=;
        b=Un9dE+wzie5/Epea8vDoUSZYIzVaWRezHRxTnOA5dRk1Yr21/t0NW9PRGynFHjCjx4
         YlD2o0xfztzYVoGHqTuREH8DBwSAV2UlJWx6dt4anc32QLxCFk+aVbL3OPCJiqzuXcfj
         DBBCSUuTh11oYe9Uei7ro0Uq33UXSlkIm1vW+wHha4icVDS7FZ6CDLNQarrIC7HsJh8Z
         CaDZoYQVa1Q2rWk2I79e4WflRxpJD/A3ccErVbPZb41cfhkZj8aq9UVJbPDiMm07W904
         xAvy2Q2KIIJtpW0xYliobKBTVAUMJdlLsOnlfGgFN8Y7xASOyrDt8fCyM3wMl/2Rwpkr
         w5Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUVZYltZmGKDyX71jFi8H9WGAOZA6D+I5P60D9nbWdztFy7+iQWLUKEHlSnwp24PKphVGAP2VOhZf90Al/H@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ1sfCyspJzf3Ao3VqpBZbXAkqraExcRpmloHRpkCx/FasoSkM
	0+5OzHra5PIay7owFeY6RKH6VNVJSORvUV+m6RDHDgE2xBb26zIzAjq7KitgF6f7V7fzgXyGt5H
	Omr1guav+8yPFoT8caujmfhWSfjkrKEah+mtpbqOKmOn3g5pCgVHQbcrbXn073YR92Un/
X-Gm-Gg: ATEYQzy2lp6k0I1tF4RDoQIXuNgLHQP+jrxeJ2nZk0+3a8G57E9ArUASogohBrHdj3O
	p1gtQ12JgjvkJGRIe6kI38YgqLt/++bdHRnI4Rqu9wfmiVv5q1eU/gipw3lQEvyRILW/ZUAWYK5
	0pkd6+o+dsjroSraFC+urnb55zTXkkRD5FYExnjWpLsXx3vyTR2ZSx1IWBTdNTA/1p/FE1tOdSZ
	wKHZBPi+VTJdpkeLe/cL7+tIBjZ0n8IixgOfA9SpD+UjSWuh8Nh+JhEG2WS1FtyiA8Zd5JKpXVm
	hpdMAZt8zecddNq8bajAws2t6pa4kgA87XY1Cm3SJSvEB9QuZUIieCT/9UKGIR57rFi7uLKlWtJ
	74IGQu3482r6wpRV7CF/oMLuBnkBeJQzv3RXdoUr3EVO9/xERCWKYXsvaj+ojQZE8Ba2D3hjLl7
	Hu
X-Received: by 2002:a17:90b:3d81:b0:35b:952c:43ab with SMTP id 98e67ed59e1d1-35c30bb5f2amr7681726a91.4.1774836663846;
        Sun, 29 Mar 2026 19:11:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3d81:b0:35b:952c:43ab with SMTP id 98e67ed59e1d1-35c30bb5f2amr7681693a91.4.1774836663333;
        Sun, 29 Mar 2026 19:11:03 -0700 (PDT)
Received: from [10.110.2.194] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9509cf33sm5321474a91.13.2026.03.29.19.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 19:11:02 -0700 (PDT)
Message-ID: <e2bcaf8d-6caa-4f32-bf69-776dbd2b2b96@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:10:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] Bluetooth: qca: Fix delayed hw_error handling due to
 missing wakeup during SSR
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Shuai Zhang <quic_shuaz@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20260327083258.1398450-1-shuai.zhang@oss.qualcomm.com>
 <CABBYNZKwxh1R=EcBpqNpsO=pyJ7Z47qgYUQtrpG9QSC6sK3SpA@mail.gmail.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <CABBYNZKwxh1R=EcBpqNpsO=pyJ7Z47qgYUQtrpG9QSC6sK3SpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4L31rDAjzhYBZqUFLWnoPj1HHnMsOaU-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAxNCBTYWx0ZWRfX8ujfr0Cen/PX
 9GvjBpTkS7Jz4FuyhnIQ9wsWRbtt7QqfwgZfkb9CtiZqDjW9i6TCkq+gqRdFRhsE6j9RjzipViy
 yYv8gjjkAhgstE74pDvZK/WCI6ssAwib5F3fsBruSNeggEtlzD1qiX35N/Ut+Pkae62qZWLHSN0
 E4JNonRwrzKQMWx9n0k1IXX19p/7a3pgxTmnaF6b+ZbO70f9AP7NG52x564b9bgOvmC5I/GKSEI
 mfiSnjWBOyg5jbxaKAeBxKlHVLz6gAifqNHvMUJiSI6VO4QbOzaloKkZINCMFvS8sTlm09BdZaY
 kaui7psESG5iUEMmahtmlQtCxLQWPr6eBM1dNdQsDYBgXkhWLAGnX6TbBrAt7O5QgeA/E8lg5mw
 /i0/4r4B4KO4A5P+C0W24PJLv7PrtLOLShBzTAqDS789+Ocyg3OAB1/8eZWhLDRIrNh7hc3Eqhb
 ti868ET+Ca7GLleViZw==
X-Authority-Analysis: v=2.4 cv=eJAeTXp1 c=1 sm=1 tr=0 ts=69c9dbb8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=nMkBCxXBiB_ylkh7ArAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 4L31rDAjzhYBZqUFLWnoPj1HHnMsOaU-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300014
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100647-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:email,linaro.org:email];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77792354B58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luiz

Thanks for the suggestion.

On 3/28/2026 1:51 AM, Luiz Augusto von Dentz wrote:
> Hi Shuai,
>
> On Fri, Mar 27, 2026 at 4:33 AM Shuai Zhang
> <shuai.zhang@oss.qualcomm.com> wrote:
>> From: Shuai Zhang <quic_shuaz@quicinc.com>
>>
>> When Bluetooth controller encounters a coredump, it triggers
>> the Subsystem Restart (SSR) mechanism. The controller first
>> reports the coredump data, and once the data upload is complete,
>> it sends a hw_error event. The host relies on this event to
>> proceed with subsequent recovery actions.
>>
>> If the host has not finished processing the coredump data
>> when the hw_error event is received,
>> it sets a timer to wait until either the data processing is complete
>> or the timeout expires before handling the event.
>>
>> The current implementation lacks a wakeup trigger. As a result,
>> even if the coredump data has already been processed, the host
>> continues to wait until the timer expires, causing unnecessary
>> delays in handling the hw_error event.
>>
>> To fix this issue, adds a `wake_up_bit()` call after the host finishes
>> processing the coredump data. This ensures that the waiting thread is
>> promptly notified and can proceed to handle the hw_error event without
>> waiting for the timeout.
>>
>> Test case:
>> - Trigger controller coredump using the command: `hcitool cmd 0x3f 0c 26`.
>> - Use `btmon` to capture HCI logs.
>> - Observe the time interval between receiving the hw_error event
>> and the execution of the power-off sequence in the HCI log.
>>
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> Link: https://lore.kernel.org/stable/20251107033924.3707495-2-quic_shuaz%40quicinc.com
>> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> ---
>> Changes v4:
>> - add Acked-by signoff
>> - Link to v3
>>    https://lore.kernel.org/all/20251107033924.3707495-1-quic_shuaz@quicinc.com/
>>
>> Changes v3:
>> - add Fixes tag
>> - Link to v2
>>    https://lore.kernel.org/all/20251106140103.1406081-1-quic_shuaz@quicinc.com/
>>
>> Changes v2:
>> - Split timeout conversion into a separate patch.
>> - Clarified commit messages and added test case description.
>> - Link to v1
>>    https://lore.kernel.org/all/20251104112601.2670019-1-quic_shuaz@quicinc.com/
>> ---
>>   drivers/bluetooth/hci_qca.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index c17a462ae..228a754a9 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1108,7 +1108,7 @@ static void qca_controller_memdump(struct work_struct *work)
>>                                  qca->qca_memdump = NULL;
>>                                  qca->memdump_state = QCA_MEMDUMP_COLLECTED;
>>                                  cancel_delayed_work(&qca->ctrl_memdump_timeout);
>> -                               clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>> +                               clear_and_wake_up_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>>                                  clear_bit(QCA_IBS_DISABLED, &qca->flags);
>>                                  mutex_unlock(&qca->hci_memdump_lock);
>>                                  return;
>> @@ -1186,7 +1186,7 @@ static void qca_controller_memdump(struct work_struct *work)
>>                          kfree(qca->qca_memdump);
>>                          qca->qca_memdump = NULL;
>>                          qca->memdump_state = QCA_MEMDUMP_COLLECTED;
>> -                       clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>> +                       clear_and_wake_up_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>>                  }
>>
>>                  mutex_unlock(&qca->hci_memdump_lock);
>> --
>> 2.34.1
> https://sashiko.dev/#/patchset/20260327083258.1398450-1-shuai.zhang%40oss.qualcomm.com
>
> Not saying the feedback is actually valid, but if there are other part
> of the code still using clear_bit(QCA_MEMDUMP_COLLECTION then perhaps
> they should be updated as well?


Only these two locations incorrectly use clear_bit instead of 
clear_and_wake_up_bit.

  All other uses of QCA_MEMDUMP_COLLECTION only involve set_bit and 
test_bit.


Thanks,

Shuai


