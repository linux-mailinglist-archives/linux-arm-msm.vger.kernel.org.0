Return-Path: <linux-arm-msm+bounces-29336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CE295C817
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 10:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB3B41F21DBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 08:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113931448E3;
	Fri, 23 Aug 2024 08:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tih7epZ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4989274BF8
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 08:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724401817; cv=none; b=HAXTOWX7zp2WLLUvypOh7GdEk3Vmq4ZDZLAccoY6oa+cJoRfessxfAaZL89fcJRieA+MkxNTSC82FoBJAfLzMStkoN/2vaTxJTjXfEzWuBYec9zeDcdWT5SEXkLSGfTnEI/hBoo51VcHsRnZN3dGfW+yltfRwjrtrtdfb1VqgD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724401817; c=relaxed/simple;
	bh=bqqGn/FT9f2u5+YF1xX/+JxI1FyqgycSOXAqnxCCfzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i21wV0p+MUZHIVfXlSkoaNdDf1+Mu8MQpVBBwadY2j+3+uUt+Uoa/QQTnv9icv5mq+bFS4i/STy/f55ajF/GAB8o+bUregchew+zC+eCJOoiiNSd8+ciZwKweKIO63CbstYkAO13xnofkYAfHYJryUKSiSZQvvzSZWGThrwIfqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tih7epZ4; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7143185edf2so1436563b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 01:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724401814; x=1725006614; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1g5yFnddqJtpT5ZB7dI72xoCG8cY+pVqMM33pT3uyxE=;
        b=Tih7epZ44tqAEYygHvbeielnnWKp6BqwLVbZmz5IDCdPbg5MnVSVqyt9DIPIM3sKXF
         cxOwbpVMR94Wi+iB0STTrIt5IOZk0vtveuEP/eL5JizkCSBWwzknuZCJdDZO5xecNAB1
         mZuTBSwbx1hleQRxOglnKWMtSv0SeIX3DY1rVXzJN49sxd0pyUCYJtEwpvt2ZHjbA+M3
         s0L7UWehzujQAhYIcjvcN8PgZM1H1dQISJyXpLUYL/kHZ4pUc418vqvdsOAw9SZUwDDn
         m8WExYfnm5ZHweN2B4tAjh6A9wMkIgEmspIz2aJVrn6iTe/1SnblR7orP3QnAdBzhs3j
         k4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724401814; x=1725006614;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1g5yFnddqJtpT5ZB7dI72xoCG8cY+pVqMM33pT3uyxE=;
        b=CHISqUyikHOMMijPyeA9iOWMDCqX8wi2C6KC4WkcWJZdCzjoX1QrDPrUxAhX3GVbd0
         CdmpBGxK6OGZtBbMC+GCfgCTHHGA5OQBhHFY5KCjmCB6OFlQzVbZUrYQeSxwav+F/UPV
         FF7TtpViSXQgpzlwdjDU9jtrClWEr9+w/2hGcc7LnVaidXFeBXvaWzdAkWQzY9hT2EAE
         SKyphdyCahT3CCO0+QqkvU+oHv9F+Mqi4kVVpNwx8lvLeyP1HXf2pyfMFw1kUvsUjB0q
         53RTHusCdtAroqhuK/TVCkwX9UOczBEXWomtFymm1V/A/Sb0hioSXv2E1k/CiAXbwYSr
         m0LA==
X-Forwarded-Encrypted: i=1; AJvYcCXFPllH0kQvxhLd9fq4CkRSvPKEEzkX4V3GXcbiFYwzURniZ/llYI3kJ4soEanRnnCLxvYtLvlNQDDtBGC0@vger.kernel.org
X-Gm-Message-State: AOJu0YyBRVl8QfNhfr4t0Yuzl4roWDgE6O353+gkbk8I0+o7FmC4WuS8
	ZvL88xnRIHw2HfZAZNHTY9L3EbYPFGBk8FN9zEWUu1ZjLLB7xmribTX2/jlaQg==
X-Google-Smtp-Source: AGHT+IFQHY7q9Pde3Vur1+ysnnW4dBHdUMSQBiVLGfF9YoHEBmVFtYzNOhvQUkAYxKs9nYASM4Cjdw==
X-Received: by 2002:a05:6a20:d523:b0:1c4:7dbc:d21a with SMTP id adf61e73a8af0-1cc8b520264mr1524117637.32.1724401814409;
        Fri, 23 Aug 2024 01:30:14 -0700 (PDT)
Received: from thinkpad ([120.60.60.148])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eba2353csm5668143a91.26.2024.08.23.01.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 01:30:13 -0700 (PDT)
Date: Fri, 23 Aug 2024 14:00:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	cros-qcom-dts-watchers@chromium.org,
	Jingoo Han <jingoohan1@gmail.com>, andersson@kernel.org,
	quic_vbadigan@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 4/8] PCI: Change the parent to correctly represent
 pcie hierarchy
Message-ID: <20240823083004.rzylgm66yaw3rlyi@thinkpad>
References: <CAMRc=Mcrrhagqykg6eXXkVJ2dYAm5ViLtwL=VKTn8i72UY12Zg@mail.gmail.com>
 <20240822211336.GA349622@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240822211336.GA349622@bhelgaas>

On Thu, Aug 22, 2024 at 04:13:36PM -0500, Bjorn Helgaas wrote:
> On Thu, Aug 22, 2024 at 10:01:04PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Aug 22, 2024 at 9:28 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > >
> > > On Tue, Aug 13, 2024 at 09:15:06PM +0200, Bartosz Golaszewski wrote:
> > > > On Sat, Aug 3, 2024 at 5:23 AM Krishna chaitanya chundru
> > > > <quic_krichai@quicinc.com> wrote:
> > > > >
> > > > > Currently the pwrctl driver is child of pci-pci bridge driver,
> > > > > this will cause issue when suspend resume is introduced in the pwr
> > > > > control driver. If the supply is removed to the endpoint in the
> > > > > power control driver then the config space access by the
> > > > > pci-pci bridge driver can cause issues like Timeouts.
> > > > >
> > > > > For this reason change the parent to controller from pci-pci bridge.
> > > > >
> > > > > Fixes: 4565d2652a37 ("PCI/pwrctl: Add PCI power control core code")
> > > > > Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> > > > > ---
> > > >
> > > > Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > Bjorn,
> > > >
> > > > I think this should go into v6.11 as it does indeed better represent
> > > > the underlying logic.
> > >
> > > Is this patch independent of the rest?  I don't think the whole series
> > > looks like v6.11 material, but if this patch can be applied
> > > independently, *and* we can make a case in the commit log for why it
> > > is v6.11 material, we can do that.
> > >
> > > Right now the commit log doesn't tell me enough to justify a
> > > post-merge window change.
> > 
> > Please, apply this patch independently. FYI I have a WiP branch[1]
> > with a v3 of the fixes series rebased on top of this one. Manivannan
> > and I are working on fixing one last remaining issue and I'll resend
> > it. This should go into v6.11.
> 
> OK.  I just need to be able to justify *why* we need it in v6.11, so I
> can apply it as soon as somebody supplies that kind of text for the
> commit log.  I.e., what is broken without this change?  What bad
> things happen if we defer it to v6.12?
> 

I'm not sure if this is a 6.11 material as this patch is not fixing any crash or
potential breakage in 6.11. This patch changes the hierarchy in such a way that
the suspend/resume could work fine once added in the pwrctl drivers.

At the same time, I'd like to get it merged separately for 6.12 instead of
bundling it in this same series.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

