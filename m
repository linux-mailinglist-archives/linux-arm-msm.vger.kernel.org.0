Return-Path: <linux-arm-msm+bounces-83992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D68C97FBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 16:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EF08A4E1A44
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 15:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678FC31AF36;
	Mon,  1 Dec 2025 15:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4fIZyuo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PeZID7vx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D17A3164DF
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 15:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764601961; cv=none; b=DjC0plFjlBZatKzs00UTfuGyFv69zh3WsSRq/YtYpoaDnduJbQFVxUXF2snMHiT8yt7wqF82XBERUI/+iC3ARFal/O6P+NNVOrTcLd/vYzCca7amEZh5dQIucRKYyKEruTNVbzgClGWs679ZRC7eqIekInkghP0kuvPdqM+jAiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764601961; c=relaxed/simple;
	bh=nOY0/y7styDnD1DLlbEZhSbI1ectNWmIqY63A4VdhqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+vvbWHqc9MHoNoZ6qDKTrexGL9i7Ebt+A7O17Ntsy0M8yaluxDHlAEhthfYJVElC9VDxzzno1w7ebvOrbGEAUzQMOdE+swgWF3ViRQ4ukUnNj6cpQPSppjiVZh2Bmmaki+iVL6SQdiKehtrFb/ZvdYHwL6l9n4mEw4Nh+5Lkws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4fIZyuo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PeZID7vx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1DYqU13690420
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 15:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ArX95p0olkqkaVsj5g0Z/zNtOL40uj04LFD5XFTRZSE=; b=N4fIZyuojX0XPbBE
	99qrhenl/vgSuvEXYtbufahR71I2BA26mRSvP7oqae2jD1/c7zjFhYROPnqgIHR6
	z0qkEVcRmthxBQOndmNRWGqgkKIausqSMj2AoYp1yJzFf+9Hpi2MuzXncH2wBmt/
	sRlF1yF13CGn9MbEhuQn46hjUldN1GvgtwqEQ8y16rugP0Gmf0InxeQ46s3bIs71
	rLgyhYePrxkKsO8knvXyuMnAWzo9M/h2+Sa130Xux8WAAoh+fA4IDOvIJRkhTbDS
	NqkeEFgRygWV0RgD4ITrHWIKlU5tLvwFVcmw44FecvipXdL9b+WOl3m05ulJ3pkC
	YtXfxQ==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as6141g2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 15:12:37 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-64203afd866so7765968d50.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 07:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764601957; x=1765206757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ArX95p0olkqkaVsj5g0Z/zNtOL40uj04LFD5XFTRZSE=;
        b=PeZID7vx8AtU1o1IHBZc2hjbKy6lZUgmmFk8tny4XjAqbOLwFllk5NgfbaUGOKhB/T
         Zi+AylAZNjl3QSSgIBYOKfWXBEHanOZ2G9aulWt6HmENKzmkNZ0AGmjigtpfxZr7br4w
         4lSW067rjXL3Azye8qyM1ocpd8pEzKIJqMLzB1Uhkijm3f8XTDgfx+TUwZjZl1TKFYu2
         K6Nwmypjl3FsTQHVS2Q0RyMNiiZPx3o/jm475k91C0hgr5DFJsBrOv/8tgJI0i2LKXBL
         pEIGg3Q1a9kOuThteUSgdnr6qiWl9qVpGTXv6KbGAsHXxmNJs+azOG3UmH1GxkklMRuN
         ayqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764601957; x=1765206757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArX95p0olkqkaVsj5g0Z/zNtOL40uj04LFD5XFTRZSE=;
        b=gQxgcWJGRKEv0zC4kuaNX0Kv2pj+EIJtRCBdBZc3WYBaNBp0dNz51r8vQ6CkW3cyEh
         UaEV57olZPk+LFxGetMX3teExR3znh+y51miNBwwfA6g7rnLnC0y907LD6yiZCC4A1WT
         BT/BRBbaIaAYLVhBbI0Yoemq6tgxZpHogVeVPUweitLVLdbeEQGQLgXBeFQuORCPLoMz
         0Y/7GL+vVZ3B4BjpZaT63WigXvrL+LtKLE9F3XqlqvgQ5FdsCb10fhfhVLotuKsvccGk
         gTCB8jvcl4vrjcUTGfGIpx2MfFSoHturYuwNPzJzXJnQPbzWneg3uEW2/XEgO4RCaRK8
         r9xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo7HPBDpyMknOMxEHq+kOT8K0rmxZYnsvPYrU94l1RuhyKjincvkw3bBLH3y9Pm4qTt5mh+b2UPYSoVXR7@vger.kernel.org
X-Gm-Message-State: AOJu0YySEe+rPit33awvI08zr8vT5i7kSXR1GauFjHT6jYPPswrbfBIR
	UjcGbQhQeKg/4MIIt5cOhJiSxuzWkZH21C9NCTRfbqGMWerBkstO2Sk5hrzm0BBMRY7UbZl3LIG
	Owt2zbgA4xFF/QwsplcuHqOH29WdVaQa+9iS9RF2IbAOh3l5/rc3JOdMwleW97tpBMF2f
X-Gm-Gg: ASbGnct305eDrNKpS88Ff+PC05zGIqQFaOWnU4kwAvjAPz9bP2ko2I+sU0U+e6WwH8i
	gqUCOIj1kV3+WXrD9iDT6kgNrFzIgWECH3b+fZPYnHK7nKJg6S/b9MlAdzztf8l8sVqrbU3S98H
	ScGlQkCPl7w2gZepqLzFk0NEru4AAltz1J8juUjNvmB+ZwRWBTB/5ImZYuFER2+RfRU83qUv3t3
	eAF6yDZkSuI4SeSS/jyH3comAhCTNayccgoy3FqmD+A0q7DvjW2BdahAtqBxZcJ1gWKaKmmOUI1
	4FGXqcp2Jz1ht3r3TwJN1YZ1iFtaGwUoFEpXqpLxUmCWC8+Tx300Qmgg8FE7Q9Wd6NxIoFDKM+z
	BWYsi780KEX7ltFPgr969P1wOe/R4u9xk7Eud
X-Received: by 2002:a05:690e:1c09:b0:63f:9fd6:94f5 with SMTP id 956f58d0204a3-642f8ddf5e1mr30696905d50.8.1764601956395;
        Mon, 01 Dec 2025 07:12:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRKs5cfkZNWtfP0LkauT9BabZg6EZ8ZhvUWxx4E0ElOqx46RgYc6C3MIrO9BkbG4xWa6dUXg==
X-Received: by 2002:a05:690e:1c09:b0:63f:9fd6:94f5 with SMTP id 956f58d0204a3-642f8ddf5e1mr30696855d50.8.1764601955775;
        Mon, 01 Dec 2025 07:12:35 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4790b0e21e8sm326622805e9.15.2025.12.01.07.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 07:12:34 -0800 (PST)
Message-ID: <a3437545-a06f-436b-8cfa-5970f9f53fb6@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 15:12:33 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] ASoC: qcom: Fix confusing cleanup.h
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J/KnLQnS c=1 sm=1 tr=0 ts=692db065 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5cJh8bmIhOOgMbKR4zwA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: _xY1wyJD4s3s60hIHwpG01730iO_eetk
X-Proofpoint-ORIG-GUID: _xY1wyJD4s3s60hIHwpG01730iO_eetk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEyNCBTYWx0ZWRfX1Q5/RKVq9UBg
 Yg6imk2rJa7BhhpJjUGANxrn3T86Cam8ndXJJaogKfXOM2WmSCJrbL5U8uQjJfEfZbVM+2yz0pz
 xeu8BqylZkEOrsZGQQqgyFmUZA1sKI+2Xy+z60C9UEL+a2VoCcS5WydtbvbySlIOq9Vto1tTl/O
 2kfxOd8bGutN5dQwU/LmQwVxK856VZFe59TrXzp/1PxZPnMd3ozbQsd8olgkN9FW0igXpQPI7Kh
 WGwRzQ+0mLjAAc+y/krcR7TafmdyD8CvrEOEg7RcT3fuJDf0WVw5gtgBfAzmh5eSgiU12iiBd00
 2xxhgtNgCP3tvPvbQ3EKkCX0emugYI0emr1i5CTL5SsMa0oNy/aAWG2qx9Wv05uTmf86sQeCR9U
 WgOggdcWMsM5LGvTQBoH3Ysqpvdecw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010124



On 11/29/25 1:17 PM, Krzysztof Kozlowski wrote:
> Please, please stop ending cleanup.h patches for very simple code like:
> 
>   foo = kzalloc();
>   kfree(foo);
>   return;
> 
> ... *if you do not intend to read cleanup.h*. These changes are making
> simple code not necessarily simpler. But worse, if you do not read
> cleanup.h then you introduce actually undesired, error-prone and wrong
> style of having constructors with redundant values (= NULL).
> 
> This is actually worse code.
> 
> If you do not agree in declaration-in-place-of-use (fair!), then do not
> use cleanup.h. If you want to use cleanup.h, then please read cleanup.h
> before.
> 
> This is second mixup I see recently around Qualcomm files.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (6):
>       ASoC: qcom: q6prm: Fix confusing cleanup.h syntax
>       ASoC: qcom: q6asm: Fix confusing cleanup.h syntax
>       ASoC: qcom: q6apm: Fix confusing cleanup.h syntax
>       ASoC: qcom: q6afe: Fix confusing cleanup.h syntax
>       ASoC: qcom: audioreach: Fix confusing cleanup.h syntax
>       ASoC: qcom: Minor readability improve with new lines
> 

Thanks Krzysztof for fixing the confusing parts, I do agree with you.

there are alteast 100+ such instances in just sound/*


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/qcom/qdsp6/audioreach.c | 28 +++++++++++++++++-----------
>  sound/soc/qcom/qdsp6/q6adm.c      |  2 ++
>  sound/soc/qcom/qdsp6/q6afe.c      | 10 ++++++----
>  sound/soc/qcom/qdsp6/q6apm.c      |  9 ++++++---
>  sound/soc/qcom/qdsp6/q6asm.c      | 19 +++++++++++++++----
>  sound/soc/qcom/qdsp6/q6prm.c      | 16 ++++++++--------
>  6 files changed, 54 insertions(+), 30 deletions(-)
> ---
> base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
> change-id: 20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-ebe8abad6e55
> 
> Best regards,


