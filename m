Return-Path: <linux-arm-msm+bounces-98540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL3RHoLsuml0dAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 19:18:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDA42C11E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 19:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 94E563082BA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 17:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB582D63E5;
	Wed, 18 Mar 2026 17:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YG2I1ajV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X9LA1vKD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB47E2264C7
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 17:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773854137; cv=none; b=MiNEw3/HbB5sruRgXzQTz0xgqslNtXmEOILogI32lnmlPvwzDQyQVQj4JzxnXIKCqyv9uQqO/iQcCZ3MZIf2kzcSrE7xewHwuS7TxEYz6jX5ZnHzPcq5mGT1+NFnC8EABEjxvffWjDwVZOL+Z24ZobcbvMfFw0yeukqbJLbkmgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773854137; c=relaxed/simple;
	bh=Gis5FSHSihCMyYVwvPK3Xb001YnKR8rVH74MjmfedgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fe+Lu4TpAShwYc3NVSzIRYLGtIxgIazolen68WbC6zUwq9vWgdM5fyaXq8OTmpJYE/r9nmR73K7D49iHEwtrws5Wa81tc90NJ2oVlr5ioLtIBUeUhcai5FfEPgElG2FLMOq8bpCcj1kWDprFcTZamjxcNsz1uumiOMFXWNJ5r1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YG2I1ajV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9LA1vKD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFgY771373586
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 17:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aHulX3nyPqMmPFo5kVxaIEHe
	3GwIwupRJyCV10Oa3Ks=; b=YG2I1ajVLLiWB9n0/gLbtrC3ddPRBfmrfzSrdpgK
	ZPc/P89NNX6DVvexswTql0Nnog3JhHg2WnAaWidQif5/0you2WhjF1NrvuoWEMc5
	ZOWJUSeFM+t1udYIN4MeYioZv8N47A2IkWYszHiFoudBBsEf8D0EZMM3nQbzJPYQ
	QpUWt00MGwNZa2yDSaQ0LszBOVl4Q6mC4HsaPRZHAse8xlSzvLqdl6aWRnb3T3+v
	qhekGaa7S1e91Fos1dTs/ECj7o0gaMlrtPNxL8kOcomlNF7FuMo1QIfVpBLZpSPg
	KGbjde6gltFYvnL1EmieG9r0V7sIx/w1tGpPKIVHgv/UAA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyuuch6dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 17:15:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509007aea22so2518101cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773854133; x=1774458933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aHulX3nyPqMmPFo5kVxaIEHe3GwIwupRJyCV10Oa3Ks=;
        b=X9LA1vKDH8VJPWPQ9XCXI4Jy2BNjdienn3cgfXCrE5MvzA03jjaD+qscNUqLROMP67
         vCM9zViJgS2fXA30uiGqD0guauVZUUMYdkuRnxx/Rt8a32JPO1GdqEYMMIH/MeWOg/6x
         Q2EmBfoDMsYTBaJJYHNWft5xWznCSyGOcBNl25W8ktp66DF/joU8AOlt8kjjlq5Bsf+v
         PDm7G1hIefdVRq5HA+KlPrFx6yETuwdnMKNcSZUdgxNGJfzof7lspjyxfpJHVK0mc78t
         OH7neMeK8qoy6ktcomATn+TU1D30s3ALAvjk0q/WYfSu+ByC7R/t6GzajZQIaQCxQn4v
         jotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773854133; x=1774458933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHulX3nyPqMmPFo5kVxaIEHe3GwIwupRJyCV10Oa3Ks=;
        b=SpVxTice6gqVuVB5rpLNr0dcsjcTmLRHAnCU9bPdlUQ7aiL428bCqG9kxkxOeeqX8l
         LLSOTqjQVnTMZzcSTBGnC+JERkiaYII8LnssKeEEe/03mYWOZ+u07ldSurKWbDGeosxY
         8I1iL5gWvDUhdlb60XX4ap/aFh0AmPoheko0ySxGE3ozntnQB9u8NSmeXSaQkSLq9xFO
         4s5q/64WikRgg5a4NEpYB8TdQ0tkh5dd5qjtucxTTDlmIZxeabIQvzXyXXcuHYSO2dgN
         jbHR1Y3Jb00xnz4Lc6r991GCxl3r2o/IVkXER8aUIMwwdjIv3j4KZurRZs8cuQgajCcc
         lDyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuXhgt5Z0gYY39PWQAfB3cYSIKPySns7FhSBxsAi6TaazEdrsGCZS15sG1CPEllwKOkm+6l51lowngfez1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy60QyReuH4YV0Ra7dzbOEoED+2RbscKlhNi0Tk6YJbMweSBOhX
	qHaKkXG5vaIpra2ZS+TRg+ilIMU2HVLbAAEJwY8soXLSECP8e28mBOkMZeF7S2cxewXpT0lnyy+
	6VKSklcJZFSPoHP11+3gi2U9Auj5KhpjIA4vtiUGQvlm9Rsk4EdWHd6WWKIl+zrkkMpX3
X-Gm-Gg: ATEYQzxhkR4O3QLUq86TSDer9MjmCbf5zYtYe11Yjxco7ZeIbA2IaCD9mpJSjmm1SiX
	toAtVJz4Zm1tbw7CuibEDx4MdwvQVAb3icc1SlmVKNebRyPccqTPTUbPatTZUuRs3jBhTpg6v1s
	Xi7GM0RhHH2g30XRjuehHubrK8dAtw9nz8MeMmmQW842DOF9Yjwz+4EAEmkySCH4jvjs3cC6XPc
	Mug/7eN/gXlj5wQg4BO2xzozxHqXk1puwm48S8XAbBE32NdBTAHHa1zEfOfnHQVT3ThV8Nxv81h
	E4TYtFzUfJ0id4++kDZY561pk2lzmDGtScCxbgbcQqnBT7uyBykVAjF1cDp9Q7NaPKMZOuEIeYL
	TDT1T9cdrSxAesURnhAzXNJ4xX+6KB0i5GsmfWTGL2Xr/MCsevJwyvZYkNTjh4+r5sbih7CahyQ
	hhOe6llUQbgIw2IwGT1b+lbthmdaA80GwXFbw=
X-Received: by 2002:a05:622a:15ca:b0:509:1cf9:ea09 with SMTP id d75a77b69052e-50b14900351mr54257991cf.67.1773854132534;
        Wed, 18 Mar 2026 10:15:32 -0700 (PDT)
X-Received: by 2002:a05:622a:15ca:b0:509:1cf9:ea09 with SMTP id d75a77b69052e-50b14900351mr54256641cf.67.1773854131670;
        Wed, 18 Mar 2026 10:15:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c6e28bsm677462e87.52.2026.03.18.10.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:15:30 -0700 (PDT)
Date: Wed, 18 Mar 2026 19:15:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 4/4] phy: qualcomm: add MSM8974 HDMI PHY support
Message-ID: <dpzq6o4qdttbmgtpgit2atjghu2kwrcj36ko3rnvwaehbkvjrk@lr4ms7mi6aiz>
References: <20260314-fd-hdmi-phy-v5-0-58122ae96d3b@oss.qualcomm.com>
 <20260314-fd-hdmi-phy-v5-4-58122ae96d3b@oss.qualcomm.com>
 <5a464fca-7be5-44a6-b124-7b80ea859a9e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a464fca-7be5-44a6-b124-7b80ea859a9e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: IdSpKbLX3za2Hji0Edk_Z3scDoX4WT6n
X-Proofpoint-GUID: IdSpKbLX3za2Hji0Edk_Z3scDoX4WT6n
X-Authority-Analysis: v=2.4 cv=U4ifzOru c=1 sm=1 tr=0 ts=69baddb6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=5ezwpRT3i1EXliiOuAgA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE0NyBTYWx0ZWRfX0qp5YzmRmAi6
 KuoyunRxlpK4djF0iBcbrbmxLh+Cbz1d1HStw07ty728SnF7SQf0lVh1pDZdROsID+aZMgh8sxy
 SCkDOYsBGa01P10BAz9RL3H8TcAv9/ki6LI+oOS2Um34IFn+lCDDb/AOSXMTk2YvY4tZKQs3xHo
 jA5ks1EUbvg1aWwOt3m+y+L0nsS8mkmoHGwhHaiDQPCMjHlTHhC6TMojPzvIfR2Sf940dohNlFu
 jJiUt6wOTtdj1GMm6r/7ISGVMAIWmXTFNTEoArTklPSAHxBvXkUk92XfrU08b7FYD7fT19z3oTv
 ozPP9rGcEKX9Ol0gye4VMtXauEN2YGoUR+VpVJ3dAoRY2Uful5lNUfUMeUz+gMlb917RHU6syWS
 OpAAecTI22eQtafm5izJkfDgkjc+zPsWYVNVbIQI6SfH0hSRbE+G9UEojcUO7NmXgppG/Xp1Sr9
 jSpHJQ25NqRjoPpt/qQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180147
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98540-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8EDA42C11E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 10:22:08AM +0100, Konrad Dybcio wrote:
> On 3/14/26 6:06 AM, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Add support for HDMI PHY on Qualcomm MSM8974 / APQ8074 platforms.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	sdm_freq_seed = mult_frac(remain, 0x10000, int_ref_freq);
> > +
> > +	val = (ref_freq_mult_2 ? BIT(0) : 0) |
> > +		((refclk_div - 1) << 2);
> > +	writel(val, base + UNIPHY_PLL_REFCLK_CFG);
> > +
> > +	writel(sdm_mode ? 0 : 0x40 + dc_offset, base + UNIPHY_PLL_SDM_CFG0);
> > +
> > +	writel(dither ? 0x40 + dc_offset : 0, base + UNIPHY_PLL_SDM_CFG1);
> > +
> > +	writel(sdm_freq_seed & 0xff, base + UNIPHY_PLL_SDM_CFG2);
> 
> Some beautification (BIT(), FIELD_..(), defined magic values) would be
> really nice to see.. although I'm not sure how much you can do with the
> PLL registers..

I can try doing a bit of it, but not that much. The HDMI PHY is mostly
unspecified for that platform. The code here is mostly based on the
study of the existing values in downstream and corresponding DSI PHY
(which uses the same UNIPHY core).

> 
> [...]
> 
> > +	ref_freq = ref_freq * 5 / 1000;
> 
> mult_frac()

ack

> 
> [...]
> 
> > +	rate = (dc_offset + 1) * parent_rate;
> > +	rate += mult_frac(fraq_n, parent_rate, 0x10000);
> > +
> > +	rate *= (refclk_cfg >> 2) * 0x3 + 1;
> 
> Really strange calculation, but in the end this is (n * 0.75)+1 -
> mult_frac()?

It might be based on some other dividers which I didn't recognize.
Anyway, yes, mult_frac() would work.

> 
> > +
> > +	return rate;
> > +}
> > +
> > +static const unsigned int qcom_hdmi_8974_divs[] = {1, 2, 4, 6};
> > +
> > +static unsigned long qcom_hdmi_8974_pll_recalc_rate(struct clk_hw *hw,
> > +						    unsigned long parent_rate)
> > +{
> > +	struct qcom_hdmi_preqmp_phy *hdmi_phy = hw_clk_to_phy(hw);
> > +	u32 div_idx = hdmi_pll_read(hdmi_phy, UNIPHY_PLL_POSTDIV1_CFG);
> > +	unsigned long rate = qcom_uniphy_recalc(hdmi_phy->pll_reg, parent_rate);
> > +
> > +	return  rate / HDMI_8974_COMMON_DIV / qcom_hdmi_8974_divs[div_idx & 0x3];
> 
> nit: double space
> 
> 
> > +}
> > +
> > +static int qcom_hdmi_8974_pll_determine_rate(struct clk_hw *hw,
> > +					     struct clk_rate_request *req)
> > +{
> > +	req->rate = clamp(req->rate,
> > +			  HDMI_8974_VCO_MIN_FREQ / HDMI_8974_COMMON_DIV / 6,
> > +			  HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV / 1);
> 
> I don't know if it's a good direction, but maybe:
> 
> const unsigned long max_rate = HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV;
> 
> clamp(req->rate, max_rate / 6, max_rate)

Note, it is clamp (min_rate / 6, max_rate)

> 
> ?
> 
> [...]
> 
> > +static int qcom_hdmi_msm8974_phy_find_div(unsigned long long pixclk)
> > +{
> > +	int i;
> > +	unsigned long long min_freq = HDMI_8974_VCO_MIN_FREQ / HDMI_8974_COMMON_DIV;
> 
> reverse-Christmas-tree?
> 
> > +
> > +	if (pixclk > HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV)
> > +		return -E2BIG;
> 
> include/uapi/asm-generic/errno-base.h
> 11:#define      E2BIG            7      /* Argument list too long */
> 
> -EINVAL?

Ok

> 
> Konrad

-- 
With best wishes
Dmitry

