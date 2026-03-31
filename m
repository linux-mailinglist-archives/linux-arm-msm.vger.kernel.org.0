Return-Path: <linux-arm-msm+bounces-101126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMHaDOoXzGkeOQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:52:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CBD3703A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 05038302D177
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028EA38F940;
	Tue, 31 Mar 2026 18:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmmjG2Bz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EjBDg8La"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B392037D10D
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983142; cv=none; b=Rn9FE+9jnqJ++WOBDNwDyQVjv7XPy4MAmcAA54+QH+lUzh01cFvBs5g6jF7AaD/aSzuAcLGPLWhJBVUAtWzvST1l68JHi61X0KIGT9UfBLY4ih/jXe1J0mWdF/Mgb3GW/7v0v4k2KVE9lYYzSFzCf9j3lLb5fmXLK0MSOgLNvUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983142; c=relaxed/simple;
	bh=esyvyfLPIrs0NU0JW/OhRru4zwk0TvcQSIFluQT5o0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FevwJqIBaTME6K6tA3mlnEH3oFoGRZwGNlWV/PvW0k8BEC+PFXYt2zbh7SvQRg4tWtvny3TmwGEluM8sIgHkfCDQqCNTdMk6AXhctb1xp1qx0+XhQfh1JTUV+qmzCTHSl5jvCMVTrIbyglBzH8CGuS99pUnA0pKxsiWGWWMDmQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmmjG2Bz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EjBDg8La; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VIF6Ba718548
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dAdcP6P8LLZwwnnFtZC8SPsI
	gcRrnIo9fRrq3LWAiZg=; b=LmmjG2BzUb326+OuUIduTXexhUhYxYEl6HxVtTwj
	0a/WcI0b6uZE07APKRECekoiu/Ki09vNzSdYkXJIumfiO8CCuOgSYNUafAXYZ8Of
	zMGS8PDE75rpD5YYeo47tF4YgAi/r0gHgqsnJBY7ODPu1S5LYUtAo/d6eWZihcv0
	2wFaqtdfdRHVK1ippDu2iO2b1e8Ms9hBm+mw9Ez/A8kBeVAUUmYA4admDGGrLZ22
	Qr94r/cNMxGkDCuYOwgrEkHEbubwppou23FE/bCVywXyErVBSkuke68P5QrPwZyG
	k69ii72h4QyqXlOGm0lXnZzwT/drIYINogtaa6Gc1/w1gw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kcsr4g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:52:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so156983841cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774983140; x=1775587940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dAdcP6P8LLZwwnnFtZC8SPsIgcRrnIo9fRrq3LWAiZg=;
        b=EjBDg8LaBme+v4CwBxzk1gC5wvYmly1ESBxGPp6rvdzowxPrI0Eo6r/6Q48V3aWdcW
         sqesWFzf2bbQnOWCOPF/mo/6W18idAq6/Lyx1o7Wmbp+ed7g9UT19/sUqYRfNEthAA+p
         eVywL6dXzxvezCQuja1nFLe8JyOwrCPIipyV17ZVDrzRh81CaJdAw36RJs38Uz7jujBQ
         8HoZDZtTwAdpEbNMMIaxdhGMDKHw8p+ncEiEhW5wP6tGjH9ejgF+yJxrHgr0JRedjQzQ
         p+KtqWy/RxiAeJ9V+4f6uFeaekrnbIFl9TrnT/nBUjyAnuriOBlhdjBubEZXuDchntgp
         4+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774983140; x=1775587940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAdcP6P8LLZwwnnFtZC8SPsIgcRrnIo9fRrq3LWAiZg=;
        b=IxgH/Gosa+8RV+fpZMQhkKTFTuadVo5BZIlet8dOFEuPGdgaqqOAWNC3gVTe3cI76z
         PEwRmmrlRkiomSeIOfunMLlu3nSiVJl3wxPiZkKX7WC6VZTSOCVuAlR0x7eJaL4x13lr
         0SmRTfrGAMo/u/NRJB1c0OP2V5qX2xjcr2e9i4vGNdi4NbTxppVQ2PPFXXMh+zE3soM4
         vL83ur9CFc/xEzmbwajalp5TIe9eceq0zlEWGrbd+3NnrXckTAOVjWLpLOV182c8xPz1
         mqlGxOf8Qq2KPcKXK8r0S0uiSg335vyGPZAnyhIcpiRickMzMcUYREP+P/C938vsD3R8
         ORWw==
X-Forwarded-Encrypted: i=1; AJvYcCUtNoVF3p5blJyXtPEXab0pLVglzKeSTZeHHqa/5XGBFd+Hd4OhSokHZobivZ1d+dbaD2KebyHmBTyAkWUz@vger.kernel.org
X-Gm-Message-State: AOJu0YwRiWto9wutfiOU1aPQ1zqujuFj5kuFlI8d+o+u6kowBPNGDbVv
	52R4tx9PkbCCmio+PXPg7z36lTraFzVp65rKYhtO1a/DxngfC7nrJVKAinRHkC4uyO9DJEsyRbt
	1HbdJkkinQy/CwLHDwSko2U7hhiAlhJquvYtFntP2/0nFbxvZr0xglOPgbYrMeGplGDMg
X-Gm-Gg: ATEYQzxuHPgzXnrPaARJMBdb5EhzwMeduW2AFg5kYJKyrIjCBVx0MxrmlX6SbVkvIiE
	c+AjtjMF7C8f9Sxtne3XvBQMxF8TSOA1fg7H14dYUcZRhT1xWc6zQVhK8uIom2yrPT7Br8PcJVx
	+hGSupo+3E9XRIyHNmEOXIeOJQBbeqxG05WdATG7zhcsdrPggZ9/RWoIqIMX5fBg1sbba4Btw3c
	i7bAjNnkZ77PEBfEGpZK+kyDH/l4Z7r54bqZ/P2ge3gMJN/8H25nlMVEoSiNQd7bb+CzGG+m4hX
	H3ij9hgQpkGHKsjzG2s56ZM0Ic9kQkom7+73IWmN5iycJrJlvuexWjF5I0S0SewJFhEKjoM2aIV
	1XCw/RxD/Px5FEMjyqDd2HhxaqPScs2zrdZ4t8bNG7neGbgokL0XjiPf39fcmjcZKWJCLFYOCZI
	E6994KPFqf7sr593LgvyybVIJvNy62CicclyI=
X-Received: by 2002:a05:622a:8316:b0:50b:404a:746e with SMTP id d75a77b69052e-50d3bd576bcmr8848161cf.47.1774983139711;
        Tue, 31 Mar 2026 11:52:19 -0700 (PDT)
X-Received: by 2002:a05:622a:8316:b0:50b:404a:746e with SMTP id d75a77b69052e-50d3bd576bcmr8847801cf.47.1774983139241;
        Tue, 31 Mar 2026 11:52:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c2233101sm84946e87.49.2026.03.31.11.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:52:17 -0700 (PDT)
Date: Tue, 31 Mar 2026 21:52:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 4/6] phy: qcom-qmp-usbc: Rename QCS615 DP PHY variables
 and functions
Message-ID: <oqnpl5l35racn2nagd7twu26u3flrjoeo32d5vk7gv5dcr3utv@v5onmomf4su3>
References: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
 <20260314051325.198137-5-shengchao.guo@oss.qualcomm.com>
 <ckj6c2rute5bzachye3tl6hs3fgw7wtafoldsdutkszxjc2vsp@nplvcpzqzwfn>
 <abVSJ2-mMFf-rsw1@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abVSJ2-mMFf-rsw1@QCOM-aGQu4IUr3Y>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE4MSBTYWx0ZWRfX4h5wwc5JSFt7
 /KFUlrGEL4swlwy1LiUAkb1V+RIKD7PfLwGTnhpLQHFrOwgng33GvtsKzaDs7GhTTXeZ+lj8qo2
 Mfkq4zgQ289r8NMLfhtWI/BlnHcF69Ig8SRChrIiXb+OLubo2vtAt7tLvJt65kCCl1xkFuBmu84
 BHjEuUKyz8u84vRVcd7CbfrLmJwiu/n0B1D3jXQ/pzgNqS8SZ0CaLAdBpNLBY90t3dyVIC2V//6
 5c5LN3LbJGoXn5hVbTWknN+3kzPp9Zp5Ve5AKaQwd8mlVumYw+HPpkT/UAa+8o8Mt7ey++Lx1jw
 QdmRBRlQ/AqquRWjWXtlaEPw4o/QiPp/bDCQzBYLz68Z2WfB0hgrAPWn7PF6GG9MtIwVqBYhNi3
 VwBOI6ysx7fT654k2eYhmjv2ktMqXCIk0kU1kmkeTrsL4/nwhicFVkP/FyFRJmDSEitXN11HpVA
 egSkWZYfRqGHpme+hnw==
X-Authority-Analysis: v=2.4 cv=KNlXzVFo c=1 sm=1 tr=0 ts=69cc17e4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=JfrnYn6hAAAA:8
 a=8bBNHPrwHrJWoedWoSsA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: _lnAUGDELP0KCgZ9zoLL2nIAa4CTKYkQ
X-Proofpoint-GUID: _lnAUGDELP0KCgZ9zoLL2nIAa4CTKYkQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310181
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101126-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C4CBD3703A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 08:18:47PM +0800, Shawn Guo wrote:
> On Sat, Mar 14, 2026 at 11:14:56AM +0200, Dmitry Baryshkov wrote:
> > On Sat, Mar 14, 2026 at 01:13:23PM +0800, Shawn Guo wrote:
> > > Commit 81791c45c8e0 ("phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY config
> > > and DP mode support") chose to name  QCS615 DP PHY variables/functions
> > > with qmp_v2 prefix, by assuming that QMP PHY registers are versioned
> > > as a whole.  However, the reality is that the registers are versioned
> > > in sub-modules like QSERDES COM and QSERDES TXRX respectively, e.g.
> > > QCS615 DP PHY has registers of QSERDES COM v2 and QSERDES TXRX v3.
> > > Thus it may cause confusion that qmp_v2_xxx table and functions access
> > > QSERDES TXRX v3 registers.
> > > 
> > > Rename QCS615 DP PHY variables and functions to be prefixed by qcs615
> > > instead of qmp_v2.  This better aligns with how the driver names USB3 PHY
> > > variables for QCM2290 etc.
> > 
> > Well... I'm a bit reluctant with this one. The driver needs to support
> > DP programming on three platforms: qcs615/sm6150, sdm660 and msm8998. As
> > far as I can see, most of the DP setup between SDM660 and QCS615 is
> > common. 
> 
> In that case, could we just reuse QCS615 DP tables/functions for SDM660,
> just like QCM2290 USB3 tables being reused for QCS615 and SDM660?

I think so. DP on SDM660 is not supported currently, but it's mostly
because we don't have PMIC support.

> 
> Shawn
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

