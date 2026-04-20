Return-Path: <linux-arm-msm+bounces-103673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHD9A3DU5WmmoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:23:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5F2427B31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCB4B3000FD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 07:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7753845A0;
	Mon, 20 Apr 2026 07:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+wmpP8d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuAvoLTL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF8C37C919
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776669805; cv=none; b=bCgJnHq8w8ngVeCHOLnCyNPg6pFhA6+vVWuhSZe5AeTnY59kDwDRjzE2NyMubn0G962KG0EViiFCMAZO15ztgtjldBz482G4gyk4EDAziQYbyg/jqVN8sehuG9YQCZcxiRUmGTjYsZkw51stJTGd448MWChlEU4AapcQkLW5mQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776669805; c=relaxed/simple;
	bh=z6Do6shpURmOZRYKvFoXbHBi8MAMQOej+11njW40oFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJU5VtJLLYQLbqadz50e8nqOV7CZoIxoLFME22pDF+uTIETcYMg5HxvDE0g7P51Xy6b7LIS6tXtBGHYkY5hUIJLkjJnn1JWCG8UcBlKQfgs7BbzvslHbL4ygTUrhuvmicuspsGfc8r/m9fxAnxP3n0+oQQz8LeRMD6eKqLq4ii4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+wmpP8d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuAvoLTL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7Bus42791024
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yji7lTIBXwCeSFI+byPZJvWM
	ffhhwyr+nkMpWfwkLng=; b=H+wmpP8dDKJLdvF8GAHgo0f3u+vsX+5QeeMyuEXh
	UaC//Sf9ipf+0Bs67aK8v2RXlBGJBYcJPZZLz+/c6V/wsQK9TdtGun9RQNQsbzN9
	+zTfrtMsNemIzXTZt+GoMzOaiM5P2rRHMMILf1/OH47gkUA8GEHFc7aYYfFK8Tvy
	dDJhClk2NL+MreHGT9Rd7/1phAm26gXZ576GHXVXIXbbXw1DdDZ9FQ/VuhluAP66
	G6q8RBK5lG9T4hGhohKNQ1h6MLoqdEbVrZIOSDht/r/xiGQ5yo3vr4LPqPXFcaFv
	oQCgrrlsCDaIQ1erN3VkyHWz8PLkApA+xj/NMc0urwZUkw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0y64rpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:23:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bda35eab74so2663926eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 00:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776669802; x=1777274602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yji7lTIBXwCeSFI+byPZJvWMffhhwyr+nkMpWfwkLng=;
        b=fuAvoLTLx8Y/JAaRxTMtW0v/ExRcwV81NYodyY3a8YXkKdTBh0nXDj70jDOV9kLAX5
         Nxqt9Kh+6joOymYqdWQwBh8abtB50rePGdetru/6oiGXW1XSqVbSJ/D3/qESvz/K/eZS
         hdD/iC47UBWNMX3HVXKa95uVzJaZlexafgrA9k0dcolo9ho8urwn+Pc/uwZJi3KzFOR0
         bLWAyUFbbY20TO8yU2kK61iAI8Cgu67y31ITOFnGWRp/X3zIUo0+juTQnLfAPEFrdZ+w
         HXfT4w5/Z6X2bUjUcRx8hyxvXywl/RLKaAPH1KFwHMWYmmt6hz9/Bb2XR18th1thUe3V
         uuww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776669802; x=1777274602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yji7lTIBXwCeSFI+byPZJvWMffhhwyr+nkMpWfwkLng=;
        b=N4fOryqdSHNQAF8WAEdMv305ZyRZJJ2QJKm+DHtRPxLtJnBRNumt7sUcE3FLvPFTVl
         E4lqYZm6DSk6PZOwie8uuPpdn+LjNGFGAH2hyNziHic4KqNMhInLOtTW8NJ21pvS2A3y
         zFGVDzWJW4PEdw75AFQksPR60qXJGSOSVBPkSLI0fJO8cuTHr26kThuq/leCdwZTDKBO
         8pRMwzAWChzyngrdcwNnXOYJZQRaMyczIqv6CnUtt2ur2Elhmrsey5ehrxpqn/zYzdey
         kC/HEYhP9nOh43d8pZ5OCUhUJAKvcCqaKvYLrqLSlaTtmPCudILuT2RkomtDIi+3nOL6
         sNpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9J8sgxJITsAEBX+VasYGQEb25DDhWhZm6grL25hUBfqPRDJ5paI6Q2WZTqbrw6Es7n3SPSKykOeGOI9PWm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5pEXCnMU08OMti9DXC8XnnQE9oDP9syIm/HlNZDQQ587OXyjZ
	z5MORyzcfgJFDwIZwucamxChzXhFu9qGQ3YQyNORjjczAH6UJg2vSynxJp/ZIqruPNvqcYDIdsf
	5clq/W3WamTBE+wzEhDsUpidfpBAYYbwo8iAMCrOnA7+3u2peLKE2Hkw8eN/EzxqOSY5A
X-Gm-Gg: AeBDieu+ZJd2a+YPE3BdWTghkkQbCuGwgo+vzyeIIr6Ibxy3ArJVbwayvRPGNv7Yl3U
	NteRrUN5dd0bhYCe19ewYB8YHa54SYvrtpTzmFOHx8yaPTAGiWDKiHM28o3ptg0HDJUKHCEs+Sj
	DgqcXV33he/sZhM5uz0KBn4gYGTsE+cHNIB5IRHzjv98p8utlCWgoedlzUy7cTnQu509lcX33kI
	NnIhcyO+7MfZXu7ou6eoy6pmLd9EFWyI5wAyg/h/kpjcqnf5pRPZdBvqet+qS7Utm3/vC8CO+2Q
	S8Gc5+OFze7pxRjofpZllCjcAJGDO3eY2CWRSZu+rx7KGTsUs6W82khITjmVrs8+t0tURVQafoF
	bPLSAb59sHnD7Nty7pRue19ktzNHPzu4eRPu40QTT49LS2TJMV7mHmCxtmxpMkv3XkmANh1oOZF
	nZnoQ=
X-Received: by 2002:a05:7300:dc8e:b0:2d9:db50:c6ce with SMTP id 5a478bee46e88-2e42c348309mr4773552eec.3.1776669802258;
        Mon, 20 Apr 2026 00:23:22 -0700 (PDT)
X-Received: by 2002:a05:7300:dc8e:b0:2d9:db50:c6ce with SMTP id 5a478bee46e88-2e42c348309mr4773527eec.3.1776669801485;
        Mon, 20 Apr 2026 00:23:21 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm13637143eec.18.2026.04.20.00.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:23:21 -0700 (PDT)
Date: Mon, 20 Apr 2026 00:23:19 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 support for glymur Gen5 x8 bifurcation mode
Message-ID: <aeXUZ1uSEJ9InUtw@hu-qianyu-lv.qualcomm.com>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
 <20260412-glymur_gen5x8_phy_0413-v3-1-affcebc16b8b@oss.qualcomm.com>
 <20260415-wooden-prawn-of-lightning-dc1ddc@quoll>
 <aeBQRStG3imY0cOe@hu-qianyu-lv.qualcomm.com>
 <20260417-awesome-tacky-coot-e59a30@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417-awesome-tacky-coot-e59a30@quoll>
X-Proofpoint-ORIG-GUID: VAfx0UocSTufQPoIls4aJxLGZ-0SSPDs
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69e5d46b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=AG9yAhbetzltrioosGgA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: VAfx0UocSTufQPoIls4aJxLGZ-0SSPDs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3MSBTYWx0ZWRfX2YURACpp0Brq
 3H6Je+RVObc3CzBZcdWMqMt6M3Yy2aEBzVJNpZ6xJYvqXweGr189g98X0U2nEgt27nHOyoSzXvo
 Mtdthodi7K/mFln3gDdMp1nIz4+J0NLQ62jC26bGQTmon4NErJqchsgzweQxnlEUGoDDGAoJ9bc
 o3QSOo2Y3jg4+o64VtKaNfr8ofmm7ji1jsGRMMGbkbE+SN8sMZmmVtRyojyrmFSEteQLxnYI+g5
 JpLaURAEKUCFk6ONvUR4wBWKg8ucspu3kCUNo50U/Rj0izCbqSI9Eo1lByz2HWesJHoYlGKDBuN
 iJi1LnCcfTbwNo2Kw29RPnTakCzw7ODEF1LyJFDlst7Yc8AM0i0kfj7i+SHyKUynCsowhw2wXfp
 rva7KEKya1IerCu2ix55vN55A0jJXi9HsYv2kPPuCS7OQ0jfGiTNWjubsmvPgDXak/me8fdWi0q
 OdWsC4Qw0e+rlDS5ezA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103673-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF5F2427B31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 11:18:08AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Apr 15, 2026 at 07:58:13PM -0700, Qiang Yu wrote:
> > On Wed, Apr 15, 2026 at 09:50:28AM +0200, Krzysztof Kozlowski wrote:
> > > On Sun, Apr 12, 2026 at 11:25:56PM -0700, Qiang Yu wrote:
> > > > The Glymur SoC has pcie3a and pcie3b PHYs that can operate in two modes:
> > > > 
> > > > 1. Independent 4-lane mode: Each PHY operates as a separate PCIe Gen5
> > > >    4-lane interface, compatible with qcom,glymur-qmp-gen5x4-pcie-phy
> > > > 2. Bifurcation mode (8-lane): pcie3a phy acts as leader and pcie3b phy as
> > > >    follower to form a single 8-lane PCIe Gen5 interface
> > > > 
> > > > In bifurcation mode, the hardware design requires controlling additional
> > > > resources beyond the standard pcie3a PHY configuration:
> > > > 
> > > > - pcie3b's aux_clk (phy_b_aux)
> > > > - pcie3b's phy_gdsc power domain
> > > > - pcie3b's bcr/nocsr reset
> > > > 
> > > > Add qcom,glymur-qmp-gen5x8-pcie-phy compatible string to document this
> > > > 8-lane bifurcation configuration.
> > > 
> > > Do you describe PCI3A or PCI3B or something combined PCI3?
> > 
> > I describe a single x8 PHY with resources from both the pcie3a and pcie3b
> > PHY blocks for x8 operation.
> > 
> > > 
> > > > 
> > > > The phy_b_aux clock is used as the 6th clock instead of pipediv2,
> > > > requiring the clock-names enum to be extended to support both
> > > > [phy_b_aux, pipediv2] options at index 5. This follows the existing
> > > > pattern used for [rchng, refgen] clocks at index 3.
> > > > 
> > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > ---
> > > >  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 53 ++++++++++++++++++----
> > > >  1 file changed, 45 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > > > index 3a35120a77ec0ceb814a1cdcacff32fef32b4f7b..14eba5d705b1956c1bb00cc8c95171ed6488299b 100644
> > > > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > > > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > > > @@ -18,6 +18,7 @@ properties:
> > > >      enum:
> > > >        - qcom,glymur-qmp-gen4x2-pcie-phy
> > > >        - qcom,glymur-qmp-gen5x4-pcie-phy
> > > > +      - qcom,glymur-qmp-gen5x8-pcie-phy
> > > 
> > > That's the same device as 5x4, no? One device, one compatible and this
> > > suggests you will have three PCI phys in the DT - two 5x4 and one 5x8?
> > > 
> > 
> > It is not the same as the 5x4 PHY. In DT, we model three PHY nodes:
> > phy_3a (1x4), phy_3b (1x4), and a separate phy_1x8 node for x8 mode.
> 
> OK, that's what I wanted to hear. And that's what should not be done,
> 
> You should not have a separate node for the same hardware. First, DTC
> will give you a W=1 warning, although warning itself should be moved to
> W=2.
> 
> Second, the warning tells important story - same hardware is described
> twice.
> 
> You only need phy_3a and phy_3b, so only two in total.

We can keep only phy_3a and phy_3b, but still add new compatible
qcom,glymur-qmp-gen5x8-pcie-phy in binding, right?

For boards that support pcie3a(1x4) + pcie3b(1x4), DTS would be:

pcie3a_phy { compatible = "qcom,glymur-qmp-gen5x4-pcie-phy"; };
pcie3b_phy { compatible = "qcom,glymur-qmp-gen5x4-pcie-phy"; };

For boards that support 1x8, we would override pcie3a_phy with:

pcie3a_phy { compatible = "qcom,glymur-qmp-gen5x8-pcie-phy"; /* additional resources */ };
pcie3b_phy { compatible = "qcom,glymur-qmp-gen5x4-pcie-phy"; };

This still uses only two PHY nodes and DTC will not report warning.

- Qiang Yu
> 
> phy_3a could have resources of phy_3b OR could have a phandle to
> companion (follower) phy to fetch resources from it. I don't know yet
> which choice is better, though.
> 
> Best regards,
> Krzysztof
> 

