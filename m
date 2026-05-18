Return-Path: <linux-arm-msm+bounces-108196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAlLMF8IC2r4/QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 14:38:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0A256CD45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 14:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC60D303976A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5200409DFC;
	Mon, 18 May 2026 12:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="alJFwTo6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y/wM2dGf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAD3409E08
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107375; cv=none; b=amKGNIA14cNCrHJuS0OrzrQlU67lm/uRrlHhp+h+5iNwOBaYzsLVVz6dhAB41F2bfbMv+lXsh8ywc6ZzHngNOoxb29uZcauHhZ/o/L5SvHQdvL+j3LisXQLhQbHbBpkqW8Mu8M0Io19WDNrw5pDIwdpuIj98wq6LnbQevz2s55A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107375; c=relaxed/simple;
	bh=mxwIyObiYLew+RMD9ef6gvDp0rgNv4b1gNPBeecnPA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHKTofroFdrdj5ngfOcz76+02mHNS8NDJYKbCleCgDaH+kBkQxoeQVUszlQchpFRGSnGNoW7jjhY/wvgj/WYPskAG/lqEGsVZywdgLb+HfTyyE+Ax7M9fm7ifWe5xDRScEwdEAl8XRRjYJ3nRRDrHnnoPpFh/YkRGqX43slXJK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alJFwTo6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y/wM2dGf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7vYn22531321
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5qMqCNm653oTP1Mjr92eilD58HXRrBj1IgwnDZQjmEA=; b=alJFwTo6NVa2ATAt
	/9Eft3cm/JnKwJ8f/SMJrf1CNfuibVm2lKneT78PVKgsDRKq7nv8c931Ro+EAABO
	aX61g/Y6s0GA7xbp8R+jVJmv0Q18qRHQc7nEuS/wHJV+f8t007FUImmpX4Rm54Si
	HX3svna9SZz7O39GLyA7Suz/YBk1wpQMqCPo0fRlZkMxXls9Las5anmk3DzsXEHo
	6Cd3UVbG4S4882yhlSZQ5u/QDFogiY4RMYhyhezzTgf3ifN4+heMOqqfSNBGQQxv
	EYMihVO+2HAvz+dQGfJxYb0e7cCplOHNpuTCooPS141VUXyFjlBbumknwAPNDPq2
	qaTbqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcn9r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:29:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb98b09d3so8109351cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 05:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779107371; x=1779712171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5qMqCNm653oTP1Mjr92eilD58HXRrBj1IgwnDZQjmEA=;
        b=Y/wM2dGfcOp+luJgH725KgShVyQ64wQq30znD4yJBsmJw4puohMdWpuHseLNQNB0hc
         E6eDN4pfDWoWBUu4ZFTUe5qDxT+teO6iTGA0/hCxpZMhJ2w5XLN5WS8KjTL2opC7P5WA
         K14GH41xSqQ+aVn8UhVSXrhgwdmU+N6KjqEV65uNf6Ygh0z0n2QO5puktz8LSEzeYV3x
         ocfZhaq6VPR7f00pP8j9k0mX8RD5hebVn38EQvoJ6oxO9jcmMCA+FY6de10JXdPfdxys
         UVCuFAGgZ+dFzK5k6tQooi/2Llpb7amBym53rzBrbxPqzAzjQH9s4CSk+gDc8aZF+P3M
         hL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779107371; x=1779712171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qMqCNm653oTP1Mjr92eilD58HXRrBj1IgwnDZQjmEA=;
        b=gZkLhz5B89u6yk0sfpYU/8TB6LhqlN2Zsi5yWOVDRDEcVleRkk6HddmYEH6OvyWjJz
         TdNqZevdNAdR/g2IuF3DiscD2nuROEvt+NcgM2kSf2GyT45OHoV+yvClVwrqVl+Wq5cl
         Q4MuFQRg0LwEbzybvz6H1JKlqfYrN73zliRVn1SxUVWOtbU1HixUKMh5/II11whFs6uS
         ikSCjZ5OTbi3QSbR0pU8ooYadEf3i/CUFnoQ10c65sHgS9ndSyo378zNZlYs771YPUMF
         cZLN4eEQgu26RfPmTgloty46jyRsKXLVDHbrHMxvWnepOtmyobm4msAvq8G4YPQdAHbr
         +IBg==
X-Forwarded-Encrypted: i=1; AFNElJ+m3Y5X5N+zSjwx4WEJ8O3UzQNeWm7FYyOzs6VT65X5u/kkiXVGFVTpglqA9L+y5I3alKmtDL+0TGXBi5ct@vger.kernel.org
X-Gm-Message-State: AOJu0YxIuP/Suv7hC16QITdxrnS+qWPz9sNaouTYcCkQHFdkJO+vLT0d
	TWlW36gj3TZfvupVTOi6Md5Epa6HKk/i8kSWyLNRkyAJeOLY1CyU3tUqe/ilDjVc2y5Q9/6K7tQ
	SS2EsTIMl0HNgR0CbZw2zbdy8NVYl7ZxCAWF7rT2Ga1CQS8M4VOAM9hTs0oRKjo+MO/0r
X-Gm-Gg: Acq92OHmrHxhDARSOcDc5w1903KMMElcfuhmU2Qr5nFFnUjNzZdE6AyBz6HElGzTDZn
	hSHzgJvvNVFYWmnehZj4e+rZ9Okf1KnXsPGAHWNKN4qw55o/32GjgUUuSiyUfli4AHqq2oIr74l
	d67ECyHLBJQiX3vMl/gslDuya0Arw1So9mM5jBCWsrUHS/ynUMmPTqElQdTXxvBNL8LC757YjCH
	WY58ZjK+I9ozOpPj6T33ldUZqZiAXJMGT4lX7zXETA8uvhRLBtpqHs1FvwLVjpSmPyM0bFdnQTG
	sO0lePyLC8c/d06OiPtMahxyqTvlBsdkKX9l7122rS3LwS9B/7EN2gmQXIqjiVtbz/b7x0RDZTm
	yR/H6aQkW5cgdx781OvnSWn6h1D1Pi/3g6VkRbBbjxleaqCMY4A4kVd0XMqKt8em/n+R1sKKHxG
	4WOmw=
X-Received: by 2002:a05:622a:4a83:b0:50b:2875:5782 with SMTP id d75a77b69052e-5165a1fd8a2mr128534921cf.6.1779107371271;
        Mon, 18 May 2026 05:29:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4a83:b0:50b:2875:5782 with SMTP id d75a77b69052e-5165a1fd8a2mr128534561cf.6.1779107370774;
        Mon, 18 May 2026 05:29:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882c41c1sm11469281fa.12.2026.05.18.05.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 05:29:29 -0700 (PDT)
Message-ID: <0880f634-ea56-4c0e-822d-aa7c056fdcc3@oss.qualcomm.com>
Date: Mon, 18 May 2026 14:29:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] phy: core: Define TBT phy_mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-2-71d827c49dca@oss.qualcomm.com>
 <5kwr2cbi3swgvjrzyqxa36rk2jnjlivgsw242shd3s4zbbdv5u@x3qvxkt2xm6x>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5kwr2cbi3swgvjrzyqxa36rk2jnjlivgsw242shd3s4zbbdv5u@x3qvxkt2xm6x>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: r1HTm46r1Pjed7SlBON3vYFwiFZVmTog
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0b062c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pDKt1SVvtQUJ41h8LzoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: r1HTm46r1Pjed7SlBON3vYFwiFZVmTog
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEyMSBTYWx0ZWRfX7sPQsR//O53Z
 yLFnX5Raw/OIvBSfxBj697m5LOYC8qY35IRU2omJ0c72R4BhBjX89IhWsuhRy1DYWd/JdJJMrQY
 KkXgsIcVjEsX98B04DFapPgGMif/DlMQoUbcxupsgr/+H+6QudwF7dKpL4HTiyXydpuIy6x5VMc
 3lYM29ELgDrnh4cjM/dUNTJuaH/SzHvr4wD1UJGXsK9QX/uZRwx6xXZF5fEUXJJV0uSosBKonJv
 L24FegLat+NCFw1mjGHC0SNf6oir+K9wmCCKDoj/zx6K4hAdSonXQwKPRgoRKsPFKvmEkMIP+AZ
 biv7CIXVKlsWoWIE5RrWJfCoNOrrdM3GKQTqI+POWwm5Lwct6cztvf3lHrQQqxWFhgl9HzrcAfI
 5w9No+C7fy/mYHl3GcJocWOTmsD1jB5OnA1THiRQOIOyeQNF5YtXp5zgLnWKqp7V2mOvM9EklMf
 3g40Ks5HJu0JYMOOZIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180121
X-Rspamd-Queue-Id: 6E0A256CD45
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108196-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/18/26 2:25 PM, Dmitry Baryshkov wrote:
> On Mon, May 18, 2026 at 12:29:49PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> There exist OS-accessible USB4 and Thunderbolt PHYs that need specific
>> configuration. Define a new phy_mode for them.
>>
>> Currently, USB4 and TBT3 are defined as submodes, because they're quite
>> distinct, most visibly in the electrical/analog aspects (slightly
>> different frequencies, timings, etc.). This results in a need to make
>> the PHY aware of the actual mode needed (at least in the Qualcomm
>> implementation, but I believe that'll be a general need).
>>
>> Newer versions of TBT are basically supersets of USB4 with higher
>> host-side requirements, so these are not defined. This can always be
>> changed as necessary.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  include/linux/phy/phy-tbt.h | 14 ++++++++++++++
>>  include/linux/phy/phy.h     |  2 ++
>>  2 files changed, 16 insertions(+)
>>
>> diff --git a/include/linux/phy/phy-tbt.h b/include/linux/phy/phy-tbt.h
>> new file mode 100644
>> index 000000000000..5f48059814e1
>> --- /dev/null
>> +++ b/include/linux/phy/phy-tbt.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __PHY_TBT_H_
>> +#define __PHY_TBT_H_
>> +
>> +enum tbt_phy_submode {
>> +	PHY_SUBMODE_TBT3,
>> +	PHY_SUBMODE_USB4,
> 
> Do we need TBT2 as a separate submode?

I would like to avoid extending that unless there's a user for it

Konrad

