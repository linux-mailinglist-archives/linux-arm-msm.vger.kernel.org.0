Return-Path: <linux-arm-msm+bounces-112837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YkB+BjVZK2pe7gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:56:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A78676058
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:56:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZQcWkhz2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EtGmfOo4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112837-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112837-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94885305ACBF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 00:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F1C2D3220;
	Fri, 12 Jun 2026 00:56:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6AA1A2C04
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:56:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781225778; cv=none; b=bo5U+cv91yn+UON2OowceiTZn9GVzipIXcLwBLqO0sK/azyX0eudT5FwdzRePqHTz0ACT73KaS47Aw4RgQVwuTfHa73F3Y6EoTCDCO+BiqVSAjd8xqfXnBeNVGyYxJkDUGstc13FDH/TIvUEQjlTCjUNH6hDxdcNTRuHeZzM0rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781225778; c=relaxed/simple;
	bh=pcU5WxnVvahkSdZD5SO01dQyrIQjHHQKRKLM83SFDmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVrojFRAa0s/mM0z8icPD+zPnNA+YhUgozra9H6oJ71qpN7C2O8Ep2u3wnkV6Tfs/SohsueAmDu5gHQHdEXiHnrIcZ2QIbD90BKLSwXI/0MjUVPsheMbYcTo6XFozr59yJoIV8CAkFViqoXKQAYNoCp6fRnONWaIX0DZvpB2yZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZQcWkhz2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EtGmfOo4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMScD21932228
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X1u+3fA7kHIVfDFfKwj+C/37
	uBiOEHgBubv0x4etziI=; b=ZQcWkhz2ZKDbxvNTWstAFfK4LfbnICpEuZnhBiKj
	OYj5S89J2hfRgg5vm+KJklqJ0JRzjT1jZ8N7TD2/+8l90ujTkBr9soZ4Vxszk1Pg
	5OmUuLu7BsN6JFnrhz5ix3XtRkhjbBTCJa5PlgbWcHevcDJyUcmHoFTf2HnrG05p
	GGlyueGxiDEczVM//XCNSSUMjr+o0v2zp3Z/m7d/DtTOEiH/RrUb20ILqj2l1tGV
	8Vr59wN4oM2qgssi+NuujCo8p9gGW6b7m8kLykcuY18zDFWl6Og9MkVxB42aDcrE
	xgqAxqsT0csAN/rGwuAZmGL0oOSYDmygd0kvey+PxDNCHg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r714v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:56:15 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6a2b8b91dc5so163769137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 17:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781225775; x=1781830575; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X1u+3fA7kHIVfDFfKwj+C/37uBiOEHgBubv0x4etziI=;
        b=EtGmfOo4qV+MtDtgD75IGP6U6vX7BoxY0rGhgprOmBBX835W4uiOI8V31f5mKUg06p
         44QP2lZEfxH8fvR5sVwcRPl6F7Mb0S0B++oxIJYyhXfLPYdBRPjSZHf0RSyhPUVwmmhn
         VR6bCwycGsF+RdRVz8+3CgPddvyl4wCcJmGGCuR0ToO+KX3apLA5CLCjtdPXtGxmzYvB
         vVG5WHWPMboQl873ij3yRqbsxXOxcjUA+tY73+ZC6Pr4P1M9sFLKwenaLMiUy07vYCTK
         1/8WoWNGpNmZLonS5eB5DSwsOInGZ6IXSdDWJdziFBPi8+0dY7h5as1Bgg6JJgkhVO7/
         gc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781225775; x=1781830575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1u+3fA7kHIVfDFfKwj+C/37uBiOEHgBubv0x4etziI=;
        b=RPwy/DbfbYtxQNVeAm0xhPX3QFchSpuvPjF7TRaYMbJYJKqhL3lxxP6JW3QBSKnWfW
         rhO+zYob73Ovqte5RsENsl1sHy/EBeCy1uMzouR+tDQOBZyXIfK2NW+2ZhjiWfak0njA
         sCAAuQOvQdVAutfrzA+3GHSmTS4XA0ilgMmRJxKAmLoh99AdBvf+lPlJ+yCHpP+1E8e2
         mqqD991V8vP3aCfaUDLr1z1szcjUeacSHbQzkduNpUhWr65K15IYwk8GJ5XjmYpyPWno
         Y7OkU1rjw5ifV1Uk00gcXtBC912Sb8fzux+seKCfOMGglazrrZyTlbNWA1p58UKUNOww
         uVjA==
X-Forwarded-Encrypted: i=1; AFNElJ+ll0OdeqzTiCwckUF1XFZuO8FEG6k/vmiVoLY/XcCNLHMq9eW7EohEvG+qAqOBfiaw8/C8qYzc6pAT1EZZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwJHbz8c7AfGc86Sg3pMhRazjzdQBdBhpAkSdvfnoIbh3aQJ4Hu
	zlB4JWZSTED00rkpumIJKsdl+461V41jXsZF4CBbZPnKDzePYG2FSxnbifsrQNZ6EblJ85D2LKr
	eIw6IjQ7Gas3A/zOUDRp7oA5CzuO/C4qdBzj5JHhYg5OS9fHzRwPU+gIuXk/LSpfVPdLO
X-Gm-Gg: Acq92OGDcLrtI8p1nNZASKzZkimZxdsKSJKGjt1BDwIHTSoA6wJ1lnLUpbvbFoF3dZs
	3rxz8TO+uyjfzEiQgNCfpHjKgMgyRsq/Lc+MUXHr9cIzx9QGnBBXMwS2y3pFaoXarfM5e6Jpq9G
	PWnjhe1MkWwpa7IKFD30cjs5ysChP1xYvaVwFz1Cam0OFUPE6eSKc+ubAOaUgVDAQ+/vS7leirb
	eRSIWNyQao5M53sNzDcLVjT4GMtFR/hrSpCCyMxDA5QRV76tFIro9zI5e51IAB60cy1TTACZfyD
	SaE92x7217CXNG69jPHf8RzZtwBBhMr6DYX4X2TWhR/9QIbQzzuryd/FmsYjDEp4dWc9L851/G5
	CxuPvtrkkFH/33Cjj9jGLJHC1WON3EKHIk01jmOnvzwGMpjksWEgSj9cPXai0tJ+9+ol88AvDAq
	x0CO9XDzOZ9Az/HarLFvVkG2hFa/1A/VfIg5Q=
X-Received: by 2002:a05:6102:5491:b0:660:d26b:506e with SMTP id ada2fe7eead31-71e88ac8860mr284533137.1.1781225774786;
        Thu, 11 Jun 2026 17:56:14 -0700 (PDT)
X-Received: by 2002:a05:6102:5491:b0:660:d26b:506e with SMTP id ada2fe7eead31-71e88ac8860mr284519137.1.1781225774269;
        Thu, 11 Jun 2026 17:56:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190e9sm1719881fa.23.2026.06.11.17.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 17:56:11 -0700 (PDT)
Date: Fri, 12 Jun 2026 03:56:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] regulator: qcom-refgen: add support for the
 IPQ9650 SoC
Message-ID: <367u4tqrx4wkwepm3pwlbdbqhsquilhmloxkzugvgmzk2iw6dw@ul25u2ynoyzn>
References: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
 <20260611-ipq9650_refgen-v2-3-d96a91d5b99e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-ipq9650_refgen-v2-3-d96a91d5b99e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: OG4x8bHIovRR94aqemAlifzagDwbL6Af
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2b592f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=b784Gs7XNV41u_O6X0EA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: OG4x8bHIovRR94aqemAlifzagDwbL6Af
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAwNiBTYWx0ZWRfX2SM0qwTKbzRC
 dwXCIRBVeNlfAYUiEFyXeqw3Z+AL7htV9tnvU7oFX/2zQkS25rLaojt8Kj9QTfnYzC97sC1TEEj
 ADUZmwVAK8W189YDHVIAFUHhwzIi3VLUxaHFrp6/ewZbbu2Vd3KYIlpKNX+/nmLseyIwlrhY4ts
 P59ga9NkxoLMI+VrTi3R2pefwHWY8JJ3/+qae3JeY8Ge32eUQ+Mb+XW4cwCYMxRSfcG1g7ftXf4
 fG1RqMkJc+fAa5DsC/+Lu4P4vOeXLYQ0bEkZh4URbsN+EBncpyjjaWVZZsPGPj5JoGoE8J0YmMq
 /xFiIimvnY2dNNiyHamn4KSVrKVkE4F5ZEoZRwkfi4QkN/ssY3JHL7qu75S9+nwporLcGqbliXy
 kqn81f3NPo2ZiNT/LpHxtjuwvjhEELgnOdaoUJDB37s+ZV1Gi+7znYNHt+H0jGY2hLn3kjZC8XH
 +uu+PBftSOYu9XzAblA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAwNiBTYWx0ZWRfX8bdgAi1tdyyU
 Z2GCNaGWWls4dyyeDJ/YKHlZ3dxQUGKdjefwJW5sfm/nPB0WuhNEoAHBEwD3WEPmB31+P1mT5zp
 DeS9fpSm6d38vVhu4jlX89qmI2J4gPI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120006
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-112837-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,ul25u2ynoyzn:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84A78676058

On Thu, Jun 11, 2026 at 02:33:18PM +0530, Kathiravan Thirumoorthy wrote:
> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
> PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block is
> enabled on power up but that's not the case for IPQ9650 and we have to
> enable those clocks explicitly to bring up the PHYs properly.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-refgen-regulator.c | 89 +++++++++++++++++++++++++++++--
>  1 file changed, 85 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
> index 6a3795469927..e8821f159ff1 100644
> --- a/drivers/regulator/qcom-refgen-regulator.c
> +++ b/drivers/regulator/qcom-refgen-regulator.c
> @@ -3,6 +3,7 @@
>  // Copyright (c) 2023, Linaro Limited
>  
>  #include <linux/bitfield.h>
> +#include <linux/clk.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -16,6 +17,10 @@
>   #define REFGEN_BIAS_EN_ENABLE		0x7
>   #define REFGEN_BIAS_EN_DISABLE		0x6
>  
> +#define REFGEN_REG_REFGEN_STATUS	0xC

Lowercase hex, please.

With that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +#define REFGEN_STATUS_OUT_MASK		BIT(3)
> + #define REFGEN_STATUS_OUT_ENABLE	0x8
> +

-- 
With best wishes
Dmitry

