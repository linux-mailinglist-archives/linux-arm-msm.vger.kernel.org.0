Return-Path: <linux-arm-msm+bounces-43279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EA29FC24D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 21:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C58F0164A7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 20:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD0A21325B;
	Tue, 24 Dec 2024 20:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rc7Uv1M6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A012721324C
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 20:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735072878; cv=none; b=I97O4L1erKMDJoRIZ6Tjvg7I6iKBfEV3Xib3nFw163J3jQuhF8jWJLzFY8G3Aw2GHZLr5dbzjO/Zt+/UTdHvYSZ5QkXKOZTNMwSoOSyOp5MrNCQUJg8oEVvwY3Zia8CdXS05tVPzUQnEoElOaZspdW2jSqB+oj/Ic7t5QJ2VRRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735072878; c=relaxed/simple;
	bh=YC4coFNyGi9nHctHoNDs0rCk2xmTRRp5jg0E+QVGM20=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oJOgiyKJtjd3rLeZ1CbUuNHq7ewgY1aR2G7ySXDbt/7tELSjp6LTCFegeDoaYXwgNmUtka15bXgicxuePIdGYctrEGygol2lDa8PuneN3/IFzV5Xu9ka927QTGuRmk3IvsKXyV4hdSuu/06rA6EeV4oyjuZTw7EAND0DN+0FM6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rc7Uv1M6; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3047818ac17so29770731fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 12:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735072875; x=1735677675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4tWENes0KylDXpgmRg5/jOA7aphz2fds2f1aAKkLl0=;
        b=rc7Uv1M6VmR3Vkrf8cdEEwApFEi/RtStPs7Tm0AOEw4BW+WTE+fZ7oPN0W28X3k/cT
         spjccala8T5xi7pvuF25Eru4cl4831Om/b97qqvsJDOxeNVnzysozs93VNJowE/hZS5k
         FoZgGo7PmxZifDlybwbiGKjHlRTO80lMy0IPzBu/OLAfGMSvTGFVzokeLDmYqna3B1gJ
         StDNyzmL2yZzuEKs8O4SYATFIRzBrdo8yFJseZebXNFFm1Aj8MIZtCQ0qAh7/xZ+t+SW
         zFog45dtUw998CdcynxXm83rnS6t4kBNgj3i3LQImr+w5Mb8agGrL8Vx6xPx2FwCrCYg
         zldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735072875; x=1735677675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4tWENes0KylDXpgmRg5/jOA7aphz2fds2f1aAKkLl0=;
        b=lcRWzTi+M4yhK8G/XIDE1o/2Uf0lJuZpMN1pKtpwtw5Fj2oW4A2Cy/37yDcLAS9xMr
         TnZvsKC02B6Zp3hpo5S0jqyf9yibehNRswdtWhxGMuAm9KK5dYUp1BPgL5eB4tHpAIwK
         RibR7SodAlq6FtCDBqqlg45CgQaM6CnCEIVdHVlUhjG+lJSrEdd6Pl++f74Zjtfq/EFf
         A/gqfwZZwa6ZtKjLA/8uSfzWl8kAy558WIBjZCLS+ezGLRXMsBU04uS3c81CAUUH7d3M
         RKc8nyaSDqBQunUYYgKQD/SR4zr9IEP8OVqFTNbMsnH4j7u+6ZE61jdDNvFWvynTTqCi
         XSCw==
X-Forwarded-Encrypted: i=1; AJvYcCUec+03JEE5fk/l2GaHkbsZNohVNBa5vX2vnBMJNLNesTjXRobvECCAKu/1+a3mX0vCqetutap/y54V73J3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjh2XqlLP8O60IjlRfZyYcPG6MovvxsLEw9IHCbsjcZcLPf/TU
	q08r48UDm1CH/XmamXtX/BPM5QZNDzwF7at3gKsaN5k1mTd5ubgFj+ku8gsXFJ8=
X-Gm-Gg: ASbGncvxVK0/go8XUTelXkNe/zkLxW8L/VRU8E1P3kCzmTdVbX3pTaxD3Mp5zGae1zl
	HH3lhrJk3u9zOFTaiCBFxYmWubMubBnYGjnodllHMEp/8xk9tpNd3B9dvBhz3X81+WnOE/5Js6P
	IDFWjLVmoo13SOD5SkKuPWHvKB5RXeYPdfcfKSjUEtyTJc0Ht4Gu8mkFaLeFLYHh9HJT62EMkJo
	OFhVfggue7C7CxP/p9UicFJoEridGrXQB412+moYzBD9rgcCZ5xZRK1Ebl7VeaX4/jExHUg
X-Google-Smtp-Source: AGHT+IHhxMcz5LHKf4mzblqpQkrsMBpik6mK2OqeNWh9Gv38C8o0kVzMu1K4zlNWLn6efCKGHqg6Jg==
X-Received: by 2002:a05:651c:b14:b0:302:4147:178d with SMTP id 38308e7fff4ca-304685c1ad4mr72800031fa.28.1735072874813;
        Tue, 24 Dec 2024 12:41:14 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad9bbdesm17808361fa.44.2024.12.24.12.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 12:41:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Paloma Arellano <quic_parellan@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/16] drm/msm/dp: perform misc cleanups
Date: Tue, 24 Dec 2024 22:41:01 +0200
Message-Id: <173507275854.561903.1008800091022451905.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 16 Dec 2024 00:44:05 +0200, Dmitry Baryshkov wrote:
> - Fix register programming in the dp_audio module
> - Rework most of the register programming functions to be local to the
>   calling module rather than accessing everything through huge
>   dp_catalog monster.
> 
> 

Applied, thanks!

[01/16] drm/msm/dp: drop msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ba3627bf82c1
[02/16] drm/msm/dp: use msm_dp_utils_pack_sdp_header() for audio packets
        https://gitlab.freedesktop.org/lumag/msm/-/commit/486de5eec0d8
[03/16] drm/msm/dp: drop obsolete audio headers access through catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c0caebf37960
[04/16] drm/msm/dp: drop struct msm_dp_panel_in
        https://gitlab.freedesktop.org/lumag/msm/-/commit/429783c22fe9
[05/16] drm/msm/dp: stop passing panel to msm_dp_audio_get()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c9261bcc1546

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

