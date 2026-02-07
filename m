Return-Path: <linux-arm-msm+bounces-92119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wrzsKgYSh2mUTQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 11:20:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FDA10575E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 11:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED2023004D33
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 10:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA832F6937;
	Sat,  7 Feb 2026 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwKrO4/u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ODA2aU+2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98CC2EAD15
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Feb 2026 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770459649; cv=none; b=YixMTRkxcvHNNlcKnIeY/T5JbFYfvYLLLK/Ff/ZqSxS/BIXy8rCtKSjEmaQ8E+z3VzBFo5vhAXbz+Hkv9g6uaQxjrsnKTEO12ZBaNIwqDFG++apbfY98D1XQJ7VVzgD7aq0xZDml5zgRX1883Foe7KjQ9xS9TvHYeP7bKFoH+ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770459649; c=relaxed/simple;
	bh=InQhrNW41rJOJHq/orq7ABTh61fF7jc1ujNfUOaEaPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBn+gwvBtgUHusb/b6iprx4fdrqyOoU4fj5cV3A41kG6lbvAyaYKThT0v5I1dAePG1HUrdNipyPfUVctdtaDdm85b3b6W1oO4tl9gy9Yk9w0r9bSPBBSTAAtaE3rGRjmcqvUAa8QRTeElTw6aQEeLIcOAf4np8uU7BXPO97CNCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwKrO4/u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ODA2aU+2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174mfH0318477
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Feb 2026 10:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MUxz9etW0UGkiS630niLQNPV
	G9GiBBz9yF1xABWgCcU=; b=fwKrO4/utfLfmkdBRFyy5ja9CbrB8E49j9+Yf6yy
	npHKzEr5LsMXT6Ofw5lIaSg+WzhHIP56rQblmX33/HX1DYz7AgLDo45UM62cSF1a
	BlgaUclOWJs+6nczdG4BCmOFZWnz6dXnmOUQZmmIX6Qzwwp+2dN8+XGeLrvWteyL
	axjvqsswtE+cvrf+YldlgAo3pUM9cz4DFuyTEsHPRRxkJ0koTFNdOU90KyvV5HNZ
	lCUgMpSnXxGpwZfpvcVEPrBhTl9NHHUnoqA8yixzKzua+T/o4RMk2Wea4Haix9SA
	jvY5LYbMOOLbNf0/SzUO+TBzUX6a7Ueo/VE4SU50201IEw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xp7gfy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 10:20:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6ad709d8fso689724185a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 02:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770459648; x=1771064448; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MUxz9etW0UGkiS630niLQNPVG9GiBBz9yF1xABWgCcU=;
        b=ODA2aU+2qkkAbjmELaiEM2PtY5YdjJrMnYSSY3Q44E7HaZT485I7N8HR8AehlxryVK
         sH+09CQQzJWhWGxipvk/daKwPooH4/Xfajcu2Wy9Wwi571FEzBd+34e4DRPPB65cuT3e
         sCEpzGy0wWTImu32pgpG2FHG6rRfuhf4Rs3EwRImImG+50tbYUbOpWkV19+S4D1rosW4
         LKCg2fcgKVYX/JG9qkfXXHX2xXhfpxWiwv+AYPL+u7Nz4oOJllXkPhKSdmz9DHO03H2B
         Glm6h4HW3iy2D1OfQQdrw8c/1ZgYU14xj81kRHkwb69CSt8SiILDnbvWeyczNsZ8vl17
         eKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770459648; x=1771064448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUxz9etW0UGkiS630niLQNPVG9GiBBz9yF1xABWgCcU=;
        b=eMCp9IwqqnKW/sxoa+UvOD2xmhG8uwShXzyM/kA4AarnONfXarnW0G+g0UxRrRza0K
         oTQLxwUmW6B8VATtYgxjPEc/60QKjmDO+l8nUDNULycirNoLdxYwIalvT9xHKJF62u8M
         0049aRxXT/oFS3Q3Web+K45h++AfkkXdhuPTJVLJbs6kVX5Va2M66WIGXjJVPxkyY+eC
         NEkmAd+Mo5Db9uRXB/71diULHDtnp3E1TGTa3TTUqN7RgFSIJlTvnmPZn3imnwfc1+ci
         OdMeXCoL1oddvb3MH8Mif4U8lFK+hB4aaE14CJNsQCaAg7IUANEyUhr0CaORlOE25mfC
         8E0g==
X-Forwarded-Encrypted: i=1; AJvYcCVgv8jz5pYFin8xM4gQqVuCoSYLJzozf9o8bWzuPTgF0rrbwD6u5ji7M130JQQJS6kLM0jKaP8BZvp3foLb@vger.kernel.org
X-Gm-Message-State: AOJu0YyvtE97Oo3QZFoCZLdLXt1kdRrHiDajUQEUPZ6uLb7gppFSNrVX
	KtOQhKBajC/UhpOT5RaLvbNAyZOVNMwPeG8JMwscu2aC28kJkvaoIqIl8qYLmMgcy+S0MSjTzLt
	KmQQoDvyTV34giZ4NtzjbppfC7F0BT7uGwdB+IyotO12tUq3eDahhH9XLOkrlG0C+hIjPXr0jHq
	83
X-Gm-Gg: AZuq6aKOnGWfB3zOKdatwhg1Ppm03tTWR4y9ZT4BtrhUdd+XxPaDvoU1xk+ECETEma2
	q9DKsySSrUo4zgjZXW3xhWv47YRV/e27KircdF11ELUA/VfOtcodH3uoXxw89zqpQN5J4TXAFiT
	qeI5vXUqUZQr6/CB7xGMy+8wzqLG5H6GW2fvouUjnnOEDMwv255OUun8mJAf0kyOtnqJPmNr358
	2G8pXqmPcGyUejLZYakKwLFfKRrBuGFJLvpksxTExJ0AnkebQEdE/ukYmK2VXgjT/ZsHzwWoqG7
	c4RRp/lkBZDafDkTnWVNyaUNfhfNy8PD7ESRyJmg6kASEu6EXwhcH6qzMhC8LSk2A77k+a500Ft
	AUCyzYebQO83vLSi2RMLhHOBCft1qeVhrsJdB9RFeFXGU3UiONn8KWsjuShBDV/ASN4Ccrkia6J
	dGFEZL0QnMJ8ydXz5MPFlrtL4=
X-Received: by 2002:a05:620a:448b:b0:8ca:3715:eea5 with SMTP id af79cd13be357-8ca40b953efmr1249053885a.14.1770459647565;
        Sat, 07 Feb 2026 02:20:47 -0800 (PST)
X-Received: by 2002:a05:620a:448b:b0:8ca:3715:eea5 with SMTP id af79cd13be357-8ca40b953efmr1249051985a.14.1770459647121;
        Sat, 07 Feb 2026 02:20:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44d29a2fsm1202391e87.46.2026.02.07.02.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:20:45 -0800 (PST)
Date: Sat, 7 Feb 2026 12:20:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] phy: qcom: edp: Add eDP phy mode switch support
Message-ID: <obxqqoaxybtaspoijvog5uruwnu22ol6jyzraetf5wo45vwyrb@63cuwmdl5oyf>
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-3-231882bbf3f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-edp_phy-v1-3-231882bbf3f1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Zo1tI8Xj8La8XTvG0N4oV9_UwGPl5ePQ
X-Proofpoint-GUID: Zo1tI8Xj8La8XTvG0N4oV9_UwGPl5ePQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA4MiBTYWx0ZWRfX5AxTTa7wc5s7
 SvFHDusJPowAEjRlArZcZmf+ISXLmkxcL8DbtAgU8Moirq2V1ju4Jf+jr1ePUTWkAN42mVE/Nt5
 Z0rsWNXEk402MUHJGBZU6VOkVFCPpJQm/mliszL+YgWWv3+NZ1KTrPB8V7ELzrGsIep9jOYiv4B
 puSNIbLApdj3qAyUUqs2y3ACp/sM+tHhQO3fDFHN3CC0VvuhbxaeMtZxdDOvwKUWEZ9ijwQHyUS
 seoZQ2L+Uv6oZLdGadZl72PONDlT2v0hOrPePaFp8HUD1OBXZUlwQ4jQzDENtrLBsoY/Epr4PoD
 KK1ClkND2GUxoRrXNwJdYnDse6gHZInRMrkNzNfJhbl9j0p9RbqozBRmwje7US3Vr22tAueOzlk
 LD29ggiRyPhzAOiW5e0nKcKpuiTKnvR4BLEK1cjvuebhlGW07kYiLV3RkdTX4KO5YR3XQu7m+IP
 imdYO6DBU8xMgCyJhFg==
X-Authority-Analysis: v=2.4 cv=LvafC3dc c=1 sm=1 tr=0 ts=69871200 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=wa0nkUdPxAOmyYp0rckA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602070082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92119-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B5FDA10575E
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:20:55PM +0800, Yongxing Mou wrote:
> Add DP/eDP switch support by splitting the PHY swing/pre-emphasis tables
> into separate DP and eDP configurations. This allows the driver to select
> the correct table based on the is_edp flag.
> 
> Add a dedicated table for the SC7280/glymur platforms, as they are not
> compatible with the others.

Again, describe what is not working / broken now. Is it something that
we were supposedly supporting or not? Fixes, etc.

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 72 ++++++++++++++++++++++++++++---------
>  1 file changed, 56 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 388226dbad7f..85caa869a8c0 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -88,7 +88,8 @@ struct qcom_edp_phy_cfg {
>  	bool is_edp;
>  	const u8 *aux_cfg;
>  	const u8 *vco_div_cfg;
> -	const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
> +	const struct qcom_edp_swing_pre_emph_cfg *dp_swing_pre_emph_cfg;
> +	const struct qcom_edp_swing_pre_emph_cfg *edp_swing_pre_emph_cfg;
>  	const struct phy_ver_ops *ver_ops;
>  };
>  
> @@ -151,6 +152,20 @@ static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg = {
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
> @@ -186,6 +201,27 @@ static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
>  	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
>  };
>  
> +static const u8 edp_swing_hbr2_hbr3_v3[4][4] = {
> +	{ 0x0b, 0x11, 0x16, 0x1b },
> +	{ 0x0b, 0x19, 0x1f, 0xff },
> +	{ 0x18, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff }
> +};
> +
> +static const u8 edp_pre_emp_hbr2_hbr3_v3[4][4] = {
> +	{ 0x0c, 0x15, 0x19, 0x1e },
> +	{ 0x09, 0x14, 0x19, 0xff },
> +	{ 0x0f, 0x14, 0xff, 0xff },
> +	{ 0x0d, 0xff, 0xff, 0xff }
> +};
> +
> +static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v3 = {
> +	.swing_hbr_rbr = &edp_swing_hbr_rbr,
> +	.swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3_v3,
> +	.pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr,
> +	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v3,
> +};
> +
>  static const u8 edp_phy_aux_cfg_v4[DP_AUX_CFG_SIZE] = {
>  	0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x00,
>  };
> @@ -242,12 +278,7 @@ static int qcom_edp_phy_init(struct phy *phy)
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
>  
>  	writel(0xfc, edp->edp + DP_PHY_MODE);
> @@ -271,7 +302,7 @@ static int qcom_edp_phy_init(struct phy *phy)
>  
>  static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configure_opts_dp *dp_opts)
>  {
> -	const struct qcom_edp_swing_pre_emph_cfg *cfg = edp->cfg->swing_pre_emph_cfg;
> +	const struct qcom_edp_swing_pre_emph_cfg *cfg;
>  	unsigned int v_level = 0;
>  	unsigned int p_level = 0;
>  	int ret;
> @@ -279,12 +310,14 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
>  	u8 emph;
>  	int i;
>  
> +	if (edp->is_edp)
> +		cfg = edp->cfg->edp_swing_pre_emph_cfg;
> +	else
> +		cfg = edp->cfg->dp_swing_pre_emph_cfg;
> +
>  	if (!cfg)
>  		return 0;

Is it not redundant now?

>  
> -	if (edp->is_edp)
> -		cfg = &edp_phy_swing_pre_emph_cfg;
> -
>  	for (i = 0; i < dp_opts->lanes; i++) {
>  		v_level = max(v_level, dp_opts->voltage[i]);
>  		p_level = max(p_level, dp_opts->pre[i]);
> @@ -591,20 +624,24 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
>  	.is_edp = false,
>  	.aux_cfg = edp_phy_aux_cfg_v5,
>  	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
> -	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
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
>  	.ver_ops = &qcom_edp_phy_ops_v3,
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
> @@ -612,7 +649,8 @@ static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
>  	.is_edp = true,
>  	.aux_cfg = edp_phy_aux_cfg_v4,
>  	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
> -	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v4,
>  };
>  
> @@ -811,7 +849,8 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
>  static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
>  	.aux_cfg = edp_phy_aux_cfg_v4,
>  	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
> -	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v6,
>  };
>  
> @@ -991,7 +1030,8 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
>  static struct qcom_edp_phy_cfg glymur_phy_cfg = {
>  	.aux_cfg = edp_phy_aux_cfg_v8,
>  	.vco_div_cfg = edp_phy_vco_div_cfg_v8,
> -	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v8,
> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
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

