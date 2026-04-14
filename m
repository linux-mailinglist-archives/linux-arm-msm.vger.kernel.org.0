Return-Path: <linux-arm-msm+bounces-103195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIqPANV93mm/EwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:48:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A243FD3F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D902C305B74E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CDA30EF68;
	Tue, 14 Apr 2026 17:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1eygQgs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DnGYVCLw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620D73074B1
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776188874; cv=none; b=RaJuoNiXu4u8DUlzSNOIdgUt6GwrxqKkO3Xrnczo5Aq/60mSEU/mJz7dpenMkMGsgzALR0TfOY4Eoueo2vubGb8m9h5oxoIw/vxOjXBQdWn/GbtNyBz5JgrOEx0aJIC1iR7fMjsks9LhEwEsNSbRqPaTN2+j7kVRpRcCqRMup4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776188874; c=relaxed/simple;
	bh=DLjWKHUr4fRxC7wkQ2bqbDdeW+P7NVBJrstnjpTYplo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7bZCgiIPwIYO6610b5LsjdfpkENotRa0GSQyewK6X+PYvJ113lTHFKGflBxN9DUNCHqpXzc2/Ei0zxfeiO8BuMteBFWiosPgldn0qcy2zXD6OmgvE+QmiT7wldmSKDiXX9b0Fx2Ip6zOuuMbJAt9QTk5eWg6CIjm4G/XOlGW/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1eygQgs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnGYVCLw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ECUQmR967261
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6Api2ABxaJJAGN35zZEsXO5N
	hSOE43cphMm15sGI/1s=; b=S1eygQgsbYVkJgCFnijQvOiZIdcNsOhrpnc23tcQ
	g562nRtn8PWUy6MkEmD4Hi/fPpsPu4BXWeijmJXR3OSeRgOziPNlVUMXIgN0DoqH
	VGxj4uHTMfhp1I8teemER4hamaNChq2CP5SesMgDk0pdjHdcBMVoHuHRpEYRIz+9
	x32qQ7Jtlkc6O7W0f3mRDDuQSi/AZEJsdexjDKB8TjwLbZNFLLk167Mw5NwcIcqm
	UfQ/5dMZSIfp5ylcQZfZRcBX45Jif0UdT9xnvxw2khofOLb8mzrzyTxpzYjGuLq+
	ErJIRxxXqT4AWraEczMhcLiCWQ+XIawon+wsaxhox4VXvw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v3tqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:47:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b31cff27fso19866911cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776188871; x=1776793671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Api2ABxaJJAGN35zZEsXO5NhSOE43cphMm15sGI/1s=;
        b=DnGYVCLw+bHpZ6XFepR9PDKvrmzhI/a0m50sEUhfyE2f0lNIIrV/Q5TTyPHuqRQcAV
         zkaR63JRiW5z2nNZZp4EsghNYybE/qGwDDsmdq//53b/ejGLWh2m1h1AEX2+KsqYOyS5
         iKA9QzP+prPRRjnvsiwrFbEd+kEzNAcfQ3gLQ9NJIFFId2XUsHG2FmjJChl3ewKI3H1P
         YUFNedE1iBsWkhvKpi//oZIQ2DHPJ+5RKoGD8Sl/y2wTyKUnoYzKsF78IqdMTiOV1Ct3
         +YJBG10f8ltfXiX0mdAaN5H6Txdce3FX313WNBv8/YNu0Av9nxH6LC+QPOs7aP2Sv/fU
         y+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776188871; x=1776793671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Api2ABxaJJAGN35zZEsXO5NhSOE43cphMm15sGI/1s=;
        b=Fuuemt8QikRcQRdOGg+tsDAekxzDzWMAYUOGT+uVIZGt1svdDWXzmB52LD5TWGyHG4
         AD716MvjzXlyt8NHMQDmgRHKbgOl1mBBITzN7qJCBgMOz1vzM7x8/3z0KLpht/V5WXbY
         kWb7Ho2EoJS4VWjLOk/6HoklyYUeJYJAVE2N8siPYEVnT2MxKF+bLnZee9eoNAkBaz6d
         UNzlJ16K1SP9mjuPO+ZAfg6KINQDJg9qRFv7M5BvaX+KN038jHW57nXKTJf/Zn7vz5Me
         OLICNq1VVRfd7QaGIiNmTB26sPxJgkoAes0OuwnPtDlEN64Qq6koSq2Fp0uI72k0TOSm
         LsgA==
X-Forwarded-Encrypted: i=1; AFNElJ885/VrE1z07Y+kTzNu5p5zQ83youLji4na14TLtnGHRVbK90DTcAvu6EkjIThaItRbC41whCv+zUo3eMfM@vger.kernel.org
X-Gm-Message-State: AOJu0YzIz8i6nhQDSBkhOrq199QEw+TUahU1MNm8WKHvUL0L2QYHJ2S4
	tJlglRlwPP9xPMvyCiRueRH234zWX8afpO1hEg+I0q1+bGAn9hNjPzlg0mx3RT/8l2PuIlNHXga
	R7FN2jJtuhWvD/S7DPpYRO0v9bgFDk+Y46xDf7v3mhkOjS82w1V79J2Oqb0TBq2YFzoqi
X-Gm-Gg: AeBDietCwpLLSZt/cJbfHOg42Emf+r/AeKh1zbHcGSQJ1F1N+wvOyncJ8XpKDP4Rob6
	mFPT+KvRwjh4QCOqj8tlPK1Cxk3pwQaVi1ZTtUWotoK7l9IZ0OdeLwnUjp+CWxgWWk4ZWiKWTLT
	nLWrWRYEkgL3UOh6Oh7C4eMoV7+m2Voc/+FbCy2ETskLl9hZ4oXSi6q6Fs799hmQK4ZWkeggLAD
	Kv7XTOROUSk++Ii4maC7OllFNfdtkeuyKoK1qBzyokPUqUxxVFpYO/vzQxJOCnTTOvVAnwlMojd
	DelSUg+bvVOfn/4kB5Vz0sdyBKbsN2KSvHvJNqGVCsTdx91NSBiVrntt13ioH0I0gj8KIyRZtgS
	St8vohbZB2uifkyRbzuamAMBVUTlDuXWbpGUaQlXacXJ95vRK66dSK2OeQYvP1fTFBAFoSk2lXe
	DmGUqyAsky6oc89lsKt6oVqLpKYXjeoWxx6OV53dKnrjhy6Q==
X-Received: by 2002:ac8:5f51:0:b0:50d:cd5a:577b with SMTP id d75a77b69052e-50dd5b9aacdmr280256261cf.35.1776188870641;
        Tue, 14 Apr 2026 10:47:50 -0700 (PDT)
X-Received: by 2002:ac8:5f51:0:b0:50d:cd5a:577b with SMTP id d75a77b69052e-50dd5b9aacdmr280255661cf.35.1776188869942;
        Tue, 14 Apr 2026 10:47:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3ff46fe7esm1333287e87.36.2026.04.14.10.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:47:47 -0700 (PDT)
Date: Tue, 14 Apr 2026 20:47:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: talos: Add QSPI support
Message-ID: <4o3n5bnxijobin2ds7s2hhwjj3ow5q2csw67qfb5epri6okqj6@5i4mmzuetyj2>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
 <20260414-spi-nor-v2-4-bcca40de4b5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-spi-nor-v2-4-bcca40de4b5f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2NiBTYWx0ZWRfX6BoYL3lqGCxL
 KcEmWwWCeqDOvSwMvSFrQ3Y9D9WMTfU1BrN2wTup0aCewHnCithbFYbG5Jw28Els5RdyL7JgZex
 miCCkjvoIzy7shlBEdd9rOW0RBc7INvnJd5lVo78cjLlDhlTLsz3rYIzNbtaW+82mFCnXCHdMaW
 d7jW2W9r5vDoZrlptrfo+tGaHYUVOynWrnrOyWCRaP8fsZoIytBWdNxo3f2IFAUzANokVEBmMLH
 So9vR1KxgoE8ezk9uxVUDaAgi+mVUGWF7w47pLqbN0b2BlWYQ6KmpIL5nyWIJlGPP6boueztpaM
 KVXFSZQDmFQfaRoeyfQXzm34zSJ17nAdOCv+J5+p9MmzhKTNkR2gIYmdsg84Wk8yaWX5iRlXDBc
 i1/wUxTSzC/w+ZEoyKNz5TufAILQYFxTjzuj0vUyXASp2DoFRau1zkCId4y4EqdMELg5QDNu0SQ
 pls5V2KSJT2rMn5ur8w==
X-Proofpoint-ORIG-GUID: LAvZ240sAZgqGDjMQHt5pKpUm4dqO3j-
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69de7dc8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=6S0_C-bIcAkUoJHK8-sA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: LAvZ240sAZgqGDjMQHt5pKpUm4dqO3j-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140166
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103195-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76A243FD3F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:38:22PM +0530, Viken Dadhaniya wrote:
> The Talos (QCS615) platform includes a QSPI controller used for accessing
> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
> the QSPI controller node to enable support for this hardware.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

