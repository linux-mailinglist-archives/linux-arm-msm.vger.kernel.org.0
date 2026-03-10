Return-Path: <linux-arm-msm+bounces-96465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JyBH0COr2kragIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:21:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DAD244B91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08E96300A653
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FD8399019;
	Tue, 10 Mar 2026 03:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S3fQYBOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bkAkLd6I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F523B8D7F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773112890; cv=none; b=biWkXDVGeaX/sjde0c9z5VRBV7Fm/uYJavFmDPGsC2B4THXG68j1uSdAbCStBR3+DDtnsXVARQIpZ7B40QsVDT66/UIrfPx/ueQdXgKRo3maRfLj3e6Fis5sA4SN+mikxeHBl/slTqCx9mw7tXa1HxvDz78ON8fYWqDUgMfRXlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773112890; c=relaxed/simple;
	bh=xZ95pltuBo3XBJd6cThiZfo4nWO4Mi7D7thJV2tgIvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iz8E1iZqgG+eqWcPK3wy0Ypm1FpRcTS8ybU4LpyWKCHq/3DnPldloTc4v4ruN6E905gZk95HNQkR9IfJNCx7apkkxBZ5/amlfnfULc6K3HZEmayC95x+cgAD0RNIdK1XxYjBfFfLsArlJQCykMwT9ZKPggOc9dJ6so9XuZ/Alr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S3fQYBOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bkAkLd6I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2En4q111299
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e7mVQVS9n4swvVBScV5FEJu7
	2PJ5Q+aaAbAZXVKrwgY=; b=S3fQYBODFlTArILW5mJzWlqFF52VSixkRO4CZsui
	gB0QPfD4PbsZQSplXvSALqmXNwf5H6K/z3Pqfkxwqe/mbDVfH3smlvGgQrFd7kFP
	XWibQOIaV4lyJdkaV6k+JiqDXJKmKAGbpc7JXUfuyWMZCvhr1CuSyc/YL2AL1W6k
	o23d1OQIjgiaKudf6d2DNWd1MPhQs8iBBX6HXvS3gyQpeaVB/KHSveEAFFl0Hyd7
	oDhKgairZ3k7CdpC2tEExt9sqz7ACEjBsszfJmqBtgMPkqP8WsAwVQbo+Fvoeeix
	+IDNOCqJTRkmthXJtrJ7pKgWt9fO4DXhsj/0E6QPWM92xw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5ub2b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:21:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd85e08fddso1686801785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773112887; x=1773717687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e7mVQVS9n4swvVBScV5FEJu72PJ5Q+aaAbAZXVKrwgY=;
        b=bkAkLd6ILpkNzm1cqQ6leSU4bOwMYXwBXF1VnqUlHbzWt+I613m6wJfADr3E8gwBgd
         Xg/v6yuhoFtNuyfawN8Oma6fl0acimmcKeNqhJlFDtU9BdhtHx821Dy0CasoCVMuFEU0
         MjoXILRwNuEbVExcvbylA+jUnrbP7E42K7CnHuWCUwY6/5fe4c3Uhhw57rM3Zmy3psD5
         NL8ICr2c4i1p7iokM6pLp1SQn54Nz0NshXd7nKpBC8hKWoG8cjB/iqerRb4Z0fjkOfRJ
         H69Dsv8YMuX8MertsXHcEbSOrzopi0Dm7OJ7IzdznTEZByR7qzTps/OtfGwZ3vtCeC4p
         r14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773112887; x=1773717687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7mVQVS9n4swvVBScV5FEJu72PJ5Q+aaAbAZXVKrwgY=;
        b=SVt4Ck3EAQFfkadCEQHyIqs24MSezSXH+p3dj6DAUcjkeApNBlPnRshCn4z7tlIcGw
         sQ8Y/20ZmDKv9Ll+kNxmjqEvwUSQL19sU9T9ceoi/mhb5LPKd3P6pm+zGj6r6/luXnQ5
         oY7ZMHfkFs+OePQonatOGJEmJWF9vF5lm3gwCw0ZwcS06mPvi851yGs0Y6+oUi2uNL+9
         6uShycAu8MbJkXIg9VUtiiXPyPf4rqFXVCVyfj35kQMHgCyfqZbydVuM4flz38M62iQf
         zv8C76yU33YTbx/JqDn4+UgFDXfv+P/umwoOAns7g1p9B3EwvnNLmSpCtadi/Uvfb7h3
         SkWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi1PUTYmW21tbsFdf0M4rKWLBd+0pYtT8F20BBapEecP8fUd1OHMDp2cZBmw+MpbCn26CTMVeLzkZPwDnl@vger.kernel.org
X-Gm-Message-State: AOJu0YzVLUKzRcKIAmlPMptedT7NaPLeZajsWpXbSxGIUmjabkm069oK
	Z0i/c1XNr9ZSWStZzru1/fM69U2vABGlgSHYTivm/z8uiy32oAfNrY1RR0L0gLgh/TRekjMG+7R
	b4cxmRy+OADvonwpn170fq3mEa5lauGf/CttX1K51xaUwBvncy3xekm61tmq6zxDXTy0G
X-Gm-Gg: ATEYQzz/6j29JtilugQChsank/CGlE4+k04gjET5FdHa4HR8Q+6hFgN7nk+iB6+OaaQ
	epR0ohVO/bF51BFvWZzLgiA8JSsxWZ0lWwYldP2FWJALkiMppERQN21Zypdy3+NPBuPfGI061Ct
	06E1dZdqncxEjfguviXJ6PzGK4CyBF1OIUlK2oWptHzMaLnu2rN7ia/7RqfdrOQHPfOkISnKxW9
	ybTw7FaGXSySD2hE1NCgz5nwuSgUbPcgyNPBqrFqv84HDwDKqyoVK53TeOfYl/JGustQxVwtQ39
	hB5QaNU+IMoKzpxopHqwH7rnw4UQcM0ZeZV4RsuMGXXFFZ5RYn+GlElRmexBp+DBbj+cHXYjTYC
	+IgmdzV7KMsY2kVgbW/+GGnTcCa/60XHrkFL2dVoC82eP71hL/CPKLLTOLIk/H+3N/wpCxuzCbZ
	3WdHa+fvLoi271zM0EGtMKOcWce2Pa108wCfk=
X-Received: by 2002:a05:620a:4381:b0:8cd:76fa:1be1 with SMTP id af79cd13be357-8cd76fa1ff3mr1341975885a.14.1773112887266;
        Mon, 09 Mar 2026 20:21:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4381:b0:8cd:76fa:1be1 with SMTP id af79cd13be357-8cd76fa1ff3mr1341974685a.14.1773112886867;
        Mon, 09 Mar 2026 20:21:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01cf4asm2475809e87.2.2026.03.09.20.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:21:25 -0700 (PDT)
Date: Tue, 10 Mar 2026 05:21:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG
 Phone 3
Message-ID: <eykyxrdiaqf3z3nthwa22tvxz442ynhvhsjhajs5jfnwuko2yp@f75t6vfhfjrp>
References: <20260308-sm8250-asus-obiwan-v1-0-3c72941eb796@pm.me>
 <20260308-sm8250-asus-obiwan-v1-3-3c72941eb796@pm.me>
 <pu56z7dorbujx57yzfclcncrj4zwgtv3gshntnlpxcpbunxsiz@2rckwcyjgetg>
 <TTd9O1RN8B4tl9ogFkEYOLpb0iuA2NkOP_3RVkPfnEPntd7f33LU8zzKfy1ICXQ1M-TmDVht5GxiNsMDCu8O2odbZUBcU4lEzg-wyq22ZxM=@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TTd9O1RN8B4tl9ogFkEYOLpb0iuA2NkOP_3RVkPfnEPntd7f33LU8zzKfy1ICXQ1M-TmDVht5GxiNsMDCu8O2odbZUBcU4lEzg-wyq22ZxM=@pm.me>
X-Proofpoint-GUID: Ec6amlVUKCyWNhJA8_4-wtHlbQS_pw-r
X-Proofpoint-ORIG-GUID: Ec6amlVUKCyWNhJA8_4-wtHlbQS_pw-r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyNCBTYWx0ZWRfX/GpZjft42eXD
 2cabxTsTVZLw3haADegkPMGVDWHvEJtseCYFjvGw9loXToOL2Ij2wDpX9xW6p8IDcpEnFjsCHfo
 kAiLuNvKS1WsSzYJwVa/95Ow6KGgR2Fsx7MXIbcds/isxyntPI6xOrJnCuXR0OPikgvoNYm920c
 mn0nSh7198fa08D7QA6nd+quFH2iWKCO8dSY1OUBeP3lgYOIbTMvqv+xFL5w3cDxQBy5cl/gR46
 tVGYbndrmLa9zROB8Z/vCs8AyTEjKsoo29AmrxiCcQwCAFOJ51q0+i08TGucpjYjtE5jrnd/Um8
 aqjqnBflblgvuNCp0TKPYq3GRvuFDiOw+3TfYm9L4oM3PWapsGqomjuMt44tn+efYKin5u3bTAx
 OGcGd3hbBOO+Bz/e5kqdIoL7dCJbqqHBeLA+wIR6ZCUuSMyEnOETuwH2xymQvOL3Un1mPIBKTCF
 CUnpaNZD787KaW2MkgA==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69af8e37 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=j8Hq53Z3awvR7zSZTn4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100024
X-Rspamd-Queue-Id: 74DAD244B91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96465-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 02:57:13AM +0000, Alexander Koskovich wrote:
> On Monday, March 9th, 2026 at 4:34 PM, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > > +
> > > +&cpu7_opp_table {
> > > +	cpu7_opp21: opp-3091200000 {
> > > +		opp-hz = /bits/ 64 <3091200000>;
> > > +		opp-peak-kBps = <8368000 51609600>;
> > > +	};
> > 
> > I'm a bit concerned about this one, I haven't seen it in the downtream
> > SM8250 DT.
> 
> Should I leave it out? I tested for a bit and seems like I can boost to this
> speed, seemed fine at least.

Nah, if it is listed in the LUT table of your device, then it should be
fine.

> 
> > > +		qcom,calibration-variant = "ASUS_ROG_Phone_3";
> > 
> > Just to check, was it submitted upstream?
> 
> Yes, though still waiting for it to be picked up:
> https://lore.kernel.org/ath11k/PqqPCfIvgme9VLMd4Q91JxMhlc4JOTjuWhwXupf3_0cZXUvRy0wijwNfy7lAY6fiIXHXU_buPPbpDM_Uvht3G26146R4szD7Hvp57m7Totw=@pm.me

I don't know if that breaks the scripts used by Jeff or not. Your
attachment seems to be lacking the commas.  It is named
"bus=pciqmi-chip-id=0qmi-board-id=23variant=ASUS_ROG_Phone_3.bin",
while it should be "bus=pci,qmi-chip-id=0,qmi-board-id=23,variant=ASUS_ROG_Phone_3.bin".

> 
> > OKay, this answers my earlier question.
> 
> Updated the comment in v2, since technically usb_2 does have SS lanes on this
> board, they are just not routed to the port I have configured atm.

Interesting.

> The board design is a bit special, the HS lanes for the bottom port are sent
> to the pogo port when accesories are in use, and then that leaves the bottom
> port exclusively for charging. Haven't gotten to modeling that yet, I'm not
> sure if there is a way to model that in upstream atm. Would need some USB mux
> binding?

I don't think we support USB muxing in this way.

> 
> Let me know if you would want to see USB 3 re-enabled despite not having a use atm.

I'd at least ask for a comment in the DT.

> 
> > 
> > --
> > With best wishes
> > Dmitry
> > 
> 
> All other items have been pushed in v2, appreciate the review.
> 
> Thanks,
> Alex

-- 
With best wishes
Dmitry

