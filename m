Return-Path: <linux-arm-msm+bounces-92120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ApgbBoUSh2mtTQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 11:23:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2D110576F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 11:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE1883013A71
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 10:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57589311596;
	Sat,  7 Feb 2026 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHzyaNpA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5Du4Cvv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066552F6937
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Feb 2026 10:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770459778; cv=none; b=I9DoQfAglStK4gluIprzwCQIyowaaCpOPabRwKQAq4N07wUlJXqSSpNP8WHE7YdHXHNJd8uQnTVrVWYrr462daD16xu+qHDLj2Japo3wP95LEabQRmpG791u/jHfeRc/jhbJVlFAy5d5XRhQBEkG5Xr/g0wBP+TxVFu2Yu5iRno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770459778; c=relaxed/simple;
	bh=PfXXcwdz5OuT/igtPxLtJTpspiJXpyDfK+/wChiksro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2qN93i0Z00UZuD5dN3GC1H82lTDFEK0iU8x5bVfUA2MGCWA0Jp/7nCV94diN620ucqJ4vrK5L/Pt7I0QtEz6/uRe19adgqVaFAIl4rLrZNExrxcqHFh09yh1d1xb1hdW+N2mPY2L/WAX8zOVIKAymDqJ+Ix3loS+mfiFCtgIbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHzyaNpA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5Du4Cvv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174SJg52232186
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Feb 2026 10:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nnJtM4Cl72ggwu6yAdzBObI6Jod1mf4/UeSDtI0Hjs=; b=oHzyaNpAsioUdGvM
	z/g12ONxpzkl+Zbieg2PBX4jfAoRopxDLluYtP8ILCukLjOE+iuzsJxCQhv5jmb3
	v3UL+9nmFMpV9AQg8wxa4N7it52AH8TAqSyLDAIq1pEO9pZ29iuY1Sm8FujgEhxf
	oRkN3edz3uxity7eHMo+bD9PfXm8wYcKWy/ERuW1s5lpOAE6p1TElmXbkFaGTUBB
	nndf/k1FA/n30lCX2OGq6BSLlTen2jsPd3xmtQ2xzwl2IXACy7a+noPJm4vDGEDv
	2pl53vDBj/9Nt68q6SrzUF3VNkHkHucLgfTrho/sIqkI4lnYntpF8L4Wtc1/NdYb
	AVUHMQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xd0rgs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 10:22:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ca06e38994so653635785a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 02:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770459776; x=1771064576; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4nnJtM4Cl72ggwu6yAdzBObI6Jod1mf4/UeSDtI0Hjs=;
        b=L5Du4CvvlILAVXi0UzE6dFrg5de5D1DW1pODHNQDGKURm/tPryylSabSCQl3pE0ogP
         +kMPXm0hWgo3teVekT8G8xBzpU18mHeuSczTTpbeKN3rUez8BDD/e3hpzjjow8jvdHnp
         NrEmg1XIJCbCMAyh8ddjf01pxJb8Br8a3mMEsfQvgNs58v9OXJyTvmjNV231zrzdnRb7
         sEPlsoI0xYJMzKwusqQxlOe0CydS4XOnCaFXnDDchDN+q/u6XHiuiafuR1qzSaNs8r/Y
         yfuC4dxs0Pkykg8eGSI/JVLIYBn6yM4OZ+vFgM35nsK143jfCTwv8wiZzQZsKfSCJ+Dp
         iKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770459776; x=1771064576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4nnJtM4Cl72ggwu6yAdzBObI6Jod1mf4/UeSDtI0Hjs=;
        b=TdqMh6VXyX3RR3p8oENNrUZ33hW/xuNGqw/yesFB6oCyARfq/mB2RzJHZtxQt1P42a
         l0+kIL0GmSlh1UVUfGq3usd3jAhnqW2XKp4KDnEXucGQrHScmFMvrUbkTQRo0o3i57tJ
         SVerXKm9Y9+OZrp+eoeLPMm+Tv2ySwAT4+gANJUMbtxbKvu8fR1Ikt5kvxk8RFpMbQ+e
         t97sLvtrYMPYtxJYhl6PiZaXaBIq1rX7QNQ0UkID7CjnAOrgNDDdOLVhDttiSWtTtEQI
         XEv74woPow05MEeia4Idc5qhuELRlPR3AuKJFVRtRKck3OIpql4p0xP6RZxSNwKPAd+y
         dEZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjPu290/YfdJ2lsp812lSYYQmKvnTxi5b9lgqavc9XLGIGevWD9ePmut/5nDmq4t9TV+TLUZnwh4pqQQZB@vger.kernel.org
X-Gm-Message-State: AOJu0YxLp+f4kJkr9Z93gamgTfqmm5EKB363rjFXzIuNn8AizzTcvk0L
	GceikOb25o0EmzSRpzrRgi8QiYt+2WJncgh1CVKvmQbSG/sFuggSWiayG75wvttNkPV1ADDf/Vz
	7A6K/bP6ovSZYzLNAKGIG6ry/OmMgMOp6xKnj8VKM0LNTwcefT4+IaUQhkhRQ+rJ1Y/StooCF/I
	dr
X-Gm-Gg: AZuq6aL3CyjvYnfgp9ufY1UE352h3SgKC2XbErPSDugCz0EcGRuhmHFWjU+hBShSUxJ
	eg6jJ9MQTE+fKMYD8Ia94QDFPMhjjcMi28IWwljFr9gwiCVsSv8Ysy13M4dHvcR0j34n096Anvl
	9CvZQ5puQrRHghZ68ZtqLheQF+WtmRfzgXgBUdur3088zhMF3E5vQ5GUQxH4ws5+UWeDuFTNZ/c
	yqsOc79yHbQkf4JAHOsei8Fg75El9tcwPqQN/uflmbI+5DmJou+pHpCtoE6Dvah6c2dSOcpDtHb
	KwCcwkZ1CF0qdfcCNJ8w523ergWluIb+a8FZtrb2QN8QGz885vU8y9BgMs081rbFJKht/uzQrIg
	8Kg17+cxgupwZ98zaAimiXSrutRapZvQvjkZeJtWUGcxLOQkERNN2XDqHjVpJy/t5FTB/EgAZPI
	+vU2Ufb7agYhyhedUoLl/qiyY=
X-Received: by 2002:a05:620a:3f85:b0:8c7:7a3:501c with SMTP id af79cd13be357-8caf13078a8mr733327085a.52.1770459775923;
        Sat, 07 Feb 2026 02:22:55 -0800 (PST)
X-Received: by 2002:a05:620a:3f85:b0:8c7:7a3:501c with SMTP id af79cd13be357-8caf13078a8mr733326385a.52.1770459775466;
        Sat, 07 Feb 2026 02:22:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44e21b40sm1225094e87.73.2026.02.07.02.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:22:53 -0800 (PST)
Date: Sat, 7 Feb 2026 12:22:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] phy: qcom: edp: Correct and clean up eDP/DP combo
 PHY configuration values
Message-ID: <57bwrceuqejzliljhrzj5wfumtr2q3dslgmjj3vd7masafi4k2@dskfnosor553>
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-1-231882bbf3f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260205-edp_phy-v1-1-231882bbf3f1@oss.qualcomm.com>
X-Proofpoint-GUID: Q0NAqX1jwBoN7D-iJVtZ8TlHt7OqxyT9
X-Proofpoint-ORIG-GUID: Q0NAqX1jwBoN7D-iJVtZ8TlHt7OqxyT9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA4MiBTYWx0ZWRfX9ZXeZwlTb1Gr
 fIU2zwheMmjKEqW/yMQP3xRbgcFSWeAB+Q0wN4mqbihlnwsX4rrufrd8kCoT4HRhIuxCJC9dKRK
 Vm156xG4yKvR0xLTvrmFexLv5l1Jn3OsZn6eSJg4hCdWRY5eEuh1LjWJ/CQ/XgnpbJB9CzupLGR
 ICXpKh0A/57hyLeuWeGsaFUDonnBdrrnYeEClf2rSq0G6CmnyqQrtSXq3iij7B1PGvcZmNuOUeL
 Q5mCVyXcFjDQTVCj56AcNeqVGvoSilPAnk5mKtSDpdcj/b7UeQMklgncsKGgVGHF+2Fimek3EUu
 O46yMHqyjL/7frhWyXUtu3Rwh/eewQWCTNQLWkjgT5LRijjT06QEYHRn40rsbMqVG3ssFWgXk3P
 yPmfjU5rhXg2DLKq35GU2QvnRhVEb4vgaI0a4PvacTQgkgSbeuM8LlHsUE8YzeRxTi4HV8qHdIO
 nEwi4FrZozrTrNV0Upg==
X-Authority-Analysis: v=2.4 cv=F+Zat6hN c=1 sm=1 tr=0 ts=69871280 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=nVYv5r8-tx1K4UDvUOAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602070082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92120-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5C2D110576F
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:20:53PM +0800, Yongxing Mou wrote:
> According to the current HPG settings, most eDP/DP combo PHYs can reuse the
> same configuration values.
> DP mode：
> 	-sa8775p/sc7280/sc8280xp/x1e80100
> 	-glymur
> eDP mode(low vdiff):
> 	-glymur/sa8775p/sc8280xp/x1e80100
> 	-sc7280
> The current driver still keeps multiple versions of these tables and
> doesn't fully support every combo PHY mode. This patch removes the

See Documentation/process/submitting-patches.rst, "This patch".

> redundant configs and keeps only the sets we actually use, matching the
> platforms listed above.

Should it be combined with the 3rd patch? There you sort out all the
tables, it makes more sense to review all programming together.

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 41 +++++++++----------------------------
>  1 file changed, 10 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 13feab99feec..10cbb7d9a8a0 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -116,17 +116,17 @@ struct qcom_edp {
>  };
>  
>  static const u8 dp_swing_hbr_rbr[4][4] = {
> -	{ 0x08, 0x0f, 0x16, 0x1f },
> +	{ 0x07, 0x0f, 0x16, 0x1f },
>  	{ 0x11, 0x1e, 0x1f, 0xff },
>  	{ 0x16, 0x1f, 0xff, 0xff },
>  	{ 0x1f, 0xff, 0xff, 0xff }
>  };
>  
>  static const u8 dp_pre_emp_hbr_rbr[4][4] = {
> -	{ 0x00, 0x0d, 0x14, 0x1a },
> +	{ 0x00, 0x0e, 0x15, 0x1a },
>  	{ 0x00, 0x0e, 0x15, 0xff },
>  	{ 0x00, 0x0e, 0xff, 0xff },
> -	{ 0x03, 0xff, 0xff, 0xff }
> +	{ 0x04, 0xff, 0xff, 0xff }
>  };
>  
>  static const u8 dp_swing_hbr2_hbr3[4][4] = {
> @@ -158,7 +158,7 @@ static const u8 edp_swing_hbr_rbr[4][4] = {
>  };
>  
>  static const u8 edp_pre_emp_hbr_rbr[4][4] = {
> -	{ 0x05, 0x12, 0x17, 0x1d },
> +	{ 0x05, 0x11, 0x17, 0x1d },
>  	{ 0x05, 0x11, 0x18, 0xff },
>  	{ 0x06, 0x11, 0xff, 0xff },
>  	{ 0x00, 0xff, 0xff, 0xff }
> @@ -172,10 +172,10 @@ static const u8 edp_swing_hbr2_hbr3[4][4] = {
>  };
>  
>  static const u8 edp_pre_emp_hbr2_hbr3[4][4] = {
> -	{ 0x08, 0x11, 0x17, 0x1b },
> -	{ 0x00, 0x0c, 0x13, 0xff },
> -	{ 0x05, 0x10, 0xff, 0xff },
> -	{ 0x00, 0xff, 0xff, 0xff }
> +	{ 0x0c, 0x15, 0x19, 0x1e },
> +	{ 0x0b, 0x15, 0x19, 0xff },
> +	{ 0x0e, 0x14, 0xff, 0xff },
> +	{ 0x0d, 0xff, 0xff, 0xff }
>  };
>  
>  static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
> @@ -193,27 +193,6 @@ static const u8 edp_phy_vco_div_cfg_v4[4] = {
>  	0x01, 0x01, 0x02, 0x00,
>  };
>  
> -static const u8 edp_pre_emp_hbr_rbr_v5[4][4] = {
> -	{ 0x05, 0x11, 0x17, 0x1d },
> -	{ 0x05, 0x11, 0x18, 0xff },
> -	{ 0x06, 0x11, 0xff, 0xff },
> -	{ 0x00, 0xff, 0xff, 0xff }
> -};
> -
> -static const u8 edp_pre_emp_hbr2_hbr3_v5[4][4] = {
> -	{ 0x0c, 0x15, 0x19, 0x1e },
> -	{ 0x0b, 0x15, 0x19, 0xff },
> -	{ 0x0e, 0x14, 0xff, 0xff },
> -	{ 0x0d, 0xff, 0xff, 0xff }
> -};
> -
> -static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v5 = {
> -	.swing_hbr_rbr = &edp_swing_hbr_rbr,
> -	.swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3,
> -	.pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr_v5,
> -	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v5,
> -};
> -
>  static const u8 edp_phy_aux_cfg_v5[DP_AUX_CFG_SIZE] = {
>  	0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x00,
>  };
> @@ -564,7 +543,7 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
>  	.is_edp = false,
>  	.aux_cfg = edp_phy_aux_cfg_v5,
>  	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
> -	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
> +	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v4,
>  };
>  
> @@ -944,7 +923,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
>  static struct qcom_edp_phy_cfg glymur_phy_cfg = {
>  	.aux_cfg = edp_phy_aux_cfg_v8,
>  	.vco_div_cfg = edp_phy_vco_div_cfg_v8,
> -	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
> +	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v8,
>  };
>  
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

