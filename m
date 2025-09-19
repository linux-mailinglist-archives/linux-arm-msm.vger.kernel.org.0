Return-Path: <linux-arm-msm+bounces-74141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3424FB88B1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 11:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CD3D6251A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 09:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A892FC029;
	Fri, 19 Sep 2025 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jfOUJ6QX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736C92FC00E
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 09:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275844; cv=none; b=rU9YKnTpAhMzbDpslJzq4kdkZL40jqXFu4q7uQuAa1oxhJI/dHVFAjx5UTfBDqkwtxPPDrRMeYOwZ2HWF0MvecBx79dpP1CUPizsJETdk4OoEzTIBaNWgAEYpER5eckg3bMRX/aX2KIVuMLJefsUtI6kuVQKRdogxv9jSZrl2DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275844; c=relaxed/simple;
	bh=LycB4bibBN0sG1r9icmnH6TMiY0AyiR65Cqg0j3cYEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESfUMv5PCKAC9rHJj+c/TbRiDCywCOaLPXS5hYjHmq6MHrE/Ixly3eok2yslYAVP/2pN0cOO7xeRLDIK7pin5vbwhhaG9lxxy/bOcfPdCCKqJZe0XFCnaOT/cjP/LMJKrLqqKAuupsFFdf/iEVk/dP6hwx+vF5uiPo+PT8RM9wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jfOUJ6QX; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b04ba58a84fso319121166b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 02:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758275841; x=1758880641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wv2XGzpppaOOQYxLEooc1OtelSQcdn5WbjJzV7E12kI=;
        b=jfOUJ6QXF7XMYHTBhL5Kj1uspvoYCock91qyVJdZr8NC5L3vRX2aiCmh4UNTbhAA69
         Cw++WjGL6up1LL8oRjvkPvfydktoUbxQnweki6DVfRczxDeIG7xRMc/PUDatFxo4JAsr
         Ow0um9K+Dc3rdx8vYvZ5k6JeiR2yZch8D3UPa4cxBveOOhdMg6RD4QpeueFrfI4OQE6O
         Yzsd9bExmQ+gBDfe/JKvsNQgGJke0Lx+ogY17U2wBFuZGA/nObJELloauLnmRcryyWmS
         yVucAeLmcYxZuXU3jI2Z6DlI3vjYtcc1E74b8pbsj0veUz5LMVm0tWUXjKhNaP0bqqVN
         U+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758275841; x=1758880641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wv2XGzpppaOOQYxLEooc1OtelSQcdn5WbjJzV7E12kI=;
        b=XlCKI0C+K4boHsphHv6p6VWRgvtcZXj5zhG/nbwePhRCkF3HnDJ9GcItfdvfKVlzCS
         kh4a2ysfNt/UUgBM8SYTli5KuLluKaNs/Pey7Owc6CODYmSBcSyq020/HUAj9QmWhXoU
         rVjmFKEOTlFI/HYQVU6zy28vuRM3QbstzrJHrB8a6zuu60rSHYDYOwmem+IOz2jmmywc
         IlwwApso8LRB+95IrCqnfthC2k6Wv/eQFxPrAy3XJ+tchQg6LZ7sw8KijpiKg7cvk+Jn
         skNr0zjMbmCNBmoj9bS25PObCaaVGi3pOoFz5kqbtlDL9VHGpiNy/+U1xWQJqXFjB+VY
         QwqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKzWTDwRpZHD8eeH3aPmbAHoa42KZuQJluRE4298qPHpZcJBpXAzQu/Ir20M0xcE5Uchp7MrbpQhsBTTYV@vger.kernel.org
X-Gm-Message-State: AOJu0YyKk0fTHjSkK83xOW1hdBCJCe6d668NSITGy2UY7cSP271GWAeO
	HymRnAoi2TWSs67lwpxcfPN6WJLYXFmizPoClpQ16mmw5Y0lu+vA7I5xPS5LDbWq3S4=
X-Gm-Gg: ASbGncvwLGUV6M0Zf9N3y4uVOoC+WbheqYnpQT7aKupBmxrSrsN1x5lrNkW0LGS3ROH
	YhEBe2ichYa/dBn43+o+PhTiaWg3wj+6u839hTH0tSQFJ3h+OcwSXxG0aY29Yma4fUHfh0692NS
	+mHahDg7uvotosDX6qvtWoPeBQ+6n37jr6YSPYRrheEY7nwMVNxoX1CLoH/e1bbHa/xeE/cZe2u
	QPhYZpVuIxPlt8eeGKFgJyeEh03kGNez0UY136JIEMi1SIH5IL3aJahFRq6XzagvmwyrUpR/Uar
	jL3I0EonqEoixo47E3zeEExzCQCeX4JoFAqTmlNYlIoMPfuTu5QSpYVwsl3ocIOOI+DhyTmO9Av
	rWiYP1Le10eoOVgBGHZO4Vghg+harXYAaiudlPxslyJc=
X-Google-Smtp-Source: AGHT+IGCfKpCurm3wfgSCSPPlB1C4atArsiZ9t/p/nlcpmWagcJL8S1NnymeJqiU90CiaiP1o7FQiA==
X-Received: by 2002:a17:906:c10f:b0:aff:17a2:629 with SMTP id a640c23a62f3a-b24ed97e436mr315741866b.3.1758275840313;
        Fri, 19 Sep 2025 02:57:20 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:5f76:e388:d005:f08b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fcfe88d6esm399165866b.66.2025.09.19.02.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:57:19 -0700 (PDT)
Date: Fri, 19 Sep 2025 11:57:14 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: msm8916: Add missing MDSS reset
Message-ID: <aM0o-phEMI0wSPA7@linaro.org>
References: <20250915-msm8916-resets-v1-0-a5c705df0c45@linaro.org>
 <20250915-msm8916-resets-v1-1-a5c705df0c45@linaro.org>
 <DCWOLHPCYG3X.32KTGBE4SYMDV@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCWOLHPCYG3X.32KTGBE4SYMDV@fairphone.com>

On Fri, Sep 19, 2025 at 11:49:20AM +0200, Luca Weiss wrote:
> On Mon Sep 15, 2025 at 3:28 PM CEST, Stephan Gerhold wrote:
> > On most MSM8916 devices (aside from the DragonBoard 410c), the bootloader
> > already initializes the display to show the boot splash screen. In this
> > situation, MDSS is already configured and left running when starting Linux.
> > To avoid side effects from the bootloader configuration, the MDSS reset can
> > be specified in the device tree to start again with a clean hardware state.
> >
> > The reset for MDSS is currently missing in msm8916.dtsi, which causes
> > errors when the MDSS driver tries to re-initialize the registers:
> >
> >  dsi_err_worker: status=6
> >  dsi_err_worker: status=6
> >  dsi_err_worker: status=6
> >  ...
> >
> > It turns out that we have always indirectly worked around this by building
> > the MDSS driver as a module. Before v6.17, the power domain was temporarily
> > turned off until the module was loaded, long enough to clear the register
> > contents. In v6.17, power domains are not turned off during boot until
> > sync_state() happens, so this is no longer working. Even before v6.17 this
> > resulted in broken behavior, but notably only when the MDSS driver was
> > built-in instead of a module.
> 
> Do you have a link to the patch that causes this behavior? I've tried
> looking through the git log for drivers/gpu/drm/msm/ but couldn't find
> anything that looks relevant.

It's not a drm/msm change, the change was done in the pmdomain core:
https://lore.kernel.org/r/20250701114733.636510-1-ulf.hansson@linaro.org/

> 
> FWIW a similar change to this was also necessary for sc7280 (as done by
> Bjorn) and for sm6350 (will send the patches very soon).
> 
> And happily enough for me, with v6.17 and that reset, a long-standing
> issue on sm7225-fairphone-fp4 has been resolved that the display init
> seems to somehow fail the first time after bootup, with the screen
> needing to be turned off once and back on to work. I traced this back
> to some power domain behavior as well back then.
> 
> > "mdss_gdsc needs to be off before mdss/dpu probe, this can happen with
> > genpd_power_off_unused but not guaranteed"
> 
> Anyways, I'm hoping this is not just a coincidence it works now but
> will stay working on my device. Just the reset in the past didn't seem
> to affect anything.

You might have had multiple different problems in the past. Perhaps
keeping on the power domain during boot actually helps ensure a clean
shutdown of the MDSS/DPU and then the reset is enough to bring it into a
clean state for the new configuration. But that's just guessing.

Thanks,
Stephan

