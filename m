Return-Path: <linux-arm-msm+bounces-49632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C3EA475C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 07:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D1DA3B14D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 06:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156F52063C0;
	Thu, 27 Feb 2025 06:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ed4dVYb6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAAA2E403;
	Thu, 27 Feb 2025 06:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740636188; cv=none; b=BmdBPALBkb713R2mbH4VsyeE/qlUeRD7PrJ1esneoF4GvelROcjFfAyYckkzUshcmYRLLKQ1JjwvMF+JWVm6A7MLsKq5CgrfP0Ssw+eIPSJSkuk4jeIo+uiFQR2wIlWACLc/XpWAxP0+kgHE61vFIbZPQNjVR8zGV3GKo0pT4Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740636188; c=relaxed/simple;
	bh=r0vZRXf74pxRftyAasxwH65UacrUG0HQDtK/8tZW/uU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XpVOm7p/7MJAxNUsQ3I1ec3ybiEedWGnjk2I5Da/lTt/7tZvYnnWAAiys9f/BXBi7HSzv0tp5URDClnTcwFx6/wznRVV8q0DWvE7uQMYeAFXnny7clbrGsYgYK0mx9gG9PY/flLiu7mAmXNxvZzKPfHz7iMkW7EWuU58jyMBGTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ed4dVYb6; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c09a30e14dso100986085a.0;
        Wed, 26 Feb 2025 22:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740636184; x=1741240984; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r0vZRXf74pxRftyAasxwH65UacrUG0HQDtK/8tZW/uU=;
        b=ed4dVYb6OXU1enmnI35zFzTS/dwIVUfBQohGFoxZa2s9qIk4c9Y0ll8HVZkzB5heiU
         4Yi8aDZAv2nLXaT0FDCdfJ36YxRGP+pl+BPWebCQ2hi2ErUCLroUheEIMcEEYUTmr9Yb
         JD0eoYXvSVTAfJGLoy4BVo41fM6NvpkbBRg85eAkhQ9szNet1fBAlWCtitJMhQ9bh2bH
         Tw9AtVCK0bGbOocg0vETC3Hc3phzw9xgEeq22H0EtseMqziZtfrdrQSf/5foGd0sKfTJ
         xGUD+WynfjgHZzk/irvjCqkIT1raO1GqBPznjO8qqz7/oU3w+nB0Pqx2gt0H4KHXie7h
         zVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740636184; x=1741240984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0vZRXf74pxRftyAasxwH65UacrUG0HQDtK/8tZW/uU=;
        b=hoiYbIVsS01FXnuuBCeciDF4Bb8Q9xpCUzlRUEQCH5mDrkqzSqKDo4yhICvFN6dQv4
         fYdhLWmupWvM6Hoq6w8WSG/yDM5WwCIroBosyNVle2iU6yIs5fxNVNHJW6cUYwQTmTnV
         mlV+UQlyOFRw8pzGb3ybXrd5W764fpzKyBG3e5hvJYaEHicILNAspJfbyaj9FIJG3h9I
         c02FsGD5yFA0neP1N8kBSn2glM4cwAhho3FYNkUVEQsMgxd4ms7VjfkGb411JQC1wC0V
         ayEgc/6G/2EDUR0s/47A7CnaKhlSz9xGmLj8/EyVasGvjn8yN65fPcLrFFqaGRFXYsIc
         bF5A==
X-Forwarded-Encrypted: i=1; AJvYcCUdKNBC5tXE0w0GgwjADgyjZ34A/J1RtgGJyfNhEmAHzp3e10tJHrwISyw4uTBrlnz9YHIyhgsloRmh@vger.kernel.org, AJvYcCUhw9GKIpBZS11yTSJuU/j9w0dqq89b6PpwRJwMB/tVr8mQehlq0Xw6PNsP2a1ZX1S3x6g3pjdlxk3iDJl55A==@vger.kernel.org, AJvYcCVfPkjLSbwgRlaBnojbTrIqVs50TPjdUBh39Lj5BK1/2p9vJsRuVO2FgGu/IZswQkqpNJr0oREsURn9c20m@vger.kernel.org
X-Gm-Message-State: AOJu0YzcCgL7IHdxp09CA1VMEaPFQGGk6RDHNGMo+lWnTEh95bzD0kHE
	vInSWaAGgEHiyLhlTRl1voNMWvBb7AmwwMW/LExUCBtLEz24W32vkz9g71HXHAXLZfUfgMNMeAq
	qswKr8FxWfdUwcFRkWe56Dic8gbS0oCupIic=
X-Gm-Gg: ASbGncu4LCoVX2OLcLedYpQmf8e2fUh1s6jS+c5APZCTt4ZKwGrKL2WskV0qIGYSRM5
	Aw15AnjN2paKh2yJQvDBrrv1dg0QzxIR+mQ2P1UdZlv731B4Zrfc8LIcdB+5RhSfGvH0KgdKPVC
	uNYkDBeq2s/jznlRPC7Lmy/btB95I09VmXKiiaeYdB
X-Google-Smtp-Source: AGHT+IG8TsJgh1LuuoWgmUmPf+1QE7q2pXs82GLabNXHK14+3oHihBWmdm6+6UHwIiOTggTv4y1kdXbJflqaFg7Ef0s=
X-Received: by 2002:a05:6214:4102:b0:6df:99f7:a616 with SMTP id
 6a1803df08f44-6e87ab143bemr146206556d6.2.1740636184327; Wed, 26 Feb 2025
 22:03:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226-expressatt-tsens-v3-0-bbf898dbec52@gmail.com>
 <20250226-expressatt-tsens-v3-2-bbf898dbec52@gmail.com> <jt4o4btmvfxorguh24yqr4mxfy64o47h5uql4swtveqxlo4q2e@2ozfhduyvvst>
In-Reply-To: <jt4o4btmvfxorguh24yqr4mxfy64o47h5uql4swtveqxlo4q2e@2ozfhduyvvst>
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Thu, 27 Feb 2025 06:02:27 +0000
X-Gm-Features: AQ5f1Jq7darmDqy2L1_11Pm2Q3wEtuLsiUyv0SFdgWsiHcMo3DiPCnwJIFMM8BY
Message-ID: <CABhZbsXZXmVEu1zGyGPwY=v2hdODzRyPPybDhFqqj_2N0MYS2Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: qcom: msm8960: Add tsens
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, wctrl@proton.me
Content-Type: text/plain; charset="UTF-8"

>
> I'd say, this is probably the most unusal commit message message that
> I've seen.
>
> Nevertheless,
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>

I agree. Please clarify what you mean by "Which values?" in v2. I've
interpreted that comment as "list out the changes I made when copying
the relevant nodes from apq8064".

There will likely be more comments by others, so I'll change the
commit message to match how you would like me to word it. Thanks for
your comments thus far.

