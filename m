Return-Path: <linux-arm-msm+bounces-111774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tvNrEDuLJmr7YQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:28:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE66B65499B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:28:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=n2BI9SLn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hrJDt6ou;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111774-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111774-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D2A13029AEB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74203B4EB2;
	Mon,  8 Jun 2026 09:21:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B033B4E84
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:20:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910460; cv=none; b=W/0OW6xFGxhxfCrteB1N9rYzoK0EZC0GF4gwTYuSO/s5SHUCE3BNEnkDPcIgFZIk3gtzzujEUbp4RRFT7WJXYccommZDmnk0BgqTxXHCUJLCqWSkTNfxmeEYkpayL0DGX2QpKtk05TjkvUBci2yP4TFYHtriabZS0O6+Zg/VsJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910460; c=relaxed/simple;
	bh=V3ZB7tbh/dBJlzSpmCP9KFqGD72MYXvj7vP8C9/9tWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j52/rganleocSnv98RwWgNosI+1ZJ9n29r14vUe1HO90VKczDPGl9qlkfjinSAK8roCoibQsP0xsMaOyeKL30qZ0DzimsUOvLaxggutWdjazuEkg/5riJrAkfpX14pEbJvgTq0gsiagVA4DAnykXoHDZ/M41ITcMetTzAMWKlCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n2BI9SLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hrJDt6ou; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OtE02384582
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dm76rGTSr3btxD4sk+JohwPzQz8nsVTx8rS21SkE/iw=; b=n2BI9SLni7ikwF5l
	4FyToO9jutAaAsYms2egJWXPeBRwIBHpqdGz5w5yPNw/OS9fJFgfA7fq5WzkpS0M
	g17RchBt4lvPnkNFre05zDt9kDERh7im5BUBe5ketl3HgShcj+MKOOkku6onU7wN
	7P5vDz+2TXRdh/RuNBlaANPGjZxCurbPI3UzyUmONPcYIUE9WaKwMcniL06aHmcY
	S+tQr6FFqiWXeIPX2E+W43tFDTzUX3j0T5I+uwelmXI9QJsDzyCnrSeS0lQaQrvu
	I8zU8IQul55tHSdCwAV1bYh/8x11AHmm+Af0KhijiRGDAs+enL6VFaDV9bGvkoBJ
	OjzLKg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1exng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:20:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51780e3ca44so7940341cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780910458; x=1781515258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dm76rGTSr3btxD4sk+JohwPzQz8nsVTx8rS21SkE/iw=;
        b=hrJDt6ouObnNuUHWUs1NEGr9juyXhz9fNTZdOVwa3wyYw37SeTLJVXeMMAQ+zhe0cq
         6MYcHzRzIIF9/h8AjQRj7huSumb2xV9PFfTWTgC1RN2bZbMhxl4UL2Q6nfimu0TO5Mcr
         MiNeC5t18F00LWwceAaEOPpPR/AW90osCIQZBOE1a6SzP684ut2LSijcwPwNfjIAClpQ
         dPYV0BiV8ekiRdL0BfTt5RaWKxJ+DfFrDFwdelIxNKXxYRHI51gyT5g9clnxPjiAqe7G
         y+cq9kOYDtsLu1um59Ul/fAVKzS3B2326AsuV4W2xOTrleFxD8BK4t8TATaShBr8x5bs
         pZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910458; x=1781515258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dm76rGTSr3btxD4sk+JohwPzQz8nsVTx8rS21SkE/iw=;
        b=R95qdLaM4L+BQ4zx2RRNZ2esq5SCoE8bTGyUrw/RNHzv6t2Aav3fpZOW3eCw+PzqSA
         imWpA0hepes32iPzG45bo6t8+iHLv0IC/CN3O3wMKtNFZWAl5MuANsxKX22FZA+p7Eky
         df+2ezIXzhKqKz0MMpN2v+qksl1UnXDR9P2sHeYZN8TiAEJXmYZXZqC8gvuSOm8ZdewC
         0tuwk9TNBUaj/mq2ZcqF9b/kCeIeIch5fhGq+ArtwFY12Ehql+7qp9hprhUo0QSwbPJS
         9zRaArpYxaRFZHW4k3m/jkec2CjcIBora90eV+KlwX0NsSFbQILQZHlWivpi69TDAZxd
         xOIw==
X-Forwarded-Encrypted: i=1; AFNElJ9obD7v9L3XrUDAu3mqyBwUVYQ9aelDo2EBOQdi7CasNFG8fflBMAeVJKDMXmYErdv/+Ikflryvh5iCaMmQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzXCV0Cp0swjujdDv1hBYotDc4CCsZQTxWC0Jwau/raMFQgYodo
	6mzhXgQuWh75rN8+EZXNfUmAQqcoMcT7TI6tHxbXJYGo3Z1192kBtTgfoRKLz0Ogr/S3l83wvBx
	v2CtIwoJhCxze/AEjqCO6sjp7TFUKeVbnggEMVHxKGY6E0eOWyZ0RMCtC5xMxdBbKQrNW
X-Gm-Gg: Acq92OHEZ+NnzsxkYB1lcuOy4DzXiLgeBkuILxzvW5DhJnKHPDyAUT2rMUAxYE9eJNJ
	uKhWp5loMlL5oafOq3JPcfSGYqmDweLrorKD+vAKgxG9OW/J8EQPjP3InvB6zljXVDgelHcDtgV
	83h1CE+EzqvcKVdqMfPuoGnGAC8fTeUdQNRdhvLbqKtohjfJQB1ig0SXDNvH5SyGkeBoe6ItpE2
	lREFJUE5UbKugHR1lE5tsrsawF4Kot9C6wk2T7GXLgCMGYjAU7yw8gwku1A2ScOjy0QsiijijMV
	oVsDLuLUj9+KRBcU5XjnZi+nJ5bEtpejNgkARHRSzIJ6EdaInPHCqPsEJmoz0ESafjEU5yHLrgp
	2fqonKzK5hup5L55ch3vJ/g2VjLCN6r1o+cSldDR7FvYiSPUFNhu9MniZ
X-Received: by 2002:a05:622a:904:b0:50e:6311:7380 with SMTP id d75a77b69052e-51795c0d8bemr108304271cf.6.1780910457736;
        Mon, 08 Jun 2026 02:20:57 -0700 (PDT)
X-Received: by 2002:a05:622a:904:b0:50e:6311:7380 with SMTP id d75a77b69052e-51795c0d8bemr108304061cf.6.1780910457279;
        Mon, 08 Jun 2026 02:20:57 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c8de00sm852347366b.20.2026.06.08.02.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:20:56 -0700 (PDT)
Message-ID: <8bcdc105-4393-45e4-acc8-0faae3ceaeba@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:20:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] clk: qcom: gdsc: add LEGACY_FOOTSWITCH support for
 MSM8x60
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260606-submit-clk-gdsc-msm8x60-legacy-v2-0-187a32d2f015@herrie.org>
 <20260606-submit-clk-gdsc-msm8x60-legacy-v2-1-187a32d2f015@herrie.org>
 <yv5t2llliqz5fv35cgw55o7usamrpujlnh3msmpz324l4p5yfz@s5pr4dos7sh7>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <yv5t2llliqz5fv35cgw55o7usamrpujlnh3msmpz324l4p5yfz@s5pr4dos7sh7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4NiBTYWx0ZWRfX5MG6Ao4vNJmK
 u7Cf1Fjwmn4ZK4fQVkb7JaAyv8/WlKAcWR8GDXf/fsrImzny8KCitu+uKAjyvm8XVOkHWiudjfK
 GxqwLJUjDra5fEvkCVV3ZBuZfH0/r2shJr76p38Twt5ZErZhNqTO9ogp41zUBzexc9LNqLiOxAD
 00SHYUUZjd1oQ1Kgw56eVS/AVLBjWyowgl2hhfTmZ6TW6PJgSZ0ulRA2gueEpezzsbVDcLIpAFQ
 Qhy7I/xrG4BMDDBtnPxVteTy03BQ83xjH1OrtSR416GqvvZAySE5+AUL8m2DcFhHUi/fof/fj41
 AK9OiG9A6kKi2+TyLqvY+wsKRf1YQiCbjjayZljENvNkr+RjplIpfMNTrjtnJ2/F73Ulh8OvBiX
 MFUvzN6j1jZSrrUbk7EBv3i2gWh0rjFOqhdxTUkUjywV2CHV5lnNL86SRLeXuD39zhCWjgStU7i
 KFnPa9nyIbEyhmJY4mQ==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a26897a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ISS9l3P2gTKgTzszIxwA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: yYLAE7h8HjnGALxcsbNdScF1RwZ4aU00
X-Proofpoint-GUID: yYLAE7h8HjnGALxcsbNdScF1RwZ4aU00
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111774-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:github.com@herrie.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:sboyd@kernel.org,m:mturquette@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE66B65499B

On 6/6/26 5:17 PM, Dmitry Baryshkov wrote:
> On Sat, Jun 06, 2026 at 02:34:26PM +0200, Herman van Hazendonk wrote:
>> The MSM8x60 family (MSM8260, MSM8660, APQ8060) ships an older
>> footswitch (FS / "GFS") block that pre-dates the GDSC programming
>> model the existing driver was designed around. Adding GDSC entries
>> for that family's MMCC power domains needs the driver to understand
>> the legacy register layout:
>>
>>   - the CLAMP, ENABLE and RETENTION bits live in the main GDSCR
>>     register rather than in a separate clamp_io_ctrl;
>>   - there is no power-status bit, so software cannot poll for the
>>     transition completing and has to gate progress on a fixed
>>     udelay() after toggling ENABLE;
>>   - ENABLE is positive-logic (set to power up, clear to collapse)
>>     rather than the modern inverted SW_COLLAPSE semantics;
>>   - none of the modern wait-time / HW-trigger / SW-override fields
>>     are present, so gdsc_init() must skip the wait-config
>>     programming block entirely.
> 
> I think there are enough differences to mandate a separate footswitch.c
> file. It can further be used by MMCC on MSM8960 and APQ8064 platforms.
> It might result by some code duplication, but I think in the end it
> would be easier to read (and it won't clobber the existing gdsc.c code).

Yes please, gdsc.c is already a bit convoluted..

Konrad

