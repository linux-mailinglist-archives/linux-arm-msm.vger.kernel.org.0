Return-Path: <linux-arm-msm+bounces-24116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAB4916B46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 16:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA9691F29056
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 14:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9054F16FF3F;
	Tue, 25 Jun 2024 14:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iA4XtQI2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C5616E863
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 14:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719327404; cv=none; b=FOBrl2pIhTSYVPtg25aBKf5J+tNBPjSG++EEhGv13MJZEoOztH9djAV6WoWy9pJPCz/50bTC9WSeLard8zc08wmdy3LGNcALjezBNdC6WWQFRaicxRG5lwImqnQ/Oh3pC4ZsmfQOGqGCcKBGybY1v3Jo/L2ULSEOdF+fCz5aS4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719327404; c=relaxed/simple;
	bh=eHvPedc4wXf1HF6GzoGCS3vsxuSxT11yBWsZtE4uh+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T9vnCPm4d7ymCk9QGj7KgSA+NHvex3jdl5VXU22w+19AnvHT1L1riJ+v6TmlwV8W0KvkIWoAJGK33ej6CsriW3OJhdujh3qZ7Kkaorj0c2j/BFupLfpXKVOg4+wUbpyUtnFjruX06PIG3rT+WsPybSL+aEnxQ7HIgplCStJUi98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iA4XtQI2; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52cc671f170so5651725e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719327401; x=1719932201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uy311MtfEgGTpcpC73Q+KNbvwGn0qsgeTmIktNcXCxg=;
        b=iA4XtQI2IzCKZY0hV0ds1yACg/iyEP9mUXyyQafhyO37V6ZBpQmoDt1NJbadxs+4MZ
         auKUMckOdJw651JQgLe5lUdJZtgiJe9KpXiVLitOAXeGwjU2fwF+jEvyC5FqYcF9Jeok
         niu/jUKB/V+BRCRQzVMIRxA2rUrvd0AtCik5NIUgzjSyB5WFEbki3nlhcBPbDk4QS7/Z
         fKzgbe0+HeIbMcyEBqc2oot7htvcjW9f+yyww7YdDmjF8riZvYWtc0oHbnVuRTZKiRgg
         1Sfu5r4+DU7jFSA9pmt0nLM9Q1/gABxn9DG1K4/zqeQoOTKEY1hCGEI7Co11gAG/1OCX
         N9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327401; x=1719932201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uy311MtfEgGTpcpC73Q+KNbvwGn0qsgeTmIktNcXCxg=;
        b=UkaNYaEiZfyXJl83XK20ilA0UQVSkdrjK+f5mUw+pg0YzHhC6ApfVo05T4ciNNccQq
         +FdnWnS+MG8Q3szF8hqaQs09MFgzD4whpVsi7z6LYcPe9Am/bJsuw5i7vcXJwEOKrb5q
         PNhdEd0PMDo/vXumNREQyMMgr81ERXeju191forJfi5RUigaMkdqalJMEMHD0VlbmkFq
         wIKfJNcrzdoo0GYITT54RGRKb6oQWdMHYTjqT4mmkd/DTKUSxjhoeD5tWXCSXEmXg3Wf
         IvZi9XHy9LWJx0Tng9PwyBMeI8nksufG0Bs3zfpCvM3l0IUYA6wGeuJ4+0nTxS80Aj4u
         griQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRT1zCiYMTBLvc8kkCKtxnN6nlpo6+t7ryus2fSFo3xWPwPk7bbv0VSl2wWhye3o2A7R7bKQkuJmtIwBmm9e2xeFUAcm1r09mT7Qj0VQ==
X-Gm-Message-State: AOJu0YxA3zB1jg1IBG5WfgntHhAfvxVAMzTG/tITsrOh2iYoZrPex1Be
	4esu3NfeTvbU/Q7PZEmextLWi6zTNkkjhjzybyEvfH3aUXXMtZb0qXKQ2FSW5cQ=
X-Google-Smtp-Source: AGHT+IGWSJ98xqTwdcAivnfx2Wmxx9wwkmjEWPIjZM3yst3js43OpqE9GybEuzYV29mv3KYo82eBaA==
X-Received: by 2002:a19:8c58:0:b0:52c:aec9:790a with SMTP id 2adb3069b0e04-52cfd46b51cmr128113e87.7.1719327401071;
        Tue, 25 Jun 2024 07:56:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd641f655sm1257321e87.162.2024.06.25.07.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:56:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Sireesh Kodali <sireeshkodali1@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/mdp5: Remove MDP_CAP_SRC_SPLIT from msm8x53_config
Date: Tue, 25 Jun 2024 17:56:38 +0300
Message-Id: <171932736813.1437673.16795984015504704928.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240624-msm8953-mdp-fix-v1-1-be4d3262ebe3@gmail.com>
References: <20240624-msm8953-mdp-fix-v1-1-be4d3262ebe3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Jun 2024 00:26:01 +0200, Barnabás Czémán wrote:
> Remove MDP_CAP_SRC_SPLIT from msm8x53_config because
> it is not referenced in downstream.
> 
> 

Applied, thanks!

[1/1] drm/msm/mdp5: Remove MDP_CAP_SRC_SPLIT from msm8x53_config
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a3a6b350eb6c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

