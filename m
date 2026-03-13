Return-Path: <linux-arm-msm+bounces-97607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH3NDhBQtGk4kAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:57:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9323B288628
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A38B030AE776
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E4B3D5646;
	Fri, 13 Mar 2026 17:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ic6AVXDz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jM8g7+4U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305A03D5228
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773424434; cv=none; b=h8jc574wlyZ6uZ05cF7OiJ75oNXhaE/fIUTmtIWsVe/tyGPdDJRk7szphu/uwceKorwA9jxhaLch1t/y/ygLFsK8a35eMv4YX8cUTMvIZtr18ULvI3XLrU33Fhig+/dlzRAdC+Btg9v+6n4umZeZLsTlvNtmGo9PfPWpApr5cog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773424434; c=relaxed/simple;
	bh=4dlFVjRh0mtnDp1I89xT4VqE7LF2tQ3GlIUptZ2HwMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYJ/CWfXuixDVJ3kgjlUbZjcDrELqQqLgPJa/ek+n9iUvMPqOaRr91ah5PY1BF9/8WhNYw47QhrKw+A5Cg8eI6C5HHf3S179cEm4IzucstqgR21ynRIpRNeim0cmr9AnwFwAy47cmg8QxZgrbJQZr5gV64HgBZ1F0esVVhwa1p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ic6AVXDz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jM8g7+4U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DHUVan1499093
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A2JMDl5+4IeW2jZHW1dvhML5
	w4gEeF0P7nPpcImmvmY=; b=ic6AVXDzHBaRvHMrNSV6ui53DlR6vdM8hJyTLtBs
	CbXpGbjM4O7Fdr7cBagW0XcCXfOyi9Lud2pKXYOfPxI7FhzeUIf+k0U1tkr/I202
	+jWrOFaKhRJLEOjnBmmae6EAnoFsMdJTRzYhG2y/l4fHPoQGHOhfBF2bY9dk97+5
	K9/uETS3Xu2jSUa1pYGgU5GUQRIChjTqCI75PHW3MngIciotJgSTedcqJCTElq1x
	ND8Sv8rzNofNGNp5iI2EiDazYETCHjtUUlBs+rxknYNbvUgCrHNnzl9hEFx4d1NN
	n+TsNMnb7l8FUKNG2IBlSu16pWV/KxryfZTJncEIH75WsA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hhp6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:53:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd83cfb36cso1635845485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773424430; x=1774029230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A2JMDl5+4IeW2jZHW1dvhML5w4gEeF0P7nPpcImmvmY=;
        b=jM8g7+4UO9eBbszc9iakW0gUpbaFDOnq1FLZZgyBEZojNu8G0gDviQ0DrR10Ab+nMX
         ni5mlzcaTp2h8yMoakyADvEyRJKmAiAof6Jnv0s932+sNYNcqmDAN6uoYhO5AgdvVmsl
         DM/5OD/wkHyCk2Z8YSgyhDNB7ivAEyLuPteximnWc4XqEuexmSZZR4lWfh0ljpIby8Zk
         cDoGC607TUhVLuxzja7ZkuSYPKAcoYaVZrn7wFULCosIosTnQtZ1UjvzuZCrxUJ+Kv7J
         vinSfaUa4J5BmXSdFYABYoN73ELM4f/gCr7/TIvpar/8SPiRHgp3jK6uTF1UiA9Blrh3
         /Fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773424430; x=1774029230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2JMDl5+4IeW2jZHW1dvhML5w4gEeF0P7nPpcImmvmY=;
        b=qkOJ9VUUJ6fTMofQwQd7Fmf9qg3KCEpwu5l2ja4SwuvvQb2lByrukPBXIMlqSlzMgf
         xWlPL+/Du3HCgiVb5tjC/axvHdhkPuCYQb8P7DCzdcAYx30WfsGQeDYPM91QbSRMLCzp
         f7L+/tif8iwoIIqMhAMbD3fe2beahrtcnywx+0FatZ/V7goLQp2FWrXe0yQdkieeONPe
         EPcs+FgoV9dnqSbXG6ImMwHmXXqSroIbULTdiWZy/x2Npw4LOD512lkFeALd/91vGLGA
         UPLgVXemg1DGoYDex18aQNpuRMw/s3uBCNHWQ57eBvSxMGALqc/gzXJ0yOYKNroYUMBq
         dv+w==
X-Forwarded-Encrypted: i=1; AJvYcCWxYTh4FyFqw2AmNWMlVy29YOv5BDSySWzy4WCSS/kcJK3VBCjMUWh1fjcffG725YaXRlj+Bzc2exxK+0jb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+rxQiDNLCF6vF2HIZ05HWEV3m/hJG0q98NiLn+EJw7AGsb9uj
	DKd0RooSnpwwQwkK7tvxKnnCFNd+9mdaHENSQvG2UGgr44H/1ITCxiAAoGDmf7Ai5mVGbMRLGzq
	ujuqte7G0i2fbNBpyzmdXEAjCc3nynJLHk3qPVGN9w8wuIyLfgoF8ePAOusUV0WICut8oRLPvNI
	d4
X-Gm-Gg: ATEYQzyFtr7Sfe8IT371Pz2dfx09Cws0YdauV3ryDXZfiBrHdSvkEO9EGpkpHTpFoKl
	XnLgiTnfzEADXt/S3xzYGmb+lI2ZzK47jWGNsgO/abJj4ccaRz5lC7iJ5zTfh77VwsDiSHXQsl2
	TdcjdLiJRAoM4f2KoDf8n4LtiFtGXWQYyHwx96xlbb4SJOqsRjbURY8AthYzBItM+TTcftFWoLd
	NMl0uRN/DOq3ZATNjHkgmcGLMyRLNG94FhddjwVCCyHWOqX0fSHBOCHU2idnuQ6dxTyhxkthqId
	ZycXTUhnHFGAlVSpHLkj6Mc5LOiGcq7EaCIykkf1d3vADPrzXMFgIZVUN8GHSFsswu5IS4+B6lL
	INswwU8Dyhu9qIA/rWasIE+81jvqZeCcFLPmjsPIo+Y/loydKszcuaW+LrnLteU4oSCRPV3e516
	IQ2ZHH3hC124RwUzGPJWeC1Pykd2QsGEBlHlE=
X-Received: by 2002:a05:620a:1990:b0:8cd:8569:b94d with SMTP id af79cd13be357-8cdb5b47bc2mr584391885a.51.1773424429941;
        Fri, 13 Mar 2026 10:53:49 -0700 (PDT)
X-Received: by 2002:a05:620a:1990:b0:8cd:8569:b94d with SMTP id af79cd13be357-8cdb5b47bc2mr584380885a.51.1773424427877;
        Fri, 13 Mar 2026 10:53:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635786bsm1619901e87.61.2026.03.13.10.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:53:45 -0700 (PDT)
Date: Fri, 13 Mar 2026 19:53:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add model string
Message-ID: <gmeo7kiryfh3qxspzidpwknxgmxqeqr6on2glrjj4tioh6apv5@p6rxe3jw2rkm>
References: <20260309121936.1289615-1-umang.chheda@oss.qualcomm.com>
 <rdglzhmncexfcvec5hyenj7jx3m5hsphjlxsaeq2zhi4z4arml@bjeqghbbaoa2>
 <64f43d77-7c09-453e-8d7b-b4e0e5f05598@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64f43d77-7c09-453e-8d7b-b4e0e5f05598@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b44f2f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=fMGUnWhMUi1KRUnt1gIA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 0Yg4EGgJu3ABAppL8Gi6FgD_MBJai7Ol
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE0MiBTYWx0ZWRfX9WbWGz3YMItN
 QmtuKPRVgVoi8pApkGXamifZjaPZn1TuBBBJDFlSLpl13HEGlJtEwH9dyk3T38Mxo+jUsrdlaZ2
 YAd5/kw6Pae9odz7C2gtN+eVrGOHfHcQyBjxOME4VGhMtZF+/r1HNk68+SaZmgs2AdS7zHe2UHC
 HF6L/Ij/gal6hGVJXHlnEGF9PAgcMlj5o/3PR0DWc1e72qHwRgx8doJlYdykish9O3cz2Oewq7y
 RbrDPyet6jYUygiZzTcQ2kmmah9TP04xKjbDNLpeFlMNLOxIStM7X6+0+dfvvw9eSzHeLNc2RNa
 euFmayK+CBmsJiigsM3hwY9EgTzsg/GiCHHAv4UFEenQE0UrCgM8U9uVwEEAonDewBZV9cvOBSi
 7r3EJ7RN5rqD6W4QcfqiVUECfBRIiWceaYr5ObzsyMh9Okj4/FnqMvZLJa1N/u8kT+IsbGlWBgE
 UZplhs4QFjHv6ecprtg==
X-Proofpoint-GUID: 0Yg4EGgJu3ABAppL8Gi6FgD_MBJai7Ol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130142
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-97607-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9323B288628
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 02:09:58PM +0530, Umang Chheda wrote:
> Hello Dmitry,
> 
> On 3/10/2026 2:07 AM, Dmitry Baryshkov wrote:
> > On Mon, Mar 09, 2026 at 05:49:35PM +0530, Umang Chheda wrote:
> >> The RB3 Gen2 Industrial mezzanine DT file lacks a "model" property,
> >> resulting in the hardware always being reported as the "Robotics RB3gen2".
> >> This prevents applications and user-space tooling from distinguishing
> >> the Industrial mezzanine Kit from other RB3Gen2 variants.
> >>
> >> To ensure consistent identification across all RB3 Gen2 mezzanines,
> >> add the appropriate model string.
> >>
> >> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> >> ---
> >>  .../boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso   | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> >> index 619a42b5ef48..7d6e425dae89 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> >> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> >> @@ -8,6 +8,10 @@
> >>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> >>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> >>
> >> +&{/} {
> >> +	model = "Qualcomm Technologies, Inc. QCS6490 RB3gen2 Industrial Mezzanine";
> > So, what happens if I combine Industrial and Vision mezzanines?
> 
> H/W does not support to connect both Industrial and vision mezzanine at same time - only single mezzanine can be
> 
> connected at a given point in time - hence probably the above scenario would never occur.

Industrial mezzanine has all LS and HS connectors, so it is possible to
stack Vision mezz on top of the industrial one.

-- 
With best wishes
Dmitry

