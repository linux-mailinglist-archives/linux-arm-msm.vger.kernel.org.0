Return-Path: <linux-arm-msm+bounces-110115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCKgItw+GGo1hggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:10:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A275F280B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE06E314C3C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7253EE1C5;
	Thu, 28 May 2026 13:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DlygLqxQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FmugDs1I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09673DFC92
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779973567; cv=none; b=QCkRnzT43i7BMfft9sAfNt+sF5CZXcatlbq07BeG/fxAE/Aph99V+/D7Yn/GyxfSoYYIYoTbPSc58JH4Dn5LDSsx0pP1f0BFtJ8hPv5kxLybrR27yXfjpMnPhdXJQBsdEWptTJ0UMJkD70cMo0QlUGLwchdbvpEd+oazh+XpUOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779973567; c=relaxed/simple;
	bh=2dx7XnTCj+NZ11GPCA/spoaPSLAnqQWzzkWZlIivCso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cf71pxyVfJZ3lByKoBUPaoHzBYKDZNBS0gtDhrCCui1XKtAeSEMmzv8jsllhHJcBCGjP4f098NEqxw3aLIqBRS4eMFRaRXuil2LhChDXl3XhNoVnvmMx1PnQcg8o3LHoYU0IQUNjFI2h99ynGc+B5CgMaRLCiOQ9kcW3GSexOF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DlygLqxQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FmugDs1I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vOnV3545365
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dsz4y/jsHnE84DUpAVPR6dcT
	RMfn2SRESjfMWzXYL7w=; b=DlygLqxQRmUejKANRBpyhyq7D2ngcc36gGkXFpKp
	yfOCmBfA9/sUW6S27Ko21hbYtw96zfl+sCK8kXg89aEt6Fk9UZkengbktVc4KlEY
	oUlRPe7SghWv+sHZDqITuXLk8dV8j/EUkWUs5swX+euhDqcnz/U280CAVL4sHiSN
	07C+mUHPyS485FoFGEIdlcpBVxrSLks6gnzMdN0mKSIfPB1e7bE7uu3e6sG9KHrg
	DYFEvTabP0m2W0d1KBsNojPMUv6xCD9DGmm1S2xbdLqylztH4Kw9vFMtMRxT4ANN
	YuOfg8VZAi2y1F8+3oMUibmVJyM52S1aH8UvoXlJ6/aM5Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3tsmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:06:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so9888568eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779973563; x=1780578363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dsz4y/jsHnE84DUpAVPR6dcTRMfn2SRESjfMWzXYL7w=;
        b=FmugDs1IzbzZfcjX8pTZKxCQRyq3T28bUCXdLU3Tk6k5GTh24TzLuxINBMFU2f8hx0
         tWLq6alniNHNWhX1FX4GzpQRf74w058/Caa3576OfQYShKM8dYebe3i2IYs5CWWh/hou
         gq+bYKOmWlSGt8Z3lw27T9jhNY+djuat7eQGOo/c03P8ouxKanqZek7s4JblrfwVP0LN
         QQbfH3EgS4RsPksYVjADoejFFr+T1ZL6QRQFH5qAnVnmLCQ1wrPyZu/5p+WBF9JmJi0U
         31mTZ6huqyi3d0PyNOQoveJfV8J0s0xgWvykHTdsS8zMzZR5Rpk884QALuYK2KnoDHhQ
         aTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779973563; x=1780578363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsz4y/jsHnE84DUpAVPR6dcTRMfn2SRESjfMWzXYL7w=;
        b=F5jFG9fJs+IqJTcZIBTkrspLKNxNj0E8u+vhcKksfonfFWnpbzXSQq4kILReRlyuwi
         01x7LneOhIXno0MMVAPSIWMN+SLyjQpYWltOLAe9aaiaUW2K9Enukb1B05pSv8S+EngT
         NfBKfqr8yI9h00zHdQOhlPAmjEeQT8VuCaHzDTFpQ7pIoD1Nr5fkHcc5Ffjd7fFutWPu
         6CbFnAeCI0L+I/v64fWXMQ2wx6OPlpO4ucQhiNk8YnqSRtVx8ksjaNL/MN3WfGdHMbv2
         XFYXlKHI+MSJfj8acgnH/XMcrKcRXmG9VE1OiMxMXXtxaGjSFSOLsYnHA1Gq4gBN9jIY
         6dSQ==
X-Forwarded-Encrypted: i=1; AFNElJ8mewxmjwvq7bofecNj6Ob1e9egnek9pVl7kn9+szhiQqk7hwLmMqjJnKm5fpx7bQFgUBub+aTX0Kb3+/ZV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0zX6PanAO3UtyjXpxjeqKNJLYzl3GHBpbwN6mOQj38LtXVpe3
	FsDbl+cnGUepVyQO2yuPTJOU0HhqZRI08xbJ/FCUXY5XomasoAmI8OK1ghZ8D0NmOjquMwjnMji
	b/PreyliI6RAE9OL/SkO2neEVnnX0ZiWhzdRMbLci2hR+MsLolYSlELRhNdPBL9WpKVaM
X-Gm-Gg: Acq92OHHxOth5WVNzaRStKLP3CzNaUfRs2aiZWRLILLAiI8wlL4syGSISr0uv2BqJex
	RMLOmBhlyZUvT+ULIfZG0ZRxjcoa+uBnCF7pABjqgKCaKCCCUWWF3jhX/TELlrlxFzskzLZ7cTz
	9qSOmpJ97rgJzbkvNP661ot7fDtWlWpWYLK3P3DMzk8EBT31+SHaDYiGT1m3j54rQQ/QnWkVHHB
	LnoEZeb5+kgTlLoLViiMnmIxz4dOzNvOZtqiuw1vW822JjUGA8mMzSODjxEhE+BhCFPmqsZ4wjm
	mF2bsFP1zQnP9M+TQQBT4HO6N0SD/X7Nk1Ash3ZNyXZY34KoxgqZUH+2kR9XladA34LkgqS90+e
	eq78L4wcUGPhrdB/aShAzR4EorXGUUwtsmy5gkrwxRL8rZ4Db/QmEtDIpDWNq2H3Rc9cXCwrD3D
	OMQ7w=
X-Received: by 2002:a05:7300:e7b0:b0:304:8366:7456 with SMTP id 5a478bee46e88-30483667641mr7662270eec.3.1779973563329;
        Thu, 28 May 2026 06:06:03 -0700 (PDT)
X-Received: by 2002:a05:7300:e7b0:b0:304:8366:7456 with SMTP id 5a478bee46e88-30483667641mr7662234eec.3.1779973562670;
        Thu, 28 May 2026 06:06:02 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304caa59edfsm2867340eec.9.2026.05.28.06.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:06:02 -0700 (PDT)
Date: Thu, 28 May 2026 06:06:00 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
Message-ID: <ahg9uFs1LqthstWi@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
 <332c5b1e-8b70-4902-99f3-536dfe8e32bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <332c5b1e-8b70-4902-99f3-536dfe8e32bf@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6_rLrpaqZNu1wPy0_8r8-shjdCu6_OAr
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a183dbc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QtLozxm0LbZb5dkVMQ8A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 6_rLrpaqZNu1wPy0_8r8-shjdCu6_OAr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzMiBTYWx0ZWRfXzmP5QrYfIyWV
 g5RZsT0iwgsSzx1jzlDT1Q3mN3iqNF8ZAnCwf0vI2xYjk6A3cUYUp2vQgCeO5kZNzftetq/hZ9K
 oJrlV5WIwEYXeZhY9oc50uTEXVp6KlKZ1YFVqYnJcvWvxfV0viZqaSVKOckYwoJ3oVFjNkIfBDE
 vpL69YqvVZXh9V6aCCQvkIP6cQTq50pIVllGCXUMVgZwblRxDqR4/budgvHwn7eKCOBISgc+r0A
 aRZY7V5OE18yqdWLJIwmw8k37tzN9kc2HLTd8ZW8oFnMoZloawmJR/RpGdf5bXg/4PoP86hwzgG
 7F668x7q+QhyJBZ15QDpq0Ie8GlrNStomxyWHipD7lxKNRtzm4hpCFlniUZ/v/EdPghUjO/gnpa
 0XKSo8MSLD33+HDlkst5OX2xwdLg+CKq/xYSJXUy6kwFHAr4W/q7195zk0N4MuKFKVmrP7L07Ln
 Iy2TLyKH+XZ+G4cbgvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280132
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110115-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3A275F280B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 11:03:45AM +0800, Jie Gan wrote:
> 
> 
> On 5/28/2026 10:29 AM, Qiang Yu wrote:
> > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > register controls whether refclk is gated through to the PHY side.
> > 
> > These clkref controls are different from typical GCC branch clocks:
> > - only a single enable bit is present, without branch-style config bits
> > - regulators must be voted before enable and unvoted after disable
> > 
> > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > of reusing struct clk_branch semantics.
> > 
> > Also provide a common registration/probe API so the same clkref model
> > can be reused regardless of where clkref_en registers are placed, e.g.
> > TCSR on glymur and TLMM on SM8750.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >   drivers/clk/qcom/Makefile  |   1 +
> >   drivers/clk/qcom/clk-ref.c | 205 +++++++++++++++++++++++++++++++++++++++++++++
> >   include/linux/clk/qcom.h   |  69 +++++++++++++++
> >   3 files changed, 275 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> > index e100cfd6a52d..c5b02360861d 100644
> > --- a/drivers/clk/qcom/Makefile
> > +++ b/drivers/clk/qcom/Makefile
> > @@ -8,6 +8,7 @@ clk-qcom-y += clk-pll.o
> >   clk-qcom-y += clk-rcg.o
> >   clk-qcom-y += clk-rcg2.o
> >   clk-qcom-y += clk-branch.o
> > +clk-qcom-y += clk-ref.o
> >   clk-qcom-y += clk-regmap-divider.o
> >   clk-qcom-y += clk-regmap-mux.o
> >   clk-qcom-y += clk-regmap-mux-div.o
> > diff --git a/drivers/clk/qcom/clk-ref.c b/drivers/clk/qcom/clk-ref.c
> > new file mode 100644
> > index 000000000000..213c0f58bb36
> > --- /dev/null
> > +++ b/drivers/clk/qcom/clk-ref.c
> > @@ -0,0 +1,205 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/clk/qcom.h>
> > +#include <linux/delay.h>
> > +#include <linux/err.h>
> > +#include <linux/export.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/slab.h>
> > +
> > +#define QCOM_CLK_REF_EN_MASK BIT(0)
> > +
> > +struct qcom_clk_ref_provider {
> > +	struct qcom_clk_ref *refs;
> > +	size_t num_refs;
> > +};
> > +
> > +static inline struct qcom_clk_ref *to_qcom_clk_ref(struct clk_hw *hw)
> > +{
> > +	return container_of(hw, struct qcom_clk_ref, hw);
> > +}
> > +
> > +static const struct clk_parent_data qcom_clk_ref_parent_data = {
> > +	.index = 0,
> > +};
> > +
> > +static int qcom_clk_ref_prepare(struct clk_hw *hw)
> > +{
> > +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> > +	int ret;
> > +
> > +	if (!rclk->desc.num_regulators)
> > +		return 0;
> > +
> > +	ret = regulator_bulk_enable(rclk->desc.num_regulators, rclk->regulators);
> > +	if (ret)
> > +		pr_err("Failed to enable regulators for %s: %d\n",
> > +		       clk_hw_get_name(hw), ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static void qcom_clk_ref_unprepare(struct clk_hw *hw)
> > +{
> > +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> > +
> > +	if (rclk->desc.num_regulators)
> > +		regulator_bulk_disable(rclk->desc.num_regulators, rclk->regulators);
> > +}
> > +
> > +static int qcom_clk_ref_enable(struct clk_hw *hw)
> > +{
> > +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> > +	int ret;
> > +
> > +	ret = regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK,
> > +				 QCOM_CLK_REF_EN_MASK);
> > +	if (ret)
> > +		return ret;
> > +
> > +	udelay(10);
> 
> try usleep_range instead of udelay for better power consumption.
>

The .enable and .disable callbacks are called under the clock framework's
enable spinlock, so sleeping is not allowed here. udelay is intentional.

> > +
> > +	return 0;
> > +}
> > +
> > +static void qcom_clk_ref_disable(struct clk_hw *hw)
> > +{
> > +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> > +
> > +	regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK, 0);
> > +	udelay(10);
> > +}
> > +
> > +static int qcom_clk_ref_is_enabled(struct clk_hw *hw)
> > +{
> > +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> > +	u32 val;
> > +	int ret;
> > +
> > +	ret = regmap_read(rclk->regmap, rclk->desc.offset, &val);
> > +	if (ret)
> > +		return ret;
> 
> regmap_read returns a negative error code on failure, but the
> clk_ops.is_enabled() treats the non-zero value as enabled.
>

A regmap_read failure doesn't mean the clock is disabled.

- Qiang Yu
> Thanks,
> Jie
> 
> > +
> > +	return !!(val & QCOM_CLK_REF_EN_MASK);
> > +}
> > +
> > +static const struct clk_ops qcom_clk_ref_ops = {
> > +	.prepare = qcom_clk_ref_prepare,
> > +	.unprepare = qcom_clk_ref_unprepare,
> > +	.enable = qcom_clk_ref_enable,
> > +	.disable = qcom_clk_ref_disable,
> > +	.is_enabled = qcom_clk_ref_is_enabled,
> > +};
> > +
> > +static int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
> > +				 struct qcom_clk_ref *clk_refs,
> > +				 const struct qcom_clk_ref_desc *descs,
> > +				 size_t num_clk_refs)
> > +{
> > +	const struct qcom_clk_ref_desc *desc;
> > +	struct qcom_clk_ref *clk_ref;
> > +	size_t clk_idx;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
> > +		clk_ref = &clk_refs[clk_idx];
> > +		desc = &descs[clk_idx];
> > +
> > +		if (!desc->name)
> > +			continue;
> > +
> > +		clk_ref->regmap = regmap;
> > +		clk_ref->desc = *desc;
> > +
> > +		if (clk_ref->desc.num_regulators) {
> > +			clk_ref->regulators = devm_kcalloc(dev, clk_ref->desc.num_regulators,
> > +							   sizeof(*clk_ref->regulators),
> > +							   GFP_KERNEL);
> > +			if (!clk_ref->regulators)
> > +				return -ENOMEM;
> > +
> > +			for (i = 0; i < clk_ref->desc.num_regulators; i++)
> > +				clk_ref->regulators[i].supply =
> > +					clk_ref->desc.regulator_names[i];
> > +
> > +			ret = devm_regulator_bulk_get(dev, clk_ref->desc.num_regulators,
> > +						      clk_ref->regulators);
> > +			if (ret)
> > +				return dev_err_probe(dev, ret,
> > +						     "Failed to get regulators for %s\n",
> > +						     clk_ref->desc.name);
> > +		}
> > +
> > +		clk_ref->init_data.name = clk_ref->desc.name;
> > +		clk_ref->init_data.parent_data = &qcom_clk_ref_parent_data;
> > +		clk_ref->init_data.num_parents = 1;
> > +		clk_ref->init_data.ops = &qcom_clk_ref_ops;
> > +		clk_ref->hw.init = &clk_ref->init_data;
> > +
> > +		ret = devm_clk_hw_register(dev, &clk_ref->hw);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static struct clk_hw *qcom_clk_ref_provider_get(struct of_phandle_args *clkspec, void *data)
> > +{
> > +	struct qcom_clk_ref_provider *provider = data;
> > +	unsigned int idx = clkspec->args[0];
> > +
> > +	if (idx >= provider->num_refs)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	if (!provider->refs[idx].regmap)
> > +		return ERR_PTR(-ENOENT);
> > +
> > +	return &provider->refs[idx].hw;
> > +}
> > +
> > +int qcom_clk_ref_probe(struct platform_device *pdev,
> > +		       const struct regmap_config *config,
> > +		       const struct qcom_clk_ref_desc *descs,
> > +		       size_t num_clk_refs)
> > +{
> > +	struct qcom_clk_ref_provider *provider;
> > +	struct device *dev = &pdev->dev;
> > +	struct regmap *regmap;
> > +	void __iomem *base;
> > +	int ret;
> > +
> > +	base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	regmap = devm_regmap_init_mmio(dev, base, config);
> > +	if (IS_ERR(regmap))
> > +		return PTR_ERR(regmap);
> > +
> > +	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
> > +	if (!provider)
> > +		return -ENOMEM;
> > +
> > +	provider->refs = devm_kcalloc(dev, num_clk_refs, sizeof(*provider->refs),
> > +				      GFP_KERNEL);
> > +	if (!provider->refs)
> > +		return -ENOMEM;
> > +
> > +	provider->num_refs = num_clk_refs;
> > +
> > +	ret = qcom_clk_ref_register(dev, regmap, provider->refs, descs,
> > +				    provider->num_refs);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return devm_of_clk_add_hw_provider(dev, qcom_clk_ref_provider_get, provider);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_clk_ref_probe);
> > diff --git a/include/linux/clk/qcom.h b/include/linux/clk/qcom.h
> > new file mode 100644
> > index 000000000000..09e2e3178cfb
> > --- /dev/null
> > +++ b/include/linux/clk/qcom.h
> > @@ -0,0 +1,69 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#ifndef __LINUX_CLK_QCOM_H
> > +#define __LINUX_CLK_QCOM_H
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/errno.h>
> > +#include <linux/kconfig.h>
> > +#include <linux/regmap.h>
> > +#include <linux/types.h>
> > +
> > +struct device;
> > +struct platform_device;
> > +struct regulator_bulk_data;
> > +
> > +/**
> > + * struct qcom_clk_ref_desc - descriptor for a clkref_en gate clock
> > + * @name: clock name exposed to the common clock framework
> > + * @offset: clkref_en register offset from the block base
> > + * @regulator_names: optional supply names enabled while preparing the clock
> > + * @num_regulators: number of entries in @regulator_names
> > + */
> > +struct qcom_clk_ref_desc {
> > +	const char *name;
> > +	u32 offset;
> > +	const char * const *regulator_names;
> > +	unsigned int num_regulators;
> > +};
> > +
> > +/**
> > + * struct qcom_clk_ref - per-clock data for a clkref_en gate clock
> > + * @hw: common clock framework hardware clock handle
> > + * @init_data: common clock framework registration data
> > + * @regmap: register map backing the clkref_en register
> > + * @desc: clock descriptor copied at registration time
> > + * @regulators: optional bulk regulator handles for @desc.regulator_names
> > + */
> > +struct qcom_clk_ref {
> > +	struct clk_hw hw;
> > +	struct clk_init_data init_data;
> > +	struct regmap *regmap;
> > +	struct qcom_clk_ref_desc desc;
> > +	struct regulator_bulk_data *regulators;
> > +};
> > +
> > +#if IS_ENABLED(CONFIG_COMMON_CLK_QCOM)
> > +
> > +int qcom_clk_ref_probe(struct platform_device *pdev,
> > +		       const struct regmap_config *config,
> > +		       const struct qcom_clk_ref_desc *descs,
> > +		       size_t num_clk_refs);
> > +
> > +#else
> > +
> > +static inline int
> > +qcom_clk_ref_probe(struct platform_device *pdev,
> > +		   const struct regmap_config *config,
> > +		   const struct qcom_clk_ref_desc *descs,
> > +		   size_t num_clk_refs)
> > +{
> > +	return -EOPNOTSUPP;
> > +}
> > +
> > +#endif
> > +
> > +#endif
> > 
> 

