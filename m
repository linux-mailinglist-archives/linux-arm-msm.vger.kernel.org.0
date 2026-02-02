Return-Path: <linux-arm-msm+bounces-91471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIpqOxN/gGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:40:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54566CB184
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3420230421F6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADD53596FF;
	Mon,  2 Feb 2026 10:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJns/8Tk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WDg/Z4rH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565933570B2
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770028574; cv=none; b=oU8OEn5s9xoriy673uE3hrbZrAEVYI73o665FZniX2WmjdMl8zgjppUUyux371YhU2n4+zHhJ9H2Shy73TNRNGK871kKCyWnBTYjz6FNA/Lw2C5RBpqykLXZtv2awdpp8BwFLoBademQxtOfZ424LRNMhJ59odzyNHFjZPiT1LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770028574; c=relaxed/simple;
	bh=FosmMl52kohzY6afTU1vkIlJ0gn19sk6eaFQYBcXkJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AMgATyUmg2Sxo9lmOkjZQTm+0uH5DL41y0sJF3ciErorzGsHAfQgsWwAEIMwXs+KrXVua8bIkTmiT46qja/ez7+rro+4XblhRtlbRXv0befjPDNRnFB0eqWfIi8OAqYrZpsE1F9g57arPB30V98oAELAeJMZTzB1yPGk2CJpKX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PJns/8Tk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WDg/Z4rH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61286ADe1239687
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dhGFLwuXIZCh4jkxsmkOL/V1To6Oi3T59/a2YuiPHU8=; b=PJns/8TkokRcUMY3
	jKAiZFAnHaQaAY//ieOkRn+aW9dk3eCOAq8lagFMKh4QP3LBsE3HExhlLjR63d5l
	8LsL70fcF3ybVGt+1g0g2en8YqUtTJscjSEkJZVAnycUiP8+fwr+++zFFUw3StKe
	PAvB9s5EF+VMSsj0a96An/uueinbem/yH3qBCt9JxE+LsHnlxLSjxw7hyB78SyLE
	DK/cXeEF2ZWCBJdSt9zWjb2Cbr7wrrjSfdCBBWEShHBG+evEzHQlslFKCFFsWzvv
	C7AYyE1m4T3szviLVCG7LWIkXFEP/K28Y/k/EQvFVqmMBhwCF3QgYUYuL5gN74qE
	Q8P8gQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as4w3rw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:36:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c533f07450so105616485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770028568; x=1770633368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhGFLwuXIZCh4jkxsmkOL/V1To6Oi3T59/a2YuiPHU8=;
        b=WDg/Z4rHnwlZE6gutMhcKHFAwVE8XKgZVGI+nFGiJD4v9PIyxDrp04x5OsjvUiidQg
         TKqImhoyZ2PnZZM8JqgOdJ/i74GXqgayq5l77QALQkLfFHuzJsGle33FVrrp7t/6w49j
         pARmQXoDLty6iKX4HHASYeYhhnFPNTzqki9mrn/OkNP1hNmn+8IfYwUO1HgvA1Kpv0od
         8OffISw7HgOTBc0NkOHbIcRQD+ZNBlYEhpxmVKioLdekhuTGta1pazL5mmHaI+bPtUUI
         bxfePOStFtEzbAwXknsaonH9pP2E9wXLF0wn2QB47HjlxfxcaP9btpw/YLAzfhICd75e
         Zslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770028568; x=1770633368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhGFLwuXIZCh4jkxsmkOL/V1To6Oi3T59/a2YuiPHU8=;
        b=FSPa/ha1W/XO106asfN4HhChslXiVVU15pQXd8V1S3e+RBKG3Ui8oij9RFySIZ91e8
         2t2kNK+b9Ggz1ZJLzb7Si2ae2tVfaFnizE6R4N7I/YQvC+H51IWSQYB/ZzbQxXHdWEOs
         WpGeLA+w47l7P9HhDPxXsUJx+at77khn1rWBi7bPw1C6AA+JYu7EDPXsaZ8EOaBfnY1L
         B7p8MDid6zh93pBoaVXlV+Lvs1l3NKR7yM/B7V/oPuOcxqeqCCKRxyxQlQ8OWnbumMPI
         81SnM2Qo1AHiC20iyPJD8B2e86kEKuvQNsQnp3/GPU0LEODSYibsLUxy+RxW7sdXxcOB
         8j+g==
X-Gm-Message-State: AOJu0YxJ3lYO2bOXem0PM54fzUu9Potc2czvpl+KgdtXKq7fNK7K8Tar
	or6w+g/pDYil9lcuRpOkZALagBPOxZt25BJ9n+uSdx6XE55SDxshC0zhcIxizkFSNO1xPhW5LAG
	6315Ydcb0tHOGPjNHLUv408PeBTooUTLVqL7n2KSKW/Q3isrYPvFrjsTj1bbBfbdb4d8OfG81CB
	7+
X-Gm-Gg: AZuq6aLheec/hbD9OxwPSNBEDFZgCTzSQ+CeoV7w/+0HLsNv8DYFiAEmX0WkeNQjzml
	2gftPqrwBWvPsv2MCG0aPF9W07rHnuFpi1Z++UvUxwucYLyYkJ9p3T6dD0T9JhlQCKQCZRoZoHa
	gipXD/mVmhxe+QpmOITgDO4Z56cX82Uywzfjqg3MxhSvdRU/trI3bV5PtRRy9LXDQ45P6MocJ9W
	wEkTuySvU1PnfCNNplj7cscdKje/YsOZ0YYDX8ro4ycFL/gT17DrRRefNPCGDXJ/ji71QSv6qcc
	KC8xPgNXn9/Io188hHnFosLMTXPOLvKr9PqGbJpbBSiJRlBDqMt5zSA8/0H+wNCRTlV/6CiC0lD
	PkaIjRheU6DXcdyzK2VnpA7iAeg9xTIQUWgwR70fHGXbYbKsDiWpiQKpyjg4kaRqauQo=
X-Received: by 2002:a05:620a:4141:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c9eb2b920amr1088080785a.5.1770028568026;
        Mon, 02 Feb 2026 02:36:08 -0800 (PST)
X-Received: by 2002:a05:620a:4141:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c9eb2b920amr1088079685a.5.1770028567511;
        Mon, 02 Feb 2026 02:36:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46ae22fsm7543699a12.35.2026.02.02.02.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:36:06 -0800 (PST)
Message-ID: <24f770ff-e4a6-4f8c-be72-26ff5cbf8d1a@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:36:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Questions About SM8550 Support
To: Aaron Kling <webgeek1234@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <aa90c5ca-72d7-48fb-b3b6-4be8a51dc0cc@oss.qualcomm.com>
 <CALHNRZ_SjzLVoZ5qf1tzDFqRtnZWRaBWyytyrjA=dbyHWekAQA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ_SjzLVoZ5qf1tzDFqRtnZWRaBWyytyrjA=dbyHWekAQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oMiH9Fp-Sjn44DlP877C_SKaquIQZh7N
X-Proofpoint-GUID: oMiH9Fp-Sjn44DlP877C_SKaquIQZh7N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NyBTYWx0ZWRfX5GR+2704kF6M
 Va7aIgF6QPFL96vMZs4vMS2n7NKqu7uLsF8/3ZAMhgY+w7n87y8p7c5sfq35iUNdc9RwwK4e/c8
 TvufK6HexopZRMNv0PWYjZ05j95dUtMYk8m4YoiajhMiSJeSDHyCvwxmijkhEcK2GIWk4JQPrZy
 DJt7DgCGZu2Mf2G0JrAdZXGtSaZKtIQj6jyaictTiH81lyJg7QS6MmE7mrhSAODlHdBVabKSfEf
 yjbR3MvcG00135OgPVNVvmURsR28MmissjUIHXJfj9iUXHRecugU4DQb0nFbBTc6ScEHwSIisbK
 VzZof0KNepNkAd4CMGog7+maTCDb4jjeEDi+g9ESYkNb4KizyZbcL4WFiWt/Hs8Nc/VGPaU3Z4h
 /IaJgl0n7BgplTkximMQUmf3FrCCHxIIu0cDVq9TQFzxdzWDqk84XnclvdyoeWv2NCiBuwXFPTO
 P5DQ1nM/CZUH6pOGVxA==
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=69807e19 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZD8lPOToiCuzMJ-KG_cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91471-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54566CB184
X-Rspamd-Action: no action

On 1/30/26 6:13 PM, Aaron Kling wrote:
> On Fri, Jan 30, 2026 at 5:01 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 1/27/26 11:48 PM, Aaron Kling wrote:
>>> I am working on the AYN Odin 2 qcs8550 series of devices, specifically
>>> for Android, using mainline kernel drivers. I have come across some
>>> missing functionality and failures that I would like to inquire about.
>>>
>>> * ABL fails to load a dtbo using a baseline dtb unmodified from
>>> mainline. Using changes described in the gunyah watchdog thread [0], a
>>> dtbo loads and the devices boot as expected. If any of the changes in
>>> that post don't exist in the base dtb, abl will fail to load the dtbo
>>> and go to the bootloader menu. This appears to be an issue in the
>>> baseline abl code, affecting all devices of that generation. Would it
>>> be allowable to merge a change adding those changes to the sm8550
>>> dtsi, allowing an unmodified mainline dtb to work with overlays?
>>
>> ABL is.. picky.. to say the least
>>
>> Could you please try to check if what once worked for me on a
>> 8550-based Sony phone would happen to work for you too?
>>
>> 39c596304e44 ("arm64: dts: qcom: Add SM8550 Xperia 1 V")
> 
> Is the question if the devices boots without dtbo? Yes, that works.

That's nice!

> And fastboot erase even works too, though that may be because I'm not
> using appended dtb, I'm using dtb in vendor_boot. The setup I'm trying
> to use is a base dtb that has all the common nodes for the AYN qcs8550
> devices, then a device specific dtbo for the diverging parts of the
> four devices.

I'm not sure if that's a good idea if the bootloader is (effectively)
broken

I'd consider building full DTBs for each device

Konrad

