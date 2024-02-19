Return-Path: <linux-arm-msm+bounces-11677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7080585A36A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAD891F21FCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 12:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAE2364CC;
	Mon, 19 Feb 2024 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rU2nSJS3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E014136103
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708345856; cv=none; b=IkCFKdHiqt3//jiQA4UxEQ+u5PDu1XlKRhgnx3th5Wb+XZzxOIW2+tFY4iiWbTX4dHAuf3MFVVcSMikNlDImlMxyM2o6nW2mgI4XO/gfUh7ElXbzj2Rls52hSVtHSSRQu7KQyrPY8WnVJVedRQackpclDr/YSitf9CLsPT8ipnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708345856; c=relaxed/simple;
	bh=KzMN5s0W0W4B46qsjTNi8pJCSj18+qyM2fDvzC2hqW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qYks1zmvM5DSH0QmxD40EA+k7zrZlzNILbRNpfDZEb8pH72wpY86u3R/sLsLxNKlc2DAsjzQoy5PK5nuTzUWX4bOW9RTSHFy5EzHLXvIOJSSQuaNFqb5HzzFCi4zCNP/iOpjooPBcHcpl7PtFADO8Igq3iYkw0DkNTZaiGrZZqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rU2nSJS3; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-512bb2ed1f7so600223e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 04:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708345853; x=1708950653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyFhtEBfZ6PVssITkZfWZ/QQ+58yPncpMkJouF082c0=;
        b=rU2nSJS3UzqIbw/M/sdftcy7P8zPRo1rbSsV9NOqMZcLTRzx3DmV+MDm03QoaNqc5t
         aCyXSOOPoMKbqAWcfL05ABHd5SKfAXqYV1fjVlF4K3CXQyeUSCnxwQuYYmlYcPnhnMDa
         juKtPIBoFi06FhjdEI5MzMX5RiDtFo11RkVaBUqGLMzOxjz+NqTedti/WYRIymMXnA2o
         6lN6ddJJWWWroWYCeRD5zMugNaPrfFtFNMRIe27niX/9GZ8Vb6PKF3+LTYQQUzws3+X9
         9Ectv943VXHvEbvtEEcKyIHA4XSWeNHKddlo4H3rdtEiuxLSvrP9zoVSvWHmFG2UQz/R
         MoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708345853; x=1708950653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyFhtEBfZ6PVssITkZfWZ/QQ+58yPncpMkJouF082c0=;
        b=rBGaAWmkd3T82UiR2/DJwCyCqFHxpF5XHDZwjpimuXf2G+5MlU3FUcFqtIJ+M4t6IZ
         SkJPGJPk1dWnxNQflVXFMFInuzJFqKZutEJRCNbyHcmGDrhWWfex7UHkPyboN3YJXIB/
         xHSMXDVttjlIaQC/OOuFz3IELcFdh+OjFZCGX46TkhLjsou562RHEV+POnyruJPCk5U3
         vyGMuaze20PPyNLGX19XwHoq6UKfgJtyXfu27vzz5Yl6+sDAoztDvp+c+cXu9bE/7q1H
         KwkolS9yrUnxlvhTbncP2AVtF4R3k/396I61Oyjv0LRdz/Ze+Et0eGmSbnAz7/eUzIK/
         +WaA==
X-Forwarded-Encrypted: i=1; AJvYcCWH1h+YbYa4122sUNyO22sF6lxSxtB/tNwWTSAymS1JKkP6w5Iv7RCus9BVRiz8CPWfAW2mWrqIzsTkWLXMG+uQH4RBdYTZ5PCRP0eA5w==
X-Gm-Message-State: AOJu0YwTqFRG7vUSqQUqd18hZr8wPpsjDZoxSzjS0TdEo4IFPhvuyg2r
	BU+GF5nSiieGvbRPr0TLoTaDeg2Dr1z51DqnMiVF9xSTArZ/STo5LyydQwlVn+8=
X-Google-Smtp-Source: AGHT+IGorwPUbuwsMCHZHKYAUD0Xx6Q7OPT+kxAR+Mxz5tB71Zi9WymYQWz8IWVBfXZGUHC3mVLj7A==
X-Received: by 2002:a05:6512:239e:b0:511:697c:4130 with SMTP id c30-20020a056512239e00b00511697c4130mr11235415lfv.43.1708345853005;
        Mon, 19 Feb 2024 04:30:53 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:30:52 -0800 (PST)
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
Subject: Re: [PATCH v1] drm/msm/dp: remove mdss_dp_test_bit_depth_to_bpc()
Date: Mon, 19 Feb 2024 14:30:41 +0200
Message-Id: <170834569499.2610898.16035500222497589380.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1704993255-12753-1-git-send-email-quic_khsieh@quicinc.com>
References: <1704993255-12753-1-git-send-email-quic_khsieh@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 11 Jan 2024 09:14:15 -0800, Kuogee Hsieh wrote:
> mdss_dp_test_bit_depth_to_bpc() can be replace by
> mdss_dp_test_bit_depth_to_bpp() / 3. Hence remove it.
> 
> 

Applied, thanks!

[1/1] drm/msm/dp: remove mdss_dp_test_bit_depth_to_bpc()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/72b557c15956

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

