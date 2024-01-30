Return-Path: <linux-arm-msm+bounces-8975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD89841E74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 09:54:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43DE4B2E06C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 08:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FD543ABC;
	Tue, 30 Jan 2024 08:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yFBVUY5M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779BC59153
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 08:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706604498; cv=none; b=lurxosocq1Rp6Nh6Pn91nqbvSwSdpvKVny/7/nAfhEHxDmbE3LvADdWbOC7UpkdjiYgMAkZYQ2LrDWFQ6Wiuqm34l2YLLJNixIEpRJTm/YQ7kFwBn7cbYEhp0DEGGfLVZBN9nIr4rb2TGlFb0yuE8ABjpwHykJoHpQrGodcfIyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706604498; c=relaxed/simple;
	bh=OTwo8h1r/HNa/CiLlIhtm61CfaQXTQtYUzvR2httRas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqdTx7jVDYy5OjlqELqKtOLWOi44yUOe4opuaMwOR1A6UImIgvaSJCc4zwQe1kaCMUHwY0nYNWsynsRiJCJoxkhpIO81DRcZMBi9ITEA9UJ8FLlsfepLGRyYLFeHte2CxjyQdgP0+h8w/1YNYfdKNZhDLgIxzChgohVlR1vm+r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yFBVUY5M; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3be78c26850so817385b6e.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 00:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706604495; x=1707209295; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZYqm9+PdfliMcUPhu/XhOrYgIKmn3e//lFHUo82Q1J0=;
        b=yFBVUY5M5PJznZXXUoI9QF0l1pvmA01vHxgzQE9fmP34C7v4Yt//W2LXStTS2O23sM
         W6Lrtw6l/Czds4I/4hJv7k2ScEUNXQMKXbNzGWR5tB/uYOLoeqesWQWSk8girbrmy3LV
         LXtDVa1UCM3GOw5KCpyKXilzVO/B3chZA9okugeMrbWXYKBDiiG5oCtYBB+2ZjxqNVQJ
         uqYr7aprpZ+MCJVY2Ua++WiOTroR3B5G7IRbbag19uE0NoVFqEMKWes6oQ+YTL4jqn/u
         3+nUh+DBaw5KxoCvNNIZpDkD8EmhIbyUUqmzhk1fycfwHW2YThQadxVKnZRTqsQfLDwz
         JK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706604495; x=1707209295;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYqm9+PdfliMcUPhu/XhOrYgIKmn3e//lFHUo82Q1J0=;
        b=bWzVSpGWHoLcEI7kG5bbwLoBL5Gc3cAeBNCbsOQtaIGVydD9QO2ZIw2zEBHVnbAUJQ
         gOpWR6FJKo+xbzdQ95VpUPkMXnVgsY7me1nxlKQhFcPvlVzEY+hHEhRZZryeoqjM71gh
         r1Dgo9r1r6GmsPQokhcwcjOuh5jD5azEG8HpaGAUXKxgsmgtHlLijx69KVWesdAJWQJE
         utBUrLhyNSEAtgTTTgHy1PpYwUfWJkJ+Hufpo9HTHNxWWashwpmqQyJ6rmv2rCmD7bHC
         kBsUAk7pclKNP9WxGH9K/rpccrbLQ8gJ9O9oNwHfPMEIFVpEaghuWiEP970t/x6sqEgh
         8zHw==
X-Gm-Message-State: AOJu0YyfP4A0MIaciHlDQHbDOLs/hCRDIJK9tuuziqgdWH4U3Q/y129k
	ozQ7YC01nv1gj+XIv4IfgfX0gz8zCuedIk0IL9m5CN3LVu1pdCp2CBWCsxaj/w==
X-Google-Smtp-Source: AGHT+IH71sIX/2pyKvffdPLMRveRZzkZyOEOtO+a5eNkPZVGWZQUlduVZZ+zglJ0uCa6g/1z9Tuwng==
X-Received: by 2002:a05:6808:1144:b0:3bd:c710:760 with SMTP id u4-20020a056808114400b003bdc7100760mr6316837oiu.51.1706604495567;
        Tue, 30 Jan 2024 00:48:15 -0800 (PST)
Received: from thinkpad ([117.202.188.6])
        by smtp.gmail.com with ESMTPSA id e7-20020aa79807000000b006da96503d9fsm7207700pfl.109.2024.01.30.00.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 00:48:15 -0800 (PST)
Date: Tue, 30 Jan 2024 14:18:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Mrinmay Sarkar <quic_msarkar@quicinc.com>, vkoul@kernel.org,
	jingoohan1@gmail.com, conor+dt@kernel.org, konrad.dybcio@linaro.org,
	robh+dt@kernel.org, quic_shazhuss@quicinc.com,
	quic_nitegupt@quicinc.com, quic_ramkri@quicinc.com,
	quic_nayiluri@quicinc.com, quic_krichai@quicinc.com,
	quic_vbadigan@quicinc.com, quic_parass@quicinc.com,
	quic_schintav@quicinc.com, quic_shijjose@quicinc.com,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v1 2/6] dmaengine: dw-edma: Introduce helpers for getting
 the eDMA/HDMA max channel count
Message-ID: <20240130084803.GA83288@thinkpad>
References: <1705669223-5655-1-git-send-email-quic_msarkar@quicinc.com>
 <1705669223-5655-3-git-send-email-quic_msarkar@quicinc.com>
 <CAA8EJprWHiShFpZdb+pWsCoxNvNEoP+3By2x4u8rq+ek37hJXw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJprWHiShFpZdb+pWsCoxNvNEoP+3By2x4u8rq+ek37hJXw@mail.gmail.com>

On Fri, Jan 19, 2024 at 03:26:56PM +0200, Dmitry Baryshkov wrote:
> On Fri, 19 Jan 2024 at 15:00, Mrinmay Sarkar <quic_msarkar@quicinc.com> wrote:
> >
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >
> > Add common helpers for getting the eDMA/HDMA max channel count.
> >
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> > ---
> >  drivers/dma/dw-edma/dw-edma-core.c           | 18 ++++++++++++++++++
> >  drivers/pci/controller/dwc/pcie-designware.c |  6 +++---
> >  include/linux/dma/edma.h                     | 14 ++++++++++++++
> >  3 files changed, 35 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index 7fe1c19..2bd6e43 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -902,6 +902,24 @@ static int dw_edma_irq_request(struct dw_edma *dw,
> >         return err;
> >  }
> >
> > +static u32 dw_edma_get_max_ch(enum dw_edma_map_format mf, enum dw_edma_dir dir)
> > +{
> > +       if (mf == EDMA_MF_HDMA_NATIVE)
> > +               return HDMA_MAX_NR_CH;
> 
> This will break unless patch 5 is applied.

I believe you are referring to patch 4.

> Please move the
> corresponding definition to this path.
>

Right. But it can be fixed by reordering the patches.

Mrinmay, please move patch 4/6 ahead of this one.

- Mani
 
-- 
மணிவண்ணன் சதாசிவம்

