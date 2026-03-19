Return-Path: <linux-arm-msm+bounces-98652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFg1Dkmpu2nHmQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 08:44:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4FB2C76D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 08:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 562A1300A100
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB18274FD0;
	Thu, 19 Mar 2026 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bJhSKKrD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dzwGCzXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EB839DBD0
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 07:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773906098; cv=none; b=WU2vQsqFXsTRuGOcrvpSBCU/S7MTUbRSnGPLa4K976AWI3NT9+MOpzU4sKcrQ1YtEnm8pnn+YKwZbvN94J3RD9BNQuGptnldhFiXyA1vBew+CQM3Po9F1CTffCerEwoXT4VlxJ8NqvatQEiU+/o8euBeWu8O/8qySThFU2MwL4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773906098; c=relaxed/simple;
	bh=4XY4jhDNLOeV30flJno2DJ0Bwr/A5l+U4+9fRcDaERc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=feXHrvuon1T/3PmehwBwzTfhSU/FFK04zKWK099PjDDrFvL77iyDw4QbztGG2pW2GszVHbfElaQ+keiXDBikd5fOPXJ48sUJFIXYocbbozSB1vgaSWhISEe+/yzrBiX9WjarvErEtPUpON0Fi5oki+f7FHJ5U9/ukgiZQ/YJuwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJhSKKrD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzwGCzXC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J744Jk1567229
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 07:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DOdtLeifiZXyGLwU/u9IRGKQWOfb3XrDub6omvdNpvU=; b=bJhSKKrDKeY8h6R4
	poHFwovSXWwe2AfU2HGk/EgQSojQdNP/Rb8fPnNK8VhmrbpZtkZQ1wByyX1oLLpE
	aGAB3SarfIp2jVy4TmpDUwHyvt8Cpj4YD/Gx6SHOgXQASUjT+65hbOUdnu5KJFZh
	+FwnKXYMqYsFTrwM3EquIvgzZszLtUBMnY9Bk6LHrz2mlS1JFZ6rAJXYoVWb6d1E
	ycwGwRCOLtfOKvr1ULuKLf/v1c8S3BkMGvwaLxanNdj7q/5zqigCV0AnVW6pbU+X
	xnihnfv5MECrnrU8EsEDcVhpHpGblysxCh6WjZI4tnRw2devAzOQPK7dLHj28BlR
	fxICZg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0akxgf0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 07:41:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bead0a9123so19950190eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 00:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773906095; x=1774510895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DOdtLeifiZXyGLwU/u9IRGKQWOfb3XrDub6omvdNpvU=;
        b=dzwGCzXCrBN5oQEE3R77W16QPEb68oO5xgcpxKX4K7yHvqtaWhmjq4UQL2G6Juw4zr
         YV0usRiVLnB7MhBK45lyTHeWXiDq1vXZfj1Rnx9JGsl7RF5P+cPc2tfAHaMU0eTp5kVB
         /61ZmFdKEazCAXsFaYS9tWZBNj30Cu0CuxqCd2rVyiLlTPjp5sPFfWIC4oAfovfRxOvz
         Ahw3Uj0xV1mWgFfBgjKWbqKK+XLbs18Q5JeJpVLM6oCNm8n5rxsbjU5vB+F2mMqm6iRp
         x14B2HGpCwolz+ePngptLI2TYY3zIPwFYGmRmGQmsG7mGDnTkg92CtEIC1fQqvUKA/jk
         rOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773906095; x=1774510895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOdtLeifiZXyGLwU/u9IRGKQWOfb3XrDub6omvdNpvU=;
        b=Znp87o+Rai0vKg9+jr3a1EvtwFyfZ1HZZsG534i25ZUtKkYi+Jfswnqm2pVQzlUK3R
         SjGNSnJTlgQ59FZaPlN2h4aiw/NS0ZrE34raoRFOCc9QAdOsyQcIjZTrYejmUrL6idZI
         09Mh0PHPLBRluHTg93n55zEOWriflsSvHIxDD6Vy1YdWC54CBx7KLin2mTrRsFRmGzAA
         imV6777UbOiyG6G+jPVJt+mekDCVzaMYZLi4LFfFk4H2GTH8q0bwtU+vvjh3Dp/u5zge
         aD84aNCq7IKzVhClQVQ4q4zkKQ9bn54Yj4MEvzBivxdMqK9XOH9fg+ZhEnWIbzLI0t1t
         2Ilg==
X-Forwarded-Encrypted: i=1; AJvYcCWuRH2S2u9XFvrSfVdzNdB4a5ZLv5T6UZmxix3PYgxwIpINNDmw8XyKUEwtZe/gxPcIQ4t4pfJvjvJXIUbs@vger.kernel.org
X-Gm-Message-State: AOJu0YyGJh7prNHlYwXo01izZIq1beEwGAUC/KPiTQHafatkWUxeK3ps
	OtDGuh4YlDj5lBqZNZ/mLBD6oZ5cg/SLs4x+TafJtjw73VgA+qr2O1cDdKeZKOrD9FrWWzeVRX5
	vZiAS+HVBHvfZIQmaZAi9Wt401e2oNghVFs3OiTaLgSeVm9rvcG6hY9ubBSxBYscLHbKy
X-Gm-Gg: ATEYQzy+ZMrULZtLCYnl1B+gjxkEytHwxN71JuUNMlGLK2ttiiPocGqD4mhCHMKEFfL
	xbdudy9lRlUQ9PexkZ74c6egjg0GoLehfM/aNJXmb9LcxSpuF7HwWrB0A7qbFm006ZJ8hhgeQNC
	NvquVC4XmOA1E9kMRWS1ymd/WyJzAJViQ8/J4rdYl9vGQXoXCALCvR8O3DEqmQs1/Gd6i+xZwfp
	xiUeBZLccxjPU9XlvVz8ozXce2vHTmQIv8pK9TPXVXVQmtw3MKI+J3LaX9cFheaI/hNayA4iqpO
	v6Wr/WJasZtnhU2e3TZ2qxtGiHyMQyxUfMkuXk/BWa8hdUycPDOsCBapkZM6cfBn+z8NZtrK0Ua
	YHKslvB+b+NLyRwtcNkDFt5R6utQFZnkHZK9LbIL68pviv6NVsT0iRGx1yzNkZe0BGeNfgppPIo
	M=
X-Received: by 2002:a05:7301:168b:b0:2be:1544:5c40 with SMTP id 5a478bee46e88-2c0e508312amr3097567eec.31.1773906094962;
        Thu, 19 Mar 2026 00:41:34 -0700 (PDT)
X-Received: by 2002:a05:7301:168b:b0:2be:1544:5c40 with SMTP id 5a478bee46e88-2c0e508312amr3097552eec.31.1773906094396;
        Thu, 19 Mar 2026 00:41:34 -0700 (PDT)
Received: from [10.110.94.9] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55a0d4asm7167389eec.20.2026.03.19.00.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 00:41:33 -0700 (PDT)
Message-ID: <6c0fef1c-9c81-4586-81b2-54702a5b0bd7@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 15:41:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: hci_qca: disable power control for WCN7850
 when bt_en is not defined
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20260319031040.4096297-1-shuai.zhang@oss.qualcomm.com>
 <mcjloavd6jhinb2wgfwihsdtbay5n7zv52tn63kzrabcqwyp26@mh5aet76kl7t>
 <1603a5b0-8edd-4c31-b2d1-344ee7df10ac@oss.qualcomm.com>
 <whqo7o6fu6mytf3hpdrrirptx3fpprnp25as3dnam6n4fo7tjq@dolksuaq4irz>
 <4d6d2597-df3f-4421-8760-ea59a46a3b39@oss.qualcomm.com>
 <qc543ugvjtqp6wbsrtycne25xwiyx37blqq3wj6herzwpcuj6k@p3ydpkh3emld>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <qc543ugvjtqp6wbsrtycne25xwiyx37blqq3wj6herzwpcuj6k@p3ydpkh3emld>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA1OSBTYWx0ZWRfXygyvXxboiSId
 ZZevm6wkBOVAliOwTTEQ/81TBiO1QBum1B9ChPyZag04nlfN7E/5HyCYjunDsLLDWGo644poN3H
 dXoMmsRORqHZbJR8EngwkglUgzX+Erj/FOap6DPfizhX19Huk0VjU4VbplLynuWRqUFnGOq/5px
 ceIc7Eo8buVO8kl+0Ky9YIT88Qpq7UEwzccHGSLk0TTBaHQQBX0cJEwyA717jW9EaD9KFkRRW+f
 fBQ7YZhBKkP053nMHboPR5BaWOOAHZxurIQvrNB3by7fTQbl+QrQgTOgkHSc56apwVlsoeEhZPa
 a1KaKhCUaZPsqGLXQU3FXKFjyaznGNJsjsKSHv5PANCSDrH92Rx4I7EVIK0xY3T2PsMWohPB49r
 VLdNYBOTDjcSDZFEe8wa+yxWaCZcWh4zE42k9ITzmqskKdlg3bGD7YSvI0UxZQXaRj6t/iRKBfl
 Hgl1gRqDnntLXssThvA==
X-Proofpoint-GUID: RI0otOvj1begTNvz2aB23FtwE4u69gh3
X-Authority-Analysis: v=2.4 cv=ZeMQ98VA c=1 sm=1 tr=0 ts=69bba8b0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=AjXXxhxKq0fdEwWQdOQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: RI0otOvj1begTNvz2aB23FtwE4u69gh3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190059
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	TAGGED_FROM(0.00)[bounces-98652-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E4FB2C76D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/19/2026 2:44 PM, Dmitry Baryshkov wrote:
> On Thu, Mar 19, 2026 at 02:06:49PM +0800, Shuai Zhang wrote:
>> On 3/19/2026 1:42 PM, Dmitry Baryshkov wrote:
>>> On Thu, Mar 19, 2026 at 01:21:58PM +0800, Shuai Zhang wrote:
>>>> Hi  Dmitry
>>>>
>>>> On 3/19/2026 11:51 AM, Dmitry Baryshkov wrote:
>>>>> On Thu, Mar 19, 2026 at 11:10:40AM +0800, Shuai Zhang wrote:
>>>>>> For platforms where the bt_en GPIO is not defined, software-based power
>>>>>> control should be disabled when power is managed by hardware.
>>>>> What does it mean for this chip, managing the power in hardware?
>>>> bt_en is pulled high by hardware,
>>> In which cases is it applicable?
>>
>> On platforms using an M.2 slot with both UART and USB support, bt_en is
>> pulled high
>>
>> by hardware. The current platforms are Lemans‑EVK and Monaco‑EVK.
> This needs to be a part of the commit message.


I will update.


>
>>
>>>> or described in the device tree as a
>>>> regular always-on GPIO.
>>> Why?
>>
>> This is equivalent to bt_en being pulled high by hardware,
>>
>> and it applies to the same scenarios and platforms mentioned above.
> No, DT would not describe the GPIO as always-on in this case.


Yes, understood. In this case, bt_en is pulled high by hardware and is
not described as an always-on GPIO in the device tree.


>
>>
>>>>>> Add QCA_WCN7850 to the existing condition so that power_ctrl_enabled is
>>>>>> cleared when bt_en is absent, aligning its behavior with WCN6750 and
>>>>>> WCN6855.
>>>>>>
>>>>>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>>>>>> ---
>>>>>>     drivers/bluetooth/hci_qca.c | 3 ++-
>>>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>>>>>> index c17a462aef55..4512ff7cd0c0 100644
>>>>>> --- a/drivers/bluetooth/hci_qca.c
>>>>>> +++ b/drivers/bluetooth/hci_qca.c
>>>>>> @@ -2484,7 +2484,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>>>>>>     		if (!qcadev->bt_en &&
>>>>>>     		    (data->soc_type == QCA_WCN6750 ||
>>>>>> -		     data->soc_type == QCA_WCN6855))
>>>>>> +		     data->soc_type == QCA_WCN6855 ||
>>>>>> +		     data->soc_type == QCA_WCN7850))
>>>>>>     			power_ctrl_enabled = false;
>>>>>>     		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>

