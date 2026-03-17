Return-Path: <linux-arm-msm+bounces-98219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4K/rM71wuWm8EgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:18:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 392B22ACD70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C28D307D4E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92963EAC9E;
	Tue, 17 Mar 2026 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXWlOqt+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9w3Olkd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90E23E5586
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760224; cv=none; b=h3wUtl2eglrkXeb2jDPajOzfOnlChP3E/OO7BnrtkMtW6GIVOTrVQcAlrzREcB6aerKjz91LCqzWBrdDSAdyHxlglVsIcI6CE2W9yyLJYEHtPV57hXQja1Z1GucTT4mFcQ65cgeKucsr8jcSGW6La+pPV0Ki3YDGAdcylxJrGVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760224; c=relaxed/simple;
	bh=TkI5rjzRj/++ObWlEtw+EEFJ1VEzbmWSoPt4mGCVMhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cebkpwiGjQPpRBPyhu+zmw4+XGTPnlOScQrFIItn+Ozqy0yY4gNUGsAuoxIkCX9L7poerMD5OHWnvcq8t5959lzJXx+DO5zSwJbclbjKmaMzx4A4BzVMWhqwlv2itVxoBHjCKw5yb95bwV2lSpdntfeWJjE8jXSL5tByORydgQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXWlOqt+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9w3Olkd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HAk00Y254254
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bl+pUfjvQ2r67qQM2qyAgAwc
	trBM6NWEGygWMFlKE1w=; b=jXWlOqt+dhQRRF7zu6QTyHEDSJ8FmWQjMa9ozKvh
	nL6hIl/BE24tlFtljmjEYjnCT4KAIABw4Zc4d8tS7Pdb+DX2tAXPIjUEpI1inZgp
	9m7Ae8fpOfiA3ojDdxaSmvEfdVeGfnWv7RUbWhYtwDVetyeXvog1rSPBGcdQhAOE
	BlSsfIhSvHD6D4w80mtwZCftosfXwBv6W62C/POWGvorzpdGjOcZqBbo6KRlYLke
	voh/ukvVcjmx+JDDiZh51nUXFarDUhbpkn2nXDH/w+ktKrd1C8JTXhP2LMd3QH4j
	XxfBbE24vyvmOZniCbzRq+pydfIRFr8wMBPY9F9P2rQjfg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy5g8gxen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:10:22 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5fb6622ca5dso7507512137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773760221; x=1774365021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bl+pUfjvQ2r67qQM2qyAgAwctrBM6NWEGygWMFlKE1w=;
        b=U9w3OlkdXWL8BOEZOaikW9BwEe0tTHgsGijsEbuVcD9QBU0FzXNz8piz49xRIJNJ4v
         lRO7stRr1oxnU81olfQtjlPXWFeR3IQrsc1TZA5hslctTKFdHT3XUW/hEw0TouwI4nbe
         JE44Vco7apilPOClk6ehq/6jf3BrFbdd7Ts8OIJnfkol+5GFu0t5PyeEDdn14jaywE1T
         rIwLe6HB//ga+FqJWZsuNup8dzJZyj1uzIU0piz4TOD85ULhXPpbm/Rhjz2OvbyME8A7
         48yISSkEatsQ5ZyGakZQzK5tm7VlUpzo8g7imElM14oULHvjYahHkTO85Y2bKC8WqsdT
         Cxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773760221; x=1774365021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bl+pUfjvQ2r67qQM2qyAgAwctrBM6NWEGygWMFlKE1w=;
        b=ISlfAm82RaOw6SBXIsBkqvN8PtyxRD2sZcnGdxx980e7ICdiD8Gj8B8MHoKXbgx3in
         C5b0bLf6+/RAJtlE363mkxyklAoaI0Ul7e2+uAP7U3BByC+OgkvNe0MlPCuBMhWGBy7P
         dusyZXmcYJ3Qpdv0DHktpezgtb2GzrpXNHoI93DNAa69jECUbt+JmHbK9lVI2Exr3sM1
         LEg+NvxPiaMH6Qa70KUu6yu+NF5mk4gnmP6PRyQVfz3fNlzEhdleU5KPuiRw2sZRwHGR
         SbpXNMvCbnqk8HnVnjEJD04Yo/M+zyKJRyPN5qyzMOaHg4tlGRg5gQkxeKXtFg4oyKxz
         Kaxg==
X-Forwarded-Encrypted: i=1; AJvYcCWdpVDNtufXQWRWmHmpW2o9YfR3DAc4yWfmD/ZsiHDrQ/Wy2fjKDEZk9YhZ3TxLKNi7529Q6qjcvQW9L+g9@vger.kernel.org
X-Gm-Message-State: AOJu0YxOJdboLW+W6Jt2P5m3zwEuyYiQsBGekkjOye/4XF3cG/D9JeXQ
	kk6WLlkiKn7TF4VMKDw9dWBs0JS44k2QTnZ/qvcwNrXjn9G5i2sjiHscbrO3fwdbh7prwniNiiI
	ALp/2a9zsHuhX/rb//6ejWOFOz3cGbGTzpZVonYVS3oxyWPmvcwjJ8+6S1YcybKAkD6hOQO/iVp
	Xy
X-Gm-Gg: ATEYQzzGeo/dnEC55g+bZNAUMwMLfLHkC1mHhNcEF0lEXIo189RqZurbHy9sr1rWJTo
	VhFXWffh7Hdz0XlGU+ug9IT17KGvM7CwUewJnuUx6mMnpc2Z5akeOM4pD87iBlhz22TxQ4gM7ZS
	3afryC5TnEfovnJLlPth6OGeyISYjTYuNVRykUzdQG/nLNrNTouv4qLG4abxY6Tc0lTdk+4B0cS
	Ihn28ggFv+reLh/G4JcPVQCN5Z4b6BD9QLuvSz/EgR2BXq0XNOlYWTaqs7RtCXscFdbGWDoUr+S
	5ZjbLrgk7WG9i+WGpHOfLrvq2pLsMwjKGjae4a+cEImO3//AWEuiFQ6/7ogp/1JIilghEvi+Cg5
	vhiI5Z5t5AnX/BAtDw4XhViGLbuoNxrjl3UVcWBxKt0o0SBDGAU0B3QY2hFcnpp4Sxf59YCBk+K
	3Tja0UL58Y3s6nKE11W6BDeOaE90Sn12dfnEg=
X-Received: by 2002:a05:6102:3f01:b0:5ff:1130:bdad with SMTP id ada2fe7eead31-6027d084de4mr49953137.6.1773760221006;
        Tue, 17 Mar 2026 08:10:21 -0700 (PDT)
X-Received: by 2002:a05:6102:3f01:b0:5ff:1130:bdad with SMTP id ada2fe7eead31-6027d084de4mr49941137.6.1773760220489;
        Tue, 17 Mar 2026 08:10:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33b95sm4205925e87.15.2026.03.17.08.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:10:18 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:10:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: eliza: Enable Eliza MTP board
 support
Message-ID: <3twoflmcthhja6sbj2jg5l4dm52zsvfpoajlkolvv5baxqes3i@rjw7kmewynax>
References: <20260313-eliza-base-dt-v2-0-bd91367d860d@oss.qualcomm.com>
 <20260313-eliza-base-dt-v2-3-bd91367d860d@oss.qualcomm.com>
 <sf2e5rld6oiv7piqq277ppe3xqrh7q6bz2qntekzusq6w56rr5@tc2kdlnocul4>
 <vpoq5lznz3jcfiumsfgdskspus5nzotl2utoaubidfktnvw3za@txma7z7m3v4f>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vpoq5lznz3jcfiumsfgdskspus5nzotl2utoaubidfktnvw3za@txma7z7m3v4f>
X-Proofpoint-GUID: kfNZMHcypkiA21ubTDC9sgGL2r192KnO
X-Authority-Analysis: v=2.4 cv=EeTFgfmC c=1 sm=1 tr=0 ts=69b96ede cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=6lQKBLoky0tuSWqO4iAA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: kfNZMHcypkiA21ubTDC9sgGL2r192KnO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzMyBTYWx0ZWRfX66gl/E6+Jrk+
 FkLOFH07YkNb4jQPHVTx4QxQtAbloZTy234Zi4Ygqk2Ertm05MMRZgB33pqRN6ArwhQCfHn53zu
 Ok3wcWRysqcXEXggLePQuZyvmzHLUcQhVGUz3vCoz/YG6HJPsTbVs1myVJrzWKCfVa9bKBLxJhT
 swtX9Ray7SLnmUEPW69LUQDPg6TiGpYzQyLgCm4aG4OsDfCyqjcbuC6x8uAWxJzghSYv/sTk1ri
 DKKBeGUzmGvtzkDzKzbaFW9iDKIkMGuToxy2yv5EET9hbvrQYHPIpuwVlKzvhK/MliPyP2d5CCe
 JR6XwNL+njItcfgi210RLfKRswYB1hNNLzqluyOp1aS5B6FAqRlHGHK+TIuw3GbYM66Q9dq18qo
 X1q5Yndu4tgs51KggcorO1IwmfPijguX15c6dFZV1DWbH90oJMOBZ8Q5PVqogbVuxU257Yohbwl
 Jx6zyQA3GZXt/Pdc48g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170133
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
	TAGGED_FROM(0.00)[bounces-98219-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 392B22ACD70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 10:47:18AM +0200, Abel Vesa wrote:
> On 26-03-13 17:51:37, Dmitry Baryshkov wrote:
> > On Fri, Mar 13, 2026 at 03:23:52PM +0200, Abel Vesa wrote:
> > > The MTP is a one of the boards that comes with the Eliza SoC.
> > > So add dedicated board dts for it.
> > > 
> > > The initial support enables:
> > > - UART debug console
> > > - Ob-board UFS storage
> > > - Qualcomm RPMh regulators (PMIC) and VPH_PWR
> > > - board specific clocks & reserved GPIO ranges
> > > 
> > > Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/Makefile      |   1 +
> > >  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 407 +++++++++++++++++++++++++++++++++
> > >  2 files changed, 408 insertions(+)
> > > 
> > > +
> > > +		vreg_l12b: ldo12 {
> > > +			regulator-name = "vreg_l12b";
> > > +			/*
> > > +			 * Skip voltage voting for UFS VCC.
> > 
> > Please continue with 'why?'
> 
> Actually, I think I'm going to drop the comment and add the voltages range
> in here.
> 
> For some reason, when I added these, I considered that if other platforms
> are skipping the voltage voting, Eliza should do that too. But now that I
> took another look, I really don't think the voltage voting should be
> skipped at all.
> 
> Downstream does the voting as well.
> 
> So I'm going to add the following in the next version:
> 
> regulator-min-microvolt = <2400000>;
> regulator-max-microvolt = <3300000>;
> 
> Thanks for pointing this out.

FWIW I consider boards with different UFS PHYs to be different boards
and so there should be an overlay changing the supplies for the
non-standard version.

-- 
With best wishes
Dmitry

