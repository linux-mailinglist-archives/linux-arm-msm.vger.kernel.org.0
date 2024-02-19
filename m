Return-Path: <linux-arm-msm+bounces-11678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D110585A36B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C93728384B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 12:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3717F36AEE;
	Mon, 19 Feb 2024 12:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aEfkFnJw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DD336129
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708345857; cv=none; b=VMyMNG1GHdujTfUAD/2qvM1lsrlhpaAUjkG3PWMWKd0Ca0objZvokkppbWbIhdt67zdfgn4RbygEMotSeB77lDFi6kgpml9r+THFCjDEqa/dft2YyEStGL/Jcw0qms20QgWprylcDEcbSh1xASGCJa91PXO7+bMta3PzZgFYII0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708345857; c=relaxed/simple;
	bh=HJLsuQ/pmzf06Y+BQsmCZTQ3R4vOv9LHvZSzf3q5pGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZBFtC7GgzsicTF3nephem+HKei7RbTRyscRmrSyd9YSCjRgXirMSvOEh+FLTvLcGNXOJtlCWo7brUNz5xCi9zrleMYZwbJd4pPIiWLTJ9nScmPUxWgLBSU14UhTMD9vVrqGw8+Xz9avAvga3RlQJIH07r8upAR6xp1ANh0L12Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aEfkFnJw; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51294b40a52so2433880e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 04:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708345854; x=1708950654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVcz4T5lUX/p2dpLrBnJfdqrXGy/EYfTfCTW6sdiHL0=;
        b=aEfkFnJwUwcxYoDJUXyI73ePv6Zv9TnTF31lM9l+Kdo44cLc0yzogczJf7atLl6rn8
         55ayhFuE1OY15+A/I3WHKMOb7oIhIOzhLM+mFlnz9rT9cgGBO6M+i56BmoPlVyOc67bF
         ViaS8+IuN8RbtfaPCHCxq9jLtJH7JrlSpuH+tTi4FaBIC5nZAVQxq9tHXOlnw6oSA9kV
         FJaXSBnII1p6LgfAAS6NUn+laofH1uZXL2EcgU5Zqwt0j/ae65j6xjdmWBnlevTd8eAr
         YSJv4pC6Ut2aWMDcgGjTwdnWETaYEYliCXxa1uhxNPTCyCDtePBaxKqangfVCwi93nLR
         We6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708345854; x=1708950654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVcz4T5lUX/p2dpLrBnJfdqrXGy/EYfTfCTW6sdiHL0=;
        b=P1k9QpwdoqiOIOT3ldF2rAFjfuKq0uUfWztpFFdTC7M/5wXbgPDYlGwafStJTtFNrG
         Awt+DL/orhSaBslyZGImzdktXJDcrzJ697XVnz+9WrULlqw+WNz6dPUFncRgAShTOSIj
         HWxX0cSxxLRwxTUTjOj3iYLiDNumHadSFquMt6e5EB2wnfdfLVzf9Nc6OOGR5wZpNn6P
         f/4HvLTNPb7ysuZgA1ya1bxaBkqrzyGVW4M7nDM/cg+eeBGS6Qe0xdqqv0txrcwBwXCo
         IOQuoL+khz9hWjUK0yvm2dwUvONYuO5EOopgYcEbK3zwJONm4mq0DIgFDPwHkVf5TOl3
         sLnw==
X-Forwarded-Encrypted: i=1; AJvYcCWHjzB8QQXclIxtK5c4aph3rrHjNR/bdl0AvCvMWSj82+0Bfh+myICYcnQLWmnZbsrq/x5ChkRQQbQDYXghx+bLs61ssJqoinNHHUdhAQ==
X-Gm-Message-State: AOJu0YwYD9Y++jNmoiQXzPOi9ad1WnWcTuyQ/wC+HulJyR0eori+SaNQ
	ucpmALWg5vgSwUQOwj0Igkf/H27HjHWm/OpHuUn7Vw0Bns9AaVDxIGb1nDpFXz8=
X-Google-Smtp-Source: AGHT+IEPbgwbriAHQa/3aZrBt+n+k4H+sVUGdpUdH32pyxMo7FQlMDDN6LMaGZPj9i2Wa5EUvNTXvQ==
X-Received: by 2002:a05:6512:3b1e:b0:512:bccf:eb03 with SMTP id f30-20020a0565123b1e00b00512bccfeb03mr498859lfv.26.1708345853805;
        Mon, 19 Feb 2024 04:30:53 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:30:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	robdclark@gmail.com,
	sean@poorly.run,
	swboyd@chromium.org,
	dianders@chromium.org,
	vkoul@kernel.org,
	daniel@ffwll.ch,
	airlied@gmail.com,
	agross@kernel.org,
	andersson@kernel.org,
	Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: quic_abhinavk@quicinc.com,
	quic_jesszhan@quicinc.com,
	quic_sbillaka@quicinc.com,
	marijn.suijten@somainline.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] drm/msm/dpu: improve DSC allocation
Date: Mon, 19 Feb 2024 14:30:42 +0200
Message-Id: <170834569499.2610898.923684601788968526.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1702580172-30606-1-git-send-email-quic_khsieh@quicinc.com>
References: <1702580172-30606-1-git-send-email-quic_khsieh@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 14 Dec 2023 10:56:12 -0800, Kuogee Hsieh wrote:
> At DSC V1.1 DCE (Display Compression Engine) contains a DSC encoder.
> However, at DSC V1.2 DCE consists of two DSC encoders, one has an odd
> index and another one has an even index. Each encoder can work
> independently. But only two DSC encoders from same DCE can be paired
> to work together to support DSC merge mode at DSC V1.2. For DSC V1.1
> two consecutive DSC encoders (start with even index) have to be paired
> to support DSC merge mode.  In addition, the DSC with even index have
> to be mapped to even PINGPONG index and DSC with odd index have to be
> mapped to odd PINGPONG index at its data path in regardless of DSC
> V1.1 or V1.2. This patch improves DSC allocation mechanism with
> consideration of those factors.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: improve DSC allocation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/858ddb64f1ff

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

