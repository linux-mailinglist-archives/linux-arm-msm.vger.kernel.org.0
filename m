Return-Path: <linux-arm-msm+bounces-10511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1068850449
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 12:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EE0A1F2397D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 11:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781DF3D552;
	Sat, 10 Feb 2024 11:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="neiCbBrU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57413D54E
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 11:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707565890; cv=none; b=dz4FDlgs95znTlaXFlB1DdLhjE3yaHYcVc/oDEE/a6SRZaloJ0l005BP7jYBK326q59FptngR3sMic9wEqqvVTqqPOPo4pHVgrzOQdWaVNBgDRAXZR7h/UPL1SHC7Y6IzSIKhFlT74c78FUST0EKEo+L5fVkEabF1P2H8Bv2pvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707565890; c=relaxed/simple;
	bh=d2bhTf4Z57WSx4lUzzEf8y7rKj3Hg0um3/bM2pKPVCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9w+7yFpm7MpVl+UEIUNc7D4IxLguP4cI/XHf2r7kFxKgMhNEC/kBh5Ly14OpOJ8cvli8rPAQkkQFfVmV8AxP7q+SJXn/Ma8nJvXFxS7MuULpSX4QNmWi6v3ua7Fp9+SOdRj9MhJhsSd0rWwAZ0ovJfmnpVzlwKscsFUh4Mz0g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=neiCbBrU; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso1835969276.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 03:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707565887; x=1708170687; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n4hzqQK2jDc7gwYXhpJIcj9gdQgitPUMD4wx3zzHzg8=;
        b=neiCbBrUQyJQ/QNNTUBuVi5wH2JMVXcM8/83ZSn7a/lKETQnwkGvV9311cV6YkDMgZ
         7bzvkG3v19r1q4i+SsCqS27qL6RMMA+zQLLA4Ah7YpxIlBcxjO3VDyMJPAyIL5HvEbwd
         bN9RuzdeIlc/jSRNH59ixi72b3JEQ3lZsYsA2FWDDr/hAjpWDbtWPiaBDmUyKR335j+J
         /o4BfHbhI476O695g6wndimKRwS4Cz6Xe+oMg3ZUAUfapwrCe/SXrKFRkJo3qizC/BnQ
         a3QGEMXS3z3LC6nR7HBTayrqWLdp52z0yqQ7NdWcrzeUfVygnGRRiQLB58A4ZCQFWwAJ
         6OkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707565887; x=1708170687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4hzqQK2jDc7gwYXhpJIcj9gdQgitPUMD4wx3zzHzg8=;
        b=pEnkju37ctzBrZaUeLSjGC/l5Gy5S2VA1Krp+PDNCDQGTRlsaWGU8z6EF2nCUxHYcL
         qic8IYU67aet1qIHETTAN6k6qZpCcimV/Rn9ejHnTAkZrCyTYhX1QTknG8txmh3OKlnu
         wxSgiU+kTukxJqWzmkkWa8eCPRD0KmuoBWjSkQtsMq4QFoZqg2cPe6WAZnmZ6ePWXcow
         ZQ+ZQ7pWFgMIGhbwGGcpr2UR43x7wq6lfJfwP1tWldlU/UO3l8vyhePkvSDDXck05wRX
         Wge/2+9uswieTi+2PHv+VLcm3A0rG9lD5km+Ai7XBJ8BJzcknIWqHB8aRSLQXAcK+41n
         P7qA==
X-Gm-Message-State: AOJu0YxTJuiNt62/r5Xe+qAM42VWEGSI8tihQYIBfITMa7RIpGpwwkXW
	UieyNqQ6AXqoNTESPLPBz8YkGtdmyZlOu1+3LVXjQiGzOMZkgYisEB5eerak4pNdJEgpqrUqenj
	tngtb/56Gh6wBwW7zVrAs1gw6/wDrhEQ+oE/lDQ==
X-Google-Smtp-Source: AGHT+IHmuc9OItSNKtDEBBJS+z3L3A0n3p2TRNTXhKRlXEx8mZXeoTapnJ3NEc5+DGezVvje2FB644OYHRQtnMjnuYE=
X-Received: by 2002:a25:ab8f:0:b0:dc6:ebca:c2e8 with SMTP id
 v15-20020a25ab8f000000b00dc6ebcac2e8mr1458918ybi.5.1707565887676; Sat, 10 Feb
 2024 03:51:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-20-swboyd@chromium.org>
In-Reply-To: <20240210070934.2549994-20-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 13:51:16 +0200
Message-ID: <CAA8EJpp2wqK3vEkU7Y3BxUKsSn11B0-X7LNF-w+sJ91bPTAVhw@mail.gmail.com>
Subject: Re: [PATCH 19/22] arm64: dts: qcom: sc7180: quackingstick: Disable
 instead of delete usb_c1
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 09:16, Stephen Boyd <swboyd@chromium.org> wrote:
>
> It's simpler to reason about things if we disable nodes instead of
> deleting them. Disable the second usb type-c connector node on
> quackingstick instead of deleting it so that we can reason about ports
> more easily.
>
> Cc: <cros-qcom-dts-watchers@chromium.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: <linux-arm-msm@vger.kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry

