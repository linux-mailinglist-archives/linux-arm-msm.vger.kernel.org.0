Return-Path: <linux-arm-msm+bounces-111139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dF4eBi4hIWq6/QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:54:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1D963D60B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:54:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UfWSO7Mx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EfmVP5jl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111139-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111139-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 799D7302769B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 06:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28063CF041;
	Thu,  4 Jun 2026 06:48:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F5E3C9896
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 06:48:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555710; cv=none; b=AzXAN5oLxn0pgmLLkIW23xPBauNc5H7OsamF7ZZBYKrtqqwvA0P2DRLsxIop1Krybx8OdRsOX/sm0pIXRlqLUeoIgLBw0O2uukroWMCygQx0qA5cuYilBBmzq7bajqlet8BVKIEvw4yI9EYkOU4wIxeSrdx6m5OG6api4svTGCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555710; c=relaxed/simple;
	bh=N8HVvQX69Dd9kIE774kAzOwhhXdFQYNCUF0qIO2ez5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Unte9+g0A47QEIqmlRDAz7VliR83iqqmnC3WlVMgAOR1+iagdp/ZwYyUHD7FsgvVMaS5uCvBHq8lPe4JQD+oCV+Poo7XWMyk7x6xV/M5U1fL10ZxVsedMi6noNUW+HR4FH3sO0sXALOPvDB+tf1j8QMBE7DVD7jyMoLahUJ+vfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UfWSO7Mx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EfmVP5jl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6545k8ts1039271
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 06:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	In9fMxK9sgmXOfGMrrhhU0mQcsR1HH4zN2aSpSTzRZk=; b=UfWSO7MxVhWvv284
	c95iqUQLZP9hBH4gDptPODASNAx1Zs6n/iXSuUXvoAh4P9QrM/9P38X/HRIMENf9
	9PgtrzW0YVrJhohUUykx9CdfSthoJBa+UfBD95f9apbQErjAYAEAZw7gW0Ofw9XM
	DrpgvvhuMictYeLxeECOehNUyTG5/wqXKeFxdYtXLkSlPtHPCUq3pMzlFs055Yll
	aSdwfJYobfM6IUW1LHjpJWc/Ayk1BbOZbOW2ZNhiMnVVn0qX9D2yBBdg7UJW71Dv
	x6+Xi/4+UXjxjxdl7jdtTmKlQrAumxsXBxONl+mdJ1NghZOaz9kbaT+emt1gTzOe
	mtGpFQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejtj8j196-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 06:48:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51760f997fdso12558831cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 23:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780555708; x=1781160508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=In9fMxK9sgmXOfGMrrhhU0mQcsR1HH4zN2aSpSTzRZk=;
        b=EfmVP5jlSlGUvzTZ3bVlkten7EmoUweLdQXFGmNjhskjWGc6z0oCSEorFDgYpQxpGU
         /2gtqDwAOJ18EnzHu2O92Z6RlTXr9nn4AwP7JCtvMD5u+Ja2RBZ8bNUzoU68EAeQHwsZ
         q6SXiJz2L+6XxkQ/bt7bU+gDhGKjLcuNjg1U7sd0RWDpBsLhkhkTDAJina2vF5TQqzRN
         +M0ibld3ZoFf0MrCxaoiKbhE3GcYXlhMUL3lk+ieDGy+arvYjbszVgnYSFccGRTIQUAP
         kw9WzKxqMwr27tfwcSxIxnbyofxgIq7nGuqJvpmLLhXXSLmWHg/wba+i3V1bidbtMgpF
         Smnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555708; x=1781160508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=In9fMxK9sgmXOfGMrrhhU0mQcsR1HH4zN2aSpSTzRZk=;
        b=kimToDUrJ5bb+frGy1xGtnuzgiyKwGALgkBdAJFuN9Eo0cMjj8yP3MKXOmpzngESnU
         GGAYDA+bT9efW4YTe2cSZWJMnwKdQlgv64vT8gG5J/ZLyz+AC6ko+AdAzxAGPyn/DSEp
         t1m/EpIB7RSSatZ/ymiBLX8pGjmFXKsvF+4YP3RiBi3FKjcCxzkVTygr4Spk/c6sl06G
         P1pi9E5RownW8MywRtgG0yYrreyRUG/ShlZOpYWxec2t18Enkj02kyX9VTrdW0lFVLQ2
         avCldmXEYq1XqWjfWS/FBVDnMzdBugF0yaxs9pljs2PGQOcobCEQDvM+KGK8w7aQvMe0
         qziw==
X-Forwarded-Encrypted: i=1; AFNElJ+gyJRtp/ZWvToawpF7w8oAxaYtduhHlviyE5B/MvKy7M0JvuBf6UM4axOxGDGwEruY2KfQrgYs7BPjh15p@vger.kernel.org
X-Gm-Message-State: AOJu0YyaLzhjGA9LQzxVYdY0K5loFkUoWgNCWdNnfjgmdqZhmBoVs5UP
	affz77WXeOLPD2wpNX3kLVDmKOHgHADz8DMJ6/sLCcUZMenxQeNVqYrfg1v4I6eF1eicRfzrEJ2
	izB7SJ00ULD8kdfGzZ3AquUGZjqLcc0+XE0I0R2ofVVd801Mc2mU02MDpG/BjvMGaagGm
X-Gm-Gg: Acq92OGwcR+EXlo9fPE6oi6t2jyDu5EsJ7GgcODIBAtWx+W1M0oHdPZHtYBEm2JFFGA
	K0kOzbtK5VWXmbsP5o6uU3gl0D5VnxRK6qd31D1wqw0Kh0FgINXvxlUvJgw/6c9mvL1a9WevSQ2
	kZUd5vzkmdrqgKiEfpiS7smWcvNgN9tnvU85w0n5/qMc+ZEcC/E2RLLA6COQ4b5YtKpN9+WSEUY
	6n7DyYRgP983AeH1ix2+LGOJnscctjmuU9dYsNx/W1lnvwdmMVbNzS7NVZo3Mzk6GK/yy0UA3VZ
	tREUmEUV9YIWcgN/+ERLkVOj4DSIFZCau/o9clv6Jvq+jpyN1TbgZv+H7kuzPe0bCuMumPQO8o4
	1p25vhRLI8ub23QJQK9RQNj2RTB5MPcDlLBeQVcqCfikswOEAHJOQMubRZ/61wdmhREc=
X-Received: by 2002:ac8:5d43:0:b0:517:6464:640e with SMTP id d75a77b69052e-517787ea5e5mr99750161cf.60.1780555707991;
        Wed, 03 Jun 2026 23:48:27 -0700 (PDT)
X-Received: by 2002:ac8:5d43:0:b0:517:6464:640e with SMTP id d75a77b69052e-517787ea5e5mr99749891cf.60.1780555707631;
        Wed, 03 Jun 2026 23:48:27 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553040a7sm257631466b.50.2026.06.03.23.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:48:26 -0700 (PDT)
Message-ID: <82834dc4-14da-4a92-a1bf-4b8e744094c7@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 12:18:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] media: iris: add support for purwa platform
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: y45TQhRe8iuEZwO70qs2IcBczpCm98y_
X-Proofpoint-GUID: y45TQhRe8iuEZwO70qs2IcBczpCm98y_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA2NCBTYWx0ZWRfXwxhsj1kWgksX
 EcRe7C0JJodianK2CrQSLgeweq3fodYtRAiAGtBCqOUY6WDpRvz4RRJyzAKAOHvrq2p0OtwPIN1
 KieggYVS6FNDPmISAtaswQ78ABStJLDS59lfMFhMuUPdXOgEOeUc/Z2B1EsyG5VOnJglb+wCIBZ
 E+oKvUXb+QO1ce7uf3stZaRnNQ0XIXzqE5HOaV/kfjfyQqMUB32YUHYAEbxzKSn1xqtNxlB4Mtc
 Gv3B+nsk8s2DAJSJDeNj7y/NaFl1+Fd7Ha5IhdSDwHCPYgjoDYmZfu272xm6Lv7gRu8gxX0jqel
 fYDlPcLV2SA3UktoI2Df2Qk0IZYSGMzkCXqMU3jHUtMcdZFiA3bqhhGkiqY5XC6E1nOLsukPUOj
 CxI5qr8y5hXHnstvED57MLtXTkkaAVtu1I6LMX3sEIPnsi6VcJFU+TnLXeEzvfGxLr3plnmyOLT
 ytR2Push3qNObBs2hxA==
X-Authority-Analysis: v=2.4 cv=f4p4wuyM c=1 sm=1 tr=0 ts=6a211fbd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=QLLTW4K7kuvKcNWOCmVsWg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WTPBrf-vshRjUhDs8QcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111139-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:wangao.wang@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F1D963D60B

Hi Bjorn,

On 5/29/2026 1:04 PM, Wangao Wang wrote:
> This series enables the Iris video codec on purwa, allowing purwa to
> use hardware‑accelerated video encoding and decoding.
> 
> The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
> except that it requires one additional clock and uses a different OPP
> table.
> 
> Therefore, purwa can reuse the Iris node from hamoa, but the clocks
> and OPP table need to be redefined.
> 
> All patches have been tested with v4l2-compliance and v4l2-ctl on
> purwa. And it does not affect existing targets.
> 
> Dependencies:
> https://lore.kernel.org/all/20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com/
>

<snip>
> 
> ---
> Wangao Wang (5):
>        dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
>        media: iris: Add hardware power on/off ops for X1P42100
>        media: iris: Add platform data for X1P42100
>        arm64: dts: qcom: purwa: Override Iris clocks and operating points
>        arm64: dts: qcom: purwa-iot-som: enable video
> 

Media patches in this series are now applied. Do you plan to apply the 
DTS ones ?

Regards,
Vikash


