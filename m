Return-Path: <linux-arm-msm+bounces-106609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFzpLA2p/WmEhAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 11:12:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC734F41BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 11:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C22A302BE3C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 09:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B06388395;
	Fri,  8 May 2026 09:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQiBj3Eo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PnGl8PRg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EC6387348
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778231236; cv=none; b=GZZzZwXo8oVxrhhLDvX7mGshr5u6NnMOj4HaVp52vzhqm4rZ9nd4PazVo0LpACkq2IifPDkBkkV2CnBH4AuFn2F3XYr0xABdZKON6FApC1Rkn/F67lVFsgMe2TrY6XBmCWDpV1n8V9VG7piKogOQW2tjK6pAySVayOuNDQDRJvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778231236; c=relaxed/simple;
	bh=ozoG1JtKQMdebPBN28xZ8odH6izKFB+eGPEWMWDc7ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4yKhyJONNoyKMX4/CyMGzPddndNcnaYWQ4Ps5UCcfAuv/Rh06iWhijRBITuFhHkQ6b2+N3deD0aQSNMj/3wGtyfBntzkFe1J+6QaP7yuSOZG3OUs0F/VGSWPX/ff6iHYHa9KCbVNYa6SXeUTqH3oKCdEQDpSJ7OG9Li/EtdEnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQiBj3Eo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PnGl8PRg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jGbT257852
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 09:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/r74jUQh6hkmiCWXYVberFn+
	Mu7v2uGlN93+afWvpCg=; b=BQiBj3EonIlY2pG/tFj16uei31O5bRQu0tahiNRt
	obHM1pgAxk3k6b7dUPaHVjS9Iuq3OaFY/QMEsSa22ud2/9lGUoDTfUz0I3zbG6xk
	IcpnoU4VxHLaxBZ3kbui7RCHGjDBiK7rOCUYMBpRc0ZrZ42zw0BxUjzJd94lBahf
	RIbtofdB6nt4pTkPRBp2PA5Q3iM7W2U0u9stHMU6VmUydsGmwJCfsigrgCvScIyu
	lGur30BElZIRohlX+07G3aGobLbKUcehbfumrAijJiGiJ3GMCd3OZb96t0S3u0Ld
	Nzb1s4znC5S0QtcJPavS2NsfvXAc5CjnG9H1ectg9ANfcw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1auegh5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 09:07:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c16233ee11so2649692eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 02:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778231231; x=1778836031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/r74jUQh6hkmiCWXYVberFn+Mu7v2uGlN93+afWvpCg=;
        b=PnGl8PRgNy+ZvcJb25YG1n32I/XeGSNF3e4g7HuNjaWLzUQ49LCXpLWWoTWwQW+cza
         aL0cz0UafduX1+hvORTm4Mc+JPlyLm5UZr8P3h7FyXufXxxGMJOCZquihkV4W9sJorEJ
         ViSEFEpUs6CtFB0zJipiVSCCpHtTMeorq1YUeMpNgk16tjpoWqM2fzoXdq7bBeF+t5vk
         iX23r7JNT2ciDtX5bus4U75J8PlW/2GlN/LZ+Jq0q77+Q/634mGGnEhMn9uPlMTZq0GZ
         2jQ45V1U6Z4Vt9GIpfPSQXiWetywR/5ut7qygzk+PxUut8Jyc/ZfGZF3ryVGMAWCjeN7
         2DfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778231231; x=1778836031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/r74jUQh6hkmiCWXYVberFn+Mu7v2uGlN93+afWvpCg=;
        b=n4PSLBDkwNfGPXETnQQa+3gAO5LLQaTDxKrQxuxNhp1Yba+CQ7Qet6FQ3NN/X0CGEF
         /y77wgnFMGlwCAlEde+MTVdC+hlJkBaKaOFMNPvrU9jvalOJq8OYIppWQyL0X0T6Hog7
         w95XXO+FhrBXzV6xo8ukbLW0snUWjXsCFjEkZJuNAxaZSzstNpG0Mtw1PUtFkyIGqSGE
         b0pLKPC/UHsickQPiYaLKHGUwkObWxsqFvvdvTmhsCPdfSRxiPkXVm2QlCmaJ5PevSIi
         24j0AhvYXyl+bFoUPRKt2oDxJrHJtQzslcvvA72hsyTXOe+EpWF0fDVG+heD1+bBoolm
         wzAw==
X-Forwarded-Encrypted: i=1; AFNElJ9CMeNSvniO/gvlbFvU/PybMp5ROhue6NZxZmO9fvapyPeAhoyPpnae74sKONP3pDHIrrg8j8hq0eShLMBh@vger.kernel.org
X-Gm-Message-State: AOJu0YzUe9xtpcE5cQz5sdDoZLbvYr72ZX0Tj6uEE9tKqiykO8CVto9h
	deRhBqy7l9ZAVm8m8btZlchk86TyySYrO2vOo1nHW3ot1/z4yboQiI5oRtIQeRIUAiJjPbnNYEg
	jTKm6bTaKUbo5Be48DM3OVaqTt8+v9Tk1kjbaJAPC7VyYEw/qV6EajQXt/EzVx0YRcViK
X-Gm-Gg: Acq92OHUg4u0SYPA/GZsA+4/b7DXfz4Iqb63b2wy9awBH5/80u4IgTvbVaPTCCVxXg/
	Uv7B7j5LO6wiDi/wWuGtD3nCAoKxkz5U8Jhu44uq/PsSVnDv4z+kBqAkbX7YgPmF6Kh/aApyO3E
	SdXFoye/J7c2V4KLihmptCwaM4BNmGnAUT1YOdfssgMZcqoQbMzlwuceScS9P9LjEjkqXAUM/QN
	/+qpmyqH7DcKKX+5GBFqcLEXZGAf6L8AOfEVlCG8jtbQAl+X88f223oDTyAQlNBWg6hLez26k+i
	O7OWUITkPWClmrTyW19dIXPTmXwC3lleVYcTtmj4Cmd5W9XaZy3M6qwj/HAtyvmGw7FH7ehNxyU
	p94AmYQkrmI0oY3Si3xnaTuynwkQDcWl625uVXoXT6Ni1j5YbzUgnbTS0skgczxT/
X-Received: by 2002:a05:7300:dc92:b0:2be:833c:149d with SMTP id 5a478bee46e88-2f54b269d7cmr5741982eec.28.1778231231264;
        Fri, 08 May 2026 02:07:11 -0700 (PDT)
X-Received: by 2002:a05:7300:dc92:b0:2be:833c:149d with SMTP id 5a478bee46e88-2f54b269d7cmr5741955eec.28.1778231230653;
        Fri, 08 May 2026 02:07:10 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8884752a9sm1341749eec.16.2026.05.08.02.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:07:10 -0700 (PDT)
Date: Fri, 8 May 2026 17:07:05 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Remove lemans-auto.dtsi
Message-ID: <af2nuRu5QX9mk4Y8@QCOM-aGQu4IUr3Y>
References: <20260508022912.1046618-1-shengchao.guo@oss.qualcomm.com>
 <ebc94f62-6dc4-4299-bba0-329675ae7f9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebc94f62-6dc4-4299-bba0-329675ae7f9d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA5MyBTYWx0ZWRfX8C1AiqFCBoEc
 ahR5ttKmzGqLXDr1/lYIUrdEAobzw0N4p/8qrq+uzzRsFwl5fuOHsLEPkETiHOUWxNm96FdBSlR
 WsrIRW2pHDSgKHDxUENhzMY7R6tIo120y9H6bfL1aN+Yl5s/WhYRB1tGLCAq7jDp8T0+9sZXmR+
 3OpWapa5XUovSN96GvXmRq52dzPfZfiVrOpazUYhnJEOdCdUSHcap9aOgbgHC1GaC6KNLdNzbxn
 FnnMKrFHw8wteI5+qdPdaGKUAItqEuesFw3V5JRRh8PqnRopgNzh0GcJ/5kNHKUmciBsafxTYYP
 A30VIiOZG5ZywC9z8eL8fdk6yZZtQ5tCVF37H+R1c5c+dsCZTTT9L3aoIsU4h8DbrHSyP3z87lk
 qR33nb7dErTIhnTdV7LiAf58wbbNISsrxEDK7YwtE4gSy8SY8WL7tvaEj3tdffmPgKkEXyQaK33
 W0LtZREGeEwkVKfp5iw==
X-Proofpoint-GUID: oE22F7SY4Ur1KiMWkn_Vob_D7F_6yIUS
X-Proofpoint-ORIG-GUID: oE22F7SY4Ur1KiMWkn_Vob_D7F_6yIUS
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fda7c0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1de_3bmVjlGOHts2WbkA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080093
X-Rspamd-Queue-Id: 1DC734F41BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106609-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 10:35:10AM +0200, Konrad Dybcio wrote:
> On 5/8/26 4:29 AM, Shawn Guo wrote:
> > lemans-auto.dtsi maintains an old "automotive" memory map to support
> > legacy use cases, which stopped being supported by Qualcomm META build
> > 2 years ago. So there is very unlikely anyone still running it. Remove
> > the file and update sa8775p-ride boards to include lemans.dtsi directly.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans-auto.dtsi    | 104 -------------------
> >  arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts |   2 +-
> >  arch/arm64/boot/dts/qcom/sa8775p-ride.dts    |   2 +-
> 
> So because RIDE is the "automotive development" platform, do we have
> anyone running the (effectively) IoT firmware on it, or should the
> boards be removed in general?

I doubt that one can run IoT firmware, i.e. QCS9100 version, directly
on SA8775P board, even though both are non-gearvm variant.  At least,
SA8775P and QCS9100 have different SoC ID.

I'm all for removing sa8775p-ride boards if they are completely obsolete
and superseded by qcs9100-ride. For the record, I haven't seen sa8775p-ride
board anywhere these days.

Shawn

