Return-Path: <linux-arm-msm+bounces-111587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G/fBC6vJJWqELwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 21:42:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4E8651689
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 21:42:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mf3C3vIU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="B2px/nMD";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111587-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111587-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2131A3007C85
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 19:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF9B2F1FEA;
	Sun,  7 Jun 2026 19:42:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4015E28B4E2
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 19:42:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780861352; cv=none; b=R42TO7GEBGh3Gg5Lmm5HATuXSExWe1OvrDL9zBuY0sNXzwREbkVQ0hxlQnjnPfksHHUWn7vgZEsrlZ3qx2X5TLQoV2OA7s+dQTHLFtvviDjj8boCjPaS8kzQZe6lqxrq59ClYKSnWcMKPAGijREGRa+SQhneKj0CTOyZEN1fyFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780861352; c=relaxed/simple;
	bh=ES2DCtIMXp6EM4W7ecLww5anWKNLLTynQTTGt1Rfa9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCFctMFitR3IvGTIjNAyyVDstZ6x27Z4z4QLT9ZJdLdYDcs36m07UFbN/8j+KAJRyTfYjZQAAmYcJHCBqHe9RP9FzPiQL2vHb3oD3D45XAm5naD/jufndo2+rwypmLCrs5jP/TGMVSWOXl/+0rDNG6RT6dmS0G5W1Vq6hv4jstI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mf3C3vIU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B2px/nMD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EkDPE437363
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 19:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BF24qm58BnNqIGE4+EPnvFG4u/xZPUBNCeYGCTTa2J8=; b=mf3C3vIUguAmGMpP
	4l6HpmuYW4DqlHbh5JLhaN4MPXoMcw9V+v7N4KHx6R3ebicANrEWT237+LiFX791
	ORKjBZ0CZ+16G7PUsdPXp8n8LpBdgmKDgoFqQnPjlRLihQV/MQ3Tt+W3I0s4CnUm
	LsSjq60VOCbVQ1MqdLZYaYcUL2Tsctwxude1vu+UFaug8br4fEaVQWb2XgmgqzJt
	emI8eeigib+Lkqr0yOdk9ei8jAK+iR6P7Ue3D9i+6EC5Sa0lGfUW4Tw0N85oNdeE
	iN/8SjgD7339mcrGj+Grze3YmG4TjVvtw4itAIfzyXVtvBWIrRRw//1n09FXpprE
	he914A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8vbyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 19:42:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfe512e871so1724692137.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 12:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780861349; x=1781466149; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BF24qm58BnNqIGE4+EPnvFG4u/xZPUBNCeYGCTTa2J8=;
        b=B2px/nMDvg5wGu6tImQB3UEvN8mVHSOeWx6bm3uQc1duiPHnbGhxtDOw1v8o3nvpBB
         4zzbG17IaF188xL+os1hpYygwMqKme+UCIm7vGpT55mTTcJl9Hfy/r3oOFqKSFvydrOB
         rMirjqNEeEYCfz3c4sSV3M5p20XWMpHRmVVYl3S2v5ZMWYvv7lGdxV1D6iIoDfJ0aqDI
         g9W2Y0t4Vpv3h7200nqt9yihpeKUwY4YP/x+mpcqwTfe1idCjxfF8p4BOGmbb+zUIIdK
         85FwcxEBc0D0wkfpMsUvI6V2hgU4G2cqNjVdV65DtarB9iSV63z8XLOATf6Bek3uSV7t
         lIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780861349; x=1781466149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BF24qm58BnNqIGE4+EPnvFG4u/xZPUBNCeYGCTTa2J8=;
        b=sBqt9ixmAJ2NI/B3LrDHrIlbXq4C6PFQA38s36pkdL/II5ql6qDnPUFeDw/QHtNppK
         vLqIk2FVKy6gscxH3i7l3nT+17ywDIshhUhLN3CEbjJ5KmBQRZneTx4wKPJfmkbjrOT4
         CERi4FLFBsPYQ4o+DtgfjTA35Tnf2SNo9PkTo/7qeAqynD2CE2JGuVQfYtSasRuWagXP
         eKAAJsOGOnerMW+62EtwAXOV72KHQglqFhKTwFTl4N7kSJ14sHJ/19pxdBX9qa1BB6Ry
         8QhjlV65QvE0wdx/Gawj8Xs6kP6J+VJjho3GOJ4iZZ7AfhNlDZRZa5WZfUrBphyh9axJ
         oGxg==
X-Forwarded-Encrypted: i=1; AFNElJ9Rvkvg3SF9SMn0U0r4vwLbDdeSzpVBiztdyeb/diLxaJ8ZfGUoOXgVOlwdAZaM6VBYZ8TOcTtjjw4TlgMl@vger.kernel.org
X-Gm-Message-State: AOJu0YwviVnXnekiJAIFpPotb64274m5lP53rhwjW/RN32QGjz0XmGCe
	yak8UwGcZAI0WBPENgm7fl4XLTJUZVXV1IxPAwjJX3mGYi21zRYS0LVzV0M0PTzIpv3sDRQ7i2O
	MihTdV2D/15lnDv0YuzKIDMJ5JoKXdtNanNfAhMJee6qiRFq7hTZeiB8s99+TWQWGgDy1Mqa/BD
	9M
X-Gm-Gg: Acq92OHvVOOQhtrDlkmxOEK7fp7A5tc15ELh5qBQgfoWfquIikyZxwMvY/RaN90vHWG
	p51BHbIET3BmFJRw+B3BwLBluPCOe9ABVTntHxFmf/j/rTI1WK1sxRfdDSlvJdUAcFl4F2DU3Zv
	pgEdPu2SkVi8oYRdco8vi/A9+ndsHoCAcRaAlTCeJOegIAUX112xM86eYwkh28TQuqwRI0+UlKC
	frqsZRaIOyayGXdSDyzjxjy0UuV6sE2TMgmGJEMiMzHd7lDrrWwRda6lKqrUYqNOTULVdUqKQut
	EqgtW6k+zFiW3xzHbSbpWWLsM+kkNqG+VYKmMg/t2PAsm+5O/03833041aM8yfd2M1tjiSM84Pa
	HRejCY16xbEiAIHxOr39gQLW13H6EQlL7zfZ49mO5offKNGsc171crrz1zdp496N1S2XPm99e3T
	Nm9JnhAVAcCDPcSawgLplCXpqkg+D9umWH/VAPix8bYGknhg==
X-Received: by 2002:a05:6102:554c:b0:6a2:b2a1:f16a with SMTP id ada2fe7eead31-6feef09ad62mr5487800137.2.1780861349632;
        Sun, 07 Jun 2026 12:42:29 -0700 (PDT)
X-Received: by 2002:a05:6102:554c:b0:6a2:b2a1:f16a with SMTP id ada2fe7eead31-6feef09ad62mr5487780137.2.1780861349154;
        Sun, 07 Jun 2026 12:42:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac091ccbsm41172751fa.14.2026.06.07.12.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 12:42:26 -0700 (PDT)
Date: Sun, 7 Jun 2026 22:42:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: qcom-refgen: add support for the IPQ9650
 SoC
Message-ID: <ll22r7amswo2mxz4edvo6s5lq6cotdsbepy3zy42pndjinz7yj@zpkh5hp33g47>
References: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
 <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
 <ci2ur4vurrljhvkza7nqfq6hsjpj7aurb3r3lvjkebfwkcae35@kvnjmosamfzs>
 <6d2f2756-0d83-4a84-a39e-d830bd0d9164@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d2f2756-0d83-4a84-a39e-d830bd0d9164@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: A6j1p1cfCBIfrSUbNcvdp-4Flr4L_0o_
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a25c9a6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=1jXWVeKMHtOyghREYcwA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE5NyBTYWx0ZWRfX3plmYX94jKTp
 +qpJE8wJ1IOTs7RuFterLgrq2bk9UIXfq293HFTzUEmpMdrwLIhiQZQcrdIuW9m6WZj4Bu2JgsI
 CCN/i+ByKpZDIhdOU1B6SjNGkyvkaVpFU4Y+kZWiycXvjqHmodftzZAucY1CMtDgQ07jjWY74PA
 Zp1jCrl2vzHWMP7U/Al01olQIpUhLwsKNRgkA/590SpblF1lBiBDIiP1Ih2W92AV1o/DVdKoTfc
 3Ei837noWuEEubdLUG51i790TvMCFhzMGku8FUnUfF1/Q/TWsuHaGN91Us6YOZly77C9lqKVXO5
 xQtnqV4f5a9L2Fnr7aJFC4utqBTApmZ2Inxm1N5y7WwO34IYvl4sDhQXcRc2QWP7b858X/cANzp
 /oVdho8f8GC9mGW2CQKWJoNa8fbDPPeICvbYVkWBPTUEmaiWdOypbDTlsS76UpXT6MXgwafGQTz
 LKf2ym8moevPs07QNOg==
X-Proofpoint-GUID: A6j1p1cfCBIfrSUbNcvdp-4Flr4L_0o_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070197
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111587-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C4E8651689

On Thu, Jun 04, 2026 at 05:07:35PM +0530, Kathiravan Thirumoorthy wrote:
> 
> On 6/3/2026 6:47 PM, Dmitry Baryshkov wrote:
> > On Tue, Jun 02, 2026 at 02:52:00PM +0530, Kathiravan Thirumoorthy wrote:
> > > IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
> > > PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block is
> > > enabled on power up but that's not the case for IPQ9650 and we have to
> > > enable those clocks explicitly to bring up the PHYs properly.
> > > 
> > > As per the design team, REFGEN block provides the reference current.
> > > Hence marked the regulator type as REGULATOR_CURRENT.
> > > 
> > > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > > ---
> > >   drivers/regulator/qcom-refgen-regulator.c | 94 +++++++++++++++++++++++++++++--
> > >   1 file changed, 90 insertions(+), 4 deletions(-)
> > > 
> > > @@ -62,6 +75,49 @@ static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
> > >   	return 1;
> > >   }
> > > +static int qcom_ipq9650_refgen_enable(struct regulator_dev *rdev)
> > > +{
> > > +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
> > > +	int ret;
> > > +
> > > +	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	drvdata->enable_count++;
> > I think, a regulator enable() is called only once. Is there a point in
> > having enable_count as int?
> 
> Ack. Let me change it to boolean type.
> 
> > 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int qcom_ipq9650_refgen_disable(struct regulator_dev *rdev)
> > > +{
> > > +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
> > > +
> > > +	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
> > > +	drvdata->enable_count--;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int qcom_ipq9650_refgen_is_enabled(struct regulator_dev *rdev)
> > > +{
> > > +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
> > > +
> > > +	return drvdata->enable_count > 0;
> > > +}
> > Linux knows if it had enabled the regulator. I think the usual case for
> > the is_enabled is to be able to read the hardware state. What is the
> > point of having this callback?
> 
> Without the is_enabled(), regulator core assumes that regulator is enabled
> and always-on and is_enabled() is not called. Hence, it is needed in this
> case.

Ack

> 
> 3458 static int _regulator_is_enabled(struct regulator_dev *rdev)
> 3459 {
> 3460         /* A GPIO control always takes precedence */
> 3461         if (rdev->ena_pin)
> 3462                 return rdev->ena_gpio_state;
> 3463
> 3464         /* If we don't know then assume that the regulator is always on
> */
> 3465         if (!rdev->desc->ops->is_enabled)
> 3466                 return 1;
> 3467
> 3468         return rdev->desc->ops->is_enabled(rdev);
> 3469 }
> 
> > 
> > > +
> > > +static const struct regulator_desc ipq9650_refgen_desc = {
> > > +	.enable_time = 5,
> > > +	.name = "refgen",
> > > +	.owner = THIS_MODULE,
> > > +	.type = REGULATOR_CURRENT,
> > > +	.ops = &(const struct regulator_ops) {
> > > +		.enable		= qcom_ipq9650_refgen_enable,
> > > +		.disable	= qcom_ipq9650_refgen_disable,
> > > +		.is_enabled	= qcom_ipq9650_refgen_is_enabled,
> > > +	},
> > > +};
> > > +
> > >   static const struct regulator_desc sdm845_refgen_desc = {
> > >   	.enable_time = 5,
> > >   	.name = "refgen",

-- 
With best wishes
Dmitry

