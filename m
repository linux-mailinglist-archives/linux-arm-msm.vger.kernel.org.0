Return-Path: <linux-arm-msm+bounces-16268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F00E0896EBC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 14:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 835F8B256CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 12:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2CC146585;
	Wed,  3 Apr 2024 12:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ecKGVZdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE6F142E75
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 12:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712146338; cv=none; b=Mt+0C1h3eza8KY1HvXmLlMy5GcpyvB9jaHKTydIMa3U8zXgrpLSk3gQ6DtFK0lsJ5QKlBrDeXrU/ORpjPhWUh4SHXdoAOcucvhlOmkzrdrumGvvaedHGtoaR6gaO7ttB+5eZShS4DTakyZ3KsGTYlZwtNB808MjY/qkkWu38LTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712146338; c=relaxed/simple;
	bh=brj4KkxiuzB/cTaKYABW0xgl0MAd+mDFIIil3DRUwDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aa7uWy9Aw9tbcPpEAas4Ea8S7R7OqaT+TEnPon45zhLOgPw1hywkYNZw4O/5tbpy6+X+yvSDo+uSHUYsH6uwEEX9f9+OtjWLRTfIkadq+qp1QRLjV/TK56IqgllP8uOB7IcSmw8cG3XRLbZwSmF2H8axYdl+XvzuuWKCC2aOAx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ecKGVZdU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e0d82c529fso53653455ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 05:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712146336; x=1712751136; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BruioLBkFU/4Gr8BIJ48KpNZhiGvLxDKNkifr5Fva6A=;
        b=ecKGVZdU8bhNPOpAvLxziCRXwbUZUX8cMZsuid5A/T/ooIhW/535QZ/1NlopqlyS9C
         dCx4gdliNUeIHps69L+yl7pi+6fMraB0ek0+OmtX5Otla7doi6uEyKpBTNSTi63f5dA8
         docrsXAbau2BcyALZwP1Bkj6DExFqjBZ06elIc4qLhnBO/iUXGe0MpfPFdJndxKsaRiQ
         AZQYeFBp4BJMaAQFx1WUvW0Vzhjym5bZ26pxkBZmPBzdUjPzQimi+Uoq0X0HOLTX2ehr
         qDui1+k6p5UTfYpQSYT0YvH+xX91jIqVfG4t47NqubEqn8XK6PFv6yhFnDGj42QoGCHb
         lYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712146336; x=1712751136;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BruioLBkFU/4Gr8BIJ48KpNZhiGvLxDKNkifr5Fva6A=;
        b=qUwVfUTiLh6pn562dcm37Ebmo6Cuw1TCnIlQKLzsmwuTDaWxk93S/5x2zvp1csBKz6
         0UP//vF1D8O1Nws696xHkkP3g/12gT5/+0mgNjb7WHrBYf5ujiCVQzgciQ42/hkYz1vd
         n8f0x9UrkznhA0pGi/x+1kiJc5lm7dXz+9CavXyT6yOA8LJ1eFSAtIgY0T6Svj/QCJSs
         ZsL8aNynZvvczAx46YpEmKCaFbl1KxQAv66gb0VsPAFNneZCvMcp/X1LUIWR0DXT0a8D
         /4Q/7jKVX9qWHFr9B4UzvPg2iXvvAH2eTDgm1st/bC/GQYhscnTzAtKW9migRjx815uI
         K+aw==
X-Forwarded-Encrypted: i=1; AJvYcCX3aJHOjPAj+yP6I79N/KztwXJc/SzW97SLg26PG3B2zL7YiOxk+MLgtnJctbV9nZR+6kw+QC/8onjejhmxT44A7IlwcyL1Hu6xcUXJLg==
X-Gm-Message-State: AOJu0Yz+mWwxJzNdnGSiKGVVVHAkaVz4bt2eNMXoT2YNHddrEf2cuNcX
	pgr7C0TfUJZwMz3hhRPukyOc24HLsxc0yHcegAtrd4tVKEZ50OBj9oV9F+aqTw==
X-Google-Smtp-Source: AGHT+IG9NG4VxPu4A8bz2c/Sxzuq1eBAlbG1/HgvyTLPbTBK7p4H9R0/kt20ykZuifHv/l0Kuczj7A==
X-Received: by 2002:a17:902:784d:b0:1e2:7aaf:65bc with SMTP id e13-20020a170902784d00b001e27aaf65bcmr3297593pln.34.1712146335487;
        Wed, 03 Apr 2024 05:12:15 -0700 (PDT)
Received: from thinkpad ([103.28.246.48])
        by smtp.gmail.com with ESMTPSA id j8-20020a170902da8800b001e205884ac6sm13072185plx.20.2024.04.03.05.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 05:12:15 -0700 (PDT)
Date: Wed, 3 Apr 2024 17:42:10 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH] scsi: ufs: qcom: Add missing interconnect bandwidth
 values for Gear 5
Message-ID: <20240403121210.GJ25309@thinkpad>
References: <20240401-ufs-icc-fix-v1-1-3bac41bdfa7a@linaro.org>
 <e2206445-d560-43ad-8fb1-f0b4967493f2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2206445-d560-43ad-8fb1-f0b4967493f2@linaro.org>

On Tue, Apr 02, 2024 at 04:48:40PM +0200, Konrad Dybcio wrote:
> On 1.04.2024 5:09 PM, Manivannan Sadhasivam wrote:
> > These entries are necessary to scale the interconnect bandwidth while
> > operating in Gear 5.
> > 
> > Cc: Amit Pundir <amit.pundir@linaro.org>
> > Fixes: 03ce80a1bb86 ("scsi: ufs: qcom: Add support for scaling interconnects")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> 
> Skimming through the code, could ufs_qcom_get_bw_table use a
> WARN_ON_ONCE(nullcheck)?
> 
> FWIW, this change looks sane (without checking the numbers)
> 

This really makes sense. Will add a patch in v2.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

