Return-Path: <linux-arm-msm+bounces-101319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPThMl4BzWlNZQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:28:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDCE3796C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EEA0303EC0A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9213F164E;
	Wed,  1 Apr 2026 11:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZrVeqHv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iTOSlOAh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E9D33436A
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042390; cv=none; b=a+i0xT0zsuAEmq2HGxvEXUfSKONQIKKzdhheuSkzVgby7sndc4Tbsc4MHL2PEOM86dTc0A++GCWPiKmYLkQCtKn7mxp1y9PZrOwt/j7MWNvm2CTxtb63YF0xXZoY0pgSben/DCQWnN9hRhTeD2MsKzwhDXtq6x+Ize3I4FsVKno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042390; c=relaxed/simple;
	bh=h6UvdN1diC3gwBaxtKABz+/NIwkGDI1M7yQxwQ/tZCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7T1sPJZ3QNtjLmnlQmGztaSfh2SqwK4HIYoLfPI2a6eSYUhiV2Lj41QiPrSp+eohVS/ne7S4e+du1zwxxfz8swWCeO/3NL0SmfxmPR0ZaBypzsjrBW+36JC47GV8IW7bKqCYDo8943KsJ8xGNt8oBi1Y33vecUDFBqChxYEvuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZrVeqHv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iTOSlOAh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317xgpP718623
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 11:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XaK7wwNaMiRNcc/GM8vijh0s
	2knYzFFIEJjv9KzlP0o=; b=aZrVeqHvsMa/wYN/l160imS7m+RMYtBKuC+i2VUx
	hc13ZToO/5IM2aP2ZY3g1OhBYs99Xg5XClr0FbmpxquqNFEWYsk1XVwzEM764vkH
	c3rfcoE/erppVPl/wn1NgpdLatjoE8/uF8FfK5U+5L/A4d50wzzKT0GF5GTVXFpB
	Oh4GY6ErHbCsbbMI8F+L3fiW5ojfrZ9bxh6WCAvP05dX6e8RD20486C18h7PvRU5
	t5Y6wqc/aSlSvepceV0eDZqBvAApEjBhqtTMTaoZHtiwDji4xbb3TW89EBwc0tdW
	CZ4CGSspNOb2MEL8V/L62RUyK/Gp6HnKFudGun5ihgrjlw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kcsupm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:19:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093025ffecso209343411cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775042388; x=1775647188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XaK7wwNaMiRNcc/GM8vijh0s2knYzFFIEJjv9KzlP0o=;
        b=iTOSlOAhxRBE2pAP6XJpuyiNR6QOhxbmqrLE6KF04mc+KwsnXTV+5RbT86Rm992HUK
         mfGkghThhLlr64r1nL4ZqXWcoK05G2iPH6/+BPd0JFouDMTajN2ODtrNmNY7+ev06yJQ
         siI+ndX/gGnB4QMx0V+YY2pGRatUlb3xdRIVQjIgKSOXiEoYaWYCFwzRwURagBGxq/6R
         3hZsdJCFmhDdvaZ6kFFzJR4fWHuEqKhSky245+BD2qQshyjUrarVN560DZWWx/+dlVJG
         MYqgWCnws8lEyp4DoVj9ULOGoTh56F2nA9L1UJHB719F1I1rpJ84grtsvQDgGTP8DmGP
         p4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042388; x=1775647188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaK7wwNaMiRNcc/GM8vijh0s2knYzFFIEJjv9KzlP0o=;
        b=HZo4mOyKg8eWKJL1BYcFe7sglbKdfBuE13nUvIlxA6v/qnFmaF8UJZtIsygGLbo5Av
         4Z8m7kRR6gPoOnzU2mslV3B7uDGTQsZqAxwwwnzqVPijGgfldOJzdZt8PI3BDRcv4Vpl
         wKG94Oi5YBIByrrhWT2UYb8Vr4789Vbjp2dsSL2qofs2jX0hg6wr6O+OCWVTkeF3jSa7
         pERzoR5HLwdt0Zc95di1Tj87ewg03/hxMXYrgtYxp+3s4cl+egMLXN5Mn4npA6ZVdhRf
         7ul5NQ03OGLFp73yygmMKj4q6LyXG2iBeXIrO4OB9/giajCfNDzFoUmhg6XX6KylPjsd
         T7Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVNoLeWeAozysmPKY4wJoGknJt2d3BQsv1Fl058MrwuxffwTEZeOUndMz/J0wTulfkmAOmfg9M7Weik2KFO@vger.kernel.org
X-Gm-Message-State: AOJu0YxBubkhSy458IohmL9mSEFbckrOAAZ3aOnM2UGMmumraLck7qz8
	HB109gMcFYH6Hr9/8G/uSshLnC3baq45YLLxe6QVOlucFYljR4sPPGe+CyACYXAPiRfF6ldjZjO
	j7g2q8NrwmUSo6jOq5P06jkU7X5rHrcIWZUEefBCRNedCvRKGTAyd1HiFxMR3RQ5geRm4
X-Gm-Gg: ATEYQzxEG/sQgmBRBzvemV3/fXTzqvekBp16/+X8jmRX84ZDQYDWFRAWlXKCWqd5roJ
	NDfiI0ZHe3OYymqZSkGWCm5Xqhc1nLTifC00joOUPKMZFY96qR3BAgXygXWRw8/cCGCPyBFF55S
	Ld66rJanmM168+FYRryBlgtPdXUhGW3DRCEVPka7/37ZnULS+OfMt7ySxwXst6+Vx06cKozgzvM
	n62Dmytcy54C0KELAAQQH41AoG38YxT6756uAAORrHu+cTqsjrY9LM0ZY2dy7g+eYti0Mtq2EfW
	JTz2uAJCeR7QYl/xwIwLKo24H7CHRoOIK3Tpn6ScxRqY2W0Uc5tIvYHLNIKUH5m1VUu52viEnv7
	cEVqPQ68l80ycHP6I0UvSLKK6DDcKdUcnFQ3f+f/IUdsrS2U7gEkPPyjjpuuVUwHFW9ejEMjhN9
	PtqVJUZt2znkeJF91HcFwus/7KOZfHUTbd/tQ=
X-Received: by 2002:ac8:5a49:0:b0:509:3211:dc72 with SMTP id d75a77b69052e-50d3bbde905mr44427921cf.24.1775042387747;
        Wed, 01 Apr 2026 04:19:47 -0700 (PDT)
X-Received: by 2002:ac8:5a49:0:b0:509:3211:dc72 with SMTP id d75a77b69052e-50d3bbde905mr44427711cf.24.1775042387249;
        Wed, 01 Apr 2026 04:19:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1444bbbsm3258558e87.38.2026.04.01.04.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:19:44 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:19:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ARM: dts: qcom: msm8960: expressatt: Add MAX17048
 fuel gauge
Message-ID: <llxbcvvmxhlp6nrc6ifdixjiumijrp7is4lnheqz6rrm3yqu6y@lwa3v6vxi5kp>
References: <20260401-expressatt_fuel_guage-v2-0-947922834df1@gmail.com>
 <20260401-expressatt_fuel_guage-v2-3-947922834df1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-expressatt_fuel_guage-v2-3-947922834df1@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwMyBTYWx0ZWRfXw5mz2mH7BcOM
 hcjj8MhAN1Mx8v+XIw8d7NjG3sf1hvGvUdpYWaQW03d1GNUsCrk9Ce1N8A9cleRGJX9v+HCQ0J/
 bO4TMFoNQyyuupRju0BmkGWaDufJ9b+leFL24R4DU8VDfdUmDfn3Uc8Z0j7hkxGewlrCZ3v6atA
 w50lV8ZDwFHGLKDRXioHgF9no89/8+vbTyIzPMF73fR6q9xj4qR16SrgEIgrlwfUWhp5O8jEzci
 dEQQ8Ik9R5ARvMVYloAQxLIzURP/2gGZeT5xHDK5j0M/MItQtLAeJH3D+8xyhZNqqmIQlkSYP2t
 rvdjRzo+krJ3RXqfKeoI/TgAznX5foGUpkDvO4MceWuoplBK+Zd4mDLyNSJjqPfyWQnWwXSSoRk
 LfIKkO60KPyaXd0hVd4yVxv58aXwTliOh3GHz9PMkDb4fNimNZZO1m7LU0BdA1knRjUy/OnZU2Z
 A6jtJENN+Dhr8ftMayg==
X-Authority-Analysis: v=2.4 cv=KNlXzVFo c=1 sm=1 tr=0 ts=69ccff54 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=OQN141zOAAAA:20
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=I5Vm2pmwM6l8vRM9G2sA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: BWWTLgsMfsh_bl_WlO922jIrtUQcUQNZ
X-Proofpoint-GUID: BWWTLgsMfsh_bl_WlO922jIrtUQcUQNZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010103
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101319-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0CDCE3796C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 01:28:50AM -0700, Rudraksha Gupta wrote:
> Add MAX17048 fuel gauge support.
> 
> Tested by comparing battery capacity readings between upstream (mainline
> max17040 driver) and downstream (Samsung max17048_fuelgauge driver)
> across a full discharge cycle. Upstream reads ~3% lower throughout. Both
> track the discharge curve correctly:
> 
>   Upstream:   95 92 88 87 86 87 83 82 80 68 60 55 50 45 40 35 30 20 16 10 10 5 5 1
>   Downstream: 95 94 92 91 91 89 87 86 84 73 64 59 51 48 43 38 33 23 17 14 12 8 6 3
> 
> Each pair of readings was collected by checking the upstream capacity
> first, then moving the battery to a second expressatt running downstream
> Android to check its capacity. The battery was then moved back to the
> upstream device for the next reading. This swap occasionally caused the
> upstream capacity to read slightly higher than the previous value
> (e.g. 86 -> 87). When this happened, the reading was retaken after the
> value settled.
> 
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-11.0-XNG3C/arch/arm/mach-msm/board-apexq-battery.c
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-11.0-XNG3C/drivers/battery/Makefile#L5
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-11.0-XNG3C/arch/arm/mach-msm/Makefile#L308
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
Nice!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

