Return-Path: <linux-arm-msm+bounces-42670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 212369F6528
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 12:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61FA3163435
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 11:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855E719F429;
	Wed, 18 Dec 2024 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WFxJh2rQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE96E161310
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 11:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734522257; cv=none; b=Gc7J3yOgzqsh9YTjYPFl7lfkGjHigzI5Jg9xvyBznIFdRgNF5YBo/JxDQch8CguLL/CtWeNIyZZvxbRlgJiI0M1XBHxynlfLsxzSNHlYz0E0ivFDCrOLESpWhYVjrOhwiDVdkuP4BmJ9WSozIYMddIfw8qdYi0YYHwQ6zv4vg1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734522257; c=relaxed/simple;
	bh=Mk5s6vR+14eTyQcvu6XzGWN2S80JmhpUPsTpHYaecVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIQkvKbAI2Y2q7JzdnMgDyk8H2eEYJkUtpJ+EytmdgoYo3ImkLxPaQ2CPDpEQtrF1a/DLI0R7A5hmbJxwtNlGDwHCjn3wcFPza1jhWPRBoiBRb9TwZYVaz+V0K/5nVRvxi2P7pP+0wcHToVIy3r5wSl9gRI76r5HFIDRsTZH3EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WFxJh2rQ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53f22fd6832so6552517e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 03:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734522254; x=1735127054; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qSgyFmNiySJi9cKbnTzSvCSa7bOHhr/DX1wpZmOFD6I=;
        b=WFxJh2rQjMTeQASPaEA2itVxJxmCbtVlCjj90IZEZZbacOh4ffcFTZw936sdXQbm8C
         zT9EaFvaER66O8zywolxZpEI+PZhXhuSBLIpCn2UbaBUQ7GoQ3IrNwQBFxG0HFJkgLBF
         sfc+y497jH1b6VM/FcE+eg8dJAhttaj+CwaoqWcmcHOgforvJDnYSJ+9xekppXWQw/4+
         yfO87xvDVjzlDtE/+kFTh5yqwq79L4caJerdZvOgjcwzi5A8IGuLlApWc5zWTQnOj0b0
         W0aIOr6Wwp7bShuLTgeQgMhe7P5yQkar4Ywycb5W2CrWwX9q9A9BVt8aI4hldV2wp521
         Yz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734522254; x=1735127054;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qSgyFmNiySJi9cKbnTzSvCSa7bOHhr/DX1wpZmOFD6I=;
        b=TDw6aF4u4ZCFv2rcG4/BAJDR+kY/qGeeT5S3d0LodnBVCNrImrhKD4OmxBq6xdhg5f
         dJJ5hlSNEUjBBRNPUWVxA1vs7xDv4HpLE8Pzrciw7nkk4ov9Ko0DNf+GWIudLrtNNO8x
         RIKfwxyrfBW+uXH6OenyPdErfDmqUw0ZX58qNFxf/9CrQ7mdkuPRCVxwaB7uQFBDDqgi
         3qMekJbz8Ew1Dp/ctnAemj3svDvcWFzrOcIwwGwPQ1LomVJUu/Mc7Dmdnwjy78JsfBVc
         mMAvKjKS4fe3yMj4oOmZqUdc90HXv/ESKCadzz45X6y3PC3MBkUUcgnpT+wZMpMjlRyP
         GEgA==
X-Forwarded-Encrypted: i=1; AJvYcCUz8PW1smjqBqPvZpyV8EFPchGbDGKNf6NMJY+jJeSUtD79AgU5NWpeeS6e3jWhs4MFyaG9T+AmtJCs7gPr@vger.kernel.org
X-Gm-Message-State: AOJu0YxMD76o3WOqN9aeDpkNuIyvBxHQK45HyL31chjavlWsRvK7F5ZV
	BFpDTxz2PsNiMgZnRmS8pun4gaaBQJvXeJD5ivA7mQShgITUWYkNWdmpR/7PrXk=
X-Gm-Gg: ASbGncvLtavDKTF4yS3M5yYeyvRPwI6SjoBuXJMW59Qi41tB1JJDcBKAf0GX/2wdyFh
	NpcGySvHenhbAm2pkYTsRKDBZm+w1bSYlWiZuTKNiyJpGdvSkNDXRsywMLJU8328IY86NF3FC/V
	aaIaQMWss/A65dcVRC2eHDD7Zsdis8kI2iu05EtgcapQSwW8ylMfBNmvT8j60OUm+dYI+mobfl7
	fBQE3gU4bSPu5C6VJkMrORYqvb2Wj0zphFVsElhX0/WL8uXhgNmAcxX2Ygf2FAGDgBwJQi60/n3
	gdHULijxOqILGs57ih3GTCIRMdojm0FzBPTG
X-Google-Smtp-Source: AGHT+IFOi3R771oIo+m0pKp+iNRn3sNMW4xr+wpxXaN11mWnrJ8W+5ljdDjN5QfOFxC9hMEiYHevEQ==
X-Received: by 2002:a05:6512:2212:b0:53e:395c:6888 with SMTP id 2adb3069b0e04-541f46c442dmr1008761e87.36.1734522254000;
        Wed, 18 Dec 2024 03:44:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c002fcsm1378275e87.127.2024.12.18.03.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:44:13 -0800 (PST)
Date: Wed, 18 Dec 2024 13:44:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: fange zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Liu Li <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 9/9] arm64: dts: qcom: Add display support for QCS615
 RIDE board
Message-ID: <bwnsxcimgl7oqnzhrxurn3gs2ea3r6n4o5fulyhpooqnzbjllb@t7nljbwf3t3n>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <20241210-add-display-support-for-qcs615-platform-v4-9-2d875a67602d@quicinc.com>
 <cfdyvcxdkmf4sv5f75koflayyx74wd3tuscdl7byp5peaag5ty@yhr3275jhftn>
 <92b6335e-a303-49d3-9b77-f951663fc10c@quicinc.com>
 <CAA8EJpqyM-r3jvY7sTpG-KKRHP9K7c3q0xfoLb_f0th7vunPYw@mail.gmail.com>
 <baab6fc5-755a-4675-a42d-ba7ba7facf0c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <baab6fc5-755a-4675-a42d-ba7ba7facf0c@quicinc.com>

On Wed, Dec 18, 2024 at 11:18:01AM +0800, fange zhang wrote:
> 
> 
> On 2024/12/13 18:19, Dmitry Baryshkov wrote:
> > On Fri, 13 Dec 2024 at 11:21, fange zhang <quic_fangez@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 2024/12/10 19:02, Dmitry Baryshkov wrote:
> > > > On Tue, Dec 10, 2024 at 02:54:00PM +0800, Fange Zhang wrote:

> > > > 
> > > > > +            i2c@0 {
> > > > > +                    reg = <0>;
> > > > > +                    #address-cells = <1>;
> > > > > +                    #size-cells = <0>;
> > > > > +
> > > > > +                    anx7625@58 {
> > > > > +                            compatible = "analogix,anx7625";
> > > > > +                            reg = <0x58>;
> > > > > +                            interrupt-parent = <&ioexp>;
> > > > > +                            interrupts = <0 0>;
> > > will change it to interrupts-extended in next patch
> > > -               interrupt-parent = <&ioexp>;
> > > -               interrupts = <0 0>;
> > > +               interrupts-extended = <&ioexp 0 IRQ_TYPE_NONE>;
> > 
> > Yes, much better. BTW: are you sure that it's really IRQ_TYPE_NONE?
> We extensively tested FALLING and BOTH type, and they all work. However, I
> believe it’s better to use the default type, which is the same as the
> downstream approach. This way, it will be more stable.

Following downstream is a lame reason. Downstream kernels are frequently
wrong in many ways. So please check the actual documentation for ANX7625
and specify correct interrupt type.

-- 
With best wishes
Dmitry

