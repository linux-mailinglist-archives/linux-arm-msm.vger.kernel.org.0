Return-Path: <linux-arm-msm+bounces-14504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A004687FC71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 11:58:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 553901F2162E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 10:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49ED17E58C;
	Tue, 19 Mar 2024 10:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="veDQULAd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD965474B
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 10:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710845854; cv=none; b=lMEBBQVOrlOAvaj0Sa+iSHWs4yXM6txM2kNq4Q+g3del8bEUpspbH61OkpwjE8Rk4XbwnqqWZ/UpKHuICGQcKiDAtSEw1q0rZx3axm01Z9fZb6IGeIwWyYU8YwGZtkAXrAF1YAm0iv/FkeAT8BlbiYVr2VI+Q2w5weY7dcuImU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710845854; c=relaxed/simple;
	bh=oXXw/gvNDIJo+p7Uev78+xvyPYbmSnlXcb4iuAFBVEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p170QvD9BZhSzHIX/3TOOVEY7H+hkQBQHz/LLwtSlNBW30wV1ahy8w3GVnrDXeCARp0VXmuANETY4g9HT1v4JUFHMEToPumieIkdc777IW9o87hX37iSq+3ZUKsaiLfnkEzky3q6ZX5UAuMV1q+Kf80KNWCKiEfTWOrSnzCCGrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=veDQULAd; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-609ed7ca444so49969627b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 03:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710845850; x=1711450650; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yaXfKEvmsikpUYVhti7jBf+oIo1Ef/uGnjoHrgljhJg=;
        b=veDQULAdNOtVZIGkn18eWwa14pr66xdlRGkEsaoNPtUK5AfQKezy0fhHsQz8hB0Haf
         S/DLrdYzvLevzVUVBxTNG+0FWBc9R+0+xZgbfGVp6+XGlRw8tM4Fvv5n+GN0kp4AXKI+
         /Tj0V1bD4pGRqooP44qDuSDbWVcNa5J3XnYmAqrdM5cfdpjfMBxWxgq6lh1qM41IShGA
         8M96BRbxps3CfZ28gQ2+u4esPaKrJ/cLF6qiK8LyqyAhhKoag2ho/niY/2+Gh6k8X4r5
         Ja+U6YW+Nsm3eb2kxBRlGq1O2jiOiilG7w9WD0B3GiIa/TkdtEMbFwCzQcLmsmaUfaqB
         glfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710845850; x=1711450650;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaXfKEvmsikpUYVhti7jBf+oIo1Ef/uGnjoHrgljhJg=;
        b=c9U5own87BgC0RmupHfa6dTMy5ESs9vte4/zUYKLsQ6X+uVaWXVDg3Ajs3rYeenoVL
         6Bb9dCWrkD6Y1Gje9r8DS9gfkJEknR2zlWdZYFsmPucu2nKtV3ck/yRi18AoTnlPfxJV
         1vC0iZmyrDLFyczQYPAJVpAYRamkd6FX9Vhs4sOvKM+QVRXeBbplJ8a3rt8NJuqKK38T
         prq4WeBknEm0MjsqLJFIMPpqvWw5WqRyvnLEU2KYOs1fGHG1AQuhBQjSFfUX8n2wAfCu
         azSA2o0cWtPo3sJMH0zWNMu3RXFNE56t+6ew5uLCItISZ5RoZyQhJxMdZ1evzVyPyP3y
         ubgA==
X-Forwarded-Encrypted: i=1; AJvYcCUFF8OtmMXMRVLTu5l1+x6nS70/D2sPxFN1u5msN5z/9/7DSs4yN5hDHssTtKKS1sLVYePmV7sv3Vu1zYFEctsc/IRWhbs5osPMRFzb8w==
X-Gm-Message-State: AOJu0Yze/Z7wgBfqLTBQU/I83q8r2QeYrKafFoKJ8pCldXMGlbqpodRU
	/2PrYP8gQykogrvQi+FqeiLo2tl/ZB0RsQ48ZuJviNgkn9798BFBB7ZSJzXEMgsI1bjEYXwIkba
	bjNLZwUxhZJwmnW+yxXVAu3bUFvT59UFKws7Vig==
X-Google-Smtp-Source: AGHT+IGqi7COQGg1nW1AorqoS0U2xxr33c95l/mHdFskUkowuQYfRthNAvwW4wT0aiSIUmSn5fPJUdBVgYXW4Pfrs+8=
X-Received: by 2002:a0d:c242:0:b0:609:e2c1:15d9 with SMTP id
 e63-20020a0dc242000000b00609e2c115d9mr12866447ywd.30.1710845850724; Tue, 19
 Mar 2024 03:57:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v1-0-926d7a4ccd80@linaro.org>
 <20240319-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v1-4-926d7a4ccd80@linaro.org>
In-Reply-To: <20240319-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v1-4-926d7a4ccd80@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 12:57:19 +0200
Message-ID: <CAA8EJprURpSEMkZKb1__bMhcXkKr-xyRzxFo0bOH=oiGYOSc_w@mail.gmail.com>
Subject: Re: [PATCH 4/7] phy: qcom: qmp-pcie: register PHY AUX clock for
 SM8[456]50 4x2 PCIe PHY
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 12:46, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The PCIe Gen4x2 PHY found in the SM8[456]50 SoCs have a second clock,
> enable this second clock by setting the proper 20MHz hardware rate in
> the Gen4x2 SM8[456]50 aux_clock_rate config fields.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

