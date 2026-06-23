Return-Path: <linux-arm-msm+bounces-114090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IgoFKKAkOmoD2gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:16:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 141FB6B4661
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:16:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LydqS1Yd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=deh5DDAR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114090-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114090-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4BF3301DC0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 06:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5167F3B27D4;
	Tue, 23 Jun 2026 06:15:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C593B27C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 06:15:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782195355; cv=none; b=KOg9/GKSVs/TR/20IeR4jLa6BcXIIIZx70/Gf8FUM/KrE1iYJoFG69jl3Nhz2M2nptKXAoyiQNdQ+Dtdl8Ltc1dkX9wPqN79AiTg3BZGf6gKk3JYvAHawiCrhI1dgKBOagzOxYGcrhi9NkvYRLYuWTlW+wfJdoP7GOBos4asJ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782195355; c=relaxed/simple;
	bh=r+QwP6LsyTv96DBBOCSXo9UgKKhTI4kus8km4k1SIwQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j8cPO+jzYUd8eS/8rpWxcd9NUZSSRORYaVae1QMxbJt2mjQQLc/EZHYyXZRJTFhmD9UgYVedLm+Zzq1tgAiwfMh1sQs7xJIEXrZua8aSDnXSouRVRQg1WUQmkNud2PcuAlF9hRdMA8gYsIEaBmpjMAe1agpXcjZz+D3JqgTJAwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LydqS1Yd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=deh5DDAR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N0iCS82272079
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 06:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/BdfD2Hn5Z+F9PtziK6FSHnE/qmCQyxnK3dzd/CpHI=; b=LydqS1YdLlPIDn4n
	Mgku8rZe1uMfbqyGMNrB9ICzpImjPydxdrUBHDemlLaKZbvZOGFYVIDJfSLoit31
	zz4MiznybUPA1eo3BnMzg/UzZoPqBoq0+KE6DnXTipT7XjnUKGzsjht3R6Z4O4C6
	27IQUKodf/0ITkITCKASGR/FMOx2Yy/KkLbbx0dncgAQMbmiKXh3D7WJGWgEVJhh
	AUlsii1Funv3ID4VAaE3ian/7HD3cfnPIWREGRLcQCPR1SuqgGGjSAj30yc0brDw
	K4dpBKxihFyAgLtghOtFYvhEScB+HYJTVSWjn+E/ZSR4M/hCjvoBluN8VVmBFHtG
	N0vPsg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yjbw3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 06:15:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7403e80b0so46563905ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 23:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782195353; x=1782800153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/BdfD2Hn5Z+F9PtziK6FSHnE/qmCQyxnK3dzd/CpHI=;
        b=deh5DDARQlWsONG4Pd2HAUmZmMvUk0NT/mII/wov/cVkq6fo2oaULtLYeySTgUQChM
         T/lCsaDZxw4On5uw/+PT27kjAtZt4unYSX5ZHEURC8vDrRJtyYAcdOtgsT6W8hpfM12r
         Mlp6w1FF6q2XbkWoJ6XxQx6UBKKaNcF0jNmX8dikw0SVrGkK90izz2bs79Kdb1LuISed
         PXku6MDBkbI2BAD3ChwRUbuhu44xNPtikzj2tykkWB2c+cJ8dOdnf6WMBqgU98WT1ok0
         H2q97cqb6yKhX3PY0rxQXxpwUMQHi0Y1x3iTJE4+uCcc9lwQ6Qb1RQp56AtDLJHUbtbF
         fkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782195353; x=1782800153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/BdfD2Hn5Z+F9PtziK6FSHnE/qmCQyxnK3dzd/CpHI=;
        b=HmNdwP2y+kyAy+Qoz+6u9eTe0yQBpMejRQJnbF2zEL7IRQqiVyhvas9xurznqcQ5mx
         oQ1j4Dr9ZqdwaVj+DMjlYdkUTmdRfA872T0k00tLUJ2TlIEW9lcy4ReczA0SPeb8uMr7
         xutJmKMIwNJmWSmZypNXkhgCH6RPJ5riutCV/leTqmZ3WOSTVZGvuCC2V6+tFuTvqTpo
         3lzgoZUWFBBOHIH6Zngq+z8nmTVa9Mbt/AyV1HRlNosQDCriXDFT6FDIo7d/dqnXUsi/
         nbzGFSNDYu/IeiRVkn6JZMJ+H6Dygj1R4zHoahgKw2aPra0Ocm1Si3salGIwMx/KO6ez
         nB1A==
X-Forwarded-Encrypted: i=1; AHgh+RpgSgNjlOMVfI5cCNlN+JqYcHO1TRnrhXxqeKVfIgZ1A6tfRHKnuD8DkaIfwc9t5u2oihXmU6mNdCj8I4pg@vger.kernel.org
X-Gm-Message-State: AOJu0YzCRtYYlcLfst8ppIyyCUGJPKeq7f2Tor4U7x8RXekHKC8KySJ8
	Kkzyo1ruXSD+1KZLsjmtzDWzhYVBBSxOHgvemJ2+/ACRwSmBAhwd6yT/1SxJd/8YMHXErtgVqbQ
	hKscdEq3TDBFTBYb3xxvDJ4ZehSKunQrZ7wiV/LyVBnG4kpkC9qXTty8gYA2epBVXBv7F
X-Gm-Gg: AfdE7cmyp3zeD2fIUigydd8lZGs2AmjFuKh9+8fdtYHix42QUhNn4qneP307JX6R5rm
	EuhtlsNdLTBBxPxjpyiXdTET+YJdOsd95lgKT/sQnq2eBnwqZiH8lrVVt3A+utLSCSHeee3AIC1
	s+lMfJvmCkoOqZmmypSmN1Uf4eo6duA2Yu8cIsH0zOi0bXPCdVCWq+zIIGROs6Hen0RJJKbehxp
	3WwkN/Kl8QGmpS1YrSCdlCZWH6u1VA+xi2nhrI70oqCzYftU2FRM59QMXJ6+8qMW56g3bd9PvCd
	NokrPATZx/p6kgXPTBeyjfwtlgK9YV0U8chIf+IZyMF7QnoBhJzeag+OoHBm5T7pLLb1aoaJi4G
	hiTlC3tR5fjk5FYlSsyxBjCftFr0Xj2eWaP7gqJiC4zpTiUWwgPIA4dgtAgQA6LHGhrWl3RD+A4
	XEOfbwIA==
X-Received: by 2002:a17:903:2306:b0:2bf:160f:7043 with SMTP id d9443c01a7336-2c7c9aa7eadmr10846885ad.34.1782195352600;
        Mon, 22 Jun 2026 23:15:52 -0700 (PDT)
X-Received: by 2002:a17:903:2306:b0:2bf:160f:7043 with SMTP id d9443c01a7336-2c7c9aa7eadmr10846405ad.34.1782195352091;
        Mon, 22 Jun 2026 23:15:52 -0700 (PDT)
Received: from [10.249.22.156] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7444aad99sm113552035ad.80.2026.06.22.23.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 23:15:51 -0700 (PDT)
Message-ID: <45fe0be2-a397-4677-a7b1-527574c7578b@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 14:15:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/5] media: iris: add support for purwa platform
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
 <82834dc4-14da-4a92-a1bf-4b8e744094c7@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <82834dc4-14da-4a92-a1bf-4b8e744094c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EanPEmWaz430OIUuvj0fpqrJxMpuDntV
X-Proofpoint-GUID: EanPEmWaz430OIUuvj0fpqrJxMpuDntV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA0OCBTYWx0ZWRfX82zoECdL956+
 zpnxwb27K1Aa6iIoBqATUHhrvt5be54cm7B2Gf3k4MJHHwa6CL1bt0Ozy44e/NnoS7rmPovKHMw
 IKSuM6Rif6tPT/gvHBNIm+bBi6GKYm4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA0OCBTYWx0ZWRfX6cclCUTV2HzE
 E8jSM5aNW7E1rc8pZHviNV01kQZTCbBOMqRwJYkYsd63RTPYlCN2wW3AJFXXwzLVv2eQ688ZEIB
 iVipTjgxWLJGIMeR5Uy6Hv0EeH3iigN8Sm+AtrklRS+kqvsqWicnYF1HyQaqccgUdJJ5ALZH24S
 lHITC43URtbySqjJfJpI91RTxxe0aJdWECftyZm9YVGQTWr32qCY1McSdysp4cVvuLrj7gwvCUH
 qhaAjz/LFggMbD3MKDTPWRKd5jDPKIgIGmmUXTPOhCQXYYQmRap94bHGKbkWmY5AJbBkhnWs2q/
 xhIlB6vI+fhrpKatEraLexY0uAJ3Hr+H2nk+9MuqLqc0nFbKq0APHm63OD2XIFNRYWotU7kJhNh
 LRrlFyAt3MQg5Qy1r5vtJhc2beE8tjUTwbZ7s7owRJ6wSfsk2vU5HIQENqz/cmuOxvKH9LfQozT
 kBXF6EakAH4ADCE7Ghw==
X-Authority-Analysis: v=2.4 cv=YLSvDxGx c=1 sm=1 tr=0 ts=6a3a2499 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NLMsfvOWJzgsEXNEpJYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_01,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230048
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114090-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:wangao.wang@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 141FB6B4661



On 2026/6/4 14:48, Vikash Garodia wrote:
> Hi Bjorn,
> 
> On 5/29/2026 1:04 PM, Wangao Wang wrote:
>> This series enables the Iris video codec on purwa, allowing purwa to
>> use hardware‑accelerated video encoding and decoding.
>>
>> The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
>> except that it requires one additional clock and uses a different OPP
>> table.
>>
>> Therefore, purwa can reuse the Iris node from hamoa, but the clocks
>> and OPP table need to be redefined.
>>
>> All patches have been tested with v4l2-compliance and v4l2-ctl on
>> purwa. And it does not affect existing targets.
>>
>> Dependencies:
>> https://lore.kernel.org/all/20260409-purwa-videocc-camcc- 
>> v4-0-5a8e5f2dd4b2@oss.qualcomm.com/
>>
> 
> <snip>
>>
>> ---
>> Wangao Wang (5):
>>        dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
>>        media: iris: Add hardware power on/off ops for X1P42100
>>        media: iris: Add platform data for X1P42100
>>        arm64: dts: qcom: purwa: Override Iris clocks and operating points
>>        arm64: dts: qcom: purwa-iot-som: enable video
>>
> 
> Media patches in this series are now applied. Do you plan to apply the 
> DTS ones ?
> 
> Regards,
> Vikash
> 

Hi Bjorn, is everything going well? If you encounter any issues, please 
feel free to give us feedback. Thank you.

-- 
Best Regards,
Wangao


