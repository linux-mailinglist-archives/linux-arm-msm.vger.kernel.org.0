Return-Path: <linux-arm-msm+bounces-34823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC6B9A303D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 00:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17A81282036
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 22:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A79F1D2F6E;
	Thu, 17 Oct 2024 22:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NlJS8hRx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9EB1D7986
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 22:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729202416; cv=none; b=ooT+VnjVjxGMKRtgEzswDuu4HIr68p/A0seHn7z0oHE4U8/Bu4VLghstbIpXrO3hR6usB69Vw71bfew7zgrDcnBHeaCDxUuLb6jRE5I4ePqQHsAvBOihyfdeGz3wri+sL71pWDRm4RGN4WjR/JJaYMvtFeuqSJy6t/Fv9OdM4ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729202416; c=relaxed/simple;
	bh=xFORzQkJL/WcWdKZ3DVfQDkKa0jdZA97QDeet1sttTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FC1rlXPAQOOWlmgS9GnaAYAlok3KqMP+A2ZlYTlN+whtg/q0q46v5PVqlq6S/Cfbq8/Ki2Kzudi6ZoxB9maOy3Lxm1FRnrqfOd3Jif9++zPV5xSVJq9SF7ZCA5iJvlhxXVbXptNfKgW0jWErA2+CnAxl+EQ2Ym7Oc1WQFo8shzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NlJS8hRx; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5f647538so14963311fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 15:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729202409; x=1729807209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Isw4TLSYBoy+yI8Luh4Hi+u78l3bLfiSrZ6IrpPiuvU=;
        b=NlJS8hRx9XqJqrvYo51fBH9ruarluzpG69Ly3VxN14Hs9m9bIBsh2pHcAKoyBYkWDz
         72TuGKefbmw7dPfYXCuyZYkZ2dJDyLnCP8364geY3MlyLNRSeEkk2868gFTq4K20JTBW
         xtBl8ve9xZxfun5MoHGdXNNsrTwItrdhr+qEjhyb2pXWrNl2xGkP+7+mGc4OW95fjQEO
         32T+Keol4OoWinF14DEJhkEdsto/3ZtBNo1j0Og0JB7XfBnZrQnlAh5XTa45Gjn2MHog
         qM5Tmjz8nrfHPhKxdh2WFQTPxiau1rpCze6hBW68p3/8+6wSaJJlkoV6eGSVAIp0XXYI
         U0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729202409; x=1729807209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Isw4TLSYBoy+yI8Luh4Hi+u78l3bLfiSrZ6IrpPiuvU=;
        b=bv3NhQQ5hP/rWMnRAFrJV3I3j8sXia0DSmd4+wzIYt8qP577uHey8hdcbnQsXHCNkI
         6SARBRvkqd/iXAk7ZNCEyVKhpKNoHxaaghbMykzZDn2wKgzyxZHZ1SmrsubOfS3SOf0m
         EW1HW5avk7osxl2V7/dy4qybZhWcbMfTt8M1Nu1Ks1/R+x4ouEQZ0C36iG4voF8P+lT1
         3TRTd2JZAWKaukT1cNNuqJegKTcsBHTE3GjjvwdIS+25IabAyYQ0BjAJgNNN7GzWqP0F
         8ki3YUAlT5jhiNe1dBWlu7iyVR4N3B6GSjO3o3hFtSS61yw3pFJgh9afPWVdVgKyikhT
         iMOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfPBXerzYN45nEcwKEkYkR4TERDnqNSal36RI7HWh2VL4snTboRnUEWaZwNHL8Mlbc0E7izkAIamMioiN2@vger.kernel.org
X-Gm-Message-State: AOJu0YzjgsUcf3jBgmOswRLA875WGnGifsukRXQ7ZA4IwYhw6K1n89BF
	wa9NCyuEfb3CCbTshXa87uNi+PAgKNP37q6A0DjI6RfSMZGaE+H6VfUTdIekXeo=
X-Google-Smtp-Source: AGHT+IGUX5FxPYm63QjEX8QSYjKY0R76CkWqYGuUb5gIaDo5gBTDkoQZABdj7YlxIwd/k53oj6Qswg==
X-Received: by 2002:a05:651c:b1f:b0:2fb:597e:28f5 with SMTP id 38308e7fff4ca-2fb6d9ad52amr14615841fa.2.1729202409216;
        Thu, 17 Oct 2024 15:00:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb809f9ad0sm426951fa.82.2024.10.17.15.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 15:00:06 -0700 (PDT)
Date: Fri, 18 Oct 2024 01:00:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kalpak Kawadkar <quic_kkawadka@quicinc.com>
Subject: Re: [PATCH 07/14] clk: qcom: clk-branch: Add support for SREG branch
 ops
Message-ID: <we4stuv7td5jmvicsvsjowqg76merg5lmlgqj6dvqvqecsw7xk@bfz2kdjnt6kb>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-7-f75e740f0a8d@linaro.org>
 <be8639d0add779bcac0314d3c433d01b.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be8639d0add779bcac0314d3c433d01b.sboyd@kernel.org>

On Thu, Oct 17, 2024 at 11:10:20AM -0700, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2024-10-17 09:56:57)
> > From: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
> > 
> > Add support for SREG branch ops. This is for the clocks which require
> 
> What is SREG? Can you spell it out?

Unfortunately, no idea. This is the only register name I know.

> 
> > additional register operations with the SREG register as a part of
> > enable / disable operations.
> > 
> > Signed-off-by: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [...]
> > diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
> > index 47bf59a671c3c8516a57c283fce548a6e5f16619..149d04bae25d1a54999e0f938c4fce175a7c3e42 100644
> > --- a/drivers/clk/qcom/clk-branch.h
> > +++ b/drivers/clk/qcom/clk-branch.h
> > @@ -24,8 +24,11 @@
> >  struct clk_branch {
> >         u32     hwcg_reg;
> >         u32     halt_reg;
> > +       u32     sreg_enable_reg;
> >         u8      hwcg_bit;
> >         u8      halt_bit;
> > +       u32     sreg_core_ack_bit;
> > +       u32     sreg_periph_ack_bit;
> 
> Are these bits? Should be u8 then. Or are they a mask?

masks, will rename.

> 
> >         u8      halt_check;
> 
> Instead of adding these new members can you wrap the struct in another
> struct? There are usually a lot of branches in the system and this
> bloats those structures when the members are never used.
> 
> 	struct clk_sreg_branch {
> 		u32 sreg_enable_reg;
> 		u32 sreg_core_ack_bit;
> 		u32 sreg_periph_ack_bit;
> 		struct clk_branch branch;
> 	};
> 
> But I'm not even sure that is needed vs. just putting a clk_regmap
> inside because the clk_ops don't seem to use any of these other members?

Yes, nice idea. Is it ok to keep the _branch suffix or we'd better
rename it dropping the _branch (and move to another source file while we
are at it)?


-- 
With best wishes
Dmitry

