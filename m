Return-Path: <linux-arm-msm+bounces-12045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BADA285D867
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 13:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71E971F23F7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 12:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5298762FF;
	Wed, 21 Feb 2024 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nyc5g1sP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3496069973
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 12:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708520044; cv=none; b=jRHdrDNSrWl5xgqc4oYj3u1OJe3Qw9Pc+MGQWBvH4JVMJbxstCiyneE2lyos+SZlDODpwJd6zATxnXzlNQ+NkhZws5rV/D18m+uNmuhh2OJaYUXqLwziOL9xrCMWQQNxEXwJ7C8umrizKnbLxiS+JDitM/bN9+RcP+dyd44Jhcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708520044; c=relaxed/simple;
	bh=gj9HszIZjr2+2zgmHjzU08k4foTBQoFlvs186D3Pyjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+mgZzNMIJKOkx13rwml2Y52MSAv0hJQV8oMAYqyZX+CddP5sA4dU9x+Zf07AfG6rOr6MU4mFoV/QTeZds93zc6y3XGEEayOsr82gNN1L5dmhBYA2hds+MTN/XuzrlXWtRPxn/tki7p3QYA5By0UOlJ7XvDi4qcngW95kM/fLkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nyc5g1sP; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-564fc8f56c5so727508a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 04:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708520039; x=1709124839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rrIn9V2qKd16f2HB+Y2fWO0Di+JAOx1XvlTDsXHt6ls=;
        b=Nyc5g1sPE+Q4H+B5KqKIVWiNROK+ZdcyXQIr0H1ipiDB4/mtNG9nb88GreXbGU8N1n
         YiQ/v0+Z2cQskEsyewhRsWBoCloADjW/2imEdmIP/26cx+ZLZlYicn8LkD7z4VZRtoZ7
         vTkgwiTDIlhCvQnWSOPYqiVP6zAk2Zde2cHHVL6xfZvLo3pG/9mN+JIPz7P/GRAtAWTa
         +lX5UtYtBbuHWgXPdRHwdrYkx88I4/x6OKvkML9AfG8p8yYG2zI6z61qkDTChMKSM1N5
         9/gR+4+hD/9WsnTuVAAGy7FpQQ9X+6Tfjty+URhQQK48ncXLjqc8yqKpMrvIK3Ez/7gR
         b+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708520039; x=1709124839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrIn9V2qKd16f2HB+Y2fWO0Di+JAOx1XvlTDsXHt6ls=;
        b=muvzjxjf44XFvaKZpkBxwph1J14BkExIfzjNPecu42Pd0Xd2WyfZOE/zeMVqhD1zd8
         Z44H4l/qMqdMznUqXqE8uOUZW2KQyIJWEbCByxVBKTg+1P1zqIkj2NwL8bUmrrbI5vcj
         XEp3s5ZglPNsLquQl8lFvO8NkxjB3iY9WIG2iayCzbWb6sXpApg805Q6yS8BnKsp79FB
         BwgRmJgaEm7jKqKCwccby9Gu71HWwIP1D/nmaDU/YPtJC6gAqAcmb9GVmMcwhftzaRY4
         M4Nox6Gd3AXs/V6CIXLfmcxqp3Zp7cqXstRrjL+vsuEx8pAyAJ0Hp10+8uzatY4ZGAI/
         LrYw==
X-Forwarded-Encrypted: i=1; AJvYcCVHKlY9+cscec5lBqPUaODE6jeVWpPPRCWpDq/eampSpbgRFldTCybuF4fuzsuR4hAus1kf0eIcX6Su3bzHrXbcXX1A0AASensVu/H5FQ==
X-Gm-Message-State: AOJu0YzWhpngyWk9mvG+Vch/LHrPuZVqvQcHZSctfnGxBHMIekO1YZHd
	jfzYI+kt7/zDdlOhQwmzJ4Xm63dTrX0RaaeZl1+1VmF+dWf4CS91tNb8FxGnXw0=
X-Google-Smtp-Source: AGHT+IHlu6VRCSoQfdAgctz6wL9+t4rQ5qwcFr0fCK5QYqDHcoSmXL6ExdOSZBj1EFMB5ncELO6NuA==
X-Received: by 2002:a50:ee02:0:b0:564:5227:972 with SMTP id g2-20020a50ee02000000b0056452270972mr8437730eds.33.1708520039525;
        Wed, 21 Feb 2024 04:53:59 -0800 (PST)
Received: from linaro.org ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id fg11-20020a056402548b00b00564168e6674sm4384642edb.51.2024.02.21.04.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 04:53:58 -0800 (PST)
Date: Wed, 21 Feb 2024 14:53:57 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8[56]50: Fix SPMI channels size
Message-ID: <ZdXyZV0t+7QUvwG0@linaro.org>
References: <20240220-dts-qcom-sm8550-fix-spmi-chnls-size-v1-1-24e22107a6ac@linaro.org>
 <2585d866-8451-492e-9f8b-95210ac52a81@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2585d866-8451-492e-9f8b-95210ac52a81@linaro.org>

On 24-02-21 13:52:12, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 20/02/2024 18:04, Abel Vesa wrote:
> > The actual size of the channels registers region is 4MB, according to the
> > documentation. This issue was not caught until now because the driver was
> > supposed to allow same regions being mapped multiple times for supporting
> > multiple buses. Thie driver is using platform_get_resource_byname() and
> > devm_ioremap() towards that purpose, which intentionally avoids
> > devm_request_mem_region() altogether.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
> >   arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > index 7474cddf7ad3..3904348075f6 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > @@ -3318,7 +3318,7 @@ sram@c3f0000 {
> >   		spmi_bus: spmi@c400000 {
> >   			compatible = "qcom,spmi-pmic-arb";
> >   			reg = <0 0x0c400000 0 0x3000>,
> > -			      <0 0x0c500000 0 0x4000000>,
> > +			      <0 0x0c500000 0 0x400000>,
> >   			      <0 0x0c440000 0 0x80000>,
> >   			      <0 0x0c4c0000 0 0x20000>,
> >   			      <0 0x0c42d000 0 0x4000>;
> > diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> > index d488b3b3265e..260eda81b743 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> > @@ -3747,7 +3747,7 @@ sram@c3f0000 {
> >   		spmi_bus: spmi@c400000 {
> >   			compatible = "qcom,spmi-pmic-arb";
> >   			reg = <0 0x0c400000 0 0x3000>,
> > -			      <0 0x0c500000 0 0x4000000>,
> > +			      <0 0x0c500000 0 0x400000>,
> >   			      <0 0x0c440000 0 0x80000>,
> >   			      <0 0x0c4c0000 0 0x20000>,
> >   			      <0 0x0c42d000 0 0x4000>;
> > 
> > ---
> > base-commit: 2d5c7b7eb345249cb34d42cbc2b97b4c57ea944e
> > change-id: 20240220-dts-qcom-sm8550-fix-spmi-chnls-size-b8e6323fecc0
> > 
> > Best regards,
> 
> I confirm the value, but I think you should split it in 2 and add Fixes tags
> 

Will split and re-send.

> Take my:
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> if you re-spin.

Thanks.

> 
> Neil

