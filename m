Return-Path: <linux-arm-msm+bounces-42990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B2F9F9387
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 14:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D350188F295
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 13:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7B2215F52;
	Fri, 20 Dec 2024 13:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PujpZNKK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E22C21576A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 13:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734702406; cv=none; b=Kk+wIiwI9GrmxIuMepRVm1YKQQnkRQ8F9qrh4aG/UoEDIb8GC6cHZtwELgI71xma6uDZ88mzAoHIMAqfH8vWxYUuPQwEhJfpVx8XG3HXvKMIod4QAKqdk3cl7K10sOQXF6kvWIlWRSvb23Al7+FH46ubJVbbu5z1uqryvZ0xK/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734702406; c=relaxed/simple;
	bh=kbNZd6uBHvAqqv62kriVCFc9O8AGr/zhqKitzwxTBfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G9WSoX87B9Ty0JFhNB3bC2xRDpokBHRpBpD1bzWzVfyujmDD8RcvLZ8P8i7TNiOqqcdqavwSxgoJGZiTX21HP9HcnJ3qHwYrCjAiU16/rTg02g+FNf5iRCwi41BdFS3c02lspqegmW+B5L3hr86x9F+/aVBnQnika8o9V1mhaKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PujpZNKK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK7LxRm028240
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 13:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sennr2JFKCSXKhQvKtkDEiv3JJZQJL3xM0/QiG7iw3c=; b=PujpZNKK4BMvn0h7
	jSYlDXehfGwC0FMCEHtc8ho3NRBDfeKTlvlC4XQWo+ADRMtrSF2jvCE/QbqQxP/h
	UbykpEdU9hiGD3dMqah0XWon+gkN9kM410HpjWo4LO6qb+H3P06FzS6o2hiTaUAV
	tVn5rgaIUikE4Yp9pdj2uQB58xQr7y2dmfgzOV9vd46wDgZQxJz/Z6OHrut3VxnC
	r8WuZC0nQC/A4U+SkD6ELB/9fN10sRZ7+GMaLol8E5NGofbDDS9Zy0R1KCrN07q3
	rqR/DunUp1gMGxWbse8FJtRyynoBStTftM4D7/tae75g8uii9ALx4Vsgp2i3VZ4J
	eHIXBw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n44ggybf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 13:46:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d887d2f283so4932856d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 05:46:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702390; x=1735307190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sennr2JFKCSXKhQvKtkDEiv3JJZQJL3xM0/QiG7iw3c=;
        b=hEEar8W+pXnvDX3UFRYYzHnn8KIQyouf+NQKZ74Z4uP4sIe9mV41097xLk3Vw6Uaqn
         i3upkWRQ0QnR08XzOEnyR89Btkwz4gKPU2r6XxFhSNAe3m1GwPBfnFjunospDABihNj6
         rZ7XKeMJmeC4Yw8ejqgVVQC4ZMfpU+MV24NMqt9AuUszABC5CoHvpctoVwpqpjakYqsl
         N7L4V65g7sMxLUT+oPc6ROrCbWwc2ohkeP4bQ1bNl0CVfIqUOpWsFl8MRprkL83+JBKm
         4k+cbW6DPNEaMOyl3g33Bfy/KvMIghROlt1vmqm2OkSWDq3zSKVQqJru4LEuLBGZLjem
         JtsA==
X-Forwarded-Encrypted: i=1; AJvYcCXyytLDYTJjEnRMhLP5mpVe5jc1I9R81kJS0kFZTco2ZMzWGZTPsYxKcYP6o3rO5S3yrmz5rLXjDWZ9OSoY@vger.kernel.org
X-Gm-Message-State: AOJu0YwrVyAcIPLuN4nBtkQR55UqEujlwUsSwyCIOYhdQOZwjnzSqpbG
	wmTk/pu6RCWMAAWHZ+Yv/t2lgaxYKn2tBkRuk9Nz25a336WnCwaEMyA8c7JNLFVQjIkQDPrEHri
	lEnTuXKZdeireeFOrRUKM4Mmbpf8NtP6ivdJ+rlgIi6etl9jmdVDR3VWxVVgdghbq
X-Gm-Gg: ASbGncviASBLNIMT5TwlL2EViTIH7In7k51SAzBG89ZmOeT3b6PEiC+2EjDtGh3gw62
	bFPKt0D3h3c0EMStlbgEOl92uS924uSxzUQl6ceUrLRLKU1IJB+9FEH4b5bEF8Ar8AyhITeuIT9
	83gQrkjicG58LuYrygV0v2fsuuxszm0+7rLF5mdomJkQhnRvoGFpsHsK0Z7ptRkRuqw2fuiMPqX
	gKMKeQ/qXj7D3HeCQZtAeNEfZ7EvNG0OyaQzCcwdZaRblPjfqnpHnS/CJoQbCCzobtLniVa+kSA
	qAZ1yG2FFlUdNM8Rmv4zaU6yR1Fhly8rei8=
X-Received: by 2002:a05:620a:8003:b0:7b6:e196:2219 with SMTP id af79cd13be357-7b9ba712ac7mr172029885a.2.1734702390563;
        Fri, 20 Dec 2024 05:46:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUIwWJnMfAnCj3BL1XwltVLXY+IkD8MooWIQeNVfKSco3iv5aZXDP4Y9gvt4UB93m01afHQw==
X-Received: by 2002:a05:620a:8003:b0:7b6:e196:2219 with SMTP id af79cd13be357-7b9ba712ac7mr172027985a.2.1734702390202;
        Fri, 20 Dec 2024 05:46:30 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80678c6dfsm1781568a12.37.2024.12.20.05.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 05:46:28 -0800 (PST)
Message-ID: <d5fe224b-7ef5-47ae-840c-7b6df21da816@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 14:46:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] Bluetooth: qca: Update firmware-name to support
 board specific nvm
To: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_jiaymao@quicinc.com, quic_shuaz@quicinc.com,
        quic_zijuhu@quicinc.com, quic_mohamull@quicinc.com
References: <20241212150232.3823088-1-quic_chejiang@quicinc.com>
 <20241212150232.3823088-3-quic_chejiang@quicinc.com>
 <94eae703-ed9e-4f57-9786-99db7aaa07d1@oss.qualcomm.com>
 <db516034-81de-4e41-932d-c1bb26e1c55b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <db516034-81de-4e41-932d-c1bb26e1c55b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0onTfRviEa3c3bTwHfpZAQCT79uApUYx
X-Proofpoint-GUID: 0onTfRviEa3c3bTwHfpZAQCT79uApUYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200114

On 13.12.2024 8:05 AM, Cheng Jiang (IOE) wrote:

[...]

>> /*
>>  * If the board-specific file is missing, try loading the default
>>  * one, unless that was attempted already
>>  */
>>
>> But, even more importantly:
>>
>> a) do we want to load the "incorrect" file?
> Normally, there is a default NVM file ending with .bin, which is suitable 
> for most boards. However, some boards have different configurations that 
> require a specific NVM. If a board-specific NVM is not found, a default 
> NVM is preferred over not loading any NVM.

So, if one is specified, but not found, this should either be a loud error,
or a very loud warning & fallback. Otherwise, the device may provide subpar
user experience without the user getting a chance to know the reason.

I think failing is better here, as that sends a clearer message, and would
only happen if the DT has a specific path (meaning the user put some
intentions behind that choice)

>> b) why would we want to specify the .bin file if it's the default anyway?
> The default NVM directory is the root of qca. The 'firmware-name' property 
> can specify an NVM file in another directory. This can be either a default 
> NVM like 'QCA6698/hpnv21.bin' or a board-specific NVM like 'QCA6698/hpnv21.b205'.

Do we expect QCA6698/hpnv21.bin and QCAabcd/hpnv21.bin to be compatible?

[...]

>>> -static inline void qca_get_nvm_name_generic(struct qca_fw_config *cfg,
>>> -					    const char *stem, u8 rom_ver, u16 bid)
>>> -{
>>> -	if (bid == 0x0)
>>> -		snprintf(cfg->fwname, sizeof(cfg->fwname), "qca/%snv%02x.bin", stem, rom_ver);
>>> -	else if (bid & 0xff00)
>>> -		snprintf(cfg->fwname, sizeof(cfg->fwname),
>>> -			 "qca/%snv%02x.b%x", stem, rom_ver, bid);
>>> -	else
>>> -		snprintf(cfg->fwname, sizeof(cfg->fwname),
>>> -			 "qca/%snv%02x.b%02x", stem, rom_ver, bid);
>>> +	if (soc_type == QCA_WCN6855 || soc_type == QCA_QCA2066) {
>>> +		/* hsp gf chip */
>>
>> This is a good opportunity to explain what that means
>>
> Ack. This means the chip is produced by GlobalFoundries.

Please update the comment there

Konrad

