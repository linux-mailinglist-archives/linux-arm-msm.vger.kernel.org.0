Return-Path: <linux-arm-msm+bounces-89346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B16D6D2E37F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 09:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0102B30B029C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 08:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C613064AF;
	Fri, 16 Jan 2026 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftNsvpSS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KEvC24Im"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059AF305045
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768552914; cv=none; b=qQuheUSaREf9PgqgmB3sR//gRrz8L03gEpn2BXBMSayCPivAC8eENDXDVY3bVmFutBzSPRw+q+jmyoFoYBCSyFWjvvr71wPBds9ArMm65dP3vevkZ1moJmBf4BjqAmuy0f7pFANIbzRtNx7ZaBvemv4uODFHIjQEQviU39Guksw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768552914; c=relaxed/simple;
	bh=CFnInMDtRDO4mJl6475GuwkB07psYi8QAdGadBbeIGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RkGBoiIMap8Wr9XCrWCOYOiFBdF0TCk0VBMyjm8E2glBMelnXia+Nycrih3eXNAjw3O0MV0bilEoR7IWhsOTQ3CfnwrdXE3X2mC3CcUfQCp2C3X/4DhUOitjp2oBaIZW4eJ34CTVnVtkeJ9Gtz8OMIr/U/vfl3mAxaxsbo5hP8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftNsvpSS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KEvC24Im; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G87Mke3596332
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MqrY6babuG+epsa1BHzs5F1/SVDAj0TVi7qsEj5Lnts=; b=ftNsvpSS5Janr3rv
	Xy4EnXSPVwrZqlvr+LxNIyOM1YTMK6rbnux1MqHONQXT8yk5csHEPKHR16yM3ev5
	nd+qM+5nzehJJMwNqFMpdDz8Miy3HQ55ujgj3+rv9D0b82F2/I6D/fn9A1ISsq6N
	ha/lsLaAQcDx2Tm+hOqz3jfZ+SyUZQvz7PxBkKfczsRq2891Ak/haAsm+NKnovrf
	2Mto88kXzQUnGXeDqGtDdj40USQcgg2dU4QiKwJuWZY0uFHkTM1r8HK/EnPzKtgP
	rkMtARPoTexvYRbOzjYaQ8HE28RkV1wA2YjX+MUh9nRL/thINyAvDgWs2zU/q2nw
	Ui5Smw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96rsend-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:41:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f07fbd0so807772185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 00:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768552911; x=1769157711; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MqrY6babuG+epsa1BHzs5F1/SVDAj0TVi7qsEj5Lnts=;
        b=KEvC24Imz+MGkZ+WWfVpiR2/4E1rgz4LTgH0ocHmQu+MMUpGe3KRrLfCkzmU/VwmuE
         5be7tUToJWXMeJoIuHxvzjTPm6mvKJICiXMnVTvfvcqdd51dFg1qMOq0Szb1zpX5wY9p
         ik3CXoLpKsW4axeXcVfEilX3X6eVClW+PgXbBLRlQiu80avjDSJC5Nu45xflS5hgtgGa
         5amJjfBwqgdMZWj77Y/VqZzt4K0j7FWoffy22Dq+Hvq6C5La3SKPz8T6NUrapTJx6Ni9
         QwWdmawKfqEAarw/wxEFzIEhvatfCbEG21cJpU0bv7JB+o5E00d97iHC5WqeuVzmTZ3s
         Tb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768552911; x=1769157711;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqrY6babuG+epsa1BHzs5F1/SVDAj0TVi7qsEj5Lnts=;
        b=L16Upn8AzYKDw/YfACiSV7iUSIdMikuTQyof1Hj7y2998nC4XA1tgg7sI8tpoU9MY7
         8ghadQ/y+T3ypd06v4DsjkI0NINbzlULXthxFXVOjWTT5tuIk88u7jbdC+MbkqYQ5Sjs
         GAXeEciHIPJ9dLkx/lfaui+d66UanwnyBRaFoqzP3F4hb7NhRxGzPF3miSqoZlfh1lP1
         AMV/yPnbmdDnreitkZIiZENLyqHCpnrb3zLpPDGV3mAFat2LdMTkCySSbHI1a53IUN8T
         QM4fYejBUbfrYnR3hDJz8jioZnO92Jxz5CuQh0hoO2VH4Vpsw+Sx2bkIKlinnMAnH5iy
         exnA==
X-Forwarded-Encrypted: i=1; AJvYcCXqxtItqP6wi5s4v5AfdHStARkYGxEr7ekbn4JrvXAiOn4cCWA0YtWPPL1RA88qb5uyEcKJ7DCJ1ChwrMDB@vger.kernel.org
X-Gm-Message-State: AOJu0YwcR3jcFgzucHMBhvN44sKiqq22ONU1OXBOS9TAp9JkNrHs3LZa
	YOnGHd1APVPcupT4czw+6p1nf0dM66LdQwKIOPFb5k9z0VrZdCsaoLjsTLpfGIyBDSAc/3oaU/x
	n/JqHwNTG9QFarrD/xEr2Vr6rubxysteJmy875EeNMaoo1hphw/jJd6a5EsquqsRNrK2Z
X-Gm-Gg: AY/fxX48iK35stEAQxMzbxloepHxQTbjmf1AD/+EjHx01isoDb+7pirMsNv1jLL7i3Z
	lpC2u5verxh/OMDq5Dadwm5oEwr6rYYOXz8U6HYL41Xf8sRuIJkSmSBDl95LM26o5nFsSYZv0lJ
	KibhlIVdFmdqB6Kw0uHHJ737Kk3XxdeG1/5V62Yo1q0+BH0DFK5ejYBHRFMRo14TQWd9GkQ7elS
	YEx4H0GhG79IdoNxJNnSvr6dBWhfbFfTxy4kNY3c6aUjfQ8FmXQPEY3idSTKtHsr9KK41bbCDuS
	Gtp0Ts/WNloH2g/qIelILhwtjUbHOrJYeIUnmoaEs2RPOijXQMhpYjz08CknNwCxkHM/J2uUArf
	4cOfKkqbXv57tt1Cv9DD3JgvM1ZhpgVU5ctPAhEV8UvVXwmvDgu1btKWvQCUIOs0JUn62C6OUr8
	HZ5eWh0xuDCzUMPofvqOW1mFU=
X-Received: by 2002:a05:620a:2a02:b0:8c6:a3ed:2f82 with SMTP id af79cd13be357-8c6a68d2f34mr294136285a.12.1768552911126;
        Fri, 16 Jan 2026 00:41:51 -0800 (PST)
X-Received: by 2002:a05:620a:2a02:b0:8c6:a3ed:2f82 with SMTP id af79cd13be357-8c6a68d2f34mr294134885a.12.1768552910596;
        Fri, 16 Jan 2026 00:41:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf352846sm568930e87.38.2026.01.16.00.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 00:41:49 -0800 (PST)
Date: Fri, 16 Jan 2026 10:41:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: Correct LeMans/Monaco DP phy Swing/Emphasis
 setting
Message-ID: <rffcbo7fxful5ciy5znmgdnrnoijeoyw3ysk7sxoop3pw4bnyw@httwc7pk4gks>
References: <20260109-klm_dpphy-v1-1-a6b6abe382de@oss.qualcomm.com>
 <5187dc04-a1a1-4537-9c80-aaa100dd0033@oss.qualcomm.com>
 <33d57a53-93b4-4ea3-a7bb-0b2015501bad@oss.qualcomm.com>
 <ldl7floy6bi5d6svs45xsdgbgkgwxpvj4kuazzg3e6dxzm654l@l5pjud7mvcgu>
 <80411ac4-6143-4c2e-bc9e-20a734f15987@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80411ac4-6143-4c2e-bc9e-20a734f15987@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA2MyBTYWx0ZWRfX+o3BHGxU99dX
 heI4IDSzH5ANBkna4PcygF37L8Rbaj0D7dFWBgvj39DYBFp4RGGLcZICfAw5kpB3buOfZ0PD0oE
 F/bOoGmEvECeSl5YbBozmwOInKInk1oqLS4yQdl7ATnx9O3TuVhA/9hrMpWwr7GXPo1ZWzmAuxr
 TnbjEcIo0NRz/SBeGtlxzYSomr2RQakgWBpNpQh+kVvSoe/LMCI9tt9d6GY74cG6eXbEvBt5Llw
 72GlthsJMjqedgYpF9VGwJA48RwSa3TBNDImAoX8orGUsRgEB2rasVaG0qoICI7adjxGmBu3KCx
 ITS9Fd9r3VEdd53xHijd3UsnRKvMEBZJOR1a8CVPMln64g+vn6h+euRyN2rC9xaajodndE47h1i
 yiQpcVE0/D1PZPsEc76AZ/DqbFfOEcHYKmrxDu/1eLXXIYM6WeR/M9H/AlrroC6MpkJ9dScHzPB
 K2DA/tn+q20hO/SGHNA==
X-Proofpoint-ORIG-GUID: ed4naDP9LJV-Ql41VfJHJbjpls7QIKUj
X-Proofpoint-GUID: ed4naDP9LJV-Ql41VfJHJbjpls7QIKUj
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=6969f9d0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=am5YAbE0vFZGFUSnBLEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160063

On Fri, Jan 16, 2026 at 04:18:43PM +0800, Yongxing Mou wrote:
> 
> 
> On 1/14/2026 2:55 AM, Dmitry Baryshkov wrote:
> > On Tue, Jan 13, 2026 at 08:04:06PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 1/9/2026 5:58 PM, Konrad Dybcio wrote:
> > > > On 1/9/26 9:30 AM, Yongxing Mou wrote:
> > > > > Currently, the LeMans/Monaco DP PHY operates in DP mode rather than eDP
> > > > > mode. Per the PHY HPG, the Swing and Emphasis settings have been corrected
> > > > > to the appropriate DP-mode values.
> > > > > 
> > > > > Additionally, the HPG specifies that the LDO value should be set to 0 when
> > > > > in DP mode. These misconfigurations can lead to link training failures on
> > > > > certain dongles.
> > > > > 
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/phy/qualcomm/phy-qcom-edp.c | 27 ++++++++++++++++++++++++---
> > > > >    1 file changed, 24 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> > > > > index 13feab99feec..5b0d774bd715 100644
> > > > > --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> > > > > +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> > > > > @@ -122,6 +122,13 @@ static const u8 dp_swing_hbr_rbr[4][4] = {
> > > > >    	{ 0x1f, 0xff, 0xff, 0xff }
> > > > >    };
> > > > > +static const u8 dp_swing_hbr_rbr_v1[4][4] = {
> > > > > +	{ 0x07, 0x0f, 0x16, 0x1f },
> > > > > +	{ 0x11, 0x1e, 0x1f, 0xff },
> > > > > +	{ 0x16, 0x1f, 0xff, 0xff },
> > > > > +	{ 0x1f, 0xff, 0xff, 0xff }
> > > > > +};
> > > > 
> > > > For these platforms, I see 4 tables of settings:
> > > > 
> > > > (Low/High) Swing/Pre-em for (Low/High) HBR
> > > > 
> > > > None of them exactly match your change
> > > > 
> > > Emm, this table is in LeMans eDP HPG, here are 6 tables. 4 of them use for
> > > eDP mode and reset 2 tables used for DP mode. If my understanding is
> > > incorrect, please correct me. Thanks ~~~ > [...]
> > > > 
> > > > > -	ldo_config = edp->is_edp ? 0x0 : 0x1;
> > > > > +	ldo_config = !edp->is_edp ? 0x0 : 0x1;
> > > > 
> > > > You'll notice that this is further wrong, because for eDP, it should be
> > > > 0x81 at low-swing-high-HBR and 0xc1 at low-swing-low-HBR, and 0 at both
> > > > cases of high-swing
> > > > 
> > > > Please split the LDO change into a separate commit because it touches
> > > > more platforms
> > > > 
> > > > Konrad
> > > > 
> > > 
> > > Yes, you are right, here seems something not correct. i will separate this
> > > change into single one.Here are some parts I don't fully understand here.
> > > Could you please point it? How do we know whether it is in low‑swing or
> > > high‑swing. I didn’t see any logic in the current code that determines this.
> > > Also, the value in Hamoa seems not same with LeMans,it is 0x51 and 0x91.
> > > 
> > > While going through the Hamoa HPG, I noticed a potential issue.
> > > 
> > >   static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
> > > 	.aux_cfg = edp_phy_aux_cfg_v4,
> > > 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
> > > 	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,...It use
> > > dp_phy_swing_pre_emph_cfg not edp_phy_swing_pre_emph_cfg, but Hamoa really
> > > use edp-panel here.. so does this phy cfg correct here?
> > 
> > All PHYs should support eDP and DP modes, so most of the configuration
> > tables need to be updated/fixed. I tried going through all the tables,
> > but I never had time to do it in a sane and complete way. As you started
> > looking into it, would you please review programming for all chipsets
> > starting from SC8180X?
> > 
> I don't got the SC8180X PHY HPG permission now. once i got it, will check
> it's configuration and see what i can do. But first i want to correct the
> LeMans and Hamoa configuration and post the LDO change. Do you mean
> switching between the eDP and DP mode tables based on is_edp, instead of
> using a fixed table?

Based on the PHY being used in the eDP or DP modes (it is related but
not equivalent to the is_edp).

-- 
With best wishes
Dmitry

