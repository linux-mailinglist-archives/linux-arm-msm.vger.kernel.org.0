Return-Path: <linux-arm-msm+bounces-11818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E86E85BB8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 13:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3C53B235D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 12:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAB667C72;
	Tue, 20 Feb 2024 12:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FWVhMlhN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD9C67C67
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708431175; cv=none; b=KYk01yOgBrQimH0P7xf/1y9JtSSBRez4QNL8o+TOA5nuBAaRURoCVTlGecHS0mP9LMzAwEXF8pRWjSFANBPpVQEpPgJM4E25JA4KMyB0/CqPvsWPikMBJ7zbQpijHop6fpuzMgUB3S1Y7kMFnFWfAv2nic1tv3yV1+tUXEOJcSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708431175; c=relaxed/simple;
	bh=xk3aJYvUH7ummcRIbLiEZHE82TlzfaBE6gHzhdpzgcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mv7WBrnEylhL3K8IAc6kWj8UP/4Vm0JCBpmfIRrqVeUEltiRPPc1t9EylacEh3PGYoTkw0DnGF+EiwwmuF8YENZZQ773gl18zXwkIxVZthEWTNRuegtRsK+aqQKXM42J6tKQSyKgIrfqJ/u7dR+HfR+MRl767wmAt+WsK/FihOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FWVhMlhN; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6002317a427so43820657b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 04:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708431173; x=1709035973; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e6wTR0VmqItODr2yd8HndCQHY6rqvWA1sKIhl9SSx/4=;
        b=FWVhMlhN4rE9aV5P9cCsDPHzXOpyPbpXYkysI+LoL6y4i1pFdT2CoNLaPnILraRGay
         rQf/m/G4FfWdfcL1PUgrj36CGtLb1CN19ENiYMY+VXCbTPwSQuXy+O5m6z1C/ykoPYxQ
         mr++JRE8NuvfaVCqTzXMLzs8sQeZEBgyfBGE3vDmKHkD/h0XD0sMnavj44trCFQ49M80
         6ckPPg9KKWWIvqANU7dnA1iSWvT+1+oRrV7qnod9GqQcGj1zxj/KVauB8tTAoI9GQEp6
         n5YZ5nQ3nVuUvxZ7w9ONnfn7urGoTyBQWuGvjeTgJfdY9wi8NRpkqPZeKCb8nvRgwsF7
         QycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708431173; x=1709035973;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e6wTR0VmqItODr2yd8HndCQHY6rqvWA1sKIhl9SSx/4=;
        b=gSiwvDxNXXa7yp/ONrRMtSSPBE8ZZo1LxvayiQoSoBUH0k+DZog3aRA1Oel+fZ5CzS
         BtO5PacDAjhkLwzqLhrbTqGOAwGVevDThEUqp80MbO2GfduUoQDansWqkP1LE5Bpetza
         j8wkzIDLaAXtX0BdHSRtAojl1+mX76EpbJF8DTtCSd2pzsrTLY0BF7+ibp8bdyjl/YK0
         K0gFzpguj+hJJkOctItLVp7bILLJauFHeAftc7Ee77kabLncaOYsWXBhww37n3dL9LJI
         RyzllBDTgp/atZQEvAmci3RdsjIV5yP9L2BBHjWVb+rFNqZgkoz8y/05v238Nbesm97k
         45xA==
X-Forwarded-Encrypted: i=1; AJvYcCXA7o3TA+dY8aT0yCpMhuVusfj4YY+r3rDxGM6S95LZrFEjOPdRpuKwVG5pjldPVCBSfglpHelpigQVuA+TrBh+ziHt/pUjjtqHV0325A==
X-Gm-Message-State: AOJu0Yx2QqLniWVVkjVPqEu6lQ7DQZkto5tDEpQ0dRZWsxj2deqd3FHo
	O6U4sm4QEeQ9iZakGcOEnInwSPT/RFnYc4vJQ8HtjufMa9Zu+3ljuOcE3eVLJVw9eswMKyL51zb
	Kh6JedSXGlEyE3XPxBP86JAsHwBTC2LVfsHiX3g==
X-Google-Smtp-Source: AGHT+IE89QVyewZFZs3o8KYR14F/wdiOB0kpE6qbJHNRXT44hQTbwweqexbkQuL1HRYlWatO5NlcBcrvZUHtw5GjUgs=
X-Received: by 2002:a05:690c:f90:b0:604:9551:f595 with SMTP id
 df16-20020a05690c0f9000b006049551f595mr16185146ywb.50.1708431173276; Tue, 20
 Feb 2024 04:12:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220-x1e80100-phy-edp-compatible-refactor-v5-0-e8658adf5461@linaro.org>
 <20240220-x1e80100-phy-edp-compatible-refactor-v5-2-e8658adf5461@linaro.org>
In-Reply-To: <20240220-x1e80100-phy-edp-compatible-refactor-v5-2-e8658adf5461@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 20 Feb 2024 14:12:42 +0200
Message-ID: <CAA8EJpooQh0v3cvoum94J2AkmUgD=KEiYw6R=2=h9un9bGvc2Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] phy: qcom: edp: Add set_mode op for configuring
 eDP/DP submode
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan@kernel.org>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Feb 2024 at 13:58, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Future platforms should not use different compatibles to differentiate
> between eDP and DP mode. Instead, they should use a single compatible as
> the IP block is the same. It will be the job of the controller to set the
> submode of the PHY accordingly.
>
> The existing platforms will remain with separate compatibles for each
> mode.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 76 +++++++++++++++++++++++++++----------
>  1 file changed, 56 insertions(+), 20 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

