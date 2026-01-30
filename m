Return-Path: <linux-arm-msm+bounces-91224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zYtbGnsHfGnfKAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 02:20:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EACDAB6223
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 02:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3BFC830041D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 01:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0A332FA1E;
	Fri, 30 Jan 2026 01:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTBUgMxd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S+6ZevrA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FA72765FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 01:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769736056; cv=none; b=l+xJahR684wt3wGwuVkcTcoFUmOqrirCThKw6QwTyXNB9vrt9+zoPQn5MPgaX1NFvLYE3T4s1gdfO73AV5r0nKgTyW43VBAur5Q1RkBND9EuRJfBttiGjYPiylb6ov9eCRaZgtSZKgTNIAE61l9vJNjo0DK4RGKA9W9utDCXLsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769736056; c=relaxed/simple;
	bh=aV9mNGX/QgwIoTLNO2jlS4Amiel3Mem12yLf3mLvol0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAe6FX2rl7T9DbA6V36x4YVCSPCwe6xlcjp/Lnh35n3MnQUCKVup/EqbZk46r7ayAu8LJJFpnrjwLbWyBrtlPkEotf0thaMpRCVOQcHi+S02z/VBA1FApzVv6yy0v0UCZh4C0Ikv3dn45ZniKBwEmEpLWFPeBxrkoecViEMcmv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CTBUgMxd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S+6ZevrA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TJqwnH072175
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 01:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PoTbLF9kWs00/2KweNE2sFqCe/FXLyrVNbOL4WgTYoc=; b=CTBUgMxd7XktnKNK
	ijgl5aXG5tROYNsZIynJjRa+EpwGwxtVfULLwTwgA8HuciAo7gslg65x40HGJ6uv
	35Dz5lrwzy5yMtXgfVIMsoF6KmXFTCJmV3HRey1Vs8pl0XplyjKTRi8BCoN1RPtg
	B35Yl7SRa525QKK1WFFpuBVCr26SGCa28Q05QzuV1uDEYZxpx13/h2ybUQL3Kj3p
	UOYQMINBooXR9/w4tIQBNe45MKzPHA1IsZedSbx52bF90wRcH/8WAlkM9aeInAIy
	9i95zs7SsbZaNR9sAoRcgEo5pVKP2cYs5WtBu9dJIhO+RHvzbM+Ng8h2A003tckJ
	3EMW1A==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0e3k8q6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 01:20:53 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93f57cdeb11so2126504241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 17:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769736053; x=1770340853; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PoTbLF9kWs00/2KweNE2sFqCe/FXLyrVNbOL4WgTYoc=;
        b=S+6ZevrAuyHUclOr4LUzujE6ubsHy1dD4RGg3Xo2+f9YZhwv9rrESznPB9oetY9SuH
         54JjJ6SFGcoLSKnpfEW44pfyhYAvmSRmc8wWxHvB/1+YXm1Stg624sNTByHHxqK9PE+q
         H1h+Bvlocl+W/RIA3XAQEDWnxiB1wFlxPRlrzO2m/nEyhtD8YKLP0nJ9Fjt0ZjrNNQz3
         2zs3N4RlhWxN7ClGcoWCmQdiIb8pt61G68u9NRN0KyQtROwaIritB6nPWit6Hia8TuZY
         TOJ+PFoN/QiJ5ZpZXHGNmOi9fiWK/82oGucvo5+cbBTQOFF/HzTeVrmig2eRY6pId36Z
         rXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769736053; x=1770340853;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PoTbLF9kWs00/2KweNE2sFqCe/FXLyrVNbOL4WgTYoc=;
        b=KIglLoMmUDojdpE5pN/64Wv6SKutAoOUzcreXoAZOyb8X79QeSxNaz5S/DDG+M2id0
         +nIb0uEbDuZDvrzkoAUYXYipuAN1OcH4DTfeftLGYOohbrRYj1AuD2Um4Hzm39Fpd7RM
         dt6HfgW4+L6YJIrva5Pi433FtAQ8zX4chmHHRjyd8DwCHI7aKvuiAsFTghfpNhwH3HBt
         3hqlFC/VRF3xMEp3m/+lN6Xp1DHAqUn0aQF0jRUkcJ8Bz8b4W5l68wOnvj1/puw6lsq3
         oKOczTCw/Uec4dNrgP7iW7y2G76dhIPnpcMfHgLKWQqBCb8DZ4mCkwwJCO8u56V9XP0M
         4j5w==
X-Forwarded-Encrypted: i=1; AJvYcCVhbDYCnHTP5/rEdHwWrnHW1Cz86HbpSwEQYeGdyccQst31GLTL91gBN/AM6VzJ01vHH7nch4tfXtIRepro@vger.kernel.org
X-Gm-Message-State: AOJu0YwbbOxla6L8MoUIgSTKjG1lFFf7jy4eqyTSBM29wEQyEcR9bsxE
	0FcWupRmeFKDkLy5n/i5jngSMzHU0X+afnR8AIWvvrkxtnP6VS6k3/dg57eITfudfOv1A/usnyU
	6use6D44bLTLF9rp5RlZQwk+9EpVKf2MGBxaJLMh41q4wMUO9a2Fj1bR9dtpZc1PmIOe8
X-Gm-Gg: AZuq6aJFcAAvDQqYFHBoyWM6cnN8qM3GygCS6pPTclh1RyO2YcYkIi4U/3hFb75jq1p
	y7kvljm7dUszVcg17YMeirjUHRFe8ZkFYfxH72rL+gRwxPKTB0XeY84QvJNUnkRyJW9MF5Mn0Eo
	MoIwvRBjkw2ORcgzBt9FP8zEIDTpMmkDklVu4idUdRN99E2tNJPSpLUjouuiuEW3czboAGCco65
	coUxPY4clcZhEaOBlKjM9gP2Ye7iYkqGpGdrN0Yn+lC3cLRMPKgd7l1flru4mg18Pcgw178w2IE
	HuOO2hY/vAtnrVqZ7x1cTI3O3LyS3DGvCSBUY1vfAXuyI0zcjtAjxXRDl0MV7i8apx0nO3aYn+b
	U5r9UcuF3/nX/gJSjJwW+sIUpRa9s2BO3450/jOEPLZoo3+x40pUlugPirk92k9jXy/L+PmBuY3
	8SgSVd11XeJ29TvLgXiWKoMu0=
X-Received: by 2002:a05:6102:291f:b0:5e8:1d93:921a with SMTP id ada2fe7eead31-5f8e24dec68mr412666137.15.1769736053284;
        Thu, 29 Jan 2026 17:20:53 -0800 (PST)
X-Received: by 2002:a05:6102:291f:b0:5e8:1d93:921a with SMTP id ada2fe7eead31-5f8e24dec68mr412647137.15.1769736052758;
        Thu, 29 Jan 2026 17:20:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b2d95sm1448055e87.60.2026.01.29.17.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 17:20:52 -0800 (PST)
Date: Fri, 30 Jan 2026 03:20:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: lemans: Enable CDSP cooling
Message-ID: <wyvog73ymk26b5chg7afdjdqln2hcrvir5h234tuiuazmc5ktu@ptr7w2nbmlky>
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
 <20260127155722.2797783-6-gaurav.kohli@oss.qualcomm.com>
 <o3gdovqbkmclpmrhjtg3lknhqcecwfrp73bpbv6nsspzvkjfm7@qqkrzte3cdy5>
 <3a1b3a2b-d73a-4dae-b866-14abec2ff18d@oss.qualcomm.com>
 <stmlthovu36kyhhnn7s7rpn5l53chnvmn3lmyepzpg33o7hpo4@cnoknywqgry2>
 <62666d7e-7b8a-417e-8224-4cc69b3e7c29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62666d7e-7b8a-417e-8224-4cc69b3e7c29@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VI3QXtPX c=1 sm=1 tr=0 ts=697c0775 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xFKFi8ZNh1L_vYKN6ewA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: 8lqXRueBe3skBmhprEd4uZGDR9rPURDK
X-Proofpoint-ORIG-GUID: 8lqXRueBe3skBmhprEd4uZGDR9rPURDK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwOCBTYWx0ZWRfXxa0nf1vCYcw5
 AYInvaFLxZZA0WbgS1kId2nWpT5BI4fnIwDYcOg2AcAkrbx0P1okB0b6IlHxsSKJZkaldfCYVK2
 javcoa1O2vfogoQCqc/WDXwurPsx+ty2NZ9eM3iO2d7EaMz4eaGxLWKBM7edE8arQVujfcJ0bzM
 XL5WNV3xV07IaPyDVTAWB4zGixs9NEpQducXo/pJZ4r+9QYTvE4uiGmQj13Erb+4+sD5NzvvqFP
 WfI1mTpfbh5aOHC6SM4jZtqUS+C1Glh7OmKFx6gOVJxwl9u6M6UWuz/o4HX3yGL4N9kJ+/arC35
 4SVdJKO+/esPtOCq4LYB0f4ThacxcPJ/m4Ie/QPZeJII+pmDXnLPyP6/5tATeYcDJC5hVaKJal1
 1IKUWega3xtOeYw2Wn0sE9wd1PKLRupFWan4FErVuYvX0JJIEFq7M0Ofz82kEMQlj3VERL1dSL5
 A5bq14Nj1WcRlYky1Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300008
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91224-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.11:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EACDAB6223
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 07:10:49PM +0530, Gaurav Kohli wrote:
> 
> On 1/29/2026 5:59 PM, Dmitry Baryshkov wrote:
> > On Thu, Jan 29, 2026 at 05:40:56PM +0530, Gaurav Kohli wrote:
> > > On 1/29/2026 6:13 AM, Dmitry Baryshkov wrote:
> > > > On Tue, Jan 27, 2026 at 09:27:19PM +0530, Gaurav Kohli wrote:
> > > > > Unlike the CPU, the CDSP does not throttle its speed automatically
> > > > > when it reaches high temperatures in Lemans.
> > > > > 
> > > > > Set up CDSP cooling by throttling the cdsp when it reaches 105°C.
> > > > > 
> > > > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > > > ---
> > > > >    arch/arm64/boot/dts/qcom/lemans.dtsi | 138 ++++++++++++++++++++++++---
> > > > >    1 file changed, 126 insertions(+), 12 deletions(-)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > > > > index 808827b83553..c747dd534caa 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > > > > @@ -7281,6 +7281,15 @@ compute-cb@11 {
> > > > >    					};
> > > > >    				};
> > > > >    			};
> > > > > +
> > > > > +			cooling {
> > > > > +				compatible = "qcom,qmi-cooling-cdsp";
> > > > > +
> > > > > +				cdsp_tmd0: cdsp-tmd0 {
> > > > This question was already raised. Are there more than one cooling device
> > > > for the DSP? If not, drop the subnodes.
> > > 
> > > Thanks Dmitry for review.
> > > 
> > > Yes, Each subsystem may support multiple thermal mitigation devices through
> > > remote TMD service.
> > May or does?
> 
> 
> It does support. that's why need child node to trigger different mitigation.

Then please inside a DT bindings provide a definitive example, demonstrating
that. Otherwise, reviewers can observe only one cooling device per DSP.

> 
> 
> > 
> > > So, need to define subnodes.
> > > 
> > > 
> > > > > +					label = "cdsp_sw";
> > > > > +					#cooling-cells = <2>;
> > > > > +				};
> > > > > +			};
> > > > >    		};
> > > > >    		nspb_noc: interconnect@2a0c0000 {

-- 
With best wishes
Dmitry

