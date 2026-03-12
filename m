Return-Path: <linux-arm-msm+bounces-97219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iC7+Cf29smmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:22:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 658232726EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3C71301DE1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A686C3A6B83;
	Thu, 12 Mar 2026 13:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lcs0FmQA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B6UB2JOd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFF63C5521
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773321720; cv=none; b=S+nuqnioWgnvnYHoe3JeqMCxUsHDvWZp+opZ8jYjCZC5QawH7/sOL0Rmdmbo2FEp1htTtRHvfyjoo9URP0jnvQf24duJ+4TAsM+dKTnHLUdJKINmHECx+LMiBWpB6F6bPdjrSWvY9LDEBnk48gsLwmKygWfzIGSeUICcunsFht0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773321720; c=relaxed/simple;
	bh=o81hrhAPbE+2p+74JicN6rf37VDssxW6q9OQI7SUeqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rImn7sAqlMU5oTnmcFD+mCp6V3mfMgPEQCENK/e89zh1hYwWaeUYIFNyUao3s/y2m5U7+PqQ1J0+BPctFZulE2fdyul8kRDScy2lE7/+hUTStisA+LzX5ZBcdjutARAuP9RnNo1Ux9jnWnLOnvRTuaI3Hr+8YGGH3pTwVmRcAPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lcs0FmQA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B6UB2JOd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CADis53666503
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GPxgAQbZ5dE/WqRRfs+nfo5G
	A/qWcrHqNAXneO/r7nE=; b=lcs0FmQA+hGDdxw+nSL5SotmDzFhPiuhH2nK7mDT
	cFhz5yEGfijU7OQA7/Y6VKEwx0gW5crGJ2d/RcMF2Qw64vC+e69CJS9hvW10hPfm
	zt4AT5PyDyjRo8sGoJl+wALirOt7PyATeQbChlyAH2ViGIavCJRn7oO6/bAfcIs3
	cKNj3ahLsVkpOiPPsZvslUqfL/PBNe/qU3HKIfO6Ge86ZiPNHpkYXjhuobTPuTdv
	E1Tj7ZJ2Vx6r0SNz/zlOttH7H2klVOc09pVIMyLIVShJ/7Ye/KhZQNmTBXJnfrih
	b0e+xhgByDPeOOXuy72g1Bfs7Mx+Dh7pQEHjYfGTBO0RkA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60j77t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:21:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd849cd562so657272585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773321716; x=1773926516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GPxgAQbZ5dE/WqRRfs+nfo5GA/qWcrHqNAXneO/r7nE=;
        b=B6UB2JOdzOoDhQ8y/D8sa1hQGCBpaad4DAJnHgJC1Bi3IZZwB0eW2XECs0YmmWSZJ0
         SWVc2aIo1lK2fge++e192GIHiB6wYdGCSYB0IWSpf6TPVMzjHZdEdVFckGKBhakqEZA8
         E5CLQTzWRdh+sRb3dpqXapaoc/bh/gl2PF0GIVrcbcOehhJa5H+FzyVcOC6ejQB5d7va
         x/Lm6htiQqZuEBaITwRBkuV5HzmQgnurVz76tOOyLXN984iMNdD1eUyCmeqkx/7hcLOa
         U1kXSjXOiX7w7XYPqFKrC4+GBMdjDyLpW3cVZielpF3+dWT+tY9Fg0RoMfoRXFDhCVyU
         ReDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773321716; x=1773926516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPxgAQbZ5dE/WqRRfs+nfo5GA/qWcrHqNAXneO/r7nE=;
        b=tWyIgvtnLnDCLphYRJ0AhSG/dfRxIbKT1+qnEoVHpT5Q8a6EIaGKI5SDM0Z71QzGO1
         2Htu3vLA76LlnTqKpwHfI8tXUBrzbloNoSeBCTrDhKAYSUJZ97MRw4Hu0FY897uYf4mV
         X7xF15ZpvZpO5v/ffq99DKt95WM4s1RfTzFgT/fMLzZKrjK2MqmY9eLR8VFvnaiJHD2z
         0Q3l/11wG7xszQotpqQmXrGaZbi85lwCa6faSdqCIzuiKUqielv2KPPBqBQmEgTbGsA2
         EYrlqxbvBeFq0TRfK+jpEPgFwho0RGzJHfpuBME3OWIvNK0akOtfQaKykkm4+ufcVb81
         9gGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv+cXPHrZDX0panYe2ZRE2Q7ijqJJkrWTUBQG8MFRJhjJreFco+hRgraKJzhNbK67Bp5eiaULLuDaVuvuc@vger.kernel.org
X-Gm-Message-State: AOJu0YwKyYWESAppb7ELVOaG42fOrGyHjb5owQCEpMDwjocGK5H8z56l
	E84JkvC37K6vqShiW/xlml9TuBzcRn3OyxmMkrHZLbvz+SI/Z7ylvdVc7wKaRkIh8O+bbGA4ngF
	N6xOkTGjA3p1xWMDFrnZBBaGW59T3C2NH0q9dOAeoHF9HLXYhA1otT8wM0smW3DggUrxG
X-Gm-Gg: ATEYQzy2Z3ZVh6ZsfxCJvIyJO89tPOrclaVYdC9Jsgzhul0eHZCRQATm1alFuU97UAE
	Gs85nK+34jDIqofhnwISXDDVaMcOHFn48qSZHk1sIfkMZPswby+TvLaucB7nmu67qaG2CtOeaSz
	7DQw5HKsWtPWhO+mUPiWIPsltb7UJZTFMPQxYgnjsFZvcgpoV8JXQWexlqHJPPkss6FturRhSir
	UE35AaxnDzvnevkfwJuadrAQK6MFb6Y0z6qnhX3kv5JnC2fUAQ0gOcZNlgqEpb/77uS9Bd8akNQ
	dVxohrhIPpxjC79dnCN79I02J6ot3mqwqVNramNGZEvu9CRVEMOizEnmAXm+CCtloW+4YpxuxPq
	cSt4OuZZD6j1WhJ3ZY8AsnOddJu5HCBv4IglHWWZA2xXQcBfpiiFcpxPK1SvBg6i7QkQNalzu0Y
	7QQ+UncGSDeOvso/0ZQE4/sWmqS4V/3Msmrug=
X-Received: by 2002:a05:620a:4629:b0:8cd:8f18:d1fa with SMTP id af79cd13be357-8cda196c76bmr789158685a.22.1773321715930;
        Thu, 12 Mar 2026 06:21:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4629:b0:8cd:8f18:d1fa with SMTP id af79cd13be357-8cda196c76bmr789153485a.22.1773321715341;
        Thu, 12 Mar 2026 06:21:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162b8dsm974392e87.44.2026.03.12.06.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:21:54 -0700 (PDT)
Date: Thu, 12 Mar 2026 15:21:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur-crd: Enable keyboard,
 trackpad and touchscreen
Message-ID: <75x4qxntdgvkbqjqedievzepwozcj6xnjm2ryzumnacq2cnskz@2qgyuyd4k2kr>
References: <20260312-glymur-dts-crd-enable-kbd-tp-ts-v2-1-2277bee4c564@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-glymur-dts-crd-enable-kbd-tp-ts-v2-1-2277bee4c564@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CCONKYKTstSdWAT5M8dE1Ytp_Wz-zztE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNiBTYWx0ZWRfX9BBsvRNWqW2L
 UFSIr1HmUK8ZuRUCu/0lVi2DoUasie1hOIl8iDuMWbYCSJbhHpI/ulDiGD4FSyHxsUSYjL2KG6+
 AIKjGIn7zh02xLWUDKsC5bEqaPJf6oQ2dfpzvrj0Gz/Rf2Hffo0g8kbQhf61aDrbLjjVvBmJINi
 +w+l9JSdsq0iqiSbniHMz7f+HiW8tz6Z8sZIyeJ2reG14O4jEVHylLvGZRp0Z2VZ9JCmENzz555
 w0D6A042frnH1gURauT7PY1uVObLtnRiyhsrCwxPNmImkdp56oT/sYewHAcJhjXfx6j6vt5nsXD
 bfmvbj4g9Ek7xhIEyn/S6cNrkAN1Y1jVCxwJr6L84+Ua68WjgYTf8SDVGu16zKHlW0qrurJgJuQ
 YKxpupwTsJJ2XpEyHQNuFRo+SyfxyoDASFFyM2fSUlpek8SDWCtN4U51LWNuQKZV6jhn9YYAAgf
 qMZ/O8g8/pR/GGY5S3Q==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b2bdf4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=56d9N2h_IVndxkp9Tz8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: CCONKYKTstSdWAT5M8dE1Ytp_Wz-zztE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120106
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
	TAGGED_FROM(0.00)[bounces-97219-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 658232726EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 03:00:42PM +0200, Abel Vesa wrote:
> On CRD, the keyboard, trackpad and touchscreen are connected over I2C
> and all share a 3.3V regulator.
> 
> So describe the regulator and each input device along with their
> pinctrl states.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased on next-20260311
> - Re-ordered pinctrl properties in vreg_misc_3p3, as Konrad suggested.
> - Dropped next level dependency patchset.
> - Link to v1: https://patch.msgid.link/20260309-glymur-dts-crd-enable-kbd-tp-ts-v1-1-56e03f769a76@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 117 ++++++++++++++++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

