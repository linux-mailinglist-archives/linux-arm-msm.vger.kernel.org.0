Return-Path: <linux-arm-msm+bounces-97928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFG2Orbst2mzWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:42:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5CB298D52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89277300D469
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885FD2765E2;
	Mon, 16 Mar 2026 11:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlp0uamW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hr/oDIxU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46043286410
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660972; cv=none; b=hbW6xr6Qm60v9T78cDPyULSnJ0gJO6P6Ne4///y29RCWQRjJVaCwKwvRk3JuvMPca1K7x5v45xg2HZw0wdFhG9ZmUxiqe7GLL9XAJfQwE783np+Hpftnqmd8ON2qZNBY8W3etuKsDBgBbwedWeLPrAoXY42gVu4N/8etzr++DVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660972; c=relaxed/simple;
	bh=8FwFRyaHE17f2syED6gekJanvTHmxZfOiXjWXeA8/o4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cRHXTVLKq6pPAqhAKstCv2ZPy7LIMnblZq4yuP0+SRzjLH8GwNPVEFdN3PWFnLu0lGd/koGaOWnoh1qwe83dAmA0jR39lVNfqmLELxM7TmCI38A0zlu8NuZ7vy3KSg2c1SK6R/2IzHJdPek3V8uFonP5T3OxjVMC+cd+F8tAZAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlp0uamW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hr/oDIxU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64gRL744129
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEmu8x7YnoGavOpYqOOjOXAQEDNHNRQLuY3SU6FWFNU=; b=hlp0uamWMev9OyoB
	o0tQQONbuz2tkrVmFz13Gd4x912ovMoiIcyJuTlGeCUPF7m3UudypJVXUvi97/Wy
	T+mi+oTVwhPQXI+NlAQ3AD+DfHrDrumAPQpK1iphK1HvTQas/dAj5/7vP2BjN9ga
	zhspsejeDWSPDAXgIlvz1+IMkgdyHUbMzhn7lfoL034Yu6VVtpBQBFExGzYZAVru
	uht8A4cMm2t3AqzzsfH5PCs8p5cTPQ6FRXjg9D9cK3eJMxoB8EV6JrIDtB+tkY1z
	bBFn0zk7h7Wo9JRt2ZeKLs4cG4s0A7NidVhuttAms6tq9hnU16NO0Am10FRIvBbK
	aPNtvg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00bdjfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:36:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a081737bbso46860076d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 04:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773660969; x=1774265769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEmu8x7YnoGavOpYqOOjOXAQEDNHNRQLuY3SU6FWFNU=;
        b=Hr/oDIxUJzXnJn1i2Jg7OknNknlNpaewSjP88KmqrSK+cEA94wik/BC9OdyAHGPeJe
         wh5xJI2xIkMwFg4Zz4zv0awgaZSS965382SSqKbi4WtCYVdnNJ5iuhCbMbUsg46EnjQJ
         WBoX2JAnqL+6ycl8YK5wFHufL5Ia5tumhgnddii2HAUsegLyZ2ufQVVhhPffSyBnNd0i
         gpKUCpNhII7Jb40PtXRGSAm6/cbn45owaeCzHf4zpopCXJseI+wx8RCxfHOCHZiojDls
         yhDGhIH4jGSqMA9/6z58mjIAbTh/cx4y25iUqi9q/fcscULg0iaC2CkTiGqwJeI/1R5L
         gRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773660969; x=1774265769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEmu8x7YnoGavOpYqOOjOXAQEDNHNRQLuY3SU6FWFNU=;
        b=bfjqAVavEkbZs/P5g3vVxKoRrV23odNDFcBdiFpWkVnN7vD1jFGcDaewg2ciyxgIFQ
         ZwtTbikt2YxUeIQ1e3KWmpzB49OEDWWFvsyyY3VI3xxVOS2qUA4GqobBL4Fop4QnS/Jb
         QHomZrc+18iTlqizvSn0+6tyK1U2kpt9c5JRZWgBPUtSbCvDzt+hX9wweJEPyX5i3iok
         bRbAKnQKm1ABGXa1zNUXB1Odkk1SfxXXjRiy/b+U913Rg1q077wm2+VYBl7D+YkW5KvX
         tqqzwxzaGE5Ee1sBf8fNHJD+MTIR2lsBwpkqyzFylinoV3ffgyTmlsVCk0tTNrcQ14Bl
         UkUA==
X-Forwarded-Encrypted: i=1; AJvYcCWrgNCj2WPZPUUPLIcZ7pVXsWjxDy/eH6XYEVfA7mYeInH8cgFTH2IXqcHbpk2Lb9BWGdoZR+gWSfYF/62B@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0W1HXdnV4ivFbemwWX+Yk9ZDoGxo+wKulELN+91axqxzUp1Xs
	edVLTmyfm6AAw+w2LdXxve77bazCwItyroLYmoFuepuAxUHv3MRSIqSPZz7S1zSqDrLG5HS0t2c
	NuCOL+1d3IzwOKUbIDQRwiaywZFHIYx9hkjNZ89ivGHcwV/kEVQQ9asm+sIaMx4+Yc2gQ
X-Gm-Gg: ATEYQzwA5qg9agq5nRCqMeGejZRoflSY4gd6LI4u8PAPaXNG7fxCDuf+t1ZfKV6pWUK
	T5Tfzx7sYEr0fEcaZ7ISHdA8HLX8LGtbajd+tXgcXppgcmUgobCdvHPZcJTUK7IIStJMHZjLi0j
	iru33cxhFLr5Ytu0xmWYR2x5f18C+GKdDs8BmZJBT7U/HDZ6DIYmkJtZ2XLtOx7Reyssl4Um+OP
	B+s3SwZmhhbCtY7JxwmEFAzpoujHNV1Aofn1j66HrAWvRTazksil70iVlZDOt2OOmUT63uBCrDF
	/5NQkVsNotbJooVu4yPKWejAlrEZCW9klBmQ/d88t4CXN0oH7X0DOfo58ShsWekWjwg2SCuDYYS
	CsRCSOR7MotSauUCvbNa7HQgx/t2nw9etUG+lU9Zjudh5C/IoulVcYjr9NfbV4J/T+/lOx31Vt0
	tDcLc=
X-Received: by 2002:a05:6214:6119:b0:89a:5042:172 with SMTP id 6a1803df08f44-89a81992936mr108497346d6.0.1773660969074;
        Mon, 16 Mar 2026 04:36:09 -0700 (PDT)
X-Received: by 2002:a05:6214:6119:b0:89a:5042:172 with SMTP id 6a1803df08f44-89a81992936mr108497056d6.0.1773660968490;
        Mon, 16 Mar 2026 04:36:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97a6d8986esm288053966b.1.2026.03.16.04.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:36:07 -0700 (PDT)
Message-ID: <b1edb0ef-ba17-4add-871b-0903912a4ed1@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 12:36:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: milos: Add GX clock controller
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-3-00b09ee159a7@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-3-00b09ee159a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IsATsb/g c=1 sm=1 tr=0 ts=69b7eb29 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=1NpoCAVN7wpv3VHWicgA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4OCBTYWx0ZWRfXxw6Zh+WmH5Fb
 jiJ3NL1zLvWI+96xi1BbVHAe3ZWo7hop7Z6YVi+qqEcx9MtbaO449oYrly3iy/FTGkLfbcHC1qI
 ay0HYj8KGKcl55q46+GoaHTl9i2PV3Qxmark4Za4nD2TYnVG67roLSGAr/XSwPgyAH/u8kMHLWK
 r0guxYOdNPPVSfo3du0j5XS8PBHNZabj/aXerJ2UaXq8+5I545nzz7YGjpV+q/3KL4IqURxX3Fo
 dGbNphXqVcH9Z0AIgemMsj2HxbhfNqvM7iwbgeWqjJ2Dmnxqk5SdiKgWiytrNZ+TCkD32nXc71v
 xlTht72HucKPGGPS+dEBTs6PO5KLRELG1S6QDYKIN8534B8MO/hnETMoU2Rb3fzf8xnApb5JBNE
 ceNZ5L+iCH3p6FtSieix/KtONynsW2sVOT/dgIuxyLsr9YSHU/I0FmbjFY9Td9Vkhy4Pt6pNmNX
 RDydQ1yrPcWPDTjh7Pw==
X-Proofpoint-GUID: wkox2x5XWMjp-Dab5h2n69x9ZBQs7vun
X-Proofpoint-ORIG-GUID: wkox2x5XWMjp-Dab5h2n69x9ZBQs7vun
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97928-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F5CB298D52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/6/26 2:48 PM, Luca Weiss wrote:
> Add a node for the GX clock controller, which provides a power domain to
> consumers.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

