Return-Path: <linux-arm-msm+bounces-102617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFJQAKa62GmmhQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:53:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 010F53D4579
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F4F33003BD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 08:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE16351C09;
	Fri, 10 Apr 2026 08:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j75gSjzg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E9Evqg+W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D444033F585
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811232; cv=none; b=jYXQpm2YbLHLo4clGl1C1KBkloceObpxXMTpY+1kolAHjes04AKPAjsDIpI5bXeQoB+R9YEk5yAaa+3Uo5U/3gF+akDN/ncoA93KGbcP5SJFI345B3+QWBmt/+55RUpcvFO5BR8xngxfIasHBqS6+cBOnwzCReaFBexFUtjr8/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811232; c=relaxed/simple;
	bh=unDtLaJv38ORHPnLJsTDOfDRmF6IxgkNQIEOb8nNunM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DskyZe5s5wAjcq21/jdzSw7oX6I4RWnzs6bezoEjHNIWJFKYvs7N5+++PnRdtSTZclHMlsGY3ZvX+SrykIu040uWJ3eaerFXgM+FcaqurQ+TLoWG+iR3YHS6srzQyyRslUcPJ+i4zN/bTtMVFz+Qg5Q6QzQbixs4ixWscv6OLwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j75gSjzg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E9Evqg+W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6BlNB2866311
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NFc1cR6IRw6VaxBeLU2oBmMaFHH6k+Ln0IhBfxX7nRE=; b=j75gSjzg5S8hLx6f
	ddfVBsM0Xckc5d1aaOLQRQUg/v4KwByiv9yY7lNcBm3qInK2lD9LL/WpayYyhZMN
	9JMj2QmN8zF2BN/+H5KEnx8LXV+1+vPalscMoDV1+rtggnJLxrHCO4MPQAE7NrkK
	fSpDGpRNIC9MyFK95xx9mHm4Tn9QAQch8yDZfkX8LXMHrvsinlPUYWAuSIT1sair
	frGQJ/hZEMwFg4gTe4+mVsz31pshtrqdFCNXY+F4n7xyYbGJ66q5+j8sWS52+tBm
	UxB2E40LV+/Ih1QRlamWrLikXroqLB01AFfxa6C+/EmZBpVA1eFQIx3y/mbxbad6
	nzPsCg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decaykmrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:53:49 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-127133794b6so12888344c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 01:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775811229; x=1776416029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NFc1cR6IRw6VaxBeLU2oBmMaFHH6k+Ln0IhBfxX7nRE=;
        b=E9Evqg+WrlfFO4AprNgGncYXvv02AyEgRU9KuewB6aaE3HqwSPP5+jhqvgJj/PpaNK
         Uj/Wma5D3oxpvKUXe7Cik7n6POc//jhc+3Y8yx1y2D8x6wwMOnH9H06CkKrQCk8WWOvq
         ShymdNEx7xxeQfNVhTDwAVVzvj8F3heAtwpPivze3GBDhMQeP+wYnJrEmTzbCa1dq1YD
         uyVc0DDpm1AB0eZAZxh0kFbcedebY7Ql4chcRrTSb4tFGyxC+9LKlqTU8qqcKCg5pWB6
         fSsO8pwoj9xfJnZ0yMdhBl0LyTVC/XQgdEy1mujCF7JjfTzzPpI/oVuUUke1ay9P7gdo
         DSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775811229; x=1776416029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFc1cR6IRw6VaxBeLU2oBmMaFHH6k+Ln0IhBfxX7nRE=;
        b=e1iGqC2ZEK6yJnu8ndYMw2G+8JrqvLyxHJGdfqLVH5nJsB2LdXaXJm2S+C360B1416
         HvLgLUxHKwlW9P6U10ORU0YbRSHR9Z7U1xZwkNWuTwR9EfrUg98Z9PVhI+RBh2e+F8ot
         58yY+sfHqXeQugrGT1mOgW5q/RmHtES5cHURNFapZqYuROgTHph7nWqC7iDOvw1fKTWX
         jhBkGInG2IfMZY3YFG8rmNlWtWW7VldoxeDwoMTt15mrVEpOYxm80BUVVsrRIgYgzUAM
         2WvZmPSZk7d7pvy5EpwD0zz2azB6lPm62YMprOVWiXrF3HVwzUGQEvsn73e3URI+K4jg
         JWMw==
X-Forwarded-Encrypted: i=1; AJvYcCV5CLjTa6ywbM82F7zgZ8xTBMYaWy2k5ck6fp9la6gex62qNsT4nPeQqEhtfcJStSTMVW2MZB0+4/EC+NpH@vger.kernel.org
X-Gm-Message-State: AOJu0YzKFRplPhaxQW+Y7b2wjMtVPE6GrCNn9ZVDnpQregc21+GqHAhi
	pIo3zf2qktYW4ah19RHJMSHW8pSZzFAdNx/zYQRFoO41/+B6PtD9yohAQKLflI3j5GwaFU3E5g7
	vpj874gWzFyLU6hgDd2s05QTrqi5XhRAlebMCtKmz9RjwA9uzWVVJcXDmoZWp2tsnz0aJ
X-Gm-Gg: AeBDieuNodJlOICErJZOGhvXfsZSS9g0rkHd3EZnmNUu3z6pnSvMojVswOOVKW0GZ6o
	PTqSVtrabBKTMG5H1LT9X41KWar0oWosI4iBSQ82zGYOhWNnSZTdN9+2PsKJ7xj9kfguqVfastQ
	g4VLi6w109cNAD2ewecWJ3RCxeaYmQzk96NP0A5AqF3haVviaap/lxbkFHUxfB2NnaniyENWBzd
	S2BKlETlWmIuNhaCFPCycqDPjRx+uU4ZfdacVHXw3FvXcwKVpQFy71Pdw5rk/5n4mN1F6xsn195
	tpmYtKRhvetGlHNI0YcG8OFZcF7Z5wI8ljZ71x0jjxz4GyDd7ryquPwc6YkihLfNU4dP/E5EhNn
	zSIkCJIGgjnRARPkCZGRZ/G8lYyBqHdEJ3ABC7M7DopzYgDb2
X-Received: by 2002:a05:7022:20c:b0:128:d2f2:5cf8 with SMTP id a92af1059eb24-12c34f06c2amr1225944c88.34.1775811229006;
        Fri, 10 Apr 2026 01:53:49 -0700 (PDT)
X-Received: by 2002:a05:7022:20c:b0:128:d2f2:5cf8 with SMTP id a92af1059eb24-12c34f06c2amr1225928c88.34.1775811228474;
        Fri, 10 Apr 2026 01:53:48 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c345b5b9dsm2410253c88.7.2026.04.10.01.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:53:48 -0700 (PDT)
Message-ID: <6ad050c8-b923-417c-a50d-59233c8841ef@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 16:53:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] Bluetooth: qca: Fix delayed hw_error handling due to
 missing wakeup during SSR
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260409112233.3326467-1-shuai.zhang@oss.qualcomm.com>
 <CABBYNZL25=Q6cR5HKf202D61oe6pYL-2NR3vb32ja+5W6xQcXA@mail.gmail.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <CABBYNZL25=Q6cR5HKf202D61oe6pYL-2NR3vb32ja+5W6xQcXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d8ba9e cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=c92rfblmAAAA:8
 a=nMkBCxXBiB_ylkh7ArAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=TjNXssC_j7lpFel5tvFf:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4MSBTYWx0ZWRfX3XJBdQF5gkNy
 BeWcwhFzPkSNCqmx5VYyFEtI20n69XpyV44fSRSJH7/9BAlZ+CmNe9v7Ue8L6Wgvpx6uCiUQT5p
 MTJ2Oe3Z12k6lIE6YulggnXfSu+kqXuUIolWEnYiSEDm+Nxm6KatGcT+VImJ68JapH75/ScW1Xu
 VooQdfxa49Of0QRcdBTxcLJqG4pnBSWIzKLjAEdMSJs0l2ekeVlC+ounKHPdT+kPy0QJwOXbTd2
 S7LpBjcOYNW4+wCfTvV9NtGb+T2GGYegNDSj+BzONkC9GPMTIAkgE7O2ji0RnGm15Lgi4Zbyqgz
 jWg/XA77ZGrSdknvkuGdMpub9ClZssut0QVpUf3vDdUbY6vjQzjyCU8ZIC4NmF+8RyQx4JlFARg
 0U6RZRvj6XDtBGbVaPFLJf+xPtVyO1LSqLYmsrU7m1vx2mptlsFlcWN5tVqNm1uImkSWi1rMoxw
 83mM24qWQDZI7OTwlWw==
X-Proofpoint-GUID: zOpuMp4y9B1EN5ukzSW6UvaB4IfN644n
X-Proofpoint-ORIG-GUID: zOpuMp4y9B1EN5ukzSW6UvaB4IfN644n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-102617-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sashiko.dev:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 010F53D4579
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi  Luiz

On 4/9/2026 11:21 PM, Luiz Augusto von Dentz wrote:
> Hi Shuai,
>
> On Thu, Apr 9, 2026 at 7:22 AM Shuai Zhang <shuai.zhang@oss.qualcomm.com> wrote:
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
>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>> ---
>> Changes v5:
>> - Replace clear_and_wake_up_bit with wake_up_bit
>> - Link to v4
>>    https://lore.kernel.org/all/20260327083258.1398450-1-shuai.zhang@oss.qualcomm.com/
>>
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
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index c17a462ae..9fffe665b 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1108,7 +1108,7 @@ static void qca_controller_memdump(struct work_struct *work)
>>                                  qca->qca_memdump = NULL;
>>                                  qca->memdump_state = QCA_MEMDUMP_COLLECTED;
>>                                  cancel_delayed_work(&qca->ctrl_memdump_timeout);
>> -                               clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>> +                               wake_up_bit(&qca->flags, QCA_MEMDUMP_COLLECTION);
>>                                  clear_bit(QCA_IBS_DISABLED, &qca->flags);
>>                                  mutex_unlock(&qca->hci_memdump_lock);
>>                                  return;
>> @@ -1186,7 +1186,7 @@ static void qca_controller_memdump(struct work_struct *work)
>>                          kfree(qca->qca_memdump);
>>                          qca->qca_memdump = NULL;
>>                          qca->memdump_state = QCA_MEMDUMP_COLLECTED;
>> -                       clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>> +                       wake_up_bit(&qca->flags, QCA_MEMDUMP_COLLECTION);
>>                  }
>>
>>                  mutex_unlock(&qca->hci_memdump_lock);
>> --
>> 2.34.1
> https://sashiko.dev/#/patchset/20260409112233.3326467-1-shuai.zhang%40oss.qualcomm.com
>
> Lots of comments which Im not sure are really valid, but one is
> considered critical so we do have to pay attention if that is valid
> then it should be addressed.


This is valid. clear_and_wake_up_bit() will be used.


Thanks,
Shuai

>

