Return-Path: <linux-arm-msm+bounces-37366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C5D9C27B5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 23:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 734741C21514
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 22:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4241E200A;
	Fri,  8 Nov 2024 22:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hUaSoy5y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BBD1E00B6
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 22:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731105919; cv=none; b=mwutqMO3gk1vh+SWO8eDAFHgQPHWegfYUIuN1TZm+pduS674rKUHLOBsgUQQdrZF5qA69x19NRdIb1BacNzsJwSI/DRIx8xWyDEJYVLlHUuSjqrBUkbR2JtbWVWLebVKH2+RkxIQlHDBVKAJ8gBbRnw/0hdi0tLixe68RdRMFZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731105919; c=relaxed/simple;
	bh=BavrQDFzzrlWgiT5B+/qX43by6uGDYlkSI/1UzJVLrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=urmFLRaVP9y/q3aG4g55ybSOCVnxvWDV78ftukWbL67yxTxwog/hHohsWrKB2YIplX22TAx74ts+JkEOJfi28mJWtAJYcg2y8rIBlUeoMm/8c2/fDIwvj3P7TTvDcNqmA8FM6P38T5X90pou2CE1d991mfP1wmSqL0Tux6LTG5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hUaSoy5y; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e28fe3b02ffso2601380276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2024 14:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731105916; x=1731710716; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ufwDKW4XcMz+Ec+d5o/acjOdG+Dxgj/1/6CBL/TRtWA=;
        b=hUaSoy5yKV85TISUxaGNo5VrQXqn7i+KjH41VVIRlmgW1urUWNDWE5M+rYlMRHMEgK
         kJdzB7n3f0AA4wn4vrig0Yo5Nb/gFSyg0dmuwAAsf8lDzsOhUlElQba4iIJFQ+JwuR3J
         W/betgFDoJ9RbjZNm3UY1ct4Er5zx07FeuUM+y9ul00xdY5WQhD0XeoVnTD1CUVu8jch
         dUwuerfL90G85IuKDcmKc4xDuAIsSWk6AdmJU8BM1w2F4xTpOocHnfBvv5w3oFm0mnqG
         48q81Oj5m1PPUI91TuSa20jdmtsZERSO9QX7O7s0teA+aY6kBRY9MaAtiKcx+7vtF0Cn
         NMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731105916; x=1731710716;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufwDKW4XcMz+Ec+d5o/acjOdG+Dxgj/1/6CBL/TRtWA=;
        b=D4XEhbzLzBiGKOoQ6/vo1cMsY/SJAjzpcEQj2kbIlnV0Jt+S5RCqTwAXs+CK+Yms0t
         q1BdWqy3io+ajl+isalALRdcR4MAufpi22FaCgGvPDKkUuVpULZ8JgKSCm2Uk76Z2akz
         vaxl9pY7O+5z5ZVs3yzGfVRykugYxvhqoYbDGiQGhwIQHi5kTiH38V/xhTbseUSmiK9O
         Kc28Ld02Qc8EgGE5u4U5mdXlA7aD7VSa2bOjNTGLJeXFR6/tIZi04ofa8kVJyCnXwA6r
         EyewbfkAVhGNc5MCt5oHfCzTS2WisSlR+9DjqtzDmcwY9G8SifcpLctCYxbinv/HGhtk
         odfg==
X-Forwarded-Encrypted: i=1; AJvYcCUIrbMeLdcM31z6hPYDzYLqa7Gk/eVGgpVDYJT3E+7nmPeAM97AxZQ9tjZYQUHd5AIZI4o4f8ewyLs2182E@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz8wUX4++OvOepI9Qpple0sUDfyOkaqs5XCmMonJ6ACBxdu/jI
	0u0M0Jk02vOVr2QDcXi/bw8SGe/vSTWDC6F+plRDmy1gZbLIeINkUp25jXRlAftBy3/oDnkvsDz
	qnknLavBLKy38W2wQ1n0Yq8UpudB6m2bm9yfb9w==
X-Google-Smtp-Source: AGHT+IGVMMFgpkuR2thRDPZH1iZPEmk+lLe5r7P6Ak8vvtQs8OAmlyimK84GVoy6TsHBmPtnknQukf+VH133Ykjo9oM=
X-Received: by 2002:a05:6902:18ca:b0:e30:dbda:de2e with SMTP id
 3f1490d57ef6-e337f843d3amr4784672276.2.1731105916544; Fri, 08 Nov 2024
 14:45:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017-sar2130p-pdc-v1-1-cf9ccd9c37da@linaro.org>
 <t2trcojqskryzbuh6cbuqev35eioduarneskwtcm5aeeqlvbkv@3kj4x36ebkqk> <20241108211322.GA2849214-robh@kernel.org>
In-Reply-To: <20241108211322.GA2849214-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Nov 2024 00:45:05 +0200
Message-ID: <CAA8EJpp9Q7ZH3fdMsVgznp-xwUVN7EyrVPoPVRJ0Pd9Po7Anew@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: qcom,pdc: Add SAR2130P compatible
To: Rob Herring <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Nov 2024 at 23:13, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Oct 31, 2024 at 07:34:41PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Oct 17, 2024 at 09:13:01PM +0300, Dmitry Baryshkov wrote:
> > > Document compatible for PDC interrupt controller on SAR2130P platform.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> >
> > Gracious ping, the patch has been acked by DT maintainers, but is still
> > not present in linux-next and got no other reviews.
>
> Applied.
>
> > Krzysztof mentioned that the patch should be picked up by Bjorn, but all
> > previous patches for PDC schema were picked up by Rob Herring or by Marc
> > Zyngier (and one stray patch was picked up by Linus Walleij).
>
> My preference is for it to be applied with the driver or dts changes.
> For standalone patches, I only pick them up if the $subsystem maintainer
> does not.

Understood, thank you!


-- 
With best wishes
Dmitry

