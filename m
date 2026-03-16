Return-Path: <linux-arm-msm+bounces-97972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHt/Jy0TuGk7YwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:26:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D9929B524
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 213D23041782
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BAF2798ED;
	Mon, 16 Mar 2026 14:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WpDYJ6C+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rp61m885"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D9F264619
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671037; cv=none; b=JeAXET9wfmCHx3v2qRTXmhwFPciX7QhNuOyR9KcmT9eIKE7IhWS7kl04CuR4rAVlIT17tZWpYAUaITsA/z+4HQHf5vHCTA6qMpZi4Wi37KvNWCUqjcw2pb6pHqCsQGBUDosXjihZOU7eXoLM+TdKTIyqM3ssBzrqQ+H6ekNgxww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671037; c=relaxed/simple;
	bh=KPyB66SFAbo4nPiXO9mam5QGs1dtG6QR7Mh2VKrzyPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEkNvBFBvyBENlS76F1i55oHnG0vdh44n/CXE66PMFnoDEd4oa5u0fSiCm6YYQaWIFNU1otW6WpsjPeTypmz0Mzm78U1yla4E1tPA/JbqjJO1RT7emlpiVYNA081RHvxTGtc4aZNqurXaxqHtNREZp8/00NX9EqSEsUzts0zuB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WpDYJ6C+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rp61m885; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBh90p323701
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ku4t2Yxi8SLiqD/0cFkd3NhXc//dPXv+T8O4azLlDLM=; b=WpDYJ6C+WQyeQYPY
	Mk/3x5/tPx3XAi8Z4PDJy4H+9zuNl8G4jlu4jDW+9FI42FRqtduFPT5VBYLN47i0
	evLw7WG/Rb3I3xlnpE6o9ILvhU8delKL7zifYrzdTg6xdn+j5lljn1wmhRkovXh5
	akue+yxJObFb/iAlhiOG+EteXoXy6Lvnl7pJfILexgRfUcQkCP1Bz99SUhqEUN2d
	DH1i3OpycV3/drfnhBIdDxPpkGjKr4VDDdJiAOD85rgMuyTwiVhuQj+e10BFthaJ
	elxU03I6uQwow9/slzqHTcj6xMNtcwvPuLBFRLBBiWlDQXIN9KLKek6pJ0H3NMIy
	KGRAZQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qp93q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:23:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81506677so2997379085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 07:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773671034; x=1774275834; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ku4t2Yxi8SLiqD/0cFkd3NhXc//dPXv+T8O4azLlDLM=;
        b=Rp61m885pU2CgzlKymspiIavGMErRP6/uefSfBCm+MVJpsvvUBId/eKSWT9/YcRkxZ
         gHUyUoTHORlDLgS0oY9rcQL4y+76uPx0YYBwu592cNyjXWHxgPrJQE/rNHfquC64fFkm
         oiWROdpOwInEY26TvxVYDIqEKcUxSvAMBMPU79WH7sv4zz0gNZsedhgD0K7yc0wwApYL
         4L2ZUkzU2pH8NmFgy9noEounnFXtoC/2X1XgIDw60oLm10y3D6b8dsbAAgAqipxGQpxt
         4HZT6VfqyaJc/tKuSwY9cgA06mdaU96+1uXy2n+H9XNCQZ9eb8drjfSB2Y0VgA90cSac
         WBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773671034; x=1774275834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ku4t2Yxi8SLiqD/0cFkd3NhXc//dPXv+T8O4azLlDLM=;
        b=dtQqRFIfudw4XjG/gJyDW4luQVzU8G/9U9RrtzLjjdqmzcDoJhVr8qTs0RnWOD+DKh
         vSiZzZb3tHlMAkQMJkWpbiB8MjK3TVwnXfYl1x6hkwlFWChN4tQ9Gmvx5XaSiaIzpg3S
         Rdcntv3/SPEPRnwdpiMSX6MLp1aUlnbtz8brBa9hxtm4kNuTsGBgdFaV5soXoasWT/lY
         LygXnlPZDS+jPgLZNTAu2ID3Pz6H4jVfx6m7Aa82vB2saw+gZfkO/q2XzIb19BctvHo+
         SWo/NeQsGRZUHiSE1K6Q1vgFsi+iRnSsEtvg1MyONmi91zKWah/h2jyP4Ir45sN7i4SW
         dSHA==
X-Forwarded-Encrypted: i=1; AJvYcCUY6twsBHTX+Oef57Vzb7D2D7bq44Opn91c+qN+sJvpPUCsfjUG/Xuc/BN4BmqaYP+pKZ4DUXx7koUtDDZS@vger.kernel.org
X-Gm-Message-State: AOJu0YzRjiEkshFY5mlZ8ezJStPUPPGFCsujtPu9GT7g8j/vgHACmlb0
	GtcPxa0RbZVTCkZnNaUZcGmJLRnsHsv+3Sq5CAzL0+yatNSlj2LE+2irk6IE4FfmZog21AYYSji
	B5OSk81DcEXVuKJ6bLLgpPSB1y/LRfKcDndiP9hz09T5rRgfHPZ+pbbEUH4NjzsYs52Ld
X-Gm-Gg: ATEYQzyhzBkwbrVhhDnYSx+WhOWKRd8kUd1tmlQfQrpWUnt3Gjisy4VornJtQvwltfi
	aKrbVoG4CqeAEkZiDni+6VH+lf1oTGIyJCoEIhcH8ep8GiO4kONT2k2SxqjdpV3w3rHDVN+TlWP
	P4nOSYgSucJaN3A6L45e0Vtc4bc+seMOzB0+vZ9jg+xsswyNY+bTPAqkfz4c+efMK5x/8KUlCtX
	PiDz2y7w6V1VXRilptusZvlz7GaRV5OSLDG/HlIEPEEOvzb83IhF7vqh5Pxkc/kzupGhDwHi8qt
	+mc7tq+HWblORip/ku+8TRpc+k/PdovHJMUZDcQJ+mxQDJtWj6gK91J1ixYwofG1N6TobxqJ7JD
	JenwWYuMKs4K+nLxuFfMv5opNrVE/ZBISpka4COcQ8gqj7BtNHNvlXBnevqU95LegElslEhuLIa
	MT8whUuONdKVMyKu2xyF+XqP18YwpMerKd59M=
X-Received: by 2002:a05:620a:7103:b0:8c6:db3a:3735 with SMTP id af79cd13be357-8cdb5a5028dmr1639125785a.5.1773671034233;
        Mon, 16 Mar 2026 07:23:54 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:8c6:db3a:3735 with SMTP id af79cd13be357-8cdb5a5028dmr1639120685a.5.1773671033649;
        Mon, 16 Mar 2026 07:23:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156163055sm3459525e87.45.2026.03.16.07.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:23:52 -0700 (PDT)
Date: Mon, 16 Mar 2026 16:23:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/6] arm64: dts: qcom: msm8917-xiaomi-riva: Fix
 board-id for all bootloader
Message-ID: <onzbp5pbauvrky7uysu5nd452cytyj23vhk3ey2j5tkyutlwjt@xxey7hetrrsd>
References: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
 <20260315-riva-common-v3-1-897f130786ed@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260315-riva-common-v3-1-897f130786ed@mainlining.org>
X-Proofpoint-GUID: DW6XeFfeCJQf4DSvxZ0PclyK_YJ6e3fE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwOCBTYWx0ZWRfXym796/CY2YAE
 I7GNHZYTM/XdUSOOqlYLFfrgCRKBQBWAAyFHBER6ckFSMrntyNkTpIgKui0BCYJPDIF0mo8Yd5L
 rALi5hcjwDBgBywbsD+eLNTeFeFTB6a+nB3cAaTGHjXYz5wsanyJMhv8xd7RfadW2obGzFRjiot
 a4vtp0Rx/GXI32vINf+NZjMXJBYEyekPtv0KN+lTuW4d7SQFxtxLbOfgUZlntFUMUwCrEmvMQ2T
 j3XKWTD2S9V6GmSHkO//icPwVM320YYJQg0gBkFOpbwdpKzs/d8flQ5MhBR8e5gvlsQXFcoceK4
 cCQZQZDzAb3w1UVZmBLWu13PZ8QX6/rk0a3cv15oefgY1m12TmOUmKN3bKPugfiZB/6gWHKbbH0
 wjeXwUkUKU2e4M5HuIqPgMZoIuW7ydDZ1jHtEtkcQjKf5Oe0ezNybREo5XUzuaNegCkQ2rg+fub
 jXw07e3Hvo2QnrnE3Lw==
X-Proofpoint-ORIG-GUID: DW6XeFfeCJQf4DSvxZ0PclyK_YJ6e3fE
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b8127b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=OuZLqq7tAAAA:8 a=qJtDQxWyQGT2TDQmBm0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160108
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97972-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 07D9929B524
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 05:26:19PM +0100, Barnabás Czémán wrote:
> Redmi 5A comes with multiple bootloader versions where the expected
> board-id is different.
> Change the board-id to unified form what works on both bootloader
> version.
> 
> Fixes: 26633b582056 ("arm64: dts: qcom: Add Xiaomi Redmi 5A")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

