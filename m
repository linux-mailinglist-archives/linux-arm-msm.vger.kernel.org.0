Return-Path: <linux-arm-msm+bounces-16952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6627389E215
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 20:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 853B31C21DFA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 18:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D923C156892;
	Tue,  9 Apr 2024 18:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lIK/QBsk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D9A156654
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 18:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712685889; cv=none; b=bgG6At2qOqx45UaY6Mx88EtvZALi63RwBiGDL1atsTH8N2Zru1jcdi9k+1yMvj4UJKlIX3Ti7uFjUsOxxMfgC6lt3lqgZi7D34zaTDRK4trDCMExrqtaKr6hTn1LTfSgCRqNIM5PXMxV8y6dDGllpqUMOInPtvl50O+ORI7n69w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712685889; c=relaxed/simple;
	bh=sEg91M0chOfJoTJVgoQ99WIic1YAWUXIb7Gv6htphyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4wb+ahJElHyshjQf9ApSi1NCQT29oDDOmjEECYZtNB4w57dAAwGB17J+ZfqwMpiDsLzKSXCbUSqB9dfazC5qxEqMcy/0unT1j/7gDJg/Ip0V0ecwsSlt62cBi0TVz2Od5uDjAcmEFmir/VODQms3o/iiffm7BM4Q9xn6X2uIC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lIK/QBsk; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-516dbc36918so4297699e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 11:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712685886; x=1713290686; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mt7HVPjAilY3mwr17H22AEx0sDoVw4kMEURX0lXTtic=;
        b=lIK/QBskQ0U/mssZE5sPferBAoVJ3IRRGedK4xqm65E6gbNWfftcnJoemQaLzM+zLe
         ETULRTFFVkB6NLfjgm9HABqZWFnX2Nv5j3BslK16hQUyid7nC4NmHwHP46tpLdis/N9n
         t8HSKziYIMtafIivmWSrUSHypzgr+I0Fc9FtAYeaxPgYSRaiTBkMLqaCy64R9sDuCjja
         ak/xtmukTDFKGalOe++dHlRrkw1NYRwiNS2c9mDAkspVj1idUvc7jLGwg5+MlRttt+Mg
         a8VsQ/fkI56CAy2MrKLjqIqpFLiSHPJmrkHGL7f4AcbHU82Aq4tdPzcxhxKR3gt8E99u
         OZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712685886; x=1713290686;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mt7HVPjAilY3mwr17H22AEx0sDoVw4kMEURX0lXTtic=;
        b=nvRTHdd6WrfLW9QjSJ/LpTrNOBBojNz9grq/tvO5gxNhYTLqRBXpzm2jdT5yr7Uok0
         CfqJDgZbmb7b6YGMokd23szpJdjJ8JQIl3DdHbvS+t4uuQFYGz/m6BCwCqYfdGUSATRg
         6DBd/hJCnH9WZB4kNy/Qf34DhBFbGpP+wVlBIkbTtdvRHj0u+rq8hYpqRlz/cjLh+AdR
         TvxroVmYNSgAGQLc/TYbIdrSJtkgc59y5eup7wHghtgNVEeugWLBRKx8Q+XaU/gMsjLn
         LCX+e25RHsK3AZcmLPU1mtxPH+5wQzMi9J9qqDdTZ/RGO4q2gWSqlsEtZPGdbdDCPqgL
         kg7A==
X-Forwarded-Encrypted: i=1; AJvYcCWKt7mCXRSicNz7SkcnQb4Mno3vBcM4ID9X2PM17WNhqWJDLJF8sRxr7VehZAyo4aFWQB5PHc80JfvFtFshSwvbAeNdFZ5x6uT9LYGYvA==
X-Gm-Message-State: AOJu0YxTDOKk9wV16GufMc+2GF7KFknqKwrHRQRaveSfu2cQfwrenzcQ
	Z1gdTLFYKvN6QeCLo7JgvsNkmdJXOOZbTEMzV5JmobOqJyyYP4NGL6KVVoclZwA=
X-Google-Smtp-Source: AGHT+IGdK7leJ3QXhD6uZ/35F5XaLJqlEevFkNwPNitSZjtNpi/nk0armGKfZL2bzGGgnmj2Q9OGzg==
X-Received: by 2002:a05:6512:455:b0:517:5f99:5a9f with SMTP id y21-20020a056512045500b005175f995a9fmr106766lfk.29.1712685885930;
        Tue, 09 Apr 2024 11:04:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
        by smtp.gmail.com with ESMTPSA id w20-20020a05651234d400b00516cdd2183asm1619918lfr.15.2024.04.09.11.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 11:04:45 -0700 (PDT)
Date: Tue, 9 Apr 2024 21:04:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/6] drm/msm/adreno: Allow specifying default speedbin
 value
Message-ID: <quil2y6tbilihgont2xekay4joxgnsanu3khgo77omtwkolslp@ozuaajpv5uon>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-3-ce2b864251b1@linaro.org>
 <pncr7ecf4eir36skul3iwt2nf5bpuwd5zjfzzfwwnxjwe4hoes@6z2xe54crijp>
 <d8a2ef87-f29e-4bdb-a9b8-591b8bd5d2b2@linaro.org>
 <tkcbl2iwcy3feoggbk737gx32qsxe5p4ad6lfrujy2pazccrhm@kif3guuzay6h>
 <CAF6AEGsg2xCCC27t_Gqu=MMQ6tckVw=Zj90p4x7EuOm+VKA=ig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsg2xCCC27t_Gqu=MMQ6tckVw=Zj90p4x7EuOm+VKA=ig@mail.gmail.com>

On Tue, Apr 09, 2024 at 10:12:00AM -0700, Rob Clark wrote:
> On Tue, Apr 9, 2024 at 8:23 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Tue, Apr 09, 2024 at 05:12:46PM +0200, Konrad Dybcio wrote:
> > >
> > >
> > > On 4/6/24 04:56, Dmitry Baryshkov wrote:
> > > > On Fri, Apr 05, 2024 at 10:41:31AM +0200, Konrad Dybcio wrote:
> > > > > From: Neil Armstrong <neil.armstrong@linaro.org>
> > > > >
> > > > > Usually, speedbin 0 is the "super SKU", a.k.a the one which can clock
> > > > > the highest. Falling back to it when things go wrong is largely
> > > > > suboptimal, as more often than not, the top frequencies are not
> > > > > supposed to work on other bins.
> > > >
> > > > Isn't it better to just return an error here instead of trying to guess
> > > > which speedbin to use?
> > >
> > > Not sure. I'd rather better compatibility for e.g. booting up a new
> > > laptop with just dt.
> >
> > New speedbin can have lower max speed, so by attempting to run it at
> > higher freq you might be breaking it.
> 
> Usually there are some OPPs in common to all speedbins, so picking a
> freq from that set would seem like the safe thing to do

Well, the issue is about an uknown speed bin. So in theory we know
nothing about the set of speeds itsupports. My point is that we should
simplfy fail in such case.

> 
> BR,
> -R
> 
> >
> > >
> > > >
> > > > If that's not the case, I think the commit should be expanded with
> > > > actually setting default_speedbin for the existing GPUs.
> > >
> > > I think that should be addressed, although separately.
> >
> > I'd prefer to have it as a part of this patch, but I'd not NAK it just
> > for this reason.
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

