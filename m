Return-Path: <linux-arm-msm+bounces-30827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4271496CD55
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 05:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3E83B23465
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 03:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FB414A0B7;
	Thu,  5 Sep 2024 03:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZRh5Rf3w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAA0143722
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 03:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725507224; cv=none; b=WQjLxJqXkx6U0FqX0O+EZwSfmDXbWNXofOoGF9jfc9iF/9ZPgQqIub+4ZJ6bl5iMSHsH4F0SdW6BiNX1Lg171Xsot15ykJGjK47ZZluOy62GrL8HzsHRXfz9mjmDk8d5jqd1OSpMneliSz9t6+S6UTpUj05X5V7IHkkYN7BqHmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725507224; c=relaxed/simple;
	bh=3uylGRMnMHHB5thN+jMPYIiN8sybyqQguQ60rIY0wSM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aCQy5JkeX+uvTxJNOSYZpbl1RM/E4pdS8EaPZPXbekV+3Lq1GTWtcuIvyOsyca0Hj9haEB8sKtbZsDAi7tD9H/+0qYG8FKCK8IUy8mCp/1XCGWypvxAhvTq1HPN8Fc1Q1CVj/RyL4G223kj3HtJxr+036eufO6kSz5cDFV+3bns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZRh5Rf3w; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5343e75c642so232437e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 20:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725507221; x=1726112021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aqec3x8yKQ8GNkqH8zbywynntlgO/egZS4W8KKVbNqw=;
        b=ZRh5Rf3wAB4tkLXY4X7Uhs0UC4eR2ID6HtSE25iuBF35x9AJp8F73UCaKtCkfv3jDN
         WLZMHIVd1nJEzMOPjDbLFwzHMTuu5L1kFOfANc2xMnbTJoyKBOG38pypjM+gAD2ijbh7
         Rsaw1wTLXdBxY1PLqb1Qj8gAXuJsEYr4J9aFfTRtmWsr97CBAPJT+f1vMFCL59WxJfxL
         tWe2XUwryLQdl0cYkzdzLgfQo2Uv7piBDud83TexU26lDxA9KmIaM0cfK8ap9BVhUDbi
         iSsBw6rCrbWBVgj3dXuNAwR43ZHwzfVyRDToGDp+i7kx1jkS2qPdkx3Yhn0Fa0kyej0l
         jbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725507221; x=1726112021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aqec3x8yKQ8GNkqH8zbywynntlgO/egZS4W8KKVbNqw=;
        b=R9Y//m1gvJm4MbhHLYrEuTRKnUvkx8y0GNLm+KWUFtTzCDKQcHSGWmwGyGDyWuMlxj
         EVO9tSmY3hlSjjMNwGcQ8Zkes91edqjyTGR2794Zd9u51c8/IcdNAw7LdtH19WiD3ia9
         5Lfi+StJtPSgi1i1/YuAEKi64/UfKSAO22+trLgnty9ThDwiMXTRXP9quX0xNptEqaiQ
         mGnWaSAKbE8OzZlxWguJnx3VyjZEmhst4f+fieYwGdCEB6yrx9WhvEMLRfgnjeodbbhh
         9QZBIPL8wdUGrOIWmiEyUZNg/dnhjnPRvoNALFjva9p80O+Zo/Ujlf4VR0h07TNNKS2z
         Dc+w==
X-Forwarded-Encrypted: i=1; AJvYcCW97pd3QwlX2GRdviuFBhuCAcf6Jb8AWiMI9XBSV0Ks45H3HCWRb2jc0MiwwDPMgMRGbvPZq90wB1Rx51aP@vger.kernel.org
X-Gm-Message-State: AOJu0YxgISoTXrRojD9Gg7KK6VjZcz258ZaItgA1u63CBsTuOD0cFMR6
	4xYHtyEx760m2fYt0HUuMSnf1xm0QtDEogIOTbVisrK6wzCOaI+DA1ctjEEOXpE=
X-Google-Smtp-Source: AGHT+IHwr2P89i+YoHLpfciOuqT/Ni+vf4PPY9+DaJVEGxa0pgv2FB8yOQMf3G/eqwSKdCDS2nyzfg==
X-Received: by 2002:a05:6512:3e0d:b0:52c:f2e0:db23 with SMTP id 2adb3069b0e04-53546ba07ffmr12737991e87.40.1725507220865;
        Wed, 04 Sep 2024 20:33:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53565f6d409sm389165e87.35.2024.09.04.20.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 20:33:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3] drm/msm/dpu: Configure DP INTF/PHY selector
Date: Thu,  5 Sep 2024 06:33:34 +0300
Message-Id: <172550712143.3299484.13998129049671917393.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625-dp-phy-sel-v3-1-c77c7066c454@linaro.org>
References: <20240625-dp-phy-sel-v3-1-c77c7066c454@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 25 Jun 2024 23:24:58 +0300, Dmitry Baryshkov wrote:
> Some platforms provides a mechanism for configuring the mapping between
> (one or two) DisplayPort intfs and their PHYs.
> 
> In particular SC8180X requires this to be configured, since on this
> platform there are fewer controllers than PHYs.
> 
> The change implements the logic for optionally configuring which PHY
> each of the DP INTFs should be connected to and marks the SC8180X DPU to
> program 2 entries.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Configure DP INTF/PHY selector
      https://gitlab.freedesktop.org/lumag/msm/-/commit/be3415c620d1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

