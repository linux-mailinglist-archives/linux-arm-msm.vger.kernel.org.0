Return-Path: <linux-arm-msm+bounces-35237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BC89A67E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 14:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BBC21F226F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2481F6698;
	Mon, 21 Oct 2024 12:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yjT/4fsW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136D61F4727
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729513071; cv=none; b=CjPvkI8poXP4g/gHuPwk4V8PCeFLjhs+MPASmJfxcUrHCBLvMAogJBgJxcoi6Gm7Ml04hSy9d/mEU9kflCAhAP1esg3pnpa4Cpmn+FYnO+42yf2tb3egKyLCuK/HdZPLNxMDl3PFOZappMwg0xeXQmaOl4Q29G0R2cJvCIDDgXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729513071; c=relaxed/simple;
	bh=9JaJDa5MyPviy31aGKVHAgL1SbZdM09T8uuMJO3H9dE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JjNeFcmj8us7XRVQANSwPxUBy23AqMOU9sNLA069YSBvwlKD4SsOPIGg6+u7b08aL80nCVAmKrL8ZuwUWb9YLhppIZlU012IHOSIr7BTv6CkHVNUCPFPOjPPanfx1CsoCaijNFN2k6ItDp1oTUly+lXT5Lp8G4n3LrSUqcGaRjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yjT/4fsW; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso67340471fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 05:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729513067; x=1730117867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/lwrPsOwBrb5oh/mkFzBAjwdyTSBus1TJM49Q2CS5Q=;
        b=yjT/4fsWV0T8jG4y4jk0A7OJd56cffPXz9tUL/vh0Qv6KIp15GEWEyNGiXqHzaUV6y
         7TmbQw703KTTpUoPTIsztOh7dTXZLdupQJnG0wURc7HEmu0oK9CIaLFAkakrJLv0GX5X
         wuvdEZKrLijsS17WNIrstbCWvgaxiaRQ1XX91/3BIlGG7BGDq7LS1XEWBv2TrOlpYqLX
         0HDL16hIurbTO3zISqVwFNrcWKbMUF1z/UnxoFDSH3HwT3o/l3NSTKz0+k5Bmps8PcOu
         q7hDK9OXsqjG/mUfJinNr97t5+sNR1pN1rfB57uDHQhenUmS8sZ4X5CwQu0enPlN8/o2
         X3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729513067; x=1730117867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/lwrPsOwBrb5oh/mkFzBAjwdyTSBus1TJM49Q2CS5Q=;
        b=GNO1gMCSzo/CKJqSScRnuGxOLV1z3AQUmARPSc0TDtop9jgZrOuhJpqGUi8z89N2jH
         ldSiczKQdV4PkrDzdbWONzr/L3Q81a/qWd8TGS/zbU4W7nmBaPBDJv8WCXvzESI3zO2m
         wm7mTf0wBo8om24YtxB+fFE209RJcO1oqiK7taZoEP1BdzFdHsxX0DauoEKtr1rZ37Qo
         sI8H+KF6RRQsvzevSIcnZ2TF9f+5khWtyG7RR3XwiJ1EcLvdXeHwt5AUPurIehDtRDXi
         sNEOlNgEAm41cp9c0uUcCAk5g7FRCVYawo5LYrWUKW/ND1Nku9mBF6J4FiMp7jm1mauP
         r9JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZfI0Atvh6Cp2BdjLKaj2nRodP1VUFuXmjE6h60ZFBQQSdEwSAFaYBdGHDAdl3LqaCEctWuI52HuqG4MiJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwkWAqVyf3eZPUXBV5EWzIrvD2JCTK6Vh7qwTSt72KKclwwPgic
	G8rS/7k4f31Z6VDqFT+hZ6XuksKwqJYnxDdpouvOzVV4QuJKW8eEV32ExP74KwY=
X-Google-Smtp-Source: AGHT+IEP6mcffhGZSX7EvL34NQS3DEgeiHeuK3RZgNWRLKAjBPSyrv8ab7zBjb68JmV7/I2QOU28cg==
X-Received: by 2002:a05:6512:b11:b0:539:8a50:6ee8 with SMTP id 2adb3069b0e04-53a154da8c4mr8581550e87.57.1729513067076;
        Mon, 21 Oct 2024 05:17:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:17:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/msm8998: make const arrays ratio_list and band_list static
Date: Mon, 21 Oct 2024 15:17:37 +0300
Message-Id: <172950935861.2053501.4420742606956398087.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240912151037.592477-1-colin.i.king@gmail.com>
References: <20240912151037.592477-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 12 Sep 2024 16:10:37 +0100, Colin Ian King wrote:
> Don't populate the const read-only arrays ratio_list and band_list on the
> stack at run time, instead make them static.
> 
> 

Applied, thanks!

[1/1] drm/msm8998: make const arrays ratio_list and band_list static
      https://gitlab.freedesktop.org/lumag/msm/-/commit/71f40d32fa4b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

