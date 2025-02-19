Return-Path: <linux-arm-msm+bounces-48488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B969A3BC40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 11:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7ECE97A5379
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 10:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C748D1DE8BE;
	Wed, 19 Feb 2025 10:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dXfcfunG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18BC1B425A
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 10:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739962737; cv=none; b=ur0q34ZNQNJgIgk8KBziAq90ojv/fpU/FHgoZpTFWyoSmotRN38ADCDJr8rs7zQwnJIStU9eimjv3PudnrgCWYRZmo3ah1qN+nVdC9Yhtedsn91mZe1E8/LN+3+gnTLI/GvDGM+TxhvW0lJ76ABUYYVbV6vK2SejySx9CrOAnZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739962737; c=relaxed/simple;
	bh=CvEuSAg+nVFG6qjJEiGbScYYldX03GA1lX/QwghhTd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6t/Pvj9vewFiwmEKKBdWaRtD8nXunk+Ar+HPUabVBL7SgIfSuy4JvYplsdJHOQ0Zgq4F5YlGJb5bQzLMqgm1VsHkPFSeHeItpjzyEf98zeRThkWVKU1b1FAWx/YS39AoqLDkB9EG5U6iL8wQzI6ppD7tQ49z5ZnAs+8Lf0I60M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dXfcfunG; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30a317e4c27so29823101fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 02:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739962734; x=1740567534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=01B6M3B/6e8fBJbhUwGqxldkm9jDFUlKOIpIo2WPDw8=;
        b=dXfcfunGsCOyRyQGqbUrdL2QDRdpdSqqtmedHNgKcSGW1Yyj5j5xzp5nyOKNoGAZc6
         oqIBasn7CdYzeoZv81v11xudZqz+xzp08ErLTKfU2KYVqqgTPBsGYdiI1HrHkeAfCAx0
         CWhqCOsLl4/pXa4snN0pu7DosLiYf6WCCKAgaJx6oFmhMS8vD61PREyp0JyY2wlINCKD
         qd//FS5l8F8/AXhlzbID15+J9VX3FkBqeWks+cK1OJfrcylqCIts1qHd1WMXDNyVkRD2
         WO4lkHX0i4oWbhE9dpcAW60wutXsD/fTd4YY4VrCn2o7RxFgzHl3B0S1aA9O5uuvAJy0
         JsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739962734; x=1740567534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01B6M3B/6e8fBJbhUwGqxldkm9jDFUlKOIpIo2WPDw8=;
        b=XHsvVr3X7hSzHKlCZL+t/YvaZ9Jnmdh/wlEKrp9pT2/NkDs/TwlWb1R3GZuTJGbSWc
         ve5GXPGBFvRAABwmpQzBF6hhGfBfFczdy+O5wDjhCZXq1j3arPfwHdKEc0XAz4THtdUl
         608KaQQIAxanqcROlPsAlUjqziplr50MigoE2kKPfKFedN3xotBGjvu2QST4XSpOeuLK
         0ovMn+H0ae/OtFVm1s7jPHQmBhmJ0AJIIM1dnYMKGRJ8RfWYmmm91Ij37WWRH/eKbDFL
         HQFRG5AwVViCQ/vysayocOx18MTAN/LU/aA4cOdQiwxc03ZryS7pOAZCXRQwhc3aURuj
         AjNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4KxFRHjjWuUWwfJXAH0+mKexXt2GMwCF2SE2WsOfuXZdY/bXvoeVN/XFABVu2AhdXW2VolliqrGPbjqij@vger.kernel.org
X-Gm-Message-State: AOJu0YwoFIKGCKdv0cwoUIj5DjDkqIG6hTyHwB/JEtypoK1Zkwrc+GSQ
	ToYGhPwXDUc5CVP/VuCQB+ONgeEdtWStT3mXIoHneo28/+t6rDbMRkCSjqLFoVw=
X-Gm-Gg: ASbGncutuEWwnaQpfzf4TCHITUWGGB+lQhuBUIiNMha/OySsj6hX1AH1KAnaVLGEn9b
	6A45S+0DJajTyCvfOZ1Mhkef3nrrxye9KA+WFv9HUdrZw+LZXWjmq3BhuexHxRNzR/n57A8aoOQ
	G9ul0L4gJzCvtBdpO1DZcVOBy2i43sqhTc8SQdCLbPPJgr5lY8c3RLr/e6jP6kw8kwfE0yy6A5e
	7yZFtXFVsW9HCxn9kmSkMN+HZ0vHGXfmPs12xJ6Bc+qhbWGeTFj6TvRm477mFhoxKITg4eax4zR
	5JTtEBPoWYyMGzpd+o9HSaMMd4iaR5ZuPBl8j4anvA9/nzTC/FZqqscCUXrAXbvnBho0TkA=
X-Google-Smtp-Source: AGHT+IGcisYXxPQLC+b5+fYSrjvm5AAYIjBDylh4x2pSEkaI839acVqUHx0018XYsObzYf9DMzTOXA==
X-Received: by 2002:a2e:91c6:0:b0:300:1ea5:1655 with SMTP id 38308e7fff4ca-30927a47351mr50492061fa.15.1739962733885;
        Wed, 19 Feb 2025 02:58:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30941da3978sm14149531fa.112.2025.02.19.02.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 02:58:53 -0800 (PST)
Date: Wed, 19 Feb 2025 12:58:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Add MST support for qcs8300 platform
Message-ID: <ylotx2i5wvkitezd3ilqg67g2fj2emjigvnxhsdfl5nmoscsbf@kybjxritnslb>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <87058b73-8854-4dbd-9f27-1da2a8240c16@kernel.org>
 <2ede97c5-a4f2-42fb-b3cd-68f26297150b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ede97c5-a4f2-42fb-b3cd-68f26297150b@quicinc.com>

On Wed, Feb 19, 2025 at 06:02:27PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/2/12 17:06, Krzysztof Kozlowski wrote:
> > On 12/02/2025 08:12, Yongxing Mou wrote:
> > > This series of patches introduces how to enable MST functionality on
> > > the qcs8300 platform. The qcs8300 platform uses dpu_8_4 hardware, which
> > > is the same as the sa8775p, but it only has one DPU. So it only has one
> > > DP0 controller, supporting 4-stream MST. This patch only enables
> > > 2-stream MST, using intf0 and intf3. The first and second patches are
> > > modifications to the correspond dt-bindings, third patch is the dp
> > > controller driver after not reuse sm8650, fourth patch is the qcs8300
> > > dts modification which add the clk support for stream 1.
> > > 
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > > This patch depends on following series:
> > > https://lore.kernel.org/all/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com/
> > > https://lore.kernel.org/all/20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com/
> > > https://lore.kernel.org/all/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com
> > > https://lore.kernel.org/all/20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com/
> > 
> > Buggy patch cannot be the dependency. You need to fix the original patch
> > instead. You are not supposed to wait till knowingly incorrect patches
> > get merged so you can send a fix. You must respond to that patch
> > stopping its merging process.
> > 
> > Best regards,
> > Krzysztof
> Thanks for the reminder. I hadn't noticed that before. We will wait for our
> dependencies to be ready before sending the new patchset.

Hmm, no. Work with Abhinav and send the bindings (including all 4
stream clocks) and platform enablement. Then MST support can come up
together with the rest of MST patchset.

-- 
With best wishes
Dmitry

