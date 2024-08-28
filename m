Return-Path: <linux-arm-msm+bounces-29836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 893D29631C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 22:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11F9EB234D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 20:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EA41ABED1;
	Wed, 28 Aug 2024 20:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwXCPs41"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409B31AAE1F;
	Wed, 28 Aug 2024 20:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724876947; cv=none; b=LBkXLB90EnGTIVPgP1kYGrIPEbKNbC0tUA4KQ28B8LHxAQDr8AUiqKY0esuZY1OKU+nxNvR4UeU7iXcsoORsvVitUfM/8G//CaQT06q/uKfHm+FFho4HIx8/FLhGRZ4TeYgGYAEU0XXU1SR8f2yY6YsV3GYm//b7k+P8Q7nRW3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724876947; c=relaxed/simple;
	bh=iLT3HLiaZTaApfeCveJau/Xga6z/sL+9vrOx+2Avpkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNYKD3hfegAyiUZRTvbQi9bLqpZIMIJGjUdIdMgeoJbc4pEHbRWcGjp5EMkuSuyeLcq4v/mLR7yAiQwT0LhGj/wueXY1dfpPDjuXrPgs+ur9i1peVNlUlDGxCxWpzBJzlWeKMhGNsf5Vlxzt6gRd6V9Swb9/i3S/oi2LNZjM6kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwXCPs41; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-201e64607a5so51543185ad.2;
        Wed, 28 Aug 2024 13:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724876945; x=1725481745; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3g1vhvDS9inKeZPUTNsfnrIAZ07OmkCPCGP83TqX5ko=;
        b=bwXCPs41/14vEYN7xdqqQAAhXw/W6Xnxp1cS5eoZUE5naeMlR/zB+IXFMO1vKRciPM
         yORcZWwkN6obuoSeH60hhYMhLmJPK+2jYjrV57TYS6q7xEbDale5LEL0neeCwhAVHMZ+
         sID+eD8//Ty16KfT6mg88FczOv4J6Ez+HIorabH6TYVd0ecxkaFfw3nSd3/RR/2GgWAG
         cTKR7hkDqEPOFXY7v5SKTJl1eYmKDvFVjJ7D6ASgWCkeQnAZY3YQjinDBUfWP+Uc4O6Q
         sJyJNbDcH4I3m8mOcbapyqRmN3PMP8OcXUL5bxPmCTGDtTz5B3O2/5U+g9QYGPHsJ9X0
         dPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724876945; x=1725481745;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3g1vhvDS9inKeZPUTNsfnrIAZ07OmkCPCGP83TqX5ko=;
        b=MaaCax8Bckb77hr6m7W6vQ1MiFZHMsKnl6tpdSrv0p+Rt7Zr0OEJF2uPSbMn4vLjIw
         Sdra0AzXfpnGNJCCaSvwvvUZ4PRmlhHL7zz3ccf8o8yBrQhOaTO/0gPtmxA8aHTVqToe
         A+bBSyx6ePiSaLm3iO1dgLtal6sgU9Sfe0zxqIXtrOBDgTIB2lucSCVmd4dElOVtFqGD
         wLvi6802A3K/FSjoezX1AHXkJPHY91irTXo+N4rYtuQKw5yWnj5+Jm3+oAyiPqsmPKek
         p0QCciciByjkCoYjlX2feIBzMGb5NaeGJomU5O0+lq7NCD9Sj1VOFlX0/nXrea2XR4VD
         XhhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuPBVVJ+Yuto33waTvGmvyex3hzeOKXuyJeS242bpBWCDiaWrbyGXXl3pJz+KkvHyt2poxAc+Kmjvs4wfi@vger.kernel.org
X-Gm-Message-State: AOJu0YyrcM8csXc1/3wlwCq3U3ezT7YX9A0HJxYSA2KMuw+IpeSEWD3p
	B++m5fAfLyQlM2eJmSBk9HX0RGuWqPdM5S7b6VNjN84xExtZqd4M
X-Google-Smtp-Source: AGHT+IEhJhKoo/zZiZhOSPbnmp/7d15TtSr38q5FFISFGlNoz6vHs5m5vUH4yQE+ESHrCir56t0h8Q==
X-Received: by 2002:a17:903:1c6:b0:202:3432:230c with SMTP id d9443c01a7336-2050c229917mr7946235ad.18.1724876945198;
        Wed, 28 Aug 2024 13:29:05 -0700 (PDT)
Received: from eaf ([2800:40:39:2b6:f705:4703:24a7:564])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385bdca67sm102369735ad.251.2024.08.28.13.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 13:29:04 -0700 (PDT)
Date: Wed, 28 Aug 2024 17:28:59 -0300
From: Ernesto =?utf-8?Q?A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>
To: Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-msm@vger.kernel.org,
	Om Prakash Singh <quic_omprsing@quicinc.com>
Subject: Re: qcom-rng is broken for acpi
Message-ID: <20240828202859.GA27784@eaf>
References: <20240828184019.GA21181@eaf>
 <a8914563-d158-4141-b022-340081062440@quicinc.com>
 <20240828201313.GA26138@eaf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240828201313.GA26138@eaf>

On Wed, Aug 28, 2024 at 05:13:13PM -0300, Ernesto A. Fernández wrote:
> On Wed, Aug 28, 2024 at 12:03:57PM -0700, Trilok Soni wrote:
> > On 8/28/2024 11:40 AM, Ernesto A. Fernández wrote:
> > > Hi, I have a bug to report.
> > > 
> > > I'm getting a null pointer dereference inside qcom_rng_probe() when this
> > > driver gets loaded. The problem comes from here:
> > > 
> > >   rng->of_data = (struct qcom_rng_of_data *)of_device_get_match_data(&pdev->dev);
> > > 
> > > because of_device_get_match_data() will just return null for acpi. It seems
> > > that acpi was left behind by the changes in commit f29cd5bb64c2 ("crypto:
> > > qcom-rng - Add hw_random interface support").
> > 
> > Which Qualcomm platform you are testing w/ the ACPI? Most of our platforms
> > uses the devicetree. 
> 
> Amberwing.

I can send you a patch if that helps, I just figured you would prefer to fix
this yourselves.

