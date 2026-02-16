Return-Path: <linux-arm-msm+bounces-92892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK+WNp/Pkmm1yQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:04:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE3C14169A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 357323006F04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 08:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895F42FAC12;
	Mon, 16 Feb 2026 08:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HMi69wWK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b9MIuhGY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461AA26B742
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771229083; cv=none; b=kP3xHNuIb9hFhzE1JggPD9phv1zZxpfVZ1DITdXtNzssj5+VyKsduvtP8KFuqJ8A7gdf/bmtdBLuae8Tyydr4DyUTQ/GqqVCqZuI/W9FM8t5GfelaMMnkxP1zo6BLR2z/6X6tpuTz6yqQaPIkb3pUlxzgcMw69+7sSjZtDhWIUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771229083; c=relaxed/simple;
	bh=pBtE9DL5BTRf7rTFWdzuOuE87QBnLTwQaL6W3mK/dTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVDE4EnmpCzutQGOd8fjvCM+IOuQZIUf6vO4RWYQARJfleI5htUNQGHN5pWtlZDBfzSXD7z8F9b2iO2a+/8k8Pkofksd0pWghRyiRPmv4x0WRFvW+V63o7BbN09sBXa1dsKr+QGpvQUtGIErUheFm9yAQ+c3ffrxYL/KsoYn/+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMi69wWK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b9MIuhGY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G0sOWQ2617484
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBtE9DL5BTRf7rTFWdzuOuE87QBnLTwQaL6W3mK/dTA=; b=HMi69wWKosR8Go3c
	zdgG1s5TMXw2nQRjcn088vPRpp91qiy83qBH2XaFeJoMovUZYwv4PqYi6Tc+Tcbv
	y2D8avqlQGhZIhvgBbqj/0RUjphWALebLOcovi143xYSLOqp+3czyuM1FPzHtS9A
	zek2zY75/5SsMuDvu0tnEASWLfv9QCx7BI9Z22JIwSVSbTGolkV7f00lDxsy41hZ
	pKoCOc+SoEM21goWQ2Bu4FGsytmB8VbMK3UX7eIoautbrK83UxvUp0m/pfZigK/0
	hVfeb1+P2AQLd9foR027GBjToSNqWOE+vAneHnFfmh+PTwbCXABnyBOahl+cbhy0
	CpEyiw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahe63sj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:04:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ad30f8fe0dso2700685ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 00:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771229080; x=1771833880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBtE9DL5BTRf7rTFWdzuOuE87QBnLTwQaL6W3mK/dTA=;
        b=b9MIuhGYhGYIBoNAKkaCiGLvV+Iw41y04LdbWn0othMNIKdpqQiCZpKCLNEJhz91SJ
         53w0iaYam67RkXH/HG9XL+Ris3ww6nsf57wtqu2P+vmckpDT7m4k5FE/DHcXp0tzHVon
         IyEt0OcPqdz2YzLid7QkeK3YmwguQiTc2+KRkiq3Lp2TPme4KWA+Rzq2TXbwgfJ2Es0t
         9m/uhtiGAlFLzTtEmqf4q4JWtL3dEni1h7ShB7OZFVp0WePiKUOH333f4+DYzticc4kg
         MklAmwSKVcCi4aAAdD7gCcqmCwpg3c04HSUGOuc5u4sE6NOheWPkk68ajRd6e7SudSvo
         ENOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771229080; x=1771833880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pBtE9DL5BTRf7rTFWdzuOuE87QBnLTwQaL6W3mK/dTA=;
        b=Q7tuywQwVmFPoYAd2tyABRGDSp2d548XfXzvwnJtjHsMdc6LNG6EJF7++D+AB8vkcM
         Cg2P8y0t4LouO6Vbk/Z0MPAtniC5j2mctcPwOirsVgem8kuFyper2DCZy/ALSsJ9xo1S
         hg35ZcdDPvOGecZhige4Rh5vWnNAxTm+3EPi1BThpZAk28WuV5nWBvCdYGUxWCzI9nqZ
         qurCrzvhNFr5XU1umOS1NHsKupVCmLNL02aTomjZc2hMIaqRlOB1ZYRJ0bRDNaGh8EbC
         gbnE8a/YkElZnyFp0EQXtqiAasWwbOf8j9LtCQxizROGvXRfcCT3rJdJ654Z+WsSXXjM
         ZSEg==
X-Gm-Message-State: AOJu0Yyf97Nbu5k6g4h/qZHOrecyUOe4Va8piMKq8kQMOlD3I7HB/NV4
	AZXcds72/yfVKQcQMktdHzgB+E+pCBCBV6sDIN4N21i+OWqbbtdis6ybvf1BGFKjQB+UnhApjdH
	808MOoAHLUsjf4VQpuwYoIDfcgqUkB3Icxf6dfewLmG7nAwiHf6Y9TtwZFRKuO6ikfSVt
X-Gm-Gg: AZuq6aK63RwhCkMFlbBoBQsz6l3YeJvuw308v7j9tN+YG16i//Ma4n/qE+DAZi5LvaA
	UREoWHdTqGfs5hyveyRm8XCOOiyqRjO1PfzKvChd+HfxwOZdJG9dpEh1hUZ29VGVmJgF51GYtOG
	wYDYwOCktzN2or1ola6glMhgelTUYeZotUjAVCMSx6tjoESHahhO12aMPcPVTkaboqFXspz3ntb
	lxLjJLFcceuw9V9oNt4y/lqNAK1N3hpS+LX7Bzhv88eZ3jjpLOX6YPb4EeW7+N0kpaYOJNUXutV
	/SfKz5MDChLDZViQQ9HdabSwSDEwnnmBzah2qsRl2U1ApRn+tV3ZRjKCP37SI0Tu191TmP1wTvF
	WrsKCAfGdEnzGmcqlPI01Nn+L/sbjzjG7spQGaDiuxYSOgGFLTA==
X-Received: by 2002:a17:903:3d06:b0:2a7:cbe3:a6e3 with SMTP id d9443c01a7336-2ab4cef9723mr82266555ad.2.1771229080155;
        Mon, 16 Feb 2026 00:04:40 -0800 (PST)
X-Received: by 2002:a17:903:3d06:b0:2a7:cbe3:a6e3 with SMTP id d9443c01a7336-2ab4cef9723mr82266385ad.2.1771229079687;
        Mon, 16 Feb 2026 00:04:39 -0800 (PST)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a73200asm63220775ad.36.2026.02.16.00.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 00:04:39 -0800 (PST)
Message-ID: <be4fc7dd-e7c4-4f2e-ab5c-543d8fedf7d6@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 13:34:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: monaco-evk: Add Mezzanine
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260210103821.4169-1-umang.chheda@oss.qualcomm.com>
 <20260210103821.4169-2-umang.chheda@oss.qualcomm.com>
 <957d7896-cd01-4864-bf07-e6dbdfff1273@oss.qualcomm.com>
 <2d688258-2e2a-4a86-aa98-eca31627d418@oss.qualcomm.com>
 <af15dfbc-806e-4731-a7a3-6832a781154e@oss.qualcomm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <af15dfbc-806e-4731-a7a3-6832a781154e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c5WmgB9l c=1 sm=1 tr=0 ts=6992cf99 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=QtLaxJc4UxdN8FgP6j4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: GZaOIt_0t0v-aK8uZWPTrFhGpBrszf6D
X-Proofpoint-ORIG-GUID: GZaOIt_0t0v-aK8uZWPTrFhGpBrszf6D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA2NiBTYWx0ZWRfXyag6YDeHSCMH
 tI5LGcqO7woW/LDk+Sfv8sjrMpukjJxRnW8djCrRWzAGecMIlri4mccyNT6AHPzw+573NN6QCkw
 /60rHTNlnfPpbd+HPMy/GvOjghuWyW4VDTwkKtEBLgc+YYwUiRnA4RoFC715kWGdI8TKdIzBowg
 W6xlCH4VTsqUWm8XYfFa+w3oa64V4pO+qfGvPrwVcy3FejfUCpzYFH/xKFIXBtqU7PLnuFseR4j
 4KBFu5v9JXQD+z+yAFcWvEepkNYNf8M1ej33LBC6DnoHdgVSk7KPmP1W9a93Dj9TqsGF1Ovk7c2
 EAvxJhsIwnYSSVq7+ccjxSpJkpple9WqiE3dsMngm+v9mx5eQnHbR9uDR53NMi4VnTMmSTxVcL8
 XXHIDiwPLfhsQwUvsPX9Xd4ltwL/VJA3JFp0MifQSKPq1R+oOvNb+dLy9w8qK5nx0PLJYObqQV8
 HpS/F2FraJ3UTg/jdYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92892-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4AE3C14169A
X-Rspamd-Action: no action


On 2/12/2026 9:59 PM, Konrad Dybcio wrote:
> On 2/12/26 4:50 PM, Umang Chheda wrote:
>> Hi Konrad,
>>
>> On 2/12/2026 7:10 PM, Konrad Dybcio wrote:
>>> On 2/10/26 11:38 AM, Umang Chheda wrote:
>>>> The Mezzanine is an hardware expansion add-on board designed
>>> There's normally multiple mezzanine boards (e.g. a "vision mezzanine"),
>>> is there a better name for it?
>> Does, Interface Plus (IFP) Mezz sounds good ?
> I don't know, does it stay Interface Plus on the silkscreen or similar?


I checked the board - there is nothing written on the silkscreen. Internally we call this board Interface Plus (IFP) mezz.

>
> Konrad

Thanks,
Umang


