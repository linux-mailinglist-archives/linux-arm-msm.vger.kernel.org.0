Return-Path: <linux-arm-msm+bounces-118490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0VapDqOFUmpiQgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 20:04:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 972707426E0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 20:04:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nlhG9iGs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GEYUxQRu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118490-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118490-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B0D93015D13
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 18:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2B42FE56F;
	Sat, 11 Jul 2026 18:04:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7C73A9861
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 18:04:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783793052; cv=none; b=XL2tCTBKsGToAnrLLXTdPuh/O+TH79JObR1YzfOaNBp09IKcH1NwUamwLdODgJ1E+rFWMsn7sVpSuCDHRx3eTTGxff/a1hkHpRm+7MmeazR1YJHs0YS1W+JAmbam9n6BmkC8+oAxQhiq69eBDASWBHq0yn6WSNr0e6LjOPyE0hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783793052; c=relaxed/simple;
	bh=fMoeKDL01AH/hbKIXK7dj8/vhNF5UG/sgOmRbn0CUYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JX/HxuPNjGArqqudk7npHsD8IjR7GUnSuQpeVy3XohIqrmSKj2P2X66Dq9wZCgVEuYBDfF3wsQOD9M0Og2OnEdY35PRlPUCqO6tYZ3ISkj8JDlFVSH1mh1nf9Q//bvkAGyG3JE6wKMQ/XhxtS8sPKc9eeap0M3a9J6O5q7QUPHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlhG9iGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GEYUxQRu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BHonfS209493
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 18:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gi7mAsPzRKDSQ0PcWw7D/RRQ
	waT6XIdXYVfkOrbW+f8=; b=nlhG9iGsUHzeL/pnhekXb0cQ7HhewmN3YpC/275Q
	H7XLy/KMwJ1+b2ZI6OhPtuAo6Z8h0M3Sk93fuuw6etBHnbb8uhshs9nhBrbH7cXK
	kLDDcoqjYUC/3uGM5+45SVW8p+6sZSFJfJv0b3z3xXUPkUl11kDeKHHj+2yU1iqn
	MfZ4lmy07AiA54I8IgdSVpsGf3QdoK2PhqnNf55ddEZm42f6cBpi2GhxyMIqsFRI
	K2/6eB0NZjIc0yVfUEniZZQd0WjQ01GTIzxTbQbZZsqw2JnKlWlBiJz0tCyvOI1n
	LdoYGMsVVVbE0IVeC74yZovJiDk1dx993brLSt+EelMtHQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekchaj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 18:04:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8c689b5fso21863901cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 11:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783793049; x=1784397849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gi7mAsPzRKDSQ0PcWw7D/RRQwaT6XIdXYVfkOrbW+f8=;
        b=GEYUxQRuc0ng4GcxE3S13rvuONZKCnonUfVk3G7PBKMMOWrmNnDUdbZLKYTA4vHUo4
         FLy3p8fl9RLurp1rj3YbjD82QgwLRYLgfy0V8eC/nDzD/vDMu/P6671R2ikzkfkDCHTm
         6kCXQtHid7ELefPrDWT8ZGC9LGnx7A/WiIUuvJHyqcY1ghiQdlbjMjFDG9pj3rVB/yGZ
         ZwTXpcN+c6oo51/rR46kshWndbQ1iWYnSKli9v94Om3BzFNtj0tuwUAAx2hacPGBXG8J
         FgXjEedWZqW7U8Ofx+pPSFAP2mX1DxWgj7ojbXTiQoT3zNn9bj7Nrv0IIF59kdoW0iSi
         WS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783793049; x=1784397849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gi7mAsPzRKDSQ0PcWw7D/RRQwaT6XIdXYVfkOrbW+f8=;
        b=Lbzy8LLvNv4V434LM9LpqP5MimP3M1bpl9o7Q8zlZcRZp5q6Mt0bey6UL9R9A6y8Ln
         cicI5g4K56bKBctYfHv7E7OaCoVt/n0rsXDpR0D6UXkYgNCRYqrg8evgEKzomzIcEdhi
         gywUhqH2zoGY8ast8VsCBCDqRAks5K0IpOqO3J3Sav1Mih/3l4k/eEYJ/80+izSZrxeQ
         XWYEYrbKoVPTJmFv8LDgSjWkJau0Np7A7l76vZOjGaDL4WY+PVQNb2tndEs7YlO0lnWI
         9wgS82EDW/o50BXnHLvLnbreH8lWx4H958JMIvnRs95mYH8b9KY3MZ/Ig9Mzfpi34hyp
         xvYw==
X-Forwarded-Encrypted: i=1; AHgh+RoIbz04x/3C5yBd1frWrkItQUWB+13MmSTjyRNjgEqHFetjYxMCA0OVcZIW0BGJ3EtLXTE8mDXzkC4iSuxn@vger.kernel.org
X-Gm-Message-State: AOJu0YxI5vJqUgaKzquGOBsgix5iWw364w3LsVIZLqavKrzuvS+BckrC
	YuaAhSPawLKj9xOaD4jPxfoyk2ScPjgrnTzfD38LBh8jmGI5qItYy8VOvr1B8U3EiCIHWUTrlUX
	FKXzY+tp4yCGQY0m8sJnWWIoSvJjjkaRcqYeS8w6AHfeQHYnG38a/6nPGo58y3utj4sYc
X-Gm-Gg: AfdE7ck8h7Z9hFFOLZIpQzuEdwBFg5JJ8shhZx0eH01wrrQx8TBPZHbd61X5iTVWkCy
	5qhRdxH/Tyxk2cRFOpVOuw6XchBFruIATm/T3PMiVZoW9EHOGpJUlydhQy4dDV6Rx+licEtcua+
	UuQ06jYCYocPRJe/SmALBC2OfMv/ayILQqSbwjsQdyhro9EuWzGVj7OGSB97sdcJwkmL1KnVSoF
	8wkSZX6aQNTHUoOVoxQPOOyTxhOI+Ze+MI7igXrPjj2DrNzuFgmnZM854AWU5qlIIECnR56YmbX
	k+tKKiPWJ2fsBtIOKrj9c+Bm2soTmjWgXm6iJQPSkc357i2/4lEbHz+6etpwvmyNydD8jbF9ctY
	MgyGVI0SIptVgdQEjw76JvLuTeHOgSiUXHdKmpoKoY5uU8GOYq4n/qJqZ2HhikNPm/cmYcAgg5+
	wogo2qVyyse0Tz2IGq690y2ziT
X-Received: by 2002:a05:622a:58cd:b0:519:ef86:127d with SMTP id d75a77b69052e-51cbf07149dmr36273411cf.18.1783793048968;
        Sat, 11 Jul 2026 11:04:08 -0700 (PDT)
X-Received: by 2002:a05:622a:58cd:b0:519:ef86:127d with SMTP id d75a77b69052e-51cbf07149dmr36273101cf.18.1783793048432;
        Sat, 11 Jul 2026 11:04:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9ddfbsm1478518e87.54.2026.07.11.11.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 11:04:07 -0700 (PDT)
Date: Sat, 11 Jul 2026 21:04:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
Message-ID: <vbsdddrjoq73h2tal77rdm573ydomwsagr7fujjh7znw3dnbka@olj35zj5pyzn>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
 <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
 <6123a923-21dd-4f69-9ac5-02165963027c@oss.qualcomm.com>
 <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
 <4g6y4q2udludhwmoqc34afwj5svra4a4j5bmpqza7h3av2oov7@6k5r7a4meruk>
 <c11f9ddd-8533-426c-8a88-0ed461f6a30e@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c11f9ddd-8533-426c-8a88-0ed461f6a30e@proton.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE4MyBTYWx0ZWRfXz7jzhmZTJjwh
 b8QOqwCaH32Men62klp6BdK23zL0VTcVErf+Gx69gNHIVbk3YWQLDUHcD/D5iUwPb6ujX6ukS0T
 jNskBlFmPDVYbasraZymbKm60EMbdp8tQbPbraU8rO7fuFYhdYZdgXOrb+4regrS999h6VO7dH+
 4/ffU0D/Ml1xgrAN+kByVY+OAkLPOjDsd2BEjHBroQrl8H4lknlMwuQ9YU1qj2Wd7G9vmi7mFYm
 FJ5pTq5AYih2jETpRmgzYK8MAl0xTT1WT+9aPIrjuaaP0ezUvRYQ9uTqpM0GTemHYjZKqq3KcgA
 BXj9BzOnTauY0tprL9YIoD7U/sfNxd95wEwOtSaJUZ0YPgjFcLwMAAWsmERYBMNPxZLVdKybdc5
 fKt5LNOdXXTKaxulxv0BT1heQdXXlQVRWOxL9qo5qVjdYMy0hyJA3GyCH0ZNxoM3ee0WMuTKyuR
 pTiWRV6HKjeFTHKjgSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE4MyBTYWx0ZWRfXwBNbUVKHSJdd
 2R9zfvnAION6q6/yZ7i8H8HWDYSKKxP9Wp++PoQfQAlaEFZAKUS9X3vU64StTnLMxOOynMduj42
 dgUAeDC/ZVn086JZY7xGUyJkAvGFdCU=
X-Proofpoint-GUID: SK1Rvhwd3UReXQ72vA_7mougSUHlEvQt
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a52859a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=A3yFiG93vv4HRecOgxcA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: SK1Rvhwd3UReXQ72vA_7mougSUHlEvQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110183
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118490-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,olj35zj5pyzn:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 972707426E0

On Tue, Jul 07, 2026 at 03:19:22AM +0000, Esteban Urrutia wrote:
> On 7/6/26 2:24 PM, Dmitry Baryshkov wrote:
> > Please verify that you can actually access those areas (boot with
> > memtest=1)
> 
> Thanks for the suggestion!
> 
> I actually did boot an SM8475 based device I'm mainlining (motorola-bronco)
> with this parameter.
> Deleted regions in DT are as follows:
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

