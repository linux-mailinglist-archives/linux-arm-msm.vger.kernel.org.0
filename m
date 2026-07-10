Return-Path: <linux-arm-msm+bounces-118278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oZj5HHbrUGrF8QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:54:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8080273AF20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:54:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oetCEnQV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ktn2PUx4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118278-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118278-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59C2A301E6FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC834279F6;
	Fri, 10 Jul 2026 12:47:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9EA4218B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:47:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687678; cv=none; b=LNjllEIpNldjYw+Hr8YNEd5UNuYS4AiZo48cMOAsiHp1w6frDmzYFah2K+VK84MklsD1NFgxTeg5Kc44mJkkAtMcEbSO+n3T/L8zvqveKgVypgV1ODO+d3Jv8HsXJ0CYZAMKF007cNCnqwL5ym6sCJDphGag3Em3QRHLMZDX99I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687678; c=relaxed/simple;
	bh=BiV1y0ypbEQQXL3PVPRSFT6rBm4K9z5z5htZQHPWnaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frqGPPWRKPYZRuJw1krdE/IPRjqxf+QrjKn36SDt2SZ5qJ3X6mAHHFSvKHfxkEdW2thSOj/WBBUAAlQhr+N3czgeiYX9Y6U5+Fv87h05G3gRnX1vuH2pZSndLXJZvyL5lvdgzeo5tbijPJlWAnrxtTS+OJv7C8AblTqtWwkpfOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oetCEnQV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ktn2PUx4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAnCeb616694
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sGJdPaZpaHpOQoeJ0zgl3SrG4m4qWzrVvBI3N5THHrs=; b=oetCEnQVSWKZ57+p
	XKlGiyzMK9HUX5QNJisOVpwaykPg8ovfs4uI1toO+cGFhgy5vhJRXUZpWhEzCZAw
	14l+Oamwq7tlE8pCDhwuu2nMd0y6m3I9DZxXD6vvZpuhAYbpugKgyaBq80tojzJj
	LhsSlIGBWvdRH3ImiinOfjs5oQ0n3GBDnYMLUlToJ5El5jBtXfqt+hu05EsWQMzF
	fxRq5bwL75GFRPGefwM59SAf7GsUiK1L2yv2ank8aJYZjEIr1wMwvAgojS+gGBoV
	DwRdsazeYb2QLYQW/mteG4Hy29GX+ths6TolNJV7w/TlwyAbfPC3az891e3fhmK4
	VDC4uw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n1vk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:47:55 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7377e2f1a62so326580137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783687675; x=1784292475; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sGJdPaZpaHpOQoeJ0zgl3SrG4m4qWzrVvBI3N5THHrs=;
        b=ktn2PUx4KlTyN4aBhlaJQgVv58RLjNNXLufvmD8ib6Svuj+Yrk+M2mvrk4a4GXw0nT
         kCdmKp9jf1E9S2RjDj5hoFZk3zw+gXN/s4cz933dNb5sQyQ0iedkheoPn3tYjvYwIMOQ
         CzQvRLz/uZeXcnEh0Sx9KK+t2f8QNjn9Uqas7CzT7H3K2ZqSdx+BpPvLIpCpAdGqjJ6u
         z1VOWYZVfYW+y0Aj2hZBA0iywBSFh9XAGOaV6Wz7C2OdbTfoAj4ouqxd5bkEmPw7eAdD
         Y1kj3Ou1naYi36MBREHSBS+radRAo1TaRIZ7lco45YIN/xCIhv9PzgOxoliGQJKvsdUN
         oZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687675; x=1784292475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGJdPaZpaHpOQoeJ0zgl3SrG4m4qWzrVvBI3N5THHrs=;
        b=luC/Etpwb51+H0XHGCOreqeIReWQzHZ2+bCAM2Us6IrhSLvoxXPZ+5tg2XQS6YvKy+
         Q/Hhp59IvEu309YE1YRF3UttAfQ8IqWWC1YW1UjhMBt44ulWQWTTHAazGKZDReLrImv3
         +sUmAoK95JiZO/sJ68WRicQhaK/E/V0jbK1S2GcjQdUH7YsLHvgSapsKcQPE+AlSEg4e
         dfZBTYCtK1i17qMs0mXGFyt369Udu+kTG5pyxToARhCsS3LaoZKTJo3HVf3/prvFBxVM
         yj84VOh9vuKsysNbj7R84h1teLi4Tvsa8a6k9WRnwCjA2gC+g8oNlkg2FYXE0Q5T6KLO
         UGaQ==
X-Forwarded-Encrypted: i=1; AHgh+RogVs4nv/IFUNfskvaMYQ+Wto1HDekE9lfqsaPqv8XoUGnrftjQF0C5shVLB0j5hwsdxBxdLxoY0u4FaQU9@vger.kernel.org
X-Gm-Message-State: AOJu0YxnOnwNf/wlrPPqEz3bd6ILsHqCh/5LSz3is1vfzhnqCsa3cbdv
	iKrWyTHwsMbuJGVro1EbtainDIqr2R1xmJh2dfA+JS2g7i22q0IBDD6b5+Sb5YZnVNrRX19irb3
	zFD7ufnf5IS3I+BSfKdEgmVV8pJLaXYrdGe1LXdq0SF/nLRm/9Gsy8bJle7XYpH2oPlmz
X-Gm-Gg: AfdE7cmHwrN7dIe+vKrlWvi+xKfg2a3bLk3jY5SBzu1u17Qlo8BPMpPR+qzMvmOKzw6
	WLCneEnkVf6Gw+4EExhDsE4ClwEu6kT83mvI39mtsZLbaScF6YqVbToIBs8XcfgBdSUzG+LC4Vy
	E/5T+1kNFOTPJJayyGu+bAJ1zn/YvOIQKVUH3wPaH3DSzEu5Bei7k0ecYPW9Z9Da04KK0Hiwwly
	d8OhbAuIYckvihWZLFuu/F90w+D93scBMz+sjPzWuKnnJTEOTc1HikPtBIrlgCS91ErBGsZJLco
	0M2tEZZw0CTWO+8lD0mMQ/zp9SqQ9w1z1jPzzeXN+5XrK9wK5rzByGDHFWpLBUuyqgbfNFnq8OP
	YACzUM3ptRd5/7RVOcOUPM7iLUTFreyRll15gTvxW8r/ZYAfyQmyVzvkI0ESZ77j0DwWzwCTZbM
	eOJX3fCEDrgzGKJRYlqc0ihAOI
X-Received: by 2002:a05:6102:8019:b0:744:dc62:55ae with SMTP id ada2fe7eead31-744e00d15d0mr6760349137.16.1783687674951;
        Fri, 10 Jul 2026 05:47:54 -0700 (PDT)
X-Received: by 2002:a05:6102:8019:b0:744:dc62:55ae with SMTP id ada2fe7eead31-744e00d15d0mr6760341137.16.1783687674460;
        Fri, 10 Jul 2026 05:47:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b84954sm9133221fa.23.2026.07.10.05.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:47:53 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:47:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Message-ID: <6tli6ulvne6wutgekr3c3knjagsd2ththgoej4ymh7i63ldzsz@4wcy2pod4bzd>
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
 <d7322cb1-1c8f-4c81-a3c0-638d60b53230@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7322cb1-1c8f-4c81-a3c0-638d60b53230@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyNiBTYWx0ZWRfX6tPooO7IfCJp
 9ZE3OiPxWM2OqWwe/PG2qDyrLLfMxAOSE4xrrE34wMc2G8An99ymviRrqSghQIgnvjo1QaKPDrr
 BrOuZpGdMG5VVRvPTOiDxok9OwlSSfg=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a50e9fb cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=G0HjAHWLGnXFZXo3PwQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: X7BGoDC5KmU0kNOkumzA5P-Q4VR6a0I8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyNiBTYWx0ZWRfX13Lsc9vITiNM
 sbpNmTx3Y1Nk14ojI6V1M6N3D4Y0Gq3dvRMvp6S92W/XP2PFjTDuTqtGG3jX6Rlx7GsJREq6+1L
 MVNM4yhWoE/07ouW/qsMM8RJl4lhYPQ6WrHrPiq5XU4upImC93f+zGTAKdakYW4IRpVrkW+v5ZA
 Z9NfUCjm+QW04OC3UqIsJpOySHmr/ZtLmBhjbqh9zNiaXq6oZDeLrhgu16RfYlG+tPNrCt7UY+p
 tWVmqRtMYpb/C6pOX5Q5ermP7VcteevbWJyoaWBzG5EPBBYE2GS1cN95skkXtrhqTMrIwjnPb3V
 r4pioham8WJu13qIVqoZ+1naYr4rv9EP4w3aXtP9IVb9o/0bK8xDZOtEo+UZhcyQP+JHRZgbONs
 kfOxzSQQ1UR9/FByhjhQrGHj4cNHWpd27VvnyAOIANuWWgsqGvt35VovtXamHskKIWbkOz+QfMW
 R0oN3zQn/S5eiQB27hg==
X-Proofpoint-GUID: X7BGoDC5KmU0kNOkumzA5P-Q4VR6a0I8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118278-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:arpit.saini@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8080273AF20

On Fri, Jul 10, 2026 at 02:10:48PM +0200, Konrad Dybcio wrote:
> On 7/10/26 1:58 PM, Arpit Saini wrote:
> > Hi Konrad,
> > 
> > On 7/10/2026 2:31 PM, Arpit Saini wrote:
> >> Hi Konrad,
> >>
> >> On 7/6/2026 3:33 PM, Konrad Dybcio wrote:
> >>> On 7/6/26 8:04 AM, Nabige Aala wrote:
> >>>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> [...]
> 
> >>>> +    panel_bl_en_suspend: panel-bl-en-suspend-state {
> >>>> +        pins = "gpio91";
> >>>> +        function = "gpio";
> >>>> +        drive-strength = <2>;
> >>>> +        bias-pull-down;
> >>>> +        output-low;
> >>>> +    };
> >>> output-foo isn't necessary, the panel driver will assert it as
> >>> necessary
> >>>
> >>> Konrad
> >>
> >> Ack, thanks for pointing out.
> >>
> >> Arpit
> >>
> > I just checked,
> > 
> > Normally the backlight EN pin is controlled by a backlight driver.
> > 
> > However, this panel uses MIPI DCS based backlight control with no
> > 
> > separate backlight driver. Since there is no driver to assert gpio91,
> > 
> > we control it via the panel's pinctrl default state..
> > 
> > So this is platform specific pin , we need this to enable/disable
> > 
> > the backlight.
> 
> Why would the backlight state be so tightly defined by the panel?
> Disabling or adjusting the backlight level without shutting down
> the panel is a perfectly valid use case.
> 
> Take a look at pwm-backlight or gpio-backlight.

This one is different. The backlight is controlled over the DSI link. In
this case there is no separate driver for the backlight, the panel
driver handles it (it needs to be like this for multiple reasons).

-- 
With best wishes
Dmitry

