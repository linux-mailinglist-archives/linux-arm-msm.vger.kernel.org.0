Return-Path: <linux-arm-msm+bounces-112847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id si+xJtmjK2p3BAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:14:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F05DE676E22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:14:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=njOxZdAK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RPleETwN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112847-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112847-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 935A53088D07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 06:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0BE3BADB1;
	Fri, 12 Jun 2026 06:14:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E9C2DA74C
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:14:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781244886; cv=none; b=kWMlhR2dkNs2M2M3PDZqk1hcEgmyXfJKqllIcFCBFYnnF2gU0Z4vgf2BpLwSdjtRMAWLdTPULJWLH4zMSm7sE3Y1c6SCUDHNrg36DDVf4qRUgkN++TNFDHlVfI4UpjEYEk0lpQifR8SncW0fvSB9/1DT0CHygzHkMXjTkG/ZmTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781244886; c=relaxed/simple;
	bh=8pWotts/kpDpCde4ZNY5wGJFHdknrdfgwD8DISz0zyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKxHfvoKon11aJlgfSRy754zgYzeAIICVqWI+/hG7p4wQ7Ua3mKJ66SXpk3o1nt3XwCEI16hQmmXlJjv7efr3w1BNlflsHjBXn2FDMH6EvDDdGYt6elj7eppOEpBrmRwgw3ABKFcIi/TpD6XUY9v/jIzBdHOvn8s0DmfoBnlTqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njOxZdAK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RPleETwN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3CnCA2507612
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4EHvEVapSr/pXzWOg5zZWwsW
	MURjNCE8rkDaje4bveg=; b=njOxZdAKtWqnUNLXoQVt7f1CI5elvV9KfMj5d6aJ
	iewqp7Pv2q4nB25W0Qly087GIweWvHzw2EILpZUKx1ml1RpLhG08QloaAPfqRLJV
	pbaUwdSa5lZVhZ9mTyAc3ay/LSDP9Im0teTyoYW8qAsSSUll1BP5tj7yCdwSVe31
	zHTKXwrzEBtGOoG5LkyDcWxX9DvFLNpgSqs35IlQVsTGp7l1OKEyuXy+PmNt9djw
	HmCV49NhdJfIwQEW49Qhi/eQGYlCmK28N6jLQQAqs6qeeyrVI6a2sx6RicltiLz7
	1MJYZmxg54W6MlHMoOcsLlRsRbPsoYW8QPjIVUK/QjEYFw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbjan9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:14:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6751db2792dso338635137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781244883; x=1781849683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4EHvEVapSr/pXzWOg5zZWwsWMURjNCE8rkDaje4bveg=;
        b=RPleETwNraCHoD5akBLzTzcw/qj8Q2WjEHsfUvh0YA5CjXE0fn8caEEDakNCYbX1fA
         rPc4TipLvjTBAoCzZJ76jGBSzH+5ehOpBc6+3CXGRu8NgLkHDkW1arSnNAOOzylbse/L
         otwGDK/hsJxv5WZ6+zF2IuzUra6xVv64OvOpzodCHSEl0XB5+mMvqNwEASUwKFVUcUWf
         iaiC8A/oQyUZ8gqhRwX2tu7OCwp7n5tE3v/zAfFJwgZ1z2j4T+nCL1hULg79wf14eTP3
         ca/31zgobkGZ+9zvey+KBswANy+E7FiXkZX7/ooLsMsaRb+BYQ3fTj+xAl78QyWDDkQZ
         eTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781244883; x=1781849683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EHvEVapSr/pXzWOg5zZWwsWMURjNCE8rkDaje4bveg=;
        b=I5sOsbrpFG8uASyhkG65IlcKrlIU2SgYksAT8YA4WidSRDSllmVMMYakbLTv+19sLG
         eUovjOtW4N47Qw4TTzf3qwZ7iylS7uHcxZyoxwNUKntqduZUdy99THZVZETkHH047wxk
         wE0qWdlkXhRgt3dsVldklrklMDhPw5ijrWHIpOrLzKA+3AzRrepIXrH6euEncjWNaGyS
         i/RBQSBnwYVF/MvqaJAGHVnOCmpl0WzNV0ZU1JOStPv3DPRfiduXAiixznWI0cgZIR4l
         Ed0btT0u81GazX9KdzGKz3moo0SJggbwwRQv/5aitCoEdMBo9DLZa8tVJVKgYx9jxWxp
         uYmg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZK+Kc70uujhQJrOCT7Z/mgj3FF2vOHiX5qJEFY16eabY4N1NYtR4JoxEqg3aNGXxczc5e6q9tDLZm+eV3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwy7G4JE1ExNH3VtEYoHjQridWQZxwqmEj8m/RMTyITWE5GlK5
	VIcLv+VI2cOviC9C2ArmvS+bGE84cxAao5rqmmZtzOkUpHzdqlnuHwA+BnWZriIuQhOz0LPqFAX
	lL+Elz4h7F4bQEF5N5x2kPIMFB53g7VrNmtGH+yu9kZ0IU5yMY5qjjjW9Ow11nbPkJd3W
X-Gm-Gg: Acq92OF1CIGhoIv9fpjRXr5yUZXYk3ag5o50A5ilrQB92gOdgMRPZwFqhHiUh7bqOf0
	JDpcHVyy3UxPHSnGfOo+Xa0hbi2EeO29kx8uUzZhveCLyz7uxJVSou8obbWPMup3Q+3D7znJdOz
	jzPNhq8F8E3Nuk9LvHu0sY+ur4SQFLQBtLQRH7NH4acOHxmgofptTA2P9NZY2wfEV/SJxdJghcp
	+puDrdHWyy6LRV654zxl/qfFk42OCTNXW+jLDnyhOlj5C/ww2FZQja9b9ppSr39qj9omLgm5eD8
	nEk/5tZaKYDBX4xvblE+0EEvqv6tR/yT//laiUlpuxgmSLAAgDoUfyWOlZZqCPYOkNc6mzOy/cQ
	6M0D5uXSG4unwhU9a34LQOA7gUfMCYT6h9SfMZKIfCnD7U28meO058IMCNcEILpTk5su8nWkybU
	JoPoSOzHp6691mV+HWxTHq31+v08fHGdwrIkg=
X-Received: by 2002:a05:6102:38c8:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-71e88acea8fmr634857137.5.1781244883482;
        Thu, 11 Jun 2026 23:14:43 -0700 (PDT)
X-Received: by 2002:a05:6102:38c8:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-71e88acea8fmr634842137.5.1781244882942;
        Thu, 11 Jun 2026 23:14:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f547c3sm3733451fa.30.2026.06.11.23.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 23:14:41 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:14:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
Message-ID: <ohijjcszynmoocjarid7mo7nbtd2dqcdvqrbnzb7anjytw5m56@nguadudsz7qg>
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <20260602-ipq9650_pcie_phy-v1-2-d8c32a36dbd9@oss.qualcomm.com>
 <56zkq7bwrt5smmmum6jckzrekkkqrych2gntx3obnrmamwumtv@espahwe6pc3v>
 <7def2ccd-0319-4f85-8275-73fd254d887d@oss.qualcomm.com>
 <fbtghwjrokuijatssy7xn2hwkp34p5fjyn3ndr5t2w67fkz2na@3izdh7uk4hst>
 <602e893c-d346-486d-86b3-50d0f01990bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <602e893c-d346-486d-86b3-50d0f01990bf@oss.qualcomm.com>
X-Proofpoint-GUID: 1hcht_xZGds1Pj3jfyAZD1_Bw0IXP-cL
X-Proofpoint-ORIG-GUID: 1hcht_xZGds1Pj3jfyAZD1_Bw0IXP-cL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA1NSBTYWx0ZWRfXzZdcII1F5R8P
 O7aOodgPD4gga3SUkrysi3DtoP74GLuIQ5WBDYqqzCyci3NCaZqIsIlrk6DYVWWpYpsfIoruDZV
 uFHtHCiOZHAAN7wpHOBw7ecMPdMuFps=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2ba3d4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=FLPK4wCqi9WiV8jjNa0A:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA1NSBTYWx0ZWRfX5I1+rpJ757q8
 jjOlSHiS1+Sde/S/irKcsypIDxkoz6UWItbRnoV3v4UEtWWu4ZQdrM5KzZknQp1ZZv85ZogHf8o
 YMDSG4u+pAQAMYnhS5Of3t2I2BFSL46vr44ZZbI93pv1Bn9RJkuAdsUj9Qr5eI5FhU71iQd61/Y
 i9+OiDgxRH7k/Bi/Dc3/fE5XOmL6rrLibZsvu82sXTRKLlcWAHENeFQK5fWantm/y8Ij1yBLEV1
 EoE1fmjprWqg0+4W6QTXh9BEyLZZ4ACjHOm2UpsN4GQTM7O3awhvZFC1MrceGuaT4Q5PMO/sWnI
 X6lRHiRoThbuGg604B4DyoOiMlgOMW4EDoie/DvuDiChcVAdt2jLZSZl2hXtmHalBrAmtQBe098
 sUeAaXsTbApIvThJfHgtzzpTBVmWidIil3IDsTvE7lXDwjp512465eLB+mxgKnzFdrBxUeDdQPK
 MaXjGpia3lwzSC/SYag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112847-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,infradead.org:url,infradead.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: F05DE676E22

On Fri, Jun 12, 2026 at 08:22:02AM +0530, Kathiravan Thirumoorthy wrote:
> 
> On 6/12/2026 1:52 AM, Dmitry Baryshkov wrote:
> > On Tue, Jun 09, 2026 at 03:46:56PM +0530, Kathiravan Thirumoorthy wrote:
> > > On 6/8/2026 12:26 PM, Dmitry Baryshkov wrote:
> > > > On Tue, Jun 02, 2026 at 02:40:18PM +0530, Kathiravan Thirumoorthy wrote:
> > > > > The IPQ9650 platform has three Gen3 2-lane PCIe controllers and two Gen3
> > > > > 1-lane PCIe controllers. The PHY instances also require the on-chip refgen
> > > > > supply.
> > > > > 
> > > > > Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations, including the
> > > > > refgen regulator supply.
> > > > > 
> > > > > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
> > > > >    1 file changed, 220 insertions(+)
> > > > > 
> > > > > @@ -3378,6 +3524,10 @@ static const char * const qmp_phy_vreg_l[] = {
> > > > >    	"vdda-phy", "vdda-pll",
> > > > >    };
> > > > > +static const char * const ipq9650_qmp_phy_vreg_l[] = {
> > > > > +	"refgen",
> > > > > +};
> > > > Now vdda-phy / vdda-pll supplies?
> > > Cross checked with HW team again. Along with refgen, there is a on-chip LDO
> > > which supplies fixed voltage to the PHYs. It is enabled upon system power on
> > > and no SW intervention is required.
> > What is it being powered by? MX? CX?
> 
> It is driven by CX.

I assume that there is no CX collapse on IPQ9650? Is CX not scaling on
this chip. Please provide some details on the commit message.

> 
> > > regulator-fixed doesn't take the resource 'reg'. May be should I create
> > > another regulator driver which accepts 'reg', something similar to the
> > > qcom-refgen-regulator? Please advise.
> > If it doesn't require control, there is no need for a separate driver or
> > separate supply. For example, the refgen is being references only by
> > those devices which require software votes.
> 
> Thanks. Then let me respin this series on top of phy-next so that Vinod can
> pick it up.
> 
> > 
> > > > > +
> > > > >    static const char * const sm8550_qmp_phy_vreg_l[] = {
> > > > >    	"vdda-phy", "vdda-pll", "vdda-qref",
> > > > >    };
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

