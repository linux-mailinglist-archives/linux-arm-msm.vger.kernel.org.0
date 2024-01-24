Return-Path: <linux-arm-msm+bounces-8101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 281A283A3B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 09:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C14D1C225BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 08:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3650A17548;
	Wed, 24 Jan 2024 08:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nVK5oPfz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADF4171D2
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706083689; cv=none; b=XsnJ7gdmEz1ODAzMT0pMwwgO5gjsYxTieYq0yz/wpfDCuDGzLdTfMF+AcE5C2pv2RVovNULZuVCaFXGlrltG9N4y8piJKSiCs6mV6+wGPb5Tj/ViJWd520DdlV8sRuUTzMWXEBwehiGJeqsPPnUlNE2oPRQ5RoFSmlIYyaPcU0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706083689; c=relaxed/simple;
	bh=91SKWZKxZZJ9JjqBsEeN2LxEmIvX4sQqPRYAQaqFWFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ED2A7ym/jVzo7MdIQBprf+eyoqXfAocVm1gHIB1orPSqxtG4RrDssXPPrVIZQEy7JvdPSrTydknqqMrVb1aVK4UUWQwQFoUEN+Le27MD3sD8JcNvgTJA5tKr1cHQlsC603HIPU20AxzZfpjw273+ca5OJKVL3yO5XAQ6MNwhsuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nVK5oPfz; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-da7ea62e76cso4243680276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 00:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706083686; x=1706688486; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2oicDxJ90c/wDJuJ0lxNnczG+6khLtrNzAW2IGNICIQ=;
        b=nVK5oPfzig3WsPDO+hAml4Kdf/SzPC0EMKjA6TIbVgAjx+vUbtCV54PVybfwapXHvD
         cGsT39mZjYQ4MV8gPM9TTVBu8QBZhs9jVJvVYGHWtF0T+hN8IxuXSb7Rvw9htO9fTvbc
         wuoK5cBMk9+64KENbLpLLI83JQK7eFbnIzG8wcDeVUFHVl8y+SwVh8AbL9WdKleB8hD1
         QWqaluE1OT2ejxcRHJNvrjgIsV4OokG6RMMlXGxCJvyG9/GOBaITIJ2iS32j9s6Pyy8w
         A0IH9gTyB6yj0uEdHGkcoXYaz1e3S5grxwNzBFoeAtx8ZOanPuxcm6d1tXifljtXDgJh
         qTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706083686; x=1706688486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2oicDxJ90c/wDJuJ0lxNnczG+6khLtrNzAW2IGNICIQ=;
        b=VYk90KfCr+4V8IXIX31oAe6R8mj49GjpN0HcCclRoN8i9at1GWByh+cth43BDBD6R9
         1ddm+ooDSt20rmjrqYJmM7Nw6ukyhgDTs0e2g7tRVZKLtaeN5GsSY6ON+LHnIOkx/XA3
         eUFXDA0kdhUXKAgB2sxclAayRomMo3IQvfWTC0EEASqwZlDNYvIlTpe/0tJBSyxaak6L
         p4YF9vI6KfFi64k39V6YJJNIq78g0aaxwttGN2tT7APwckfP0p+ysdn6I+wpzp46pAj9
         lx9JVreWphf7U4Au25XE0yuZ+1WGkGtezZ+PD8DhCWd+g5xlPER09W9X8jFoASd4fwe0
         VWUQ==
X-Gm-Message-State: AOJu0YzR76cMn61ouny0HRJTe0DRuDVWXAwE1kt6Mh6rKYOMNyJSP73A
	SLmDnfasZ7mJm5FDuHBrlLrUDlqe7/iZCo8YjFOnS+sYCivm6FUHQO2GW3EdR0qI91/y4GGuRHd
	/jtZMQPkmONL4yxfnj2h9AhQoZBp8uUin8ouWTg==
X-Google-Smtp-Source: AGHT+IEBx+hbv8cP9QQzl1nlNfUSW8zsGd6/0L2c4D7VdKAIm+FH6gkg6c1ug2KhF8rkgn0s4KWP1B+MHSfUQwurYAE=
X-Received: by 2002:a25:bfcb:0:b0:dc2:303b:db2f with SMTP id
 q11-20020a25bfcb000000b00dc2303bdb2fmr308783ybm.101.1706083686675; Wed, 24
 Jan 2024 00:08:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124023305.15755-1-quic_tengfan@quicinc.com>
 <20240124023305.15755-2-quic_tengfan@quicinc.com> <88e8cffb-024d-4f4d-ba1f-e0be9ee85e31@linaro.org>
In-Reply-To: <88e8cffb-024d-4f4d-ba1f-e0be9ee85e31@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Jan 2024 10:07:55 +0200
Message-ID: <CAA8EJpqXS97FXoTwiLaSeHHEDOeBFRPRbCNR6WF-ArDm22tu-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: modify the wrong
 compatible name
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org, 
	konrad.dybcio@linaro.org, linus.walleij@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Jan 2024 at 08:38, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 24/01/2024 03:33, Tengfei Fan wrote:
> > Use right compatible name "qcom,sm4450-tlmm" instead of
> > "qcom,sm4450-pinctrl".
>
> Why do you claim this one is right and other is wrong? Provide
> arguments. To me the compatible looks correct.

Yeah, but the driver (and the dtsi) use -tlmm


-- 
With best wishes
Dmitry

