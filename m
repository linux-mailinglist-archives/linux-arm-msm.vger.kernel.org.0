Return-Path: <linux-arm-msm+bounces-110052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJkuKrnTF2qOSAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 07:33:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2535ECDC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 07:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4764D30056F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 05:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCEEF31F996;
	Thu, 28 May 2026 05:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMKNz5kP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EH3Ramm4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD4CEEA8
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 05:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779946272; cv=none; b=nM0Ocb4Eudr+pB4FZLKGhiAOhcV/rc3UgE4GTiauSNmsZ8UbK8GJu1B8kxLHwxcJgqrDX5NLX3Kf5zSqvTI6FgRkgNSDApItALe5Vdyp4CMF/95WvoWKKDHrRCG2e4mySNIIn8/6dNB8HynIDW8eHoIeMIPIzFaYloENlMod4fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779946272; c=relaxed/simple;
	bh=PqyQv5lR4CSDal3C1K6XS5brllo/mkSEyVrmaA2Skw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnBwD+YUoQsAE5KikZkorSoRfemMcdX1cUzjxdR9p5x+eVmNjziqpkUDTF08gbo0A3zZAWDgHxeav8t3lBCSMQaiN27WSPXA8jD0X9zecO3vfAtqllpTfORu8hMUOjnJL+1S51a61b8eam73ZOBlUBxSN9WLuER950Z7Con3kyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMKNz5kP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EH3Ramm4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKlkVm2753823
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 05:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bheMS1C3LAWE/VCtZ8G7QH4E
	3JfFT6z3QwuAGkiTibI=; b=CMKNz5kPSHCyOAQChseFIsRvkUlRhLTWbyB4gjyY
	Fd1oQz/kojOhEa/3/cLsGU6eGeOzd7nXsotl5FerwwFscC2WTOeEcnEalFH1SEFo
	Nu57TKntYQ96H9/KR3Rx4RZTBtcMXpEtJ9BPrWJcYmZBbXcvYLMGibUdJD27OLsx
	/bTzPBtWMem+WalwOI0M+KT/Q5JOcjkK1+M617SNAfrl6bPvZ23sss7Pr29zKZ7Z
	Fy7Lo3XPJ+BwPewD/1hFMyVeEocw3/GeAr4Y6MfBXNtfiwyIOkruNHWt1yZeRN2g
	NoAQYF6C3SYVI6MIm3d18U/8uQyR0YZyPNXt0Hhl0Ila3w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yc9ega-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 05:31:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b5f089a5c3so337174436d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 22:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779946269; x=1780551069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bheMS1C3LAWE/VCtZ8G7QH4E3JfFT6z3QwuAGkiTibI=;
        b=EH3Ramm4pqDy3kFtzHExrOK6gN7HoisG9vrPjobJVu6vg+FJ8Fokua4hA2iddGl8T/
         47U9BWlKMi6zUg5TiMb6FUhtMdjAihweH8uglnSVFAnSfdU+rj22P9FFa9x0FWBdzgi0
         PnKPo0kWMk0GqBcoJWzkP00TRBmoQ0AGqJMncPq99Szglc+bgwt28p0r+7w+3oZM2Gtv
         A2vnT5U/fqk3riTq5UJ80XCF0XKBmhw8a4OF4s2y8xstFmZj9UR+WCXl3QanFu+OmdKP
         U2tbAGkJex+tT+daTPy1/Bu2bGTl7jXWzMmqMo+8EFkmhBLUhYT2ep/fyls3ueweYGvy
         O/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779946269; x=1780551069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bheMS1C3LAWE/VCtZ8G7QH4E3JfFT6z3QwuAGkiTibI=;
        b=cHlemfG+aontEmodMEJFspsF45BmnNeA5CNO4DEfJZsawC9ZryVdeqwur/WEhOSz6D
         6ZwKYYZxBnXN+WuNqFqCak3actx9kfJR5Y+6hn433u2VcALwgEnq0gAYmmk+vJkp4yH4
         SmjhnfuhMfn6WKEqLq49AFY3/Zk/yi9Mua2pxJslWpe3altdqdH5XTs6FS/plLJRhSQ3
         x8wh2GGmZxqxd6MSs3umTYf1UWyaprwo9gtEBaI5XwC3HLG4QpadBlm522V/O7G4rK4K
         LF8IvmY4rEfEX3eEVYEZQtXPypJlcWnSrseoUUtA6gJSOemhm3UF4EYYAqcTfMubHNxB
         plow==
X-Forwarded-Encrypted: i=1; AFNElJ/Z+WVFUzWgYjR3vztblXeMyieB2YHCzcgsxUKC+MfYnpj0EUw7fHPcB3O6ZaNgcvDhwehqgdAf8b1RDkLv@vger.kernel.org
X-Gm-Message-State: AOJu0YwKXy8INON785B//2eOKHlIb2gtZzNKDSRIRxGTsDluy55kvGTH
	4UKiOAdgIQ4GB4mx7PY8GwQrM6fb3cn32PC+9Ap1LVizR9VhjOSLOh2ihLj6Y758zvRrzWTB0/v
	f8YDGCTW+j8kZFGqVmNZqX4hvaP25n7RvLMIPmH55HqMnoq5oQCBhWJTl0QHhRo8W6ewz
X-Gm-Gg: Acq92OFn613QTyhymgQPgi3bUu23fWlLM3COeLlIotrQtWBP5SFpfO+Cg15tqX/zQXq
	jF/jTUeH86uMlk2R9GzsZyNGK2G+H6yp3wHVt3/7UcWp1SWFyj4JseqhOpwqbRgExKNBOzKNueJ
	z2hJJCeRO9taqzaAdC3iFtCtPsZudp8JXch+wFwBq4Ziub7LqyH6Gzt0sYHh1OLqKtOKeL6TIYp
	2MI9I5xGvmm0LqrEHDFFhLLy+zwbklF5IPhvssX72OaX3in1pNPZ5C3WbuJ3gTse3rxirbXxyh5
	jMJPdEulNIREFaf7XfOY1HiYU/DjtiJtW60aOBorKbLuxdiZNmaVHJ6URgVJanAeZBAV0P1KUsw
	j7j3UoTTHyQYHGPX1G29ouLDBa/kJgClIWyYbRwDD9pd3oPOvkHl76H5XUjt20c+ZbdArgTTJlH
	DgtyBT/p4pTiiggmc2E24HxMs+hKuirEoN3m87ITdaqd0GLg==
X-Received: by 2002:a05:620a:4111:b0:8f8:cdd0:df82 with SMTP id af79cd13be357-914b4a3daddmr3603194085a.58.1779946269550;
        Wed, 27 May 2026 22:31:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4111:b0:8f8:cdd0:df82 with SMTP id af79cd13be357-914b4a3daddmr3603191885a.58.1779946269115;
        Wed, 27 May 2026 22:31:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4632236asm1671483e87.47.2026.05.27.22.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 22:31:07 -0700 (PDT)
Date: Thu, 28 May 2026 08:31:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Yepuri Siddu <ysiddu@qti.qualcomm.com>, hbandi@qti.qualcomm.com,
        rahul.samana@oss.qualcomm.com
Subject: Re: [PATCH 14/16] arm64: dts: qcom: shikra: Enable BT support on EVK
 boards
Message-ID: <6lkpmjtpozsfrk6ljnzwek7q3kgj7t6cjzre7k5vijx4ta6apu@bdotfbblxpu3>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-14-f51a9838dbaa@oss.qualcomm.com>
 <rbu5oub4uc4rubdlfth7undrirlyfwbnst5clgyvm63fde3tcw@fulet3k3a4sf>
 <30a33da1-6424-47f3-9e7e-a09ca61a1234@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30a33da1-6424-47f3-9e7e-a09ca61a1234@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VOntWdPX c=1 sm=1 tr=0 ts=6a17d31e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=o6hecVIOLF8SStibk4YA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: c9QHraCoWOsL4pL1w24csbZrHBl9nMEn
X-Proofpoint-ORIG-GUID: c9QHraCoWOsL4pL1w24csbZrHBl9nMEn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA1MSBTYWx0ZWRfX6eCBppQBNZQC
 5W2rIg/3I0RAPc6/ko7tZUmVCyga5dakXiXTvaHOvdft3q2SbyLCf+1q1gv+bzrAfZgN2n3/aQD
 KS4j4k/9yuafdg8fr9OmEUkRpTrVdniy/gDLLbuNHDfVHVsFWoBKsc0ZQohi4xQzy2BOwC/jbHY
 iGhJwThPmPMKc3wwWIBgtYlCN5Z23D+tv/TCunrJiFczAJpwOmMckAqrCjhGULjFI6qQHlw/kPe
 LvB1K39X6+AgZob7Xfa54kz+mg5yEFhauonIjZJejC0cxH+Nxy5H0p0WO+tRsfM+CFNaq986lbP
 6/2DA9RE4xqZdJpmUjG1F6yN+MSaIYmivhomqsGmjLCN7/zQaS1sJzpxQqpz7Gdzqx/vY2R13Wc
 39zTByFS68BzGUYsrOL0YW5NDNpGvR8trTgmOOpgZX8EVZ0roG5Pm6jLNMLJIk3KA1/wrSOTKPu
 KaVi9Y70Rfe/05pFDmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280051
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
	TAGGED_FROM(0.00)[bounces-110052-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
X-Rspamd-Queue-Id: 0D2535ECDC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 06:53:30PM +0530, Yepuri Siddu wrote:
> 
> 
> On 5/25/2026 3:01 PM, Dmitry Baryshkov wrote:
> > On Mon, May 25, 2026 at 01:19:18AM +0530, Komal Bajaj wrote:
> > > From: Yepuri Siddu <ysiddu@qti.qualcomm.com>
> > > 
> > > Enable uart8 and add WCN3988 Bluetooth node with board-specific regulator
> > > supplies across CQM, CQS and IQS Shikra EVK boards.
> > > 
> > > Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> > > Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 12 ++++++++++++
> > >   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 12 ++++++++++++
> > >   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 20 ++++++++++++++++++++
> > >   arch/arm64/boot/dts/qcom/shikra.dtsi        |  7 +++++++
> > >   4 files changed, 51 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> > > index b112b21b1d79..259032bd20af 100644
> > > --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> > > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> > > @@ -16,6 +16,7 @@ / {
> > >   	aliases {
> > >   		mmc0 = &sdhc_1;
> > >   		serial0 = &uart0;
> > > +		serial1 = &uart8;
> > >   	};
> > >   	chosen {
> > > @@ -57,3 +58,14 @@ &sdhc_1 {
> > >   	status = "okay";
> > >   };
> > > +
> > > +&uart8 {
> > > +	status = "okay";
> > > +
> > > +	bluetooth {
> > > +		vddio-supply = <&pm4125_l7>;
> > > +		vddxo-supply = <&pm4125_l13>;
> > > +		vddrf-supply = <&pm4125_l10>;
> > > +		vddch0-supply = <&pm4125_l22>;
> > 
> > Use the modern (PMU) bindings. Also please add WiFi.
> The modern PMU support for the WCN39xx family is currently not available in
> hci qca driver, that is why we have defined the regulators directly within
> the Bluetooth node.

Of course it is, see commit 9f168e4de5fd ("Bluetooth: qca: enable pwrseq
support for WCN39xx devices").


-- 
With best wishes
Dmitry

