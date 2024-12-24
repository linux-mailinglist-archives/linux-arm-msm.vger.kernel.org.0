Return-Path: <linux-arm-msm+bounces-43277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBCF9FC246
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 21:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 173B318842A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 20:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9803D212FB3;
	Tue, 24 Dec 2024 20:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fBR2J6hf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C2D212D8C
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 20:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735072873; cv=none; b=AFSAuDI4Iq0gmGrFCuDv+mpZSi5TwmpoHsYT/U2aF76qwI2PIftKU4DFWNmQKUu0AxkzblLaGVEf9LBReTNlcrKMyFXwMNSF0BIl2gSG3IdtEOI7xWcdz0DkHOGMrlWYKcNvkOyUlV5mPpQQTHXlMhKr2wdViokwG1YEJYC/y9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735072873; c=relaxed/simple;
	bh=wKJI62WtylJiSTfjyb/0k067ZdZvQjezJsfbeXEKYTI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eeTJ+CH/m0kDu25icpOJXih+EgjZ4z5yJiDznU/hh8nN7iN41xRLVg24l4h4VJPH+no+tTsVJGyu2rwcKwzA+YwRYtol5o6CNZ9sIN+UwIYN1GR+5nkjucLNCMhj2sxOO3ynn3fZ23GDg8KGQIfJm+1Xnbt9AhN4SmpqA0Ox19E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fBR2J6hf; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30229d5b1caso59066191fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 12:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735072870; x=1735677670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJtLBAKNWX9SuSyfWJPwd50DWzglHV0KUPjPlwl/9FA=;
        b=fBR2J6hfTQoj1V5Gat9Rcsfkw8tEeujIXLJVUQIB/Lc4FF3krBJAB3WQwVoOnkHjYx
         mtIDkf7WgC5+mIEpAYIbhDvV6dmH27C7q+qAAMjNLLJWEYsPei+MN7p2hytyx8yyDVG5
         r99HAVCwTcbZK09zunEELJGDRUeQPiubbBn2VJxanQMJhHC04D4TtGR2YLdtz94cBmLM
         uXceCVWlo5hWcc1NHyhJSuz4Q6CNG2+7Ix/9NNir0undqk1OYpFZelEFj7YYvo6bMkAc
         rLMNaFxToalO5Eo04ob4/+PrKcIERuCtRN8d5t+p79jcpFyAHgFKudh7TxNY5PEYmWAU
         uy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735072870; x=1735677670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJtLBAKNWX9SuSyfWJPwd50DWzglHV0KUPjPlwl/9FA=;
        b=nAirNlbp+Fi4QP+mqQWntqTZj6FOFsKvtkLPj6+OnBd42UEL5lcGOKyW2iV1pKJzrM
         KMLqOYSHBzWxUoQvFiKPPRFLRH5AU8VHV/BKvfSE+SaB47/Ix5+cJ6iS+tgFlQ0WukXO
         +H1WQ7JYX7ORve5YQqQFUc8sPaBtWnd8wngh762yh/8H7yQKiiQrO51oG1MKoi6fl+kX
         aKJm8Wp8RIhIiyh/VpRRoYjmPSei7ijyd+ZmBGD4TrgYPQvPKfg7A7+j1WhRcWQ+Hjp+
         aR0Dpc39X3NeG1mRLNhME5An1OIaWuo/jwItwiCubegS12f7BIcbFgX3mYcN5iDt+rmp
         iz0Q==
X-Gm-Message-State: AOJu0YyrGf3OGTn5vTPxEWMnZBouXWT4NYyG+yQEQHTH2B8gtzmSt559
	m2ckqydW7jhKaZtt6MuNykpf5I2uR2hWoRKCpkT5ilJ31RV4EXTKt4gwQvkwKeM=
X-Gm-Gg: ASbGncvpRCnoDW2GHmFmCOHZDDCWLMLG4vG1CXZFvtgsvl3jxF9iLFaiIQjPoaszwvK
	kGcdff7loSQGFT3r3Ptnzwsf+DLTmiaeo4PVFpGWnaCp6uudI8ktxxIEH749sODKzpH6heXzAM0
	7SuGZd/Xsj8HrGBimkMb5yGvGUVQzH4NtUjgsSje/1KzI9gunNf+qs9LzOJ5Dhp4LdMAAgg38hw
	WJGZf3DLS6wgIaXABPGwTYKjL++oWXW/f9AyQW9+LBMoILPs8n5M0DCMdDJJkAqurvRzvsz
X-Google-Smtp-Source: AGHT+IFF5gVpfBOUmUazl9+O+Qp/eY4DDpdgeppZBxS/LFNrvXVCbTXqTTHO3C+XtwgPrSWhH9XBIQ==
X-Received: by 2002:a2e:b893:0:b0:302:336a:8ada with SMTP id 38308e7fff4ca-30468607f65mr55970431fa.27.1735072869982;
        Tue, 24 Dec 2024 12:41:09 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad9bbdesm17808361fa.44.2024.12.24.12.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 12:41:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] drm/msm/mdp4: fix probe deferral issues
Date: Tue, 24 Dec 2024 22:40:59 +0200
Message-Id: <173507275848.561903.12093741891942596753.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
References: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 20 Apr 2024 05:33:00 +0300, Dmitry Baryshkov wrote:
> While testing MDP4 LVDS support I noticed several issues (two are
> related to probe deferral case and last one is a c&p error in LCDC
> part). Fix those issues.
> 
> 

Applied, thanks!

[1/3] drm/msm: don't clean up priv->kms prematurely
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ebc0deda3c29
[3/3] drm/msm/mdp4: correct LCDC regulator name
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8aa337cbe7a6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

