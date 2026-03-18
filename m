Return-Path: <linux-arm-msm+bounces-98516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBZDMF26umlQbQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:44:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC252BD704
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9B64307A3DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516363DCD9E;
	Wed, 18 Mar 2026 14:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pOv4QMBB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EysLshdp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE8B3DC4B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844831; cv=none; b=qNNP1j+QPvBKB+OONWIen60lOEWdJnbpC99ruBMJ1sXGBVTefOZLuLhSmhs1pIaad+lRl9P3lvNae1UKCis2GFzmoO4jv18aHKT+Euw5M26Uv5KmHAZvnllH5TIjIlNpoVuIjMF0T+O463kHwPMT0HjyHVK9lGYfafZxAnBryhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844831; c=relaxed/simple;
	bh=xG1i/RpFtWOlLZLZ8mzK08pn8j8Jl58PXnEW/Ii+7Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjaQP1gIUYOqUP2S+1wZiFMODXF/ab4jcqHrpN9zvboBVobrR5gZyQpmrzyXXyDcUMq7C9nd8PahFcfRUmILkMAF8vJb9Kpa8wFbKbZ3mENLCCr6F5fLS46QvATK6Y9ES28fNB3aelLaAj+LMRFOrH2r6KXRhYQEUYARIFNJy+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pOv4QMBB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EysLshdp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IBBBbM320135
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 14:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s2/iXDaWlcUGc9VTFZFfuG04XHynD0RSbFWnWzKw//A=; b=pOv4QMBBhN4XX6vC
	MtYrX4DGH5wHyEGkF1syMhizF+CiStMRQBKpg6oabVuDQQ33iIJG12RqJHrzUR27
	vxi+j2SEIcRZmV2atmxdU9EaeGI442ZN5FdGxStd3u+Ga33PSJ6wORCunznRFEki
	lUA6d97mj9gsTjzFawYEqcHrQZTihraUe4TLuY/QmalD4eY2uxRRZZUirP7rkevL
	/udx5EDr4nTtDs5PlkXpqXxHGDe3Lr/zWrkltXfpoUt1hhekJYKHvyOn6suCmfP5
	fdA+Yp6B/CtItKH5CPrMHBCvWG5KSenroBbYgK1HZPwj5CbstVQM0e5M9kPwENGw
	1GrXiQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyrprj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 14:40:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091ee9f1d8so72156831cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 07:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773844825; x=1774449625; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s2/iXDaWlcUGc9VTFZFfuG04XHynD0RSbFWnWzKw//A=;
        b=EysLshdpNBQtvzG2rvA0ZFLu7oJVuDrHBlOS+3wifvoslMHnh6Ce5IaQVUZff7aBoH
         Blss/Ec3N1IXcrR7/ctFJD2jvsLBex8eTaH935mStsTnSd+1D0rq8JBPDMG7lQA/AOId
         9qlEMJB9Dw4SI8k83rwur/2YAdVthyuH30stP2Xx4F7FboAjxcPn4IFZvtI+tKUzLngU
         1gbnFp/9kGwSp26VdNzLUDNo0SlSpmtgSHMCF8cNWDmGmQxGYgGe5BTsFA2IqucPOQZC
         nBTn1r9cLsNEFrh+YNY5zH3cjnujE7x1TIyQ7BDIEfRseHifTnOn5KZ5ABHPgH1IIyZC
         akqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844825; x=1774449625;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s2/iXDaWlcUGc9VTFZFfuG04XHynD0RSbFWnWzKw//A=;
        b=bNHpTiZg8vOHVcArWcaznGxrveHNA4SR2qzCyl1i5FhS1cHrSRgpbX+EW+jmBLVQaS
         r9nDOIZgAyJqKAASMiaCovFx4gztAkbjNQ+Kw0LZtMKgnBVItPkx/8Q+J3q3sFvp79OC
         Zh1VNwu5dGizqHUx2o7E4xl3BxaaRE0ZlCSFczzABRqJVCggFRJtd4oGal8ZQGFs/d7+
         /VbFDDpNq9FIrSwid7i8LjBG0+9dKB8b3vAes6Hwr94W3+Tf/WjU43mquACynErnI+m1
         nkgm8oUXXHWs+iNltySPY1RCrcfI/9qawg87O2EC2m2AiQq8+xx5qlFwDe75d7eLBoZf
         FSoA==
X-Forwarded-Encrypted: i=1; AJvYcCX4KJKh6y7pLrboiSyHE5DJ/cLKUFFhvy9mHBYdALXHKdglYWxV4B8nT2JW5vnoxKsu7JOjej4SFOTbx9Gv@vger.kernel.org
X-Gm-Message-State: AOJu0YzE0LBjOhJmXByMAXEL/K36Fcw3pWCQfT9k3m25a4PsN5QxjX1H
	N9K+fxjjhhMX+Bl/CJTulGzkx5HBBnGp3lu5J3mIiy8a+V/Yu5pfovS/XfNpoMJP8wC8KGzztYs
	QuMGgBA/0e6SQd4R4V6AcxQeCuFI1VsF2EpV/wpyTyiFJyauOOFygfyXiab7eZ2UX6ZSv
X-Gm-Gg: ATEYQzyWyHPu/cwC9Ppoubn7YSoZ1K4FoQZ2wtMY/Hc0A+FNeTYV3EyV4aKfwD8bAdn
	CC+dNIDhCAaLjLbTZ2cWjU6sg+91wJiqQzC0Go10NoEGv9sOzRusWoUOBVb3jCxaGyQRvkzz6bk
	bmcu4ey/K5d39oC3fjG0TV7VUix2VvUFefGMW0Nf9ZRovKtdPEQWWWWJvScahIOAAyihtbjMZj2
	Y0wsAxkXGka+WCGlv5XxvtV/K4mbeXYGJlqJSfZD12J4jZeDqOnDCfqRYaNjhfjoMIV5tamO/tl
	Wpl96aFBV1RgewsYPI+Cejo6cCGt/f0RR9qFUh4s+gjJBWUoyQG4JtCVFK+bAmo2+ClzGxZDQmV
	N2zpwByP+vIn7eW0krS515qa4Q66qMvbjZ0ajq2ZNUICMbIsQVklbKxYqqWZRWaPilwjTkZn/gb
	QUKG9HvqR9G90rsjSFZutH1N+oFF+94tSTvkI=
X-Received: by 2002:ac8:5994:0:b0:4ff:a8c1:b00e with SMTP id d75a77b69052e-50997ff8ce4mr93528341cf.2.1773844825090;
        Wed, 18 Mar 2026 07:40:25 -0700 (PDT)
X-Received: by 2002:ac8:5994:0:b0:4ff:a8c1:b00e with SMTP id d75a77b69052e-50997ff8ce4mr93526731cf.2.1773844823181;
        Wed, 18 Mar 2026 07:40:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7b2d0sm586387e87.72.2026.03.18.07.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:40:22 -0700 (PDT)
Date: Wed, 18 Mar 2026 16:40:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS
 ROG Phone 3
Message-ID: <doixykij5gfpyrkrcumlwdnlu75fxpjvqp44izgtfbuxyhj44e@bb7kp4d2ikfc>
References: <20260310-sm8250-asus-obiwan-v3-0-9ed8f0e71e19@pm.me>
 <20260310-sm8250-asus-obiwan-v3-2-9ed8f0e71e19@pm.me>
 <daa464f2-2052-4eb2-98bc-926ba174ecb8@oss.qualcomm.com>
 <nNinWyYOTp_1MjE-6JI6S4NPPxfZHvnIZLblp0x4t71DVOXn0ScH--kpAs-wHBQVUpgSvIZmOKRMmUVNzs8Vcm8PG3_4hFIW1jVx1RES2sg=@pm.me>
 <4ed72391-fcd2-4ad7-94da-45fe13012953@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ed72391-fcd2-4ad7-94da-45fe13012953@oss.qualcomm.com>
X-Proofpoint-GUID: MoFXW58YMQDnHjMBnlXVCGYDWOoMuD9j
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bab95a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=VdpNLKRrc3EepwXJwi0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEyNSBTYWx0ZWRfXy8zNayyZMkQg
 vIwCXs/N/EZE2axBBiyfEFS2YR9ZNW/ilaxxeYSFU7VMZYPqXrUoBAJ4Kc12wtlIHgPs3oOHPAd
 pnwxG6ZSxCOBHD6FU0YsfA88a6vxf7pPWmqyJ2cfAmEw3tHwQubx+VrRocsOY6wuug4K6LFsb2h
 54CcuQDq5qhJNCzbxMv6srxaDy3/LlNFmSw6jwKx9GoZJkZL9rrd2tupVqfAj0jJl+F3Yshs3S4
 Yzj3Ptzyt7rU78M5JUZWLghDpNjNTfAUTVlqlUPZh/bQBRDfV3vDC366BHdFYFQnw9OIO7rZtYE
 yw8FiTkN3z04o0lU1WNjxusTGcKLdmd6NHcP4Sydua7HxYylu6pIbURwpqrHXPfkh2GSxhmOYlT
 RtRmZdf3qSMw3NKyUuNC04Vz3PJhbj3Ns6YwIziGz/0dZTdjX5HL/mbo/TaN8HMB8zZW/0ejIn3
 EeQg5B7gbkNeG6Pji0w==
X-Proofpoint-ORIG-GUID: MoFXW58YMQDnHjMBnlXVCGYDWOoMuD9j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180125
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98516-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,oss.qualcomm.com:dkim,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1EC252BD704
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 12:29:37PM +0100, Konrad Dybcio wrote:
> On 3/18/26 12:14 PM, Alexander Koskovich wrote:
> > On Wednesday, March 18th, 2026 at 6:28 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> > 
> >>> +	/*
> >>> +	 * There are also ER & EVB boards, but those have meaningful hardware
> >>> +	 * differences that make them not compatible with this devicetree.
> >>> +	 */
> >>> +	qcom,board-id = <31 0>, /* ER2 */
> >>> +			<40 0>, /* PR */
> >>> +			<41 0>, /* PR2 */
> >>> +			<50 0>; /* MP */
> >>
> >> I would guesstimate MP is Mass Production and everything before that is
> >> engineering samples.. perhaps that doesn't hurt - maybe some curious Asus
> >> engineer swings by one day!
> > 
> > Actually the unit I have is 'PR', it's one I got from ASUS when they were still
> > sending out phones to developers. I guess the units they shipped out were preprod.
> 
> Oh, nice!
> 
> Maybe 'public relations'..
> 
> 
> >>> +		source-pdos = <PDO_FIXED(5000, 900,
> >>> +					 PDO_FIXED_DUAL_ROLE |
> >>> +					 PDO_FIXED_USB_COMM |
> >>> +					 PDO_FIXED_DATA_SWAP)>;
> >>> +
> >>> +		sink-pdos = <PDO_FIXED(5000, 3000,
> >>> +				       PDO_FIXED_DUAL_ROLE |
> >>> +				       PDO_FIXED_USB_COMM |
> >>> +				       PDO_FIXED_DATA_SWAP)
> >>> +			     PDO_FIXED(9000, 3000, 0)
> >>> +			     PDO_FIXED(12000, 2250, 0)>;
> >>
> >> Both ports have the same PDOs - will this kaboom if you plug in two chargers?
> > 
> > Good catch, from what I can see there is zero hardware isolation. Downstream
> > prevents dual sink by only allowing one port to negotiate sink at a time (seems
> > to always prefer usb_1 if both are plugged in, guessing because its used for
> > the dock), but there is no upstream mechanism to handle this as far as I know
> > (not sure if this could even be done cleanly as it'd require cooperation
> > between pm8150b_typec and rt1715).
> 
> Could you please remind me how the two were connected? Maybe we can work
> something out. Sounds like it would make sense for the two to have *some*
> sort of relationship described
> 
> > 
> > Will just drop the sink PDOs from usb_2 and have it be only source to avoid
> > this issue.
> 
> SG as a workaround
> >>> +&usb_2 {
> >>> +	pinctrl-0 = <&rt1715_mux_en>, <&usb2_mux_en>;
> >>> +	pinctrl-names = "default";
> >>> +
> >>> +	/*
> >>> +	 * Disable USB3 clock requirement as the bottom port only supports USB2.
> >>> +	 * The USB3 lanes are routed through the pogo connector on this board for
> >>> +	 * use with accessories, so will need to revisit this when we start to add
> >>> +	 * support for those.
> >>> +	 */
> >>> +	qcom,select-utmi-as-pipe-clk;
> >>
> >> So, is that right?
> >>
> >>                                   ┌───────┐
> >>                                   │ POGO  │
> >>                                   └──┬──┬─┘
> >>                    superspeed        │  │
> >>        ┌─────────────────────────────┘  │
> >>        │                                │
> >> ┌──────┼─┐      highspeed               │
> >> │ DWC3_2 ┼─────────────────────┐   ┌────┴──┐
> >> └────────┘                     └───┤  MUX  ┼───────PM8150_GPIO9
> >>                  ┌─────────┐       └──┬────┘
> >>                  │ GPIO170 │          │
> >>                  └─────────┘          │
> >>                       │               │
> >> ┌────────┐ RXTX   ┌───┴──┐        ┌───┴──┐
> >> │ UART   ┼────────│ MUX  ┼────────┤USB-C2│
> >> └────────┘        └──┬───┘        └──────┘
> >>                      │
> >>                      ▼
> >>                     GND
> > 
> > I misspoke in v3, UART is not controlled via a mux it's just a gate. Was
> > looking at the board previously and it seemed it either went to test points on
> > the board, or USB. But the enable GPIO controls both. Have it renamed in v4
> > staging atm.
> > 
> > But yeah that is accurate otherwise wrt the USB 2 mux.
> 
> Okay.. I don't know whether we have infra to handle it today (+Dmitry?)
> but generally we'd need something like

No, we don't. We have generic muxes under bindings/mux.

> 
> usb-mux {
> 	select-gpios = <&tlmm foo bar>;
> 	// sense it via some notification?
> 
> 	ports {
> 		// conn to usb_2_hs
> 		// conn to type-c
> 		// conn to pogo pin connector
> 	};
> };
> 
> rt1715 {
> 	connector {
> 		// mux conn
> 	}
> }
> 
> pogo-pins-connector {
> 	// mux conn	
> }

I tried designing it as something following mux-controller, but it
doesn't seem to fit. So yeah... This might be the best way to implement
it. But something as simple as this might also work:

mux: mux-controller {
	compatible = "gpio-mux";
};

rt1715-connector {
	mux = <&mux 0>;
	ports {
		// hs
	};
};

pogo-connector {
	mux = <&mux 1>;
	ports {
		// hs
	};
};

dwc3 {
	ports {
		port@0 {
			// endpoint@0 to rt1715
			// endpoint@1 to pogo
		};
	};
};

Or even:


mux: mux-controller {
	compatible = "gpio-mux";
};

rt1715-connector {
	ports {
		// hs
	};
};

pogo-connector {
	ports {
		// hs
	};
};

dwc3 {
	ports {
		port@0 {
			mux = <&mux>;
			// endpoint@0 to rt1715
			// endpoint@1 to pogo
		};
	};
};

> 
> there was a similar attempt (I bumped it up.. maybe it'll be merged soon)
> at describing a pogo pin connector, so part of that may come in useful:
> 
> https://lore.kernel.org/all/20250225223038.879614-2-swboyd@chromium.org/
> 
> but in any case, that's a song of the future..
> 
> Konrad

-- 
With best wishes
Dmitry

