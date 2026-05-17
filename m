Return-Path: <linux-arm-msm+bounces-108050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOWkAmj4CWrivgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:18:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A94C56274F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C3AF73001A4E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8E43BA236;
	Sun, 17 May 2026 17:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iL/7I7pF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+1/4OZr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246FA3C37A5
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779038305; cv=none; b=FIDv9I/WCL6H04eZCgzrLQ3qy32uXBdUM3jc4HNGdGhGXEPxuH2QSJPzgP89sfx0SFhS0xVC6dDXiHt4SpiW20sWQjK4tCpFXQtotRlffIAVbiHEjx0+SAxOHnJtey4mhpor9EAFUsMXPfARUzDVNNCyiaOrdAKXcaGaM08qvo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779038305; c=relaxed/simple;
	bh=ZxjqzD/D/ZuXbB2Ju+afiJJqSzCUDtmshRbNdCUaxEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cohFS76iQaRlu6YND/u8Y7+Gz9EICH7jo3Rw68gSZVFMCIFwrlEjPY4EGgeCacE5BUeypQvH66np2UQHJKd/NelLP1adwv6ajw/EkyEBI4Ue9gaTA84ElCKuxbpybg4PMVq6PNleCs3gxWtWWgFVtUyIdBlwe53og6XrB/gP4xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iL/7I7pF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g+1/4OZr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HANRqH1888240
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xgxp/eiQkFOSoDn0UOnSceK8
	3P+WFNS9eG0OJ/DVFw8=; b=iL/7I7pFnqNDPy9ybyiyYl0/3MM4vvKjYj+uBgP2
	f9rI4BsPhGGrD56McKm/MgvTLXmJsN/UvhBgZ9beTipTo/V8mHZaL154EGQatNpO
	X8LHSeA2pZe8yjtrowDwjUsvn1NuVZj2rRstgb6BFEX+j4nmVSUHucSMYAsvXv/L
	d7/6sg6BJroABTKtHR6ocEmuGm7VK5O5Molkl/tW44wNGCFSEIVmLj1+oAEd1bHU
	0QDgFubkin04Ud9u9cOmSTi2KhD9Yl1sInViQCiTUxH7YgeklXnj8+skON+STSVh
	TX3nQToIC0pMoRYKVH/jxq9YnUClFVD1jZG7LO4iefTRyg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gwmb972-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:18:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d6bf346adso38886991cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779038302; x=1779643102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xgxp/eiQkFOSoDn0UOnSceK83P+WFNS9eG0OJ/DVFw8=;
        b=g+1/4OZraSez2xb2JpxHsSTYNlznm/AFYiw/HE3WoSPqTjWJFxLiyXvcEvVrOw7X6R
         wj7WULwR/0T29yME70nhNLk7z1VvQ3UWW1DsW2KSahvwur7URH94XAt5FQJiFEVmWHg+
         DMFdbsppUaICr12DVlfocO1mDHHmbMoYVXHU/FdeaSrlJ8OMUxG9c0k4Ud+SGb4QMXUc
         tbxCHVnValXmjhwE2gYZn2TQx0Ni5FMlC5wSsC9F4+J6z6Q7Mgz1NK42pCktbfLHp9sT
         5coQoTSRVgFiTGMOMOZvxdX+vHYZ1kPSJ/xn2FVD7vKl7FURuWUR8nNWVP/5pfj1I/mU
         7e6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779038302; x=1779643102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xgxp/eiQkFOSoDn0UOnSceK83P+WFNS9eG0OJ/DVFw8=;
        b=kMWmte9n5+1O+GNnfFr18UWEagz+i0wyf8SuFbjLakCRyQMerl/bz6jrVkkm8BkB1s
         Uu5OJ20EC1UpOei3fPBjH0Jwt1ox8fDsPa4TFBm+HlJLTNDlltGZ+ZliVgxVt89TssK0
         c71oWWv3q3uNlrz8zaFWor6ITaffFsbMKPDbn9v9D/jR/YbFdxCcfIv0h0PtVYdjvSab
         cw0I0ah7O+WeSyMBnq+3yvx1QIe4wNaxPar3F/LzffDn4zJveiZQ6Ytv57zBOiWZm3yB
         pDUmVYxqZuRQZ1RUJkzREqKOCe9+Fwfc+Ql8qnRtFysyVZ1OAk5TXEu9+aRMor2j6xBB
         pT8w==
X-Forwarded-Encrypted: i=1; AFNElJ9HHM6H0W20x3O7SyFAS86HFpgROb7ubhkU4+OHzqIeEKsOXrZeLORGc1rS0h0+qJYjeGHJ2HYwmU2mp2Z5@vger.kernel.org
X-Gm-Message-State: AOJu0YxHzf7Nd485vujvkfcd+NV8Gfds3u5P/AhffaYGifqHgALYhc0g
	JoEjOLxvq/g1POEZh0382X+4lB/alARC/529Mr01UqaU3T1tntIfNB905z3UMsqS9ewj6IjB3Me
	WniXpz1LRV2lFDl99IseUT705TAYKxpeUjhTgaaCbRhSKa155kS0Qb3QdEB+Vzwvl+ski
X-Gm-Gg: Acq92OGOyA6ELLXrPs0FBzyHNSxQBR7v6bnXqbv/6TH21s0Yp27BudHp0RvhdBe+1hW
	AvrinB06TdCPLhGvRxQrJc7JRUfZTOM/V34DbxsCfyQCpQiqfeeZ5uhX/bOlnJIlfHGwRIilOM+
	i16/FWR03WljuQ20C2l6DTsvjNTJ6zmkSSlmA8FMhIiliOoLw8ksRo25z+pBWw9oRc9Wk03e/Id
	DtH2LGBkBzV/ARh9W4/Tjdd9t4RP7jFFo22pZVjO7NhypwmNZyzRUVC8HJubXP6YN/3LFsBdKUe
	1Lv4WNSxo+7YxkVjRZxJ0/gOj6d4iMjGrH3cY7m1GPxetP2LC5PDiW5hKAeTlkvyJj/VsvYoFPv
	lKzu00My60MhlNJMXKJ9ShIS9e/50O2/VfKuZU4E7zrdPp3lQp6lfTC7rb9pxnq8f68WJtENacY
	lz5cZMyGfNDtMxev1OvirLtcYO57Vzfq2XSk0=
X-Received: by 2002:ac8:7d0e:0:b0:50f:c2f8:406f with SMTP id d75a77b69052e-5165a0758fdmr173915951cf.25.1779038302263;
        Sun, 17 May 2026 10:18:22 -0700 (PDT)
X-Received: by 2002:ac8:7d0e:0:b0:50f:c2f8:406f with SMTP id d75a77b69052e-5165a0758fdmr173915501cf.25.1779038301708;
        Sun, 17 May 2026 10:18:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958874ff29sm6416181fa.22.2026.05.17.10.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:18:19 -0700 (PDT)
Date: Sun, 17 May 2026 20:18:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: xhDPDL4bVvgsTcmOp-5lCH0xiCYY3lDQ
X-Proofpoint-GUID: xhDPDL4bVvgsTcmOp-5lCH0xiCYY3lDQ
X-Authority-Analysis: v=2.4 cv=W/AIkxWk c=1 sm=1 tr=0 ts=6a09f85e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fvtwTOuhFqfjIg9toagA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4NiBTYWx0ZWRfX8VkQLtgf0AwS
 MBH+6AOSVAy6aU/scbhGZigfId91DGUZx7LsVfDKw8BfWSnj/tURy7urGYajqW+tBtS3NCmh8Sp
 lL/lMER9suzTfu8WcOKA9L2qjmvkg9SCuuv08AC/gwk5J8muOzHyoeaY8YPdn0aFLjDeYFcy9z0
 n3K54m0EpCooKg5HgPQ++YW2RD5Re6iaOZeU+/4G+fsyS2pZSRnc22+AQE+0WlDtqFuoaCFPfIL
 Q7Ew1zmbfzKivjuBsw2H45d96fUM84R0gp9pRSHJRGS0Sg4qa3kdndBliBM+V8aQywNHbDHu+Uh
 TvB4AFAr7KfkHVVWVqpZLXs9ba88H2lt4e9Uvfh5t5ueV1ImA4FUjo3/mTozl0FcZnozL9mXQmK
 jkckm+oWmVy7vIvqB/sCs9iOQ3/S7Zasy1CYSuKywi0cjCXJWhuu1jVFZM9FHXbn+5JteveUoOW
 4D/Qj0zLEvpmJBsCdxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170186
X-Rspamd-Queue-Id: 0A94C56274F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108050-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.linux.dev,kernel.org,lists.infradead.org,linaro.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
> On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> > On 13/05/2026 17:29, Rakesh Kota wrote:
> > > On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > > > On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > > - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > > > > - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > > > > --
> > > > > 
> > > > > commit 457abf6e7ac410430c866842e08e602ec3daaa51
> > > > > Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > > > 
> > > > > arm64: dts: qcom: Add Shikra CQM SoM platform
> > > > > 
> > > > > Add device tree include for the CQM variant of the Shikra System-on-Module.
> > > > > This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
> > > > > the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
> > > > > 
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > > new file mode 100644
> > > > > > index 0000000000000..401e71720519d
> > > > > > --- /dev/null
> > > > > > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > [ ... ]
> > > > > > +&rpm_requests {
> > > > > > +	regulators {
> > > > > > +		compatible = "qcom,rpm-pm2250-regulators";
> > > > > 
> > > > > Since the commit message indicates this is a PM4125 PMIC, should the
> > > > > compatible string include a specific identifier for the actual hardware?
> > > > > 
> > > > > Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
> > > > > the fallback allows the kernel to apply specific quirks if PM4125 errata
> > > > > are discovered later.
> > > > 
> > > > This can be ignored. The compat is a leftover from the historically
> > > > incorrect naming.
> > > > 
> > > > > 
> > > > > > +
> > > > > > +		pm4125_s2: s2 {
> > > > > > +			regulator-min-microvolt = <1000000>;
> > > > > > +			regulator-max-microvolt = <1200000>;
> > > > > > +		};
> > > > > 
> > > > > Do these regulators need to explicitly define their input supply dependencies
> > > > > such as vdd_s2-supply?
> > > > > 
> > > > > Without these properties, the regulator framework might be unaware that the
> > > > > PMIC regulators draw power from upstream supplies.
> > > > > 
> > > > > If the kernel dynamically manages the upstream supply and its reference count
> > > > > drops to zero, could it be disabled, causing an unexpected power loss for
> > > > > downstream components?
> > > > 
> > > > And this is a correct comment. Please provide missing supplies.
> > > > 
> > > As per the Qualcomm system design, the parent-child supply relationship
> > > is managed by the RPM firmware, not the Linux regulator framework. The
> > > RPM ensures the parent supply is never disabled until all subsystem
> > > votes are cleared.
> > 
> > How is this different from other, previous platforms?
> 
> This is not different. In the previous platforms too this is taken care from the
> RPM/RPMH firmware side, the only case where we may need explicit vote to parent
> is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
> may have a RPM/RPMH regulator as a parent.
> 
> Even on those previous targets the parent rail of all RPM/RPMH regulators are
> internally voted by RPM/RPMH FW at proper voltage with required headroom
> calculated based on the active child rails. This was done for all the
> subsystems (including APPS) regulators.
> 
> So no explicit handling from the APPS is required for parent supply.

You are explaining the driver behaviour. But the question is about the
hardware description. If there is no difference, please add necessary
supplies back.

-- 
With best wishes
Dmitry

