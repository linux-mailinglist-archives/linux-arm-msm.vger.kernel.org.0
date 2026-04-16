Return-Path: <linux-arm-msm+bounces-103330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CJfCk5R4GkiewAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 05:02:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A84409D3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 05:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1FA58300A5B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 03:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E78242D6C;
	Thu, 16 Apr 2026 03:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8LD4ic5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmP0UARv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1DB1EB5FD
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 03:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776308550; cv=none; b=nRcZwUkC2QVTgcVM2XI34K6rdc/l+7lvI+gKNEGtlOJt3VaKCr7XWiCC+lhgz2K9IaceDWDExtMTPgcmht2XuM4oIEj8pxJNNvH5tQBM3Oaou1dJoy1REeud7Hk8Mim4oU7IBZAliqEgXSYS8d/lIS8IslUWQgmuspla6Mf/ZkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776308550; c=relaxed/simple;
	bh=+o+jvoFrFZmDw1k48C125TM6KoABkvpqQ3OGVMX98BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YX7x1585wKb5BEAwJ4tg11/tlqpeMcg3wgi4Vy83GRuPtQ/b2C3EJrOxnih3Bqn9SnaQXtflZw6i/6O11VkCKMDii++phyAymSVD9jYp/jGtCOtp3CaNjlkdVw5v1GdPxAml9A2G36+cPIcVZKxiLs6hxnRBsqJjQnjAPU/bCEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W8LD4ic5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmP0UARv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FGEq6T506891
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 03:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b44JNzE53BT1lgq7H+43OXDM
	7qFNMprAAxSf+qAA9pU=; b=W8LD4ic5sFTbq8ktI7n9weBo7Ae8WFw7ggrALcDh
	SY0R6/WHd9VqBiAdojbFuW2JakBmmo/8ZRTmijiLutiXAdKe9E5aq9hOB7cT3hEf
	NVA+dMjeqozbRubOhCKbwjvdrq+6idLcpeyBLX6VhLfDAXl1CFKSJQ7Ua6vHAeyM
	XFMvj2Ctn4GkE3AX796adBkjraDkkjj4gUEYtkAh78D3TUchV0cFm5iMhAaE9TBs
	W7U7ZbazjrsCr1RanpoJTfmp8II/tkfIi6izEqsCQUM3qTZMrQhX2b6orwZsOqzD
	sBnLYgPPZWjj2tnMoC1FxUEcf+ssKSLRQcj4RKHQp3i5uw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dje1e1qvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 03:02:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2d889997495so16694518eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 20:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776308547; x=1776913347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b44JNzE53BT1lgq7H+43OXDM7qFNMprAAxSf+qAA9pU=;
        b=OmP0UARvEpzHDiUh/T7t61A1a+2LQIuu1QSy4lPALN6x/x+6KKPJlEIYYFc6G2dMUP
         Vrja8sJTZBDWZZAaIWcvgUl3lwMe6vPEtDpXsTGoVi0aut2H7dmfnb2zGl8VKzJHJA3e
         0HtuOnV0pXhQp0tMAJLQa4F9OhCNHFaGDuonnjuZLO+5Itmp8rD21TAtruhZCQ4BJr+g
         JQgr7MvRAD90XGa2f2eJ6xsQGf10Qx9xyNNywRCeJ7Tfriub6PnWnlYtih4zKJhslhc9
         C1MKyClm+R/OABRHoCfr3gzaTRIxrqRrtXQRR2cXi+ouUa3cWiUHoHWA+9EK2xYrI4HB
         V7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776308547; x=1776913347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b44JNzE53BT1lgq7H+43OXDM7qFNMprAAxSf+qAA9pU=;
        b=rEnFan8Q4saTSw1IeiL+AUbdYzwCPbTVqlN3OuX9c14TaCHo5vncuAor/I9oy68vT3
         /7lDob4i2mwXGO+T0vxokv3H6bdw5qTgv7hQMfypyR++QxgO/hinHJjpKnimiXZCPFSD
         PytNoEYA/PClz5vqVh+TaHYIua8DLpOrubUp1P+sqs7uR8LnjouXY1QiK75tSQVbhJ0o
         RzHDaw3F7uidlNcB6vVaapPhOq47+BmALxSmvA52pss85LTA6SJ+8PRP97UYFuOCwHvx
         uTVmjRnwVQLhB3P/sSijVodcVO3r9FQX4ilDy1634OVcMyxnYrmb9SKoqxhXSLgd+eg1
         mwug==
X-Forwarded-Encrypted: i=1; AFNElJ+/jjX32SWJN2Q8ns5QulIWG0RkKg/2JjSwz/7AE9tUtlPqV58vf52IEs3AUznOn95MC54RMxZVFP3iHDId@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh9QySLJeCNv5pByMyNtvYgL6Z8rLPCdvmhtlPqkzFqSUwWkqY
	wnTRzx/msziOgocdYye8XEByFEccdgoxJ3nYJ2D25S3hRfwCawA3TUGFiGRMASTs5moxyf1/MHO
	Mgz1ZF+zm5NNxBk8xYf0TWtODMz86akMoYMGFAISYtlkGwUnxBjEpMfNBg5rcwxMJLcQY
X-Gm-Gg: AeBDietFWFBkhp+HFqEoViw71NnDU66X2eN/C17Sd9uy9oZ16wuiMJX1XXhvNzP2pnI
	ILGArLg8hQH1FBsZhfqNKYHFLz2pYQOyMu6RRwEVA0w1zz57wQhNKmwFtd75s1H1anZpkgFJKnk
	LKu/NAL6bW2uXEVMWG/XMnMAcht/Pq/A/C//y4uPv7yaMU7z8HT5EtPXXPApwaghXxe0CGDmTAc
	kKMBk3kE9VmM1wNqqaOqpSqMuNFbrnhbr/aOaoofthv1E5yEN8GDNRQPHZyhxiI//8YFEi8M0MI
	onYvfI8yztsHnirbs/3Ax3GKRsgg4GrKVJSIibIYLQE1cTTu76sgDWLX+m1afe8ChIIF3ANn3zY
	m3oXdCSgj8UTbD6RS2HR9xXjxUoBREFBNpj48E0KtFu1tKF1N/FAyLL8cELBZWSGGn1zlnQud97
	bc9KQ=
X-Received: by 2002:a05:7301:fa04:b0:2c7:ea98:da0 with SMTP id 5a478bee46e88-2d5881acc5dmr13633629eec.19.1776308547188;
        Wed, 15 Apr 2026 20:02:27 -0700 (PDT)
X-Received: by 2002:a05:7301:fa04:b0:2c7:ea98:da0 with SMTP id 5a478bee46e88-2d5881acc5dmr13633600eec.19.1776308546480;
        Wed, 15 Apr 2026 20:02:26 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb84813sm5364174eec.18.2026.04.15.20.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 20:02:26 -0700 (PDT)
Date: Wed, 15 Apr 2026 20:02:24 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] phy: qcom: qmp-pcie: Support multiple nocsr resets
Message-ID: <aeBRQCmJ4PUBCU9J@hu-qianyu-lv.qualcomm.com>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
 <20260412-glymur_gen5x8_phy_0413-v3-3-affcebc16b8b@oss.qualcomm.com>
 <2675a315153c83c14d1581e019fdddb611139da7.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2675a315153c83c14d1581e019fdddb611139da7.camel@pengutronix.de>
X-Authority-Analysis: v=2.4 cv=HZwkiCE8 c=1 sm=1 tr=0 ts=69e05144 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=cI-NCYQDPU_w6fRkyaMA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDAyNiBTYWx0ZWRfX+Hxk6apicavd
 X2rDv6gcqbxbGTgjEBPY+YA0Pw/tCJtRZyb2C1ws09u+ThkHUNYk7gp8m2UGAPF8ONF6SeSSw7b
 OS9L1rG1WM0jB2uHGqv9wwj7fqKlW9ahRzyUZR/qZR2aJwD+OiuBqu099FLe4jxoF6c8bXoCFt9
 4BXxvltCELbjxuiKXRW0eswSc/jf6Yo2Ga5F8OuD6hjHGfhvR3Qkocl+XW3l/GMV4OBLVjX48ND
 lBh0iNK4w6POwTck/Cfpq1GwVn4KMgvxGXyRrlT5VKA9VN5g0H0b1ksz5I29lRy94Gbw1VMqvCR
 aTK+mI28GFroZ5DhjzwdT9sDmSQo3IZgwbyjwQrlF2HP91Iu86oOoZYOOS2HjvUg/OYbQbt3odR
 Nfg0PqKDr6+ThtJVigXWtutPXEdtPB2tEL+hesdWvUwCndycdUNa2vydDBNne9Bvl491YU3NiDp
 sDiAtdreSevmH/kkf0Q==
X-Proofpoint-ORIG-GUID: CcvwbC9BSJDNUKvMp7SIqlKlxYn34z5v
X-Proofpoint-GUID: CcvwbC9BSJDNUKvMp7SIqlKlxYn34z5v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160026
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103330-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.5.7.0.0.1.0.0.e.5.1.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-qianyu-lv.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 51A84409D3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 10:10:31AM +0200, Philipp Zabel wrote:
> On So, 2026-04-12 at 23:25 -0700, Qiang Yu wrote:
> > Refactor nocsr reset handling to support multiple nocsr resets required
> > for PHY configurations with bifurcated operation modes.
> > 
> > The Glymur SoC's 3rd PCIe instance supports 8-lane mode using two PHYs
> > in bifurcation, where each PHY requires its own nocsr reset to be
> > controlled simultaneously. The current implementation only supports a
> > single nocsr reset per PHY configuration.
> > 
> > Add num_nocsr and nocsr_list fields to struct qmp_phy_cfg to represent the
> > number and names of a group of nocsr reset names. Initialize these fields
> > for all PHYs that have nocsr resets, allowing the driver to correctly
> > acquire multiple nocsr resets during probe and control them as an array
> > by using reset_control_bulk APIs.
> > 
> > The refactoring maintains backward compatibility for existing single
> > nocsr reset configurations while enabling support for multi-PHY
> > scenarios like Glymur's 8-lane bifurcation mode.
> > 
> > Additionally, introduces x1e80100_qmp_gen3x2_pciephy_cfg as a separate
> > configuration from sm8550_qmp_gen3x2_pciephy_cfg since the x1e80100 Gen3x2
> > PHY requires nocsr reset support while the sm8550 Gen3x2 PHY does not.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 87 ++++++++++++++++++++++++++++----
> >  1 file changed, 77 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > index 424c935e27a8766e1e26762bd3d7df527c1520e3..51db9eea41255bad0034bbcfbfdc36894c2bc95f 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> [...]
> > @@ -4998,14 +5054,25 @@ static int qmp_pcie_reset_init(struct qmp_pcie *qmp)
> >  	for (i = 0; i < cfg->num_resets; i++)
> >  		qmp->resets[i].id = cfg->reset_list[i];
> >  
> > -	ret = devm_reset_control_bulk_get_exclusive(dev, cfg->num_resets, qmp->resets);
> > +	ret = devm_reset_control_bulk_get_exclusive(dev, cfg->num_resets,
> > +						    qmp->resets);
> 
> Unrelated and unnecessary change.

Ohk, I changed it by mistake.

> 
> >  	if (ret)
> >  		return dev_err_probe(dev, ret, "failed to get resets\n");
> >  
> > -	qmp->nocsr_reset = devm_reset_control_get_optional_exclusive(dev, "phy_nocsr");
> > -	if (IS_ERR(qmp->nocsr_reset))
> > -		return dev_err_probe(dev, PTR_ERR(qmp->nocsr_reset),
> > -							"failed to get no-csr reset\n");
> > +	if (!cfg->num_nocsr_resets)
> > +		return 0;
> > +	qmp->nocsr_reset = devm_kcalloc(dev, cfg->num_nocsr_resets,
> > +				   sizeof(*qmp->nocsr_reset), GFP_KERNEL);
> > +	if (!qmp->nocsr_reset)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < cfg->num_nocsr_resets; i++)
> > +		qmp->nocsr_reset[i].id = cfg->nocsr_reset_list[i];
> > +
> > +	ret = devm_reset_control_bulk_get_exclusive(dev, cfg->num_nocsr_resets,
> > +						    qmp->nocsr_reset);
> 
> Should this be devm_reset_control_bulk_get_optional_exclusive()?
> 

I have get the num_nocsr_resets previously, so don't need to use
devm_reset_control_bulk_get_optional_exclusive.

- Qiang Yu
> regards
> Philipp

