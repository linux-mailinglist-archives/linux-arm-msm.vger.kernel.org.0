Return-Path: <linux-arm-msm+bounces-115161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DbSDGMuBQmoj8wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:31:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7336DC12A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:31:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E0UPDdIA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Irf00Ot2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115161-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115161-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DE4330DDAE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A936410D08;
	Mon, 29 Jun 2026 14:18:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC2530EF9B
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:18:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742720; cv=none; b=fuflS157cLUuCvtNVWDatEbhGP1gUG370+BBn5hTArK1073MJJQDzsxjFPbgiYlXbFNWxi7gz0m3JV004Vog3QCOkiDIkhA/xnSBuxLgfppiGrWu+0TcUFz4/ISUj5RhrikYKkMBSLaV5iapgV25EhPaGhXgrGSv+EtCuaZ/BPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742720; c=relaxed/simple;
	bh=0bnGvHO0rg4OMO85F9ZInJ9e5FeYAfeKZbeYpeWqk+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGVy75J6FFRp0ma6tObfATJ/gYdyyiC4vd7CX3UZIXv0CMaMvpeKPDQvX1i2R7P9cEKNQCbUoFtSXo0CyZSRVhBC151ix3IYRrSb904a9Ii2x5mDm+9061l+leDOlFqwoNS6UEtNAE4neCvpI8eQtYPMjqCTLFWY3Mcb8s5GGHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0UPDdIA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Irf00Ot2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TB5ORV2728927
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HtzV28mhl3/Uuzr/u/bbslNE/8t349o7WhdF8PQcBC8=; b=E0UPDdIAO5w4lV+w
	BhzfHarJ3Q7jTpWQF+9GNtQnrUPzztxeJmMgvK6QRNb1yRvOw0MlXQfgCtKHgoSC
	ivK/6TONPp7mFqp8peTKqyTtY+TZPiB0Ykkp8Su3VeehkphlyolXhoLBkfdG+437
	qMoXnw8GrAbvVXvvOAH65e3LRnrGNS6EYxjPpcJGlEAfJPzmkiTTV+QFe30fFJ65
	OuzPZym4bhSzJWVG+CjtycRw7+vY6siYBvTy48F9GdSVe5o/1Mlw1MhMnXtM9ZIf
	3mP1GlkwqcpW9PNqQOc9PgF39c3l0HA/aDEOtvLh8/eS0gx/eTpXrJrBaLX9UJuf
	B+KD1g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qha8ptv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:18:38 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7392d893428so62186137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742717; x=1783347517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HtzV28mhl3/Uuzr/u/bbslNE/8t349o7WhdF8PQcBC8=;
        b=Irf00Ot2RxCFbU6TVCA9sp6WncGznh1dUglCJ4lnPReV5ip+tnJ6NcmK2T0+jSWybb
         raKLF+d5+RWonzCDDcyRr3nbGMu9dfrw7tATlsMuM5q6UIIlbuq/MhcF9C/co+kjOUbf
         S/V12pCWFpftViuVYZsAY2NqZE/hWoefsOJggiEzGOwA/od6havGs3hO9WESuysvO2ue
         EliVjUdiqbvujJ+3j+EWjo1N39ykm6ttpNo80diHToUI17bbGAp5VcB6Oj6EGASTXhxB
         9PVG+kGvg9c1hreCs6QpQ34bJi0ALHqOtYfpCIlGJD0N+USMAxLvDl4rm3puzwVCdxLg
         KTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742717; x=1783347517;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HtzV28mhl3/Uuzr/u/bbslNE/8t349o7WhdF8PQcBC8=;
        b=TTpZ18m5U41AeDL4jwcWxg1F4tLJ74NSimq3OECQStNI/g060bCQV/HbZpo5Y6k00b
         w7s+hwQ6v8pZrESzA4yS7kw5J0a3bk5fStanh6hYmXqfRBxeIWopZG813YZWRz2AqqYn
         e3rrQsFkbZIcm53uDjtCTsO+4bnVXOZ/H7RuwgmRV6Yv5OpwOS/mjY4A4wgzCaQpQupS
         086Lt81NLVVvdsjnTzZlkJ5aiapQ5dSb1ROeFZuWhI+93EeGi5dOZaN7aFN6S0T26UQ4
         yeTFey0Iwmgnf5eP4e6FwZeHs7PQOa8u/s9wek75XjBTE/Si/WRx6cAbFVfxyNHwoKFV
         5fpA==
X-Gm-Message-State: AOJu0Yx8bkJfpzkzfO8zmaW5y1yW1UNjtrYdUAad4nzTVQINI1dYdul5
	InLhLUzuFf9rJyYrpUY+XkTyxUDie7xrRAwj3EQ6gaX0iQorKjq1LMX+VawA0r03Wt9BAV606mr
	KrfAS+IZCynMQWzMcMIq1ktPgfsXOC1kWaRLAhwLoXiUf2Irp6w9kIKd7RVrumjfOI0/B
X-Gm-Gg: AfdE7cm3j1dFyNRWUjZCwbBWWr8IK/RiiXdOGhkYeAcS43JyeJ0XxMBnrJkd5hXJy0j
	lOAl9SOywVQ3NLec/iFo9z3YQDzkAlhLLLhykNc9KZUg0a0iHBG3dCBmmTu1J+XY8SxbBNy1jvt
	aOqvTa1AQWU0ap2xdtnju2+/rqx/NpKwYe2yrnEBbluXI1Kqk041b/EoksmKC7Z/jMKJM5Qa6rM
	rsgGnanXr/Ag3Kh1NbmCUrVl9cI6yMIIfZmKbouhOPfwzJME7bqfyXgYDudOIDkFQyap/HWYQ1Z
	oLpSm928z7SJxsmLqd6LuTJN2piCrPtqP33PdqBw7G/slAD9138PyLZzhLtbbIrsYbpCmz9ei3n
	UVFcqyUDAoBbSJUcWia9lAkgMJ0C52Huz31o=
X-Received: by 2002:a05:6102:440f:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73433e2e7a8mr2478755137.1.1782742717550;
        Mon, 29 Jun 2026 07:18:37 -0700 (PDT)
X-Received: by 2002:a05:6102:440f:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73433e2e7a8mr2478702137.1.1782742714984;
        Mon, 29 Jun 2026 07:18:34 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6986625efc1sm1884211a12.19.2026.06.29.07.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:18:34 -0700 (PDT)
Message-ID: <66330ed6-826a-431e-9e8e-f2998af55168@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:18:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8450: Add IPA support
To: Esteban Urrutia <esteuwu@proton.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me>
 <20260622-sm8450-ipa-v1-1-532f0299f96e@proton.me>
 <806046b2-20ed-437e-a7e6-b3c0699f5a2d@oss.qualcomm.com>
 <b1f872f5-66cc-45fc-ad42-c308f8970691@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b1f872f5-66cc-45fc-ad42-c308f8970691@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fU5ydr5azY3Qo1GIHpyvL2_EKh0mZWJM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOSBTYWx0ZWRfX4sKXL42WHYF4
 7ZymF9LHT/0m6PDsFXWXIKAKUFFme3TNATHLcrbe2X+YLzJWTBO4rcOQRRGzvQBEBBLE2ApqxDK
 Y6WU55KEoKHPeRZRWMyGYkjqUcj+yPs0c5lDCp/b9SzqaRXGVgtXmSiGgC/KpwFgTvankAP101v
 kNIz3jZVe96F775Xp/7pWoOk5CC6pxsM4aoidwqpzqrthbL4gOqxAwcHMrJdr2AQpSQvKGvgWI0
 6KcpqOzDnQj/aR2m5rc7OYs2vR46QgHxvIkz9CKm7Jvp55rLXdaXEvGo3FEjE7Y729V/d/BxPAn
 OqoJtnCbs6ke7HjDzT9tuHari/+/bM09BFJMPlWqWq5OlGkOgFR2jbRXp0OVJ4JD1EqPEphfY2k
 Cw+hOYddMYkMvGoHYUMFCjeJVQ1fC/XmW2+6oZfICNrVw6tviHz32sCnN8pfvDnnPXkw7jCCMnk
 El+ARYicM7jQx8D8h5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOSBTYWx0ZWRfX2XWR9APj1jya
 dtjH8VJ5DqHnnNVdy2g2Phcm1xyN+4V9/i4JM9zhwDauefIgRf0Z3V+4ORQLcc5/4cUShk3zzsX
 kR+UNVLFj39esIPD1ZV7EHVyMEW7w+Y=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a427ebe cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=0dHVmNKhjX53LK_pQYIA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: fU5ydr5azY3Qo1GIHpyvL2_EKh0mZWJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290119
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
	TAGGED_FROM(0.00)[bounces-115161-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:elder@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB7336DC12A

On 6/24/26 3:52 AM, Esteban Urrutia wrote:
> On 6/23/26 5:37 AM, Konrad Dybcio wrote:
>> size = 0xb0000 for the RAM and uC regions that the driver seems
>> to poke at (at a glance anyway..)
> 
> Sorry, I don't quite understand. Could you please clarify?

Please alter the size of the register range that I mentioned this under,
as the range is wider than what you specified - the driver takes a big
offset from this base and accesses far outside the bounds of that range

Konrad

