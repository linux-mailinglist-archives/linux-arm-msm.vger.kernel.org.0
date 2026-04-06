Return-Path: <linux-arm-msm+bounces-101951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFDDBI+p02k4kAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 14:39:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 659183A35B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 14:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C1013014955
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 12:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33EBE342514;
	Mon,  6 Apr 2026 12:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QtOYCTc+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ajy8TMB/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3039340A5A
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 12:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775479173; cv=none; b=OER1KZOCvVblxYlMUcfVMDRWvk2qnc7ZIhIxD2XjzI+4V3eHZ1ObWaqusoC+UiSz/7/a+UygmUJuiXmg1DSwfT0pIzFz6WEZEy0k3ZksoezSQlavc/AGNW8Yxhg8tXNwLclDsqGqDb+eg0X6NbxYaUK67uXZ8Ch5g12LdkvGNi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775479173; c=relaxed/simple;
	bh=Knv6qOFhvYoY1wNDCbwdvpFcR2wMWggmlrKlYkLq4uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQMdlLnRQ4NYr5fIL4Q02d3IeQKXFRAnaHM/bC0fs8f2gcQmmKtcZ+qajHpm3DFCaJaF3RRtMuKBkNuekrNBQ53RakHd+hTk9dpbbG7TelejnGwgfxMbUMGVQio97AkgVsSnMr5t065ESgasrgI0r11TA67DCNlhy4RQ6rpLPu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QtOYCTc+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ajy8TMB/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636A6ZVg3990038
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 12:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zuu/AoiEte6QHeVBrtxX+erw
	+OHYiGVQnUPmzLKXoMY=; b=QtOYCTc+fXjtoyNzRBSUpqQfhj3WyRC2oktmPNrI
	p0gIS7J0NIkROHwZZz36JU9sh9Sv7xuVBb/B9zSb1QJcYZ8e8ftwCQrY+1J4pl86
	i2FHtH+CjaPHJpGbwaFxevOHt4gx8MEof4xF4II8ctGJHnc+JqDyOsalHfRu7yOn
	70X/Ihmqhl50ahsUWzTfIwXdVvBvbed12IacGIbW5Wcyi1QtU9o9A2kOsJDTLe6c
	x4t7XXGg5rFP23kQFzIF805vThQJNrCRh5/ewZ7mPHvq3OTrYVxtclchr2AN4QmE
	wjAU5D1z7TWfm0RO3w8hK4TEgufBHbyjme3f2JT69kMYsg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfn5t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 12:39:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35c1491a5b8so697012a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 05:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775479169; x=1776083969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zuu/AoiEte6QHeVBrtxX+erw+OHYiGVQnUPmzLKXoMY=;
        b=Ajy8TMB/D8wqKTgokeNiNqbw8PN2vUi61yxhz54c1uniuYaITBYTVDC3vsPPt/s8Tm
         M9l+yS6DRqmKc4DYhVifAeostVm/FsTFsy39yR0/UqgyWGi5jjAU+clC2X19Cu6pLqlu
         pH8mAaoQUZsRr6WSlwwBxHdM22KxPG+1d9MsnJvAa6U2xdjlPJr+yagLcThDWGBsRl7H
         8DxY9eHZMf76KDa0igJSeiCklCU1kZGLc39sw/F38V3kmPDxztfIPl+unG9f9c/G5ZqF
         9Tnon0W8AzmDGmR0dtOwqqOgFEOQwP8J7l/vUkfpd5UR+IuAuDWbkTu3XuQh7duzARwx
         cd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775479169; x=1776083969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zuu/AoiEte6QHeVBrtxX+erw+OHYiGVQnUPmzLKXoMY=;
        b=swu66sO5M3bLkgsStBZsgpP3BVxdK67+jcZHleurz67tn/FOYjJpI2gTjDCWddq4r7
         FgB+OSsgKzwlvFvSU82e0RYOKVpqCpy9nN/udyvT20t8NkEJJzXELjsmYMwCDK7YdLLP
         Cu+ur4xEgk8TIfd1cEyyblm41qiubrXhMf/dz93Efl+Exz5N6EpTlAXfD6HVIaK64tkB
         pv5ToZAz8HIOWC3YS1IlWE4gmAsoI4ArabMtYVAJLy/K6PKOI3dMbkDaAO+A0ZOCweE3
         x1Dqex1rA3CKhi48Drf6a7yeiDbipgVo1IJ3F+Oh4ZDQ6x4qkDbKBkQeO8zW9Cf6ZZ6I
         P4Yw==
X-Forwarded-Encrypted: i=1; AJvYcCX+PmGd9ubUWSRmgZ8arKfeIp3j/QNPzlJSeSFR2a9cu12MbCLlqXagUCmNKrx1YEozcVN3NnQF/EjrE/SN@vger.kernel.org
X-Gm-Message-State: AOJu0YxFsLLIMhNXzgEDgcGDp3uCIp7DWYGutoJJedfee4CC1C6LeCtG
	6YlR2tQShQBmdvgaWKBVASQ+BWEQ2XKEc1oal56hS20bPgYZugL5y1XgLEuS3pM2wC0u3eEGoGR
	K5+z6leOxrkXphv+ATTHfsibv1oYx1HbofbGrmZfvRKsI0QaW7WeR8ITjnZcjKreX0Zbl
X-Gm-Gg: AeBDiesiCDy7AAYMYGfrT+1AwLf6G+LhlE8wBiRAX5AuST5p6TtnQFN49lgSlxMLjeA
	RwXLEzxUeDCAnByEt0VlOlYST+cEDt9R0lNZz2WGIbGvwmTfnvcL2k3B4kznPbG5VSfxqCkZPCA
	HX2PKRgdc1aJVw535fS6a1nb+y9JWqIDlRSC+rT7wVONXWLe3eS3kw0CFQkJboQQNCtGP6VCN3C
	DxezsTfRg/c3h2ds8FJrhIZxx8sL7JevhyDg4NTuFFN0dKRu8sy7zzUNLPkIeVoRVADouiCO98/
	0RYegVr98EddKa2lXAyHhjFtA42oPwA+W/nEZg5uOeuSbrWWS7x6QoOO7Bq9kxxoPLgcFgU8EPZ
	NbzkyE28B0E91aE0sm9Nnq+OoKuRJdEM/3S9uRbEWuZzRfpi/jQfDbovkLflD03HTgZC2mjRDql
	tmcF0PvVwwtX4/ScOKr/7UNh3V8CPgvgZx5SqXNixdoA==
X-Received: by 2002:a17:90b:48d0:b0:35d:92e4:c0a6 with SMTP id 98e67ed59e1d1-35de6a4ee40mr6959060a91.7.1775479169409;
        Mon, 06 Apr 2026 05:39:29 -0700 (PDT)
X-Received: by 2002:a17:90b:48d0:b0:35d:92e4:c0a6 with SMTP id 98e67ed59e1d1-35de6a4ee40mr6959035a91.7.1775479168901;
        Mon, 06 Apr 2026 05:39:28 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de697e327sm3712755a91.8.2026.04.06.05.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 05:39:28 -0700 (PDT)
Date: Mon, 6 Apr 2026 18:09:23 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, prahlad.valluru@oss.qualcomm.com
Subject: Re: [PATCH] phy: qcom: edp: Initialize swing_pre_emph_cfg for sc7280
Message-ID: <adOpe/sRD5Ojc+iT@hu-vishsain-blr.qualcomm.com>
References: <20260403-phy_for_next-v1-1-3d336b555019@oss.qualcomm.com>
 <lsqxzcdcwut5y3xog7bfo5erziffc53vqrikyso5oujscowta7@cx7juz5qph5w>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lsqxzcdcwut5y3xog7bfo5erziffc53vqrikyso5oujscowta7@cx7juz5qph5w>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDEyNCBTYWx0ZWRfX9qy2/5G3Nv0p
 KdGjplyzFKGBAKmmryhLgnSv4oq+zsNEzifiNjjW+xdoHIfdibL33BdghKoyioxttp1DNo+IRgi
 cXhE41YXk2UGNeHcQLZepHMuqmZZQrhuhwi1AVAg97UX//uKPGhO7XEioqbXb2CLuEa1yUKzQlk
 93kOLW3PXOb1C9fPEux9tORoyKNfN/GOTrU6unwwTJc4Au8V+zBAA81dwyA6kpgfor0PxsTeiin
 kj+/zZQmiHoN+/OJzCKhCOc6tmi5qgfLOXNzDqIcAiW8XBv1Q770yqouCXdjyvIhTGEOeq5lBqb
 NAlpg8YfvP4snOv3OdPUHkvKWfB7bPz9tnDRYlbvS3oDq16x1GsSydpsT6NjwSP657sWtkwDU+1
 i47jgZnpnRHJKWrWGZwDnF+DlhZ/63EkvxlsxqnL9S/0mPWMGLwx8GPruPAcEdhHyxkcEN6zaqA
 TMpKRacg+phO3n0vXqA==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d3a982 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=yfmGr3Zwk4HYnreM4cwA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bOyRmDw0Vef4NRBkJA_xVaB_yy1ZDlWm
X-Proofpoint-GUID: bOyRmDw0Vef4NRBkJA_xVaB_yy1ZDlWm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060124
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,hu-vishsain-blr.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101951-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 659183A35B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 10:49:16PM +0300, Dmitry Baryshkov wrote:
> On Fri, Apr 03, 2026 at 05:54:56PM +0530, Vishnu Saini wrote:
> > Aux timeout is observed on few monitors like Benq BL2420-T due to
> > missing swing_pre_emph_cfg.
> > 
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-edp.c | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Missing Fixes tag.

phy cfg is not initialized for sc7280 when it was added first time with:
https://lore.kernel.org/all/20220207161612.REPOST.v1.2.Iff75c0ea8499f0baf2aa5800f2c45c4128e2415a@changeid/ 
Shall i add this tag? 
Fixes: cc62512c1be3 ("phy: qcom: Add support for eDP PHY on sc7280")

Later phy cfgs added first time with below patches:
https://lore.kernel.org/r/20220810040745.3582985-5-bjorn.andersson@linaro.org
https://lore.kernel.org/r/20220810040745.3582985-6-bjorn.andersson@linaro.org

> -- 
> With best wishes
> Dmitry

