Return-Path: <linux-arm-msm+bounces-73234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59085B54418
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 09:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 041EF3A5FEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 07:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF4A2D0C60;
	Fri, 12 Sep 2025 07:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gDdotHWi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F2D2C11C2
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 07:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757663013; cv=none; b=rCS6QWfqBaLHDPcdP52uh84NvyVexVJmYNL7q2P0rlzqiOvf8G7dUWQXANUe1pO3v5TM+MN956RnyCO57z5DDYr0r6qlGms1xN3TUbKbHKkCD2z2WvnMcHZ20eZ14loQnstjGFAIGCnV5FWdFSXBofZQW++GGA47xO2vXrTtxoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757663013; c=relaxed/simple;
	bh=QbQ+D0lj0zyGSWQXCzBrA6FK9SMcdNAf9ABEcq+D/4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yi8B6f04FJVyugbQ2anhQdh+7E9ieyTXWS+Sl+wWa20jQ0IDfNsJoGW55Z6zxC2UT9oepTGO9CdCdCzuAgiaAEKYx6E5yz+IDsAjD2yf/wjNaYMH84RO2YBnn1lUcR5NNNjf9MS20jgd15oVfhv819ExRc1Y/p3v/pWbFlYU5e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gDdotHWi; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3dce6eed889so1498399f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 00:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757663010; x=1758267810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/tlrqWaDX6PzrBsN1xgSiYWgH8yIXX+vr7eFeQ9eV+s=;
        b=gDdotHWiXd59YjG9AmILsyGVbq1w0Tq/Orl6/qeqqKAg3MKv8iKkGviUGNl/p2+05K
         ls0oBIonrkoVu7i4Gnzv5GhBdJZBn+JXiuZctSAYbqiXLyfjqrMWYwtsfuaZqefaPEhr
         y1loyZzRDD/1t+q1+DUlaPpE7Fw/0o9DsZUPlakU8XsXVBmrKfohRdfnNdMsDhDwP6Oq
         bRjEpoW24guhWwi7E0kzavb1JHWHBxxyWd/cVjBpAsPytfjl4YmYaoiuRsKuUUQPJ+3C
         TgRfzgd2rUZB3CJevrHYQxti5Uit6d2Z1ZWQG7rTei1Ox4sH1M/WDZYeFtZ//Q5vnz6A
         t0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757663010; x=1758267810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tlrqWaDX6PzrBsN1xgSiYWgH8yIXX+vr7eFeQ9eV+s=;
        b=uyQiZQuBvis6Dodrpdsjt66Z30+VCNcXqCm6SS7KGQRaCcSQp3tnUbAk/P61mKjv4u
         sDtrDTYTjptbKzRcv6CSFEfZrdox74KJgOnf14h9ZTTLlWnw+zKHVC4KholpShGIjBnF
         790xdfiP63YrVse50NgPbDMTLd5qCnQFrEB66LJrBffVPHR5UVjz4Sj+2pgRf/EJnZuK
         WWknjLxTz97L6SvfgGAyS1JcxJQxerJf8BeoR9UId8SNipCOApEEOR1itXwg1gv10xdE
         L37/4skHo8ekWmUR+fqLgcZ9hRKomuUK2C2sKXd6+GOvf9mpjSGq+KnwVYvaGltWwJ72
         QcqA==
X-Forwarded-Encrypted: i=1; AJvYcCXaNpNd45U2clWMVwh9qlLF/MVYc6dTXD0nGWans4SaKDw6FoI4ElR/RDcMglnCgp1QzpgiJG2pcnPCKNqf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy10qwZ0j2lfNdE1q7p+IfUC8bl2gWXvvtxenmuQFAJIAmL6V8X
	h0ikt1au0Tb58xVCRvlboUhJRRM2qUogX3eXN5ncZTLuC+8OQxCPBaNjleevT3oCQg0=
X-Gm-Gg: ASbGncu08qij09+kYu5hCx0Dytal1iKLGUtTRAo2Ptj0Uzk+VxFkz2edc6Qn1UbfUz4
	UQckfhQzRdFCl2f7xtevdCX1HivVv41wE6jKGdjqwP7MOAxxk6ULdHL2Ni3UXLjxrPQ4EbN13we
	5LKbT46k34p/2+p62rnGxtheoSL5Vh8XQSu7rTv785qKrmAFLD4NQtVqzAaNrUlaRUY55ZAcbFC
	JKY4eCIF8LhFKe7Y549ymnN3pwzPGPLA1pCykdSMbeoZQCZCOUavGrvF4AChPao8zs6f+xSwldV
	I+985l+V0fqZIkq+3NiDnUmvd1/MYMYiTnAX8uJZutwADj0v16GMcFm2zixWf2bE2l28OmXKXCV
	UQ5vqY++xe25p64JtE0jbFg==
X-Google-Smtp-Source: AGHT+IEZAiE1f9boxOUWUwCm6QWtzQinPI/QYY7rsGgyorpzn3871kCxtIjCpGOMwKr6zoccKgtOdA==
X-Received: by 2002:a05:6000:230f:b0:3e7:4071:188c with SMTP id ffacd0b85a97d-3e765a04970mr1862367f8f.60.1757663010049;
        Fri, 12 Sep 2025 00:43:30 -0700 (PDT)
Received: from linaro.org ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760786cddsm5695898f8f.14.2025.09.12.00.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 00:43:29 -0700 (PDT)
Date: Fri, 12 Sep 2025 10:43:27 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] phy: qcom: edp: Add Glymur platform support
Message-ID: <4a5brcec3knsjtowyju33drs2twq72mtpiwo54dtshsvs22d6v@e7rztm64nmlo>
References: <20250911-phy-qcom-edp-add-glymur-support-v3-0-1c8514313a16@linaro.org>
 <20250911-phy-qcom-edp-add-glymur-support-v3-4-1c8514313a16@linaro.org>
 <DCQAGDC63M8X.3DVH6I9FA0IZD@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCQAGDC63M8X.3DVH6I9FA0IZD@linaro.org>

On 25-09-11 22:28:24, Alexey Klimov wrote:
> On Thu Sep 11, 2025 at 3:45 PM BST, Abel Vesa wrote:
> > The Qualcomm Glymur platform has the new v8 version
> > of the eDP/DP PHY. So rework the driver to support this
> > new version and add the platform specific configuration data.
> 
> It is a bit confusing. Subject suggests that it is an addition
> of a new platform but patch itself and description looks more like a
> rework rather than new platform addition.

The larger part of this patch is actually the addition of v8 specific bits,
which is only used on Glymur, AFAICT. So here, new platform means new init
sequence (at least), but new init sequence requires addition of v8 bits.
The rework is rather minor in comparison with the v8 addition.

> 
> The ->aux_cfg_size() rework here reminds me
> 913463587d52 phy: qcom: edp: Introduce aux_cfg array for version specific aux settings
> 
> Ideally this should be split into rework and adding support for a
> new platform. Or please update the commit desc and subject to explain
> why this is the way.

Splitting out the rework could be an option, however, it would not add
any value. Seeing the changes needed by the new v8 version alongside
with the addition of the v8 version makes the patch more intuitive to
read, IMO, specially since, again, the rework pretty is minor.

If anything, maybe I could add to the existing commit what exactly needs
to be reworked for the v8 version addition, but IMHO the rework code is
quite self-explanatory, and we should only describe in the commit
message what the patch does not how the code works.

> 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-edp.c | 240 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 234 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> > index 7b642742412e63149442e4befeb095307ec38173..b670cda0fa066d3ff45c66b73cc67e165e55b79a 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> 
> [..]
> 
> >  static int qcom_edp_phy_init(struct phy *phy)
> >  {
> >  	struct qcom_edp *edp = phy_get_drvdata(phy);
> > @@ -224,7 +241,11 @@ static int qcom_edp_phy_init(struct phy *phy)
> >  	if (ret)
> >  		goto out_disable_supplies;
> >  
> > -	memcpy(aux_cfg, edp->cfg->aux_cfg, sizeof(aux_cfg));
> > +	memcpy(aux_cfg, edp->cfg->aux_cfg, edp->cfg->aux_cfg_size);
> 
> So, if I understand this correctly, when or if init sequence will
> span beyond DP_PHY_AUX_CFG9 and DP_AUX_CFG_SIZE won't be updated,
> then we might end up doing something fishy here?

So, usually you get an init sequence that gives you register names and
registers value. This means will never get anything beyond the AUX_CFG12
as part of the AUX_CFG array. At least not on the currently available
platforms. In case a new platform will come around with AUX_CFG13 and
beyond, then this whole thing will need to be reworked heavily due to
variation in size of the AUX_CFG register layout, not because of the
variation in size of the AUX CFG init sequence, as it is the case now.
But this fits into the 'future problem' bucket.

> 
> Maybe add an if-check or even
> BUILD_BUG_ON(edp->cfg->aux_cfg_size > sizeof(aux_cfg))
> or something like this? Or kmalloc aux_cfg eventually at least,
> however it seems to overcomplicate things.

Definitely not BUILD_BUG_ON !

And adding a check for the size it's pretty pointless since we currently
hardcode the size of the array when defining it.

But maybe I'll outvoted here ...

> 
> [..]
> 
> > +static int qcom_edp_com_configure_ssc_v8(const struct qcom_edp *edp)
> > +{
> > +	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
> > +	u32 step1;
> > +	u32 step2;
> > +
> > +	switch (dp_opts->link_rate) {
> > +	case 1620:
> > +	case 2700:
> > +	case 8100:
> > +		step1 = 0x5b;
> > +		step2 = 0x02;
> > +		break;
> > +
> > +	case 5400:
> > +		step1 = 0x5b;
> > +		step2 = 0x02;
> > +		break;
> > +
> > +	default:
> > +		/* Other link rates aren't supported */
> > +		return -EINVAL;
> > +	}
> > +
> > +	writel(0x01, edp->pll + DP_QSERDES_V8_COM_SSC_EN_CENTER);
> > +	writel(0x00, edp->pll + DP_QSERDES_V8_COM_SSC_ADJ_PER1);
> > +	writel(0x6b, edp->pll + DP_QSERDES_V8_COM_SSC_PER1);
> > +	writel(0x02, edp->pll + DP_QSERDES_V8_COM_SSC_PER2);
> > +	writel(step1, edp->pll + DP_QSERDES_V8_COM_SSC_STEP_SIZE1_MODE0);
> > +	writel(step2, edp->pll + DP_QSERDES_V8_COM_SSC_STEP_SIZE2_MODE0);
> > +
> > +	return 0;
> > +}
> > +
> > +static int qcom_edp_com_configure_pll_v8(const struct qcom_edp *edp)
> > +{
> > +	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
> > +	u32 div_frac_start2_mode0;
> > +	u32 div_frac_start3_mode0;
> > +	u32 dec_start_mode0;
> > +	u32 lock_cmp1_mode0;
> > +	u32 lock_cmp2_mode0;
> > +	u32 code1_mode0;
> > +	u32 code2_mode0;
> > +	u32 hsclk_sel;
> > +
> > +	switch (dp_opts->link_rate) {
> > +	case 1620:
> > +		hsclk_sel = 0x5;
> > +		dec_start_mode0 = 0x34;
> > +		div_frac_start2_mode0 = 0xc0;
> > +		div_frac_start3_mode0 = 0x0b;
> > +		lock_cmp1_mode0 = 0x37;
> > +		lock_cmp2_mode0 = 0x04;
> > +		code1_mode0 = 0x71;
> > +		code2_mode0 = 0x0c;
> > +		break;
> > +
> > +	case 2700:
> > +		hsclk_sel = 0x3;
> > +		dec_start_mode0 = 0x34;
> > +		div_frac_start2_mode0 = 0xc0;
> > +		div_frac_start3_mode0 = 0x0b;
> > +		lock_cmp1_mode0 = 0x07;
> > +		lock_cmp2_mode0 = 0x07;
> > +		code1_mode0 = 0x71;
> > +		code2_mode0 = 0x0c;
> > +		break;
> > +
> > +	case 5400:
> > +		hsclk_sel = 0x2;
> > +		dec_start_mode0 = 0x4f;
> > +		div_frac_start2_mode0 = 0xa0;
> > +		div_frac_start3_mode0 = 0x01;
> > +		lock_cmp1_mode0 = 0x18;
> > +		lock_cmp2_mode0 = 0x15;
> > +		code1_mode0 = 0x14;
> > +		code2_mode0 = 0x25;
> > +		break;
> > +
> > +	case 8100:
> > +		hsclk_sel = 0x2;
> > +		dec_start_mode0 = 0x4f;
> > +		div_frac_start2_mode0 = 0xa0;
> > +		div_frac_start3_mode0 = 0x01;
> > +		lock_cmp1_mode0 = 0x18;
> > +		lock_cmp2_mode0 = 0x15;
> > +		code1_mode0 = 0x14;
> > +		code2_mode0 = 0x25;
> > +		break;
> 
> These sections for 5400 and 8100 rates seem to be the same. Is it correct?
> If yes, then maybe join them together and drop duplicating lines?
> 
> There is probably similar thingy in qcom_edp_com_configure_ssc_v8() above.

I agree. This is a good point. I'll do fallthrough instead. In the
_configure_ssc_v8() above as well.

> 
> Best regards,
> Alexey
> 

Thanks for reviewing.


