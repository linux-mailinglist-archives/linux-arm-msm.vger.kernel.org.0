Return-Path: <linux-arm-msm+bounces-46154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B94A1CCA5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 17:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97D36162B09
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 16:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2EB14B080;
	Sun, 26 Jan 2025 16:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pp4B73xx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376A213CF9C
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jan 2025 16:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737909153; cv=none; b=TnFDuaOepEJfCXbAtRXVY6xD5cjRfVd6kjPf3T//Q/CwyTAF4bB6YBC4L4iRlrPle6UskY3xbEIZfHiU0B4A7nn/o8sI4iqOBzEsSNDbfmmJAeMrFLuQKx4Yv/Y7QYTylNUX4dVPnyEIXoSlvowah/JAyg37okHi7DHNIegjsXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737909153; c=relaxed/simple;
	bh=jtSpTmRd14dGeM1nscXI3NZz05G5U5hkjF5piFg2+Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEFByiNkLIIGxS716HMN7SluutDniMpIbyhUTTLLngFI8hvNNjmWV0c3bMZvBXrlP5l30EW+q6MnPXjHLyW0Lfcm5erzuwqPbsgt1faWSPE0GRG1vhTe1ikl/0RiaZa8deGJKtITFntyK9X1+ERDgXjJ476SP+vWf/qFGQfwb/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pp4B73xx; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21634338cfdso85782145ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jan 2025 08:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737909151; x=1738513951; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a2/x7HsME78QH5GItm6A7JG5Awy99g+RmpskMFT3HS4=;
        b=pp4B73xxs4MF19GRKgxUkBCwB68RbWPzIzRlKNNsiwg5ixeM68BgLgxzRgLT4qnHiu
         LqdobHl2ocz5hylmHNnYhtOHGxTxSyrZ1ALltEoyXJA/5GV5cIloVbWFKGl4y0GfqlTl
         Q9rq8ZBjjxRPUltVSwex8JCOFj0N8UaVAjUi/67q2lvKBSsjCjO7Pny5Fr+1LvRz23JS
         OGv/RXmLqBKJCoaTY4J6gCgfPdI3FFcaK700zSsI+ErSUVAEZEy5BrGz3jP9c9ndDWs0
         BI3YG9xTF9Aj50o02tWia71oj82TmFPg9KIwRww1sKqfeXjwKYzZCyGGaBQ9Viv6PaXD
         dddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737909151; x=1738513951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a2/x7HsME78QH5GItm6A7JG5Awy99g+RmpskMFT3HS4=;
        b=pnaeb4Rup/BC2kjkB93tCedYSCPCOuacOth2TfXFNGXgjXtRWfHPRxi2zSLMs3J6vr
         YtmhSx9522zkbikBRSn3CRPfKVgUtQ/v7ombUV2HEPeNY8g4oBwduSpDPrz/mBIkBMbk
         L32ZvyA5a9Z5KaGeOgwLVFALreXNYHCBpLLcy2odMqBWwiVAitG+BpxkbJSncOfznzsl
         BXBa1qzxyYqMT17JfyZgbxcP9IvZkuJvFXR6ftFa+GqojSX4tmy7oQYOUKURuIycR6Gy
         CjgwrPWH035cYPvuHhuS6sdlETLCMkLO76LqDPljKnlyMd866UIko5d794Pywc+Uhp2g
         A+Qg==
X-Forwarded-Encrypted: i=1; AJvYcCW1yTMRkiiTehznswi2LcrXFL0IUco58sNb2/xoCFkcnu24K45pA6cy+GiPMREJ/mbKk+SrAWWuqTdeHhQb@vger.kernel.org
X-Gm-Message-State: AOJu0YwLTL71KrhWEDznzb0W3uUaOqHxLhPLMynBB1U2sla0WKHiNQAs
	yG4Clcj5yQv7lvHlLGQKMP9v9jw7SgvxcvRudDbga3zoNOtac0OmclAjTRsU1Q==
X-Gm-Gg: ASbGncsAX4ZzI02cX8XvjuIWcrzHUotAKqSBh0lsLytrhR8+PsRYd0tpLK3dKlKejDH
	dQfleFSXgX9STFzcXoETHnv787ZgxZ1fJYwLubxCh5PdNYFD6IIG5g0v7wZMwjSh4c6YBoSDjMY
	NvhMrNRSXxxvIDQE6rBOPOL32Y4o2qUUPzrqakWrIdqcajN7BJz7vt9uG+EJg0Q0VaVrYGmTcE6
	vPLMLtjsYUgwRgBgP59UhKovcLDNZcPk6tP2XTVfNJMX/CaCRpW//J9XqgxWgcsipVX+do4sW/f
	37MKabych+UwrA==
X-Google-Smtp-Source: AGHT+IHWZ+glvl+mJSsUGZ6jx+icgq8knmen0W99ZVY+enJ/56I1feVryXG/4cV/Fv3EXPoE5i5z5w==
X-Received: by 2002:a17:902:e747:b0:216:4b1f:499 with SMTP id d9443c01a7336-21c35623dc0mr481233015ad.31.1737909151476;
        Sun, 26 Jan 2025 08:32:31 -0800 (PST)
Received: from thinkpad ([120.60.50.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414cc20sm47994605ad.165.2025.01.26.08.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 08:32:31 -0800 (PST)
Date: Sun, 26 Jan 2025 22:02:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] phy: qcom: qmp-pcie: Add X1P42100 Gen4x4 PHY
Message-ID: <20250126163222.nhcxvr4m2vncwi23@thinkpad>
References: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
 <20250125-topic-x1p4_dts-v1-3-02659a08b044@oss.qualcomm.com>
 <h6zfhxkc4dj2ueaxipha6prbvmv7pnqglghtjs7vkhlc2s7ndi@vhbj4uojlzwd>
 <A64B8332-78F2-4B76-908E-4119E4A54BAE@linaro.org>
 <cy3x35h4id3gegwb23j6rwblx2pecpw7ffjpri5ddqdd35kzrt@bxdmaumb6bbp>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cy3x35h4id3gegwb23j6rwblx2pecpw7ffjpri5ddqdd35kzrt@bxdmaumb6bbp>

On Sun, Jan 26, 2025 at 01:39:05PM +0200, Dmitry Baryshkov wrote:
> On Sun, Jan 26, 2025 at 12:59:52PM +0530, Manivannan Sadhasivam wrote:
> > 
> > 
> > On January 25, 2025 11:00:23 PM GMT+05:30, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > >On Sat, Jan 25, 2025 at 04:31:19AM +0100, Konrad Dybcio wrote:
> > >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > >> 
> > >> Add a new, common configuration for Gen4x4 V6 PHYs without an init
> > >> sequence.
> > >> 
> > >> The bootloader configures the hardware once and the OS retains that
> > >> configuration by using the NOCSR reset line (which doesn't drop
> > >> register state on assert) in place of the "full reset" one.
> > >
> > >I know your opinion, but my 2c would still be for not depending on the
> > >bootloader. I think that was the rule for ages for many possible
> > >reasons.
> > >
> > 
> > But if Linux or other OS can trust the bootloader, then it makes perfect sense to rely on them. Obviously, the question here is that on which platforms this level of trust should be established. And the answer I got was starting from the compute platforms (atleast X1E).
> 
> Is there any way how those values can be lost that we still might want
> to support ? The GDSC going to the OFF state? Some deep sleep state or a
> power collapse? Actual suspend to RAM (instead of current S2Idle)?
> 

As per Konrad's reply to my identical question, PHY register state is supposed
to be maintained by MX domain even during CX PC. This seem to be case on X1E
based platforms (compute).

> > 
> > So let's take it on an experimental basis and see how it goes? If at all any problem arises, we can always resort to in kernel sequences.
> 
> Sounds like a good proposal. Can possibly have a corresponding 'do not
> merge' patch with actual init tables?
> 

I don't find it really required. If the init sequences are really needed, we
know where to find them.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

