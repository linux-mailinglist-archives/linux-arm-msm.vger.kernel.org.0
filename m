Return-Path: <linux-arm-msm+bounces-108303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P6dMXzBC2qWMQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 03:48:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C92105762BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 03:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B1BCE301814E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 01:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95612EAD1C;
	Tue, 19 May 2026 01:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0F6h8/o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UcIMdlGw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD937175A75
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779155310; cv=none; b=SRNx9ANh4FZq/UrJtSDn/2xKAR6+NxBV8L+p8qtXBTy8EMo6mtQM92A4DPdWh5uYV0/x2hFl9zmB61VvTI0S9p12hwGCDmS8aB3qmhHfHoWufZE6jm5UjIXRlI3HNR32LOHDh4dBelwAGlfDuA9gbWKAxlhU/ZGuVssLK4jdd84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779155310; c=relaxed/simple;
	bh=XbEc5jXZ9sWB4xKJRzkrb2fldPdOFmYhWa6RG88HdAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmDUBg/7G5l53EA/vud/dulV5cJKoOz0vj5/WVhoAR7tKAh0qTj/dvmlogijNGUz+8sxE6q3c6JYQ2JmPsArQm0CG2qLGSh0v37jYSIXNtooeu5iDcaWuUbtU+GCJTN2W3DuVhAySMEs4iiqmSUJqOGUt4iinw8s6aJJrDWv3Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0F6h8/o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UcIMdlGw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IJAE9r2701160
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dUNJ6vnuOO/yKduReFk6vwtl
	edlzl8HNGPEPSgpOhRY=; b=Z0F6h8/oUSMCHA625XXO4/aBzzlew7cHrztbzHQq
	x/WkRqRulfvossdJdNbZP7GScYl+giXzqR/si2xHPdcC7LHUaxINyP4uNwxUpyAp
	XdfuFcMooxloQX3yn/M6g70KE5WhWaOYfCCAOSC1dQUdogCNuOD2Q6oxB/pVYHbI
	39fj5huvPlTLLLcqk9T64xC48x+q+xSnvNgB7/3X4EzuMUiqRNCX48h0Gj8FYsAY
	C15DSHJmRLU1mIHkMTOSwml96ymaHtphkb8AvP1SJ2p2cfj5CPN/yhkEhQ7OGypR
	9jXXbi7MqXvZPecvICG72QN6NkhQAGglSDU06O9Y6mcSRg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82mejn04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:48:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso3765106eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 18:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779155307; x=1779760107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dUNJ6vnuOO/yKduReFk6vwtledlzl8HNGPEPSgpOhRY=;
        b=UcIMdlGw+hsnYdQG2G+OaWE9FAtqvBvf5g2OGxAg2soT6coQJrD0KVK/YYS+Aootz3
         khLk1HV/kpgA+fR/kHjOZiWK/j4v8FNFL5ONTJAAXoQ+yHyL8suxXzKL1tz9+xeBsZbd
         TEZam9HZmLBm9ovzDbtajlNl/6M1mTS8GinzH6Uk+S0OxX0stnXuRBz/Wxv7O02ZLznA
         tS7VMRokWuhxUs7R1V8p9TMlUpVxvSweoaGgpz25WWnPI/0ncyTnpWqLxL1QKpXwN1oh
         jO1YE9UtvbBrkmVi0HApAe7BQOvV2hVRp1FZjMdmUQLrKENg12kynnHyvBiCw4JGlAOJ
         Holw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779155307; x=1779760107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUNJ6vnuOO/yKduReFk6vwtledlzl8HNGPEPSgpOhRY=;
        b=IwxvFDnN0GOzaQFcNYIyEVR/oWXd0TecZigFt+5rwmH3czDKsLsdonIUBirYCvPG1L
         VNGGWEq66mTCO2c/VOzJCZbCIToLTkG1neovVdJ0AGQCuJ2AsOng4XOanvukLWn9PhoX
         7BaA2f2SAosFtudaSSG2XIOHb8AVw0VgDsCpAtuCB/xwwMI2Sr6QglYEFiUniX7RNmi3
         yBKAzvE1zQpVnuAkQmCzsG06ijp+4SEsEe8B0gczHESBwFU5KcGpM1hHLK0MgJ8ANbws
         nw8ur46R3idqcthsVAKDHtD24Yep+1B3eo4ah9wWq+YQt0vPlaZVYONAz3lWr2805gk5
         VyrA==
X-Forwarded-Encrypted: i=1; AFNElJ8m+lacERrsNVZKDjuHSrcIaLNsks2aZZL1Tbwdh37GK+hbQNSVnMdgV23XAdGkfEKja23dC6iuD5vw4Yky@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/QQYRdDKf9rf89+HtJhhvAWOdxKD8hHacqqrtJPYCoOo2+w3i
	dFZhAlTHOKr2n0/VRKCXxrf5nr7dXd6L+Bh2Kj+kAZFK/c5/8wefEWkxH9q8p0j68+SzWTACADX
	TbPaPfEUAjN581I1yKKotmvLAgucjo2dfglScBUxJuC5iiG0AaUVBizvY38RLBMWW9EC4
X-Gm-Gg: Acq92OHJgv5M+edSt+uF1VMSPv8XBG6n99ePYsEpHE3ktDVYSHg6LhrMcm/7I1cd0uG
	+Nh9sd2PPAptF+VC7FP/oFTg2l8OwHF53smMyzX4t6pzCmqWKEtzWEd+iQvJfD7dAuHIglf8w8s
	heqOTBJx8/ivMP2ULtUxHabsSQYKrY0OM+ePcBMy0c52eolhBajgiqC257FB9GmSIq4/mlKZJ0r
	fDa+OWNCpxuBoM70tror39JLSzuKNv9b8VWBk2/crF7wzl1qtRpymosmXnuudmwp0hiVmfSS3n2
	xqq2ujy+omWawrSmJiRiG5wpjz6R4OdZkYWBc/l+PBUqf5uS4jmajhiEO+fOOxXY8QBz1FNCBVf
	4f8zM4K7108zZZGxiXsiu/nUFSEmyRNTaS0rNRbIjoU3n081KIYBRPeU+nk894hU4
X-Received: by 2002:a05:7300:578a:b0:2ed:e14:e956 with SMTP id 5a478bee46e88-303986833b7mr7948612eec.32.1779155306753;
        Mon, 18 May 2026 18:48:26 -0700 (PDT)
X-Received: by 2002:a05:7300:578a:b0:2ed:e14:e956 with SMTP id 5a478bee46e88-303986833b7mr7948592eec.32.1779155306191;
        Mon, 18 May 2026 18:48:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302946f2149sm14501890eec.11.2026.05.18.18.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:48:25 -0700 (PDT)
Date: Tue, 19 May 2026 09:48:20 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] pmdomain: qcom: rpmhpd: Add power domains for Nord
 SoC
Message-ID: <agvBZFYoq9XidETH@QCOM-aGQu4IUr3Y>
References: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Tr7WQjXh c=1 sm=1 tr=0 ts=6a0bc16b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=rNwRBFL3uO6c_JmZLCcA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 3v-4hOZRISNqeQu4txsOIH20Jr07UIH_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAxNCBTYWx0ZWRfXwAWkD0nAV6DN
 hT6PPB0Q9Qc8yeRXGUar8TkDOI2nUjor9ysEywLo6H2iw+obm2FmtCDdfCfKJQLWm4r6DFBI7fN
 vKusVbiO1VXpxSKdMQsQ2TMV6leXIhwy4BV35tp4Na2BZ65QADo8evgbev//ewejvIQK2AVrpRU
 1NeEHgRLO9GpKRfc3X0IyKOL6svJaFiQ6JzuX8B/VIHSrJ1yJ1UB5Ixj0lQjU6px3rdNsXYAZgx
 /WwQDpOw/OpX/w00AiwanbzwwHe7GrW1uI4pz08fI/ZOgpxsiw1tabF9cfbD0+CeQJi4WAP1+n3
 AqO1vdOSAKS++4g0gRVATZZwgt5qfizRPefyAZ4mzWxDGg8nWVdrjksr2E+NsfzQmAs+TnSPl4d
 IYcDbusvUb8VsMgK3iwRxUXoH0vQEdWFysF+8pVZ6X0QkQo47gGkabu3uf0wbwub0Rit+1oEDhk
 IZx0FFxgynmjiOkwpKQ==
X-Proofpoint-ORIG-GUID: 3v-4hOZRISNqeQu4txsOIH20Jr07UIH_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190014
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108303-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C92105762BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 11:59:06AM +0800, Shawn Guo wrote:
> This series adds RPMh power domain support for the Qualcomm Nord SoC.
> 
> The Nord SoC introduces two new power domains beyond the existing set: GFX1
> for the second GFX subsystem and NSP3 for the fourth NSP subsystem.  Patch 1
> is a preparatory cleanup that fixes inconsistent whitespace in the RPMHPD
> define block before the new entries are added.  Patches 2-3 add the DT
> bindings and driver support for Nord respectively.
> 
> Kamal Wadhwa (2):
>   dt-bindings: power: qcom,rpmhpd: Add RPMh power domain for Nord SoC
>   pmdomain: qcom: rpmhpd: Add power domains for Nord SoC
> 
> Shawn Guo (1):
>   dt-bindings: power: qcom,rpmhpd: Fix whitespace in RPMHPD defines
> 
>  .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
>  drivers/pmdomain/qcom/rpmhpd.c                | 35 +++++++++++++++++++
>  include/dt-bindings/power/qcom,rpmhpd.h       | 18 +++++-----
>  3 files changed, 46 insertions(+), 8 deletions(-)

Hi Ulf,

Did you get a chance to look at this series?

Thanks,
Shawn

