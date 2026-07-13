Return-Path: <linux-arm-msm+bounces-118683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1GVSBKOjVGqJogMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:36:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F2D748C77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:36:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kHVr6hFX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BUX4wX4t;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118683-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118683-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CDC63056520
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715303ADBA4;
	Mon, 13 Jul 2026 08:27:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BA63A5E9B
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:27:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931240; cv=none; b=pZvbKZ+W1IT/QIUFeTeQ7yf+jaPXRpULcV2b5uDWDfidhLhq5xYk7r1qaRdFo/RACUo9gruXenM/riQoXK2r4IKb8sYW8WT8ptd0uACEA4WHrkvrjnI9U//rLd5dL6PAsCyW7iVWipZ2h+IroyItmqnvlgskpaF5gV5C5wdOA9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931240; c=relaxed/simple;
	bh=rTqT5pIKCF31nrq4i98eOmJtbI40y4p67HTEO4XR8CE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaJF6tpsF0ccVzLz8Cca1UDhAVCRHyfA8INViJtp83AMawaz5YawfZ0mcg7gBc7ABN5S3sWEBVZ8ykHPaoKx+RGFKtMBfmMC8u9/4oyQ0/1JQUeXMm9Fp72S/s52R78cbfMzUymtH1Wyh9GK14/UHpQcmpI0BZxPE8mwG5Vjgtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHVr6hFX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUX4wX4t; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O7JQ473551
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BbF+Pq7Vc6cfmQhQ+gA9qh1Ng0Me279r/rgd3g/6AuQ=; b=kHVr6hFX8abqGXCZ
	/inwf/a/KyYRhq4nj2z5rFiJ27ePbFi3BiLZl+NNlUhdePQD3bFzTXkxlibw2EfP
	vHSzsWVULO4ob/TF+jLLIVkdSHNRW+CY4YMrX9/rfkNWKg4tBkTCx/MmhCTpJQgb
	vFxu/50YUMiMZwRuoEiUjHm4cwqfioS5m9uK7rz0a3m+nijd4jzQOLv0MJhEwV8g
	9w0bk9jOp8usRJjinpv70HBCZAR3wMU+B3VUaylxP+PYQQOkaID3Cru5zMSYgZ4V
	+AQC0+tqgk0lODOz/jhw3ODmGIu8Ef6D/l1PENrJU3SD8kxrpeqgZ7qnLfoxcShA
	ZoiOrw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9n87r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:27:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8eac2620cb0so48829946d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 01:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783931237; x=1784536037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BbF+Pq7Vc6cfmQhQ+gA9qh1Ng0Me279r/rgd3g/6AuQ=;
        b=BUX4wX4t3RwhRc03gntAgstAxvuPgJ+T9nOagTZ5aPi3oJK9vFpYXKlqhks7czebzh
         o/Y6gYueLqOWTYQ7EuKapVzoiKRasS2HO+1nz6qjru+neXas80dkCfNH/H6o4ekg8u0n
         gFzS1Vn/vrUV/loDiM9pxwO+jiJA0Lht+JlfE1ErNPWYc/Q7v3wSh0M5kqO+t7YGgNfq
         3tbKGssGfQ40O37v9a3qTEQmLBRNX4h7ZQDQa0atGeT7eHA3bmsAdrQ1KTfdtbVHUmDl
         bbmyJhHAqUo0ajpQnPR2k3DOr3LUWfGBaFI7nTHRP2L9qG6Ww2PCzWZNGPm16I5Tn7to
         q33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931237; x=1784536037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbF+Pq7Vc6cfmQhQ+gA9qh1Ng0Me279r/rgd3g/6AuQ=;
        b=flSo1MSK4ey2R7pV7UrzJqhxe+IwD8BYOsE2NJzZkeLVjxMMawSHJFTOxPXWtuxq8G
         5eTRLCpTCBUHB2LuCUmBGPz/FGyyQbtl4vSgpI/DJ6FSEezybSMfYFKrJa4XXfSLe6Wn
         mCt/mexWCPGdxopAB+voM7JIYduL0E0PVhgjpeZzeoSE2xcC2INOiCQJmmfX/zzIJYsr
         D4BvFxq53mkIxOfogQzZb26vdRKzyB+Sl8IK8bas9nurhKxbI6ZWZh+lSotGYLyNzRPK
         RaoDocNntRpGsYTL8d4ZFi2yhNJMwa225clKUnixt6SoHBPXrqVW0evFJrjESR//WMbc
         YuQw==
X-Forwarded-Encrypted: i=1; AHgh+RoU11pBGxYNVsJ8kNqZ32t5A4DyK2itNmRAOOcV9QlDoDmJtNNCYSwC16BaWKE05K82HnorgcULcmLG4dB8@vger.kernel.org
X-Gm-Message-State: AOJu0YxHwTYWm0hC2NN5uSUWbm+yWWv+F+TAAYDQ/2lNrrnquK9Malo4
	Y8EY2RpThCxIRAoD88KcxsJZdbDzu9hsyBPC2dyQHIfud5JuEtrPeTrQDA/i5pDpIFqwIQytNQ3
	YtxN3Epwkilrb45wULX3Bvs5Zd1dgYHOtopoFzJZnV7G+7m41U99faKz+3oh5Yd6Mrknc
X-Gm-Gg: AfdE7cnBhB6X1AEl93kKAK3Zl+nBxc4IOmprhjrKJosMjwwHxdnVQWKp8YoYwF3vByu
	9cqfnDqAHlQUz8i8322DRkov3Kpx8/8GKClQSkr3cqGfU5Uzmytm0FZzPLp7p2CVgq6hXgioGh2
	WzfLPEtHkwKMeHrVEIipf8EEVJXrBEy4jV1Oe50tdw8B5yRzUPtDyiMJhnkAcuU5Q3gziR6Umgq
	98cZcgIK56/0r4/Fn0QBfdM0RFfC4S2heOJJGMNo4l0ZCLjdEIC8QXKfmwc2u4V9Sw9R836cN3C
	7+znU96iVBe3FVpg/scTjqDb0R1VinfQehzBppUc3sFnNlj6phT6pg7q2kFezruhLb2kTKCg0jZ
	GHQazgm4NjJeVWwbRaQd3nJNA+6c5gxBCXcyHcTgvIfc=
X-Received: by 2002:a05:6214:2387:b0:8ef:e3c9:533e with SMTP id 6a1803df08f44-903ff761684mr91705476d6.9.1783931237456;
        Mon, 13 Jul 2026 01:27:17 -0700 (PDT)
X-Received: by 2002:a05:6214:2387:b0:8ef:e3c9:533e with SMTP id 6a1803df08f44-903ff761684mr91705326d6.9.1783931237070;
        Mon, 13 Jul 2026 01:27:17 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cf68f5sm15008388a12.13.2026.07.13.01.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:27:16 -0700 (PDT)
Message-ID: <e9399868-a6a1-4bec-b067-c1bed8e83ab0@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:27:14 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: media: qcom: Add JPEG encoder binding
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-4-atanas.filipov@oss.qualcomm.com>
 <95207310-12ad-4c2b-9ebb-b0a7bd27dac1@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <95207310-12ad-4c2b-9ebb-b0a7bd27dac1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX5nODQ4Zwav4q
 It39nSGQ2IrrcAUxkh/KueRIUbfBVk90Ou3XrRSvlm3bHBp6aEcwDj5VA5CnrQP4PnHK3fNwXUO
 vw3mRgTLPmuSc92d72Un0GObNYECK/E=
X-Proofpoint-GUID: Wv7pADCtlCN86_m6VS3t2ObybYCLhe5R
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a54a165 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=2tE1FNNbuGYNqW7gzRAA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfXxw8jJHpKVl84
 br56saKOMSar+aKjoY9+MJnrsZquTLrb06cbJ4kSs30enefQ7ixDrt5Xv8LyXBibOdK963bfCHD
 zPYFRorFgQdMyoO2z/M+mMZKEJ4uBaWW0lEylWg5yPQYp/mc7LjhYo31Y9czJc4I0PYb/7WoiyW
 rC2RnxrckiqR22O0Y01QNwvAspwxQKjMO4+5+P/zmiJ6Y2YPkmtXYmaETdlyJt7ijTiiSENTSha
 MYlzdXSBeetFKfcCwAuip4W5Po2fPg8jamkXljb54M7lFeohNlAeRt/9uA72fGsOJGwm/GqtNpc
 5ue1CEDGZ+iKNQbKLyqk2iMQk+Dtuy3SR4rb0cYQoHD0tVxXIBHcyFGcar00rVeBFC26dXxKJZq
 9t3wEcylU9VpOWINYTQaG+nSDvxaJa+faygunBWChKCavTCPjxY6yWFCPmZVU8ht5slcFv+jTjX
 XrHZsVvG+U0BsESp85A==
X-Proofpoint-ORIG-GUID: Wv7pADCtlCN86_m6VS3t2ObybYCLhe5R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118683-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82F2D748C77

On 7/6/2026 3:17 PM, Krzysztof Kozlowski wrote:
> On 06/07/2026 09:11, Atanas Filipov wrote:
>> Add device-tree binding for the Qualcomm JPEG encoder hardware block
>> present in SM8250 (Kona) SoCs.
>>
> 
> You still ignored my comments from v1. You never responded to them,
> never implemented. This is fifth version and you still ignore them.
> 
> Please go to the v1 and respond to EACH COMMENT that you acknowledge it
> and going to implement it.
> 
> Otherwise I do not see how can we accept this, if you keep ignoring
> maintainer's feedback, even if that feedback is about trivial things.
> 
> NAK
> 
> Best regards,
> Krzysztof

Apologies. Inline replies to your v1 and v2 comments have been sent
in the respective threads. v5 will address all of them.

Best regards,
Atanas

