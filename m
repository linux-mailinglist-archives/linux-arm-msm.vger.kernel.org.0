Return-Path: <linux-arm-msm+bounces-71996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A9EB435DC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F04C17AE153
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 08:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09172C032E;
	Thu,  4 Sep 2025 08:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cyj21BVX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815282C028F
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 08:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756975003; cv=none; b=C+uBuIrJYrk7t5JirGq64PkwVTm1MnJSk9y54QjXRVaxx6P65pdQYib8EgdirEn9qDPfR9myCtLlyWGx1jx+YtyPytZUB8dG2cmkcBQ9AMEER8JKiZToGNIXvbSGrXPESywhR3MAb7oPDE3BtveNc9CjVcHJ7YgMBQXFhj5msf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756975003; c=relaxed/simple;
	bh=wlXLu2i/WQYmekM/QAUNxFzAI8qAFenvyNsA9m4Q1lA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xo8366RqudpgRA2MpzTUP7VwVdiWKAvOhzvqksRU7wxC6Vy+3Y0tjMXdXKA1L9vdbZmHC+Y3GHzi+C4sfd5NC+qRuVBW+9H4lV5Blqg5kM3Ftt+2sT0T195KWONtfgj26Clq2BJ0cr13cErnfx/thdXcHfNH0fZAIBDKQLLB8r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cyj21BVX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840vvkk020914
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 08:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ob/9EPKXbAlmq/wMeNAH2aKycYOp6bcGcPl57wUYZt4=; b=cyj21BVXV4SsgpDw
	mq3KR6OkubGAtGu16ar7rYRYtUBmKFSUYhUKDOkIKlyqQhNHRTLeKxfASbUHBDxr
	Y/gJA/zaECPwGXO3MXGNbWF6efQpckYMPMcDWkye/0meX9LlOmwcEJOwm1kPkx5P
	lioAugAgFPBZHvmKQUN6SAoNhca+47+ADh+is6aTd7xymm7QoCIvdjZNtOmTORi9
	h5H32XH4D2XBff7iTmWuKWdliulxSFqx2gyA8wA56besVkcs2y2wHtkrvLS2QLur
	WTxRU6HWjH5yZdYcpe8fy3m4NZhRHWWYo4+LX7bv7+5KdIyGsuofXsqBrpNBoSt8
	UUQkGw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fpp59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 08:36:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-726ac3f253dso2703736d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 01:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756975000; x=1757579800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ob/9EPKXbAlmq/wMeNAH2aKycYOp6bcGcPl57wUYZt4=;
        b=nlV1W2FavTUdu3WhyKiVQFhah3mgT9FndfYJLBqc7Ol8u1zj7AJ+S8+eUaxiSdki67
         RS4EgX/7f2ONVcshYZ+O4jef9F/r9JTsJdmBtDWJSujWnLb9t2kUEEbDGFWBAtWroS7i
         HAon7qiRStvZdWnNXhDfViIJwoxEb7i41lIGYzaj1nYwYINxmLhpwIzrHw25yAw0827J
         C0N0geRSY5NJWFttyb7b3GiUBOSDY98zucPZtdq+9EnS2DCgdIXn2bibZs/BqEcAChgN
         3AObG4xadljnr5MfpQFtUKRDlWWnuZwapYHLGuyyp/jw9rD68Ray0svKsikFx4yuwUYu
         bvfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeiWxQ7qZ2WRVKDdqKYDu2xS3cFTk4k0AHX0UMwVhSo2XNQX2Apw9hHTKj7J+MACNagfgTjleIiNaIIW0Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyZfRkTqufAQMzHMeARNEouxxDAc3JrX5x5hDSlSj20R0wnr1hF
	sc/Ka6cuKDQ7nqJH7Tn5iHoNf3lMwe4vkjl+ucfxP8CLbPJHwp6L6htXpBE93hYORM2uXUaRmWi
	TBSjdH8R0Ep2MBCAZHgKyrdOoC3w9TAQLriyl+ELhEifLHcecqEOVfZXAq65HBDwJwR5U
X-Gm-Gg: ASbGncvaY8y70p+qDVunhDvidiscUCoribYWNKi27BCtB2aGnXQI71M9LrolI/OCAkT
	Lg6uxV6elfAb/C+l/CtISt0e9ctKV67Zzd5V9qNCZOFuO3PmwQ+zZi588DtAaKQsjf3Icu07ans
	y55JnbHu08D6NCYIeHjtrzMbTdClFAP9d0BZ5PhTjWNaZ4dBBOYPlK9hGPIJMvkp8Tsiqa92mbL
	beEoNHvzSDV+Tq8t1i4HrusnF5mCIeh/kA2h/8yIKaQKpYhu/PXojyQvJkG52D4xqGYGwLcVy6r
	ee8h5PGEN08pqwykepZQW/ulVJRcsFXzqeoUfbPhmY+x/dlUdxiiaMnT87J9Fk8d1tTXGyra0ff
	P13ki6PbE9XCfqF5B5xi5jw==
X-Received: by 2002:a05:6214:5006:b0:723:dfda:4da9 with SMTP id 6a1803df08f44-723dfda4ef2mr40388186d6.5.1756975000299;
        Thu, 04 Sep 2025 01:36:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvAsFu4ylylSfq9/uyfJ4vjffVIaIc5Agek8eq9JOpd99sdw5nqzrfMbFYkou3AOlz1I8NHQ==
X-Received: by 2002:a05:6214:5006:b0:723:dfda:4da9 with SMTP id 6a1803df08f44-723dfda4ef2mr40387986d6.5.1756974999549;
        Thu, 04 Sep 2025 01:36:39 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c77d0sm13953740a12.11.2025.09.04.01.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 01:36:38 -0700 (PDT)
Message-ID: <be87fb2f-7036-4039-8ba2-63d54a9ae732@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 10:36:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 4/4] arm64: dts: qcom: sm8550: Add max-sd-hs-hz
 property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sarthak Garg <quic_sartgarg@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250903080404.3260135-1-quic_sartgarg@quicinc.com>
 <20250903080404.3260135-5-quic_sartgarg@quicinc.com>
 <6deac56f-e21a-4447-bfa7-a414084676b8@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6deac56f-e21a-4447-bfa7-a414084676b8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX+/c5ozXQRw3r
 kygzgTmFIdhdoL9wGjylEVpjrBlfLnVfhRU2k5hDqXba+AaVGL9rCjI3OJQSVXArw9e+SoruWYd
 RAiBUvH5jye7QduxmnWvKw8Hrf4uN6XGuKCcG8CWwoW24C6c6vePIDZMpkqo/MSeLy/6Cypdsry
 3PaMNn4WgVtv1BX6VIIlf6YF6n8vP0pCGY6vt93s5XB4OJ5xuOHJBv5tI/BzJeYgv1vnAiEUsJv
 iy4VNqnuS0A/UKV63wQd3I6qCQdq7Eyws756/2GUd/ernN6RaC8E/wkP9r8qULOEqGnE5PDEAWm
 xHSdBb13WoSNKoW3q5TBcdP92oPUV/T/c0SsqX/HKfiPzaq2z6hqmOMOS7HY0YjcAovbCjFEoyY
 w3mXwCnC
X-Proofpoint-ORIG-GUID: 1KDXOtj23d2mf0B2ykLQyaAq-Ukhrzg8
X-Proofpoint-GUID: 1KDXOtj23d2mf0B2ykLQyaAq-Ukhrzg8
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b94f99 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=yp4Pn_RnPQDUuFz1ZG8A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

On 9/3/25 10:21 AM, 'Krzysztof Kozlowski' via kernel wrote:
> On 03/09/2025 10:04, Sarthak Garg wrote:
>> Due to board-specific hardware constraints particularly related
>> to level shifter in this case the maximum frequency for SD High-Speed
>> (HS) mode must be limited to 37.5 MHz to ensure reliable operation of SD
>> card in HS mode.
>>
>> This is achieved by introducing the `max-sd-hs-hz` property in the
>> device tree, allowing the controller to operate within safe frequency
>> limits for HS mode.
>>
> 
> Probably we will now replicate the same discussion... And it will be
> happening every time you send the same and not reflect it in commit msg.
> 
> Bindings say board setup, this commit msg says board config, but the
> patch says SoC. This is not correct.

Both are correct, looking at the problem from two perspectives.

The bindings description mentions board-specific limitations (e.g. because
"the board's electrical design does not allow one to achieve the full rated
frequency that the SoC can otherwise do, in a stable way")

Here the author tries to argue that almost all SM8550 boards are broken
in this sense, because the reference design did not feature the required
passive components, making most (derivative) designs sort of "broken by
default" - and only some (if any?) vendors decided to go with the
additional components required to lift this limitation.

This in turn makes it fair to assume the developer experience would benefit
from having the SD card high speed modes always work (with the slight speed
cap which may not be required for the 1 or 2 designs that took the extra
step) without each board DT creator having to track down this property
separately.

Konrad

