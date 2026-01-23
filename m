Return-Path: <linux-arm-msm+bounces-90370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFfYLqW5c2n/yAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:10:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEE47965D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EBCD3098727
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 18:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D9627B4FA;
	Fri, 23 Jan 2026 18:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OdhLUsI9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LwtQw5en"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D74027A465
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 18:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769191687; cv=none; b=J80rz1X1SuiWZSFJQhtoklq+52MeFCx72dB5y3AKoBuM2aj3u1L3xab3XsMPlr/ukT/rUkjr010g2WtaL2Ue2MHqvGOJ6q4KaB4UKrMNH7fS886DQpZXh8kRTsOnMwDmwS3VgfDQEAYpJ+5RY1BOg0jB4ObyXHtUb5KD2iKnaTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769191687; c=relaxed/simple;
	bh=DVbcCTqrN5mviTuOwEBmQs3jx74WK5aZB49bxa5GbnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+TCj8Tr5JAIXS/FKZSt8HrC3ndETRgicRsJVPq2s/oJyXr6pWCOeigAuS/T/qiX4IFM3yzUD2n7gro0e+NLET2RcDHlkKrMrpjq7L2dXxTvqRKmXZUPzLt6AC007C7gbnWK5nkSgs4rtUIzsl/wnLzY2Tr+swfNTF7rX/SkOi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OdhLUsI9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LwtQw5en; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NBpEe33677732
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 18:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xdBWn8gOk8MLTtjna9Emtq++
	iF66iD1yKzPpY0SOEOk=; b=OdhLUsI92tF7M6NGK/E0S0wS7JDcspQ47Sn7RF54
	o7nd6eDOOky/3LH2LJ2YMq5+kx2knVT+L0yrXhCbF7uDdaNgfyu4vsUuAL7ePgga
	yAXSczJugXB+sSRimaRf5vxRX8V81LRp0UC7tChmgPL7ICDbiP/XSJfzaa93q1Kh
	3kkZClyDvBUIADNZgb7qo+dFcGWTMtMJrHSq+menctbd/GIobYSCH3J/akLvWxnc
	FB7QT2NN+n1sRoO7ucbyBN71+RSc+4WfKy5Adtm7ehuPDdSYoPARmsTAqhQzggAA
	1Jc0MOP8+js/8Aue/UcIEZ4vuhzFzeVZlUtWpLEE+Z3+6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buqyp4mrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 18:08:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f89b415so755517085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 10:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769191683; x=1769796483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xdBWn8gOk8MLTtjna9Emtq++iF66iD1yKzPpY0SOEOk=;
        b=LwtQw5enKM6xGzcdAcQA0VBvS9t0FYDd0aj0ymVlh5BsuzRJAGiTVQcXSEhyZaDnIv
         tkneWMKrkw2I5h/DgLFnMvmukCrdGqeB27EscNWQNqWgiMsaT7/3GzIUfxzYtjHgBSIt
         qj++IvjdJ1FsOh00UOP2n2fzq2hLyKzyrMJTuELvjZjKmtQTz8vas5mQJ4EzJBzQmWCV
         l0LuWetzuXX4QGvqSBjoYjgNdFg6jh7UVbhHuIFVfd8bIaRlAOeUmosCw2ZWZsxatobm
         rKMTH4avCiP3QBnhzsYIiStTFVEorIQc9hs4ZTJw2E5c3Dvm/dle8mbmFeYBoarKhKox
         xQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769191683; x=1769796483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdBWn8gOk8MLTtjna9Emtq++iF66iD1yKzPpY0SOEOk=;
        b=nGR35/ErtiO/viR08If5DvS9MFMiKDKAiKKOven8TlzRRc3D1uaQUuZ68gZoqwdIOh
         iwByYv6LfSto30axSDbZQufVERcn/mFytg7M4vJQPB5F1esOBwH5Q8VxejFAsguVlnGt
         3swvYnkUVwyxJGz1jUdgh4enHemxcd1TkGxoQj+5YJSGjsIZ91nJOXQ1TODUT97ZNvIW
         79Gcb5tteGjOzxECCQcneHwvBiUtb0ttnPQA62dsfNkl62a0lCmorwpcqYGwpZ9dsxrd
         WdPlYfi/IDp9PruznjbhddlZGrNqbWQeoTSyzRKY0YAPGd6Hy3/MqDbcfNh2Gdh8M7RX
         Gu6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWweJTO5kDiyZlMK21/LhzVrJb2bMV+JlSGzy+vSUEimQurWQW0flbtHcRzTAY/nhGWzzu5QNgHjlcfWHCZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxgRP9fv8D7er0Yvv4hcUkbO3+QiSHbkgZTIqb3xykcSug3A8Z0
	OlAHoLDehGzHia6RJ67jdwsWdz4+dfefcMvFmjS6bSftOfFS1tK1TbjtKHBfInO5NcCbhcfEf25
	LdOeXyFBkym2rdQey7GtkUK8YXJlSRb45KTrvQB6rWdHmkNfDE9zQE/xOAeZTMvvOfVGD
X-Gm-Gg: AZuq6aJmDBMgKWOPr9AB9fddE6JbASEdMeEonEVWh4Hy3E2dM9LBR6fKUJ9NHApQ+gD
	kI6xZhBkZ7+UE+vjoxit1Qy3uW6G670MBCBv/yyvRfKJ3j136+CjIZxsp3EmNUiUHkHcMBqD9p8
	SCL9/fTuFo4cxw+s84xc4HUKn9vqAqosi0Bi6cKBe9Zwtu58bqV6Egts8zgt8hpsb3FHZqERDHS
	0M2OOA9h+lagLNOt+AVOjZl+1iBqIUbqxr3Ozp1/+E7vyqFQ3arxt7o9yd3RVu45TLEw0YLyaOV
	aROJln5qRo1N9V3g77AkRbpQix/0E76TxVCbAjigCR3DMJg/2vH3JCH5gn/7klzG2BY4MUzVENv
	MX4CPibwhIf/491WGgrcWvbfkQt2DpA7TQOd1KuDuZULYHIJ6jpN6hjfZwMu/+6uhAgs9SN4RYr
	ULltfXSzh0QHu/s89HF/zm0fY=
X-Received: by 2002:a05:620a:254f:b0:8c6:b258:dff7 with SMTP id af79cd13be357-8c6e2e3802bmr457584685a.72.1769191683505;
        Fri, 23 Jan 2026 10:08:03 -0800 (PST)
X-Received: by 2002:a05:620a:254f:b0:8c6:b258:dff7 with SMTP id af79cd13be357-8c6e2e3802bmr457578685a.72.1769191682907;
        Fri, 23 Jan 2026 10:08:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9faed47sm7305161fa.6.2026.01.23.10.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 10:08:02 -0800 (PST)
Date: Fri, 23 Jan 2026 20:08:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: Add base clock controllers for Eliza SoC
Message-ID: <rursscx7jihmvuf2piqqjsw4hebykybpplunreqrczivofo7ox@jvlyofgdryuk>
References: <20260123-eliza-clocks-v1-0-664f1931f8c7@oss.qualcomm.com>
 <20260123-eliza-clocks-v1-4-664f1931f8c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-eliza-clocks-v1-4-664f1931f8c7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RMy+3oi+ c=1 sm=1 tr=0 ts=6973b904 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=94wPuWfEfd9XG2iD1eUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 3IUeohq8-2CTS485L6g-pbYJa6eBKBQq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEzNyBTYWx0ZWRfX50s0x1sh7tDR
 TIrReR/6UzWOPp6yYhFBVZF9zUS2SAtZqus+22DP1GoJz9fxf0FyArkj2pADAYMVQPRGG3JT18F
 zgeOeXdPYmwmXcYUA+XwFsGk8GTdhAaMA9FDlSoUMgcvQ24vO+RbGxtwfZzIJDNSmBm8KMzh64G
 tb5l9VaLLCnnVNZlA0QVgRKeg4EEFgTEP5nuhtwhzGTNGqe9FiRpzaH2lEdsdIk0yyHgwHRpqgc
 cAWaTJth6Kn2R2nUysODOTXcaBKtDxJPcdLonDMDlGLq2Sb6gpU8N/BM8DLj0W4EPwhJQMnsvJy
 RLjamOebospqaQBS9sFCLvkVybYnpZt8eoEDrScT66ft7tH4xSAMLpgcu+5R7enF5ztoadaBr8l
 xSuJIO6FWeCBwBu3NrckIptu7rKnvgp2327s6NCos7DFRDXSp7nYhqc3so+vLFeE7sIeosCHuVg
 zaeNkb8MeMOZ2fvdavQ==
X-Proofpoint-GUID: 3IUeohq8-2CTS485L6g-pbYJa6eBKBQq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230137
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90370-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8AEE47965D
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 03:37:16PM +0200, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add support for the Global, RPMh and TCSR clock controllers for the Eliza
> SoC. These are the clock controllers that are non-multimedia specific and
> are needed in order to be able to boot to shell, with rootfs on UFS.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |   17 +
>  drivers/clk/qcom/Makefile       |    2 +
>  drivers/clk/qcom/clk-rpmh.c     |   20 +
>  drivers/clk/qcom/gcc-eliza.c    | 3160 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/tcsrcc-eliza.c |  131 ++
>  5 files changed, 3330 insertions(+)

This is something new, having all three drivers in one email.


> diff --git a/drivers/clk/qcom/tcsrcc-eliza.c b/drivers/clk/qcom/tcsrcc-eliza.c
> new file mode 100644
> index 000000000000..9b53536f924d
> --- /dev/null
> +++ b/drivers/clk/qcom/tcsrcc-eliza.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,eliza-tcsr.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"

Are all these headers necessary?

> +
> +static struct clk_branch tcsr_pcie_0_clkref_en = {
> +	.halt_reg = 0x0,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "tcsr_pcie_0_clkref_en",
> +			.ops = &clk_branch2_ops,

What happened to parents of these clocks?

> +		},
> +	},
> +};
> +
> +static struct clk_branch tcsr_ufs_clkref_en = {
> +	.halt_reg = 0x8,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "tcsr_ufs_clkref_en",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch tcsr_usb2_clkref_en = {
> +	.halt_reg = 0x4,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "tcsr_usb2_clkref_en",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch tcsr_usb3_clkref_en = {
> +	.halt_reg = 0x10,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x10,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "tcsr_usb3_clkref_en",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap *tcsr_cc_eliza_clocks[] = {
> +	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
> +	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
> +	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
> +	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
> +};
> +
> +static const struct regmap_config tcsr_cc_eliza_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x1c,
> +	.fast_io = true,
> +};
> +
> +static const struct qcom_cc_desc tcsr_cc_eliza_desc = {
> +	.config = &tcsr_cc_eliza_regmap_config,
> +	.clks = tcsr_cc_eliza_clocks,
> +	.num_clks = ARRAY_SIZE(tcsr_cc_eliza_clocks),
> +};
> +
> +static const struct of_device_id tcsr_cc_eliza_match_table[] = {
> +	{ .compatible = "qcom,eliza-tcsr" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tcsr_cc_eliza_match_table);
> +
> +static int tcsr_cc_eliza_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &tcsr_cc_eliza_desc);
> +}
> +
> +static struct platform_driver tcsr_cc_eliza_driver = {
> +	.probe = tcsr_cc_eliza_probe,
> +	.driver = {
> +		.name = "tcsr_cc-eliza",
> +		.of_match_table = tcsr_cc_eliza_match_table,
> +	},
> +};
> +
> +static int __init tcsr_cc_eliza_init(void)
> +{
> +	return platform_driver_register(&tcsr_cc_eliza_driver);
> +}
> +subsys_initcall(tcsr_cc_eliza_init);
> +
> +static void __exit tcsr_cc_eliza_exit(void)
> +{
> +	platform_driver_unregister(&tcsr_cc_eliza_driver);
> +}
> +module_exit(tcsr_cc_eliza_exit);
> +
> +MODULE_DESCRIPTION("QTI TCSR_CC ELIZA Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

