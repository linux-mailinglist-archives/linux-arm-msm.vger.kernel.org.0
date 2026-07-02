Return-Path: <linux-arm-msm+bounces-115927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ua6jBeRCRmpVNAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:52:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B2E6F6391
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:52:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="jE/O8SMf";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eW0wMM8T;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115927-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115927-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4EEE30FF658
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D22847F2F0;
	Thu,  2 Jul 2026 10:11:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A414B47DF8F
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:11:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782987072; cv=none; b=mP94e2ZWSlx0A8iq6IEZJX7Rulq5JYGJ0gyfiwy2mBeFVeL+nICAqqzFPPYQmwwajIxzdrdJzXHM16cLlY5j15eAecNguDHXB/PQP76RDnxqlaE+a9bvpMDq4PSyzRRXg54yyFJCbcC5zvdZ5AF72TCaqmdeWjldwfeNPbK0GfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782987072; c=relaxed/simple;
	bh=qhf4FJ3odKS56QxVuWRfD31f5/JvheIY33dz3gwcHeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p+9XaaAm8r+7Edyk06N8puckNTM2ZC6oG14AsOQki7PaFXyDBai5bbCd4RXgMXBG10SwPv/ChVf+HyiBIF7cAcmtijr4oBXn0T0qHyDHqOF6pjgemfaxyLu+zUxGC8KfP/qw6y41h6mtobBnGKS24uj/40Req2eObAn083iap4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jE/O8SMf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eW0wMM8T; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629nNeO4139475
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ke6SoKxqJ09nAQTKH6WMSBqtr3TiErZcgSc9Of5cKMo=; b=jE/O8SMf51onCh5h
	sC4+NROafsbjjJi3N/E4sl8Atcr8XIV4YEserGMNTIN23zUr9SAhKKsYvS+6PYXq
	NEL2plkyWXYGQL0nNNiTQLGzHi31bKV0cJWb+B4si9wMJHUrdeB1uLgqyPQjaLre
	8qOP9xteKareNTzDD8oOauciCWG7yNhAs6UeieUj559eR99csCzvMQW1jEz6S6Jo
	xWvCXSA3gv/66S6vp9oxY8fmpnq2ycWOTJpW9qu3Ed3UIcrUO6d4gCxRyorcSWYz
	+WLs0weh/7R2jFQc23p68AjeHCRQWU7K+xz73L/QlA3H5QBCORjbPTUBi/3w3Y9F
	7G7uGA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npr82uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:11:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c98a4ded1d7so1119086a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782987069; x=1783591869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ke6SoKxqJ09nAQTKH6WMSBqtr3TiErZcgSc9Of5cKMo=;
        b=eW0wMM8TazZmumJckVxYp9tzBgn1vcNkBw/bdhwk4ajLo9poTTB+BwKPpIviWgPXUN
         a2KMC0wEbv29nsXWOtZj7fd7PArpoJu9gfE4QKj87tu+FoCSo94Q4jtmtCn5iL1Dz9nr
         InLNUmEzYIZpLoq/qkEfaDYNOyEpHO+P9A9dVELxWIdhhoHZH3PsVqt/LJ7hLTXu7Jtj
         SdG0LYMmHPfin1hVVZ4Es1Ow1XC7CPaQk6sKs5QvguL6MIS7fTVl2E2jLQF4tvRz1Liy
         0u6B4RSOM9uIIZ8GKaNWAzZBonQYlrqT1i87g37o0O+P7edK/OGPRsrZtKt5xBsUFms3
         dLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782987069; x=1783591869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ke6SoKxqJ09nAQTKH6WMSBqtr3TiErZcgSc9Of5cKMo=;
        b=nOEpGuV0uvNaIvtZh2iB2ztNrMCgKFI73V8tVyWIJYY6Iirn7J0vHX01qybaWueIko
         taMHo+crmsOLML0cB1CTNzj9g7GOqjM9PC16QYKxnszfZAxuzYuOWpuvL11rQoO40eV9
         Z9LWdKlZ7d6DzlPp+xsuDPY2X3nqp6oiEnrIMqCwO2eCvxTAudFijRU9oxlGzFmiqc6o
         wHSmWsv3RE0LlTKcLJUz0hwjfqbBRs42/q8K2uRopQUkfGN9SzZgPS8ORbbc2iydsnWE
         PsgNvikhZkodrISoBRfCPFixsqcr177CSgdV6GSI8S/CyMxb12X0tzR0LJTvf/6dtIik
         Sbzg==
X-Forwarded-Encrypted: i=1; AFNElJ9UGboLKj5mfJdjYRkAJR5l3O+KWSEOuIc2O7ysoU2XYGVEn2tGwPwY/omuBTeEirhbpddpv+/3lKAWcsb6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/So6niizr7dkJBwZLpM3wgLUfOG0x4RYT8GHvyVtYOrH6ayYB
	luxx/JEMlSq5ThofKhfTqUK7wwEwVFvjnFOPvt17Zvqxx2GuSbbPlQ58HQjfB7JJTRoXd8EhSfc
	v1AN4m190eReT0IMRoAOKDjnu1RhuseZyB7ZANPlbCope9d8BC2WuztZSiqZf6cCyK2rG
X-Gm-Gg: AfdE7cltk798yGXvmF46xhuliO3KYT4ma2bFC7nunV5QVrjI1dApmAt7yKuaWcCSugE
	Tam7Q15OrRL2P5ysefAelMS3abpoZiOua3sA2fU6VdbfTt7690wNduA2GHKSpagkNsTMxYTJRij
	hMP2lZKjZlqrRqXfQeLtOoczEniCVKduP7KHGdRWKg/mssnU7xddlejEiNY1vxXsd7XdIPptcP6
	wAjdkDnTct57aKM8jSlHItESca4CALacRWw2Vgt89OHft9GTjWLN5RHGV42mAMNWYXmBSTAmCVk
	+DfQi9yldmOlne/z6uobU5UKlQPN7SCBbA40ARJqZhsE0Vv4q32YCB2dr4v61qJ8Q/1PKAW0R35
	2Ju9vLhl3bumM6NmOt1ZW7Zzv5yXbs8cdriWSm9md
X-Received: by 2002:a05:6a20:258f:b0:3bf:8b8d:3151 with SMTP id adf61e73a8af0-3bfed3efa54mr6561684637.44.1782987069023;
        Thu, 02 Jul 2026 03:11:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:258f:b0:3bf:8b8d:3151 with SMTP id adf61e73a8af0-3bfed3efa54mr6561630637.44.1782987068440;
        Thu, 02 Jul 2026 03:11:08 -0700 (PDT)
Received: from [10.218.39.201] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e926a7066sm1075080a12.28.2026.07.02.03.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:11:08 -0700 (PDT)
Message-ID: <ca635179-eb3c-4a5f-882c-065deaca155c@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:41:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] Bluetooth: qca: add QCC2072 support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, rahul.samana@oss.qualcomm.com,
        harshitha.reddy@oss.qualcomm.com, dishank.garg@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260529175822.3366535-1-yepuri.siddu@oss.qualcomm.com>
 <CAMRc=MeUhtNiMQLeMwvF_v+WOaiVgF+jsTM1HPZd_XdkGk3txA@mail.gmail.com>
Content-Language: en-US
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
In-Reply-To: <CAMRc=MeUhtNiMQLeMwvF_v+WOaiVgF+jsTM1HPZd_XdkGk3txA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: b4gBKhc8lRA0Wk6-bjmD9yYe7rJucEw_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwNSBTYWx0ZWRfX48Lc3M75+g12
 On55eHLbE+sVKxz8RsUvkgD00KVyZ8RLyE2fx17USZrH0lUnAYYAaGvdImnowCazYJ26lfoDBxC
 mQBTkWDA/nc/ppYNnNE/m5RSZpBNmog=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a46393d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bST5VZXYjKSMy1wPTP0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: b4gBKhc8lRA0Wk6-bjmD9yYe7rJucEw_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwNSBTYWx0ZWRfXzDsIhE+ppHRu
 9ggnJZA3IkVIunPO/FuE8s2x9gHlJAiqlUGfqv+HXMdWQYnnZuMwAaGjjuS8LSfu9lJ3DdWZlmV
 yvmDUBP5L8Dz6H2n2bIGbnisGNH2OmTC69RCoE5BFd9KQ1Nf3lHI9kE5ZYCuQ9wzOfeHc2f+XVL
 QwyUrEJQ6VwNIIj/zyfUyapqjkJXgLXEHdZL/gYu11Gb6JcWWM9S8GKI9qQ50IEZ1XslWUE2GqT
 Y5GY/acfYf6lL3IYMfiFw92JUpPyNn//FN6CgtV+lj3+WUeaZag2wjQl/IGL9zOy3hMtj5OpN8D
 SznizTH3XqWhei8SOEkJ8ncI9uo54F8VprCVQ3sFca6jv8b3EjOos9GoBWck7WFeaoEPHWuGufy
 K1IJYNZMMHa+KYSnKNjOV/oFfVFuA6lHB7wOOg5DqleBSxgRShJlB5DTiHmkU1zypZd4vk69UhQ
 FmwXXHL5ImKGNA/WKmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115927-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,kernel.org,quicinc.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[yepuri.siddu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:quic_mohamull@quicinc.com,m:quic_hbandi@quicinc.com,m:rahul.samana@oss.qualcomm.com,m:harshitha.reddy@oss.qualcomm.com,m:dishank.garg@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yepuri.siddu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0B2E6F6391



On 6/1/2026 1:57 PM, Bartosz Golaszewski wrote:
> On Fri, 29 May 2026 19:58:22 +0200, Yepuri Siddu
> <yepuri.siddu@oss.qualcomm.com> said:
>> QCC2072 is a BT/WiFi combo SoC that uses different firmware
>> filenames and requires no external voltage regulators, so add
>> it as a new SoC type.
>>
>> The chip supports the wideband speech and valid LE states
>> capabilities. Its firmware is named using the "orn" prefix and
>> follows the standard rom-version-based scheme:
>>      - qca/ornbtfw<ver>.tlv
>>      - qca/ornnv<ver>.bin
>>
>> These firmware files are already present in the linux-firmware
>> repository.
>>
>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> ---
>>   drivers/bluetooth/btqca.c   |  9 +++++++++
>>   drivers/bluetooth/btqca.h   |  1 +
>>   drivers/bluetooth/hci_qca.c | 24 ++++++++++++++++++++++++
>>   3 files changed, 34 insertions(+)
>>
>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>> index dda76365726f..0ef7546e7c7a 100644
>> --- a/drivers/bluetooth/btqca.c
>> +++ b/drivers/bluetooth/btqca.c
>> @@ -843,6 +843,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>   			snprintf(config.fwname, sizeof(config.fwname),
>>   				 "qca/hmtbtfw%02x.tlv", rom_ver);
>>   			break;
>> +		case QCA_QCC2072:
>> +			snprintf(config.fwname, sizeof(config.fwname),
>> +				 "qca/ornbtfw%02x.tlv", rom_ver);
>> +			break;
>>   		default:
>>   			snprintf(config.fwname, sizeof(config.fwname),
>>   				 "qca/rampatch_%08x.bin", soc_ver);
>> @@ -937,6 +941,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>   			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>>   				 "hmtnv", soc_type, ver, rom_ver, boardid);
>>   			break;
>> +		case QCA_QCC2072:
>> +			snprintf(config.fwname, sizeof(config.fwname),
>> +				 "qca/ornnv%02x.bin", rom_ver);
>> +			break;
>>   		default:
>>   			snprintf(config.fwname, sizeof(config.fwname),
>>   				 "qca/nvm_%08x.bin", soc_ver);
>> @@ -999,6 +1007,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>   	case QCA_WCN6750:
>>   	case QCA_WCN6855:
>>   	case QCA_WCN7850:
>> +	case QCA_QCC2072:
>>   		/* get fw build info */
>>   		err = qca_read_fw_build_info(hdev);
>>   		if (err < 0)
>> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
>> index 8f3c1b1c77b3..a175ac31e7b2 100644
>> --- a/drivers/bluetooth/btqca.h
>> +++ b/drivers/bluetooth/btqca.h
>> @@ -158,6 +158,7 @@ enum qca_btsoc_type {
>>   	QCA_WCN6750,
>>   	QCA_WCN6855,
>>   	QCA_WCN7850,
>> +	QCA_QCC2072,
>>   };
>>
>>   #if IS_ENABLED(CONFIG_BT_QCA)
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index ed280399bf47..fc67ba0e4984 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1372,6 +1372,7 @@ static int qca_set_baudrate(struct hci_dev *hdev, uint8_t baudrate)
>>
>>   	/* Give the controller time to process the request */
>>   	switch (qca_soc_type(hu)) {
>> +	case QCA_QCC2072:
>>   	case QCA_WCN3950:
>>   	case QCA_WCN3988:
>>   	case QCA_WCN3990:
>> @@ -1459,6 +1460,7 @@ static unsigned int qca_get_speed(struct hci_uart *hu,
>>   static int qca_check_speeds(struct hci_uart *hu)
>>   {
>>   	switch (qca_soc_type(hu)) {
>> +	case QCA_QCC2072:
>>   	case QCA_WCN3950:
>>   	case QCA_WCN3988:
>>   	case QCA_WCN3990:
>> @@ -1510,6 +1512,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
>>   		case QCA_WCN6750:
>>   		case QCA_WCN6855:
>>   		case QCA_WCN7850:
>> +		case QCA_QCC2072:
>>   			hci_uart_set_flow_control(hu, true);
>>   			break;
>>
>> @@ -1545,6 +1548,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
>>   		case QCA_WCN6750:
>>   		case QCA_WCN6855:
>>   		case QCA_WCN7850:
>> +		case QCA_QCC2072:
>>   			hci_uart_set_flow_control(hu, false);
>>   			break;
>>
>> @@ -1861,6 +1865,7 @@ static int qca_power_on(struct hci_dev *hdev)
>>   	case QCA_WCN6750:
>>   	case QCA_WCN6855:
>>   	case QCA_WCN7850:
>> +	case QCA_QCC2072:
>>   		ret = qca_regulator_init(hu);
>>   		break;
>>
>> @@ -1957,6 +1962,10 @@ static int qca_setup(struct hci_uart *hu)
>>   		soc_name = "wcn7850";
>>   		break;
>>
>> +	case QCA_QCC2072:
>> +		soc_name = "qcc2072";
>> +		break;
>> +
>>   	default:
>>   		soc_name = "ROME/QCA6390";
>>   	}
>> @@ -1980,6 +1989,7 @@ static int qca_setup(struct hci_uart *hu)
>>   	case QCA_WCN6750:
>>   	case QCA_WCN6855:
>>   	case QCA_WCN7850:
>> +	case QCA_QCC2072:
>>   		if (qcadev->bdaddr_property_broken)
>>   			hci_set_quirk(hdev, HCI_QUIRK_BDADDR_PROPERTY_BROKEN);
>>
>> @@ -2013,6 +2023,7 @@ static int qca_setup(struct hci_uart *hu)
>>   	case QCA_WCN6750:
>>   	case QCA_WCN6855:
>>   	case QCA_WCN7850:
>> +	case QCA_QCC2072:
>>   		break;
>>
>>   	default:
>> @@ -2166,6 +2177,12 @@ static const struct qca_device_data qca_soc_data_wcn3998 __maybe_unused = {
>>   	.num_vregs = 4,
>>   };
>>
>> +static const struct qca_device_data qca_soc_data_qcc2072 __maybe_unused = {
>> +	.soc_type = QCA_QCC2072,
>> +	.num_vregs = 0,
>> +	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
>> +};
>> +
>>   static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused = {
>>   	.soc_type = QCA_WCN6750,
>>   	.vregs = (struct qca_vreg []) {
>> @@ -2268,6 +2285,7 @@ static void qca_power_off(struct hci_uart *hu)
>>
>>   	case QCA_WCN6750:
>>   	case QCA_WCN6855:
>> +	case QCA_QCC2072:
>>   		gpiod_set_value_cansleep(qcadev->bt_en, 0);
>>   		msleep(100);
>>   		qca_regulator_disable(qcadev);
>> @@ -2414,6 +2432,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>>   		qcadev->btsoc_type = QCA_ROME;
>>
>>   	switch (qcadev->btsoc_type) {
>> +	case QCA_QCC2072:
>>   	case QCA_QCA6390:
>>   	case QCA_WCN3950:
>>   	case QCA_WCN3988:
>> @@ -2434,6 +2453,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>>   	}
>>
>>   	switch (qcadev->btsoc_type) {
>> +	case QCA_QCC2072:
>>   	case QCA_WCN3950:
>>   	case QCA_WCN3988:
>>   	case QCA_WCN3990:
>> @@ -2484,6 +2504,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>>   		if (!qcadev->bt_en &&
>>   		    (data->soc_type == QCA_WCN6750 ||
>>   		     data->soc_type == QCA_WCN6855 ||
>> +		     data->soc_type == QCA_QCC2072 ||
> 
> Looking at the bindings: this chip cannot have an enable GPIO, so it probably
> should have its own if branch that unconditionally sets power_ctrl_enabled to
> false?

QCC2072 is an M.2 E-key chip. As M.2 Power Sequencing changes are being 
upstreamed, we will reupdate our existing patches to align with M.2 
power sequencing approach.
This includes aligning the bindings, DT and also BT driver changes.

Thanks,
Siddu

> 
>>   		     data->soc_type == QCA_WCN7850))
>>   			power_ctrl_enabled = false;
>>
>> @@ -2492,6 +2513,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>>   		if (IS_ERR(qcadev->sw_ctrl) &&
>>   		    (data->soc_type == QCA_WCN6750 ||
>>   		     data->soc_type == QCA_WCN6855 ||
>> +		     data->soc_type == QCA_QCC2072 ||
> 
> Same here.
> 
> Bart
> 
>>   		     data->soc_type == QCA_WCN7850)) {
>>   			dev_err(&serdev->dev, "failed to acquire SW_CTRL gpio\n");
>>   			return PTR_ERR(qcadev->sw_ctrl);
>> @@ -2570,6 +2592,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
>>   	struct qca_power *power = qcadev->bt_power;
>>
>>   	switch (qcadev->btsoc_type) {
>> +	case QCA_QCC2072:
>>   	case QCA_WCN3988:
>>   	case QCA_WCN3990:
>>   	case QCA_WCN3991:
>> @@ -2779,6 +2802,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
>>   	{ .compatible = "qcom,wcn6750-bt", .data = &qca_soc_data_wcn6750},
>>   	{ .compatible = "qcom,wcn6855-bt", .data = &qca_soc_data_wcn6855},
>>   	{ .compatible = "qcom,wcn7850-bt", .data = &qca_soc_data_wcn7850},
>> +	{ .compatible = "qcom,qcc2072-bt", .data = &qca_soc_data_qcc2072},
>>   	{ /* sentinel */ }
>>   };
>>   MODULE_DEVICE_TABLE(of, qca_bluetooth_of_match);
>> --
>> 2.34.1
>>
>>


