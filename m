Return-Path: <linux-arm-msm+bounces-54643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D72A91EA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 15:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD3248A0E67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 13:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D7923F427;
	Thu, 17 Apr 2025 13:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mL/W646P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6DD2139DC;
	Thu, 17 Apr 2025 13:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744897771; cv=none; b=J+0Nqq7TgXQwIl2QRPBM/Uc04GA/siBBAcfLNS5fACHJs4ve4ReBZKTfDee9g4IGoNapyffzxTEQJHCYA6pVmHoY7x1Fi7n2uhUi7mj/4A54X1qETGhP2mi8pPzqFwFKPcX4sjiS9gFF4CDQ1O0qE7ljAgKX2VTYqVxRqBX/aNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744897771; c=relaxed/simple;
	bh=tD9L2G1q3AXctDlXfheyo3hs4eKzbFyfJj4WF7/6ZRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QIVCpUNeWAPHwnbyMRgflf7j8YvX3tVh/UFLEWsuwFkiOGvtrLdlXkNcX1XZGoosXhBLTxLVwAk1jUPv8kAHV2MGgWNJMpMqfCkHRiz3OUVVDo559lIOnxLsrETP4RcBkkapaGs6M+X/GveaHe/h3h0T2SzgkCb5U86n32AhuuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mL/W646P; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39bf44be22fso565227f8f.0;
        Thu, 17 Apr 2025 06:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744897768; x=1745502568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OU1hhnHteDFAeBeMeJP9LfU6C0OSCqIF4e8ockEnxA=;
        b=mL/W646PujrQ+ftw3Lk+vU/FDrcdonV1TvdE2uYXKFUl8ja6tGJOuAyzADpVvjeot6
         38zPGiRA1MiEoNjc4gkL5YW5swJbaG3/HYFWohyp8H1/15YJFBGEZufktclqAqMtcgjg
         SJXntGI9GUaSBdiYaHIj00+CdgyrJZ21Bwtm3yfcTDXocDex9m/rx/BZHcm2yk+YjcOp
         FUNukOKbqjP6yfI8VDZsDtREG4GvFGJ4xiK5LpDfjOcmfPmcAy/ODkjnENmlKCYQ8mj9
         xexUZpoV4ePW4lHVL+z92Gz+AuRXxZ7+zyy8+ETJgmhCdnTe/rvvPisGcmav7gYsErmh
         u1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744897768; x=1745502568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OU1hhnHteDFAeBeMeJP9LfU6C0OSCqIF4e8ockEnxA=;
        b=D/INSlrokBvt7oXPpv2VyiCi54p8MV0F4ITTZ4N00cLeTJe/P0JUz31sY5gdgGEJmb
         y4FZ0CzAvREBCQLw8HCIa1MftxJSNpp2Tev6JxqD1moQqLA8TPdLYxU+BzBh/zu0W1zQ
         iUzuqgYw8T/YQ5VSexqtJDdVFKc11Df5Egk4zHv2BApQE+Ae47XvyLIw3cLM1Qj7FQWv
         zGxa+VAfFKkkMLOisIePegWR5x3T+xtNzKHyWAXH9OPpFtYSRrIgHxN26CYxo1/VYo/M
         hBct29SESVGQigD4k+dbkEC9cxzbiT1PBjHsdpzAKqF37i323PlBYvez45imsNHBh4CU
         ybag==
X-Forwarded-Encrypted: i=1; AJvYcCUTkLtyPKjzWSbvUSzLxfesFrTmQ9inQsEGaXeyMMM2LWK3qFJPR4fq4VNaelF1mFxIpBXCG+SwyHntjnvxtA==@vger.kernel.org, AJvYcCVVrvdWF0uYavkR6OR44IP/bcp0QzUULbsqOH5BLSIwhvKMy6M6EIe71zGRKHtUsLA8eU98cizu8nBc@vger.kernel.org, AJvYcCX0eHrHQ3NOxuft9WYIUFaYl8ZFofx1vw0bfX1y2x9OatI4kuH23iSTulzesEwy5XVhwCbJfR4Tz6v6CPls@vger.kernel.org
X-Gm-Message-State: AOJu0Yx25NN2LUAkGvud7KYGLwYoGMR18frXTvGfrkzc5rSKTGfzeHxz
	tg0dZpEmNqc3aWO79dBoMj+OPwgxBC/7YOzykorbQpRxy/6wIJ8A3bGqRoYcUaI=
X-Gm-Gg: ASbGncvs7IzQMhhWjFLyeBBOtPaBLHEtWHQ1AxRYVnFlBbPyhMdDtaTwrvB4iUs8MHq
	4A11Rb7gA25Iau6wGN+URBSly84qfzr784DoBYV7s5xlQfe7X0jdwqCFVLmTKeiupbEWmbBsKje
	+Xvji31ORnV4mUkG4kPNi8OkR6nPvXuhQ4HEYqErpZ3Xfm2K3aWJ8bz3IM8oomzHMejLwXhp4Xg
	5WSXwrN6rIkfjHpVMasdGH73uei9DvsHwJy+5ELatu5lzILMUOlSrtJnNbrACbn65ohxg4Dnzmn
	9wPKInYe2bQMmXA19IECFuoZyQuD9gDhggG0Ylz9nmZuZ69xF6p32QWJxENLOwvb7J1MGBzhv8I
	RgATZTHNtL9deVOFDkGviqYSpdX/LJA==
X-Google-Smtp-Source: AGHT+IE1l5TinZk3fw4rYI45LCNcZIGxU9HSxkRZB7cKZEKqJ/ObrWseU30Wz4dbH9zqcAsfcTw8Wg==
X-Received: by 2002:a5d:6d8b:0:b0:39e:e499:3efd with SMTP id ffacd0b85a97d-39ee5b89d9amr4871098f8f.42.1744897768222;
        Thu, 17 Apr 2025 06:49:28 -0700 (PDT)
Received: from localhost.localdomain (62.13-121-193.fia-dyn.isp.proximus.be. [193.121.13.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b5a94c5sm54097365e9.34.2025.04.17.06.49.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 06:49:27 -0700 (PDT)
From: Jos Dehaes <jos.dehaes@gmail.com>
To: devnull+jens.glathe.oldschoolsolutions.biz@kernel.org
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jens.glathe@oldschoolsolutions.biz,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	Jos Dehaes <jos.dehaes@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add retimers, dp altmode support
Date: Thu, 17 Apr 2025 15:49:21 +0200
Message-ID: <20250417134921.45329-1-jos.dehaes@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417-slim7x-retimer-v1-1-5813a7835903@oldschoolsolutions.biz>
References: <20250417-slim7x-retimer-v1-1-5813a7835903@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> comparing with CRD and other dts for a more complete support of the 7X
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
> This patch adds the required nodes to support DP Altmode on all three type-c
> ports. The definition is derived from the CRD. Since they are all marked 40Gbps,
> I assume there are 3 PS8830 retimers. 
> This modification is now for ~8 weeks in my tree with little to no complaints. I 
> don't have access to a Yoga Slim 7X, however many people on #aarch64-laptops do 
> and some are using this patch.
> ---

Tested-by: Jos Dehaes <jos.dehaes@gmail.com>

Tested on yoga slim 7x with a USB C cable to Iiyama screen@1440p. Was able to extend the screen on GNOME desktop. 

