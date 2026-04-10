Return-Path: <linux-arm-msm+bounces-102666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFPwAGnL2GktiQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:05:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5478D3D564B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 088373071022
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B000377EC6;
	Fri, 10 Apr 2026 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mzXpGK1T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZRb2kI7y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF693783CC
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775814969; cv=none; b=BRbTt8/YS+oKs8e2zd2Ioty5feGOlLnGDTR5BhLXbUvD+FqzJC7MSkCXGm+LYCCc3J4FCg4peENJ9WNdslm0z+xO6BE3tTrV4KXX8e8Qy2VIv46Lzn8GbVUA8mZ5r3YE7KHq+nCVFidIFEWCh+sZoiEVCMZg2yh4H1A/jNy+PY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775814969; c=relaxed/simple;
	bh=kecB0tUeYMe0UIVftwBRbSgxiekhLG6a/RcXZdFG73w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pe7EbfrXbs4j3MCoczt8/TnCPoQkkLwIUJFXJ57wvXLF7ZJ7/W+hJ/voGDMDqoyPzihrk65wl28WX4rSK3mtopwwiQ2d2Q5VW1AaVhkgQZ5ysFC7Vw1Jg2g/nqSomyNpXYpx9UPTCJw6dMyxipiZRUIzojXT3+UiV0wFhT3JhZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mzXpGK1T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZRb2kI7y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A3qP503352647
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WPvge4uWTP2wAKPGSlERwY7rGowwQNeKVWqNbDd1tGo=; b=mzXpGK1Tcpa7E28n
	MQj2T4T50ZUYAUweYctPpSRCcAL9T3ZamBoBrTmRICUGTR1SszZAUlb5SMkdMr7O
	5dXyy7rYJvaQLEBWbg8kZ7Yvovp8T9h1nrzOe+5hvvZxlO6oHLkEarTCpABPeTxM
	qDMYt0MPQFcpfq1jFGk+XUYUuxATadEc576kPGa47opdjHJnHoStUXLM2Dtxdl+D
	W33PCkNolTnUcApyXW1ZSe3GfLNtA+D8r4gsQrm++LJYGZjVb/GfWC5+IsJxlVES
	MItMZLRnLdfHMlCt33wjUuwbMGj2myN7DXbdAdOpxG67kbf83VVaInpcJyqTc4Du
	RUtpsA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1quxex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:56:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2523e0299so45066345ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775814965; x=1776419765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WPvge4uWTP2wAKPGSlERwY7rGowwQNeKVWqNbDd1tGo=;
        b=ZRb2kI7y9KudOC8rNZe+/DX95bQiPSJLk1henXRl8FdB1RmuumEET3brPprUTj7QiE
         j8VqXCsH5fck5vrHnlIu4FvCS2CD/d9D3ADkM8bC6/xen4PF0sPs9aof/drCjtcqpIp5
         qeqlhMSjptbX35OWyiijn4+7upIFzhTxZ5Bxe/z++tlselb+cK5mBgcDd1RzscEpG+2x
         aRW/tGUDSDuKdCyab9+OprmForp/ztmJfJ7kYtLvwJdw7CvrrWGj1ZadEg7kDR0/vi4U
         1ZTZZafL+GpvFoeBZXVtlTN4sRo05ltGAXcdfVdMPP/I393aMJ6MxhhHVO9/HgP3ppa3
         tzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775814965; x=1776419765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPvge4uWTP2wAKPGSlERwY7rGowwQNeKVWqNbDd1tGo=;
        b=pdilmxCdtWq2Fg7YY/IY0feoZaFW+E4uOl7bjgIqwbCWTNtHLYiN6K1+jXgMcNCcEx
         tEKQtt0wXTHqtdmxVIT1AnzFu7K6BjWoNEPBnrxMaKTcF1leX17yS5Tv9FjS0TW1MsCP
         yHdRTSj2xflyKcxTe5ddoml9voR7Wx7r9kbMcI4eVzkjBpPjMdrzxdIQNAJiumxOndb2
         U3I/YAJnmCpj4XGlRe9cGIFZs0/5Nwa+F/a8gzdsXSXm/DHJAUgHSSl2073+Vw6B5xKd
         NkJphwzF2YFYuHQcZDunxjU9MZ5eN3NbNaE575Htc/VB0rXeWCR6Z0xOvvU6iGmmzzb4
         IACw==
X-Forwarded-Encrypted: i=1; AJvYcCVQltLBRKhKYmE/8vlmyPxFZHm6w4yCp7mGKov5Yssg7cyU8EVMRZ1kj9ZekYl6pk6xTF5wf0luNyIGl3lA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx24k4fCkLBy2Es9swrMDkVrbpjgNExm/RrtYE0obJapdvN4XM+
	i2CV/ZfxSBHF+tPSJijXoDWczoQBYEPcGKIRd8ZV3yGZmdhieGfdrCs+NmXZzDeSDzlNRa6e65f
	IBC7QWcVbD3FxK+F2aAoRQR+fHPxH6XDUc8wYz5R6JP9tPLH4LNj5DyruMWcoVpKx4ZYn
X-Gm-Gg: AeBDies2rbmcAfe+oxmlXzcLGfYaQocN4b3P3Uf4BD71KjhXOGTDMARnyL4ZQwRtCXk
	ICDaeRMQdsSZZJrCTepvcCTnjIJXeaFeBTgwZiQ0it8WoJyZvjNeFA3I6i4B3fhlYtfDiAg2SGI
	woaJwfdDSTL7bYpQOErLzNrSjsICzTajwtUepWeegyr86SbdLMqXN9ErW4BcBY0n68LbP10xi0z
	/5opszlYwoq7TOD3TVtha99geHwrqu3csBQVESuia/Y7zbT/th+jlvVyfDg9Wz5qFtWteuymhWA
	h99k7xOWZikE+vTQkeJT5ds6V8VUERZMCvxvcgjASuYxv1drPNrSAolhC3PdJqDaflB8jqMka7T
	cyXHDVup5HiiUf78OBkBMp5488Ujp19HW4e6RdjUfsP92L8U=
X-Received: by 2002:a17:902:d50a:b0:2ae:c358:bb7c with SMTP id d9443c01a7336-2b2d5a4a515mr27985435ad.35.1775814964879;
        Fri, 10 Apr 2026 02:56:04 -0700 (PDT)
X-Received: by 2002:a17:902:d50a:b0:2ae:c358:bb7c with SMTP id d9443c01a7336-2b2d5a4a515mr27985135ad.35.1775814964368;
        Fri, 10 Apr 2026 02:56:04 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4ddb462sm23812085ad.24.2026.04.10.02.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 02:56:03 -0700 (PDT)
Message-ID: <f29c2a2a-5b02-46c1-bd6c-fa337faf8370@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:55:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] Bluetooth: qca: Fix delayed hw_error handling due to
 missing wakeup during SSR
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260410085202.4128000-1-shuai.zhang@oss.qualcomm.com>
 <489d33f4-16a1-430c-9ec6-7f13a8f2f995@molgen.mpg.de>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <489d33f4-16a1-430c-9ec6-7f13a8f2f995@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA5MiBTYWx0ZWRfXyIrEtI/ft1p9
 laEGK+a5DhI0CQCsy4UzGZ53Ur5VZEIDbW9H5AtSWxcu01muB469NWDfga78tE3i1PB1M2LyofD
 NNFv+TJ5emByUlO40jr4zaMR/othjugLUPkaDCTCx3FOQ4jRN8VfOFXHomHzeQRyiUxeVHL/ROk
 MqbnDqDz4PXh/0ppeO2thezbOcldPxXDpHt8vBqa5WI3b5SaTpngAAPR8QpFIS1rXTC5IWJmnCw
 Dzh9NAbcqgW5VgWdR6qi+9RCiGYgU0S2NgTFZi6j+ycHBvOgn8BhOAeN7xUh0x9QPDSatKQkNL3
 ueh21JJXz9fBhdKOC7ws6/2cFDh0m/CBmiHOKyQ3D9gYeLzaiLMQVYW3KotUtgPZstFjHW1w2NL
 9CYDvjZ0DlJgfSlMFLR9cWZSkxbSG6ywp8YnjL9nr0Fhp8wT1Ywhhatqd96wYYHEGBmPVBDqmxs
 RgCCaghksPrcbXjUg5g==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d8c935 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=c92rfblmAAAA:8
 a=nMkBCxXBiB_ylkh7ArAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: GjfrXl-cdUy66LwkwJc42GrMSnaz_GoT
X-Proofpoint-ORIG-GUID: GjfrXl-cdUy66LwkwJc42GrMSnaz_GoT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100092
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	TAGGED_FROM(0.00)[bounces-102666-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,mpg.de:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sashiko.dev:url];
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
X-Rspamd-Queue-Id: 5478D3D564B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Paul

Thank you for the suggestion. I have updated it in v7.

On 4/10/2026 5:38 PM, Paul Menzel wrote:
> Dear Shuai,
>
>
> Thank you for your patch. Just some last style things. It’d be great 
> if you could re-flow the commit message to 75 characters per line. 
> This would save some lines.
>
> Am 10.04.26 um 10:52 schrieb Shuai Zhang:
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
>
> Maybe mention the timer value?
>
>> The current implementation lacks a wakeup trigger. As a result,
>> even if the coredump data has already been processed, the host
>> continues to wait until the timer expires, causing unnecessary
>> delays in handling the hw_error event.
>>
>> To fix this issue, adds a `wake_up_bit()` call after the host finishes
>
> s/adds/add/
>
> Now that you use `clear_and_wake_up_bit()`, this might confuse 
> readers. Maybe:
>
> To fix this issue, also wake up the other thread by using 
> `clear_and_wake_up_bit()`.
>
> Feel free to ignore though.
>
>> processing the coredump data. This ensures that the waiting thread is
>> promptly notified and can proceed to handle the hw_error event without
>> waiting for the timeout.
>>
>> Test case:
>> - Trigger controller coredump using the command: `hcitool cmd 0x3f 0c 
>> 26`.
>
> It’d be great if you mentioned one affected controller.
>
>> - Use `btmon` to capture HCI logs.
>> - Observe the time interval between receiving the hw_error event
>> and the execution of the power-off sequence in the HCI log.
>
> Please paste the logs.
>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>> ---
>> Changes v6:
>> - Replace wake_up_bit with clear_and_wake_up_bit
>> - Link to v5
>> https://lore.kernel.org/all/20260409112233.3326467-1-shuai.zhang@oss.qualcomm.com/
>>
>> Changes v5:
>> - Replace clear_and_wake_up_bit with wake_up_bit
>> - Link to v4
>> https://lore.kernel.org/all/20260327083258.1398450-1-shuai.zhang@oss.qualcomm.com/
>>
>> Changes v4:
>> - add Acked-by signoff
>> - Link to v3
>> https://lore.kernel.org/all/20251107033924.3707495-1-quic_shuaz@quicinc.com/
>>
>> Changes v3:
>> - add Fixes tag
>> - Link to v2
>> https://lore.kernel.org/all/20251106140103.1406081-1-quic_shuaz@quicinc.com/
>>
>> Changes v2:
>> - Split timeout conversion into a separate patch.
>> - Clarified commit messages and added test case description.
>> - Link to v1
>> https://lore.kernel.org/all/20251104112601.2670019-1-quic_shuaz@quicinc.com/
>> ---
>>   drivers/bluetooth/hci_qca.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index c17a462ae..228a754a9 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1108,7 +1108,7 @@ static void qca_controller_memdump(struct 
>> work_struct *work)
>>                   qca->qca_memdump = NULL;
>>                   qca->memdump_state = QCA_MEMDUMP_COLLECTED;
>> cancel_delayed_work(&qca->ctrl_memdump_timeout);
>> -                clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>> +                clear_and_wake_up_bit(QCA_MEMDUMP_COLLECTION, 
>> &qca->flags);
>>                   clear_bit(QCA_IBS_DISABLED, &qca->flags);
>>                   mutex_unlock(&qca->hci_memdump_lock);
>>                   return;
>> @@ -1186,7 +1186,7 @@ static void qca_controller_memdump(struct 
>> work_struct *work)
>>               kfree(qca->qca_memdump);
>>               qca->qca_memdump = NULL;
>>               qca->memdump_state = QCA_MEMDUMP_COLLECTED;
>> -            clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>> +            clear_and_wake_up_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>>           }
>>             mutex_unlock(&qca->hci_memdump_lock);
>
> With the comments above addressed:
>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
>
>
> Kind regards,
>
> Paul
>
>
> PS: gemini/gemini-3.1-pro-preview has some unrelated(?) comments [1]. 
> It’d be great if Qualcomm could look into this.
>
>
> [1]: 
> https://sashiko.dev/#/patchset/20260410085202.4128000-1-shuai.zhang%40oss.qualcomm.com 
>


Thanks，
shuai


