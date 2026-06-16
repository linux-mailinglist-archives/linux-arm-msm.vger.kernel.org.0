Return-Path: <linux-arm-msm+bounces-113412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id opr5N6hJMWp8gAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:03:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE8F68FB6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:03:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SCWelObh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TSexLVey;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113412-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113412-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0750E307BA1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB20736A364;
	Tue, 16 Jun 2026 13:01:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979D62253EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:01:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781614879; cv=none; b=TGJ3dUR8NN3dNRGeHlOrKvcs5b80ZJWHqKIpa/LixTZmXF2MAmw7Mxmlbcq+peIk3waY0b8i+Brn0v9SJVl/0h0vE9hhb6S/WUQ7uaOINzWKjNcn0wh6xStPZ344UymcpqwCax6id2usmFCuP+hA/2aecnkFGFjZHcLsREYOsIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781614879; c=relaxed/simple;
	bh=Q8PscY4i6kAs8tZLAGdIxK2jkw8Fv57hBjZQXqTsrQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZxsBubbJFbgZ8kNVwBPyekagCtqjpsXZ8kgXx9vK4uMCFQftpstSEMktO5wKTdvfq9+XxpZWmuDnvL2xe2DmzhnK9B5NPGX+lZUACL8pm9u2rA5yssUMN8IyQCVBEDKCWZ6LpBIqZ+IeLdRMUrIIBXVukdTDB8kWHnBBcitBBHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SCWelObh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TSexLVey; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACICI3411132
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8PbG6qpebkxF5tqbMEKSZ7WqKDcIxGrR5pgwEO5vnHs=; b=SCWelObhU+e4RqRp
	PelWXjWnP9k4r9ezD3r+jPsn868RocnGdlsSMZcltEQW8oKuWBqetyHLduXl5nLr
	MGTotqNaaXq12eJJROhiPpVKg5CqurQWfcU04Nyh9pLjh7emRE6E1Ffs0sQsuTIX
	X/Zibhl3+cIVb3ZXErAMafVb2iVBScjMqyVI5TOQfdzCE2xo5fvx9x2JwvCWZHot
	j+pP29W2EO87Uqf0eShnnJC9MTsc9epjHcDtvcR0AkUoWW/1rjBpqBnXjDhnJzd0
	Una6LObqY9Z2fyDBjmxeMGqXWuqW3bUsXXO3tSsJOPO93TGbtwciHQejAAIyAfXQ
	1CgCvg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09g9v4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:01:16 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6e0426fd3so2202233a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781614876; x=1782219676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8PbG6qpebkxF5tqbMEKSZ7WqKDcIxGrR5pgwEO5vnHs=;
        b=TSexLVeyk6dLIP/91dY9Wj3bq864vfZPtRKfo4t/RgNSaXfU3OyNtj7+94Fcplc/Qi
         1C8EN6SjOwQ+CuVSEG8kPMB5lZccGWjiGz99SgaQ92S3QzDdxXJbu53ZLx7foT8JKrD/
         4UzK1zmPC4pKdcm26ic3cAc1shd4zDaHKOvC7nzIruOBdOCdGqBYHFavSY8hA5enPqMs
         tNFftXP0IsIS92Ehk52t2FBzU6DYxa2odSKhUgEbfKGUM4iXdBlmsHyiGrQXgAL0W+4R
         VQmzq0nUWuufR9O9ui4jboYWyRIS7ysTNVafz7o7RrDuAdIoglCwCMJtwojvHBLYYbU/
         FOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781614876; x=1782219676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PbG6qpebkxF5tqbMEKSZ7WqKDcIxGrR5pgwEO5vnHs=;
        b=O5b232b45kE/JdktHX7eC5HuZSixsk+vvl7Y1myBoc3S/h5EhiESLBhfGlRhkSw153
         WAwSYowBgmU2fosZjDNTgYJEnFO8g1NZbI7xoKVxB0aq98OmA8phQE6xT/FoqOKeZIic
         CGT4gNWptwDUtuiFvlJGDPUqiijCsFRTuTbnENxn9OoodD9nlg1UCJpHWRfbCnGZoKq+
         9HFzk3AqIHslqYlAikK6TGvSr5KCL1ug+JNXDCHgFljNqB/2n3EMM9TvmrUs5cCWXFni
         QxGKqoG/E55pJC7sVtRSID5fE4QQgO8YuC5ue0yopXdlKVwte0SP3+gjKjdV4Qw+0q02
         zsZw==
X-Forwarded-Encrypted: i=1; AFNElJ8u4wcktV4d987NvRfdl4nIn4GloUSQcvenAkys5zEthpUWmgfpqfglQCa2NcEbuIRwXV/+ulwWlWVISfJA@vger.kernel.org
X-Gm-Message-State: AOJu0YzXIlLvCNiGZsGqIi/GKUNOg7rsYHPcq3PPEIx2Ki5vhqlml8A8
	IHHa4ii6n0bMeyJ8Ns3+if+jAQSPqTFRPWJVFw/10ve/He7hDF55mAptXF+a5DakgG86KNKOKdW
	pvPpND8UbM5d3hgWh8XF14rdhmw/xadUpo3rqP+fynKKQ/6BerX2PyW+GgU6S+86cksPF
X-Gm-Gg: Acq92OHCi+anYYYOrljnpSvaLcxJItVdzfq9mEFOGqPNOwtWwRXNavfKoGJjyBULUdd
	jYZMnH4qrhnk/N0BHeBsztqVXTlapryBpsDH83bleoYWodTXdhlf8OHikxgreo4FzFyRfoYCe6I
	lHlZqXILnSg0a/qgDkF4awibK+xxsEH/DnNvP3QGmv9S3kJaUs1Q+9nuvFOf6H3s1q7aDZBdwFe
	b7G8aSnVrjm7DOppMYfYGH2h1st0BXX+F+PWAgiq3aWUZ6GMoAsylKCWRElPCHoHzeafp93LGpD
	VlntaTG62zBSS7thwXjUZ+WWxdHo4eF7/Pw/BJ/mRZmQcPLzAz9Bpo9QfzhiBb5KyCQW12xQsGh
	aJuD3tihgzMhUaU02XuaT3g71v1u35e8u5jDDrzGDfHG3zw==
X-Received: by 2002:a05:6830:81d9:b0:7dc:c92d:977d with SMTP id 46e09a7af769-7e784678756mr7657928a34.1.1781614875509;
        Tue, 16 Jun 2026 06:01:15 -0700 (PDT)
X-Received: by 2002:a05:6830:81d9:b0:7dc:c92d:977d with SMTP id 46e09a7af769-7e784678756mr7657881a34.1.1781614874783;
        Tue, 16 Jun 2026 06:01:14 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b499dsm3484915e87.78.2026.06.16.06.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:01:13 -0700 (PDT)
Message-ID: <de10ed05-a0fc-4f84-83ea-8810270ff2d6@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:01:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD
 Card via overlay
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sarthak.garg@oss.qualcomm.com, pradeep.pragallapati@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com
References: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
 <20260227105055.2364348-3-monish.chunara@oss.qualcomm.com>
 <2ra2apfephjl2au6wel25gbxoxyvohf2ysq4yzaufp3xb7mtoi@g5p6asbk2fqe>
 <aaWdjuqvhpJb1oSX@hu-mchunara-hyd.qualcomm.com>
 <3aaf273a-c7da-4740-a68a-49f5d2f5309f@oss.qualcomm.com>
 <ajFB7FVlqp3qCA0i@hu-mchunara-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajFB7FVlqp3qCA0i@hu-mchunara-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzMiBTYWx0ZWRfX1Z6a59MWOO/l
 Jh0lyaRhqrqUgtTasb19iUSyrzCqavX4RyMDS0D4Hb1HdgZuu2JjdGUHOda2Oho4rbrZ6tWw6fw
 niDF+T6Qnnu8gqC4QX+QJaNYzvIgUuYB88hL1WhOQooiQUeGy71qmksoqvHgUKpT2kYQMUcgLx6
 MoFHH3oRBWgY6DaXPf3lbrXhqD64Vh9V8lGukuRKSLI8GjZ68BUH/OEATknadnRTbatKn3fi+Tf
 1eUKvf8UAT5759DHw9C2kiVhDRACk7OydvGmfGSMESdS/n9iDlB4Z51pKWbE9zglJciri9j8iRx
 mxYGylKLXKewWB48QhNGTmtp//xfPvAOAEzKWWH3UsycLVGR+OBzjUI+sgzerNtGgCsq1zmjXrN
 Fk46HRb0Ph6KQ7rqe8G94zXXlK3kbvJ8q+rQ6lKPXivQEtASKGsmFrQc4130qBtAF6XOgRPgKqw
 JHTUzD9AiQvbtzSOTng==
X-Proofpoint-ORIG-GUID: nyk2kIeVYNNIvPKMM7OA3F9yFQy-3tZl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzMiBTYWx0ZWRfX77ykXoILTW06
 ycds+Q/1Yqe0LHMB7qMj/UOYdz1MXXRf0bQoiZ/NTezQWaBzYV/eTtvdBrrdnAEbyJAuY1kO38s
 KCqSlDBmx1FmTfbb53T9F6JTHRzV43A=
X-Authority-Analysis: v=2.4 cv=DLa/JSNb c=1 sm=1 tr=0 ts=6a31491c cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=sLJ76Je8dalr12q184QA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: nyk2kIeVYNNIvPKMM7OA3F9yFQy-3tZl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113412-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sarthak.garg@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:nitin.rawat@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BE8F68FB6D

On 6/16/26 2:30 PM, Monish Chunara wrote:
> On Mon, Mar 23, 2026 at 03:15:09PM +0100, Konrad Dybcio wrote:
>> On 3/2/26 3:24 PM, Monish Chunara wrote:
>>> On Fri, Feb 27, 2026 at 10:03:10PM +0200, Dmitry Baryshkov wrote:
>>>> On Fri, Feb 27, 2026 at 04:20:54PM +0530, Monish Chunara wrote:
>>>>> The monaco EVK board supports either eMMC or SD-card, but only one
>>>>> can be active at a time.
>>>>>
>>>>> Enable the SD Host Controller Interface (SDHCI) on the monaco EVK board
>>>>> to support SD Card for storage via a device tree overlay. This allows
>>>>> eMMC support to be enabled through a separate overlay when required.
>>>>>
>>>>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/Makefile             |  4 ++
>>>>>  .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
>>>>>  2 files changed, 76 insertions(+)
>>>>>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>>>> index 317af937d038..c86242a1631d 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>>> @@ -46,6 +46,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
>>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
>>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
>>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
>>>>> +
>>>>> +monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
>>>>> +dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
>>>>> +
>>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
>>>>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
>>>>> new file mode 100644
>>>>> index 000000000000..a0bc5c47d40b
>>>>> --- /dev/null
>>>>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
>>>>> @@ -0,0 +1,72 @@
>>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>>> +/*
>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>> + */
>>>>> +
>>>>> +/dts-v1/;
>>>>> +/plugin/;
>>>>> +
>>>>> +#include <dt-bindings/gpio/gpio.h>
>>>>> +
>>>>> +/ {
>>>>> +        vmmc_sdc: regulator-dummy {
>>>>
>>>> No dummy regulators, please.
>>>
>>> ACK, these will be renamed as per the schematic. Since these are direct supplies
>>> on hardware, used fixed-regulator configuration.
>>>
>>>>
>>>>> +                compatible = "regulator-fixed";
>>>>> +
>>>>> +                regulator-name = "vmmc_sdc";
>>>>> +                regulator-min-microvolt = <2950000>;
>>>>> +                regulator-max-microvolt = <2950000>;
>>>>> +        };
>>>>> +
>>>>> +        vreg_sdc: regulator-sdc {
>>>>> +		compatible = "regulator-gpio";
>>>>> +
>>>>> +		regulator-name = "vreg_sdc";
>>>>> +		regulator-type = "voltage";
>>>>> +		regulator-min-microvolt = <1800000>;
>>>>> +		regulator-max-microvolt = <2950000>;
>>>>> +
>>>>> +		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
>>>>> +		states = <1800000 1>, <2950000 0>;
>>>>> +
>>>>> +		startup-delay-us = <100>;
>>>>> +        };
>>>>> +};
>>>>> +
>>>>> +&sdhc_1 {
>>>>> +	vmmc-supply = <&vmmc_sdc>;
>>>>> +	vqmmc-supply = <&vreg_sdc>;
>>>>> +
>>>>> +	pinctrl-0 = <&sdc1_state_on>, <&sd_cd>;
>>>>> +	pinctrl-1 = <&sdc1_state_off>, <&sd_cd>;
>>>>> +	pinctrl-names = "default", "sleep";
>>>>> +
>>>>> +	cap-sd-highspeed;
>>>>> +	no-1-8-v;
>>>>> +
>>>>> +	bus-width = <4>;
>>>>> +	cd-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
>>>>> +	no-mmc;
>>>>> +	no-sdio;
>>>>> +
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&sdhc1_opp_table {
>>>>
>>>> Why? Is it specific to the device or to the chip? In the latter case,
>>>> please define a separate table in the monaco.dtsi and switch to it here.
>>>>
>>>
>>> As per the previous review, it was suggested to use an existing table. But yes,
>>> this is specific to the Host controller and the corresponding voltage corners on
>>> the chip and can be defined as a separate entity for SD card use-case.
>>
>> The SDC programming guide I have access to does not seem to have bene
>> updated for any recent chips. Are you sure these different corners are
>> *actually* valid? The clock-side documentation doesn't mention that
>>
> 
> There seems a gap in the clock documentation. This is being communicated to the
> corresponding stakeholders. However, the corners mentioned are as per the
> reference platform and will be updated in the subsequent series based on the
> updates from the clock-plan PoC as required.

Thanks for chasing this down

Konrad

