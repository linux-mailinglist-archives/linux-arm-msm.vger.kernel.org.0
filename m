Return-Path: <linux-arm-msm+bounces-11939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6CC85CB0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 23:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40B73284275
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 22:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83326154425;
	Tue, 20 Feb 2024 22:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tB7ZgtGI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E352E153BFF
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 22:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708469139; cv=none; b=HqbnqPUzwteGeZJOprFgBGtmhvkMKKjEbYm9UBGLYbCWfiwQPG7DV7mZymW6UWsHKbxZPyVjdjDyuDPQeAMu3eaVzy6YzGvOWaGTz/K5BIDz3iyFSh5O8LwyXGoQVUFf5o0Ojt+WKIQISvy1nU0duK/0ejsgBkqQBqoQPsLfnx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708469139; c=relaxed/simple;
	bh=q9RdCg06m93tYC/ZEX+DeihLwlkQ7buG8kY7YIdjplc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUZM7cmW0j12N+dxJ8qzpbjOaJ520DZkwrHekq7GynJrnVS+QqJHLAnpJNs/zMfnYmYmVgnZcziVIS7yKDSXCxuHwLABzFXXPgfqhX0qOUuIKa2CX1wSGVuD1jCAQwRGUAL+i+HIw83y5Ly3prHO8NFkR4xHneuKNA+IGukM4b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tB7ZgtGI; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60821e8d625so29895357b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 14:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708469137; x=1709073937; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wyzl5JN8+bRH8SoabXDVr5mKJJXqZjqJuY8CXRYywik=;
        b=tB7ZgtGIB5LC5+2joPFQSl5nZEYZ6UmpqFNgBWyX0nJ3p5yzwGJk5L8+SLBkKZAnGL
         yU8t9rR9mmrfB6+oR8QUx6S0s89h0pDuz/3QSnx2+KuajULXCmNXRwxFNheldIAfgvhA
         UTf0xR+nq2IFamm/f+ynvSW026SvpkBszhjWh7oPsQ/Cy3pByMKEgHrrJZnlu1/1nuLL
         JNi/+HYWVBwur1iaLRdcYIL6PP3S46/QwG8KEc+3pi/2vkd9KYiYh3WPDpDnu/lqBcB0
         GuSkhFSeRhkT6/JM6ICi2R2lF7s4rdG7QqyR7SlvkwjRz9fEd3kwtwanS0+9oBx+edAJ
         OKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708469137; x=1709073937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyzl5JN8+bRH8SoabXDVr5mKJJXqZjqJuY8CXRYywik=;
        b=U0D2kvBhEM0x2twTK597X+izsIZ91RaXcP9a8ZezK32AYKTdTUuFSRVTZc/ccWm/b7
         cMTsQ4kTAoOO3IueIv/dxh4CQZhQ4Cw39ZDZjimPWEJZ4hGpkFQbMgh+BTVcTIkPgqu/
         HFIb5awITDpxIToF9WOTGhcYCTaLuFrOuTUtlJ/s2dhmkgkK4Eg0Ob0231cbrIrjx3an
         U70QIUJORw6p8lxl84aE/bVZPimMnpXcHmj4H9Mhvl7ypwXKWL0qOeRPJoMRaYrq/QPW
         Oii24YnToRYaVcWRCtFTsN81yywDHYWYYEpoVfmanQY41300i1BwMIaVKvuLs11f7Aov
         AQ/w==
X-Forwarded-Encrypted: i=1; AJvYcCVVyLe/YP+If0wEyO8K8TenbMM/br80rgoB939tRQKAf+cfNayBvFb0M6zEbPnUG0LuSW1yAcbrQwpWaqNEvpMYszE8lSgBQTKd4yTsDg==
X-Gm-Message-State: AOJu0YypBvG8F0cIAh48C7kztUbSY2/i0QmD5nsjLzkulOmOy/q0u9l6
	55eHWKCHxTHVrJfdFSi5QieSvjg1XgT/B9bn8mPqd4s3usQGk8S6HDNry8BYcXVibJWZAmgNEGh
	sGou+2qlXReqSFZaSCCh3kJwFokeDOkhrO0XlCQ==
X-Google-Smtp-Source: AGHT+IF+xIZ9uDKsFh6JgHxIqt3FqCkkcvbZBLqMVJBuLYitjFyRfjIa/li7CVOUGl10KAdra82TAbKJ4WHDuqP98HY=
X-Received: by 2002:a81:83ce:0:b0:603:fdc7:2f93 with SMTP id
 t197-20020a8183ce000000b00603fdc72f93mr17295904ywf.33.1708469136945; Tue, 20
 Feb 2024 14:45:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-phy-qualcomm-edp-x1e80100-v4-0-4e5018877bee@linaro.org> <20240221-phy-qualcomm-edp-x1e80100-v4-3-4e5018877bee@linaro.org>
In-Reply-To: <20240221-phy-qualcomm-edp-x1e80100-v4-3-4e5018877bee@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 00:45:25 +0200
Message-ID: <CAA8EJpp7LKRG2yr70+1jWAM9YHm+anfmeWmAD4cjxLq9G2qPXA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] phy: qcom: edp: Add v6 specific ops and X1E80100
 platform support
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Johan Hovold <johan@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Feb 2024 at 00:05, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add v6 HW support by implementing the version ops. Add the X1E80100
> compatible and match config as it is v6.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 180 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 180 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

