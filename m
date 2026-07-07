Return-Path: <linux-arm-msm+bounces-117205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dc/YIA6+TGowpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:51:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9357195DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:51:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TkJ2Gry9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xyi0n2nh;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117205-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117205-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58A44308008A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 08:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65C325CC57;
	Tue,  7 Jul 2026 08:46:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8671F2EB87F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 08:46:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413984; cv=none; b=VeJYexbjHfNwu9ife1l7Ic2Ry4pHBLuu0q4xJ5EdIq1ib97dpQTkbNgFQrwZVqPI2AZtY1gu0Zj8cmmc7hj3TcvV0yv2u9Hre7ys67ydauNM/uZm43qIp17MTO9P4Bvqx0DBSO8xkdDyUuDOozkKj47lmatGA1MmOqi7jr06njo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413984; c=relaxed/simple;
	bh=bo4/wCTEDBoLszco8H2NWkjSXPYk2AxUnpKUQ1Gp0J4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sC4aXTWE567xzZ9bIL0v+Tn+wrwFcwkdl+hZOFtV8b/E6bCG6hu5Bdcguetam3H5tyLPKETyP+XXM4n4gqDFygfIugvtXKWCBMnebU0Qtd+WhnF7A2ToSsvLn6fSjBIr96QTE8Dr34y2v4LExNo0EslJkmyZLoJ7RK7/5hKEtkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkJ2Gry9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xyi0n2nh; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678EBmH3231398
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 08:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PwC0y/t4PA5BTm75kzF4PtT2
	bwZ/6+nW2XeYw/+I+xc=; b=TkJ2Gry9andR9MXSQ+z+BedC4eDQJUHGEM4cpmXi
	2m0fAkY0dg3SrGDYT95ft9iL3xdoirGK4syJT2FbAICNe7gWMJQB2qH8E+vxle1A
	ijakzvrycnyJlIJV3NPZRl7Ffe8reYtsDLNKDN00JHmg5loEv70UqfAXV+YMucHV
	0K0nT9nUL3/s+U4b8LoOua6APuh3QiBGe+fVFWgr4rnx+7O9NPXIET+n45ZRcfC6
	NaNH8irXcvnthCYPR8ZOaX6z8U0l57VW1WqrEWIHYFcRaHrscHpKC9yoXOnNHp2X
	gBnj37LTGesR7R+kNdc/fsnIYwVFmBkIlxvOcMWprbhOYw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj79hqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 08:46:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3812b0c6f23so4089270a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 01:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783413982; x=1784018782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PwC0y/t4PA5BTm75kzF4PtT2bwZ/6+nW2XeYw/+I+xc=;
        b=Xyi0n2nhOBvhVnsyIgDb5wT2k/2SiPtslT0wFlYbF90woGrqXy7MNG4Y8EjkrfC+nK
         vhPC1nbUoPtJsGlo07B0ZEcojKy+xcOa6sfKVBWm4WVln9U/gqnKwxUIVPpuEZ6ycdx/
         nM5Yaj5XJE9QZSCmXKsxs21H4Oz9arqeDIkeJG+OzoyjqpbSMiO8Gf9gitPv6YdQzjgA
         RoFpGr/SQV8YtIv6L79Q6AUgPWLmikUph77JHh1C2gE+pOUDsCtJG/rr1yyvNRFEamGt
         CFmXmXL6c30zae6Fvkt/agYf8zKF6wVhi58SRzLW+Cycl9dsdKaN42Aie/CKlY65CZ1m
         qNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413982; x=1784018782;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwC0y/t4PA5BTm75kzF4PtT2bwZ/6+nW2XeYw/+I+xc=;
        b=kbJQnMcIgwRVGe/fEFkWZL7w7IGYSJ+Uc33RdtyMelctS3MY/5A8jux0ZlKrWzGXba
         aAHfdSQ4v4xr+7FFAI2D9MQ8fhz/5ng1OUJPfPkMhKlJdk5WHegbaJLIKxmql/eXEO1U
         nSIC8J8laBOFEeuDMouTJIMtTwjZuvk/pRihrnpclf93kZSD3X3pXbWQ2hwCnDC6HI7L
         BKUoh0FbSGhEzXc+JT1EiT2PcgPcFrqjNBpnzz6bl8K6TDs47YAr1MWdX6PWcIVpxOft
         j8I3LXMFT/wF0s3W2EtX6xuY2RjEqK32X8gA4dxjTgwkOF53nMsrAlFVaX+LvVFtEVVT
         6e3A==
X-Forwarded-Encrypted: i=1; AHgh+Rpbxg23G4JYjLp9y5hIe3f22WTaRyDsVA6inXztoYp3TI+iXjMalL39zEaHJDxQukv+8G60oi6lKv8J6FeN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9GSNoY0DvfxOKkpfxmfWOT9uBlPwgoX/YSE0ROWccfdzWRQFp
	XHp2xzS7inIaI9wGY7H8Hgee/aKflgl3nGYAvDBWgBF7loJ+0KqSASlz+ME/WmMrLg3FPuiMSbs
	htRr54eZCnMCemOhRfV458Al+NWSM33z+eOajylvJlDDRwqrRxfW6w4ndsMDZnyNNUCWO
X-Gm-Gg: AfdE7ckchTDbuRzRFbuV+7A4SS+/CIN9SFLLvXcgQ5k/B+PnpxxXHr5tatD9nXCNqw/
	gTsiuas1Z0wsUZI0zHIauRyhUwx32tYeTnEptX0+dSrqqoRG1cUNn1dgg1R+W9S+QtmryHw42IG
	sSBVTYOaHO3LrLuhRywxLcreJzJsEhxaZy5TbSpN4idpm6Idiut5otlTwaOO9GYTcuBt5hFJF4d
	mVo/ELwnHafZgHkrpE0Ga309s3oaxxtEbFatZ6yoVndvUWANLS/AzseweWx0RKY6TyeJSCkAsbK
	jVOtQhPRGmuqDTTMLnn/a+4a7X5FeZc3qJRJbGvrORNarSzoAnLoD9A3H1yaTYPRxyYDAqiqjAr
	Kj7c0vtzyogkJZSZXab2o9iVxS1bmcVckl8BFMPNSETOdfterO9kH4Qk8TkoH
X-Received: by 2002:a17:90b:3c01:b0:387:e0db:bc28 with SMTP id 98e67ed59e1d1-387e0dbbda0mr1639648a91.40.1783413981603;
        Tue, 07 Jul 2026 01:46:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3c01:b0:387:e0db:bc28 with SMTP id 98e67ed59e1d1-387e0dbbda0mr1639626a91.40.1783413981095;
        Tue, 07 Jul 2026 01:46:21 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a5b26csm5823228eec.15.2026.07.07.01.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:46:20 -0700 (PDT)
Date: Tue, 7 Jul 2026 01:46:18 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Message-ID: <aky82v5nWhamDRUO@hu-anancv-lv.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-2-b706c4c9b3e2@oss.qualcomm.com>
 <akraIZWuQlYvPW8v@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akraIZWuQlYvPW8v@baldur>
X-Proofpoint-ORIG-GUID: TIQAFQVnI2qu0A0TqCYLCaV7En1drupY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4NCBTYWx0ZWRfX7fttf8sXEuVZ
 dce4BumDDs0vpKd5x8lrfC9wfUIb453HjHue6tlbpeVyu9+gJihVVR5cOIDb3HlE92PWeuXO3jr
 bPGR3yynfSeHrLPtd6cUkv2nKm+/lUGp3rbqyPgyCwfgAhz6foH380zs0l+zqUa9bxwrbwTPq8X
 ogy9RssYP0Nifj/fAfwcNkbbJnqZY5PZJU12gxzyUDNS5+F7QeSpLyvolAXp7XVRa3R4JsrhA6g
 EX6klraRwDiWYy8p9BCEkaO5yqRjUoSMtQfb1Q/gZ/UvB0KQ4AkVfQTLEVcQ38CghAegZYaUMjP
 mBP2HuMZ8YrOwjAQuYO0tS2DQ+GRbFlEQ7nWGwHu8ydxS+UKrYusG4I23AlEQypm/Ol6SHjRjk0
 IJp2eV3VOtpX4FnuGp+hgETIKRRbbWlhLhWohLQjtgS4nHjcWgJXDtJozl6W1UrxV6cJep3Jskr
 wHjVM9tGqtdbq2Qg1ng==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4cbcde cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bfxUIGayu0eRWlMeD5MA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4NCBTYWx0ZWRfXxtHvIc/fELwP
 EgvfC1xWSFLudU/o1LiQPMRy3hL1BabGXlv3Ib/HlaClbOguQk7EfSJzeZLgMf8okZ2AYT4b7Ul
 M0yIHSJwTg9WPP+H3c2Yz7QieL7I29k=
X-Proofpoint-GUID: TIQAFQVnI2qu0A0TqCYLCaV7En1drupY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-117205-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-anancv-lv.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD9357195DB

Hi Bjorn,

On Sun, Jul 05, 2026 at 05:27:50PM -0500, Bjorn Andersson wrote:
> On Fri, Jul 03, 2026 at 05:31:12AM -0700, Ananthu C V wrote:
> > Fixup the SoCCP/SoCCP DTB memory regions to reflect the memory
> > region requirements of the SoCCP firmware, as described in the
> > Glymur v21 memory map release.
> 
> Please change your commit message to start with a problem description,
> not the action taken by the patch.

ACK, will update.

> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index 20b49af7298e..5f44f68efde2 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
> >  			no-map;
> >  		};
> >  
> > -		soccpdtb_mem: soccpdtb@892e0000 {
> > -			reg = <0x0 0x892e0000 0x0 0x20000>;
> > +		soccpdtb_mem: soccpdtb@89200000 {
> > +			reg = <0x0 0x89200000 0x0 0x20000>;
> >  			no-map;
> >  		};
> >  
> > -		soccp_mem: soccp@89300000 {
> > -			reg = <0x0 0x89300000 0x0 0x400000>;
> > +		soccp_mem: soccp@88e00000 {
> 
> Now the sort order is wrong.

This also will be fixed in the next revision.

> Regards,
> Bjorn

Once again, thanks for the reviews.

Best,
Ananthu

