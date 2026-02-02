Return-Path: <linux-arm-msm+bounces-91555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDkrGKj9gGk6DgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 20:40:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 796D5D095A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 20:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA02B300B528
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 19:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AAA30DD1B;
	Mon,  2 Feb 2026 19:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pt9aBDWc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZsyQJYv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFF5309EF9
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061182; cv=none; b=qLFUMPTqpj8l184cfgozugy/OLqJ8cg8JRIKOEAn/oPAcnUfWIa8nVx9AHmyojqv32OuEafgm1tQT15ypbRQltBmzYuwkSWkc63rq7iUUyHFKGAPum0K/npy0NzN7+RjyVTgZbuVXj6HpuKU9st15K0AXJ99uV9uLX3GJ3pKXzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061182; c=relaxed/simple;
	bh=pt4kShmmoCd3mgoMo2uPMiVLNAM/T7idh2I97ecTmso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGeeseOJq/29Fg3wI/BXvYWRCimJTNMukeq3CWXvfnIj6JmEESREVljlHURe1n58DKieDesXQWtxjaF72grhaIG9mReNJ7MHok1gROYE01oF4PBsVIaKEcWuiRWyKAnvS+Var5nr+/weLSD+ZfU4pbwBo1MoPN6YNZ7SNg+U5hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pt9aBDWc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZsyQJYv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612J46l12899946
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 19:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zk1ULsaiSOs9L7KZAkb1H21D
	x8Ea4YpAW8YrsTNEF04=; b=Pt9aBDWc/m5oCzFPiZ8cOjG2bdTuFcxUx5uHkmLw
	GksTBfw4IYO9+q2ChSSXqN3rrcHEVRtEEJycxEBTOemNszrCQLfrIsXVFDeMXiCu
	5hkWy0k3NEB4SZ5uxX+cJ/ycERvTqrZUdq0SFRal+Qz8ILPYmO7xiO9e9j2Sw+qs
	Ze92RoZvVwM0Rb6TeiI05rvElm8VkI/j3d2dkTebO4JuJP33Gg4U79ADMCN3UBXl
	xPizGyVCjY6wV732p1fMIpjmLG2Qu+euRqcAjic6FNUlhpK5znezAAIvhGhjeowc
	9z45SKFoQzMpZ8PCn75EhE7pQPzBkIwLgh0bJ4LVP7dODQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0sk8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 19:39:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71304beb4so1113892585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 11:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770061178; x=1770665978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zk1ULsaiSOs9L7KZAkb1H21Dx8Ea4YpAW8YrsTNEF04=;
        b=eZsyQJYvzFCfkLjtritqDwVW5sY6+YsMZ5Dx/dTYyPDhRjGvfx7HfLd6NCjykHjTC+
         Pk2l7ddIo56W0dI7BH/LWuyDeliqDdMNuqwneHYDz6RfXDZ2qJ0p1Kz4A/0SzdWp5pKG
         8jIwfkbGeDe0XbfJtV2WDd1iWa9C1I/8KLI+5fRZMQ9YBUNAO4D46llR5mZqmHN73nyJ
         wgqdklHR225o2Glr2/Mz1tBhgugfXph5F1O7xfdcjjLdYvHWVMtLYm7y9qxH436UM3Cr
         FJMuztOsMx+uQv3+SCmyp4Acy8pTvebvvNhdIkA4YCJc5/1J6waEYzFdgTKP6i+ZTe24
         ey3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770061178; x=1770665978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zk1ULsaiSOs9L7KZAkb1H21Dx8Ea4YpAW8YrsTNEF04=;
        b=XsmOxiCI+RiF1rWKGoIGHuFzmbacrukgSEKTYtCERcOxToYIYvxArYoOR01vwiUbMz
         a6Or2IfjQyRvoweFNIGuYyVgD+if6+FR31mKhFIS63mD+UIyhglvVd616qmkfjhoiW++
         1T2f4aWfOZ4yOpA1xqocJonRLDnaratBoOoMZOcCCQi9IrtknJyBzwTXpurwEmO2oEUD
         j8zcfbWI72Xkr/dvOYbiEomSMaL9lMAeYf7gvGHHJM5y8UP7pz1y/AZQuB6ZPV8DtpYn
         U7DggNSavO9xQA8mMVZgOzbvcpZFRtcLy8Dk5utMyhqlRY378F33Udhx20MSR0m/TM97
         cfNA==
X-Forwarded-Encrypted: i=1; AJvYcCWbIaLyJQqdSSGO1OMjfglyzZ/eLIMQQ4B6or54Cw7UbwH649hcCrdhJP2Lf+19AmnjBVvtFED91Ysdz+KB@vger.kernel.org
X-Gm-Message-State: AOJu0YyLLBN1cSsvwdxI7C4Y7dSuMWg/tXv0jYEHDmDj87kkMLZGEAJO
	vlnxUP3F7Ps5+ch2PzOLwM1a3pfVjRUiMee1Rg1HcbQJaOXpKZe0NRl60QSpPbYklEzo1rglR+a
	D4Yjnbn65R8/sS7SntkChFU0bFiScUvI3M1VYb467jsVXwQZ1gv6WAsvXCkS55pwGJx9Y
X-Gm-Gg: AZuq6aKgqY+7F1TgP0xsX6bnrW8QXElSq8F4pfGxcCDqkx2OxZv87ZO5tlzFS9Ycodu
	l9QBHY2LBhyHJSkgLKlzpwTe7ZyHPVvhDfDUDFCPpNQ/bRboK9wE6eSi1bpPoHYJ+JYha4WGAEE
	Muyxp2iGSUPl07catQnWMaeU6Peykl476+v+zg/w9kpy5aasO1fPUXkSPImSzAZatPAHE/pvtgt
	S0JXvNq6Eq5YRIM86qCLzsv1RYqcW0sufJnlEYD73PEdD+a0rvWD7rSnTRpKQlAEC2sOy1oj9bV
	raGUP0/cbb/4cNjiCZCTlzkWWOGYgUOfoaxzQ/wZWc50t0lFvKnnZ1HO5QpLnFh+19GkjcIQ0QE
	ZvkSv0q9iysuq5WZbtl+fetb2QpxrfDehh6U0Gc9stRRZaOZwh871YoX0pHqyeROkV4K1H5K57L
	wpUtZuh9jg62yHxwj3IdtnXy0=
X-Received: by 2002:a05:620a:440b:b0:8a4:107a:6772 with SMTP id af79cd13be357-8c9eb32dfc5mr1640238485a.76.1770061177837;
        Mon, 02 Feb 2026 11:39:37 -0800 (PST)
X-Received: by 2002:a05:620a:440b:b0:8a4:107a:6772 with SMTP id af79cd13be357-8c9eb32dfc5mr1640234985a.76.1770061177333;
        Mon, 02 Feb 2026 11:39:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e0748993esm3734670e87.37.2026.02.02.11.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:39:36 -0800 (PST)
Date: Mon, 2 Feb 2026 21:39:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 3/8] pinctrl: qcom: Allow exposing reference clocks
 living in TLMM reg space
Message-ID: <xkndkbp6w7xh23wc4xd2yjakiic5kcwviwcgi3vq4quct2z4tu@m7dxfub5ike7>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-3-cd7e6648c64f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-topic-8750_tcsr-v1-3-cd7e6648c64f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: yMmD8Ie-C4PC6wkrW3-Y35k6VWBjSz0Q
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=6980fd7a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2tca-NSePewhJHxpEWQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE1MyBTYWx0ZWRfX3f+cAtuFj/g4
 987pId5SlAAU8j1YMoXknuKm0rtJPxbMuo4uSiZbI15ja1s3YTju23fVRZHPeO1QSZ8p98mi68c
 Cc7L2bNd4STU1dv9kSqX2cqK3eRqU0YtjhOpgz6SnkY/+rldGERwBwbx/H5UptBD7SnbGjfd/XM
 8Pur0kUxC0nunoPt6OZo90t1mneRr8MBp0pQLhqAoxSP0zGUymnxGRjWeDWOtW62VxlERljJf1H
 /MMzgP3/w7/FrHBBQJ75LIjnVJtqkQThMYQrTuEr2kOk6i4IzeSCop2exMi9PTrES0YS9AeGf+R
 dV8YyeOeqIGa+PiXY+Tbfl6mPqIrZ5ZmpJhVJGlkAHlNQKSrfZ+dGldNnyq/0SbUShv+vW04atE
 PyYr3GrUZBlsO82x0CEC8x+LJy9kpudpBQlSsJOkd9erfD7miwlUV3LXDBH4UAT980z1UMm8ZZT
 WyyufAR5i4hU3cVQHmQ==
X-Proofpoint-GUID: yMmD8Ie-C4PC6wkrW3-Y35k6VWBjSz0Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91555-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,init.name:url,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 796D5D095A
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 03:57:35PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Certain platforms (at least SM8750) had a number of registers
> (responsible for gating refclk output to various consumers) moved to
> TLMM. They're simple on/off toggles.
> 
> Expose them from the msm-pinctrl driver to allow for a reasonable DT
> representation.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 92 ++++++++++++++++++++++++++++++++++++++
>  drivers/pinctrl/qcom/pinctrl-msm.h | 14 ++++++
>  2 files changed, 106 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index e99871b90ab9..1a52431a8605 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -4,6 +4,7 @@
>   * Copyright (c) 2013, The Linux Foundation. All rights reserved.
>   */
>  
> +#include <linux/clk-provider.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/gpio/driver.h>
> @@ -16,6 +17,7 @@
>  #include <linux/pm.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/reboot.h>
> +#include <linux/regmap.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> @@ -80,6 +82,7 @@ struct msm_pinctrl {
>  	const struct msm_pinctrl_soc_data *soc;
>  	void __iomem *regs[MAX_NR_TILES];
>  	u32 phys_base[MAX_NR_TILES];
> +	struct ref_clk ref_clks[];
>  };
>  
>  #define MSM_ACCESSOR(name) \
> @@ -1525,9 +1528,69 @@ SIMPLE_DEV_PM_OPS(msm_pinctrl_dev_pm_ops, msm_pinctrl_suspend,
>  
>  EXPORT_SYMBOL(msm_pinctrl_dev_pm_ops);
>  
> +static int clkref_enable(struct clk_hw *hw)
> +{
> +	struct ref_clk *rclk = container_of(hw, struct ref_clk, hw);
> +	u32 val;
> +
> +	regmap_write(rclk->regmap, rclk->init.offset, BIT(0));
> +	udelay(10);
> +
> +	regmap_read(rclk->regmap, rclk->init.offset, &val);
> +
> +	return (val & BIT(0)) ? 0 : -EINVAL;
> +}
> +
> +static void clkref_disable(struct clk_hw *hw)
> +{
> +	struct ref_clk *rclk = container_of(hw, struct ref_clk, hw);
> +
> +	regmap_write(rclk->regmap, rclk->init.offset, 0);
> +
> +	udelay(10);
> +}
> +
> +static int clkref_is_enabled(struct clk_hw *hw)
> +{
> +	struct ref_clk *rclk = container_of(hw, struct ref_clk, hw);
> +	u32 val;
> +
> +	regmap_read(rclk->regmap, rclk->init.offset, &val);
> +
> +	return !!val;
> +}
> +
> +static const struct clk_ops clkref_ops = {
> +	.enable = clkref_enable,
> +	.disable = clkref_disable,
> +	.is_enabled = clkref_is_enabled,
> +};
> +
> +static struct clk_hw *msm_pinctrl_clk_get(struct of_phandle_args *clkspec, void *data)
> +{
> +	struct msm_pinctrl *pctrl = data;
> +	u32 idx = clkspec->args[0];
> +
> +	if (idx >= pctrl->soc->num_ref_clks)
> +		return ERR_PTR(-EINVAL);
> +
> +	return &pctrl->ref_clks[idx].hw;
> +}
> +
> +static const struct clk_parent_data clkref_parent_data = {
> +	.index = 0, /* RPM(h) XO clock */
> +};
> +
> +static const struct regmap_config clkref_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +};
> +
>  int msm_pinctrl_probe(struct platform_device *pdev,
>  		      const struct msm_pinctrl_soc_data *soc_data)
>  {
> +	struct device *dev = &pdev->dev;
>  	const struct pinfunction *func;
>  	struct msm_pinctrl *pctrl;
>  	struct resource *res;
> @@ -1595,6 +1658,35 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>  	if (ret)
>  		return ret;
>  
> +	if (soc_data->num_ref_clks) {
> +		struct regmap *regmap = devm_regmap_init_mmio(dev, pctrl->regs[0],
> +							      &clkref_regmap_config);
> +		if (IS_ERR(regmap))
> +			return PTR_ERR(regmap);
> +
> +		for (int i = 0; i < soc_data->num_ref_clks; i++) {
> +			struct clk_hw *hw = &pctrl->ref_clks[i].hw;
> +			struct clk_init_data init = { };
> +
> +			init.name = pctrl->soc->ref_clks[i]->name;
> +			init.parent_data = &clkref_parent_data;
> +			init.num_parents = 1;
> +			init.ops = &clkref_ops;
> +			hw->init = &init;
> +
> +			ret = devm_clk_hw_register(dev, hw);
> +			if (ret)
> +				return dev_err_probe(dev, ret, "Couldn't register clock %s\n",
> +						     init.name);
> +
> +			pctrl->ref_clks[i].regmap = regmap;

This will access beyond the end of the allocated chunk, because you
haven't extended pctrl allocation.

> +		}
> +
> +		ret = devm_of_clk_add_hw_provider(dev, msm_pinctrl_clk_get, pctrl);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Couldn't register clk provider\n");
> +	}
> +
>  	platform_set_drvdata(pdev, pctrl);
>  
>  	dev_dbg(&pdev->dev, "Probed Qualcomm pinctrl driver\n");
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
> index 4625fa5320a9..213cc789711d 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.h
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
> @@ -5,6 +5,7 @@
>  #ifndef __PINCTRL_MSM_H__
>  #define __PINCTRL_MSM_H__
>  
> +#include <linux/clk-provider.h>
>  #include <linux/pm.h>
>  #include <linux/types.h>
>  
> @@ -129,6 +130,17 @@ struct msm_gpio_wakeirq_map {
>  	unsigned int wakeirq;
>  };
>  
> +struct ref_clk_init_data {
> +	const char * const name;
> +	u32 offset;
> +};
> +
> +struct ref_clk {
> +	struct clk_hw hw;
> +	struct regmap *regmap;
> +	struct ref_clk_init_data init;
> +};
> +
>  /**
>   * struct msm_pinctrl_soc_data - Qualcomm pin controller driver configuration
>   * @pins:	    An array describing all pins the pin controller affects.
> @@ -170,6 +182,8 @@ struct msm_pinctrl_soc_data {
>  	bool wakeirq_dual_edge_errata;
>  	unsigned int gpio_func;
>  	unsigned int egpio_func;
> +	const struct ref_clk_init_data **ref_clks;
> +	unsigned int num_ref_clks;
>  };
>  
>  extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
> 
> -- 
> 2.52.0
> 

-- 
With best wishes
Dmitry

