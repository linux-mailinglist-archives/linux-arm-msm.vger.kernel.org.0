Return-Path: <linux-arm-msm+bounces-101738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Oc1AWE10Gnm4gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 23:47:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D4139889A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 23:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C89E93023A44
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 21:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F37276038;
	Fri,  3 Apr 2026 21:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IW5W80Mg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1GSa6zL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6372D322E
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 21:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775252825; cv=none; b=I7ix6whUOaOVC0a5loqNSiti5lIk5wpjblX2KWaw1S+UMoIckDAwGtc5xet4DUGTsNCPpqIWUjjqaiS+lfLJbZnBtLZrnmfFMUyTdJglPXysYxCMYpmTX60DtqXOVzhm8zuTWTnhPOAQmgK/h7azAS0BY14RORQPhJ5n0+HpdGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775252825; c=relaxed/simple;
	bh=I5ist+EvO2mxP0rGH61vvoYKEdW2l3eY87onfBP+vsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQvuIT4Qt9qv7KjjuifTUT1TddzGC++WMKkoJNszwmMo3twG7rYr7itc/N2Qw9UCJaheDTQE260Pheww1up+SxlE4LdptxFvSZjNtF2avB+abMrp6uzoMfY41O7MisY7gq7wxCKaS8FU+NBoaFjBsaLU+RkeiDLx8mEc0KU40dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IW5W80Mg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1GSa6zL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633Fuxvj258364
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 21:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oRO36lu8/Mjs8ncmcB1jMrb0
	3PSx4SM4zMiBDXsvdj4=; b=IW5W80Mgcmews0sCJM32E2lQahlihqrIBGR2s+Yc
	jChNL/iiB9zg9y9qf/70PKUCQc3xcY18V0RTy2YdOoG1PhaT1/eKmMSOa6HhUnlK
	1BS0eL2tkrgm8MC6tBQs668o56VHuVHXYmEKUN9KsCq2cJwZdFI6xXvBn6vVQ1cW
	BHV/tzyFeIE0HAHDBhbbXzgR05hL7Y0N1MxJoWtLpC7Mulw3BXtxbJ7wgDp+SYZp
	Uzk3rAyCoUMIQ6zKU2Fkej6AkvbAL1/UWk8BoRrNYr5ysPSjNiIWIJEl+qcGOLn2
	e+4OIpsXL+SwFmHw/WYe3N4kqhNuC/NdT0tHiQGTibX0ng==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dagn20unq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 21:47:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093025ffecso41396781cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 14:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775252823; x=1775857623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oRO36lu8/Mjs8ncmcB1jMrb03PSx4SM4zMiBDXsvdj4=;
        b=K1GSa6zLwbG/pJYuNsZM/eSbN9kCMUprI9OOxyFJ2PPlsMpHFCcAZaClgwyc7sHo3L
         I869cWhfCMDaUxXJHlih8fEY9e+u6fdkJ5OjDhp5liIqO7mm1sfyBERRe29l5kW6LCEW
         DkS5/7D54/Obn1Xnk3sM08kE1puUYrw6EnWmsMi0kBvdTN0BEeisdWJtXenC4MbiOBjt
         xl00a6X6mLz7KrgT+KbUiW72gtMOr2GZY2+CCSFZj1boidVmFoVNlhFWe9oWCcXWrNOX
         0uZUSrBZ/7BcZqc5hZ3QS8NZdl10ef/a6VwNafWKANRTwNAcgSKv3t7aSNwfD8bR+WgT
         HpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775252823; x=1775857623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRO36lu8/Mjs8ncmcB1jMrb03PSx4SM4zMiBDXsvdj4=;
        b=DyJVZ3uxTrYOsnn1StmmipABaF2xaYnuPOcksLELAu/fNoGV2icqDBkdc2Q8FmY82F
         DP/PF6cEtBG3NcGlfbygBuSYD8rTthYxwh6nTqed/agrYIo5JOiiiAYUHMh+6t6NONLL
         1zT9hcyYuMyNB2JwDKn3j6pGzfWiiPD3T4gJI4HliC+gw1WTNqAI7bbbI4u0y+rY4zmc
         w3nf1VcmVwvm5cuh8FxOpCF+dbUZf6YwqSMQHpiK8b2JkXf/057QIKtqwRErDlc/phPh
         iH5Stlf+Axev5Fi7mkKg2X2z/aJ9seDi1rHeuhAHgT8Xz/Zs85Nc9691nvkhA7CAI+z2
         p4wA==
X-Forwarded-Encrypted: i=1; AJvYcCXBg9HMndQXOPE1cBmNFgK/Yxi/MP4wLgJfRN148t9hzDGU243m8f4T/f//SKsyBwwRjvI9rL3P7M9SZDK9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx50Z9TK9RBzdD5jydELmVu0ilSNSzolgsJKhP+agkrICrGBGfI
	/P7/jTLqYLPaGtFpg7X1WKy/B8AdjnUxzrNOker5nFkfvQfadJWb0x3i9NLJ0ig4O6u1TNRBZpr
	pz28bWvrg1SVKuKT/Qkj5qhSxOCbv9r716bYg76V4Wg9etL2NGGSB772I1L8/LMQDLV0Eu82w47
	Sy
X-Gm-Gg: ATEYQzxYd5FwbSVRwqJ9JPQPB/UDmiIkx585G0SWcajouiK1ij1PDfA5gzKxebVEup+
	ycrQZGiuxVxohfPdeQTG53+iWIbElW4LaLoTaqJTxiULQiK0jmKLbw6H8d9Qj+FSpb6gkwtBoj6
	jwHn9xlzGW6MGtCdS8InnCXsGT7o4kksfiUF3+SvLCZuMhXdeAhRZEJPQFCiRa2rlF1DouQrtLM
	pl4Rdr/VBOWa7/eIn6c2Cwcp3Qm6AbBp5KXi2/eZ6+RzvSX6KHRGAYyZVuRQQ0mQicHZfF1yo4k
	/lFOimlRAhc4sLoKy0MWhXJ/4l2nnw4xmzLfs/aT7aBihp7PicYK8c0VV8HdWDeGL3XceMSBClH
	kIY0Aq9AEyYI5Rv7wSctHGoU42Izm976AgHIDROcJEYsjqS4U9de6G8wzKgn9Q57/Ppyu3yERzp
	HyOp8Ch4IF/JmjZYURyhQVhHwyZ4ivLoZGJvA=
X-Received: by 2002:a05:622a:6695:b0:50b:2763:2bc7 with SMTP id d75a77b69052e-50d62a8f465mr45207561cf.31.1775252822595;
        Fri, 03 Apr 2026 14:47:02 -0700 (PDT)
X-Received: by 2002:a05:622a:6695:b0:50b:2763:2bc7 with SMTP id d75a77b69052e-50d62a8f465mr45207241cf.31.1775252822119;
        Fri, 03 Apr 2026 14:47:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccbecsm1672808e87.62.2026.04.03.14.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:46:59 -0700 (PDT)
Date: Sat, 4 Apr 2026 00:46:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 6/7] clk: qcom: gcc: Add multiple global clock controller
 driver for Nord SoC
Message-ID: <qnlojbjjo3agzoscf5edwglxe2oto3gnnaj7c24itd7dn664pn@uryse2ulsvsz>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
 <20260403-nord-clks-v1-6-018af14979fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-nord-clks-v1-6-018af14979fd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE5NSBTYWx0ZWRfX4ZgbyC7CBJo4
 5kksRc3FtGncsMMn7omH0tWy3E15lEXTROIj0/YoHIuotxYpPV/ksup7GRljJ8WFHA80Ts5cu6N
 A660w4Yl183tLwSzANA2Kj58BtfB6+7oT83k5ZuSJz/6P0cJg2UXlCa5NC3laxCJJ/hBshAb/Zy
 kG1xw2WohGfNFaEPLghGMRPPtA9pBxHcICu/1qAkmstnNsiTJwkzL/5+wLo0f2oSJkq+qua9wWH
 A4QQIxNZqijGvOHKpwgAjKCwhZPDwbsWtqFv2jmi+gVIvK9s4f5a8xcVbNLcbtc29MZYZIokRy6
 zsgGWxubttJ1qthXnYO6Pwjwix9SZGtJ+mDswtpK9PTjH7hzPDSJRkWStanC12T820p0g3zJgI6
 YfOea4UXWqZMaGh3yGSDVHiryffbnRFsIfU4wznH5T2oQCFypknqQRnJycnfoq2XmJvf0i+U3sR
 bOoWqbShUPZifVveSLw==
X-Authority-Analysis: v=2.4 cv=Cc4FJbrl c=1 sm=1 tr=0 ts=69d03557 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=UazbwbvKEZ1Oz8zh9_IA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: F-J-FbJ38LUI3nnKgc3Dj1smawIrnaTl
X-Proofpoint-ORIG-GUID: F-J-FbJ38LUI3nnKgc3Dj1smawIrnaTl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030195
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101738-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,quicinc.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B2D4139889A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 04:10:54PM +0200, Bartosz Golaszewski wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> The global clock controller on the Nord SoC is partitioned into
> GCC, SE_GCC, NE_GCC, and NW_GCC. Introduce driver support for each
> of these controllers.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> [Shawn: Drop include of <linux/of.h> as the driver doesn't use any OF APIs]
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |   10 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-nord.c   | 1901 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/negcc-nord.c | 1987 +++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/nwgcc-nord.c |  688 ++++++++++++++
>  drivers/clk/qcom/segcc-nord.c | 1609 +++++++++++++++++++++++++++++++++
>  6 files changed, 6196 insertions(+)
> 
> +
> +static const struct qcom_cc_desc se_gcc_nord_desc = {
> +	.config = &se_gcc_nord_regmap_config,
> +	.clks = se_gcc_nord_clocks,
> +	.num_clks = ARRAY_SIZE(se_gcc_nord_clocks),
> +	.resets = se_gcc_nord_resets,
> +	.num_resets = ARRAY_SIZE(se_gcc_nord_resets),
> +	.gdscs = se_gcc_nord_gdscs,
> +	.num_gdscs = ARRAY_SIZE(se_gcc_nord_gdscs),
> +	.driver_data = &se_gcc_nord_driver_data,

use_rpm = true?

(here and in other drivers)

> +};
> +
> +static const struct of_device_id se_gcc_nord_match_table[] = {
> +	{ .compatible = "qcom,nord-segcc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, se_gcc_nord_match_table);
> +
> +static int se_gcc_nord_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &se_gcc_nord_desc);
> +}
> +
> +static struct platform_driver se_gcc_nord_driver = {
> +	.probe = se_gcc_nord_probe,
> +	.driver = {
> +		.name = "segcc-nord",
> +		.of_match_table = se_gcc_nord_match_table,
> +	},
> +};
> +
> +module_platform_driver(se_gcc_nord_driver);
> +
> +MODULE_DESCRIPTION("QTI SEGCC NORD Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry

