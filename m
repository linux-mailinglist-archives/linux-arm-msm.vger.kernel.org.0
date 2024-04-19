Return-Path: <linux-arm-msm+bounces-17983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E418AB4D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 20:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61706285B06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 18:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D547C130E5E;
	Fri, 19 Apr 2024 18:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfetJ4Ni"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629AA13AD02
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 18:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713550340; cv=none; b=fwtnCIWhBL7kZFSpEH/HYgFyPHXHB2g4eULFa9fsPdwxDARL+aACrgwzdZa2kFDmY7RE4hZRDsvKqeQQfLBe/+qpZyrs1ArhepqOm/DzP8Df7Dj8IlWCSiCzOpVCef1rsR/hYlxQRMABtVNTTPS/+WM0hxR/Ar7I0t8qvTJBdFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713550340; c=relaxed/simple;
	bh=Wz+7M6kLV5/j49HNQftiuWnlx11DArswdMRdOqQ/jc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Glkxxf4m8teVxar6D5AXwsRK+3/mfvAndUN2KzNTRfeQm+GN9JZWPu8jrPAS+DCQ2B5O1u134Rnp+kF5XW307H/oTYljq5LnZIW4mINzE2aEg4xNsZGTDdYpqaitcBCmPjDYVCFSxGUhjNE6ocoRrBvDO4P/lEKwegL35AZVz2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfetJ4Ni; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so2583865276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 11:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713550338; x=1714155138; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qOPICZmb4msrHYUkaQcpA3qKXuhnZGxWuMEasDEx0MA=;
        b=nfetJ4NiMriS8KFIu7znDhCUzNpTirbEaEp4dZzKyLnrzO/lkXCkw4XEo6N1dNI/zx
         R4EdbvKLluwQRepP1AxngCUpW/pD5xBYvQyAZazmQkVJ2M36rmAbEhdd/iq2wKmWUga8
         jnlwYoJASHcXV625aURO8JOx3pDc17PyI23E4Zd6TOdbeE4llPu0DpHBVgbRVU5K7AYn
         rJmbrK2vcJErLbmyv55rfzNjvHXgNhq+CYWK81Z0hskB26xhdkDgSnvaS4DSks5XEUYV
         gdO4YfWKthYLdYx6Es0Z0vchuJETR1qfRQf7IZ8cWUD96wz3zsbT8XCgkBHvxT+4hFPY
         0IXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713550338; x=1714155138;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOPICZmb4msrHYUkaQcpA3qKXuhnZGxWuMEasDEx0MA=;
        b=uClWys7OcHZgVeSuA4y1UFwabZaEcm/rwcuSBwTvjXtM5ac71dREj8BE8y0RKbD+QF
         v5mfAbtedu9mib1d+NwQ7/wpVFF/9m4Kdmv8xatJILpMoZ6gp5FBxvm+RaEFpW3psYQO
         eMTHSOCGuA49lDydDgkrbEfhtQ7fC3EhvoT6s5Up4TnegIQyXaNnnW/1o+2THlhgDXZR
         gIhHdLrcEg1qEuSPKa7mPuvAY0wMAJkgGk/Bv0T5ERaqbPgI7VCvcSou7r1kWVUAszoG
         uG5/2kjki8KrOU6P3ZdIyUqSztot7wgExgab1p/ixiRWScuywvIALTcNAJhlk8YwMJoM
         ppfw==
X-Forwarded-Encrypted: i=1; AJvYcCU9YWRG7IxlIMH4hbfpxMmE3P51DNRNDc8ibimZQe2tDVbtIPka7ze1yuhv57/VXMIPHb0O8awxU8CwSHwM7QyUK3olqt1/tGHxERkFnQ==
X-Gm-Message-State: AOJu0Yyrp5A4ZBhFF0hqBvIR6X3Oip4xhhVKKwuUihbKBZbphRoA1SEo
	jbNEutRg87mnK2pqmiiEm72x6Lrl3zO+cJL8i9rtsbRJHtUlfIiLEHeCr1amaW9/+CSvuUeIAmh
	dhoTSW2kqJYPSkrw/niUUN/mnRIrECF9x1KZbWQ==
X-Google-Smtp-Source: AGHT+IGxhkLPIsofUv6p/cU6MHWkhFG1QRKjgtI0vTLgun0UHmUTqcgaXxpBHh1DwVbCWGl418JAxbU/8nZLjPJmAms=
X-Received: by 2002:a25:bc85:0:b0:dc7:8c3a:4e42 with SMTP id
 e5-20020a25bc85000000b00dc78c3a4e42mr2771282ybk.30.1713550338352; Fri, 19 Apr
 2024 11:12:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419-x1e80100-dts-fix-mdss-dp3-v2-0-10f4ed7a09b4@linaro.org> <20240419-x1e80100-dts-fix-mdss-dp3-v2-2-10f4ed7a09b4@linaro.org>
In-Reply-To: <20240419-x1e80100-dts-fix-mdss-dp3-v2-2-10f4ed7a09b4@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Apr 2024 21:12:08 +0300
Message-ID: <CAA8EJpod25xV_0Mdx5vipaggpu74+NWrDdQOFD=wT6t6Z-sEAg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: x1e80100-crd: Add data-lanes and
 link-frequencies to DP3
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Apr 2024 at 19:14, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> The data-lanes are a property of the out remote endpoint, so move them
> from mdss_dp3 to the mdss_dp3_out. Also add the link-frequencies to
> mdss_dp3_out and make sure to include all frequencies.
>
> Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

