Return-Path: <linux-arm-msm+bounces-114831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SKNYC0wAQmpJyQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:19:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9336D5FDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:19:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DvGKEi1V;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JDhHdYM0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114831-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114831-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07FF4301A73B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368502DC321;
	Mon, 29 Jun 2026 05:18:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB34C2D594F
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:18:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710339; cv=none; b=jJqhz9xtXErTqnQS760jw1m1tsclO5AaKDid33uHq1sU5PJsc/DiCjwGpPtwxRAsA7Euec4BBb+TkF8XNANQcmNP/J+vRlPXtJZAEF5d6EFLtUlOGDIC3Mg7sTa/55cGnzZ5AIN8Eu/aAeTTguh6oGG2tbSlPW4YeY1ILYb4EXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710339; c=relaxed/simple;
	bh=S8fkSao44xeOcVPaAIheQwuHzrixBRDdW2lLDSTiHzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HecsUjMTh2TEbhhTwqQsXWk0dUBcwo1+aiss/Ur87VUUThpHbJoy/HR8/35QvzgjEzg+bqDFcAcayeE1/RzV6kHFzQ7IMmoNu0fDIUcY6MgHSVz7GA/QgCJALVewCL2coJmlknGqbilph/3iyccOv5V0NE0FVcTmYspQPUcP/sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DvGKEi1V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDhHdYM0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NJ1n1780974
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aymJ2Te3Ti6zcqD0Sr/Ev4D+
	oYziEjIRd/G7pRUp6DU=; b=DvGKEi1VgLheChoQ3f76P6mzdqBkKh+uMuLUKBiS
	8UN/2VPWnSogd/e8Hq4DnUpb+049lrk6iUFeZLsOrcGji6tm5Ke19TwjFRuZ08Fl
	bxnLL7gHKlNOzspBPMaXavmJaVbTYHeLv7kwUG00oSZuKHBqSLARX8HAqi1/wuq7
	VJ+HI4atxmzpWSTHIAUeSECwTytWgQSrPDOlL3h6LFWU8ziLoJgNSllryPlJf8Sy
	QFvpQRBpvh0m7USoAKDOoOt7JfGh8lNq9227RPHmPic9/ZZnXVDPdOEzQxLFYA1p
	Ss3LOwP4jNeLrBiy4khqCvCxZmLgvzxjtbe7x9ANMPIIvQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26u74n0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:18:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c011c7cb9so7308499eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710336; x=1783315136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aymJ2Te3Ti6zcqD0Sr/Ev4D+oYziEjIRd/G7pRUp6DU=;
        b=JDhHdYM08MvBTwep6rD6KV4Y6ApHQJkVk5oU89AGQyOrJU1OC1sVToYJWpeM+awM+K
         X1Mc3fUYF1Yrh87Cp7xrd8qWcMYIf694cypOH06xjnD1DUC1lFuFg5eorXWGB9bgkxsf
         NNbT9+1LaLAQdOaPnSLGoF7cULX2Y1iSqjNWyQyTIPMVSuz1gY10CbZkcALOG70z6D4W
         HRGnWckqnAQZxsjMWQ1li1nsBGTJtFF3TI4scJzwrqToXt4MlHg4b1VPhpHVNK897tt0
         NpZI3S2oghFX6V2pyL0OWqawVN50gS8fM2DXDzA4GWsnAJbBRDy2c5ol05M8Q9zmcRV2
         y6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710336; x=1783315136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aymJ2Te3Ti6zcqD0Sr/Ev4D+oYziEjIRd/G7pRUp6DU=;
        b=QhQ/meKurd4Jh74oirF7WeCeLu9KSwqZU/D/bW5mnZnQvE/z4qLhBJXf57WfaUylAs
         fpQudcjKknPQpKsH7IffrzSAQFBvUVR4z8cDlfgiVchzZBJJduvXuHqq6578ZJU9TPdw
         FGebQdRauZW3b9fXTODKTJ4nhMPsS00lw9lV0O8tLkSEkvXwikLwKDhqSaShJ5EIBCyI
         bl6VtnzvtHSwnJaZJZGlOJjwR7VAfEDeC7g9/BpdJtdr7DJhyiQ+rIFu321YVyy/UdFr
         PteQyvF6pvVYHiCz9eHuHpMf9lhxRzvU3rrWqq4WQEzqEj/L2s7Fro7qGK5UDR8FgqHf
         pNrg==
X-Forwarded-Encrypted: i=1; AHgh+RojkTmu7fX1UxWCHEY0C4NVO4AJ2dFyuiXOSCXdz7uSSZv4K7+xGbTHySGfGQB3n005UBXmsj+EVsZCrXIy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7vxVJicu8F7lrL5IQmVdQT6ivRezJWm19QnHa/jXzdQLhvoFD
	OgrppRv0SM53Q4TRinzEBhGz6CABCHabO8LdP1erOydw1B7nddJrFNgezRyYBIegMsv/5H2UxVm
	F1WH2q8BcYb4wHEn2KvRbvUNATihLaXBOBkFbmrUwpLRSlWM2yMX7Vjak1Ri76lEQbAd4
X-Gm-Gg: AfdE7ckbl0eHcNFKUs1gI9nFM8yFX/sMp+3ivm2rADPSBQXBVkVEYUhCwhoOS+IJ3aR
	MgbEXlUBNPYL81Y0P5VhlLXIMtloMO1c+vr0XcstG7HXuQCG/DxLSmUHljrrj9MgujtunYPwAGL
	Q+fiPD0lxgPQtiT2pDjhifEWQsmPuYq8bZsH1TTAWfywqceB7xeKTDcXN2xNorYALXrb6+C5juj
	a03Ti/GP+illjvD7UeHCjLnHbKAQDBLuzrfOFFD2t/7ooWYRX7CNFtxeNwcO5rQflm+03rpt7j9
	f6Kpkd7COVBOWA//zvKLQI15gOukBnI4k3bDOtelii2yXrBJ40SYD1VY3UZY+maVxeUFxDbU4R7
	8sQG2m9Nzqs95eZjjCpiBhbatvsz5QfpEAUztsl8Bf9oOLXS7w+0MDQCWJA==
X-Received: by 2002:a05:7300:4316:b0:30c:550d:3c7b with SMTP id 5a478bee46e88-30c84d9efa8mr17428903eec.1.1782710335586;
        Sun, 28 Jun 2026 22:18:55 -0700 (PDT)
X-Received: by 2002:a05:7300:4316:b0:30c:550d:3c7b with SMTP id 5a478bee46e88-30c84d9efa8mr17428878eec.1.1782710335089;
        Sun, 28 Jun 2026 22:18:55 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52d669sm42698612eec.11.2026.06.28.22.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 22:18:54 -0700 (PDT)
Date: Sun, 28 Jun 2026 22:18:52 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 2/9] dt-bindings: phy: qcom-qmp: Add PHY selector
 and Glymur link-mode macros
Message-ID: <akIAPK7daXxPH5JO@hu-qianyu-lv.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-2-269cd73cc5d1@oss.qualcomm.com>
 <bb3dd1d0-af41-4ecf-b23a-3800aa5414ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb3dd1d0-af41-4ecf-b23a-3800aa5414ce@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX9kCutnhV+rTA
 en9U6mgdHmKQYgdlePP+wCBAi3at8ZHEnfS0fjmtsF2mZ95oZ05ylD/CI9yGYzE1Yf3bWYSg3XE
 Yd1w6kxY2GZ9H0nJuMt89J83yHzlP9U=
X-Authority-Analysis: v=2.4 cv=ftnsol4f c=1 sm=1 tr=0 ts=6a420040 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vrcMDjKIvnehLc830DYA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 6srv2ayE32A-p8x0unHeJxlZ1WgsrNnx
X-Proofpoint-ORIG-GUID: 6srv2ayE32A-p8x0unHeJxlZ1WgsrNnx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX6FPsryBiGeiV
 VoTun4T0XuseGLqWLgSEe8xwRomTpGEf5+9mB3msU4KHt7xloy7ddeND6TkWNJbMxWjhjlFRmTZ
 DSVryyDqJNxZKprf8ycpHeq8a4+UfbsR+jwGdGasjUTDjlXapU7zYX88p+Gb/9wYRp1lbsA1NBO
 ZTolJDVCTT2xb5IjUEXiCUm52f+SzSx8Cl+h53tOtP6o+y+NRaWmkUDyvEYaYL8ZLUYtrPNK+kx
 rgqVB3tK3TBGy9n8YKh/gffbFlcb6Nh0CAieWaDirrzqMNuEU3MhyTBF98e/gpr6VzWgwjoyKvl
 OBD+oY1uvQpacE0APS/yyOVZXH7ak/aPNH4acXQz9R3b99rHRc2GEHPT6XGIgfToJhEaY7Pr4PM
 zV4PagVIi7D+0OqalbAuUEHPndeyNpGLKsHcwANY4QD3z8HB3UxeuRq4MwWI8/7RMgG6KPQ9BuO
 tFbzpdSx2OmApfFtqpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114831-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E9336D5FDD

On Tue, Jun 16, 2026 at 04:07:27PM +0200, Konrad Dybcio wrote:
> On 5/19/26 7:47 AM, Qiang Yu wrote:
> > Add two sets of constants to phy-qcom-qmp.h to support upcoming multiple
> > link mode QMP PHY:
> > 
> > - QMP_PHY_SELECTOR_0 / QMP_PHY_SELECTOR_1: generic logical PHY index
> >   values for QMP providers that expose multiple PHY instances under a
> >   single DT node (i.e. #phy-cells = <1>).
> > 
> > - QMP_PCIE_GLYMUR_MODE_X8 / QMP_PCIE_GLYMUR_MODE_X4X4: link-mode
> >   values for the Glymur Gen5x8 PCIe PHY "qcom,link-mode" syscon property,
> >   selecting between the x8 single-PHY and x4+x4 dual-PHY topologies.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  include/dt-bindings/phy/phy-qcom-qmp.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/include/dt-bindings/phy/phy-qcom-qmp.h b/include/dt-bindings/phy/phy-qcom-qmp.h
> > index 6b43ea9e0051..befa76f8392f 100644
> > --- a/include/dt-bindings/phy/phy-qcom-qmp.h
> > +++ b/include/dt-bindings/phy/phy-qcom-qmp.h
> > @@ -21,4 +21,12 @@
> >  #define QMP_PCIE_PIPE_CLK		0
> >  #define QMP_PCIE_PHY_AUX_CLK		1
> >  
> > +/* Generic QMP logical PHY selectors */
> > +#define QMP_PHY_SELECTOR_0		0
> > +#define QMP_PHY_SELECTOR_1		1
> 
> Is this for the second phy cell? FWIW I think it's fine to use raw
> numbers as they're just indices (i.e. "nth bifurcated phy") anyway

I can't use lane numbers. In x4+x4 case, I need to tell phy the first 4
lanes or second 4 lanes are required.

- Qiang Yu

