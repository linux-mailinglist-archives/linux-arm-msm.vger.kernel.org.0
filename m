Return-Path: <linux-arm-msm+bounces-102034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPlDFL5i1GlAtgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 03:49:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B033A8CDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 03:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0EB030221EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 01:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6327A234973;
	Tue,  7 Apr 2026 01:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBFy7ofr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hs7jHEBW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B19224F3
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 01:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775526580; cv=none; b=GlGuRpIQSsTBJ+CtEshGP3wm90s5j4xQ315r3H1l7bAC/JMB/VjyMjU3G2l99i5r8X8w3CWr2p7HIzmK6Tv3yIJHqHWQsh1XSThETANkuug6B8wc3zGrJ3Kq4BuYi94+mvxMYVHuIzdITcTut1PXMcmxgul2IRtNlQQSzcPv018=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775526580; c=relaxed/simple;
	bh=1F7rOwN52BwVwd5CpvufkvjMKI4QWi2xEwdKAbqe07U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4SFo61Nnz3g8518wkgguFn5q1pyuCzd6CLwPV5z7V7TzmDHe1VVoscVlacheYW+e+ME+lqE47JuqfDvoC3vFyWb+XbYxAbHm4BDfwqQ3lgxcABQeaKurGr3nUSI/EFDcqLhTJSSQ+keN5E/Wu6ymlQpgs1dWxKppKTCUYT+b0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBFy7ofr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hs7jHEBW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQ4Zm492506
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 01:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5SKSrMjMi1N4JiTNo9tgjC+8
	PpkGu0In1Ys6pg6Bnpw=; b=QBFy7ofrnRCthxbJP5RAYFc50zZ5qUaLSlCRPU/t
	5MpSxZQ6k6CgG1SJJs13r0TMtUameirMCDSiBncP/ZBVn8aSaIoNpqOhpWMlAeuj
	am991hxN7qnIDFZkk6iP2eXVY5jvHFNWZa73T7k6KuB5blaTDYKEURbRblozqJA4
	lobn21bmO//gIgbyPLqMkwLvYFdLe8zcqR86qJoFvFReZDezbvPGpNHL4beqWRy8
	Q3bess5L4HZcaCeCY9Yo5h3svEJGnIa2R0dNWhx7wit07cOGX0+9iPhtVa05Xear
	Wd0W1skcxBWzX9hj0gTMFFs55olEe2VRHClN86y5lPgcSw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8rhsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 01:49:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2cc9118dc2eso13067540eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 18:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775526577; x=1776131377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5SKSrMjMi1N4JiTNo9tgjC+8PpkGu0In1Ys6pg6Bnpw=;
        b=Hs7jHEBWBE6sG3i3JnMgNsbLD6gb82T+X2iakJkBu2nH866pf04zNmMhUkFkgsgPWb
         zByqPL2jLpnFhI+orO9JT1gpTQ2abJXH/VPqUeN4kkUzdVpnSqQ1btG0VOr3xAzcbbDY
         rYHvatw0iIT8nnuhMa9hOQVmdR7uOVV1ZtO1DDJ07zD7ltNAh+qiQks8sz3V3PrFejVq
         9wes5qcWVb5j4ivK2I9B7xGqouzfaMvcdeJhragaue61kUKSbMjCT1XZp29wzr/8jUvd
         eJSAsqks5vLMuh5WWqoRRyjc52lQv/aHOGpIzvj/L870JFJI0k5eRSMoQlbsA1qppvZO
         56Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775526577; x=1776131377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SKSrMjMi1N4JiTNo9tgjC+8PpkGu0In1Ys6pg6Bnpw=;
        b=g9JHNZ/G6nF6Nfp2E5MrvXnaSIkmu1GT27dleGuczZtWLYEE3G5x00nscbwQNLl4jI
         Sbqu64t1hKXVl14xcUgLTPqGHJ2eiPgs/ts/5w1Qvy8QW+Spkn3/jr+dD9+eZSSBtvOd
         kHGKVw/xL+o46E0WYrCw98DQwjr2+KbrVA2YttoC4ribAj8qWB8pnvg3enhNgU5psPtR
         TwtJR3TLDAcuT5wTTQUNnpV011/zEEC0QL2yjWsL7+5iIrz0cDgNecWbPa2uXJ0U9zJG
         IEeXpwV7UWYTz8Aern73mEqazVw3+GrGSfk24Mzg1YcTvptDViB+Bx9TDyJOJomgHeuf
         UZrw==
X-Forwarded-Encrypted: i=1; AJvYcCVsjeGw0v5Z4ozOVyhU8Y3wRAcMn5NcIzM25oaXTyKOaq+fWq4iFWpMymyPzLtbDoDI1HcU5shf4ILtwVVq@vger.kernel.org
X-Gm-Message-State: AOJu0YzvsF5OPQE8wIWpX/NCTmhLi0e2l7GGntL90fibg3gwpmKMbDgP
	ubTfJ8Z6cg4ztXjbu67oN+2dXka0S3FJK0sLJ4siGPYxYJlYFlZGXImsTPBZ4mj/Drkvy8FTnHV
	DCYa4KQ3FqMuGUr5s/9CIxFTto06LuotPj21CYvcAehriwraWMq4lf38lGB1NGm6ndFdP
X-Gm-Gg: AeBDieuW/QY8bN7dBP+yY4wt26MM6Sb8wPFpvMDUnYjsKsg2TwRC84MqjJMNrYsh0Ts
	mSL4ceGJNgZala6jlkWgLKGCxDqlGdgF8362D6DR1lOe2+YrhHrqqOMHbr/2XJEYPtwJ74SeQzE
	DQNMLwIyB49fyqhc2GK4/+53yFu+LPPPVp4Nv+3ZS04xe6E6XvQBCaofUTNIydL6d+UUERZca4u
	JbIxiGX4rV/DIU4sngqzErEB/8GKYerwUDayaOpq3PoQ+w4n17L7UbT+e4w2ZCJdEBg8vj9vqqU
	3xRP6mOIh89WXMASgLMfJraKU0Mz6v032QIv9fcysZk2VQ/hVsflE1tC0WWJZxxk4VFe0D6gYiI
	nY16jpvyGhXGFRqVqyNy4Sr7SWwqyWKvOnmU8FANVBT0qpzl6bpdSlnDXckW88rndu3G0
X-Received: by 2002:a05:7301:5793:b0:2b0:571a:28a5 with SMTP id 5a478bee46e88-2cbfba8dc09mr8006643eec.18.1775526576565;
        Mon, 06 Apr 2026 18:49:36 -0700 (PDT)
X-Received: by 2002:a05:7301:5793:b0:2b0:571a:28a5 with SMTP id 5a478bee46e88-2cbfba8dc09mr8006615eec.18.1775526575813;
        Mon, 06 Apr 2026 18:49:35 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ce39d13decsm7213135eec.8.2026.04.06.18.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 18:49:34 -0700 (PDT)
Date: Mon, 6 Apr 2026 18:49:32 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] phy: qcom: qmp-pcie: Add Gen5 8-lanes mode for
 Glymur
Message-ID: <adRirK9xyn5T1Bdz@hu-qianyu-lv.qualcomm.com>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
 <20260323-glymur_gen5x8_phy_0323-v2-4-ce0fc07f0e52@oss.qualcomm.com>
 <x3ts7to7c4qnorloahe7cgup3uekn4wolmmorqa3b3bjfslqfn@eijnzdp2ops3>
 <acua8Me0zo3v/CBi@hu-qianyu-lv.qualcomm.com>
 <ac0ubhTTsUNKHD__@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac0ubhTTsUNKHD__@baldur>
X-Proofpoint-GUID: wscKYjIOAZe7i9-DzrlSpUcNIcGXYBhl
X-Proofpoint-ORIG-GUID: wscKYjIOAZe7i9-DzrlSpUcNIcGXYBhl
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d462b1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hLGjiOuCDu-Tey0qOkEA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAxNSBTYWx0ZWRfXx6Yhu1pLEzRu
 Puw6M59AnyDdMIIioqak+yOy3l/6PadzCEZbwaKiSLNJ1nS7/TFAdkZ4BmQYLZF1/alg/AwTxZ/
 46+lzsexwfiSyrFuwWgBa29zxttVtDE51XfFssVtprMS31Q9vD41m1yFPGkyV1av5Slok8aIqdm
 jN7x7emsr4cEZAEu7OIkmpsFwOU2h85yfIENRC7J+yFtNn/MfcmFHcVuMqK0khFepc16DCz2QoC
 A0upsjc2sbSCaM4RE14A21GJQArhj0rQ0ZWbcTCrl86mcFXAo6dxgUNevcpQVo3Tc5Fqd8x1xO2
 DDslL79MBGssvLaie0Gr8Dg4akxs/p/4SxNcCMGY2nWpxW0dtvNjdEfLBCTexG5yFIFcFM2NEZ5
 fN1R5mr0vqxhZQi+hoxmNFWgheY/CQJDsiN0Vd8vHmSLV/jaglmDeFfot8AEEH1vq9MCfWMrej9
 ibW9Fe03ERbGd7uSNGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070015
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102034-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D7B033A8CDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 09:41:03AM -0500, Bjorn Andersson wrote:
> On Tue, Mar 31, 2026 at 02:59:12AM -0700, Qiang Yu wrote:
> > On Tue, Mar 24, 2026 at 11:23:19PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Mar 23, 2026 at 12:15:31AM -0700, Qiang Yu wrote:
> > > > The third PCIe controller on Glymur SoC supports 8-lane operation via
> > > > bifurcation of two PHYs (each requires separate power domian, resets and
> > > > aux clk).
> > > > 
> > > > Add dedicated reset/no_csr reset list ("phy_b", "phy_b_nocsr") and
> > > > clock ("phy_b_aux") required for 8-lane operation. Introduce new
> > > > glymur_qmp_gen5x8_pciephy_cfg configuration to enable PCIe Gen5 x8 mode.
> > > > 
> > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > ---
> > > >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 30 +++++++++++++++++++++++++++++-
> > > >  1 file changed, 29 insertions(+), 1 deletion(-)
> > > > 
> > > > @@ -4705,6 +4713,23 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
> > > >  	.phy_status		= PHYSTATUS_4_20,
> > > >  };
> > > >  
> > > > +static const struct qmp_phy_cfg glymur_qmp_gen5x8_pciephy_cfg = {
> > > > +	.lanes = 8,
> > > > +
> > > > +	.offsets		= &qmp_pcie_offsets_v8_50,
> > > > +
> > > > +	.reset_list		= glymur_pciephy_reset_l,
> > > > +	.num_resets		= ARRAY_SIZE(glymur_pciephy_reset_l),
> > > > +	.nocsr_reset_list	= glymur_pciephy_nocsr_reset_l,
> > > > +	.num_nocsr_resets	= ARRAY_SIZE(glymur_pciephy_nocsr_reset_l),
> > > 
> > > Just for my understanding. If it was not the NOCSR case and had to
> > > program the registers, would we have needed to program anything in the
> > > PCIe3B space?
> > 
> > The PCIe3B PHY registers need to be programmed.
> 
> Why?

Because PCIe3A and PCIe3B are independent PHYs, each has its own SWI
interface. Per the PHY HPG, all SWI interfaces must be configured, so in a
non-NOCSR flow we also need to program PCIe3B PHY registers. This is
required by the hardware design.

- Qiang Yu
> 
> Regards,
> Bjorn
> 
> > But we don't need to do it explicitly because there are also broadcast
> > registers: writing to these registers will automatically write the same
> > offset and value to both PHY ports simultaneously.
> > 
> > - Qiang Yu
> > > 
> > > > +	.vreg_list		= qmp_phy_vreg_l,
> > > > +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> > > > +
> > > > +	.regs			= pciephy_v8_50_regs_layout,
> > > > +
> > > > +	.phy_status		= PHYSTATUS_4_20,
> > > > +};
> > > > +
> > > >  static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
> > > >  {
> > > >  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> > > > @@ -5483,6 +5508,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
> > > >  	}, {
> > > >  		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
> > > >  		.data = &glymur_qmp_gen5x4_pciephy_cfg,
> > > > +	}, {
> > > > +		.compatible = "qcom,glymur-qmp-gen5x8-pcie-phy",
> > > > +		.data = &glymur_qmp_gen5x8_pciephy_cfg,
> > > >  	}, {
> > > >  		.compatible = "qcom,ipq6018-qmp-pcie-phy",
> > > >  		.data = &ipq6018_pciephy_cfg,
> > > > 
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry

