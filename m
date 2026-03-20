Return-Path: <linux-arm-msm+bounces-98900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UE+aLxoNvWkO5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 10:02:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DB92D7AC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 10:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C4C330BC794
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF94375ACB;
	Fri, 20 Mar 2026 08:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2Nf+c1f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CdLd7mOE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D343B2E06ED
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773997045; cv=none; b=CxEW2pn8R4kK7puNmlIDPZylv88Cfv3PTktXoW04OV52net/f0YTmQAOSFoQ78igbNiF4WvmyUh4X74QLEhMtWyy8gRacTalPFp4cOFFI/op2a+WuHGr9PvehLJy4pgea14BvY8+WFv7hYB75m27HVn0vTzzzolMjEtFwlx9HbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773997045; c=relaxed/simple;
	bh=0eVn9PlV0DVisI0VOhMhn398u08OP/GTFsHjPBGJEa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgA1nhtpjU6JQZv7bThGxQlNtvExY/SP1fPQKc6bOZ65mLNQgMDhLrkBl6xydi0Z+MYAFlVP0mthKk74NGX9Uaf6YgJ9xqTWxuQFpEvPZ1w42s7H4WQOC6puLlQ1c1vZJqa47BcI3VBpX1vixi/lDE6DrOqpifSzNXMt8WoCD/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2Nf+c1f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CdLd7mOE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2Xl1M2253897
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 08:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rBnbaYgxAav7MVcCTEesQ+9H
	mlbuytA+j7U0xxuFY8Q=; b=K2Nf+c1fm2H0mNfCKqtUSy1FOYrxJMPApdVXDJpz
	PY6on8DtwyVuFno6T4iFkuA4MHGzG4Fp7nBtv/dyLgaWhyHOCOruNfjXMONads7K
	kbPplWyKFNApAdeQysropcMACcJ1rBcYPKJHGf7Cq/b1ZM0uO1AOsIPCH/VvDS+p
	g05rGM4dpgyYdKnWseTXB79qxtKG0DX+5/S6zXOPzwv/E1VNwtmld0x1Be4f6rnU
	Xalmt8sD/X34L7rKunJrT9kkFle5UoodIqT73l0BIWx8vrQ7UVyPUFs3ozSVWNdD
	ognVleEqgcXa34GaOEregZHaiynsdKpV6zG/iw3azu3K7g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0mcmagpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 08:57:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090cc6a7d2so33582131cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773997041; x=1774601841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rBnbaYgxAav7MVcCTEesQ+9HmlbuytA+j7U0xxuFY8Q=;
        b=CdLd7mOEGPB0ENcESiw7hy58xd/jzSw/v5dnBhpmFLJhii8DvT6ixJm/3uub/tCkpk
         m6cyJSWd5rbevzNl/wq/Acea3WookqPA1xIwHK72fc8Mk4NMgeYi9JtVTNk46V60PhyL
         HomlFE5lJa12D6IyfE+ZX8rynVQi0Zk0BvKW+Jq1NeJKvst3oEw6HMySiyoC7qFdb10g
         VBVfzZ/2qeg8jnXH5iZAsasOQEcGP1/rkeHioZkHZOj1RX+fjw/Kp0c0j8a/SfsHeYYm
         02L1HqbGKXuOf3LukoE52X45Hxlp5lKoe2t4UjamhWUErjUup+SvfPCewNm4s+7H+Fdr
         nVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773997041; x=1774601841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBnbaYgxAav7MVcCTEesQ+9HmlbuytA+j7U0xxuFY8Q=;
        b=p6FiB8ju2k456ZYf2LxnkvN9dcNL4h8ingzOXJGWlVdZnpTv2C8Zc0xb4Tcw09zmhP
         +Qd3B/mKutGHz7OUTPB0WJffIYmNNOKlQCXAVoYKyzs4bjj58eV4WS7LmcUJiQf5mG/B
         TT8/sjV66AYEbMGu8kY0acgIqXMaKrC9fNuKAt3F4BrfWCE7REzwgL7ZgDFOYdO9o5oN
         RePmQi2G1gEBVv5MaPyA66Xo740A67U7P/MvT7bQI74hx/pV+TpHKYAzj5tXNlBczNtV
         DjPSmeOj8/ktvXGpo0NTQc9dJNFwtfwdwbgFejkGOOmXJr/dEOwrlDOKjrCTyRKMFRcS
         1tsg==
X-Forwarded-Encrypted: i=1; AJvYcCUMIKS+c7WsJe0ce1lvKHmEkO8yfWtt+Sh+9cNPJCs2X3ID6a1SZxZa2CBIgyOFoyI1/drbkbQKdNdCMqUR@vger.kernel.org
X-Gm-Message-State: AOJu0YzIY4Cjba+ub/kWWgRQkas0/egJnzdVSUNhje8Vh7Da/EUt4xLk
	pfB3xFzdMhsyqfvWC+XndS6ZMVz3r+Rs2bwH6rkkvrmEBth9FRcD3J9ynFlxJgCqHf4tzoOpWFP
	5pdCp5OvsiSUVxjqEmYy9kwx0Yn+w9Z3ezvYq6Co43KZ5TewUB5lSqe8NIvAz6WxW7D12
X-Gm-Gg: ATEYQzzNAliTS0bGOEq3GtbOnfub++sGHeRDkDqd2QOl3LkLAvx04mha/gOwF1Md1Ak
	gPaKRdRbsuWY+Mw8rBzBNaUkseAtd2rjIi2RpM/b9nSt4PbybJu/R8T/9fJedLGDQecgProkN4N
	kBllxR4/krSpwuDTyA/NZ07lJvmDOJoXtZK5mochKjjnRI2Kfmct3vSchua83FBRHUdIdtguoLc
	BNr82Ntdrub3YvxHDzQTkTlTU8slQ0qBQ8x0EOv0FwzqmZXq90+MnaaXqHtPziPwZGub5+vGI+E
	Y+kASdMHnMqw4Ju1FHXphI1K35lZTyINjCi7mwld3NmuXQgWp+s5lyJ7f49PK6ANAMk8oVzHbOF
	6gl+pKVnktcMo7LQUD9YjilwFjAzGHfFspA==
X-Received: by 2002:a05:622a:728a:b0:509:1be:901e with SMTP id d75a77b69052e-50b37568471mr22479861cf.53.1773997041046;
        Fri, 20 Mar 2026 01:57:21 -0700 (PDT)
X-Received: by 2002:a05:622a:728a:b0:509:1be:901e with SMTP id d75a77b69052e-50b37568471mr22479601cf.53.1773997040458;
        Fri, 20 Mar 2026 01:57:20 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6425eeb4sm4680107f8f.0.2026.03.20.01.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:57:19 -0700 (PDT)
Date: Fri, 20 Mar 2026 10:57:17 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5] arm64: dts: qcom: glymur-crd: Enable keyboard,
 trackpad and touchscreen
Message-ID: <ophmftetelsmelaasdddans34xzvy5htxpphvsowasp2eatt75@gy7q7pv4swjr>
References: <20260319-glymur-dts-crd-enable-kbd-tp-ts-v5-1-4a440594348b@oss.qualcomm.com>
 <funq3yjordebprhusdkkapw5m4fuqpavhyeguoo7tdffv2ebub@ozh5c7a3py6f>
 <pnd7eeijf5cmo7nmydsd7bvuxhhqbkup6xv2fgpb5gfwqyfnf3@dfr44uwneph7>
 <jpnjqvaezrqv7l24dotzbyz2s7scyltlhn7xhwtb4akkrggkyk@5epol7lyk6wm>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jpnjqvaezrqv7l24dotzbyz2s7scyltlhn7xhwtb4akkrggkyk@5epol7lyk6wm>
X-Proofpoint-GUID: TAc7tvSZJAvn_OPdhjF8veheOL4GT-9c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA2OCBTYWx0ZWRfXyRvcN1QeFLD6
 6vLMXFnyNJ3b0cynoak0hqAC3oNCJ7F3HltHapxkZTqZqSr9+OD3pC0VFjg/fNuLoGM/XjeGEWb
 a7sOeQfR8X1sGGYpOTHkrF7nGpLl8PD1JSDhfUmw2AOof6JnLQd7CR+7PwL/V6rP+G5oHgzFeX3
 d4DWW/VWCX9xxy8r0hFPKiXSQJ2kdId/ZXhsNL3Y1+3riuvfPZdKql55aUoZOw+eIJgx9kTkeN5
 XpZSvMCNROgsrlNFet1bGmdsEpTBTABeOEhsXXXEeV0nugIiYg56WPxdDk4aoi1QeBsMq7Zqs4l
 XCsycpUAGVikWzEXOVGAEtwl3MpR5BaH1/gFmXT2AJxcabzwoEDqkVAE4Qr80kTGYWZkAh6+NIq
 KzjXbx/UGNfsm76cgLLtQy4dtVeulnR2cW0uqgs8UR0VCq4vsaZBui15AjuvoijCU3oOLI1QTIh
 Q21dnQZrCZ/rtymazpA==
X-Authority-Analysis: v=2.4 cv=BdLVE7t2 c=1 sm=1 tr=0 ts=69bd0bf1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8N1ySFuS7BdRKEUra64A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: TAc7tvSZJAvn_OPdhjF8veheOL4GT-9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200068
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98900-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74DB92D7AC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-20 01:52:06, Dmitry Baryshkov wrote:
> On Thu, Mar 19, 2026 at 11:11:18PM +0200, Abel Vesa wrote:
> > On 26-03-19 21:49:07, Dmitry Baryshkov wrote:
> > > On Thu, Mar 19, 2026 at 05:30:48PM +0200, Abel Vesa wrote:
> > > > On CRD, the keyboard, trackpad and touchscreen are connected over I2C
> > > > and all share a 3.3V regulator.
> > > > 
> > > > So describe the regulator and each input device along with their
> > > > pinctrl states.
> > > > 
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > ---
> > > > Changes in v5:
> > > > - Since this depends on Displat DT patchset and since that one
> > > >   had to be respun in order to drop the non-merging phy patch
> > > >   dependency, this one had to be respun as well so that the dependency
> > > >   tree is correct.
> > > 
> > > Where do the dependencies come from? Would it be easier to merge this
> > > one first? Or are there overlapping supplies?
> > 
> > The USB and DT patchsets were on the list first, so it makes sense to be
> > merged first. If this one was to be merged first, the other two would
> > have to be reworked due to conflicts. Also this is the order in which the
> > support was brought up. Also, keyboard, trackpad and touchscreen don't
> > really make sense without display.
> 
> Well, up to you. Let's hope that there are no additional delays with USB
> and display

The latest version of those two patchsets are ready to be merged and
have no other dependency (anymore) than between them, that is Display
depends on USB.

> 
> > 
> > > > +
> > > > +	ts0_default: ts0-default-state {
> > > > +		int-n-pins {
> > > > +			pins = "gpio51";
> > > 
> > > What was the sorting order here? I assume you had one.
> > 
> > The way I see it, it should be based on state subnode name.
> > Which currently it is.
> > 
> > Do you suggest some other sorting order though ?
> > 
> > Thanks for reviewing!
> 
> Then ts0-default-state > pcie0

Oh, right. Will fix that.

> 
> I think the recent recommendation was to sort on the pin number, but I
> didn't switch myself to it too.

Doing that looks odd to me. When you review DT, it seems more logical
that sorting by node name should take precedence over the node properties 
or even worse, their values. Not to mention that that would become just
another weird exception.

But maybe it's just my OCD that is unwilling to accept such an exception...

So unless someone NACKs it, I intend to respin with the sorting done by
the node/subnode name.

