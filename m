Return-Path: <linux-arm-msm+bounces-11727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 233D085AA28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 18:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC39B1F22456
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 17:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B4245BE2;
	Mon, 19 Feb 2024 17:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C+zGe7Xu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB93044C92
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 17:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708364657; cv=none; b=ibSrWIU37oIYJbeFLi4PzXLCHoukAMrSaREETWEu+8tco/ghSh9GTVX8lR1AnJyPOl6yhxiknOwrJlxS08xGHsi5qMAuTHFb/j+z6TncnXZHMSBoRBPFoT5HEoROGkZ+ohOy49+Z12BK+FtUYhyUWqGyWIqbIGo8OR6KpIDjUlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708364657; c=relaxed/simple;
	bh=9vwu3zNtnqAqbKhJ+6AGN3WXgzDAgZ/Y8sE+lPjvzHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lc3p5rgxvUBeJ7ctKuv7QnbglikwN99/KzO4idnJ/RnWjurgGsj0YPH9kl4n/yIPQLpyewkmzXiHe/CJfoB/7bNmqFNkt/Gm3CXrwntEmswaHMezFQl0GQKtwFaqvM2kjtuZKC09AtYUUbLIxXfbwkFINZRPMlJZU1lRpjCXg3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C+zGe7Xu; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcc73148611so5318595276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 09:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708364655; x=1708969455; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j0zXATHAze8NZy9kFIN3YGfccOzS376coG1qccDgLkg=;
        b=C+zGe7Xua7pzKtrc8+4tfQtXldBnEvEHqH5ODcpQwLB4Cb/tFU4wP6S7qLc2A7BBe5
         0NYk3y9RkdGfwNjyZizsHEzR1Hwua4NcFgco2FX+3fIz9bMPs/YnmhgJUB2jm3c45foI
         r9DoMbR3M9eGDLiGBctpZhWQY96ymHTRNAjBiebDgf44gKn3dwJnAuV68fGVeXnZmiX5
         xuAf+gkyvUeIYfjTBL/NlH/C+Mg8VqBQ2+oBR4TvEgnx9DJp09QpZJmKyCDh5TZPcJto
         ZzQWPfHpt1QJddMicM6wnzP0j1E95cxVUJD9FrObM7kxinj81MWxKxjzA74/lfv7RBB6
         xW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708364655; x=1708969455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0zXATHAze8NZy9kFIN3YGfccOzS376coG1qccDgLkg=;
        b=G0yt9MTcshJZayvpZKrpH2Hvmb1YqvxPRgH3mk0HwUJt3A7RCHZLEy04YSRJ45uy13
         gcTFoZ5f1ZQfyRdcYbyPDwPpjqK+1xaYflw8ynqhj4oV0vYLL2mCHhrGaE1b1+4RqBOF
         5SuTLizgEU1/eFCVNcmA6ev1gt0PFdbgGSBCfj+LgYLbo/oIjT+Rk18lU8dpBnW5GzAB
         BqxqeNjUJ1Ke3LILy2MRSBRW/Ts494ZmG9fyCwaqgerbOHHB+jM9s5fFgz7e74u0alca
         fuAD4qQVG/85JmDQSUMYaTmOXakynBBRSwW+GFwrpGdRjj01zYSWd/Gl2e7syYbBp9Um
         iatw==
X-Forwarded-Encrypted: i=1; AJvYcCWzEoEieb9RyGTaFHSFRfaHdpvmRAIDZFNF9jsb2s9M7Rp/fUstUK3TsDFwYA0+YQrj7uyF2yZO52S3uoUA6xbxjLXQMIk3Vjhg0etqYw==
X-Gm-Message-State: AOJu0Yyg21tp3SFBjKOgnrB+I6z7ZiO+bKGhyDSPe1GBHDxuJRrOrKwe
	0eoFDcRmKqxynK/gySOIruoLF+4pxfCXuQxNHwDke1FMx1ii+ko46e2qwsLMPIeBK5xpHN+1uH1
	v2+A3OKkw769zB4mtqytkiAT11aCSGV+3rXkesQ==
X-Google-Smtp-Source: AGHT+IFKzL6ptSitfZtFW/T6MBsRHT8U4ZmYel6dTcQd6ViVfKfe13gcYjSRgWwo+fjNa26PIFvPmQrxOdu9t+jwOJw=
X-Received: by 2002:a25:8006:0:b0:dc7:32e5:a707 with SMTP id
 m6-20020a258006000000b00dc732e5a707mr11059292ybk.61.1708364654765; Mon, 19
 Feb 2024 09:44:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr> <f6e68756-72a1-4c32-968d-3d6adaa153c9@linaro.org>
In-Reply-To: <f6e68756-72a1-4c32-968d-3d6adaa153c9@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 19:44:04 +0200
Message-ID: <CAA8EJpq=G21h87W69_4U-BZ=Sa5VEs15Y-zE-G5x9VxVx4qjsA@mail.gmail.com>
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, DT <devicetree@vger.kernel.org>, 
	linux-media <linux-media@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bryan O Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pierre-Hugues Husson <phh@phh.me>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Feb 2024 at 19:29, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 19.02.2024 18:18, Marc Gonzalez wrote:
> > From: Pierre-Hugues Husson <phhusson@freebox.fr>
> >
> > On our msm8998-based device, calling venus_sys_set_power_control()
> > breaks playback. Since the vendor kernel never calls it, we assume
> > it should not be called for this device/FW combo.
> >
> > Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
> > Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> > ---
>
> FWIW, this is also broken on other SoCs.. 8280/8350 and 6115
> to name a couple.

Then let's just disable it until it gets unbroken?


-- 
With best wishes
Dmitry

