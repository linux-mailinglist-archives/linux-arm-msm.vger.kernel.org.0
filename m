Return-Path: <linux-arm-msm+bounces-83121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5BAC82837
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 22:20:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9CCB3AE95F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 21:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E4432E736;
	Mon, 24 Nov 2025 21:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S8l7G5d4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8B332E730
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 21:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764019227; cv=none; b=OAYs9qpir51vLbmaVbLMIo7cMVx13l0RRwegFTQpN/in9UGMUUw43DgXhfUKCfMGuYvTI2VcY6MVSHUL2EldCm+wvddmY7qsyhVeuq4iJLoLhEl+p6+TWtGJSObah1z0JNWScnho+WKB6Yk59fU8ysZNY+dFe+6jLNJWSRSjktU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764019227; c=relaxed/simple;
	bh=2YFBmosG1IbwlVcJv8IGGNgceYoLIEglKEl4QUeiYy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z7ngHcj9y2qAjsbkh8H7Zwqn9wuwTI6kq/FaeF5qCm66FzQtc8/nzkKc2SBdfEyMFRBvYMctKAnv5z3cNe5QKlhTCgiGp4tzPaAHfE6TA3zNf2bKw5i57OxmhI+lRR1ysttb8gteZCKW3FEMNx1C7E6LeIZxGG8dL86LDfSyJWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S8l7G5d4; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37baf2d159bso3285521fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 13:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764019223; x=1764624023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4FyPq/kYWDGmVTcOSat1gTBwxi7ftUH1FFrkSMn8JA=;
        b=S8l7G5d4VL7CItsCNzq9v8MM+V6+ybPu3sCPOazETO8ogZdIRGmcJecjXu+BE5/qPS
         Hstn65z+inyYA4QIAm3qsSo6+tSCKMh0ke1sbw3Ti7kYNWA4QOPFhK6rZWgur8H6V4ZD
         IGa6zeXp6/AcoLO+R1urFuEfIG1v7Ho+LdyLikejNMW5v6JK9rGQNEoiTUtJPIXHxiyF
         BRRdI/kqWrvIcUb5152dKYbQ5WdCiJMb/ZuvfPgT3DPCwuJ3d9Ok2of7fQSKb7nAuR/X
         7nYHo0W8e0XKyMeFFU23hMkEqvDTFu9Y0ydEO6bpPgYLlQdJ4yiNBJINpaCvPWFv0NQG
         olXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764019223; x=1764624023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4FyPq/kYWDGmVTcOSat1gTBwxi7ftUH1FFrkSMn8JA=;
        b=MThHqO4wyYxdFQPH7izthiW/2cgt8VFAOe6mFFinUICUoFEiFunByIKaG5jJ6e81fH
         qgxswdHbgTBVUZKrRL2NvG8X03+x1e/TtduOC4s+4rwz/qQ22Sr1f9yJhWYux1LkEZof
         80cc5bEVNaEIfQlHGzLo6lWV2JJhTwOsqjcrikDEgXh+SVWrB72o7ynsbgfWmBhh0n16
         XOkGDhSKDjWcMsll1C93xs4S+VI0vRuIQLJwZsRiwRDm+Y0q4nexGm1lAscJYmN2EejV
         Lk9YaxUHXwCjzBYaeI6hZOXJ8122nMfEXzmEiC7KHrmn1NMonVMFABpVC+HR5Z/Y5YbD
         3ICA==
X-Forwarded-Encrypted: i=1; AJvYcCWfegPy31MqV7OLMTOcaSd8SohSieesqFh2G6jeB2cXnH5oWqfS+yyd45qXrzRaEe/GpO3AL7U+08mEHffe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0C6B13JJkiZLU7zBSzPlO9RnUlVy2onJz14DfjFdFmKUJZV3v
	3ouvKQT+FpBrjTquu8Y82XL1tyogONlABdAO3dN90Uy1b4CBZo4a0C5gV3kZ1XrHviI=
X-Gm-Gg: ASbGncvxPgGFYZuRy4bcTpfliQI0w5OXdJCL+jKhQpOJDSmaXiMM2lZibekqXHSOjTP
	ecsMYw7ggvFhHUaMaSG34RwM2jWp1hG4HgwJpSEZLjmkhPOK9HrATmupQeXwNKT3qz8D5ObAjmX
	JELPOyCbxujwJxBE+jvhsU9gpEhycUcfvtB61toAs6zdR4K5OtHJ34hRhksAJdLznXlPChnFdqs
	deh/ZpdxKMpGgZTm6ozuSCjjmS+b/KO2e8dyCGGB1SsKHErCEDdiSKEri9n807uuw7Wion39euV
	EYP9dC7qa4cpBhkcqkQJ1uHqOcXeAfu2xiC4gvFIYULttVNwOs8zFK6c4BB+3Ih+BdKdoOFaaom
	eUpLz25hQBesvliy+F3qEKJXC93ZyC71o1UABjVipRqFDX100VWqFKt11Lbbr3xTS4UBEfHEkyN
	mCVhgHD4Ud05Zet81x8DHruz7c1aH05QqPfGmdqEyK5m9tSx6WV9fTkW0STEwJAT3i
X-Google-Smtp-Source: AGHT+IHWeAbuBKw6C/nTuJW6nxAA8zubnC7DGnvX3LzKyVbi9xGZ9FuPTPMPAeQp7212bBUVXrqXwg==
X-Received: by 2002:a2e:8a88:0:b0:37b:991a:543e with SMTP id 38308e7fff4ca-37cd9218abcmr17247201fa.3.1764019223289;
        Mon, 24 Nov 2025 13:20:23 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b59744sm32905771fa.11.2025.11.24.13.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 13:20:22 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/2] clk: qcom: gcc-sm8x50: Use floor ops for SDCC RCGs
Date: Mon, 24 Nov 2025 23:20:10 +0200
Message-ID: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In line with commit a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops
for SDCC RCGs") done to fix issues with overclocked SD cards on SM8450
powered boards set floor clock operations for SDCC RCGs on SM8550 and
SM8650 powered boards, tested on SM8550-HDK and SM8650-HDK respectively.

This change fixes initialization of some SD cards, where the problem
is manifested by the SDHC driver:

    mmc0: Card appears overclocked; req 50000000 Hz, actual 100000000 Hz
    mmc0: error -110 whilst initialising SD card

Vladimir Zapolskiy (2):
  clk: qcom: gcc-sm8550: Use floor ops for SDCC RCGs
  clk: qcom: gcc-sm8650: Use floor ops for SDCC RCGs

 drivers/clk/qcom/gcc-sm8550.c | 4 ++--
 drivers/clk/qcom/gcc-sm8650.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.49.0


