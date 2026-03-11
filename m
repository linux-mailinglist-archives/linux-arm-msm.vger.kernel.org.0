Return-Path: <linux-arm-msm+bounces-97024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0COCL+iBsWmjCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:53:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD61265CD8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED42D31AD709
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60EF3CEB86;
	Wed, 11 Mar 2026 14:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDxadHvI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DA7xQc5S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7CB3644B3
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240631; cv=none; b=YuGiI5hN3lFq2KguygfWpWlIIP+c8ddFw4xG/mLaLsZ0FJiVsNVOQF1knVhXhJYlNv0b21RIORlxHV3fAIUoMIs7ZKftIUOYg49GztD6aqPkmWFnRTkcZuJCJ9qAPklfUcUG21EH2JvIp5VwOHJThiDDNkS5s/8HffnBN/7YcPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240631; c=relaxed/simple;
	bh=sqSC6+/K44mssFzse64hRisr9Lwqqa7dRnsrkspm/nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGu/F5liJ4Qma9QaOEllJAAWNmlAmghd74bc4XKqKEUWMhAK9Vi661nsfs2b6GHW3Y4TW889MlusW5VpDydiqhjKTBbOL6RjRXrrYPs1w75AufV9606pY+v8rpsdpc3MZAKthsNoeA4D6UFQZcPiPi0AnrvTDqyiuhlqSwzfIJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDxadHvI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DA7xQc5S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9YxBC2179278
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YvrtAHy/lbnLFEN+e13f6AZn
	kCjI5WMhkOhjmIeICPw=; b=bDxadHvIawOHnBUjjGeNuA4s8/UiVOiZMhoj11U9
	Ug3TnUYZ09Iq1vbDY+ZRpltmngoQy94Oqthi2RBxi2PE7xjkZrBm4DkAe6hXjLFa
	CLfGNBHNxv1qLjdvdTE3I1y1lcK/4soESX5xfWchsJ6CRldW7OlijRuC2yHfPdv4
	cereTc03W2fU4JgoulCEnJMEloTHPtnLFkikin7YEI6qfU+1vpfWaMzni9X7ROM9
	3pXC3dlzrDsYyDtUP0BqKhYy2SofV4UOUw+9/sDk41MQZmqVq2ne6AvF34710jez
	AdlojjzleXYPgOVibnoleVsdrPcsTDeh2Nr+VguKmnWxmQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqvsv0ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:50:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd81c571a5so1880987585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 07:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773240628; x=1773845428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YvrtAHy/lbnLFEN+e13f6AZnkCjI5WMhkOhjmIeICPw=;
        b=DA7xQc5SntshUHnvjd1FvxUk5rLbX6ab2rJu+QY7YhTZXc7Oa97FUb5AUysUUCCxnG
         wujjqJmjLPCT+ArmjcTRM1qL+dn6repgvu0RIS+ZV/uh/2B1l2TVafZSem8vnIeJC+Nc
         Zsb94Y7kE33iij8d+TKEQ9sGHRDj+XYtW4ADjYzk6HlMyYcEY8bTBfDLFer7V8fOr7cK
         bqpK7gvVaZbnurzKCAbNJYdZl5mndQoe7R+fATJZSw8vQ/vlNcs+ZXftjT8mrXny/zs8
         R0exVzuDaCMm0rQAnpiR7FjeCv+n1jd/Pg0KvwQH73UFSZDR8iiCjgKDLHMNcGjzs9qI
         QZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773240628; x=1773845428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvrtAHy/lbnLFEN+e13f6AZnkCjI5WMhkOhjmIeICPw=;
        b=PKdmQ6LQjmrj8t7OzIKFiHE9bFpmhuJ2nJOh0QPEUdmeDqVLKmcX9xlCAlQRr8qG2a
         fYCMiPKwadyRFpXd3UzdgTIIcm69pIEgWNTDwrkeMZV1RwLc+Dl6z53Q25DhIbTyj00t
         SFJV3ogU7x8amhOEUZN9ZzwUoGfAcoHIz6AJf2edHLcUqRIJSnRuRjDz4WnOSe+p4TCm
         3qY5RLF65KSuY1BLf+VVUD+oBkNV+6OmLzjGZWjbgqfc4vKB/BYnuo97MunVXVvnXLeO
         8InURZdVkh8gIkMZMCU3Aeg9aP+UJcn3Ikb7Pu9nVMbG33CRIDw2rfp6cK1EizTp2YFA
         NFlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzixnAeinQ30gqFJgLWQ5gfy5I7QoB+kfEzYma8Pho1yzPYjxVVgvpmxzirx7L7G8D3Oxkec/urGESCrM3@vger.kernel.org
X-Gm-Message-State: AOJu0YxvLT1DlsG8NXhA8+i40AcCYbFXZtVRiYM/6l542QZAcD+cAl5q
	fjEMbhTSuVi0hvUWo+WBC1WdFF4rSeogvWP8qErOyALET/EtOFCVkM8bgWGiB4UdY9YZP5lP6I3
	non5JR1yJKY2JLiMk1rLpYEWBvta2jZk6mVPfkS9Rm6qvP0JqXyJ6PaSsUSsGvQKoYY/I
X-Gm-Gg: ATEYQzxVWD1L4UyD3aiB4gpd9WRAZjXerVMREGv3Ko4J523j2hwUgE4hm43jzMTsK55
	j1WCylKafw66y131Njl5xzs9iXii2WnvrZfoVYOA372Issgi6lsY/qen5CGaB5yOU2TdsJZAVLC
	zBFkqoqrDcam+W15XmA9XYcglpTAWrop8vteGW9dVibubobPRe2W2BqoaL5iqVXco++dDzNcz6c
	IwCxQH+NL2hKE9g7iiGOAsHmwbBfd0/ggyAHbjE385f6DCLBxpfBdwq2EYRTeWNidEfebDOwi1U
	X009kAH2bpdFR6X+srJNmLcJs42q5o7fjY0OZMGsvWP1myK0N1YIttPOOkEBbVeHPKb6wN/GysM
	LrszbXAYaeqB9dChnnPnW1n+rji08uev8OAbHcpOeowxku24QPvDQrjAI5J2EkQdLqgME7SwRVu
	7cUksZj8UoM8zxt3+t3t9Elvf/0JTEKjY2HMw=
X-Received: by 2002:a05:620a:2942:b0:8cb:32eb:e02e with SMTP id af79cd13be357-8cda1a81d9emr339025385a.76.1773240627765;
        Wed, 11 Mar 2026 07:50:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2942:b0:8cb:32eb:e02e with SMTP id af79cd13be357-8cda1a81d9emr339020985a.76.1773240627283;
        Wed, 11 Mar 2026 07:50:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1560348e5sm434123e87.39.2026.03.11.07.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:50:26 -0700 (PDT)
Date: Wed, 11 Mar 2026 16:50:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: Re: [PATCH 2/9] clk: qcom: add Global Clock controller (GCC) driver
 for IPQ5210 SoC
Message-ID: <yzw4ruhxaznndpyzlrqnxlbrveenlpl4yp2ebbshyh2yo7te2n@64gldqqmk3nb>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-2-fe857d68d698@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-2-fe857d68d698@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyNSBTYWx0ZWRfX554DvMXzVcI6
 KSDrRdjBByE8uANYEopJQgBgOHrYGqFovIeNE66W3Uffmj3DIMfQhZqvUa0ecxspSXsxcm9/9ec
 2UR7yrCBTagJSNEFbuC28SLqCsaNaeWQZNKe7OsRZ88VWM37GqBeAhD0SPQUEZ0QRZl7j7swLtY
 HHZ4KHiBa3IJNwO3eSvj8qf8T3CWS/PaLm/lbjT1H1ogsjPWrr9BFMmW8O2Pmh5T/HYZxSw0pOK
 Ge0aUA6XIkdDPYgD17RWvQKZ+kQeAjSrlW+MisCdWru3Czffg73hjGSfRZ5UjzwTsJSaZagYK+8
 N5r7oqrtnQetLeoDXB54prr2QBybJ1wGUTqYn42RZxnaSzU8gLm48ArnoivxnhKbvui60cY0L5m
 yNw5CEGXGB+0z6zqcK5H8MOflMT1hNIts8yK5ZJm4PJoGnlHhahWMfHb/hr9zzdB3xqJ0XskJYT
 LbgfWK0hXXEwnSI3pNg==
X-Proofpoint-ORIG-GUID: f-wMKczUK85MSOyvB5qp0UzhZKkZOxLc
X-Authority-Analysis: v=2.4 cv=Lo2fC3dc c=1 sm=1 tr=0 ts=69b18134 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VZZ92KuHIUFcEntCV44A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: f-wMKczUK85MSOyvB5qp0UzhZKkZOxLc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110125
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
	TAGGED_FROM(0.00)[bounces-97024-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5FD61265CD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:15:44PM +0530, Kathiravan Thirumoorthy wrote:
> Add support for the global clock controller found on IPQ5210 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig       |    8 +
>  drivers/clk/qcom/Makefile      |    1 +
>  drivers/clk/qcom/gcc-ipq5210.c | 2641 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2650 insertions(+)
> 
> +
> +static struct clk_alpha_pll gpll4_main = {
> +	.offset = 0x22000,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO],
> +	.clkr = {
> +		.enable_reg = 0xb000,
> +		.enable_mask = BIT(2),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gpll4_main",
> +			.parent_data = &gcc_parent_data_xo,
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_ops,
> +			.flags = CLK_IS_CRITICAL,

comment, why?

> +		},
> +	},
> +};
-- 
With best wishes
Dmitry

