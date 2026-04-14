Return-Path: <linux-arm-msm+bounces-103175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JAxKPFq3mm5EAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:27:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 054603FC8F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A0143070730
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC153ECBCF;
	Tue, 14 Apr 2026 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0qRYGIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d2sOLzVj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C1B3ED100
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776183787; cv=none; b=k1ifOIXUgTjLqU8WTmVni85WyDUQJkRtS6m0KqHoBvVZf5rwojPuophOiolkUBfyztlSsNZdHiIEIKnOnqN5vrrJ1trdXCdyPfiqCX4fqqAdF11wZGfPi51e4XqBetUizArqU7srChig53rHWkaG656fdXrLQQIcOXbm395CgqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776183787; c=relaxed/simple;
	bh=kgw/leoTGxLg1nM4bVOPBMAHfXyZK4DgC1hU9LFGdgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0rJdcJc8yNCc/dhjicbOwkumg89KOMzWumNwrgHAHkV1GjAPn9jD3CsrVGWTNto//VNfu2gJhZMlHduA4XszHJypxLrgSJLnaAQTzPk+U4qHX1YmVR/lSXCMbaAFySwtgabCrzlj+OWqb7KUuDY39S4T3X4l5dIsvblzPpYaP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0qRYGIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d2sOLzVj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EG9M9w731099
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bZRQgoLCBjAmnWjcXVkk69tN
	DPCR8v5dAL1Ef6k4798=; b=i0qRYGIfqjbdY9YvaCzgAHaKmu7aCzWE4cqoLRJU
	IDcnIVbQaWGT/t27rqJgeoF+XbjVFGxNnIIYHDiADTCmd10IS3aXkOkm95Qs/hV9
	6IunnqaS1iCLWMFO81WUF4uB5XB1BkW9FZBkAs1IlX5enM+yDqE3qoIDF0pR1Jmg
	ETW9E8S79ssPTs8iGqZSyEIexREz/F7YPVK34a6Vxs0uYvQJJLJnqy8dI+A4OeAf
	PxKV5U+rT55Do4zDgno8olPVsTzeUBQvlECKD5hhRT9tW8qfKMGJS+ClkMYXBtHh
	42D87V+E/knOiw9JNkwNqGtAJt0WSfHehMVCYmD7azwuoA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhruu823f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:23:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50df4c130dbso70199511cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776183785; x=1776788585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bZRQgoLCBjAmnWjcXVkk69tNDPCR8v5dAL1Ef6k4798=;
        b=d2sOLzVjj8fRiYuqMtlWtzd9HvA0jVeI1YxWPbqp6TEf/dT/1Jl2OYSSa3UhJFoFY/
         eL39qyiKy8CEeAGG5U3U7W1OxVbeuiDbx7SHm1bJByFwTZ7lXyvF4/sTzL2wpvnuRufH
         0/8Vjmyu5nfZOBN2GyhLCGDWRcy4FBQfLTX3H3H4cEGlQAE2NCVdXOj42MOp50rK9g2S
         vsrfBj5IqczZItC365nzfwe5OsOI92UUlFdFhFKgpEYZ2CM/AuYtHYB/CsV3sImZuK+x
         D1yuoS+zo0MlPeNdnK5JAFS7PeDxXDmnOyVxfVZkeqrhrgnEx3LCcMP1FAhls9l12aa4
         ZM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776183785; x=1776788585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZRQgoLCBjAmnWjcXVkk69tNDPCR8v5dAL1Ef6k4798=;
        b=DsMqDNjiWtczeUq/rZl+5bBb1HKjdpHDKr/hstPprMh5s1ieOy9FatfcLW9sIHrjO6
         sPqsqeLocg5BQThthyuK9D15bK5HXwNC2VEyheMEkIncBRYVxOUjbasyhA150kq3snqZ
         LemolE9pjvdC+4p5NlS+TBX0wQhlHhKZRolvhPwhKJImeYFCATXo39HRFmWIzlb2Uogz
         UlhEb52lPt8GcCj37iQmnvCW94wenNW7uijG/qSFkBeG6FsADcDG3jv0f5ID8rasbgso
         bZUkT+0PipkaQNWWRDCTJ/ySCzwhVx1IwyD6Qi7E9r2VVcvaYnQWZHJguijkQuog1Tf3
         EXvw==
X-Forwarded-Encrypted: i=1; AFNElJ+t9qtMSj1eZwhmf+MlWVvuQ0f3dSrmNnJQeYQkdpdc4dLpI7QIEszsi2AOwPnZYBT9RRJWqONVKt6U3eBK@vger.kernel.org
X-Gm-Message-State: AOJu0YwLNT04DG6QSnX6xk92gamIQIdit1WpFpJMkESk296QHicvYXy0
	IQAg7dqsBl7oHdjHmgh7NQWCjD7kL40YA/cGegzDiuhuKxNOe6Qg97SavgXq1FcpJ077N727LzT
	FuyOd8s2eIgRynl2BHN45XL0V/cTIzyCCpBG+pi0Ccdc/0Ib04COv/DOeQhVpwdiPHn9M
X-Gm-Gg: AeBDievw+rLljBFRQ0XM3G526IiVx1D3Hy3hjAytSNY7fOokVl4RwVKwPjbEqg5ZUgX
	+hENYylsh0eWWK36yjiYPEf78rxYtTeFki+szQFVqgZZvajp2jaAjex77sWKCNCHln6UllRhYaf
	nsc3MOoq8NYNxzkNlQ9RfIKlrlzsWo+uV4t2TfF3C7Uom2Onc7rVxIQBs6D/ObBdvAA0lX5Rdqz
	RHw3t+4GTtuI4m4wPvu4g7+KWH5PfnQpuOpG7tmSxG4SvbHmtK+mKB7nuFhYubTj2Qd8FoecJ6w
	v/Dl+zWNQHCDpGk5La/pQtLsr1H9owhQPXNaYckoDJov+W0NPVgGVEly6+gGcSHfJygmww5PaAO
	thjkwhJ5/DEILu9bDEzioThzVIGOL9KadBAWOcQdaiG4lofjoFMO3HYiEJpIok5bJ2Ll6hS8TBG
	CS2cnr7qvxsL1aQPS245U7oKrtwkm44mUUKrmBPfoRNFtWVQ==
X-Received: by 2002:a05:622a:18a2:b0:50d:7a0f:faef with SMTP id d75a77b69052e-50dc1acd301mr299908181cf.22.1776183784707;
        Tue, 14 Apr 2026 09:23:04 -0700 (PDT)
X-Received: by 2002:a05:622a:18a2:b0:50d:7a0f:faef with SMTP id d75a77b69052e-50dc1acd301mr299907361cf.22.1776183783924;
        Tue, 14 Apr 2026 09:23:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49541dd1sm34362721fa.24.2026.04.14.09.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 09:23:02 -0700 (PDT)
Date: Tue, 14 Apr 2026 19:23:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/35] dt-bindings: qcom,pdc: Tighten reg to single APSS
 DRV region
Message-ID: <5z7zoybn2gqsyn3zqvjo7saq2zjpoimkp67ubqenlntzcweyz3@rkm36ya6j44f>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-2-mukesh.ojha@oss.qualcomm.com>
 <gd5ixcfablbyyyz2wdacrvg43jogwg425na6utsgfcterm276k@tdko64tn6gwh>
 <ecb75ada-60c4-40e6-81bd-fc392007e9d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecb75ada-60c4-40e6-81bd-fc392007e9d8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: XNHbYCm3W4DCj1jnEEOmxTvdpBKeavvz
X-Authority-Analysis: v=2.4 cv=dpfrzVg4 c=1 sm=1 tr=0 ts=69de69e9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=5-FrFs3OjuvqJegpMgEA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE1MyBTYWx0ZWRfXz5jMmROdpyEU
 koPaRhXKFSMwcPokHSgXhnq0CebTrV7PyAxkC07NrXa68EhO3koeO7uP1/dS9m0fPkLDe9/eKN3
 TopxV6wzFyQ8hxiQ06G5w1GWhT0q986Syy4OtbRT9d2EhWs0p676rDbD0hWVDzdeN7eXqBC6QKh
 WJaoNS3Nfwme1fd5qfPIvMH/SJJdw0qwSAWYyeu4Mo2Qrt9889HjbcffmYFqdqhw5zGACBVBgFR
 PgmkVaOb/4A4TJJfVtBZPgK59Mhs8nT4M4yp5ctB/uYQFT+MuiKVdjtld7Pls+TujMDhPx10Q9o
 D8823HzH0v5aZoKy8989ahYVg5/4tP44WKzbKBIphU0v7iEQ4kJD/WhRG73D9johwTRr+tXXzIS
 mbSLeT//8CQQinsyv4aTvWxRLtmR0wvkCX+AZgXbH+ENoQbR2V/JX8MXzwbqAV31C2f9ivh8Lo2
 +ARxlLieS5I/nRIGH/Q==
X-Proofpoint-GUID: XNHbYCm3W4DCj1jnEEOmxTvdpBKeavvz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140153
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103175-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 054603FC8F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 10:23:59AM +0200, Konrad Dybcio wrote:
> On 4/11/26 4:32 PM, Dmitry Baryshkov wrote:
> > On Sat, Apr 11, 2026 at 12:10:38AM +0530, Mukesh Ojha wrote:
> >> The PDC has multiple DRV regions, each sized 0x10000, where each region
> >> serves a specific client in the system. Linux only needs access to the
> > 
> > Nit: there are other OS than Linux. Would you rather point out that
> > other DRV regions are to be used by ... what?
> 
> TZ, HYP, HLOS, CPUCP..

=> commit message

> 
> I'm wondering if we can make use of the HYP one on e.g. Glymur, to
> parallelize accesses (and whether that would bring any practical
> benefit).
> 
> In the RPMH architecture, each "client" has their own (GPU, AOP, DISP,
> etc.). Then, each one of those clients may have an associates RSC
> (Resource State Coordinator) and/or anyOf BCM ("interconnect"), VRM
> ("regulator"), ARC ("RPMHPD") voting interfaces

At least the RSC should be visible to the OS. We don't use it (now), but
we probably will at some point (at least the DISP_RSC) if I understand
it correctly.

> 
> Konrad

-- 
With best wishes
Dmitry

