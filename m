Return-Path: <linux-arm-msm+bounces-39729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 605359DF167
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 16:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85190162320
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 15:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CAF199E84;
	Sat, 30 Nov 2024 15:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LL+0xmBn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9434087C
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 15:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732979365; cv=none; b=PJ/sXvXsVtP4wfGSVQNLtJn+mJMAEkTNaR2viAlnHEMstaGRAueda4J5lgxtW2UhIwEysfq9u7XkI5wM19cda3MxnJe6cw/qxnU7OlAizK7HrqUaIOrw6IsNjCqu7f9hnQNj/qmQLH0wKVF2swNnU/ruaFhsm1YA6yAlTYa9CmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732979365; c=relaxed/simple;
	bh=HZJ8t3aF7SHUJKR540Tx8JROqH//rRntp2UopgZrFoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PB70Bv69XQrIAQ1cZIgv87JyyNzMFZDRtXnOfDamZgqb3zzMbAheJgU1eYSLnPO7QXGWzUKHyq5TqwODR5NpnfJXXHN6VFedRXYKFglUXsKcR7kSKmt/Y0z1TD3qOzH7YqTEiHA99pd87xZzQF1NWh7Hil8F0vjBIvRk0KADPuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LL+0xmBn; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53de035ea13so2764817e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 07:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732979361; x=1733584161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wj1QhSNb2C+ACtsXVjTj7NlazdrJQLTkuUK+2z8IFC0=;
        b=LL+0xmBnEyWheb7tHJqB0zZI/wi0HBFMFlPXfKMJJUxQNNxtdampbXqZmA6B9EhuJ4
         UXaKVqnciIEbtEEDbS4dU4DfKmZnF5nL1D8N9AZ+ewXA8pWdh8eyb7iMRbqXpgZk8EjU
         ODlSreu4GAd4349bRmiNEEDxxzPszismSMKN7w1Jo2RQy4tOkAabRxio5rP+QwMfNpyM
         NyehmknMUyB38sE1zBa/3SEN3kgPWaq1FbQd5oaUknDL8BS+UV3OkaC4+mtJ+mlRWRVM
         8/WMbdRgPgNaZ9CAE0K3M8YU2csywM6R8dHZHylk+BPwld4ExAm9tg1M+Tju+ptBZCnn
         iP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732979361; x=1733584161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wj1QhSNb2C+ACtsXVjTj7NlazdrJQLTkuUK+2z8IFC0=;
        b=IeKWkZOgdHgLpTFctNqQapL6Ifkiv28MsNChRcASAgxiQU4Uzg5wGoKcCX5et5O+Qb
         qW7VrlVbEjkTSaLr4OhFVn/gGOl0HqF5K8iTO08+Qp8tyXhCPtvrMsJ+GPH0vFUO4+aa
         NwSIxMZWfMaXFxswg3IEohNlC9e4Mm19xlPCsQPGYXveyEytc3qEKi3aE3LyfSLS+xu+
         2IHvYPBYuXFiPIjNs3XMdP0TB7h+cOIobtbeFAC+TIVUIXEEJ7fgsujUW1eNhGQlfrl/
         wmotKSqrd66RDcLbtd2Dk847K2sX7v1EDqOCYXZVrIj810ZeKs0pHKLBBSmE/w66rdW4
         9qAA==
X-Forwarded-Encrypted: i=1; AJvYcCWaKxf3a/gkfCoftFtU6WRtD5tZtF9DsQVTFHDrU6SQ03A/iP0RZuQ0dNywp7sqSU+3P8++NgAe7xI7fDwl@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq+4hnSxQIvvZPvuIwBYIGl4UQ2niQCSqRxMScVOMhHK03FRKq
	vJn7NtvXQk86V9TWCd9NbI4DQscw4MEHef1dXzMJ9PQB0aESY9buXHebnzJ6mVo=
X-Gm-Gg: ASbGnct8CtVL0+syCo10tuDNkqyzRpR+2mVRfTMg0FeG0aJyXtE2k0HX5GKYYvoGzJh
	fpkuCq/u9GA0mWpTfOxeJCBlQWirrIwY0Tvz3BzWNG6XvVbDNl8eHmLIZs55hHrvpz9DoglLYq3
	MRyTa3Kyw3MPaWw00Jvj5vskp8s5zVVblgwsZspIb1+hFomCrEu7K1o5VYClS1M8IY4h1EKzZnz
	WweLjitlC8JVpEiBELuh0mZmWUQEJjHlccwb6wlAefLC5Zh8pE2dM2GQ7Guf+Z8c+XtBfl2y9rq
	Xg99tjc87egYivDGsFSj9y3bi8Gu0g==
X-Google-Smtp-Source: AGHT+IHcfgxddG7i63v/B5GBl0TYGCbyQ62/KWnF3A3BXT/l7q5eTBHmEZkjzlbreyApwsMppZBgwg==
X-Received: by 2002:a05:6512:400f:b0:53d:ed75:6f0 with SMTP id 2adb3069b0e04-53df0106bdcmr10447116e87.35.1732979359929;
        Sat, 30 Nov 2024 07:09:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649655csm788770e87.196.2024.11.30.07.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 07:09:18 -0800 (PST)
Date: Sat, 30 Nov 2024 17:09:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>, 
	Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Odelu Kukatla <quic_okukatla@quicinc.com>, Mike Tipton <quic_mdtipton@quicinc.com>, 
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V6 1/4] interconnect: qcom: Add multidev EPSS L3 support
Message-ID: <5egskepgsr52ulnbw7jhvazfjayg5ge5vhg6pi7mllyxx2vwqw@a2ojvabzd36o>
References: <20241125174511.45-1-quic_rlaggysh@quicinc.com>
 <20241125174511.45-2-quic_rlaggysh@quicinc.com>
 <2b95cc25-a842-4edd-a5f3-2351038d264e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b95cc25-a842-4edd-a5f3-2351038d264e@oss.qualcomm.com>

On Sat, Nov 30, 2024 at 01:49:56PM +0100, Konrad Dybcio wrote:
> On 25.11.2024 6:45 PM, Raviteja Laggyshetty wrote:
> > EPSS on SA8775P has two instances which requires creation of two device
> > nodes with different compatible and device data because of unique
> > icc node id and name limitation in interconnect framework.
> > Add multidevice support to osm-l3 code to get unique node id from IDA
> > and node name is made unique by appending node address.
> > 
> > Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> > ---
> 
> [...]
> 
> > +	ret = of_property_read_reg(pdev->dev.of_node, 0, &addr, NULL);
> > +	if (ret)
> > +		return ret;
> > +
> >  	qp->base = devm_platform_ioremap_resource(pdev, 0);
> >  	if (IS_ERR(qp->base))
> >  		return PTR_ERR(qp->base);
> > @@ -242,8 +262,13 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
> >  
> >  	icc_provider_init(provider);
> >  
> > +	/* Allocate unique id for qnodes */
> > +	for (i = 0; i < num_nodes; i++)
> > +		qnodes[i]->id = ida_alloc_min(&osm_l3_id, OSM_L3_NODE_ID_START, GFP_KERNEL);
> 
> As I've said in my previous emails, this is a framework-level problem.
> 
> Up until now we've simply silently ignored the possibility of an
> interconnect provider having more than one instance, as conveniently
> most previous SoCs had a bunch of distinct bus masters.
> 
> Currently, debugfs-client.c relies on the node names being unique.
> Keeping them as such is also useful for having a sane sysfs/debugfs
> interface. But it's not always feasible, and a hierarchical approach
> (like in pmdomain) may be a better fit.
> 
> Then, node->id is used for creating links, and we unfortunately cannot
> assume that both src and dst are within the same provider.
> I'm not a fan of these IDs being hardcoded, but there are some drivers
> that rely on that, which itself is also a bit unfortunate..
> 
> 
> If Mike (who introduced debugfs-client and is probably the main user)
> doesn't object to a small ABI break (which is "fine" with a debugfs
> driver that requires editing the source code to be compiled), we could
> add a property within icc_provider like `bool dynamic_ids` and have an
> ICC-global IDA that would take care of any conflicts.

Frankly speaking, I think this just delays the inevitable. We have been
there with GPIOs and with some other suppliers. In my opinion the ICC
subsystem needs to be refactored in order to support linking based on
the supplier (fwnode?) + offset_id, but that's a huuuge rework.

> Provider drivers whose consumers don't already rely on programmatical
> use of hardcoded IDs *and* don't have cross-provider links could then
> enable that flag and have the node IDs and names set like you did in
> this patch. This also sounds very useful for icc-clk.

-- 
With best wishes
Dmitry

