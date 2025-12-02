Return-Path: <linux-arm-msm+bounces-84058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F3FC9AF9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 10:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BCB974E2C5F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 09:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D8131D36D;
	Tue,  2 Dec 2025 09:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPTayajK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNio0r9J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57333285CB2
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 09:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764668909; cv=none; b=qOzzm2ku8rmv9w+7fg1oIlTPv0sieiN8F75uIEapQI0RG40gYI+hM/xFB2v3jnTJlKZEaZCRFPeNn62D9Vxu9lGRbuHEe5qX+g0/W8Vd5ZcM67PMHWMa+0uYyPopJrtJl3pd0adym+GVljM5XmTGN3iZnj3HnpwT7A4V70rJYGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764668909; c=relaxed/simple;
	bh=/qejxCeyZKBy0rO1TPz+XLZpF6o5DZmOLKdwk02jSV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nBWbJWDy257zxK6CrbyTjAbIR0abAT74CjoBnqjDuQssJGG1qgGgG+89g1TLOKN3ZJB9Z4n+15XDVs0joqn0LBKeXRAf28zUdrY0959BhdU+UFAv12pik8NshE78kMH52hzPZGT/zGVNmevlOi8H0cH56v3RDL0NLJN1igeuHgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPTayajK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNio0r9J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B24CtCO1592073
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 09:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H4CsMDAZY2FVaahy03K4lio+2iA3SK+XYjQawaUF7nE=; b=PPTayajKr3iRPvvj
	KC7AF8srO5MffXNeYISXeIgFe1vtqZEi6bMij/FXdkVrggb3wo6+62v0aAfCRHDb
	BC0XqLrpypIqiVp44ojZ2kPXpczWvT5Wz9KRqFjyaneLKb6k4gGG3k/tQv2lphM7
	tXwAXdAZk+Arp//lFt9fzTsQQIuJE58hxPeoU0lcz5go+dipbjX9aW62jV54f+Ay
	NreE7noJ+nfAA6QwdXFqWjNOzLSEJXjE1Gx8KC1fCQgFHJdWVFm2ROhkWnw6gN1C
	DGhSVznmyqiBKmgKVrvoCjxweLXuDKZ+FIs0oMA5wQJ5q+VWfmpmPJegZUe4sQ1v
	TECvog==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asrvr904u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 09:48:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297dabf9fd0so69162165ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 01:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764668906; x=1765273706; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4CsMDAZY2FVaahy03K4lio+2iA3SK+XYjQawaUF7nE=;
        b=TNio0r9JTsgyeOCgcTDD/mhEoQfFKTpigswFaKaExVBuDqEiYAcPFSKheVFGwwu5iA
         JqdZVemxfAgUFSowfr6iVsFP0z1qBBZfdFI4uHYcVW4DkAXTQ/yM6XGn6WYD7I7dfKsu
         Zkhcho+PbNw4VtlLVJp0IDhdqWE04jmr4u9uaNPDLDJhQyQOZGmoPMdLTwjwQRJmpTiW
         vYZVAW4bUFgkL7PayIIpDGsyNiPVmkRmllXnS1T2Md7CJrDtgFxSalkoopPCk16UGdA2
         nSriAGTWpcTHzXSchf+tq3QJqvw7lGlGHV4MIVK98LJPqRrzL4kcJfIAvDZOeMjU8FTs
         v5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668906; x=1765273706;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4CsMDAZY2FVaahy03K4lio+2iA3SK+XYjQawaUF7nE=;
        b=wy03LiUCX/NbC2lmniPc8fnaIMcumGl72rcMTtDJ8f2MkWMNvrLnAW7wIbXLmQ73BG
         5RQjdx0pJs+UuhDMI1wTFLSAcYFrR4Bw+3A9zR86x20tic0mAQXpB4s8kda3jdl7/2FE
         r3Rh3biSuDbqRBxxlLF7AvZptyOPCpMW7iYyetTSpW6S3GCob6Y8IliYSJX8hnRFkFon
         +RZm5MhuCNAap7QbzPWuPVSvoBw/4CtDz4hMrLx944ttb823xmNzIvCrcqeoaHcm/hSd
         TkwiNMzA8zEn6YlW4KAmu7OXdqPeRjAAtwciUo74MzOHodUku+O6rdXGsG71VnzCXi3o
         ySvw==
X-Forwarded-Encrypted: i=1; AJvYcCX42XnNQi+bVIOfdLYi+gwAwYDStEGSGovgkmfiTxi16FK5K50+RmHx+4o8+gvNXGjkbl0DGA4pYe3fKr0s@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg+lw5Tue8B0D+TuLpDfjzdMfFJhBwXCEwPRNkYyyaMX6rqpv2
	p6rgYCALufEdBe5rTvC+1Yeeitcu8ieedYT6hm4CwoRLnJBdyiQQrYvVhYK3MOGnYMGOJZx9pj6
	xs7JK2rnEu9fj+0rneF1bcSf6RWM7ZwJEs+BH7DBBHCYHEp2zrZVKYLgijaOmPdbNxdjk
X-Gm-Gg: ASbGncvZgvpVAZxKTxYtmvTnykHeqpf0xMX+U8G7bLyBHGGIsx/Tyl7J7o+iFr0lzat
	IOSk2ryWMRnX/R1QWJxCNBc/gr2RCmAfpmgwgVIWZiV+oELCWsxScslwWcpXKoBTChmxCqcVsOI
	Wor7KQMLA4U6vI2XnYGb1FHjKsyUcjTYCxkIBpJE81tPQQSMmuzjf9A8XzvIt09mB8Yj/bn+Xhh
	LP1svlEh+YgJHqmDxlpVcER7pVPmej+hDppnXOa3O9pDyWo++BSmWdemCBBJ6VdGFH3P46ZCdUO
	eVq2xLcja53DzUbgXqSw3EtcpJuDkCJUUoKK4QPpD5wWLd7L00psaVNswXRaFFgZAadm8Aq1isv
	iSjgluhSflfNZkFdP7HQltSK+bV0DvJR13nxalavJD6NHHqdGyOiRxHdRavs3FlSiHNRtxw+8sE
	5SfO8=
X-Received: by 2002:a17:903:2f10:b0:297:f793:fc7e with SMTP id d9443c01a7336-29b6c3e4c3amr431308755ad.19.1764668905810;
        Tue, 02 Dec 2025 01:48:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8DwtE75mzbmXISOTRq1QosEolgq/N3Dj+fh4eoYyaUm4l6E1gY7eo7WOlgFd1xZKrzFJbag==
X-Received: by 2002:a17:903:2f10:b0:297:f793:fc7e with SMTP id d9443c01a7336-29b6c3e4c3amr431308525ad.19.1764668905335;
        Tue, 02 Dec 2025 01:48:25 -0800 (PST)
Received: from [10.249.22.154] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce416f00sm148351595ad.4.2025.12.02.01.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 01:48:24 -0800 (PST)
Message-ID: <d010fa56-3c7d-428a-810c-02ff8b1091a1@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 17:48:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] blk-mq: Abort suspend when wakeup events are pending
To: Ming Lei <ming.lei@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Daniel Wagner <dwagner@suse.de>,
        Hannes Reinecke <hare@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavan.kondeti@oss.qualcomm.com
References: <20251202-blkmq_skip_waiting-v1-1-f73d8a977ce0@oss.qualcomm.com>
 <aS6vYCg2Gks2BGHn@fedora>
From: Cong Zhang <cong.zhang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aS6vYCg2Gks2BGHn@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D5VK6/Rj c=1 sm=1 tr=0 ts=692eb5ea cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GTZyfoVqD6E8GamsXEIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: W1zMbrYJxDGlEKlUO7K7pPoUvqv2Q0FK
X-Proofpoint-GUID: W1zMbrYJxDGlEKlUO7K7pPoUvqv2Q0FK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA3OCBTYWx0ZWRfX6a/1YLYXq0N7
 bruJLhqIwZ7uoUFM/oAfAk1SnrLEAtjT48LIsnYimzHXz29SOv/7+9nji+5NnYWBOitrljmqxzE
 6hhQhxYhWQkT8JsyDo3I+6FO/09Tl2z/jh3Ge+7rVaAwk/sV+eI3ZXQcIgRVPwftFdF86B88D3j
 tai5fH2szQYJ9+usJfIHIHjW6KeEN19j7VLBgi8rXdEv3HoJ/ylAGrLv56kwQO2zfGldwvrGkZ9
 xJeArYWgQ8pHV712wypSaOCITCZnDff+CG4HdfXn+h7pIiehldD7Wle+kRPPvWS4+1H1ygJdY+P
 HsoHpTHdu6iJWS1r2gIK81238cDPTJrDLaJEt5VkoAtBQnTJC3Xknpzj8t5t8PDAtKS9EKnsxCY
 dxQnxW3ReNleixX0sO6oi9C+/gu5GQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020078



On 12/2/2025 5:20 PM, Ming Lei wrote:
> On Tue, Dec 02, 2025 at 11:56:12AM +0800, Cong Zhang wrote:
>> During system suspend, wakeup capable IRQs for block device can be
>> delayed, which can cause blk_mq_hctx_notify_offline() to hang
>> indefinitely while waiting for pending request to complete.
>> Skip the request waiting loop and abort suspend when wakeup events are
>> pending to prevent the deadlock.
>>
>> Fixes: bf0beec0607d ("blk-mq: drain I/O when all CPUs in a hctx are offline")
>> Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
>> ---
>> The issue was found during system suspend with a no_soft_reset
>> virtio-blk device. Here is the detailed analysis:
>> - When system suspend starts and no_soft_reset is enabled, virtio-blk
>>   does not call its suspend callback.
>> - Some requests are dispatched and queued. After sending the virtqueue
>>   notifier, the kernel waits for an IRQ to complete the request.
>> - The virtio-blk IRQ is wakeup-capable. When the IRQ is triggered, it
>>   remains pending because the device is in the suspend process.
> 
> Can you explain a bit for above point? Why does the IRQ remains pending
> and not get handled?
> 

The wakeup capable IRQ is not masked during suspend. When the IRQ is
triggered, the kernel does not call its IRQ handler, instead kernel only
marks the IRQ as a wakeup event in pm_system_irq_wakeup(). By checking
pm_wakeup_pending() suspend process can abort if a wakeup event is
detected. That means the actual IRQ handler is not called during the
checking of blk_mq_hctx_has_requests, which cause the issue.

> 
> Thanks, 
> Ming
> 


