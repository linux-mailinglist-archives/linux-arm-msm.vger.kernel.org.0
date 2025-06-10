Return-Path: <linux-arm-msm+bounces-60781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 072E0AD375F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E95889C060C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F282949FD;
	Tue, 10 Jun 2025 12:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dI+u6Ptn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ED929B79A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 12:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559331; cv=none; b=bQfXbv/3mog4fY6I9jCQKfg1mUycNIydxIeP6xORT078lnstv6hHJ8omaRs3HUZXfaoq/lNmXECh5Xy5TOJSSc9sXSaiOSiOdO9CIrF1nqGuLafVI8KC824gbvFYYEhqDlyRtV8KkiTl0bU+vc5y473BXosyhLURkgoYY9LecaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559331; c=relaxed/simple;
	bh=iKluIB/aogkNb4SsYFfMAeMNaCttGkx2Qf5lwDYT/IA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VUYGN/zf14t8n7670JvmtvkrcecdRhG+nWiLPYXHdkqgQudPcSEI5q511e/8QwtWGjdNBkTnH6hiQpTJxuBUQIJmAoCRSStN55KbLzUfJTmwLv13QuUhTh1flrVvVGsfRM6QWoyKcKBWtt4UFokuWt++Mr35/tzZY5XsPCgyCh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dI+u6Ptn; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32a6c0d613eso5240021fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749559327; x=1750164127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7892+96/YNyaPMEOcMkrUJ4mJoRZWMLEaU8stqv79JU=;
        b=dI+u6PtnPircfLGGMfYWHOL220vHR/2bSr5XXfsH0dXPKPLqVW7AZGWzWjRTrGbB2Y
         MexHDowTion1jrzR59fJ4SFVayTeMTwbI6ZsK2JUCQqw1K63Jo0ydLKFWc1S4NTr+51r
         +Uf2e6N4/vNS5ZxlzZgk6yrS9Jd9j2uX4en3mJ3+DRadWb5pR0xgOqD8or19GR+0mbNt
         FEizI1TB8ZxW8qpzV0clbLwA0rFXx50O6FS/6A2mBr+3FoJp0hsAbvLOp4F+tfi/FGKq
         hpPDmb5A3wm6nwJiBSwOi43JCOotLCR8RP6WSyaLWRzXmWxykIQHbPfYgvqCY5JDF6mI
         Bs9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559327; x=1750164127;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7892+96/YNyaPMEOcMkrUJ4mJoRZWMLEaU8stqv79JU=;
        b=lTAWGJBbSkbwxx79Wysi6vRbAlIvKlT+12vK1HW5T4rO5i8pLLZxgxSQcAhHwWF3ww
         h4/caWUAZkZi58gM2LVddqfCTDFB/bT6ia2Z6Hj1fNK8MTkLO2WI808JtjoA2TkJRpoc
         xBGVJ4t/JWxBLosmSqvzeB8vxojy9hlostr1nTkKrLCu2c1VjKN/+arlfHfw+5r2IDBG
         XKqyrzm46OmriudbWs5789coN/DBSTvElOyTPNnd+yMR08WP/soU/nGTZk8XH6RX1kQU
         rvjYTQ3xahOAbaNB8bnnofHN1VR5FW3wu9NEDKwy31Cboj4p3wRsd663OgkZGH1nj0vc
         Gp9A==
X-Forwarded-Encrypted: i=1; AJvYcCWTCIF3N4hVQG4k5nayLdZ4hXmUDe1YXnWTm3OISVhVdnsPkbs7GU/nn/GP/LuhDYDEmIypukKmRCWcCgL+@vger.kernel.org
X-Gm-Message-State: AOJu0YxuBl4iFtxo2zJi4PU3dET1Hyl6YzsCJ3tFrZEWfB6bpFy12xUA
	o7MeWau4yJl0y7EbR125emXkKV3+MhAy26kZ6BRNOTwairxaBtDyhRwPCD4gFYf70m8=
X-Gm-Gg: ASbGncvm9XKyZicSaFCN4wMBZWgI2rrIMbGSYYllq7BXSRBDj817GnTHFzjX5kKeAA2
	QiRZd3JGZJhIRJrz9KkmUHqorj/F2+IxlQB2rVlo1W3BVZUYj/74xI8fBpIzFdZL1qCcpDxlFvk
	GSGNenCwKz+M2v4rJstZnZDr52mrF5635uz9GhjZlWEtO5S0fVeR6c91YQWH7ys3Nez4Xmf7eBj
	77hGUc85c3NkQ/fnFX/S+UID8hLtznMw3IaYLOpE+B2nyi7hjLpD8onLPf0Fbx/vpj8uhZDTTgr
	5/k3onBugWibUxsWwC2ZCQk4nTNL9JOhkiQZ62Ev5ch+6/dsTcWZDPJftvvUrUho7kvNWKyccxS
	TR2acMxMARwlO2AHL4CGdDaRGdU2VIHntSsr2gjHl
X-Google-Smtp-Source: AGHT+IFAhNH7DEpOKaM2NRhWOMRt0wnPmUnBMxXQ+wBRObzbAd5OuDTUSptTXwysMUwvBMWR/vTvgQ==
X-Received: by 2002:a2e:a549:0:b0:32a:62a2:f727 with SMTP id 38308e7fff4ca-32ae32324a6mr16684341fa.1.1749559327097;
        Tue, 10 Jun 2025 05:42:07 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1d00c11sm13765191fa.106.2025.06.10.05.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 05:42:06 -0700 (PDT)
Message-ID: <26a0a50a-849a-4a2b-87f7-af11b6f91ea1@linaro.org>
Date: Tue, 10 Jun 2025 15:42:05 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnect alphabetically
Content-Language: ru-RU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
 <20250610111145.zp62zx5rjmezvmkb@umbar.lan>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250610111145.zp62zx5rjmezvmkb@umbar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/25 14:11, Dmitry Baryshkov wrote:
> On Tue, Jun 10, 2025 at 11:33:17AM +0300, Vladimir Zapolskiy wrote:
>> Sort the entries of interconnect and interconnect-names lists in
>> alphabetical order.
> 
> This looks like an ABI change. At least you should explain the reason
> for the patch.

There was a number of comments and notes on the mailing list that
any changes to dt bindings without users are acceptable, i.e. no
users implies no ABI change.

Also it was used as a justification to accept dt binding documentation
changes without the correspondent .dtsi changes, like in this particular
case. So, I believe the room for fixes is still open.

>>
>> Fixes: 2ab7f87a7f4b ("dt-bindings: media: Add qcom,x1e80100-camss")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>> Another fix on top of https://lore.kernel.org/all/20250502204142.2064496-1-vladimir.zapolskiy@linaro.org/
> 

--
Best wishes,
Vladimir

