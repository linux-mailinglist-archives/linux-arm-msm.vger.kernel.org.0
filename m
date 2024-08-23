Return-Path: <linux-arm-msm+bounces-29337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A11EE95C81E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 10:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 040CFB2654A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 08:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC36874BF8;
	Fri, 23 Aug 2024 08:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tKpgDZLb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300A1566A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724401907; cv=none; b=jrGr5fbMRGLLbT5khtntmn4+ZtWl8uONj5jkstn6DVbI4LmlKly04hfeR83DTiQHzSxLi1NF/eVr8dwV+hbu/GZZNTZdhR4BKcXtJXO1srEybKzYdg2Z8358FY6oyZk9YNd0Zca0BYnrR4qWO7YpkmqH7a0nm2C1S9rvMlE2B2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724401907; c=relaxed/simple;
	bh=SPa15IxMtD1+oEt0qhbtGb1r7/rMPjjAGbG/DvezoRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hx9BcYvtYJmsnVfhcuCI5U+8+zFXxMWbO6fU8Ecw8DJ5bJ9eCcPZLqjV7CTxpOs2SO8zUBCYMr1q2mTt7I8Aw9KMIsWgWj8uJ6MV0TFyWOg2tPRF7mJoBnU9R7fgajuwaZN+CcKENriqt6oyJBOfp010p1+7R8lZKycCsgDD/aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tKpgDZLb; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6c0e22218d0so19667057b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 01:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724401905; x=1725006705; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WJ7ulpTWG+6HgKylvJsyXasgt19eHQQJ+2F5s9QNO4Y=;
        b=tKpgDZLbqPU5H29JibzR6hJIQGZR6epYCaRhz2uglTAGScp1vmWDinXpPxJBbrN4cO
         mu+h0af5UtIrdV72YgMBWew5mDy8tdzld6+B9gu7fBHqll7Bn3TZ/8sWom598pdALXJj
         +h5+CmEG1VKy7i6gJHcCbuZzYeSxkMmpILgOga1TceYesf7+fAqRGF2KIuYUTN1fzXGz
         pEOHZrb0O54ge5PBszJbdUGAPVyAUD41eyyGp1NbgXg3w6p9BppSDf/oqkDw1h9X4JSt
         KdpMScOSneYXm8d9IrPXH1IePDlUjzCYPQbT0+Z+8j0cIHpUvIYFtIAfG6c7LFtzjYpA
         pt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724401905; x=1725006705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJ7ulpTWG+6HgKylvJsyXasgt19eHQQJ+2F5s9QNO4Y=;
        b=iFp5rDX29sW0dttQfMQkDcZkl8K39FyrYdM1PHcuStr6XZzTpeQF9JrRRZ+nKdyfr8
         Af63rhs/bMirWfY3pAWqPrVkcM+k2L6mv4U0u7lWy76IOVb0PRjeGARjffAnIudaYtT2
         Y3QNnN0DvLoX3W/a506tFaPGfd4fQF5L7AulFl4thmxwuaH1oYOHGvvH5Yab4ea17lZe
         wTCltNgq0J5NfOoFDR77Z0ZBOmG2jlj+/XuzRL8TI7Ksscscdk/ak+ArfTL3KMrPPwRB
         OJR4X7zUVGQjHXKCax35SqtHJAfQbtxMDa1Zm9ZVMmmUmBxnc5DXMlI3H9hLCocBjGTR
         1F2g==
X-Forwarded-Encrypted: i=1; AJvYcCVfIymoxsP+ZRYsC51/Cblx13qPRJxWiIAT5tqBGXmCcuAnAXjcunFZh+S08ql6hZDMuJW3NL2+gzAYVtrc@vger.kernel.org
X-Gm-Message-State: AOJu0YwOUI3cbO91HeZkwX2ctqHfx32gyLsW1l9ii6irY/aHMzcmvp/k
	L+wcMynAl4Mn6wTgeIQ+0K4noVEDYQs0hidym9wS5SW6iKrmkb9l6AI3cKMx3J1CjmJVqM673eS
	LWKIHYZWSG2VJMSWWdm0fNGiCf/eBPUjqOGaRJA==
X-Google-Smtp-Source: AGHT+IGdbZDfcNoEUAB0bb/rCb0T98GoH36MoE5i8HUCFy4dJ6s2GKkd5DSz+YMp+FRyq0Ql++zMNaic+QIGlp7hpk4=
X-Received: by 2002:a05:690c:fca:b0:6b3:a6ff:7688 with SMTP id
 00721157ae682-6c6243209e9mr16621977b3.3.1724401905207; Fri, 23 Aug 2024
 01:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=Mcrrhagqykg6eXXkVJ2dYAm5ViLtwL=VKTn8i72UY12Zg@mail.gmail.com>
 <20240822211336.GA349622@bhelgaas> <20240823083004.rzylgm66yaw3rlyi@thinkpad>
In-Reply-To: <20240823083004.rzylgm66yaw3rlyi@thinkpad>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Fri, 23 Aug 2024 10:31:34 +0200
Message-ID: <CACMJSeuHkbUYSSE_7=HE5L2_j4LaR_jA2XSDgg_6=WFd_GdE2g@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] PCI: Change the parent to correctly represent pcie hierarchy
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krishna chaitanya chundru <quic_krichai@quicinc.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, cros-qcom-dts-watchers@chromium.org, 
	Jingoo Han <jingoohan1@gmail.com>, andersson@kernel.org, quic_vbadigan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Aug 2024 at 10:30, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> > > >
> > > > Right now the commit log doesn't tell me enough to justify a
> > > > post-merge window change.
> > >
> > > Please, apply this patch independently. FYI I have a WiP branch[1]
> > > with a v3 of the fixes series rebased on top of this one. Manivannan
> > > and I are working on fixing one last remaining issue and I'll resend
> > > it. This should go into v6.11.
> >
> > OK.  I just need to be able to justify *why* we need it in v6.11, so I
> > can apply it as soon as somebody supplies that kind of text for the
> > commit log.  I.e., what is broken without this change?  What bad
> > things happen if we defer it to v6.12?
> >
>
> I'm not sure if this is a 6.11 material as this patch is not fixing any crash or
> potential breakage in 6.11. This patch changes the hierarchy in such a way that
> the suspend/resume could work fine once added in the pwrctl drivers.
>
> At the same time, I'd like to get it merged separately for 6.12 instead of
> bundling it in this same series.
>

Ok, I'll find a way to rework my patches so that this one's not needed.

Bart

