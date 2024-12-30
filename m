Return-Path: <linux-arm-msm+bounces-43669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD15A9FE8FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 17:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F12E13A1A92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 16:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371675464E;
	Mon, 30 Dec 2024 16:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fa+pGD42"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4548F3D81
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 16:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735575347; cv=none; b=hDNpYftLdzQiptBMJOOPY1WGBrYUG5qOKCIk8mGMLPQ7sy+xF+QvCagwncYYMAuVY+4mr022JBUPbymiq5/NUVXzztFKLot4NsS/clrVHVwOi6qRTyP/+P3DiFHqn7X1rKh69yK5m6Xoj4qK0kb6AYUODtLeRkUS/2TC3bygzvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735575347; c=relaxed/simple;
	bh=AUZo9UPhi1VNuLwEysnaXtm05EMrMJP2ldvIpCC08fo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A3xP8Emq9eFP15ZV6g/6XBleVieEQCB2wVgJOijOwsdiJbdB7ewnrhBThWLqg1ju726YwkowkeNUmF376y6kIt3Pdy7rfrUjiBx2v0FfD/teK+x9fM4WXVPiyQgqDtoNMkh3ZwIZKkso07TIUmHjNXVn0Nut7XLJHePhvQbALFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fa+pGD42; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso63177975e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 08:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735575343; x=1736180143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4NeyeisMD3W02zckZ2Ty449qJqStFYvxy23pWE1RPU=;
        b=fa+pGD42lI0hMvUAK/Irls4+ZIk3WnJVQPLTwRF7v1tvcRNoZ3OS24VLRyFAVviE0q
         /gUK7dHvQdDqEXgNFSw1PgT+iepXY+jpyxFvAnXsorXvKKGUflbvHaaaKYyo3B14LZNF
         H+qG1h85R9TBOTPXaFdx0ZC5sXjYFJhlwb/cnK8dlkV/2lGDK2cx8R/17oNi76zFxoD2
         OFFEeOD3+7vMrpsoq9PjrdzmUG+tc6kz3DugL3WCsCaYuM2pPK/xQDOzO7MHxY8QGr7Q
         b3bCdOPTRMi87tNKENbopmaaIJ/tkuAXvZfcsSzDgYriszCxikUq1TtyHpjtoGZWrTOU
         XFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735575343; x=1736180143;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4NeyeisMD3W02zckZ2Ty449qJqStFYvxy23pWE1RPU=;
        b=BYn5PgAVf3qEYt8dyFpBtrYRbA7dsmUg5EctseKHamgjbJw0X3/W9VDBe5ixltOlf6
         bH3YhI/ZOHXPVBtvWebR2+g6iTD1vsL+PxLSw85GBB9c1Xtw0dQR3PHtSK/4MBbtUbpX
         2vFfSnaGprIZCmhXMWIKDYDUi2nMdSLsifgjna8H0DXNFiZ0yO7LeTm7kxsKiRiDHNpx
         ZSm80JT1AkMboRqTGH4hh2qe99smVlJ+gbuOGptth9hMdXlhHLOZ7Hss4Mvw98JZpFKa
         D2PScZQVdMkgBVSYps/tVV5p+KpPSAJViYfval1mnTl/BzbvO31+y8wvN/6lN05enWt0
         liKA==
X-Gm-Message-State: AOJu0YyNv6GK7IBAjIbQsh5r9l6RWEXGOd/QCqki/stAm1Ye47656e8f
	XB9PsU4mQ+Vu7gKRvvWPeQykql/Sm0WT50L8ewe9iB3XpvG2K1/WTJmb8hfscc4=
X-Gm-Gg: ASbGncvfrAXn1DKH8quC/mOgGKG6V6Jaa7YXcCK/yDWinR35bbOi3rwtvDoR0Ub+jYc
	kdDfqt8MmoWvC7zXlWe92YJC7N3pBNenx+KpYVyVHcoEunGREPrkkBxGE3KomgxYrAoCpo+/Bke
	tK3nRA4zLC5Lg8kBMkFuaR6QGhaTHDeAPq+f11WcorS3tjfa1+qYqICRldQ40V8vWrZWCdSUMRr
	WArtbPNef7zQOS5i8PNhReVpJl+B0azy5Q3qQSq9F2xa4luNTXjLHoo6+vr3gzgK++J4z0JAcE=
X-Google-Smtp-Source: AGHT+IFu+L2NamaQNW9mq91S67gze/Z3mzA8R5zCSKKLA+/3EBlQtuDSLav2wBYeMZN2QhWb0JYbAQ==
X-Received: by 2002:a05:600c:468f:b0:434:f871:1b97 with SMTP id 5b1f17b1804b1-43668b78677mr243226485e9.33.1735575343520;
        Mon, 30 Dec 2024 08:15:43 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b1f6sm398469025e9.31.2024.12.30.08.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 08:15:43 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-arm-msm@vger.kernel.org, Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
 dri-devel@lists.freedesktop.org, arnd@arndb.de
In-Reply-To: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
References: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
Subject: Re: [PATCH v1 0/2] Add missing fixes in fastrpc_get_args
Message-Id: <173557534277.273714.16861047953843054499.b4-ty@linaro.org>
Date: Mon, 30 Dec 2024 16:15:42 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Wed, 18 Dec 2024 15:54:27 +0530, Ekansh Gupta wrote:
> This patch series adds the listed bug fixes that have been missing
> in upstream fastRPC driver:
> - Page address for registered buffer(with fd) is not calculated
>   properly.
> - Page size calculation for non-registered buffer(copy buffer) is
>   incorrect.
> 
> [...]

Applied, thanks!

[1/2] misc: fastrpc: Fix registered buffer page address
      commit: fa22a9743aece593fe9f1e0a0d6189a777d67e38
[2/2] misc: fastrpc: Fix copy buffer page size
      commit: 58570026c7ac249bfbd90f9fcb7d2e0a74a106a1

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


