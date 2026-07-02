Return-Path: <linux-arm-msm+bounces-115980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4/VPA1pQRmpHQgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:49:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8511B6F7020
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:49:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ErUM/L6m";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CVHra4xO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115980-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115980-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF217301745A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 11:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2CC47A0BC;
	Thu,  2 Jul 2026 11:49:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8768E42A791
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 11:49:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782992983; cv=none; b=PXdhrqZW3CGF+4EbxqH1cDymbC/vtTSWX/J6Pa9aLizQ+hTXMlIVMQYUn+tJv5K1ybxXDaxfSBFm82CgLdCR31MfZskplmvXNTXICzMXwm3LafvdcO132suoRFInR3Qqb98bYVtW34J60nCwytdIV9i4hRzO/ul4Lf3t4S7XRUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782992983; c=relaxed/simple;
	bh=rpKAe8dPCwr4VAmvOu6roGpeUIvUI+iDbjBX67nG+NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDSYAVW4cv4bEbtdJ5604WsjRfo1O5WGJ10UgLmKjTcPJXXrgnz5SXPSDnTQcmMyErnaRtVtnPrrxgAFeQUNcCbs1Ia0s+LKTkIaaY+xoHfzTwPH9uSAP7L4UMl23WSPzCjs/+8mQ66Wni6xREwRupiohxo0hHh8lmmfMlBIm7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ErUM/L6m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CVHra4xO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6627TuC73964274
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 11:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	upmYTcdh4plyAwPWdRv+6/jBs6VO3B/KEZnt0DeG4kA=; b=ErUM/L6mdqprqKRQ
	cQs3FUY/IofhUKWUVx2eovT1TJZT2iGFcebOwUBXSvWXnO26vw9CVo58V5VOeMJF
	wq+k4fP/eraS9R+IP4IZivcgVRrWcGSA3UKPKfaz83Bdsn7IwNaDfG4e3OABPXOp
	4iJKrE/Lkf7ixp3zBcqPw8qJY0urUFTcxcbnspu9x+6c0bIj6XCfAEDpDapH0pBR
	FuP0ws1k+xDugiylOSIFG12xRCrl128Q986KWdEY+6spIxOtPTz17koeWskWsUEb
	RlC5iXYLj3a/M9mdPCHlqdvhRJEbKpjDrnCnAadqqd3mkdDz24BbBbaaKkA5aqTM
	7dw7/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc100r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:49:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e623b0e95so167987785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 04:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782992981; x=1783597781; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=upmYTcdh4plyAwPWdRv+6/jBs6VO3B/KEZnt0DeG4kA=;
        b=CVHra4xOmo1kgnMN56rIShQYjH+PYPBdY4opkUWMGjonyv+DVpP4nX1JaLFlzPHNYL
         2IIweEknGTKlziGZbXXnQlUL+K7p/2e768Jgjx90zCxdUcleAyCgdyEigllk2jY/5tB1
         SGD/MfnUMKI0IcRKAagFq8xSvx8fLMnarjEzmQpRNhryMXqHS8xDJB9uRiUcUQUhV5AS
         X9JF/3IRR5xHDfyLb59Lsf7wQkxKGANxkwEexKSZw3nB7vIMNX/enzC4i/ko8pTT7N7r
         M1EtcV95gOrbv/n707H1r8sSsszIwzQBrhdcaDy52ls4sUQQmkf80S+M/zSgpI/YjCao
         aEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782992981; x=1783597781;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=upmYTcdh4plyAwPWdRv+6/jBs6VO3B/KEZnt0DeG4kA=;
        b=kZkAzjPIed7AAcHiIIM8VL4P6TqDXdQux0WRBomuM3ELlo7J931B59rylAOAcOeyqP
         of86MeUXcbNs8GOM3IKeecWWV/gsvVphWxiCEhnWGMNKYPfEUY0nwphcQtxv+5az1/id
         2Fse8x1yBtZY9SBnenEyjRZ4L/6aLpidZHqmmxoWs+gOSnyzzxPcls/kvZO4BHbCXybp
         4p2660gj6gAFgxxoppuLmCyKFATFGLMBpwmSr+pvcjoaIKF+v4aKwSDyXiBLGPVqMNbm
         On46C7pSsyalgoxFX+4Y7w27rl3XFJ5bgzLY6ksAO2YnzEWDqop6UzT7p5GfLw8QlK49
         8D4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+6FQPcwkS6Mk668UWcnbK47wew7nUtL3QAvvQr3GbGqc1sU5jQRFdZuK6cJhyadinulWUvUjwGJ9bQEUG5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4KPD7dAInfb4NLXCuN6OqqNFN51LhSsoN+2iItecAcRSbVvLA
	L5soISPObOOLy0MHlIggX4qgiXlJ4OiPZhx4cuMQsr2zNLXShV34rR7NnZ44lExO+X9HvUtziGP
	Stp3ZpDpfTDXK9wBYfEILKryKEuQTS2o5x4MnDe4uWOcTDLjrFN1kLkbVAfzLjUDzYgpX
X-Gm-Gg: AfdE7cnCCOiECisFR461duWacSpoOo6Arth3DRa7IBBHPKy93VukcfQ1gyVeKU0gdFZ
	4SGQN6KzAHSkziX+2mWthHpHcjb9pmZ1HPeVKU++69EqPCkFvxPsHEOEFqP8VcyESnc7ClYIQz1
	JsSahEZdTuvED2/YktNsmRAh73yv5T9oKEYLtquzBwjjUsku5/Lue+/YmGGHaihTwpOrccLdnor
	WmEI+5KlGmdJX+9Bdk5+QmcoX16i9u1Xh12ZmHLtHSQRW1kOcSZ2RKTQsZLlqLGvYpUTI1VukIn
	FekeDGgTvKygh2Vd1G+uuiDJ9mag9FflBTD/6pQwtO4t67rHWAOoB8j01IcQXgQL6xaSF7nCH7I
	ucdr3tepcIQJ1sVwkwhSok+sqgb55S7yyDawl5yykLL1Z9hDzC10O/XXHjYWVjxGiG7IjPTpWxY
	E5uM6DiNNPYE2tEr1b6WCE4KwX
X-Received: by 2002:a05:620a:1a26:b0:915:cb40:f76a with SMTP id af79cd13be357-92e782c44c1mr840350985a.39.1782992980748;
        Thu, 02 Jul 2026 04:49:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1a26:b0:915:cb40:f76a with SMTP id af79cd13be357-92e782c44c1mr840346585a.39.1782992980234;
        Thu, 02 Jul 2026 04:49:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89d52ccsm623900e87.40.2026.07.02.04.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 04:49:39 -0700 (PDT)
Date: Thu, 2 Jul 2026 14:49:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
Message-ID: <dqe3ntmtmjqixp2l5n7qm6zpcwh4sizr7jd5g3cl3tzpvl6tvo@casnjg3orldd>
References: <fd58d6d7-26cf-4b11-82ad-05b4863b6dd1@kernel.org>
 <20260519082526.odmn5dqi2jftwnln@hu-kotarake-hyd.qualcomm.com>
 <20260519-first-wine-bulldog-a6a4c7@quoll>
 <20260521071341.q4efqssppvettaey@hu-kamalw-hyd.qualcomm.com>
 <86f76a81-832d-4ba5-81d5-38b46b7dc0a7@kernel.org>
 <6c595a5f-b979-4e8b-ae77-d28d24700588@oss.qualcomm.com>
 <e07085c5-0fe8-4ea7-8e51-ebe104e7aa2d@kernel.org>
 <82019c2e-6b6e-4edd-91b3-a28ef6eb09eb@oss.qualcomm.com>
 <20260525120139.dyfnm6nwfzuoxd7p@hu-kotarake-hyd.qualcomm.com>
 <20260702113010.zjrk4kr7fpjp6asj@hu-kotarake-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260702113010.zjrk4kr7fpjp6asj@hu-kotarake-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: DfQ-V4HzeBQqZ03h3fdbq4NrIAVanpLO
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a465055 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=s3MLSL2Rv04tJSLU0-0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyMyBTYWx0ZWRfXy+Q7ocTf7nTa
 ALgsgXYKA6IAzLp6m1c801g0gP9X/xJgZD4ZuuiazLmVazlmIpsAili1eCdFKNKa9bde/9eAaHF
 BryarIT8g0qxqhMQ6bT82C2EJCNECreP/h6soqr/L/Je7Vem0nPxrnSPwMPRBerIK+lKlnA6UFk
 UKAgSNfYeBkIS8VqlyDB/Rz8LR+HfV95xhgmztuICXJ3EOzim52lg7uL17s+o0X7I6RV9eh2wPR
 WPiSPPQEIP4up4pImCzWhs9fwWLU03hLqPDLgKjhQnQh1ySRQ/EL4Zv45ZMP431RHmucfv+wUEB
 GER39q1vkIyEmLUd5WlBDFw4AZ+jdp/NUpL4caQUsq7zutokYXTznwA5GKl+xK7ftSh9y9ZTCIg
 BByUQSwjl9cHMAOJGBosz4LP9jCDKZ8El8wpni+G5sPKS3Z71K6uksDoRZJUgDgfkkdhST6RGA3
 NIRdGPUkrvrsoXlNDEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyMyBTYWx0ZWRfX9u04YWXw+sBQ
 AcSIKetyLXneGCTfMR19OgQ39g55bdbLaQ0fGFlkM6hsBzGJ8yaF9h7/UC9N/eaZOM0dhFwnE2E
 Nxx90xVD94GvUEYcn+LLS14qRYUF9dU=
X-Proofpoint-GUID: DfQ-V4HzeBQqZ03h3fdbq4NrIAVanpLO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115980-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:rakesh.kota@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sre@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8511B6F7020

On Thu, Jul 02, 2026 at 05:00:10PM +0530, Rakesh Kota wrote:
> On Mon, May 25, 2026 at 05:31:39PM +0530, Rakesh Kota wrote:
> > On Fri, May 22, 2026 at 11:24:19AM +0200, Konrad Dybcio wrote:
> > > On 5/21/26 11:58 AM, Krzysztof Kozlowski wrote:
> > > > On 21/05/2026 10:46, Konrad Dybcio wrote:
> > > >> On 5/21/26 9:20 AM, Krzysztof Kozlowski wrote:
> > > >>>> Since firmware does not have a way to dynamically tell if it on a
> > > >>>> debug-board powered device or a DCIN powered device, We are required to
> > > >>>> add this new DT property.
> > > >>>
> > > >>> Neither debug-board powered device nor battery-less will have
> > > >>> monitored-battery, thus again, why lack of that property cannot tell you
> > > >>> what you need?
> > > >>
> > > >> A device with a battery will not have a monitored-battery either
> > > > But why? If for such device property "no battery" is suitable, then for
> > > > me "monitored-battery" is suitable as well. IOW, if you say that having
> > > > a property describing batter is not a accurate hardware property here,
> > > > then neither saying "no battery" is, because no batter is basically some
> > > > sort of battery (just like empty set is still a set, empty array is
> > > > still an array).
> > > 
> > > The battmgr service running on one of the remoteprocs already has all
> > > the information about the battery and it also handles all the type-c,
> > > PD and charger configuration, only letting the OS know about the
> > > results.
> > > 
> > > Hence, unless there's some other hardware at play (e.g. for custom
> > > 200 W charging), which wasn't fully implemented in the QC firmware,
> > > there is no reason to describe a battery separately, since the OS
> > > can't do anything useful with that information
> > > 
> > > In some abstract way, perhaps monitored_battery = <&pmic_glink> could
> > > be thought of as valid (since that's the data source the OS gets to
> > > see)
> > 
> > Should we use monitored-battery = <&pmic_glink>; If so, would it be
> > incorrect to mark pmic_glink as simple-battery, as that may cause the
> > schema validation to fail?
> 
> Hi @Konrad Dybcio, @Krzysztof Kozlowski , 
> 
> Following up on the earlier discussion — is monitored-battery =
> <&pmic_glink>; a valid pattern? And if so, would marking pmic_glink as
> simple-battery cause DT schema validation failures?

I'd say, no, monitored-battery should be pointing to the battery device.
Please fix this on the firmware side, so that the firmware can report
having no battery at all.

-- 
With best wishes
Dmitry

