Return-Path: <linux-arm-msm+bounces-50568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39660A55658
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 20:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A88D189703F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 19:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E47526E63B;
	Thu,  6 Mar 2025 19:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jot2Jb5Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15631A2391
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 19:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741288488; cv=none; b=dZXulhyjA0H4FI3XG9ATGzGuSyYT4tbDSfR+bdbtNU8LpO6WjksGi6e3UgGz6wx1TT8Guie4zMGY14LhWz5fbBWsWBDI2dSFiF3mKnhSZXw1EaXvwInfMhxxNm+eUJXVj8xXNnS6tXG+5WZ1Vey3znFVvmXIkrcrKkbNu9RjveA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741288488; c=relaxed/simple;
	bh=B8EL7mhyV0p6lPu7ySWm8kOK+6RoXFTWH0QdieSVTYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M43RjQcuIUZvlA7u2OBCn8PUhqHDujrsmMhAvxlWCLamGkXqkszyNcf6QeL2z9SjFMaun1+84REksc6SsCauo7XYtlF6WRDdixg7Iu84+BDPpMJUF6aHP91r8umbGQMRwBgvs9QOeqnEXsHH1iBY7HofRJAV+qB5qCZeMTUbgwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jot2Jb5Y; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e53c9035003so1011807276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 11:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741288485; x=1741893285; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4AdaatWdHTASZtJQVeI4ZLNiFLZxbXI/geRLgGTDtM=;
        b=Jot2Jb5YjEvmkE4lXcnA/+LouCAQ8fhbDouKpX/pcSyiHkpVQ9RWSNSNKoCR4rbDzJ
         cd7Lh9UzH1EPqIGOCT8WxO/2bd0tOJuu3wxOaGeQU8JucR3to1dFGphC2RrGsC26XcGu
         bI9hpeH/DJbIolhkQYc+u6BEkz3NdieVCa6AYVz+vCKArIPRRrhyqyZx5fH0wK3SRR/t
         ssCrcL0TFJn9iqcui2kVhrFWmr16vBD7BYS3rdwjgAB3tpERrHYNwcNjRfmgjrNDVuok
         OkzNGFSZH0AHvYhP/KhOsuXtE7C3LfKTo2NdlA178WbpBpsvEXykCcFywCI6Q3qYowyz
         t5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741288485; x=1741893285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4AdaatWdHTASZtJQVeI4ZLNiFLZxbXI/geRLgGTDtM=;
        b=TheJVsD79SmXih/ocoLez3y5JS7ZF3q4dR7SnVRbJN5jzucvMRtOEX2sa8+OZOG5OJ
         gpIZPXZNs+HxVs3ZBCHg3K3YBpulBswPx4wD/5/LjcjYeh+v3s4TuR3UYjlTpqR+XMfc
         aYCmaPVnTKePhJj1v8dnUOpjvtu5Rny9lqBHKJjPQoOFOBJkbDYGxF/l+mNyR+yPcqBf
         o2D+5DAH828svJbFw4Ye/y1AHT4msDCPHagzTdycC0Pk2ac4QGl99Tc4F0cPdrw07mp9
         ncGSNw86VhBAKIJsZjLFiAN4UQp4FkhgaYazfiG5/kh668v/lW2BafGuYJfg8Jw/oGCw
         bCbA==
X-Forwarded-Encrypted: i=1; AJvYcCXwNML3ZWx0iijVW9AvINVroBIhIgpOU0ZTZUCQFfnkC1qBLVp+EwZNaGunE4hqe2Z3WOAKSU7/uoLsj9tR@vger.kernel.org
X-Gm-Message-State: AOJu0YwrC/GSZP+6zkVCW9PUygroi7J/LyPVEEz7Qh1IhWCKL6k07XYi
	fIAocdKveLXvRPJ2QxMMsOedEwl0twwsFng5oB/yRCtl45Is8FjTLd4+i4KzCpjxPTl6IkwdDwF
	5yt1OFHSNfUCpJcdGd6ImOrC59m1nVya/uYI17A==
X-Gm-Gg: ASbGncv8jqR9AXED5y/eid3Wg8/CKWpAFXc9/5B8J7nAjF9YUqyoKdPhJDIcExw15B9
	A68HVhUjZPCjUQmeE+gkYYGq//iDalcRZggW7YhmUY8fZkRgUOjHBjKKXH4I01/rig/1BtbnuyO
	Lx+kTAedZHlldD0xP+/rFu/5Q05+Ucv9e2gmcDHt3NM+07MJuip2ajxyJm
X-Google-Smtp-Source: AGHT+IHGIS+ExaQuPe3WrwKhT9iTZlQPHWrqXU+FEi6CZPLDhFRxvRWPAQAyK3eYKCOza74Q/R0L9wmKBH+vKLWHucs=
X-Received: by 2002:a05:6902:2702:b0:e5a:e897:2846 with SMTP id
 3f1490d57ef6-e635c13dc87mr674862276.16.1741288485545; Thu, 06 Mar 2025
 11:14:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
 <174110761299.741733.15423494263862521182.b4-ty@kernel.org>
 <d5l3bsozn2sauenlyjolb45hqgiiachixxycziuyfsxch3ypvd@mjb6whdyjztw>
 <64cb6810-4a75-4313-8d66-d773798f5a1b@linaro.org> <fb462c07-8d3e-4220-8394-1f8d9ae587ff@oss.qualcomm.com>
In-Reply-To: <fb462c07-8d3e-4220-8394-1f8d9ae587ff@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Mar 2025 20:14:34 +0100
X-Gm-Features: AQ5f1Jqn7g_ZEo4_V4hGSgwIQOP4Ud2cDL4bG4InNCHG7vk3jBCfoZ9M1cuhB9w
Message-ID: <CAA8EJprNWHgTcWj-_mvg0OzbxeXfLS-S4wM6tsraB+beCSpUvA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/13] arm: dts: qcom: Switch to undeprecated qcom,calibration-variant
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Mar 2025 at 19:16, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
>
> On 3/4/2025 10:48 PM, Krzysztof Kozlowski wrote:
> > On 04/03/2025 21:50, Dmitry Baryshkov wrote:
> >> On Tue, Mar 04, 2025 at 11:00:10AM -0600, Bjorn Andersson wrote:
> >>>
> >>> On Tue, 25 Feb 2025 10:58:57 +0100, Krzysztof Kozlowski wrote:
> >>>> Dependency
> >>>> ==========
> >>>> RFC, because this should be merged release after driver support is
> >>>> merged:
> >>>> https://lore.kernel.org/linux-devicetree/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org/T/#t
> >>>>
> >>>> Change will affect out of tree users, like other projects, of this DTS.
> >>>>
> >>>> [...]
> >>>
> >>> Applied, thanks!
> >>
> >> Applying it too early might break WiFi on those boards. I think
> >
> > It is just non-bisectable, so that's why I put above remark.
> >
> >> Krzysztof explicitly asked for it to be merged in +1 release, when the
> >> driver changes are in.
> >
> > Yeah, that was the point.
>
> Driver changes are already in linux-next, and I've sent the pull request to
> linux-wireless to hopefully have those changes land in the 6.15 merge window.
> (ath => wireless => net => Linus)

But if anything, bisecting over Bjorn's tree might give strange results.


-- 
With best wishes
Dmitry

