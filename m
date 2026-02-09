Return-Path: <linux-arm-msm+bounces-92333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFzfCDkBimluFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 16:46:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB3F11217B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 16:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 638FC3008D53
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 15:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E503803C7;
	Mon,  9 Feb 2026 15:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzgSQqdz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQ2AkVlz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A1A37FF73
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 15:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651956; cv=none; b=XuiCq6YK9O2IcomP1wbrjBjuc8Xie/S6K81UOBfFQtHEHXscxZjYAEBPIalRUSmRMP9E0IuwgHrZeJjvudk24B+LE71M6OdgwQhibC5BKeCJXtPWC/pGEKndehqKreYSRKv3dLkqBnMma41aDU9115lNqp5SeWwN6TPlmTugEcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651956; c=relaxed/simple;
	bh=F6ZHOYjgOqKDDSkVmJxSHzLZsU9BiRICO3QW5hQN72U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VRLgz/sb9hk5NuKdr/nKuli2lWYJHJSFLWRVW3wAEM/jk1O88GjZYVaYSgCKEQiVX1U9cxkpswd7i9saMRdU9nPZ2NyXNT/XLy24qyjGwDm2Qr5VrfVj8x8IPudovTjRg0brpwwuwgDDRaaVFTFtiq7SYwuyaOYwonEa+tkJVhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzgSQqdz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQ2AkVlz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619BvfRK3252092
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 15:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BSWE5q+1oo4kM8c3X2R4tW6aG/lc41Xt8NN6Q2uo37w=; b=QzgSQqdz+yS73z0Y
	nlHBcrvBinm1MhKrDUjqaNuq/bsORhH5ZRDs/SZ2jC08bHDc4oGXCIW9dtPhApYl
	TGvuqUgxgkpGcqxi2SxwzU2aom3igIn1O4ZSVdnLe9ykLtMO7Y0bxJNaz8LrsL2S
	cwMWPnmE9ydvflDqAmCQ6FiARioLclx4RSkzaOEFqUgDgEmr70Z+I6QfkDW2Bmpb
	Sb6DFQAtEOWZPJW76IyKLN8Hr15s16Jwa53otJq3z7P6kiNLbbhdEb77QcFZQjq/
	HRQk8E6dlfnQFPfoC1b6T5CRMMcV9k3jmm9jwXjDO7nZ5ySUqg4QcugQhNfRRxHL
	0vT0hg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79f6a2gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 15:45:55 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1270dcd11c1so2631577c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 07:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770651955; x=1771256755; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BSWE5q+1oo4kM8c3X2R4tW6aG/lc41Xt8NN6Q2uo37w=;
        b=MQ2AkVlzfsnz/cO7BnhNHuL5tOca6S/bYIYhEn5/tnu3DLFmJuSyufuTKAgxVT6hfQ
         y7xabwf+TvKkM30hmWcbta4mIIAfU6uZJGsAHV6xaMdLnLAiHLOdSCopxTuvyMGj3Mi5
         ZNGmjlKMAXm1DnDq5NqfqMBdLa8r3IoN8rQrSyBcLTvr9q8gw+IPVcFzYCcdCmIhSxqo
         tFrCtmyZwMqIzEatzfh5417oI89+pVBWIhQ5frTLTNtvmR/Lj0gSh526JVL9WTgu3pEg
         Gjgz2talJXvdHDmiRrjJ8oEPk4NplkPlX6RllMPUXMP89smz4EDk7O1hBHK4eMFBdcqB
         S+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770651955; x=1771256755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSWE5q+1oo4kM8c3X2R4tW6aG/lc41Xt8NN6Q2uo37w=;
        b=ODVh/uyMw5guK4yV3tCBGim7MQjkTdGpp6BFWiugcSbcw/7x04UyV/dj+7ZA6jO5Eh
         B2zkHor3Xoj579DOtthm1k5QLggn1AZyN60xw7ztLwnUE/GIVhqrrfosUYwT9tQcWgmy
         vjyY2poDsn+zqC8VPet4dQtSonb+dSUew0xf+erJJjm5RXJPoNl9lYMmHufRBF/I6IFU
         hF5HCY+QQLv1DldQcaQa6nPsQEph1KTgPCkeEGm3FHxhg26bIC56dbBfFIo3wast7ydI
         7ArSqftSP4SdsfJatUL4OcohInG+HcBEpA8ObQJyFxRuOR1XKHKCySCa4KFM8Cz4EmYi
         tQWg==
X-Forwarded-Encrypted: i=1; AJvYcCUUuzSnGSgaZjvgBgXqf7EVD8nKLw1K70y4BUly3McyFeyIFUmM9TzlXnjdavHiI9rKB3OqrUpp8eHgKFAq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzurvar1Ole+frnB8hGseMtMGcYmzFByqY+J2PmeDnBqoYmdow
	T0XFQiOdOO2brVaxIur8wMNJwfLmJ28XBnBWTN6Lu4pDi7uLQ+EOqRannQU4W6DzE6UHHO+m3K8
	tmIeyiGNNxBs7aJCHVbgSI72X1T/D+DjndugVSmuJTBBZIHfesaktNoVYXFHf45DgwbgwhqM2up
	WG
X-Gm-Gg: AZuq6aJ78heZASg17A2901IxPnxXdbnPsdActN6DCe0dIHuJEng9gTAKjadErvouPf7
	cara9jkTyQrR3RTt11oTyiWZk4OP0s9tCiNXbfa431DM0b7LJparatEwHXz1GfjJPOVM8onAHOT
	Mjypfrb5yo3etBoGwn0by9kKIh/FDjaYPt7RsChgklvaPqJJn4eGZZRC857dLvnrP8+yCRy0i91
	t3/4M9q5wbpK0QUKimwZ8PqWaIiwqDc9AWygCzrngVodzlU5g8PcF+NmenYhpHCMFdixZ+V0YvT
	NaAT1M+bC2pJGj7Jr9a0ma0ILh7syUrZgKtc+9Chb7vaiZpdx1uXGzvMy2R3tyJYduWWZt5ODIX
	R3C2ICreuB4nICvsc5h2hIZ4uPAIWXX5L6DabvIY=
X-Received: by 2002:a05:7022:4381:b0:119:e56b:98b8 with SMTP id a92af1059eb24-12704049aa5mr5324274c88.31.1770651954495;
        Mon, 09 Feb 2026 07:45:54 -0800 (PST)
X-Received: by 2002:a05:7022:4381:b0:119:e56b:98b8 with SMTP id a92af1059eb24-12704049aa5mr5324243c88.31.1770651953610;
        Mon, 09 Feb 2026 07:45:53 -0800 (PST)
Received: from [192.168.29.235] ([49.37.135.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e5e3asm10212107c88.7.2026.02.09.07.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 07:45:53 -0800 (PST)
Message-ID: <5cf30e75-40f9-43a0-848a-cca63ba8df0e@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 21:15:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] Bluetooth: qca: add QCC2072 support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
References: <20260209080613.217578-1-vivek.sahu@oss.qualcomm.com>
 <20260209080613.217578-3-vivek.sahu@oss.qualcomm.com>
 <CAMRc=MfT7ourMH+ShJpnBAjv_uOb_ds0rxJOYaz_HsoT45dJYA@mail.gmail.com>
Content-Language: en-US
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
In-Reply-To: <CAMRc=MfT7ourMH+ShJpnBAjv_uOb_ds0rxJOYaz_HsoT45dJYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3QWDDG8IYy1E9B5ieTRP-zi0aW7GyKiQ
X-Proofpoint-ORIG-GUID: 3QWDDG8IYy1E9B5ieTRP-zi0aW7GyKiQ
X-Authority-Analysis: v=2.4 cv=W581lBWk c=1 sm=1 tr=0 ts=698a0133 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=z/GpFUkVOss2g+jQkJ5YVA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=wKTrfkEMPv27Zyno9vYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDEzMyBTYWx0ZWRfX5SY8Oa4jTajP
 h9/lW9H1KgIccJUJeRcwKmwn+KpZ4ZNPJSyJ/jtzsd7P/wupqe2ZBeUzIsLIRGXAletIXt55BJg
 rhT/vGmisDSTmNdG+IJnRB6LMsSVz91eDlQxjl5pTdjCRF99rVlIvGfhQBBYL2KvxuF2vu7WNor
 QHDcWYnNpYz3NumkG0hL1RTbi6CmIbtg/v3tJpz4kVMaYzPk4llYgNSn0E0jeMxJwtkJ8AeIqIz
 ZHi7pnEG+ibDla1wmxhuHlqkl3GviOLVKPQ/XMyO/mwRMVrnX+3X64W5kQVExorqBLqprDtfG/0
 hSEPDBuQLCLb96z4J5D612VoA6eIvnl2PGqh6dSbbjNmOdGSj9dLfbY8465T50TTK0XtYrdF3Yk
 W65wBjCx1j/rixo++ogWB3saOfPBYfATqfPbj/YJ6iCR7Vo3eUaA+R2KQuShtL41NUJ7638LaEO
 ACm3PBKbljH94dr6eBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090133
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92333-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[quicinc.com,vger.kernel.org,holtmann.org,gmail.com,kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.sahu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DB3F11217B
X-Rspamd-Action: no action


On 2/9/2026 5:04 PM, Bartosz Golaszewski wrote:
> On Mon, 9 Feb 2026 09:06:13 +0100, Vivek Sahu
> <vivek.sahu@oss.qualcomm.com> said:
>> QCC2072 is a family of WiFi/BT connectivity chip.
>> It requires different firmware files and has different
>> configurations , so add it as a separate SoC type.
>>
>> Correct the sorting of other chipsets for better readability.
>>
>> The firmware for these chips has been recently added to the
>>      linux-firmware repository and will be a part of the upcoming
>>      release.
> Something is wrong with formatting here.
>
> I would personally split the sorting and support for the new model into two
> patches - without and with functional changes respectively - for easier review.
>
> Bartosz

I'll divide this patch into 2 parts, one for sorting and another one for 
adding support for

new chip-set.


