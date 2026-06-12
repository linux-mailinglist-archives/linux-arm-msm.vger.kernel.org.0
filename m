Return-Path: <linux-arm-msm+bounces-112857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vGv1Dji0K2quCAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:24:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1E66772FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:24:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RtFjhjyS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XIjlRv1c;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112857-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112857-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 491A030BD9E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FA63D8135;
	Fri, 12 Jun 2026 07:24:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B0B3D75CF
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:24:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249077; cv=none; b=D/plNxqzQOTzTnPUQ8xUN1bgM7rH3xUgxcIj+R0NR0CZRFCJKeqyb8xSTWL5aVx2t33EcYNubl/ZdkzDrHRkieOSPKwBqJCUHYO2GOsHTwHoyh36dC9Dm6yMb/tR8TjxIYUg+Tv8gd2N+vzh1OAC4dtPmmZ4XVBck5cu/qtrNhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249077; c=relaxed/simple;
	bh=PdeknrAMiLIoRBn6npfOw2nQAm+be9JQYkuNpyld3cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWfJHAM5nbZ8zQOk5My/fbsEkY5WBbnn7FhjXbG8YZX7po55twKMPiOXBJX350ZSFs0sH0NmaAPLNG5YqVsOoKUDIWUuwANy6B0lbnDNkhcTB2+3nfKqipRnmXJbdQBwdD8pvQETpY93GqBcVfyuCTwgBVyEt8ZWcoarm2FSNro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RtFjhjyS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XIjlRv1c; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3BqIE2401901
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GPAVTLBhhFJdNBz/7VfALgdW
	+TGwxvR3jClWBIVeqgk=; b=RtFjhjyS7kPnWvpVJ4lgZvmw6t8azgNoDuiYrEKq
	nvMqWiyFcvjqo7gJovygu05HjeQ2XSDar55Mf1pQ1OJDnXrXYnvH752BEA4dhe52
	7PuH+vWJkKIQnQ4rnOhy/Z/BoaC55BA6ohhebO+06U6023bNsYZ8UtzuSFEOqx2q
	vPaIRpjfMAtEet4N/38vEi9FjcQy/QjP0newjQSelRmskOGM+pfAg3gmWeP2+Szr
	FKKjJalCTFcU2nZ81y3tpSpQvcIuYrfW4Fve4XZNluLc2qkoEQxi5cDhWurJv9IW
	k5MLjg54yezbaJS0jIieFi8l0EPq2p2rCk9vbDv+2FlS2Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30ga02m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:24:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51771d41426so12510661cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781249074; x=1781853874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GPAVTLBhhFJdNBz/7VfALgdW+TGwxvR3jClWBIVeqgk=;
        b=XIjlRv1c1nD9PPcr/HS3mU2r6mLdx4Z5YX1eEXqYJrHZ/CaUTLuYkH0G+UHajpCgN7
         eaVh4jLKoWFZ6aaHm7GdgrOi/gwH+yvRtp1fuSo8SKCbbE3IZggL+ijqME9d76q+5tx/
         JlFKXM2sN25+xdGmEry2nCa1SyuJznXBm10zBqY5mWuA6ZdnC0U0NjDOkFaq1nyYkf05
         Y50lWYzhihiMZpSQ126yZcZ8NTODVbv9x7lLtgsWAe1RcQeZX9STnBKTdPYIN9TZOEId
         zWx62nKcIAlLDXW2u1Jh6kke9SvF+kz8CZLQYZ5u/F+KSa8O6S9G1k2eGVMabY7A/cVv
         2glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249074; x=1781853874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPAVTLBhhFJdNBz/7VfALgdW+TGwxvR3jClWBIVeqgk=;
        b=Q3cYpT4ma4ozDC1J4inn3GP23iuyp6q1D+sgvA9ykicDVig7kxH7iKUkbTGL58lTwV
         dhh0hHCoFZqsjBWPSLEvTj9Q6/h44uid71UwyL69JApF4PDUVd+H/4gtZ2PYsRuKzYZ6
         Mn9+KAVj6hpoUH2rvSIw8Qb5G3+60ag6c77f5eC60b5i0uxFsqNWzgY3+qn+LEQQGLOk
         Cwg6ifvIfhLS4Seda9YztY7lk8JczdOF6oNy9/o5EHIZMeiDditQGHbLZ2HbVUYC0dHn
         0kxYOrsMv8XqpkLDE0+STaPis3jBV7Akp0QBD9xrp5w2qqMpG/DwLggBzDynaWtt8BVc
         HsOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dOcSNKtibxMDBYQbvhkgt7FbUDM5ECIV9BUVnstgjP9bMiMmm2LZEYPcR4cMd6dIhb/EwMRg0G82aFFgb@vger.kernel.org
X-Gm-Message-State: AOJu0YxzQ6QilOeuYhw05t4H3pPWYDjzrizOgOKXrPCQbjAR4O7ss0ER
	gYz81I2NlMWiu/PnU1JOwNZPr6Mz5VK9Q5kY0qgiJr6d5oM1PqGkEaANgdZMdPAi+q5RSKfdelb
	vzSOHzXQYFATWobw7azJ9uigA7EAQDz/Jx00OYg7eLpB1vRkg5eACCjyjwN4dkqXwRrpl
X-Gm-Gg: Acq92OFEG53Wq+v8vB/M6Eiqhw+ZLRRGj310yDqLOVN7xxiIvvJ29xTySgQ8YvpoZJ2
	caFIdhqD0z9j0bmLfMliqCPJyKwGfU8aNG2De7lCbhFwwI95ydiC2EZG0ndnPu44m3pgJQTb5gC
	LBi10+RUaIh/3icm+GACLl+kL6KKc082VVHWkkBxAM+DM4yVrPKsgay3nj3t/wu+tX+n6s7ouxH
	32ypa7EkHB9X8sKElwN4ObDpoh64X413SxsYAmTRllcxWP8+rtepzBX8Mb5yr/pjINevGtAz4T0
	4loKr6WPvTkHbMhB4wx/WCKK/8KSt93fElajDxSZ3wJU3zYjQtRPMoSu6Rc9wof2kUDzdhFJIe9
	x6x9215cdtDvrRNk2vEofM6WJrmrXOu6IqcMwsbnutCqc0QC2Ukz4DjOSorWSKneCxx0sNt9owq
	js3SunjZ+/2R6JMPDbGlIEVhT8grNO1iZ1pVc=
X-Received: by 2002:ac8:57d6:0:b0:516:dda7:51e0 with SMTP id d75a77b69052e-517fe25ffd6mr19995051cf.17.1781249074252;
        Fri, 12 Jun 2026 00:24:34 -0700 (PDT)
X-Received: by 2002:ac8:57d6:0:b0:516:dda7:51e0 with SMTP id d75a77b69052e-517fe25ffd6mr19994701cf.17.1781249073798;
        Fri, 12 Jun 2026 00:24:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1adae5sm297181e87.56.2026.06.12.00.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:24:32 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:24:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
Message-ID: <epxrpj52vst4zjigsn6ghaiajyzkwdtji2dvgrf7euag4indvf@wzhhy7wtuhhi>
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <20260602-ipq9650_pcie_phy-v1-2-d8c32a36dbd9@oss.qualcomm.com>
 <56zkq7bwrt5smmmum6jckzrekkkqrych2gntx3obnrmamwumtv@espahwe6pc3v>
 <7def2ccd-0319-4f85-8275-73fd254d887d@oss.qualcomm.com>
 <fbtghwjrokuijatssy7xn2hwkp34p5fjyn3ndr5t2w67fkz2na@3izdh7uk4hst>
 <602e893c-d346-486d-86b3-50d0f01990bf@oss.qualcomm.com>
 <ohijjcszynmoocjarid7mo7nbtd2dqcdvqrbnzb7anjytw5m56@nguadudsz7qg>
 <a7952e7d-468e-4ad4-8d95-f6bfe9305170@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7952e7d-468e-4ad4-8d95-f6bfe9305170@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2NSBTYWx0ZWRfX0//k/nQzFMMP
 sQNVeMnUOX1eGMOdqY59V1GgE9Q9Kqf1udbwDQ+4f3kXa6pCDwywrsrCBGMXWwh3pGF0LbCJQ+q
 +J48vAGnbE2SVVaLzbP+J+zTp2COLTw=
X-Proofpoint-GUID: BSCGb49BuCiCe0kMdevbnUkcP_Kn4g6Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2NSBTYWx0ZWRfXwuZxWzBL3ycJ
 kOemJeeyPMlg/GovYmTEXIRPoorFq7I2YnTHWFkZMuzKx+n2fNG8gBb8WJ8TjZxgygeGwV6tnTg
 2joC71tJxoB8Ldy1T1f6YRsg+PvjMJsSjr7/wrrIjY0P+GhnJp1VtnX5HO1Xj0c8VZinmaZ/pW3
 IfxSpNZYFNJSK5y691t04Bdt7elnA1fyDtyPjgSaABa+n8J8yKGS3n+Wz8+w81QkgjHCrZmqklP
 WB01VVeokDnWhDCGqrRlh4IGcHMhy5agGNr1r+aAcsGlXbqMMKjtDJDGlh6AcuqcHfEuW+gcBku
 ahKZVAqos9aXf+8ap+prJag+unJ6uldAHo5YUbC1BnSXB64iUIfZHKTUg2ISRd9Q7BkkjWWvXjC
 ncsE7nPE0nweJ0V2yLhN1/PwQLvWFJkwGj0JrS8NgqJFrnDGgVwvH9P/wt65dykTA7/B6GHzCVs
 Wuw1TxkS5TjaUISgGKQ==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2bb432 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=cx6O33gTLCPIekaZO1cA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: BSCGb49BuCiCe0kMdevbnUkcP_Kn4g6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112857-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A1E66772FF

On Fri, Jun 12, 2026 at 12:13:04PM +0530, Kathiravan Thirumoorthy wrote:
> 
> On 6/12/2026 11:44 AM, Dmitry Baryshkov wrote:
> > On Fri, Jun 12, 2026 at 08:22:02AM +0530, Kathiravan Thirumoorthy wrote:
> > > On 6/12/2026 1:52 AM, Dmitry Baryshkov wrote:
> > > > On Tue, Jun 09, 2026 at 03:46:56PM +0530, Kathiravan Thirumoorthy wrote:
> > > > > On 6/8/2026 12:26 PM, Dmitry Baryshkov wrote:
> > > > > > On Tue, Jun 02, 2026 at 02:40:18PM +0530, Kathiravan Thirumoorthy wrote:
> > > > > > > The IPQ9650 platform has three Gen3 2-lane PCIe controllers and two Gen3
> > > > > > > 1-lane PCIe controllers. The PHY instances also require the on-chip refgen
> > > > > > > supply.
> > > > > > > 
> > > > > > > Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations, including the
> > > > > > > refgen regulator supply.
> > > > > > > 
> > > > > > > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >     drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
> > > > > > >     1 file changed, 220 insertions(+)
> > > > > > > 
> > > > > > > @@ -3378,6 +3524,10 @@ static const char * const qmp_phy_vreg_l[] = {
> > > > > > >     	"vdda-phy", "vdda-pll",
> > > > > > >     };
> > > > > > > +static const char * const ipq9650_qmp_phy_vreg_l[] = {
> > > > > > > +	"refgen",
> > > > > > > +};
> > > > > > Now vdda-phy / vdda-pll supplies?
> > > > > Cross checked with HW team again. Along with refgen, there is a on-chip LDO
> > > > > which supplies fixed voltage to the PHYs. It is enabled upon system power on
> > > > > and no SW intervention is required.
> > > > What is it being powered by? MX? CX?
> > > It is driven by CX.
> > I assume that there is no CX collapse on IPQ9650? Is CX not scaling on
> > this chip. Please provide some details on the commit message.
> 
> That's right. No CX collapse on IPQ9650. Let me rewrite the commit message
> as below. Hope its okay.
> 
> --
> 
> Add support for the IPQ9650 platform, which includes three Gen3 x2 PCIe
> controllers and two Gen3 x1 PCIe controllers. The PHY instances require the
> on-chip refgen supply.
> 
> Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations along with the
> refgen regulator supply. Note that an on-chip LDO, driven by the SoC CX,
> supplies the PHY voltages without requiring software control. Note that CX
> power collapse is not supported on IPQ9650.

...neither CX power collapse nor rail scaling...

LGTM.


-- 
With best wishes
Dmitry

