Return-Path: <linux-arm-msm+bounces-23743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E7991389D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 09:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2008282206
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 07:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DB512C482;
	Sun, 23 Jun 2024 07:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jdn5NePZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46330745E2
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 07:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719126860; cv=none; b=TJyiySH5RK3KrDZ1g5srNxsvPCHghBelNVqsBeMaIdAHmpN6nu20CR2r//PmRGQFnfCVI664zldK1IXI24q0WyVF1UfKG2odgihVZIm7skXLr0vf3mZRD7GmQ2RCYXf0tqhUb7zLiz9BreGao1cNOWhxJMIUQ4SJRkqALKYU23o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719126860; c=relaxed/simple;
	bh=L/kHiAECnxDo3RtlRAeo49B7J3QZDIm6s2oXAuRqGkM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fufmkjoIKstDTtQjohhiRxiRrYP9ndKDITlM55Cf/ww1TUODYLNi6xuDkkicRf/iZy+3PAh6Kr8wURfcdVBkuA+Ct7jUz3Op1bRaJUdrNwmgdDVHBhB7MPVF1gFkcP3c/L3p3VPSvAP4CFwLa7yFwJVjnj4KZYfm53ENI839uiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jdn5NePZ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ec1620a956so38539391fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 00:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719126857; x=1719731657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioH4meZfE3J0aKheUaFtsWw5CxwMG+4ACECKaInyeus=;
        b=jdn5NePZFulkXFxCVTZHDwP4xL8qmsnW0tjRe7KtZt99v8/fmkZ57DxNqD8VlQQqdn
         dIgq0NaRw7HItdkFc+uywmmOxin2ZSuVA2XTGOSVTS/eCb/CvQw56KYj2QBLFyZ45Rmc
         vwVZ2j/9OGRXA7Wue7bRjrW6RrRoXyXwVLGip1V9sgJl8MFybd6rf9TXec7tCnPjErRN
         C7RnOkDpuHSzP/2s1LRSRJOJULDxoS7eenKsaeaGYDjD5mfAMs2k2VlTPDmmrWBSqr+D
         J+i7phqlc2fwjfJeTJhdbTfM9ULHtLcdgsvUQz3dFpNdOdKAqizcTYM3RCAJ53f3RBB6
         lT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719126857; x=1719731657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioH4meZfE3J0aKheUaFtsWw5CxwMG+4ACECKaInyeus=;
        b=Vqzmwxc2wouR63Wk0du2qAGJyNejwHqBL9i2jD9Db6ypoF/6Hn66XMGdYGdlOllT0s
         gDhIJuE464IkBH9OFd+8fdY5RgR7bNnDw5ZonaZg+awbbyMUIoIDcxMJFFDfaJQyce6y
         p3mzMDKfyv6w/9i65ZCgCspWDfyRbE2s3/uQYBRkq5WuuJzFoKQz7BvciDhsLYQGlKZG
         K4vK7jZ5Y9x4gZHFK5hMSBLgCbqO0o8y/Pkb3wIbRzOEpH7fjpk7TTvOyZVgnRsFtEOs
         nZhMjiBo/e59BYCNEYipKoZZO0F9ojN2FM8n3rGFo9tDBEM6J7K5B8tHLx/k44PZtvYg
         +CsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXVFRpznF2yVNpkHoU8f9/ou7Ph2uqOHiSjdY5y168k47lhkqTxlMMju3lXKu7Pd2fffQwG05WnJMbSLV6Xdf8syrNRt/UyZiLL8bLpQ==
X-Gm-Message-State: AOJu0YxQxGBDWtn6I8MwfTS/BWxM1nKDzgVHp82y92HAE9X0q6arePRG
	gKNmzvcfN8dQ+PAs3qGVkVtrl0kJ0XKfTIowgOuxPfvZV3UrXl27cMhvplvtByA=
X-Google-Smtp-Source: AGHT+IGMCFummccQ65js7i8Tyhq7c7d4P8AFkM0I/x+JPP2dWKhThzCfyL7cKG7s1TsbWGSSuOl3uA==
X-Received: by 2002:a2e:9c90:0:b0:2ec:5518:9541 with SMTP id 38308e7fff4ca-2ec5b318018mr8720431fa.4.1719126857567;
        Sun, 23 Jun 2024 00:14:17 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec5b031208sm1886861fa.26.2024.06.23.00.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 00:14:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org,
	quic_jesszhan@quicinc.com,
	dan.carpenter@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dpu: drop validity checks for clear_pending_flush() ctl op
Date: Sun, 23 Jun 2024 10:14:10 +0300
Message-Id: <171912674296.840248.10530875454580478310.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240620201731.3694593-1-quic_abhinavk@quicinc.com>
References: <20240620201731.3694593-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 20 Jun 2024 13:17:30 -0700, Abhinav Kumar wrote:
> clear_pending_flush() ctl op is always assigned irrespective of the DPU
> hardware revision. Hence there is no needed to check whether the op has
> been assigned before calling it.
> 
> Drop the checks across the driver for clear_pending_flush() and also
> update its documentation that it is always expected to be assigned.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: drop validity checks for clear_pending_flush() ctl op
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3d68e3dedd4b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

