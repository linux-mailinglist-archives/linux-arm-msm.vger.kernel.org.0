Return-Path: <linux-arm-msm+bounces-92863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMtoCvLVkWn+nAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 15:19:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAE213ED70
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 15:19:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AB01300BDA1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 14:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DE61F12E0;
	Sun, 15 Feb 2026 14:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwqaTS1V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ko44iFcI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22BE3EBF34
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 14:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771165167; cv=none; b=VlgwpxPPB0TUurdSnB7+DmV6Rq79ziIBzLUngGCIRzs/Ow8TrTCXq9+DdyYKrBwmkIxhYxjf5e8j/GvqNXVm2XfatZIfXP8Hq46hA/Pj6c8wcr4JmfgPmngA+i2COlfXXs9cn9O5AjXaxzq6/liUtlm6c6yEfo0WQaCTnYK4nsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771165167; c=relaxed/simple;
	bh=C1ivIqC2KTxLtvlhKR6tu5c0YkWoXQU8GJdsXn8gtfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPm8EOmjMB25NO+SJq8fIM+R5W1/6O8AM7S8O9iNlsV94NpUcd2btWbIsiUUTlwXrik1tVxM441DYRZ6zKMq72S0u1qcQhde+z7ZgeF8aLHD5Xw2+KaSbkcIOw6CGJl0/uPWmzfJjTlLqSUiYrTXaP9XXcosxIIxgsAZED7gutM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwqaTS1V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ko44iFcI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61F2lKYp566022
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 14:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	drLFfljiudUP7/uJ+kHU2to4oX8NlbvFjFsZ9HWcYj0=; b=NwqaTS1V383AX8Cr
	oUjn72Epnw8ulzO2+CDefiUMGNhquqmAYxvIsgO1sZT6DLT/vUYX6w5btggwiRo5
	+zdT5ihNlMIrTTjboeFpIAiU9qVf9b2tiLnoa2me4NWJ8pLPYmk97r+xfJh5DuxW
	ELZ0JLuPfb/W0VLwUDZHip89Ae2ANwknljd19CsYvfnMUysYvlxdQIw9BNFqUQBi
	CVeefH3KVzSXFfjqd7DruYPc0gpwU5sx9V6aDfsfk8S+K7xIAQ/LS6Zv8TywRsR6
	lqhneLZBs2luLwgDcNihZc17oKKOnznLtr/uDDRa1LVZNEzeudpQSVERYNZMgWK/
	9X2N0Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahtcjaja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 14:19:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ab0b2e804cso28515405ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 06:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771165159; x=1771769959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drLFfljiudUP7/uJ+kHU2to4oX8NlbvFjFsZ9HWcYj0=;
        b=ko44iFcIYdvDBUxwQbYor+Dh2/f6gxJGF5ov8GlqE9CiKdRP2UzzlXkbTKl+anJZiM
         8gp0c4Ne2K6H3mih9gMKvJvxgupqSCO4KwtvpCXPG6O0IJwU0bAfIZ9xobl4NHBE2nAv
         jy101WVqPvJXLKgDpF2uO8lXQtDq5DTEsAQmuctloqJ+oFPZrujXsu6+mmpembjHLmWD
         TK5Ifrw7mTi3+lEmJDhEaeW/MO5DRnFj96hP/u9UpznKdl5N/Rh4y4WgidM0IHwoHdDJ
         /SPUUGF1gROjxgrX1Ds/d5i5n8U5FoxTy+XRspXIRhhi5YZtGsPrR/WJL7jZNtf0YCaN
         mjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771165159; x=1771769959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=drLFfljiudUP7/uJ+kHU2to4oX8NlbvFjFsZ9HWcYj0=;
        b=d16VgcHd/R1up6Bl2UNAz4Q25dAoxi6qPLAD/DStqsxe/SriWUTPticoGa9BqTMXWc
         OHXAare39Crb8EfIp2SxvZFpop6I2xtVaGowquxMAVP+HUF6lIW7SCm9ai/OxkT9en6D
         oTTbwvVSyTada7mEoHNwo/XUtOL/aMb8va4e+gYQAAkpzCbguvkCNhm3sDYt3x69DNmH
         is2MgumuSbIhf9hrkRjFQKQa0yzYRqWav9kIQt36dA9u0aLW3Xo3vL79Ms6M4Xvkn/Tm
         mRSsW8Wt1+/ef3IrXwM1thBQkcvSXdWfHLLF9OeJYfxlBMSVBX2HZg0HdC2GjrfajLn6
         yaWw==
X-Gm-Message-State: AOJu0YxRaeJHWfU+Y+oCEDyATnN1b9b0r4Dqds41irGYWpZNy29LCDp+
	nLtWnbpvd2qW1iaoU+dVtYb9QHQOI8t6my/J8QhCM3+qayInJ6wilB2nVw0//BUettKgXNFoBh2
	cCxBArbV8cbp097HLyiQ+3v3xz2hFksWndLvbTtjlGFYGd1MuAAZ+zygQdXhqdm2NOfTm
X-Gm-Gg: AZuq6aLb/zmIbnalMKQmqN4djvNI2UdvnpQN9xNJM71CKxUaTYcs6AoJ3huOJYMaL/B
	0cPbWI9QRSvug/49Dg3ykQUMuwadiHA7cLPhkugmgKJzKhuU7O6011V7q++cKg1qqhZZxcR6Wqw
	zccMQbwNHwbVmbmgYrDY/bokoqAt7ARf0qMj2VplAAH/JGOMpoDYouIWeFUA65ggY4G8hhePMup
	I7x1myYClHdSIq+28tCxxS8ejdctKoy3fO82Q1j8oyA2ywbqw023aQ3Jz9dxvA7H4hjXTKTN8Pk
	Cnzts1DOp94yMM0cy9I+rmmHkZ/vRVIl0dfOr0k6tRU+qWgV4zdDzUj2RcMp6v5xPHlee3cQX4l
	Bk62JQqYByBnVfhvgcmRGunxfT3M8WPuwm+jJD9bFfU4cGuImJFhDANoeuLGsA3tvbsw4RfIaoj
	6bMo3s+tCBNWQT
X-Received: by 2002:a17:902:ef4d:b0:2aa:d288:7bf9 with SMTP id d9443c01a7336-2ab505b5e41mr86855225ad.31.1771165158926;
        Sun, 15 Feb 2026 06:19:18 -0800 (PST)
X-Received: by 2002:a17:902:ef4d:b0:2aa:d288:7bf9 with SMTP id d9443c01a7336-2ab505b5e41mr86855045ad.31.1771165158463;
        Sun, 15 Feb 2026 06:19:18 -0800 (PST)
Received: from ?IPV6:2405:201:c409:b03f:7465:278f:83b:3aef? ([2405:201:c409:b03f:7465:278f:83b:3aef])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e52fd0c81sm4897105a12.4.2026.02.15.06.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Feb 2026 06:19:18 -0800 (PST)
Message-ID: <ee1a1fa2-89df-4d8b-898e-9a4a50e1df6f@oss.qualcomm.com>
Date: Sun, 15 Feb 2026 19:49:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for
 PCIe1
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260212-industrial-mezzanine-pcie-v3-0-1e152937a76a@oss.qualcomm.com>
 <20260212-industrial-mezzanine-pcie-v3-2-1e152937a76a@oss.qualcomm.com>
 <97af21d5-7457-4dc1-bd47-2e34e6df094e@oss.qualcomm.com>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <97af21d5-7457-4dc1-bd47-2e34e6df094e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDExNyBTYWx0ZWRfX9jKsuapQPKHn
 CmT3/czgL0fyacrRh9uqBVYeZdkudBHmKvHNFTU/Nj01hwnBzM8NrW9sqIqrS1II/6srW5j5Qnl
 k442K9bllmudtkE1hikKDIM98nKBnKExO0p1B0gSNn61v73kFNrElSqjKTDie2j6evbXtbvLjZQ
 ta/Kzw16S0ESH8dTvi7ChqUJfJiNGE4TVZbm2ufhbm/vMVeAabQanNnIDODM2QHjkVMJ8r7oXZt
 Lg3VIi2WS3AWZ7yO/AdA3xdF70XygHjHjQJD8pos0TqlI+mLytyqQmdpA9PQE+2e54FtohBoCgJ
 mNcXhMwT4sYqj51CtPxhjVSEkGZdBmoj084MPg8V3t9GPE6scRVJJ0Ldswv7Zm4vhrEWTIbeZ03
 5wRZujMMCN0QA4pDE83Wzs+yLhXEV+LDi8UZf5xBUhk3rWVdhYHf8FAMQqpKxzthUDEWfF1/h0l
 MZQoBq9K75gXfdluCIw==
X-Proofpoint-ORIG-GUID: Y9pe3MH4ktV05chhK1ow8zBUSCqfLUnm
X-Authority-Analysis: v=2.4 cv=DJOCIiNb c=1 sm=1 tr=0 ts=6991d5e7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=84ae-n4OvFXSi56mcEoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Y9pe3MH4ktV05chhK1ow8zBUSCqfLUnm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_05,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602150117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92863-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7DAE213ED70
X-Rspamd-Action: no action


On 2/12/2026 5:16 PM, Konrad Dybcio wrote:
> On 2/12/26 11:44 AM, Sushrut Shree Trivedi wrote:
>> Add a node for the second TC9563 PCIe switch on PCIe1, which is connected
>> in cascade to the first TC9563 switch via the former's downstream port.
>>
>> Two embedded Ethernet devices are present on one of the downstream
>> ports of this second switch as well. All the ports present in the
>> node represent the downstream ports and embedded endpoints.
>>
>> The second TC9563 is powered up via the same LDO regulators as the first
>> one, and these can be controlled via two GPIOs, which are already present
>> as fixed regulators. This TC9563 can also be configured through I2C.
>>
>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>> ---
>> +&pcie1 {
>> +	iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
>> +		    <0x100 &apps_smmu 0x1c81 0x1>,
>> +		    <0x208 &apps_smmu 0x1c84 0x1>,
>> +		    <0x210 &apps_smmu 0x1c85 0x1>,
>> +		    <0x218 &apps_smmu 0x1c86 0x1>,
>> +		    <0x300 &apps_smmu 0x1c87 0x1>,
>> +		    <0x408 &apps_smmu 0x1c90 0x1>,
>> +		    <0x410 &apps_smmu 0x1c91 0x1>,
>> +		    <0x418 &apps_smmu 0x1c92 0x1>,
>> +		    <0x500 &apps_smmu 0x1c93 0x1>,
>> +		    <0x600 &apps_smmu 0x1c94 0x1>,
>> +		    <0x700 &apps_smmu 0x1c95 0x1>,
>> +		    <0x701 &apps_smmu 0x1c96 0x1>,
>> +		    <0x800 &apps_smmu 0x1c97 0x1>,
>> +		    <0x900 &apps_smmu 0x1c98 0x1>,
>> +		    <0x901 &apps_smmu 0x1c99 0x1>;
> This map is not just an extension of the existing one - is that
> intentional?
Yeah, I created a new map just for readability. Should I instead just 
add new mappings
and keep the older core-kit map intact ?
>
> Konrad

