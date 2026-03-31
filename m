Return-Path: <linux-arm-msm+bounces-101019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKTmH5Ccy2loJgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:06:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F8336790C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1E3830B8270
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEA5387582;
	Tue, 31 Mar 2026 10:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFXevurp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JAnyMtV0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6A539BFF0
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951219; cv=none; b=dUGk5vHee47/o1MbxJRG60gWLaWp+Tu8E4Q33Z07Se1pYuiOk62ROdiFX9Y3FzYym5Gsv0Nk5ZQB5iPegPIm7HNPPChaHO5bmJs0JBgkLwlQgyott0/ZE8nP7lQdcL7e4fqwsh1KWAJ5sZcM9pN8dEN7ABvQUoGDlAMqeez8Arg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951219; c=relaxed/simple;
	bh=VioyxeW0D3rtXMywEXxcly1cgOobOmayFnNJNdPGVzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UN4ia7oiGUvysV/QSi3Q9yV30xpw/frgfcjSeDahhv5bfFDIaojmDMDGsZzLvIyOWAHPUk8P0s7e8zADmFxknILoZ+i5g/RfQfzmGAHLBwAsuR8ODHMh+oqME1b2GQVoeMdh5d7weowLS8JHbBf/3YzimsmytCPvzGNiVGE5Eec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFXevurp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JAnyMtV0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V91kbB843037
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f0e3aQFphquzOjRFJVGvhf3/
	JD/EB8IFSfQet6yYplU=; b=dFXevurpX1rnqz4mI1zfqGDdx8jPkVGB8b6WloyC
	lg+vEPijaU+1EivGWCAy0YaKTaOR0+USeBjSj6sUofhxCYC6bpeCV1Vd/HMFkIos
	1bINBvlwDUxLO1KJ1bnpTFeg7V3UeSN/lC5e9JCPLwfznWgX4pZL7s6oKnk1fHNS
	EnX6CEqill7r6M1ngkjdJbkvUThpRznJVsAvE04ctB80QmRYFTrI7Jkc1p6rZ98C
	dFQxoe50OVT7siYK5A8CPaf/jB4dqhMrPipFAxtgC301QgkDE9UYVmMQiLZ53pXs
	3zOXncxD9b9t1M4c55gxALsTH1WwXMszLXOEelgY/pTKGQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d86nt9esy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:00:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so6832125eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 03:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774951217; x=1775556017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f0e3aQFphquzOjRFJVGvhf3/JD/EB8IFSfQet6yYplU=;
        b=JAnyMtV0wki3OXIgpTyHht6lMpe0XkeTATB46XG/TjDElbOfj1anLiVLWcEcTFvGJ9
         sWVQN6nTGjwsWopqv9+c//ayTnol5QNYn/bFYbOPZ8wQkZkYMJAAnofHnDAMIa/2hGZT
         /9uIezFoCF9Vfc3wIxDKKA7K+QPhe5Txw/d85IUNFiLFd+a6dJInsfpAaj3nYf5UZlTW
         494UzmH+52Pl6yGSG44pqvhsTmykFarG7878vrz9QeyDAZU/vpC8VQpMPQL85n6BDtT9
         5/LEyz4GNkQwcoHRI+iC34yUUPUUvqwZFRLQif2jH3fDM9Z/JMtGcK/hGWgcIl7UqsRw
         KWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951217; x=1775556017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0e3aQFphquzOjRFJVGvhf3/JD/EB8IFSfQet6yYplU=;
        b=PuGemLOWXWNTtZCw5sJa833gJ2cR6SKKgHyG6cii0TqnWXIrOCMaWV1Fa7cjwixD4H
         u+kFATExvIF6QZIVK2zBoaJHw1I35+5YaBKdVzMk9UquCBDBVKOQ0XjmRZlgscuM4fOe
         YwqpFMP8kXXT2J7xECGd0oMmVS2Wgou/XOBeDMz43E9UlBDNOQrDGJ1awmNEqu0YAxqi
         JZjzzSYFfdqMDbb3Mr3cU0v/AbrktSMEJXcgdP5PwMy0JQJBMJb9RUPA/0BTNUbfiz1O
         G76TYsFPQzgN+HLBk84MVmP8J+htoSoLML4xQ5mOTBh7LK6yzHMteSaU6AREgu1keAdN
         apBw==
X-Forwarded-Encrypted: i=1; AJvYcCV62JQDHPGNZdGvqfuGyOE8tU5Q5GQkI+SrU9Jl971E/KkfzSQt0V94vDyvuHSRdqjH5V7zkEXv2cn0ONzh@vger.kernel.org
X-Gm-Message-State: AOJu0YxmRT59ANpvzOWbgMveHjC3VakMCxKsoOBXhOkg9aOFSnI+1lqM
	7ddBmdq8fYovZkZgC3y215aVxWmAdCLiDgh/8dr5Cm9hEbZnjP0tn1Xoz81hgaIEhWsnSHJAEUo
	VPkqW/sJFavJ/CNqw6nsi7HCNrg6t1GsN44cx+nKTjkBFHnm6oHXcgfE/7lAKw1Cn8eLrVPyA25
	myMAo=
X-Gm-Gg: ATEYQzwVPcYVRisCmKVgpbAfzh7uYMGHia59ccSCsVDs6cmcEXmIjS1ZdQcSfgPpbPt
	QVPQCpXkl/30HNhvYDg/AR1jq2Qkvn2Dxu5sC0wZMpyOGhnGq4JYhDvSZLHVFIyBDAUx1I1ljtW
	QIzFm8I5lju87Nyg369v9uJ6kFO71CCyxgp/SIaN1ZUY/D/Nr8dANDlH+aa6pP6O3uCcVPxjnFi
	qtqADV2/Y8q5yuQjOhAWVmCmkZAm6ZU9sOc/VNpKIfydFvC6Dd0KPVs2pE2H2/JqbshGw2YoLp7
	+8Flr1ll1Vl6KPRVooCHbqdfGpWu5JkowGN9UnIL57WjZsqwjpmoU8Kt/9e5lg2IG90XU1M2+iR
	eXzwXo60+Eagyf4+sEqsEP49DrdGb4IHiFB/FxzqtPd3MF5LXK0FJEQ0Vd5v+iEaYou7K
X-Received: by 2002:a05:7022:eacf:b0:11b:e21e:5653 with SMTP id a92af1059eb24-12ab28cb63emr8441183c88.19.1774951214605;
        Tue, 31 Mar 2026 03:00:14 -0700 (PDT)
X-Received: by 2002:a05:7022:eacf:b0:11b:e21e:5653 with SMTP id a92af1059eb24-12ab28cb63emr8441168c88.19.1774951213980;
        Tue, 31 Mar 2026 03:00:13 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ac09e3872sm12108788c88.13.2026.03.31.03.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 03:00:13 -0700 (PDT)
Date: Tue, 31 Mar 2026 03:00:11 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arch: arm64: dts: qcom: Add support for PCIe3a
Message-ID: <acubK1ITm9r2pixy@hu-qianyu-lv.qualcomm.com>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
 <20260323-glymur_gen5x8_phy_0323-v2-5-ce0fc07f0e52@oss.qualcomm.com>
 <odmf4zxf4p3luqimkbhggg6cyvjnlfhjsqsvpwpu5ctkviogrj@bmazfab5hb5y>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <odmf4zxf4p3luqimkbhggg6cyvjnlfhjsqsvpwpu5ctkviogrj@bmazfab5hb5y>
X-Proofpoint-GUID: gfA_TWAqrtAvMTTAyMQqEA4nHrZqrBJC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5NSBTYWx0ZWRfXwAjlgnOvoHpO
 iWRgh9Bb8bdBugdZ+5tYcPGAB+JqdutbrcnP4BhSUQmpn+5DfE8DrSnS7SX4LmsfNVmLH1p9Fts
 TVonJ8/kZ/eJevzXyz/OYkI2O2ACaQM99klOYdDk5aMYZyJyhrXul2LFl4H9T99JvoveWMNtDIk
 LTpibjyPmAG2H9mFzWK4Ne9I6iC2/S54ZOrx8jDGefA+Pql3kz8H9jzNMr/pHV/f5n4BvCnlEzH
 wwFrk0F77DiSd2ir78VkF2kk+M0di0Mi0IQPNAxLZLYwFTmmgW0nbZU5N7uD8sswIWT6ByfxuT/
 hv4r1F4mXIoYjA3WRCzEatxQMZ5m4CyqVbiOcA0pMfIdiy9/BJj1ccrtDYsO5fJagMmAs0pRDj0
 JmwLyNeO/eOrCepEDDWZTbPq5yxWAlNl334Q6oaO3LdMp1BeevSmreAt2AO8LRRQ3QW4z/s8GMD
 nvIaUA5GljWqsP1AytQ==
X-Authority-Analysis: v=2.4 cv=IswTsb/g c=1 sm=1 tr=0 ts=69cb9b31 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=P3UjBcrBE1G5PUaxq5sA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: gfA_TWAqrtAvMTTAyMQqEA4nHrZqrBJC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101019-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,hu-qianyu-lv.qualcomm.com:mid,oss.qualcomm.com:dkim,1bf0000:email,f00000:email,0.1.134.160:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.29.76.0:email];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D4F8336790C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 11:21:19PM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 12:15:32AM -0700, Qiang Yu wrote:
> > Describe PCIe3a controller and PHY. Also add required system resources
> > like regulators, clocks, interrupts and registers configuration for PCIe3a.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 314 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 313 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index bde287f645ee94116a489c55be3b7b80db3815e9..52104607a1713323fdfe2e7de710e38c1e22d06e 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -736,7 +736,7 @@ gcc: clock-controller@100000 {
> >  				 <0>,				/* USB 2 Phy PCIE PIPEGMUX */
> >  				 <0>,				/* USB 2 Phy PIPEGMUX */
> >  				 <0>,				/* USB 2 Phy SYS PCIE PIPEGMUX */
> > -				 <0>,				/* PCIe 3a */
> > +				 <&pcie3a_phy>,			/* PCIe 3a */
> >  				 <&pcie3b_phy>,			/* PCIe 3b */
> >  				 <&pcie4_phy>,			/* PCIe 4 */
> >  				 <&pcie5_phy>,			/* PCIe 5 */
> > @@ -2360,6 +2360,318 @@ pcie_west_slv_noc: interconnect@1920000 {
> >  			#interconnect-cells = <2>;
> >  		};
> >  
> > +		pcie3a: pci@1c10000 {
> 
> Incorrect placement. 1c10000 > 1bf0000.
> 
> > +			device_type = "pci";
> > +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> > +			reg = <0x0 0x01c10000 0x0 0x3000>,
> > +			      <0x0 0x70000000 0x0 0xf20>,
> > +			      <0x0 0x70000f40 0x0 0xa8>,
> > +			      <0x0 0x70001000 0x0 0x4000>,
> > +			      <0x0 0x70100000 0x0 0x100000>,
> > +			      <0x0 0x01c13000 0x0 0x1000>;
> 
> [...]
> 
> > +		};
> > +
> > +		pcie3a_phy: phy@f00000 {
> 
> This one too, it should be before PCIe3b PHY.

Okay, will change them.

- Qiang Yu
> 
> > +			compatible = "qcom,glymur-qmp-gen5x8-pcie-phy";
> > +			reg = <0 0x00f00000 0 0x10000>;
> > +
> 
> [...]
> 
> > +		};
> > +
> >  		pcie4: pci@1bf0000 {
> >  			device_type = "pci";
> >  			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

