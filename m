Return-Path: <linux-arm-msm+bounces-11105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4D08554E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 22:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88740B2505D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 21:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64D4134740;
	Wed, 14 Feb 2024 21:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WpBTPZsR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED68D13EFFB
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 21:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707946594; cv=none; b=QkJkaoBro5+lYQXwvDauxNGIHOFIAeZGNnnyFwDbDhn+3IprPYvWZZ/6xlnH+sIgQ0uVHuCt04rdcFcCows1aKk9niKrH+TqImYyuc6FdydS3rk7rMRPvljVJg26M2Qb1sp+ABiq8uGozgLWtnvInqbiSp9N0oWmnyaWfn4PDGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707946594; c=relaxed/simple;
	bh=cgchz0x20I7tRWrHbeGbWj31MUYRmJVgT1i/NY4Rxvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhsFvjA79aetBTYUhYOJQOlOP4OfcP/XkJ/c86AX5F9rWwatuxB2JqDe2IB/47RcI15ZO0nQlP3bTpvu1TWRi8gUcYfKochV3Y0UQi5WKVLe5wPBlCvx4HX1RWntfdRCQYCbcO+wmDw4gUUxTCzRtXoUJl4Ygb95WgSKdG5x8MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WpBTPZsR; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5638447af43so292920a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 13:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707946591; x=1708551391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S3oz8EH0OKcpFhmwJDBLxrQIHGXnO+990Fll/VjYnZU=;
        b=WpBTPZsR55iF8W/vo4XhSekUm4+pAwNstMI02u5/X5137hSYrP2BNh4D2sUXSd88RV
         xLc6vea2fP2QSYZSl7HdOshWhS+MbNADjeZblmkskuR9+F2Q0zLR1y8rBJPISobFN1MZ
         L52J0o7FOT6mvf06Y/A5IXQbAbg0CPbWSJ1BCJTjmhl+Z9Qvlumax6TrNTWwOqDDIdbp
         FsIVcXYtXMO6gYl1ETCqYvflVMHk+exPdUMMotCRg1+z4jub6/jvGXWpgqfJrlII3Zny
         bJVI/9NIiUuj6XlKDQpG467UhBTDreMaZ0a22D1bTbZJXISI9rcQNXJboGCmeciaNSPU
         9l6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707946591; x=1708551391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3oz8EH0OKcpFhmwJDBLxrQIHGXnO+990Fll/VjYnZU=;
        b=mw1+08aN5pur33dW1KfGDv3JElfkLthxUfZKMKWXpqcvJOOTYAoh8xhQK/lhLg49tl
         r2Sb8/p0Q/8jN8/xjW6wj5J7kPUwqh7pcZtyJyRqapSf3X3uPxXj2Su+cn3xcA2DaMes
         C4wnm60JO9P3HU7TP1WogA0dVulwZUbRWl/nX+jqHPaEkQgCwb5dP3hvse3AwojoXwsa
         yVV4jWgkZuhKJ6bBJInm1uo14vtp5DCUEdeoC4woAnnTkdiKg8UPy7JvRg1lHuxu9ckN
         vyeaaoMYlirWr6NZxLxbBUMDE8sHHOq3VQJPoWlsB6lot+TtB76IT9NpQnzdZscosvkn
         w+iA==
X-Forwarded-Encrypted: i=1; AJvYcCXT0hjPq31AgxMlZ+RhMLkLFTJD/AnsOfPu4DFxR0peq//oWezgiZkwBIHXSMFq5jlAKujOQKdA41qY3DKqtYZJ0YOiRhC2HPZ33qCVOQ==
X-Gm-Message-State: AOJu0Yw0tdO0I26P8if9l6tmBcZF55+VTgBWZRsFfIA8Ld+1odWbN3fT
	+tGGZnTk3y3Wc6F5RojaVv0o6AU2taz35LB+b+6QN2CTM86aNNspp2crL/RyW6OmC3XckZtfIV6
	p
X-Google-Smtp-Source: AGHT+IHl91PbeghiBa3dyQcytSfZSO2Uh1MXz9LvIQ+QvKdlDHPnH0w2engCYxWRpYz0JoSMhh3kqw==
X-Received: by 2002:a05:6402:398:b0:562:1637:2d94 with SMTP id o24-20020a056402039800b0056216372d94mr2765447edv.8.1707946591185;
        Wed, 14 Feb 2024 13:36:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVx+5f51MvOnaR/HdfKjfiLoqtyiGaLlZVPu2bk7kiIoyXuHZHrEzhiWcnMeLMqYmIOzcUr6Zr3PuUVxKziQelRpsNO9SVFFMg4TNKA5I82ui9T2nsrkzQMPBbNzgOa5/ETe7VF63o2T1fNrbCnbibfSDu2zK3G2Zxd+0IaE6G+GiLKQKJax61uZ4uuy851w7fof3Hd3sCEHMwIWr/yQyq4V3mLU/B5mVqXIWsvxqur1fSqli64wYXvqbD/Y+3mH61ESpuLnVqQs9pfNIUGsdZ9rHNJqiZPy42wnB/wsMbZxx0/rQOw/8KxK6aXtNnj+x6bPYclGPf/e8iEZ0ZBJm192YP9O0NTX1xLZXCsmVHzWapNBDujmCBWMktXR0y8JFPQVT/Cd5VfjmPUKt6MIrdv9eDg6AoZLDBe148XfhQiJLVahIARDbLl56RQD/5T06pj6RcFOAPVLouGfXTApznQ26X5roY8PW52kVp4ce1i//uLrYR97g==
Received: from linaro.org ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id er13-20020a056402448d00b005607825b11bsm4968098edb.12.2024.02.14.13.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 13:36:30 -0800 (PST)
Date: Wed, 14 Feb 2024 23:36:29 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC v3 3/4] spmi: pmic-arb: Make core resources acquiring
 a version operation
Message-ID: <Zc0yXR/fC2OcObLB@linaro.org>
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
 <20240214-spmi-multi-master-support-v3-3-0bae0ef04faf@linaro.org>
 <d9d8e86b-a499-49d1-90ad-6fae5b7dcbb7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9d8e86b-a499-49d1-90ad-6fae5b7dcbb7@linaro.org>

On 24-02-14 22:18:33, Konrad Dybcio wrote:
> On 14.02.2024 22:13, Abel Vesa wrote:
> > Rather than setting up the core, obsrv and chnls in probe by using
> > version specific conditionals, add a dedicated "get_core_resources"
> > version specific op and move the acquiring in there.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/spmi/spmi-pmic-arb.c | 111 ++++++++++++++++++++++++++++++-------------
> >  1 file changed, 78 insertions(+), 33 deletions(-)
> > 
> > diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> > index 23939c0d225f..489556467a4c 100644
> > --- a/drivers/spmi/spmi-pmic-arb.c
> > +++ b/drivers/spmi/spmi-pmic-arb.c
> > @@ -203,6 +203,7 @@ struct spmi_pmic_arb {
> >   */
> >  struct pmic_arb_ver_ops {
> >  	const char *ver_str;
> > +	int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
> >  	int (*init_apid)(struct spmi_pmic_arb *pmic_arb, int index);
> >  	int (*ppid_to_apid)(struct spmi_pmic_arb *pmic_arb, u16 ppid);
> >  	/* spmi commands (read_cmd, write_cmd, cmd) functionality */
> > @@ -956,6 +957,19 @@ static int pmic_arb_init_apid_min_max(struct spmi_pmic_arb *pmic_arb)
> >  	return 0;
> >  }
> >  
> > +static int pmic_arb_get_core_resources_v1(struct platform_device *pdev,
> > +					  void __iomem *core)
> > +{
> > +	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> > +
> > +	pmic_arb->wr_base = core;
> > +	pmic_arb->rd_base = core;
> > +
> > +	pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
> > +
> > +	return 0;
> > +}
> > +
> >  static int pmic_arb_init_apid_v1(struct spmi_pmic_arb *pmic_arb, int index)
> >  {
> >  	u32 *mapping_table;
> > @@ -1063,6 +1077,41 @@ static u16 pmic_arb_find_apid(struct spmi_pmic_arb *pmic_arb, u16 ppid)
> >  	return apid;
> >  }
> >  
> > +static int pmic_arb_get_obsrvr_chnls_v2(struct platform_device *pdev)
> > +{
> > +	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> > +	struct device *dev = &pdev->dev;
> > +	struct resource *res;
> > +
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> 
> It's no longer indented to deep, no need to keep such aggressive wrapping
> 

The pmic_arb_get_obsrvr_chnls_v2 is used by both:
pmic_arb_get_core_resources_v2
pmic_arb_get_core_resources_v7

> > +					   "obsrvr");
> > +	pmic_arb->rd_base = devm_ioremap(dev, res->start,
> > +					 resource_size(res));
> > +	if (IS_ERR(pmic_arb->rd_base))
> > +		return PTR_ERR(pmic_arb->rd_base);
> > +
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > +					   "chnls");
> > +	pmic_arb->wr_base = devm_ioremap(dev, res->start,
> > +					 resource_size(res));
> > +	if (IS_ERR(pmic_arb->wr_base))
> > +		return PTR_ERR(pmic_arb->wr_base);
> 
> Could probably make it "devm_platform_get_and_ioremap_resource "

The reason this needs to stay as is is because of reason explained by
the following comment found in probe:

/*                                                                           
 * Please don't replace this with devm_platform_ioremap_resource() or        
 * devm_ioremap_resource().  These both result in a call to                  
 * devm_request_mem_region() which prevents multiple mappings of this        
 * register address range.  SoCs with PMIC arbiter v7 may define two         
 * arbiter devices, for the two physical SPMI interfaces, which  share       
 * some register address ranges (i.e. "core", "obsrvr", and "chnls").        
 * Ensure that both devices probe successfully by calling devm_ioremap()     
 * which does not result in a devm_request_mem_region() call.                
 */                                                                          

Even though, AFAICT, there is no platform that adds a second node for
the second bus, currently, in mainline, we should probably allow the
"legacy" approach to still work.

> 
> Konrad

