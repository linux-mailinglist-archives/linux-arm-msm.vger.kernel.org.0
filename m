Return-Path: <linux-arm-msm+bounces-98883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eqJ2Cv7qvGkL4gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 07:36:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7962D644A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 07:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F53C301060F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 06:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E06B3242D7;
	Fri, 20 Mar 2026 06:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IzUtd72r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VPsEaIEs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E068531F99E
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 06:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773988603; cv=none; b=E949kRSxIoKbCPO/Kq1AMEPxBEbn8qvuszxtYvCy9Mzd7evsCsGr9rzXxn8d2slDhjXHX22i60TCQ9VBl4V1wDOn82okjQGIgmhaZyqNLlRUaeL2rSL3FBSP9PCN9vx67x4tyZQOLwF9EMXR3RfSu1spjzvptUlF3iX7Hmw3WDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773988603; c=relaxed/simple;
	bh=aWWCiHdptLBAuskvWrBJXobgVwSKWyquCSKRPSlU6wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHSB5hP/wbDycLvC9UFXArYo6JKaZa/HBQne8tTHzfTrkcA2Ti7s7zwwrYNuW1H4WBAKlx+nxmQtyN1PCH4/km6vMvl/yTJ3jHuDgwGVTQwjSOb9gaF963QRYnBPa93r9rSScJwcCC2auU6929YnWTAp6tPJ8CHAhe8wXyudjho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IzUtd72r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VPsEaIEs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2XnBZ4078163
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 06:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zFwJZkJXzTmRr/gxQAHLFDg6XAlrx8f/ZITkjIT7Ds0=; b=IzUtd72r5Wmfi75t
	yewmiY0kz55xOf661FYymkStAE88wDDf0fNT3ZTQI+kNjKAoZ2roFIus78fyy4Is
	aEs9p1Dak0Jl4+Z04WpR/koBfQHM8+nb5K/xuABlBxWx1ElhfnDJ8LcqK0BE03hK
	E3cyRIYEynzrbWgMVz1vSwWWV+YRc1iWtXxFFE7Mi+/T9RK4DUWb+CPGMbRr6LKD
	M4gHFENJkQlIyqDf3HBgd/jstwgbu5sDEPQzp4+dbbozkHsSCD/w/WDb6Dygz6WQ
	/sS/+c9Dh6le/6Pa1Oek1dDXgazi/guWencglaMa7OQtZP9gCoUSZuDSrwXc/1Eq
	z411ng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0akxm5wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 06:36:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b31cff27fso11467001cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 23:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773988600; x=1774593400; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zFwJZkJXzTmRr/gxQAHLFDg6XAlrx8f/ZITkjIT7Ds0=;
        b=VPsEaIEsXKlUB2u40KodBVOe8d7IIJg9RdNzZiror0/s8H4tDo0O1borYgcLi78yVm
         7TW8uEfcur3/TUFr4LI82mB0SkUHWZ+gi1RZxx5n4jLLI3zZHoBtqjgvNLUnY73ExxCo
         jK8UYQZjLijBPsRzmoWGi/R68XqvcMnIUxDR4QKtorRm5hr5SetascR41g8HeXU1fu3o
         Cl/tuhyvWwD2Bp1Q8DCUUilnI5YchZvj8zFBPv5QjY59QTqpoQb9i9vChyuw6CEJVD7n
         ykE/r1ymqFtQHtObjwjc+FyjwpN+e12aCkLum3/YeU3u0LOqY9l+1wMIGyzTH0ISZVN5
         cmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773988600; x=1774593400;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFwJZkJXzTmRr/gxQAHLFDg6XAlrx8f/ZITkjIT7Ds0=;
        b=FAcQRhovGPIOKtqEfmMYvAHdfDJWx9QZXyyyHkpkxXg4331tKDGnLUaNVEyq3G+Dra
         igXHP3mUJgLL69CAGaLL3NHcYs0CsVAqS/I1VNgTWnTOvAbh+E+GgebP9aLbqRHsMj4p
         lN/XRaCB5Z9Dmi7YtfH5DBpICzxC25ptkT814X0SJEpxLT+/aV3x0+yjvtjC1cbWD0Y0
         HUB23NVJ1ZEhOHKky0hrKhXSjvxqjntEuVrb4SN+VZAwWp+XlcIA19hpOBqIl/xEaK2x
         FeQCRqXhVtRnsNbjyyos/+fvqzBde0swVgl5JGlHOjx0xvNNx3ILM6YJvqSVFIfWWvcv
         fo2w==
X-Forwarded-Encrypted: i=1; AJvYcCW1oTS1cUSMD99yWgskiWDdA4jeUv7O04fko8mbTbhzYO1qX7meZcZibLR2olo8QgWxEVHyckHmQ2FX/lt9@vger.kernel.org
X-Gm-Message-State: AOJu0YwxgMAQPW976h6z/fSrUK+P+eNRS9OlIqZE3dJb24ksBSlMBCWJ
	oKCiF2XcjnB1w+cF3tto7OTimvtHNk8QB4G8ip//6y6tvRwBR0RaY5Sss+Vn3ia6b/wB0BySYRR
	6HpfWLEEzGWS5loUfczRqN0pjI54wKtEUglN2Ve1rNvzmel3FSet7qHGjpWjxc3w4g2oH
X-Gm-Gg: ATEYQzy4i7+IUHtYsMRrgNAJa0u4f6jcz49nq03TUSGzgKNbzY2uXe23rkyNqEJi4jm
	dpNr+5G2ZNx93693xcp/PlpLfno51Y9M8P65KbHW7Q+rhl2fa2L/mpsiga00Ed/gAw4OygPQQyg
	BUNMLMMDK3U2gUuNEbXpV4Fmm/7CKuppkd/o9qCx7ODczDBp0rgfX2XuyxpGax4KEfZPneA6XWi
	9Z9kNDwFO4zZ/RTGE+qQHiXsxT3PlEz0qMAbBqKQMzWpsJet1SkBy6ZpHe4mhK0FxWaA0djgvgW
	0iHNf1buuHafrpy1CAhoGjKKAv7V9nXPZno+JA1oup34LApu6YPEmI7sXIsFeFTevGQz8qNWkU3
	gU3mFLEGlLYZHAeWR0xbjYLUg42P6JpGucEoYjhXrkXmnhieMQBvLt/wd5s8Lbv7oY+g2erC31g
	7C4+NvAok/Oxo5eg2k4ByHmy+ZyshHDa6ONCk=
X-Received: by 2002:a05:622a:6992:b0:50b:2e0c:9237 with SMTP id d75a77b69052e-50b375a351fmr18312601cf.68.1773988599938;
        Thu, 19 Mar 2026 23:36:39 -0700 (PDT)
X-Received: by 2002:a05:622a:6992:b0:50b:2e0c:9237 with SMTP id d75a77b69052e-50b375a351fmr18312451cf.68.1773988599379;
        Thu, 19 Mar 2026 23:36:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9744232sm3875691fa.11.2026.03.19.23.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 23:36:38 -0700 (PDT)
Date: Fri, 20 Mar 2026 08:36:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] phy: qcom: edp: Add eDP/DP mode switch support
Message-ID: <islxoe4wbqx5pl54difetdcl5lrqvfd5ysbaicxz5lv235sfmd@6hwrq3rmqx7c>
References: <20260302-edp_phy-v3-0-ca8888d793b0@oss.qualcomm.com>
 <20260302-edp_phy-v3-1-ca8888d793b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302-edp_phy-v3-1-ca8888d793b0@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA0NyBTYWx0ZWRfXznRtcZGE14uO
 c11w71eknAE1Dk8PeV15XqX7F7Azl2K+ezwsFdxpwIqPtD/o+LZZ+SocjgzrjW1eQctojbsO7wN
 9+IgQGWrvBPizlLVJPNNa8vrXgDWL6cv8rtQpx0D3ro7h3w7k79N99LgjIwoSc8+rGR1Xf0sKvQ
 4DLaSLok5AOgZtZ454BfnZUFpbdQjiZpMVvorPPd6Np7xLcF/8G54gmagcE7gUyctZHELgWwHkQ
 PxK/4+IIoRRL4aCfRNY2TXWVSq0VFtB5U17oGj+mMPtcyKllq5DgG2o5g4KZsS7ggF8j3ZudUyd
 Lf5GT2kjuJbKDvfa1QOchsAbfRNVUs2Gh/CcWf3VrUlYdhH/hyV8adW9An+jjyUKzNMhpUxYhpM
 oSM6xKC+OfX8qmWbOdc4ojJFE4M6hl6yGcca3uepD7TtTtZsAGrJ9lwDJ7f4dTQBNZEx5MQiso9
 nNHIm7dml14eQqGK0xw==
X-Proofpoint-GUID: hBEThSfqL7NlhbuznDcEJRYcXA5p4-f8
X-Authority-Analysis: v=2.4 cv=ZeMQ98VA c=1 sm=1 tr=0 ts=69bceaf8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=JfrnYn6hAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_q1pDddAzHEZ3SoJKR0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: hBEThSfqL7NlhbuznDcEJRYcXA5p4-f8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200047
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98883-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA7962D644A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 02, 2026 at 04:28:29PM +0800, Yongxing Mou wrote:
> The eDP PHY supports both eDP&DP modes, each requires a different table.
> The current driver doesn't fully support every combo PHY mode and use
> either the eDP or DP table when enable the platform. In addition, some
> platforms mismatch between the mode and the table where DP mode uses
> the eDP table or eDP mode use the DP table.
> 
> Clean up and correct the tables for currently supported platforms based on
> the HPG specification.
> 
> Here lists the tables can be reused across current platforms.
> DP mode：
> 	-sa8775p/sc7280/sc8280xp/x1e80100
> 	-glymur
> eDP mode(low vdiff):

Separate question: should we extend phy_configure_dp_opts with the
low/high vdiff? Is there a point in providing the ability to toggle
between low vdiff and high vdiff?

> 	-glymur/sa8775p/sc8280xp/x1e80100
> 	-sc7280

I understand your wish to perform all the changes in a single patch, but
there is one problem with that. Consider this patch regresses one of the
platforms (I'm looking at Kodiak and SC8180X as they get the biggest set
of changes). It would be almost impossible to separate, which particular
change caused the regression. I'd suggest splitting this patch into a
set of more atomic changes. E.g. the AUX_CFG8 is definitely a separate
change. Writing swing / pre_emph tables on Kodiak and SC8180X is a
separate change (or two). Switching each of the platforms to the
corrected set of tables ideally also should come as a separate change,
so that in case of a regression the issue would be easier to identify.

> 
> Cc: stable@vger.kernel.org
> Fixes: f199223cb490 ("phy: qcom: Introduce new eDP PHY driver")
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 90 ++++++++++++++++++++++---------------
>  1 file changed, 53 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 7372de05a0b8..36998326bae6 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -87,7 +87,8 @@ struct qcom_edp_phy_cfg {
>  	bool is_edp;
>  	const u8 *aux_cfg;
>  	const u8 *vco_div_cfg;
> -	const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
> +	const struct qcom_edp_swing_pre_emph_cfg *dp_swing_pre_emph_cfg;
> +	const struct qcom_edp_swing_pre_emph_cfg *edp_swing_pre_emph_cfg;
>  	const struct phy_ver_ops *ver_ops;
>  };
>  
> @@ -116,17 +117,17 @@ struct qcom_edp {
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

I've checked, at least this table doesn't match SC8180X configuration.

>  
>  static const u8 dp_swing_hbr2_hbr3[4][4] = {
> @@ -150,6 +151,20 @@ static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg = {
>  	.pre_emphasis_hbr3_hbr2 = &dp_pre_emp_hbr2_hbr3,
>  };
>  
> +static const u8 dp_pre_emp_hbr_rbr_v8[4][4] = {
> +	{ 0x00, 0x0e, 0x15, 0x1a },
> +	{ 0x00, 0x0e, 0x15, 0xff },
> +	{ 0x00, 0x0e, 0xff, 0xff },
> +	{ 0x00, 0xff, 0xff, 0xff }
> +};
> +
> +static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg_v8 = {
> +	.swing_hbr_rbr = &dp_swing_hbr_rbr,
> +	.swing_hbr3_hbr2 = &dp_swing_hbr2_hbr3,
> +	.pre_emphasis_hbr_rbr = &dp_pre_emp_hbr_rbr_v8,
> +	.pre_emphasis_hbr3_hbr2 = &dp_pre_emp_hbr2_hbr3,
> +};
> +
>  static const u8 edp_swing_hbr_rbr[4][4] = {
>  	{ 0x07, 0x0f, 0x16, 0x1f },
>  	{ 0x0d, 0x16, 0x1e, 0xff },
> @@ -158,7 +173,7 @@ static const u8 edp_swing_hbr_rbr[4][4] = {
>  };
>  
>  static const u8 edp_pre_emp_hbr_rbr[4][4] = {
> -	{ 0x05, 0x12, 0x17, 0x1d },
> +	{ 0x05, 0x11, 0x17, 0x1d },

This was changed only for Kodiak. For SC8180X, I assume, we should be
using the older table.

>  	{ 0x05, 0x11, 0x18, 0xff },
>  	{ 0x06, 0x11, 0xff, 0xff },
>  	{ 0x00, 0xff, 0xff, 0xff }
> @@ -172,10 +187,10 @@ static const u8 edp_swing_hbr2_hbr3[4][4] = {
>  };
>  
>  static const u8 edp_pre_emp_hbr2_hbr3[4][4] = {

I think it becomes worth adding version to the "generic" tables. They
are not that generic anyway.

> -	{ 0x08, 0x11, 0x17, 0x1b },
> -	{ 0x00, 0x0c, 0x13, 0xff },
> -	{ 0x05, 0x10, 0xff, 0xff },
> -	{ 0x00, 0xff, 0xff, 0xff }
> +	{ 0x0c, 0x15, 0x19, 0x1e },
> +	{ 0x0b, 0x15, 0x19, 0xff },
> +	{ 0x0e, 0x14, 0xff, 0xff },
> +	{ 0x0d, 0xff, 0xff, 0xff }

Current table indeed doesn't match the swing table. Please take care
about the SC8180X differences (I think, it will need separate set of
tables).

>  };
>  
>  static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
> @@ -193,25 +208,25 @@ static const u8 edp_phy_vco_div_cfg_v4[4] = {
>  	0x01, 0x01, 0x02, 0x00,
>  };
>  
> -static const u8 edp_pre_emp_hbr_rbr_v5[4][4] = {
> -	{ 0x05, 0x11, 0x17, 0x1d },
> -	{ 0x05, 0x11, 0x18, 0xff },
> -	{ 0x06, 0x11, 0xff, 0xff },
> -	{ 0x00, 0xff, 0xff, 0xff }
> +static const u8 edp_swing_hbr2_hbr3_v3[4][4] = {
> +	{ 0x06, 0x11, 0x16, 0x1b },
> +	{ 0x0b, 0x19, 0x1f, 0xff },
> +	{ 0x18, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff }
>  };
>  
> -static const u8 edp_pre_emp_hbr2_hbr3_v5[4][4] = {
> +static const u8 edp_pre_emp_hbr2_hbr3_v3[4][4] = {
>  	{ 0x0c, 0x15, 0x19, 0x1e },
> -	{ 0x0b, 0x15, 0x19, 0xff },
> -	{ 0x0e, 0x14, 0xff, 0xff },
> +	{ 0x09, 0x14, 0x19, 0xff },
> +	{ 0x0f, 0x14, 0xff, 0xff },
>  	{ 0x0d, 0xff, 0xff, 0xff }
>  };
>  
> -static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v5 = {
> +static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v3 = {
>  	.swing_hbr_rbr = &edp_swing_hbr_rbr,
> -	.swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3,
> -	.pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr_v5,
> -	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v5,
> +	.swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3_v3,
> +	.pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr,
> +	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v3,
>  };
>  
>  static const u8 edp_phy_aux_cfg_v5[DP_AUX_CFG_SIZE] = {
> @@ -262,12 +277,7 @@ static int qcom_edp_phy_init(struct phy *phy)
>  	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
>  	       edp->edp + DP_PHY_PD_CTL);
>  
> -	/*
> -	 * TODO: Re-work the conditions around setting the cfg8 value
> -	 * when more information becomes available about why this is
> -	 * even needed.
> -	 */
> -	if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
> +	if (!edp->is_edp)
>  		aux_cfg[8] = 0xb7;

This is a separate fix, as it changes the aux_cfg[8] value for Kodiak
and SC8180X.

>  
>  	writel(0xfc, edp->edp + DP_PHY_MODE);
> @@ -291,7 +301,7 @@ static int qcom_edp_phy_init(struct phy *phy)
>  
>  static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configure_opts_dp *dp_opts)
>  {
> -	const struct qcom_edp_swing_pre_emph_cfg *cfg = edp->cfg->swing_pre_emph_cfg;
> +	const struct qcom_edp_swing_pre_emph_cfg *cfg;
>  	unsigned int v_level = 0;
>  	unsigned int p_level = 0;
>  	u8 ldo_config;
> @@ -299,11 +309,10 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
>  	u8 emph;
>  	int i;
>  
> -	if (!cfg)
> -		return 0;
> -
>  	if (edp->is_edp)
> -		cfg = &edp_phy_swing_pre_emph_cfg;
> +		cfg = edp->cfg->edp_swing_pre_emph_cfg;
> +	else
> +		cfg = edp->cfg->dp_swing_pre_emph_cfg;
>  
>  	for (i = 0; i < dp_opts->lanes; i++) {
>  		v_level = max(v_level, dp_opts->voltage[i]);
> @@ -564,20 +573,24 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
>  	.is_edp = false,
>  	.aux_cfg = edp_phy_aux_cfg_v5,
>  	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
> -	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v4,
>  };
>  
>  static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
>  	.aux_cfg = edp_phy_aux_cfg_v4,
>  	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v3,
>  	.ver_ops = &qcom_edp_phy_ops_v4,
>  };
>  
>  static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
>  	.aux_cfg = edp_phy_aux_cfg_v4,
>  	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
> -	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v4,
>  };
>  
> @@ -585,7 +598,8 @@ static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
>  	.is_edp = true,
>  	.aux_cfg = edp_phy_aux_cfg_v4,
>  	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
> -	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,

Ok, we are going to continue using eDP table because of is_edp = true.

>  	.ver_ops = &qcom_edp_phy_ops_v4,
>  };
>  
> @@ -766,7 +780,8 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
>  static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
>  	.aux_cfg = edp_phy_aux_cfg_v4,
>  	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
> -	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v6,
>  };
>  
> @@ -945,7 +960,8 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
>  static struct qcom_edp_phy_cfg glymur_phy_cfg = {
>  	.aux_cfg = edp_phy_aux_cfg_v8,
>  	.vco_div_cfg = edp_phy_vco_div_cfg_v8,
> -	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v8,
> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v8,
>  };
>  
> 
> -- 
> 2.43.0
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

