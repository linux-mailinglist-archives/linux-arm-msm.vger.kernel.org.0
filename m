Return-Path: <linux-arm-msm+bounces-88867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A78D1AEA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 19:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BDA9A30124F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 18:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF5C352946;
	Tue, 13 Jan 2026 18:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hNxHtDHF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N1mrRJu0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0FB1DEFE9
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 18:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768330543; cv=none; b=oujVX11Gz0WcfYlUnyRwu/O80XxSjMAzKWd2Z8ikrU//082XNGWJFrAehI2zEv6L183LdSoZ67zqbdv1vXQMyMDjXFnJASMSJm4PfKVEp9K2HNLuEj3TDb0g2f43j0K264ac+COTxbTJs+3DYVjFRQrifL+7xLrOACAGC42DjpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768330543; c=relaxed/simple;
	bh=xjbFr1qdJ+R1h9qnisfg0ij8+49X6t9o3x4R1ddn+Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSL8zMhopGI+scB3H5Xxf/GyekTAGya7JSafeM920T1eF6CFknh/NLmzDBsjulvE/pHQpYlJ2NqXKLOHEeEM9ovhSmHJg8CRDV7PWNcuFFAdonr/bToaUS8xYgSZJNxnLH+m64uePw0xTzCEy9in9cdIm0yk2r3wYcJtBFMgfSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hNxHtDHF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N1mrRJu0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DI1QJF3798441
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 18:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bbmN5F94hoWKqpvhnM5Dpcr9YmdutOrVc3SCFqTyLA=; b=hNxHtDHF5WaLhRIL
	EYzvqT/ZYmNfW/oydI4PLxwBZR7izIvieWfDNt6P3DTySgybB+O0WOSunJlNc1p/
	UHnoDHRycSgDJbtgmSRXMb7RQmIDm0wGo6kR+NpS5lGx45l/piXdqIbvHU59LoCN
	Uu9jM0H4gt6N2v8ioeItPukNSQjby8mYWj6yw9CwAj/8AbAgz1fC/cht+7fetLwQ
	/hhG678XgHNUO/Ey3EBZ2/cFumRnv/0F2zR0Ws6ATMZYsT5jg70e4+gL2Eg9PWCH
	XIB0188sewYultH96uBwzKV8H1gQSjduk3seqKXFn6jwMK2IbNRfpckB8n3Gnkc6
	wcTMAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnm0dsr04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 18:55:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52fd47227so7898885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768330540; x=1768935340; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6bbmN5F94hoWKqpvhnM5Dpcr9YmdutOrVc3SCFqTyLA=;
        b=N1mrRJu0UZr52f0QYHRXxfsKOoqPX8hxT2xnCbYyeOzBBdAOins/H6cpQ/6g2pgsdL
         y/L18qSW1xh8whIAzyQfJlDrFDGKCcD16cxHSnuR6wQTOTYdEPo833Mv8xUZ8cHb+Jfb
         t2W2D876LBmknHMxEXEUH1ugrmKNFKaP+wZHypY9CspGLvHixdszOj4O/ZeLAtbAlJwJ
         huLUC9QaNErhPGALoDzWPR0SNaqzoBME97EtxU8X77BRSnqdzWmT5D6SW5JG/s/SCOSq
         U0A3XVs2yAe1vaOSLdBs7QYvBe/+ykryjanUVlu1G/+KpOISusy2ABSKbNEc53cfaShn
         fJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768330540; x=1768935340;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6bbmN5F94hoWKqpvhnM5Dpcr9YmdutOrVc3SCFqTyLA=;
        b=ZFsJFNRsNdqejDZMSAmPrCKX3Yu9TRKlg72jtq2GVW+JO8mBKWBQ9Rw0NfzDgnRBbh
         he9txad2zKkRwM195XDS4nQNsIZjIM/dZDppv7as1/JeAH2V5HtjkyQviKL2ph1jPd4/
         /p9y9r8PhgUSOFeh/JF2pdIFElmpFnttz3lDRoip4q0f6TYhcY/tiJMeSJyqU6VC5Fxr
         DGbE8sDPzTVI+Z7JHZhZXpEfcGndjbMCSkGNk26gx8+L/uEZgMLi8vNBaBLoGB+VIQDZ
         Y9Pv67OTXHIaN6tgSef2ZyD7vTlLs65vQCOEeg8JFFUl3USAA7eRI8ZUIAh18rngxzR+
         cj+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhsKqqMSa0/eaA9U/3S9CjjEsS/Wbvl+yyjN2Os5L4AqdiZ3ecL6rp0kAezupo7Rau+9hzLNCI+YpjNMkC@vger.kernel.org
X-Gm-Message-State: AOJu0YzNJqP6PHkheACO5KYfz+IeAJ14ulsEfYqg10C7Lfv71U2iP73Y
	NCWsx9glROiwj58x5MAfNGzNqh9LX6SXRdUujKJ7jfXEPHDMkNrTSk+s2yG300PpHn3DOruI1wq
	VYKnihXEX0d6CxjElibyiln16XRTQZbjcGSRFyzz84AACku0j7lLXGE3kW6spF2LtSsskbia25b
	6D
X-Gm-Gg: AY/fxX5fVMRsUtZ5v8pseFEedTIi3wiI9ITrNYpNFNc74Ltc60fhWzQgAQ3/H8pMs9F
	+IbhvqZhJmPNhHopUJvGjZXpyZtA4ojEg7Y/Y6MN2MwNHuaOgPYzGjdJXvIwczBn6sySh0jy4nu
	67L6VlGP08aXU1FcCeUJWOa7MQuwej9KELjXbf1X9zbQTs7VR7IMb3QvR8GPU8gT6xs07D/3aDW
	wmr2lNfUIaPABbACHAYDXHJzbc/5FQvzzBAQdBlq8JDMd0+dkMBa6goAESPXbIWUytIwdJRvI/u
	6We83BvtUjCCVntFHIXg/MHIIZ2V0vfv4ke8Axb44/sbVcCiAa11ces742RBVqtR3/1+Ay39nRi
	HK7msilcJCqv8GcWUQJFaHN2aXmlC2HjgDxJG/Sp0MERKiI9YqPeHy8SkcTTCcfUz1JVIA54A9C
	/GdplrcCGkk0zenM7O1d/7pX4=
X-Received: by 2002:a05:620a:2996:b0:8c0:e5ad:adbe with SMTP id af79cd13be357-8c52fbdcc1fmr33074985a.90.1768330539924;
        Tue, 13 Jan 2026 10:55:39 -0800 (PST)
X-Received: by 2002:a05:620a:2996:b0:8c0:e5ad:adbe with SMTP id af79cd13be357-8c52fbdcc1fmr33072585a.90.1768330539482;
        Tue, 13 Jan 2026 10:55:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38349da581esm11407481fa.11.2026.01.13.10.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 10:55:38 -0800 (PST)
Date: Tue, 13 Jan 2026 20:55:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: Correct LeMans/Monaco DP phy Swing/Emphasis
 setting
Message-ID: <ldl7floy6bi5d6svs45xsdgbgkgwxpvj4kuazzg3e6dxzm654l@l5pjud7mvcgu>
References: <20260109-klm_dpphy-v1-1-a6b6abe382de@oss.qualcomm.com>
 <5187dc04-a1a1-4537-9c80-aaa100dd0033@oss.qualcomm.com>
 <33d57a53-93b4-4ea3-a7bb-0b2015501bad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33d57a53-93b4-4ea3-a7bb-0b2015501bad@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BYXVE7t2 c=1 sm=1 tr=0 ts=6966952d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=krnL4HSfpKtA2fdkqC8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: fOt_1qx4inEoP7cTxq_7X4EpPgGM0Utd
X-Proofpoint-GUID: fOt_1qx4inEoP7cTxq_7X4EpPgGM0Utd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE1OCBTYWx0ZWRfX9BaGw2iGNcIC
 IczWBjnvvrxJ4prn62uQhDpXB2S/7QdCikc/UKiZ9ZZXL+bL2bMBm+ePDQf5WCOfIyp10TDc9hg
 bv/5Rd84Th7u7qsGZhIIIbGY5FwYepCmSx0nvqrTwV98oCMyYzV7AD0atB4/+Bi/t7+zClk6AjR
 AmCOM0Klwi3NO3PrMTmXFLWt/CiHTCc+R56yq14AXaCk/8Hf9SBvLufTtMP6TW18DrUEiuceOf3
 wFN7bUcpq9vRK8AjZbQkqtbYi4qXja0NYKZLrRQRMsf1xRJR0b+zCmj3j02P9k+VblYFvE2ALJD
 QRvbKgPxeAZUPYNOUkU1nT8N8WqElUoCQuArpnXoFTSzfahZDu8cLOn707900WD57Z86hCr/07a
 MM8lGnG/U9xtaEelDOFj1KRCqwLHJRJJYwWnufajsZO83m8mL47Fmi/aa+1TIoxYRYbW+6LuQ94
 ci2zQzII9r4dADxis9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130158

On Tue, Jan 13, 2026 at 08:04:06PM +0800, Yongxing Mou wrote:
> 
> 
> On 1/9/2026 5:58 PM, Konrad Dybcio wrote:
> > On 1/9/26 9:30 AM, Yongxing Mou wrote:
> > > Currently, the LeMans/Monaco DP PHY operates in DP mode rather than eDP
> > > mode. Per the PHY HPG, the Swing and Emphasis settings have been corrected
> > > to the appropriate DP-mode values.
> > > 
> > > Additionally, the HPG specifies that the LDO value should be set to 0 when
> > > in DP mode. These misconfigurations can lead to link training failures on
> > > certain dongles.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-edp.c | 27 ++++++++++++++++++++++++---
> > >   1 file changed, 24 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> > > index 13feab99feec..5b0d774bd715 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> > > @@ -122,6 +122,13 @@ static const u8 dp_swing_hbr_rbr[4][4] = {
> > >   	{ 0x1f, 0xff, 0xff, 0xff }
> > >   };
> > > +static const u8 dp_swing_hbr_rbr_v1[4][4] = {
> > > +	{ 0x07, 0x0f, 0x16, 0x1f },
> > > +	{ 0x11, 0x1e, 0x1f, 0xff },
> > > +	{ 0x16, 0x1f, 0xff, 0xff },
> > > +	{ 0x1f, 0xff, 0xff, 0xff }
> > > +};
> > 
> > For these platforms, I see 4 tables of settings:
> > 
> > (Low/High) Swing/Pre-em for (Low/High) HBR
> > 
> > None of them exactly match your change
> > 
> Emm, this table is in LeMans eDP HPG, here are 6 tables. 4 of them use for
> eDP mode and reset 2 tables used for DP mode. If my understanding is
> incorrect, please correct me. Thanks ~~~ > [...]
> > 
> > > -	ldo_config = edp->is_edp ? 0x0 : 0x1;
> > > +	ldo_config = !edp->is_edp ? 0x0 : 0x1;
> > 
> > You'll notice that this is further wrong, because for eDP, it should be
> > 0x81 at low-swing-high-HBR and 0xc1 at low-swing-low-HBR, and 0 at both
> > cases of high-swing
> > 
> > Please split the LDO change into a separate commit because it touches
> > more platforms
> > 
> > Konrad
> > 
> 
> Yes, you are right, here seems something not correct. i will separate this
> change into single one.Here are some parts I don't fully understand here.
> Could you please point it? How do we know whether it is in low‑swing or
> high‑swing. I didn’t see any logic in the current code that determines this.
> Also, the value in Hamoa seems not same with LeMans,it is 0x51 and 0x91.
> 
> While going through the Hamoa HPG, I noticed a potential issue.
> 
>  static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
> 	.aux_cfg = edp_phy_aux_cfg_v4,
> 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
> 	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,...It use
> dp_phy_swing_pre_emph_cfg not edp_phy_swing_pre_emph_cfg, but Hamoa really
> use edp-panel here.. so does this phy cfg correct here?

All PHYs should support eDP and DP modes, so most of the configuration
tables need to be updated/fixed. I tried going through all the tables,
but I never had time to do it in a sane and complete way. As you started
looking into it, would you please review programming for all chipsets
starting from SC8180X?

-- 
With best wishes
Dmitry

