Return-Path: <linux-arm-msm+bounces-25111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E6D925F1B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 13:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB4DFB32582
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C38918F2C6;
	Wed,  3 Jul 2024 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HSZOWUmE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5231318C348
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 10:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720003677; cv=none; b=CX/ie57SRClFcjEL9SdfybuuYo2KJA341Zbg5i7YhpWzOedd/xKl9hOSeK/cWk4Mb/POA1M2esDatTKHsI2dkmGI0ZCfVTLWsBoZuULVSE6EiPfgKolqdID5gj0xFdmng+LNkADwAbzJ5Dm03ExThu76lOgVBMuWHciWy0r6Oiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720003677; c=relaxed/simple;
	bh=01G1pCytU+7SWaY/3u+Qzxh2xZaUlir+V/W2sHUjBqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7jBSgZAd81rgyepTzZp3cX3zdLL06N6oTfUuKTjuQE74457J9PjpUMRBKMyqf4TI1q4Ws1vQNNsuyUy7tuy7EAKkqIK2m9kfqu/5hxeisqYJa7Rwb/mf9GUj4QunBXsWJKIhY/i3lqxOHmA6vxnnEp/bPBRG5UpEToSBweno4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HSZOWUmE; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ee77db6f97so23059101fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 03:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720003672; x=1720608472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ItCIIIiziChPhCOCEfOTFCxIJ82TW8GsBOIDZjYAJ5Q=;
        b=HSZOWUmEAb6oxpKwziU/kPphExVsK4lhs+nWUQuVfPqNnRjj/K79uCJLrICXF/bxD9
         bE2+6CtlW0Jt9D8iFDz4YrOSVV2PDNt7GXtb/HA16qzuTFy2ppsppa29+0sqVqX/z+Pb
         9Jq59f2tGoMkBgtvtEASyGeGqA09qoGi2KwvK+upM5i6twfYXSmCpNFTMQUNDbQDjCoF
         tjTnPhA1VFg/C1g4VYRYrGQ0iR+V/JMrE5+lpQvEhXg5/U8mWiYiYXy015SusYfsVaVQ
         Tov7sBF5ckQDsdQq3ICq05knOvIr3kSa5jC2INtnRDB+yrxO4M7XgMDJp76IcMW0PCs4
         dNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720003672; x=1720608472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItCIIIiziChPhCOCEfOTFCxIJ82TW8GsBOIDZjYAJ5Q=;
        b=PGz8tqPqweDorLAX0ZKPqcP4p7A5BDEYkqA0Pzh07MH44eUjfxovpulbOZhMe2+4+W
         eHFDUyI5rx8BUickB5XUiybiMTaf234QGgrJIGIzEnf5bH/IwYljnb8s4IH1rGV8+IGc
         tLQY8PCR9UtYmlPQbkJom9K31iEXX9v+kjSexdDZhWjyyZBPa7nbjWCbUBwcvudQ9tIm
         VwNNX5KcJCGNJ4YlxdrzGrNZA8REBooB3p/yUsD7OsHyzmquL1QLH2LpD8fcunOOi/9g
         Uk+t6biZaZoBv/QuJHXDrN+uqUBxMRwIcKlM0i55HHKh94IAFOrAOl9QdponiUIGoYY+
         gtZA==
X-Forwarded-Encrypted: i=1; AJvYcCWpDQLUt7+cy720Q472Lc8TmbsvxWCb/pQu+ZSqF4HfEVSvyRfbn5opIJilTwy98LZdtQXLr3b0ZVK0Iy2R5CfuC654RlT7yjL8VC5d+w==
X-Gm-Message-State: AOJu0YwHicXN+6pMtdFSOJyysfqzgGKkAqGWtPFbpFAwammWQZiGtyOs
	5SS+L3laAeDTUvV/dMAAbphVqnvMjXJMDl0EVKguEXsIKIbcfEfP7pau1JahIlk=
X-Google-Smtp-Source: AGHT+IE6CE7xpIX+0IQwttj20HEBnFz7Lu+SN0XSZ6PShDUihi0cxPxFHl+I4G8A5GSb+1RuP+rBJw==
X-Received: by 2002:a2e:910d:0:b0:2ee:866c:bfce with SMTP id 38308e7fff4ca-2ee866cc235mr8095881fa.35.1720003672541;
        Wed, 03 Jul 2024 03:47:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee516803c4sm19527651fa.93.2024.07.03.03.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:47:51 -0700 (PDT)
Date: Wed, 3 Jul 2024 13:47:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, vireshk@kernel.org, 
	nm@ti.com, sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, angelogioacchino.delregno@collabora.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, mturquette@baylibre.com, ilia.lin@kernel.org, rafael@kernel.org, 
	ulf.hansson@linaro.org, quic_sibis@quicinc.com, quic_rjendra@quicinc.com, 
	quic_rohiagar@quicinc.com, abel.vesa@linaro.org, otto.pflueger@abscue.de, 
	danila@jiaxyga.com, quic_ipkumar@quicinc.com, luca@z3ntu.xyz, 
	stephan.gerhold@kernkonzept.com, nks@flawful.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 02/10] cpufreq: qcom-nvmem: Add support for IPQ9574
Message-ID: <a3uw7f4rxpiakofjeqrqqaopvuzfwhdtiexigfoqyj233qmpbc@dlhlaj5namff>
References: <20240703091651.2820236-1-quic_varada@quicinc.com>
 <20240703091651.2820236-3-quic_varada@quicinc.com>
 <20240703101944.tiyaweflcs6nkx4p@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703101944.tiyaweflcs6nkx4p@vireshk-i7>

On Wed, Jul 03, 2024 at 03:49:44PM GMT, Viresh Kumar wrote:
> On 03-07-24, 14:46, Varadarajan Narayanan wrote:
> > Add qcom_cpufreq_match_data for IPQ9574. This is used for tying
> > up the cpu@N nodes with the power domains. match_data_kryo is not
> > used since it doesn't set genpd_names. If genpd_names is not set,
> > 'cat /sys/kernel/debug/qcom_cpr3/thread0' causes cpr3_debug_info_show()
> > to crash while trying to read thread->corner->last_uV as
> > thread->corner is NULL.
> > 
> > 	Call trace:
> > 		cpr3_debug_info_show
> > 		seq_read_iter
> > 		seq_read
> > 
> > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > ---
> > v4: Update commit log to include stack trace
> >     Introduce qcom_cpufreq_match_data for IPQ9574
> 
> Can I apply this without other changes ?

It will break CPUfreq support on IPQ9574. So this patch should go last.

-- 
With best wishes
Dmitry

