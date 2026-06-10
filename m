Return-Path: <linux-arm-msm+bounces-112287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H4kpIfr6KGrBOQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:49:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 043E6666014
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:49:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NUVzOcUL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=judfPwXv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112287-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112287-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F93A3070546
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 05:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02281346AC4;
	Wed, 10 Jun 2026 05:49:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67C83438A2
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:49:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781070562; cv=none; b=io8XzatTntszfv9mf8hwmjACT4DieVzizh81i4JPK3sU8wEYntt76ugFH/SzNiMgnOzJxD9nUeoWaNwQTNo8+PpBICEXVcUm3qnHYbGib7y4hbVO72JnYxbZknw1NrqGnzH4rWXlmL2ZMOjDcisYFWKvxf4Gf5ECWV6wGOz7rR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781070562; c=relaxed/simple;
	bh=M/+7sUnN4Qu4nr2okedlB3kcRu8o9Bs9uUb76BHARbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e3nSZdYD9GhYTRfA1tAVdFqcKnXal1WhlmZWXLbsd/Q/ehB7Rd5FxsMct/I/xkMHvbLV7/J3hWHhnb00DZA81adqDFwOjC5XvWd9oP0dKCJXD8Kwk7HqYFZrSuRgRz8j/9fVjRzZ6BIU4JkU5hEQc+libn3bnWiYwg+zoI9u69M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUVzOcUL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=judfPwXv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2eiao2481678
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EMWmK5emWJGvZztDxkAIu+IFZAwY1JG7AL7lYcHzAWc=; b=NUVzOcULPyvy4DZB
	6LA+kjNReaIHS4JKoQLI3mVFc2Yswty+kLemf0cF4SFuj8BbmI2J6LsrBkdZNht8
	TVMImXcmsteuH0tkvi8ML5Ldf9PC5niIv7qysnE26JA+QEt0Bgu1sUYcqKtR4k65
	V8Q4vL7wBK5NHGW/tOMXzgAnnFcVJO2DV5BFj5TdBhV0sKZwuS2UvLYeO8a8se2G
	2GmwGZuVTxrbNGbvKTDwnwwJkdhwd8674GT/h2li+cruh2LH43eD8zSfzAIA1kjP
	yeBbo2ANdadmEPmhg50QFuy/+8F2OHuWAv3DJidRvC3vd7faTfAD3O56JoOLw+Qw
	3L1fjw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnerwey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:49:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915b3587972so533897485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 22:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781070560; x=1781675360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EMWmK5emWJGvZztDxkAIu+IFZAwY1JG7AL7lYcHzAWc=;
        b=judfPwXv4I/Y517wuAQNTZD1eGmy3wuGPmlXSHqO5ML6RUxaxWf6NZUB46rtEWcL07
         BXkFO3sPKuIV+X9lUyPK1/E411Q5rdqHqlaFAyjG4WLj83JgkHJ+4scP+YH79IsfcaCy
         03v9dwaL3lRBpl2jnh/mjeSl2GARcR1gyVGytrUTL1ePiNq21fEG/EpPnKOlbSC7msYL
         735X1YnTQ3eFX74GvDTljsFUU/mzY0f+caFLJVtbnnlbnH9JxfgWT8bsmntCeSojTPgU
         mBoGQ6j8NHN53i6x/+AaIUDwqvFr/uzmekGLDoHNlIWHjsEuy6QVcc68DN+gXZUNC64a
         5X5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781070560; x=1781675360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMWmK5emWJGvZztDxkAIu+IFZAwY1JG7AL7lYcHzAWc=;
        b=Bk7+fUUKqSPx6m6GBg+d8hwc76Y5a8XosGMZ7BbCwOIlqbonP4aHUGoEDVDP7QoDFF
         hPr3MmEX2BKlHMfM0v5xaz9u5dHP3YUsKXKHDs0vQVx9t4iLSAnXUjVyCPtoQyuI1AIP
         QnOBH+X7rwdcQaKBAxQWDnQFT+SVM8VxifdWkTj1H5Knx/ifpzJBh0Md5suy/NXNa4gn
         7IfuaZjWNGS75AZsPqSAdsBpGduVKKapdP3t7GouaFxLNuLWXQi2Q+wBM6lvpYbVxoKz
         iTpmXA7y1PxIx1nXz51IHrNrGb+/offTmxkNz3SPz9emmQf7Qle6FhzR4qxBtyaQiHJ9
         I9mA==
X-Forwarded-Encrypted: i=1; AFNElJ+ux+FWEV+WRoNcIDdg7jJF8svciMpVI+FdMCrApRtZOD3lYBJbTeu0loFWmqabAWdkXF2I2En7gAHIIPdk@vger.kernel.org
X-Gm-Message-State: AOJu0YxR4k726HySJXADdKqmFbcA1nFSJP+GDeyj6cUmsyRUdDuT/qb2
	8jaSCC4MbnGWjeBTuSj+wD9DWGumcatnteCjSo6ikaLdLVxascB+9N1ufB/W06EkHK56asEBTpe
	/Kck4THO5clsi2rajZ+k7qzPyPA83ebncumhzTPQhqxdFP7X+JW84kX8DC27oCkHj5NEl
X-Gm-Gg: Acq92OGDpnbcSSNpj79QZS4/ovBrlzuBZUz5tYcLsUMhlzSG6LLU83NF0s6ecIu4WX0
	lokJXwURiUlOdE14KejH8QR+K2EvS6u8JF0HG6vuADi77pVoQF16xxaWKjvsn6Uc5mQZJOlfvZN
	6E97LGz+E9o2dig6epdZn7p/24ehNDkGghje5M0r794bR91ZkC6Bcs+6eI/bK587tOCPN01fgbs
	VOov8dwoyA0CvfvYFBCVesy4y+s98XKImGFGXURWH/LZKE450VWjgEdxe1vwdA2FZlShdvnH10z
	fLOHxJxONSROsiXag3cKuwWDmN/QFCsI5yoIdqtpZHQjVb3iyFk/fKmcvH0FEYMAQiElayNB7qo
	/HTRP1CrJ2dtCixkgtDw/DQ0Fln1ZlZ8Xzmo1eI6hCGUvSJvDtmWLQj2X/us=
X-Received: by 2002:a05:620a:6310:20b0:915:b852:435a with SMTP id af79cd13be357-915b8524853mr2168176785a.21.1781070559952;
        Tue, 09 Jun 2026 22:49:19 -0700 (PDT)
X-Received: by 2002:a05:620a:6310:20b0:915:b852:435a with SMTP id af79cd13be357-915b8524853mr2168174585a.21.1781070559455;
        Tue, 09 Jun 2026 22:49:19 -0700 (PDT)
Received: from [10.239.31.31] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3d3a0esm2372244485a.40.2026.06.09.22.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 22:49:18 -0700 (PDT)
Message-ID: <a54b1605-0468-495d-81a6-471a73a29848@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 13:49:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: qca: Add BT FW build version log
To: Paul Menzel <pmenzel@molgen.mpg.de>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
References: <20260609075417.1160702-1-xiuzhuo.shang@oss.qualcomm.com>
 <CAMRc=Met_U-1gDmGFM9hSWFc5vvs4SuRQOa3hZcfUo190rh59w@mail.gmail.com>
 <8697f148-5e21-44b4-a949-9d348e39c2ea@molgen.mpg.de>
Content-Language: en-US
From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
In-Reply-To: <8697f148-5e21-44b4-a949-9d348e39c2ea@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wiBBRLOFwXJRCB2sappBdfbiv0duLQ9D
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a28fae0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YkWQNLFlkgeSvEFMcyIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: wiBBRLOFwXJRCB2sappBdfbiv0duLQ9D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1MiBTYWx0ZWRfX9pCNCE/P18nK
 32q1lbWNjNGPp+pCWtCvVFkQL0bSx+YgUd3x6o/6s9d8tqKojGq1uZxpht6zwA80FHp5T2vPgPe
 /BppPBG8IHZumMBFK3AKFrW12CFjzahvzlhh0hnjCP7OIYQZc36JnQ+ZuvmDrfA7FVkK8ouabcF
 /CGkx2S5ygA29oU2uDtLPDzamoxuZKmwci8c3G4SjHIzmGhqqVMqo7muS9/WgSfshXfRfEJN4WY
 9kvT1D2w7KrBY1ntf3ZljSozWR4oegCT4xNCVy/U70g8LhpmLKj//MvkHg3u7BZAfjF3jJHYxaR
 nztsB4ymOfYAo0cih3Ube3XFCOh8JR/T6AM2Yn71vaSQRvlPyaMqywzAs9Jbt2dabJEo3ZR8aK3
 3bdTvsFtXp7bBrm02WXeMHtQ/MnRvz7cn56w8xUTzkWmBcr4PzYRxcbrnsXzLjqyveNdyIHJzHo
 Utw0IOlWheP/3HkA3ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100052
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-112287-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pmenzel@molgen.mpg.de,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cheng.jiang@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[xiuzhuo.shang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 043E6666014


Hi，Paul，

On 6/9/2026 6:29 PM, Paul Menzel wrote:
> Dear Xiuzhuo, dear Bartosz
> 
> 
> Am 09.06.26 um 11:39 schrieb Bartosz Golaszewski:
>> On Tue, 9 Jun 2026 09:54:17 +0200, Xiuzhuo Shang said:
>>> Printf BT FW build version log after BT FW downloaded.
> 
> Please paste the new lines, so reviewers see how it is going to look like. Please also document a motivation (answering Why?).
Thanks for your suggestion, I will send PATCH v2.

> 
>>> Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
>>> ---
>>>   drivers/bluetooth/btqca.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>>> index dda76365726f..04ebe290bc78 100644
>>> --- a/drivers/bluetooth/btqca.c
>>> +++ b/drivers/bluetooth/btqca.c
>>> @@ -143,6 +143,8 @@ static int qca_read_fw_build_info(struct hci_dev *hdev)
>>>
>>>       hci_set_fw_info(hdev, "%s", build_label);
>>>
>>> +    bt_dev_info(hdev, "QCA FW build version: %s", build_label);
>>> +
>>>       kfree(build_label);
>>>   out:
>>>       kfree_skb(skb);
>>
>> This string can be read from debugfs, do we need an additional message in the
>> kernel log?
> 
> In my opinion the firmware version should be part of the Linux logs, as that is what users share with bug reports, and you do not want to have several cycles collecting information. For example, currently for QCA6174 it’s currently:
> 
>     Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmware rome 0x302 build 0x111
> 
> 
> Kind regards,
> 
> Paul
> 
> 
> PS:
> 
> ```
> $ sudo dmesg | grep -e ath10k -e Bluetooth
> [   17.880668] ath10k_pci 0000:3a:00.0: enabling device (0000 -> 0002)
> [   17.883428] ath10k_pci 0000:3a:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
> [   18.138972] ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:1535
> [   18.138977] ath10k_pci 0000:3a:00.0: kconfig debug 1 debugfs 1 tracing 1 dfs 0 testmode 0
> [   18.139068] ath10k_pci 0000:3a:00.0: firmware ver WLAN.RM.4.4.1-00309- api 6 features wowlan,ignore-otp,mfp crc32 0793bcf2
> [   18.206593] ath10k_pci 0000:3a:00.0: board_file api 2 bmi_id N/A crc32 d2863f91
> [   18.221145] Bluetooth: Core ver 2.22
> [   18.221802] Bluetooth: HCI device and connection manager initialized
> [   18.221807] Bluetooth: HCI socket layer initialized
> [   18.221808] Bluetooth: L2CAP socket layer initialized
> [   18.221813] Bluetooth: SCO socket layer initialized
> [   18.258187] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_00000302.bin
> [   18.258192] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmware rome 0x302 build 0x111
> [   18.301557] ath10k_pci 0000:3a:00.0: htt-ver 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
> [   18.381567] ath10k_pci 0000:3a:00.0 wlp58s0: renamed from wlan0
> [   18.619003] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
> [   18.643646] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is advertised, but not supported.
> ```


