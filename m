Return-Path: <linux-arm-msm+bounces-94649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPxyMJxyo2lwDQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 23:56:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC311C9914
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 23:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 426DE3030EB4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 22:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600453E0C48;
	Sat, 28 Feb 2026 22:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VUCHYn2P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZV8xYyMr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3B9364934
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 22:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772319378; cv=none; b=bLPwjQ20li0UeVSsXqyBN+eA9epWLC18X4zgLV/8HpKPj1YMC1R0trXtXYMLlLUMTvIsIwklXI972WLVRMOEvDv0eT6nZvYFqyelxUOclVdi1d8VpLDmjBrhjYf8sCUpEXiIvuz/8yfBg8TWKV9yKClNiuyM1dYvqoQVwEdZukk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772319378; c=relaxed/simple;
	bh=MXTU90D3t2VGd4zY/0wPF1u4PkVOdvEa72HG2LYtUw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czMV2+upgli7nTCwPalE/GjW4lSrHMLHBieWrB56HiIvQGi+GDx24rCnj/BWJXWfxVjwOSgnHlihncqt8I2JjkUKJ6O9bqr/K7jrX7c9GjeeChy9n+VjQND2kWLRmyNAHjuJoJiYiOauzShGevU23AQ7nC6xb/BmvtP7L7m0caI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VUCHYn2P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZV8xYyMr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SH0BCB631702
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 22:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YQH4GJ65ic0fQf6V6KhCwnR3
	PmbYpcYd6KIrFW/xOjg=; b=VUCHYn2PLeXMsBnBgmVyEpvjdfmr6sf5VaaBYb8R
	LHryGSywRVmGyGNjHPyHG3vlUPbDTrAqNaFR04V8sOCHtZskhTT7ZNABNxKm12oT
	nOHqI9Bw10unfwzF5cFYeWR0Veyl39x9NUrPVbConJI3nEdFAN4hTODgqddGBWc+
	kmkhZz4cRGXfIdupquZTrQZaAeWU5NPatHF1No4tvANMDk2FfotHFWNT+MeHFztJ
	H349fGLg9BHWJzS0Zwm3DuMUDwGyoLK+CVuJcP2E7fa9E+povlGvVDtKxXjpE14r
	pFAlePC3yARRlyJIeR5Tx7o2k7dh7HDWpz/aDniZ5fSXwQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf6hqg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 22:56:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-503915b0a88so262965301cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 14:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772319375; x=1772924175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YQH4GJ65ic0fQf6V6KhCwnR3PmbYpcYd6KIrFW/xOjg=;
        b=ZV8xYyMr4sHNuzyiL/mbTKKxToz1+/dQj+J9oPv3ufVM79CS2jSFdPKgncg65TUPZy
         i2k1RVOmemzeOlInDFRomR5FmHFiGtivz517Q0ayig+q8ABdDH71WTkYkNieJHzJBVXF
         JDL7KRe7JOp/lEi0w7w8UUTUx/LAegSqoNKl0e2RDhdataRr7KD0olKDhxVFePkHC2Yg
         e3fFMK+sGVkUqwUDfWzxZoxISTfQTaca3W5/znvwSY7anC9XLslH3nS2IO31huvIP/gf
         DgerS9qLIvn7eCHf82YNAE7a5CK2inHH0lCUrtQE/GGKHPnEZAbcqvSVutHAtMNFNwxa
         ckXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772319375; x=1772924175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQH4GJ65ic0fQf6V6KhCwnR3PmbYpcYd6KIrFW/xOjg=;
        b=oNJ37w5HrCyEXM98EC4u25PjVTSuvL8Fm3DZXQy5KJ5HDmQc2DC5z2za21VJFtGfXw
         i6nH8MsFky+AQTjsQYouSPNu+QMxt4VQFBi0og0PafidCZuug0mCpoFYwUPLk+LZFgkf
         bxA/BwuX4Z9yk7CfhsX2F30+Phq8bRvLor5q+PtoJ/nuT3fqIuhckMxfzHUjFGWBxEt4
         hNri0xjhS1ROky9OR5UbvWiSTJ+PMhBUUsC4sVkGqbRncAqqMDjoM8X++91DKiU9o1GL
         q1jcnQkWqUH1K7dfvcL5wTdJSZAoFaykHTRqDMNXs5+lh+QIU+4CFlhr5yabnQEVH/wj
         OjCg==
X-Forwarded-Encrypted: i=1; AJvYcCXVBROb2dgC88C0z7fDo7fbWBazyNbNUUOQys1L9EAg5fb/waZcSTgbbsaE1xCti2snvxWeaAyXO1PD7xt5@vger.kernel.org
X-Gm-Message-State: AOJu0YzdRNlWe3JnriCW+iSbPYhXj/CnTwruA47+tKq88uSUbNvt98XH
	eOofibFpq72PGqe60w2ilgi0FO4owlQs+0Hkg+Bk6jQwoG9UVF1Ecwd0PvVkx7zp/L974LXyfsG
	FZurt+uiVFfD+A5VMtmhjDrHSzZTYx05RC9ZnkLKD5Tf4NdVDxjY2HOt9eL6xUod+jsfHdj8M0n
	1n
X-Gm-Gg: ATEYQzytoUJc8uJSoZZoMNCAHUm8zhe7uTtKU41YtdSs4PBXXjPuRxJqnvYWhBRWQas
	gOYmfoL53t34e6im32Pk63WSOYOElH9bZsF8bRFkV5tY4CaNIbiAE5G8KUIGEyZzBog4pWFbMzz
	kPFJJnCDQ2VF0q5SzKwO+r06KHD1V4L665L+p45PwwyeWbj6ZM6hrYoLXf4CbILe1fdVgZO4Dby
	XQWjUqbMOIPN9XSvrpEMsQFZVNeJFGle8bGTb8gETTA0QONBmJ2sBtUzHnyXcdd96mKQ5oxw3Tn
	vBAk3yyGlRH59k7UilgEzV7tnLnxNVdpm9q+2I8Syue0Ih6XF+ucj5kPmcvnCPSgg1hcOKORizu
	Nmtk+s/85i/mgAucYWwaO3c1Lc0iO4kD/62R+
X-Received: by 2002:a05:620a:1990:b0:8c6:a034:9226 with SMTP id af79cd13be357-8cbc8e37bf2mr882101485a.82.1772319374720;
        Sat, 28 Feb 2026 14:56:14 -0800 (PST)
X-Received: by 2002:a05:620a:1990:b0:8c6:a034:9226 with SMTP id af79cd13be357-8cbc8e37bf2mr882100285a.82.1772319374290;
        Sat, 28 Feb 2026 14:56:14 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm124689085e9.5.2026.02.28.14.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 14:56:12 -0800 (PST)
Date: Sun, 1 Mar 2026 00:56:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: x1-dell-thena: Move PERST and
 Wake GPIOs to PCIe port nodes
Message-ID: <wcpn7d7bw7wmjqlt2varscwcyiwqdnhxvnq3nrnfkrolftnmct@5nvevzinc6wx>
References: <20260228205818.13016-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228205818.13016-1-val@packett.cool>
X-Proofpoint-ORIG-GUID: VLJ7kpzL5qp04HdkHDnHNbJ3eDeHZGkH
X-Authority-Analysis: v=2.4 cv=JoL8bc4C c=1 sm=1 tr=0 ts=69a3728f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7fDQ6_9FThYvjtgkSQ8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDIxNCBTYWx0ZWRfX0PC+e0MAdBac
 4i9q7e+asagefGh+saf4nFXyVoRApF0KgHp76e2EaBCeEQdGLpbuJwAmruOTEkbV1HvqetVxmXU
 LaQPSHbeUs2+eLZui21jTt5pB5IP7p7rePPJm/6CqWyxxI58D6AUuiLadcHwE9JpFf6UbwsQGKH
 UDsjpLx9ndclXW0XRe0tRssaENfKZX8zwCvPJyernefvt8Nyj/gnmlSdVBW/DOcDQIEf6zn8Jpl
 EE6xvkwRunKH9Y0LPWavyVZ5FwDpGIKCn3RRRRFCXpBJK6s1DVDaKuKsY8SV6NGq3D2XDoHS1qZ
 aKcN0Ae0OzRORW3mlEaNsTlnb3QlV6tpeEGcGfvwxw8iqnqEi1avnTwZ8Un/fExbkDmyPU8jc0g
 bLCs8lCT4E/jYEe+ta4avKzh8A18fVjfqMb0HQ+yO5pAvstODhUDAyFjD5L0IJqCxjljoKc755G
 lUtlufiDZDGBNvqadfw==
X-Proofpoint-GUID: VLJ7kpzL5qp04HdkHDnHNbJ3eDeHZGkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_07,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280214
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94649-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AFC311C9914
X-Rspamd-Action: no action

On 26-02-28 17:53:56, Val Packett wrote:
> Recently the DTs for most Hamoa-based devices received this change, but
> the Thena dtsi (common for Dell Latitude and Inspiron SKUs) was skipped.
> Apply the change to it.
> 
> Fixes: 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Val Packett <val@packett.cool>

FYI, I think CRD was also skipped.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

