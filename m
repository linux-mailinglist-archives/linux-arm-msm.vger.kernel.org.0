Return-Path: <linux-arm-msm+bounces-12112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D4C85ED48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 00:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E072DB21B5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 23:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077BE12B15A;
	Wed, 21 Feb 2024 23:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S03UIuqp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6436912A14C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 23:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708559017; cv=none; b=Vn95yiMedULMio/Dh3VX3jk/v0kk103uthvjePQJ3XlsHPSz7Omu5hsX4wFpUAZE/mbFCALfRmt6zUM26FxZX1iBVW0rgHYhj8n0i7TsiIBtaxGhfGwPYIbNhn7mvwkZCiVOv9q/2Kb1LVFqVM77snrcwG6F8pr6Rd+89Y8S7zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708559017; c=relaxed/simple;
	bh=Ocajx83ibWHvbfJ1+CvYXV36LVgL6jeOfiN/sCyB6xI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rG79F3CM27IDgk/a/47tUbWFw3es21Aie+0C0EjVhc4SjdS2Ah3QYEuw/Cr58wk80QVM0W7A0EI8PfqSQF5fX2AjVI6q/9TyPCwQz8hKF0bCdg1vhtlF/uLQjQPTEtEy3aiomRD1baa2tsbd4wUaAfAAVzcckKULHnPtptJd8/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S03UIuqp; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6089b64f4eeso2217b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 15:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708559015; x=1709163815; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TeKcSZmt65tsmCjLBYpPtTH5m7PahVEvnN3gp1BBP6k=;
        b=S03UIuqpIiys+dttCDJwkezY4STNjI17OplyJisLJsOPfD/bTMpbJ34N2Ly8aMvO36
         3vNPNAtUd0f0hjdyMWDmWPOV9x2DNvAFjlgmyzd2plJ2F7Y1l2OVgK+YvmtU2Nf/lJNa
         6BbNmUF2kN2OitsZPv8OnK8rA+KD3LeU9w6L0VdH57neIBi0zjYkvFHUWNlDFtgQSwHN
         xwh/ovmHoeuM7OGkWu3+brjAca2PdRo7cbnomTzUtoaanO8RfPpM5I85vYJ7ZQyK+CHN
         QkNSYhkoqCi9yDOxW+Kf76wxo9hufAu8jryrbJvjWct2tlG0K19K+gP1XsmMAOXDCj/x
         f8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708559015; x=1709163815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeKcSZmt65tsmCjLBYpPtTH5m7PahVEvnN3gp1BBP6k=;
        b=TZWks881v9MTwbJSYHfSVwegNYz+3rYt93+uVDAa8lu3xkEghcotJWcqJvL+GCi9DR
         aYt+rcwWRbx4CXu7y6wsWhrxB8zyfyuYtLqgXUAGuiPm+mj0Zdm+pJUQ0lWlfIwkFdHd
         iwuqLdsr93q9Ima7Z358DFR9MZWviIatdH8lcHv9/mBER/Sc2c7OjkrFpKYfTb/cJMYl
         bKpjQ89b73W5g/nn15kZoPYplDeQz6qGnVk21bpX+VEs1VS1XzzhzWyq+aP6DH6Vg0P4
         oqDt6VsBTZjd5+BVpiZY2MEV5TI7FHV04Efxews5myNIY55j/HsAZsiwu8etXDA3tGtw
         SIew==
X-Forwarded-Encrypted: i=1; AJvYcCVylkihvCtP+VZWlFDhnzemw5wo2wAO4Dh4anhGwBPmi8aQ3xl5Qi7b+gyMFZVnAsUONlijqXB2ipY8EaSfwq7WCVYwZB8F3NcAhZsvKA==
X-Gm-Message-State: AOJu0YylHNr6v8mpUCSF0NkfeDBGOtRzKW8eWNdLi9q2QdQFsxpZbPgU
	l/EWBNrlzJc4nJWCOsL3fy1idve4O07ktIiTOUTasVPPeOgonedjDEUhO7290dW22v4N7+uwZxS
	wPxPI/aD4evcqvH98bCsUg+rDNDGiV6B7UdfvZg==
X-Google-Smtp-Source: AGHT+IG23RX3mHSoDqoErDFyzvZxTP87XzpGlNSEMdnMYBP/pD9KffhOLUtQrxf/OysVvdyJWsXBSnZq8SFvxdWTc9E=
X-Received: by 2002:a81:7e47:0:b0:604:9232:9df with SMTP id
 p7-20020a817e47000000b00604923209dfmr18226833ywn.50.1708559015381; Wed, 21
 Feb 2024 15:43:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com> <20240221-rb3gen2-dp-connector-v1-9-dc0964ef7d96@quicinc.com>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-9-dc0964ef7d96@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 01:43:24 +0200
Message-ID: <CAA8EJpq7yhbyoJHsRxdek=3XJ154nt+e5OLAE9ucPV5p-FOrEA@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm64: defconfig: Enable sc7280 display and gpu clock controllers
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> Enable the SC7280 display and gpu clock controllers to enable display
> support on the QCS6490 RB3gen2.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

