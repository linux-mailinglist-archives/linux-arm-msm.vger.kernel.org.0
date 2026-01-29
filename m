Return-Path: <linux-arm-msm+bounces-91178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCG8NrJSe2nRDwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:29:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0227CB0107
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 476E43002F69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0073859EE;
	Thu, 29 Jan 2026 12:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A24iaZuc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SOxNp4zN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2392F5A1A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769689771; cv=none; b=m3Z9KkzJlPd0a/wR23IUrcFqP/7YMI84byhxcFzQia9W5tYw/0gT3ffmP2TjNpgaxl71m6ho7vr9k9MR+sAqnG1yMGdoH6A0HN55jYwXFwP8LpJUEnbpgeAxHY4Si1Wo2XA1chvdUre3YGTPpsXs3Lb1zgQSQ/hN3TGUhsJ0eMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769689771; c=relaxed/simple;
	bh=Zw9AndoEa0T9RhFboNwNcxTyO913HoPHAwMfMc7OTrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZZUGHjLnGCDTa8fdtHI+OKXXsdKPbiZB1Mwsq+XC3EjWOp79ksrJGUewSKTzR+YgguIVWmkQvu/gu0Odlhqyls085cKTwgMBEKmMEw+wg2SpqmHfuN9rhP5BD0oBakQdHOecCAJDb2n0C3LxdMEgqjAZ5agoGofKRfmyJ+wDMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A24iaZuc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SOxNp4zN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAKSCx3673903
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bseSTjOPR1bRtBco40OAygrCPMHHvnjAqNPg5drYHlU=; b=A24iaZucrhPurdJC
	QrqYFeD4lRH9lZKWzRcPch1okboL2nJI+O6ZhecoJiUVu/EIfIEbQ19zrERiZXRP
	6cozdLv2Yqd2p+QGAdaLwiLdliKwnXnU95mxvIq5z5ombBFnWveGzX7Di0Vgnzxz
	OXR5Y/hT8WnozsvNrzETqX72winBvUqJzZzuBwTX4PFeosPtN2B0Z3/3aCRiEkBt
	8Lth59pqdquisSuWAvfNJaOcW+bg7EIcZ0cQfWJRkDevlMpy6aqKpb+v6Ipm3EAI
	Moks6dEnO5dhBYiNZQ37AxQifVIjZJIWqC7MmLnO53haFCcK9JUv3mMyxDlQZKfZ
	Av2Bbw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05q7gba1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:29:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70fadd9a3so285626185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 04:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769689768; x=1770294568; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bseSTjOPR1bRtBco40OAygrCPMHHvnjAqNPg5drYHlU=;
        b=SOxNp4zN1FjQD2A9w5JgIBfLzR2ly79T8TepJn0VudH8m4EOCanhKRzSsQD2KXhGeD
         4zOCrIlepei3MZQEZKSZ5oq3KyR3rI4Uatz/XfktTfrVwbnbWtRE8EeFJ8wt6AlsEiLD
         dGB+ypdGUPV8MOs2d6CZD5EuTHQmFKT0kxWUSRi0te0y8QStgN7mQCppLAcSCC6YNn4i
         6uCmrO38catacpPzacqdqxaak5PKc9+baDZRxw76Qcg2Q0f6jCanEj/2ihmUhwKKTl1y
         SniE/R7LZcgJ/8RSXQbI3EVXUwZbi/hFg3p9P9YyPgAvwf2EGyqaeDZqOtzIUxJ3zTyA
         fzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769689768; x=1770294568;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bseSTjOPR1bRtBco40OAygrCPMHHvnjAqNPg5drYHlU=;
        b=ihkbzsQFaK3bvkZtgoA7YmqGeSiom8kbIOW/Esv281ukFssWOraDJXfoS5Ac5Z9UVr
         4Wl9TruiTDOVz/JPF4X+/DcJEO2t5GTOgAamX86tgVlfgcu7aswNUkeD0NsvtmlpxyL9
         HICifcCdsHylet3c3UWK2sBYeX6IDCH3g+GhmdoubHx8H4STpVZ4hy6MJUeMaHjNDOKm
         rqckeIohTZq7fsO6fa5kixaLFo4f8KEgi7mkddquUrcCsay6XN8TbLvhzPF0fjDCk5bR
         UwPrUGukso1M0oinMWNvjMqVl9GTGXGOpBSd269gZZiGka4ugDyLC90ekOAXRLDcYUfO
         FNrw==
X-Forwarded-Encrypted: i=1; AJvYcCWEgaUgTEt1q12PBRorXT6OlH49WS2bqwlPzzaHQ8pqv8LhLz2d2xteo9NlhB3maiCvBozWEnYfMPTvb41e@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Vinx5u5Ly9nhH9fyuiphcMMuv77rOSWLANzvDTfbyqq1I4vr
	Loc34FGwKlpf1L6Oi3dV0bAsRd+IVg2TJ3dTKCP/oS9p3XINsdx3A0LhdrBLFAE7JQ5JmmCN2YG
	Hq8tD7Aj+0pql3fe307xcHbjIgK3Ap2kweuElU9RgBDtvD3gsjJrzGu5M9ekAa+BpkhUE
X-Gm-Gg: AZuq6aII9ZtV0jKrvL+i662mztVrLACrWVgzk4s0QGVLEMPp8E4nELBygTXm0kzfq7L
	Tle98ofldqIeeSY936yOLXkxgAQZIu4+s2Wsm9RYzKGswcAXsho4SakqlKX+Th/aXw6KaU0wcIw
	bgaA+84p1CwOntkFbpwr417hawvwyTqEmHCy89njlp5IaHHeU9VyHRJaj22Azws0lkNPCqMDtpW
	DUfuzypmmwUYHCT3KRw0FKgT9LW9bHl3pxHGlfdde3G58qbrVnDHS7qxGl4RwcnVZotkRI7Ayzu
	dsXzF9YeVHr0P31uY+Fk3ZT/n2nJ4iguNsBFN4HuYjaWp1WG4nqYPj2Laq/A/p36BNiiU98mevy
	gC+/u7YRLC/qil1Du8qu1N3R4Ep8fw4L7qoL1PrsRWgiAMquzcFlo4w2H8m9L8DcFXzz0hne9j5
	eyAbt0ywEOUFVI7bgNAA/giy0=
X-Received: by 2002:a05:620a:29d3:b0:8b2:e069:6911 with SMTP id af79cd13be357-8c70b90da5amr1046009985a.59.1769689767687;
        Thu, 29 Jan 2026 04:29:27 -0800 (PST)
X-Received: by 2002:a05:620a:29d3:b0:8b2:e069:6911 with SMTP id af79cd13be357-8c70b90da5amr1046006985a.59.1769689767238;
        Thu, 29 Jan 2026 04:29:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c8225bsm8413041fa.18.2026.01.29.04.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 04:29:26 -0800 (PST)
Date: Thu, 29 Jan 2026 14:29:24 +0200
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
Message-ID: <stmlthovu36kyhhnn7s7rpn5l53chnvmn3lmyepzpg33o7hpo4@cnoknywqgry2>
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
 <20260127155722.2797783-6-gaurav.kohli@oss.qualcomm.com>
 <o3gdovqbkmclpmrhjtg3lknhqcecwfrp73bpbv6nsspzvkjfm7@qqkrzte3cdy5>
 <3a1b3a2b-d73a-4dae-b866-14abec2ff18d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a1b3a2b-d73a-4dae-b866-14abec2ff18d@oss.qualcomm.com>
X-Proofpoint-GUID: HczXFs2GrfBHkxEy4ixHKxyzH_P1AEyC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA4NCBTYWx0ZWRfXygLUxZ/elGJI
 5SHVO2/EAckSmrr9/PhkKbNJkbSeAPxmsGyi2VIJAI/5aa4bkoQ1FL+kbd8Ver+RlXy6f+HZrMe
 B3QpxwWho/dRlM/y/1ZoYnAvHuFvjF4Oh3ifd2I6RHlO/jS7zF2OGQTDrj3+cNgA/NHgfycjgNs
 ZD4YE0nqmPv1vvGUwFixrKxiYG4OmipYPWNgWARJMCvmzs2Ukap38X31CypqHOkt4vFp+P91fL7
 78WFv1klsr9FBs6dYpbwUE6nKmZ4BFWPx5UY7vzfU7PR4Sn1dCi7BWIW4Ghon5Ba9WxzgTZ4w5F
 pDHr3+poCn38v/HCHeMfDRsXdBML6d6G8G8kuAyjOr2/GH3Sxh3FdjjJ5TKk9qaEYHBhc+95YdX
 hXrbeicnepHuSajw/QIkbr7VZkUNR5S22uPaU6KHdSLzoRlTCmkfLKN6sTgvVm5jpRerhuiiSp0
 5+ZW7YGv/WSXxbd2QlQ==
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=697b52a8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=073ies5X1yjxOHlRSNAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: HczXFs2GrfBHkxEy4ixHKxyzH_P1AEyC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91178-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,2a0c0000:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.11:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0227CB0107
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 05:40:56PM +0530, Gaurav Kohli wrote:
> 
> On 1/29/2026 6:13 AM, Dmitry Baryshkov wrote:
> > On Tue, Jan 27, 2026 at 09:27:19PM +0530, Gaurav Kohli wrote:
> > > Unlike the CPU, the CDSP does not throttle its speed automatically
> > > when it reaches high temperatures in Lemans.
> > > 
> > > Set up CDSP cooling by throttling the cdsp when it reaches 105°C.
> > > 
> > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/lemans.dtsi | 138 ++++++++++++++++++++++++---
> > >   1 file changed, 126 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > > index 808827b83553..c747dd534caa 100644
> > > --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > > @@ -7281,6 +7281,15 @@ compute-cb@11 {
> > >   					};
> > >   				};
> > >   			};
> > > +
> > > +			cooling {
> > > +				compatible = "qcom,qmi-cooling-cdsp";
> > > +
> > > +				cdsp_tmd0: cdsp-tmd0 {
> > This question was already raised. Are there more than one cooling device
> > for the DSP? If not, drop the subnodes.
> 
> 
> Thanks Dmitry for review.
> 
> Yes, Each subsystem may support multiple thermal mitigation devices through
> remote TMD service.

May or does?

> So, need to define subnodes.
> 
> 
> > > +					label = "cdsp_sw";
> > > +					#cooling-cells = <2>;
> > > +				};
> > > +			};
> > >   		};
> > >   		nspb_noc: interconnect@2a0c0000 {

-- 
With best wishes
Dmitry

