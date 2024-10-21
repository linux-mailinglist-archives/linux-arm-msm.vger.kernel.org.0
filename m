Return-Path: <linux-arm-msm+bounces-35181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A55E9A5F7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 10:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 019D51F22F1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 08:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C541E2822;
	Mon, 21 Oct 2024 08:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pGcotFN7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4151E1C10
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 08:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729500818; cv=none; b=H7Vhe1eLXpAESKMIYqvS602fQ7gH7AfK/qJ914yFjjqtDKCpPXuuJ50ZW0cWKmbwiDQBQtkDWwPdX6EFV9FzghoAfjHp4sBWzFCu2fKd0uWpZ5X03jlo/r8icH2UddBJOGb6euz0wOnCq56DmLP1mrTuuZbtnSJLihGUVF1Jl/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729500818; c=relaxed/simple;
	bh=sch03UOp62PD6ZT4/5kfoAJffWJpx2NolioHoQSj8So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnN/0gCAD8SCY5JFDzwrBmC2L5xkN0zUg48j3Ul6DMAPLckzkXvPWtEzOLbb/KeLSoy4vO+7CS7/A2m6NR91/ODcizgqZHRZzNgRqguuFRkqXXIdeR+D+SQkba3/R/C1o3iLzS42hHbfyCzfd/78dLa4Q8eoOwwP91E1fWInre8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pGcotFN7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-431695fa98bso17147645e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 01:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729500815; x=1730105615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pf37m7cZLJ8ue3Aeo/JFmWT3QjQLdbR4ZMc5/ugeu0M=;
        b=pGcotFN76nUk9L2cphTgGKBESXESnBjDDNSJHdJODU3a+3HvivgWghwmjJDQWlBbLF
         Bz3JxpqoFJHwoeub7eRcTW216JF2ivtDLCU1dGiSddNxqnSdD/kGd9HtiBjqvm1P36WJ
         JvdkubBLUNvrFVQkgL0E+53VKQrdhoy0h7J05+PrdpT7ere7gHI1nLFT3m0X2fSRFO27
         tM0lBgNyCAcTMdRqqjk6m2bAMPAoxF5sbOGUq4iqEzcE0g10oDVQ5n6QqrM3egeJzhbb
         WaGacclGOWVwN6FLHikWjUa8S6bkXriyl8Jlp65tQ66IJvNDWBP7B9EXtHTM01eLdh7K
         sBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729500815; x=1730105615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pf37m7cZLJ8ue3Aeo/JFmWT3QjQLdbR4ZMc5/ugeu0M=;
        b=PoY+Y+0zBt0GPo8HSDABw2Ip7k4O1osGsknvdv7douTPTfFIOUH9oSyk9LicfxbTH6
         WqSLzlpQ+lJAUWlYN+xL7IPC46fwQW/CuWwHAGhuCaIQ73EUBpc3oMYDsB4ZASYRW2lZ
         J1YrlmQN2JwgDmNX0SHqbFJPR25Bb+97tHwmRoIWHp8RO0WJeqpO9RiMybXdrkvhxkTy
         lQErCMCfp00AxwI1RInryTJjR5q1ONip6DfBl1NouLrcHOUrlmetH5IH+003/cBY+DQE
         2/Fo0uj8c7KErDbZzWWKBsmyS7412Est4xaRIapjmyUFytCrQnJKoFzkatWqMGRhR+oh
         4r0g==
X-Forwarded-Encrypted: i=1; AJvYcCXn2IVMbi7CX3ighHZgXS23m7k59vBPp6ZPccjL6rtHAFbatt0ozCRaqRc3D0phF8ERQVkaELeYI68xO5Zi@vger.kernel.org
X-Gm-Message-State: AOJu0YyVVK88VbjKFQMveNHolSo0A00fIzbYjcZhuaNcN4N2ueYQgHr1
	+3fVs5Q+GbG9mOVNbFVC43koDsnDg8/Cz4hVNxAR7yBKwHsv+XpsVJqwwETGmeU=
X-Google-Smtp-Source: AGHT+IHdfM+MZfIvAPyq8JSLRmgoJmJCj002hwOgtEkA8kNRR6bBa5rbN1qa2LpdVOoDfrCgHzBTEg==
X-Received: by 2002:a5d:6e56:0:b0:37d:4aa5:eae5 with SMTP id ffacd0b85a97d-37eb48a0ea5mr5947426f8f.55.1729500813631;
        Mon, 21 Oct 2024 01:53:33 -0700 (PDT)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9433asm3760093f8f.80.2024.10.21.01.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 01:53:33 -0700 (PDT)
Date: Mon, 21 Oct 2024 11:53:31 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Fix
 X1E80100 resets entries
Message-ID: <ZxYWiwMzmU6wneu/@linaro.org>
References: <20241018-phy-qcom-qmp-pcie-fix-x1e80100-gen4x4-resets-v1-1-f543267a2dd8@linaro.org>
 <ZxYDwAUNV5Jhar4I@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxYDwAUNV5Jhar4I@hovoldconsulting.com>

On 24-10-21 09:33:20, Johan Hovold wrote:
> On Fri, Oct 18, 2024 at 04:37:36PM +0300, Abel Vesa wrote:
> > The PCIe 6a PHY on X1E80100 uses both resets in 4-lanes mode as well.
> 
> Again, this is a bit misleading as PCIe6a is using the
> 'qcom,x1e80100-qmp-gen4x4-pcie-phy' compatible in both 4-lane and 2-lane
> mode even if the original dtsi got this wrong.

But the lane config within the phy driver differs based on the
compatible.

> 
> PCIe6b will be using 'qcom,x1e80100-qmp-gen4x2-pcie-phy' as that one is
> a 2-lane PHY.

Wouldn't the PCIe6a also have to switch to gen4x2 compatible on a board
where PCIe6b is used?

> 
> Perhaps you can rephrase this so that it doesn't sound like you are
> using compatibles to configure PCIe6a?

But currently we do configure PCIe6a based on compatibles.

What am I missing ?

> 
> > So fix the resets entries for it by adding the Gen4 4-lanes compatible
> > alongside the 2-lanes one.
> > 
> > Fixes: 0c5f4d23f776 ("dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the X1E80100 QMP PCIe PHY Gen4 x4")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202410182029.n2zPkuGx-lkp@intel.com/
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> Patch itself looks good.
> 
> Johan

